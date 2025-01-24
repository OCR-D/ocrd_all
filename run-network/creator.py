import re
import subprocess
import time
from collections import Counter
from dataclasses import dataclass, field
from os import chdir, environ
from os.path import dirname
from pathlib import Path
from typing import Any, Dict, ForwardRef, List, Optional, Type

import click
import requests
import yaml


@click.group()
def cli():
    """A simple CLI program"""
    pass


@cli.command("create-docker")
@click.argument("config_path")
def create_docker_cli(config_path: str):
    """Creates a docker-compose file"""
    config: Config = Config.from_file(config_path)
    create_docker_compose(config)


@cli.command("create-env")
@click.argument("config_path")
def create_env_cli(config_path: str):
    """Creates .env for docker-compose"""
    config: Config = Config.from_file(config_path)
    create_env(config.environment, config.dest_env)


@cli.command()
@click.argument("config_path")
def start(config_path):
    """Start docker-compose in base_dir"""
    config: Config = Config.from_file(config_path)
    dest = Path(config.dest)
    chdir(dest.parent)
    environ["PWD"] = str(dest.parent)
    command = ["docker-compose", "-f", f"{dest.name}", "up", "-d"]
    subprocess.run(command)
    wait_for_startup(f"http://localhost:{config.environment.ocrd_ps_port}")


# @cli.command()
# @click.argument("config_path")
# def test_config(config_path):
#     """Validate the configuration file.
#
#     This needs external dependency jsonschema"""
#     from jsonschema import validate
#     config_path = Path(config_path)
#     schema_path = Path("creator_schema.yaml")
#     if not config_path.exists():
#         print("config file not found")
#         exit(1)
#     assert schema_path.exists()
#
#     with open(schema_path, "r") as fin:
#         schema = yaml.safe_load(fin)
#
#     with open(config_path, "r") as fin:
#         instance = yaml.safe_load(fin)
#     validate(instance, schema)


def create_docker_compose(config: Type[ForwardRef("Config")]):
    """Create docker-compose file from config-object

    The parts of the docker-compose are defined in the config-object. Basically there is a template
    string for all needed services. These templates are configurable and parts of it are set via
    info specified in the config file
    """
    with open(config.dest, "w") as fout:

        if config.environment.mtu:
            fout.write(config.network_template)
            fout.write("\n")
        fout.write("services:")
        ps_template = re.sub(
            r"{{[\s]*image[\s]*}}",
            config.processing_server_image,
            config.processing_server_template,
        )
        fout.write(ps_template)
        fout.write(config.mongodb_template)
        fout.write(config.rabbitmq_template)
        fout.write(create_workers(config))


def create_workers(config: Type[ForwardRef("Config")]):
    """Create service definition of docker-compose for needed processors

    This function reads the processor-template and replaces placeholders with info from the
    config-object
    """
    res = ""
    services_counter = Counter()
    for p in config.processors:
        service_name = p.name
        services_counter[service_name] += 1
        if services_counter[service_name] > 1:
            service_name = f"{service_name}{services_counter[service_name]}"

        proc_str = re.sub(r"{{[\s]*service_name[\s]*}}", service_name, config.proc_template)
        proc_str = re.sub(r"{{[\s]*processor_name[\s]*}}", p.name, proc_str)
        proc_str = re.sub(r"{{[\s]*image[\s]*}}", p.image, proc_str)

        depends_on_str = ""
        for depends_on in p.depends_on:
            depends_on_str += "\n"
            depends_on_str += f"      - {depends_on}"
        proc_str = re.sub(r"{{[\s]*depends_on[\s]*}}", f"{depends_on_str}", proc_str)

        # add volume mounts for some containers
        for vol in p.volumes:
            proc_str = re.sub(
                r"    volumes:",
                f'    volumes:\n      - "{vol}"',
                proc_str,
            )

        for env in p.environment:
            proc_str = re.sub(
                r"    environment:",
                f"    environment:\n      - {env}",
                proc_str,
            )

        res += proc_str
    return res


def create_env(env: Type[ForwardRef("Environment")], dest: str):
    """Create .env file to configure docker-compose

    Info is read from the config-object and written to the env file
    """
    lines = []
    if env.mtu:
        lines.append(f"OCRD_PS_MTU={env.mtu}")
    if env.ocrd_ps_port:
        lines.append(f"OCRD_PS_PORT={env.ocrd_ps_port}")
    if env.mongodb_user:
        lines.append(f"MONGODB_USER={env.mongodb_user}")
    if env.mongodb_pass:
        lines.append(f"MONGODB_PASS={env.mongodb_pass}")
    if env.mongodb_url:
        lines.append(f"MONGODB_URL={env.mongodb_url}")
    if env.rabbitmq_user:
        lines.append(f"RABBITMQ_USER={env.rabbitmq_user}")
    if env.rabbitmq_pass:
        lines.append(f"RABBITMQ_PASS={env.rabbitmq_pass}")
    if env.rabbitmq_url:
        lines.append(f"RABBITMQ_URL={env.rabbitmq_url}")
    if env.user_id:
        lines.append(f"USER_ID={env.user_id}")
    if env.group_id:
        lines.append(f"GROUP_ID={env.group_id}")
    if env.data_dir_host:
        lines.append(f"DATA_DIR_HOST={env.data_dir_host}")
    if env.internal_callback_url:
        lines.append(f"INTERNAL_CALLBACK_URL={env.internal_callback_url}")
    if env.run_network_dir:
        lines.append(f"RUN_NETWORK_DIR={env.run_network_dir}")

    with open(dest, "w+") as fout:
        fout.write("\n".join(lines))


def wait_for_startup(processing_server_url: str):
    """Wait for completed startup of all docker-compose services

    After the startup the containers need some time to be usable. This function ensures their
    availability
    """
    counter = 0
    while True:
        try:
            response = requests.get(processing_server_url)
            response.raise_for_status()
            break
        except requests.exceptions.ConnectionError:
            time.sleep(1)
            counter += 1
            if counter > 30:
                raise Exception("processing-server startup failed") from None
        except requests.HTTPError:
            # unexpected error
            exit(1)


NETWORK_TEMPLATE = """
networks:
  default:
    driver: bridge
    driver_opts:
      com.docker.network.driver.mtu: ${OCRD_PS_MTU}
"""

PROC_TEMPLATE = """
  {{ service_name }}:
    image: {{ image }}
    container_name: {{ service_name }}
    command: {{ processor_name}} worker --database $MONGODB_URL --queue $RABBITMQ_URL
    depends_on: {{ depends_on }}
    user: "${USER_ID}:${GROUP_ID}"
    volumes:
      - "${DATA_DIR_HOST}:/data"
    environment:
      - OCRD_NETWORK_LOGS_ROOT_DIR=${LOGS_DIR:-/data/logs}
"""

PROCESSING_SERVER_TEMPLATE = """
  ocrd-processing-server:
    container_name: ocrd-processing-server
    image: {{ image }}
    environment:
      - MONGODB_USER=${MONGODB_USER:-admin}
      - MONGODB_PASS=${MONGODB_PASS:-admin}
      - RABBITMQ_USER=${RABBITMQ_USER:-admin}
      - RABBITMQ_PASS=${RABBITMQ_PASS:-admin}
      - OCRD_NETWORK_SOCKETS_ROOT_DIR=${SOCKETS_DIR:-/data/sockets}
      - OCRD_NETWORK_LOGS_ROOT_DIR=${LOGS_DIR:-/data/logs}
    command: |
      /bin/bash -c "echo -e \\"
        internal_callback_url: ${INTERNAL_CALLBACK_URL}
        use_tcp_mets: true
        process_queue:
          address: ocrd-rabbitmq
          port: 5672
          skip_deployment: true
          credentials:
            username: ${RABBITMQ_USER}
            password: ${RABBITMQ_PASS}
        database:
          address: ocrd-mongodb
          port: 27017
          skip_deployment: true
          credentials:
            username: ${MONGODB_USER}
            password: ${MONGODB_PASS}
        hosts: []\\" > /data/ocrd-processing-server-config.yaml && \\
        ocrd network processing-server -a 0.0.0.0:8000 /data/ocrd-processing-server-config.yaml"
    user: "${USER_ID}:${GROUP_ID}"
    volumes:
      - "${DATA_DIR_HOST}:/data"
      - "${RUN_NETWORK_DIR}/ocrd-all-tool.json:/build/core/src/ocrd/ocrd-all-tool.json"
    ports:
      - ${OCRD_PS_PORT}:8000
"""

MONGODB_TEMPLATE = """
  ocrd-mongodb:
    container_name: ocrd-mongodb
    image: mongo:latest
    environment:
      - MONGO_INITDB_ROOT_USERNAME=${MONGODB_USER:-admin}
      - MONGO_INITDB_ROOT_PASSWORD=${MONGODB_PASS:-admin}
    ports:
      - "27018:27017"
"""

RABBITMQ_TEMPLATE = """
  ocrd-rabbitmq:
    container_name: ocrd-rabbitmq
    image: rabbitmq:3-management
    environment:
      - RABBITMQ_DEFAULT_USER=${RABBITMQ_USER:-admin}
      - RABBITMQ_DEFAULT_PASS=${RABBITMQ_PASS:-admin}
    ports:
      - "5672:5672"
      - "15672:15672"
"""


@dataclass
class Processor:
    """Configuration of an ocr-d processor"""

    name: str
    image: str
    volumes: List[str] = field(default_factory=list)
    environment: List[str] = field(default_factory=list)
    depends_on: List[str] = field(
        default_factory=lambda: [
            "ocrd-mongodb",
            "ocrd-rabbitmq",
            "ocrd-processing-server",
        ]
    )


@dataclass
class Environment:
    """Conains info for .env file"""

    ocrd_ps_port: int = 8000
    mtu: int = 0
    mongodb_user: str = "admin"
    mongodb_pass: str = "admin"
    mongodb_url: str = "mongodb://${MONGODB_USER}:${MONGODB_PASS}@ocrd-mongodb:27017"
    rabbitmq_user: str = "admin"
    rabbitmq_pass: str = "admin"
    rabbitmq_url: str = "amqp://${RABBITMQ_USER}:${RABBITMQ_PASS}@ocrd-rabbitmq:5672"
    user_id: int = 1000
    group_id: int = 1000
    data_dir_host: str = "/tmp/data"
    internal_callback_url: str = "http://ocrd-processing-server:${OCRD_PS_PORT}"
    run_network_dir: str = dirname(__file__)


@dataclass
class Config:
    """This object determines how the docker-compose will finally look like"""

    dest: str
    processors: List[Processor]
    dest_env: Optional[str] = None
    environment: Environment = field(default_factory=Environment)
    processing_server_image: str = "ocrd/core:latest"
    processing_server_template: str = PROCESSING_SERVER_TEMPLATE
    mongodb_template: str = MONGODB_TEMPLATE
    rabbitmq_template: str = RABBITMQ_TEMPLATE
    proc_template: str = PROC_TEMPLATE
    network_template: str = NETWORK_TEMPLATE

    @staticmethod
    def from_file(yaml_file_path: str) -> "Config":
        with open(yaml_file_path, "r") as file:
            yamldict: Dict[str, Any] = yaml.safe_load(file)
        processors = [Processor(**processor) for processor in yamldict["processors"]]
        yamldict["processors"] = processors

        if "environment" in yamldict:
            yamldict["environment"] = Environment(**yamldict["environment"])
        res = Config(**yamldict)

        # let a relative dest path be relativ to the config file
        if not Path(res.dest).is_absolute():
            res.dest = Path(yaml_file_path).parent / res.dest
        if not res.dest_env:
            res.dest_env = str(Path(res.dest).with_name(".env"))
        return res


if __name__ == "__main__":
    cli()
