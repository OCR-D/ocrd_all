import re
import subprocess
import time
from collections import Counter
from dataclasses import dataclass, field
from os import chdir, environ, chmod
from os.path import dirname
from pathlib import Path
from typing import Any, Dict, ForwardRef, List, Type

import click
import requests
import json
import yaml


@click.group()
def cli() -> None:
    """A simple CLI program"""
    pass


@cli.command("create-compose")
@click.argument("config_path", type=click.Path(dir_okay=False,exists=True))
@click.argument("out_path", type=click.Path(dir_okay=False), default="docker-compose.yml")
def create_compose_cli(config_path: str, out_path: str) -> None:
    """Creates a docker-compose file"""
    config: Config = Config.from_file(config_path)
    create_docker_compose(config, out_path)


@cli.command("create-dotenv")
@click.argument("config_path", type=click.Path(dir_okay=False,exists=True))
@click.argument("out_path", type=click.Path(dir_okay=False), default=".env")
def create_dotenv_cli(config_path: str, out_path: str) -> None:
    """Creates .env for docker-compose"""
    config: Config = Config.from_file(config_path)
    create_dotenv(config.environment, out_path)


@cli.command("create-psconfig")
@click.argument("config_path", type=click.Path(dir_okay=False,exists=True))
@click.argument("out_path", type=click.Path(dir_okay=False), default="ocrd-processing-server-config.yaml")
def create_psconfig_cli(config_path: str, out_path: str) -> None:
    """Creates configuration file for ocrd network processing-server"""
    config: Config = Config.from_file(config_path)
    create_psconfig(config.environment, out_path)


@cli.command()
def start() -> None:
    """Start all services via docker compose"""
    command = ["docker", "compose", "up", "--wait", "--wait-timeout", "30", "-d"]
    subprocess.run(command)
    #wait_for_startup(f"http://localhost:{config.environment.ocrd_ps_port}")


@cli.command()
def stop() -> None:
    """Stop all services via docker compose"""
    command = ["docker", "compose", "down"]
    subprocess.run(command)


@cli.command("create-client")
@click.option("--docker-run-opts")
@click.argument("path")
@click.argument("executable")
@click.argument("image")
def create_client(docker_run_opts: str, path: str, executable: str, image: str) -> None:
    """Creates an executable script for the specified processor

    The script will either call the standalone CLI via Docker run,
    or (if the network-setup has been run) the client CLI for the
    Processing Server (assuming network-start has been run as well).
    """
    content = DELEGATOR_PROCESSOR_TEMPLATE.format(processor_name=executable, docker_image=image, docker_run_opts=docker_run_opts)
    dest = Path(path)
    if not dest.parent.exists():
        exit(f"target {dest} parent directory does not exist")
    with open(dest, "w") as fout:
        fout.write(content)
    chmod(dest, 0o755)


@cli.command()
@click.option("--docker-run-opts")
@click.argument("path")
def create_workflow_client(docker_run_opts: str, path: str) -> None:
    """Creates an executable script for the 'ocrd process' functionality (workflow processing)

    After validating fileGrp dependencies for the passed workspace,
    for each processor in the passed workflow,
    the script will either call the respective standalone CLI via Docker run,
    or (if the network-setup has been run) the client CLI for the
    Processing Server (assuming network-start has been run as well).
    """
    content = DELEGATOR_WORKFLOW_TEMPLATE.format(docker_run_opts=docker_run_opts)
    dest = Path(path)
    if not dest.parent.exists():
        exit(f"target {dest} parent directory does not exist")
    with open(dest, "w") as fout:
        fout.write(content)
    chmod(dest, 0o755)


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


def create_docker_compose(config: Type[ForwardRef("Config")], dest: str) -> None:
    """Create docker-compose file from config-object

    The parts of the docker-compose are defined in the config-object. Basically there is a template
    string for all needed services. These templates are configurable and parts of it are set via
    info specified in the config file
    """
    with open(dest, "w") as fout:

        if config.environment.mtu:
            fout.write(config.network_template)
            fout.write("\n")
        fout.write("services:")
        ps_template = config.processing_server_template.format(
            image=config.processing_server_image
        )
        fout.write(ps_template)
        fout.write(config.mongodb_template)
        fout.write(config.rabbitmq_template)
        fout.write(create_workers(config))
        fout.write(config.volumes_template)


def create_workers(config: Type[ForwardRef("Config")]) -> str:
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

        depends_on_str = ""
        for depends_on in p.depends_on:
            depends_on_str += "\n"
            depends_on_str += f"      - {depends_on}"

        proc_str = config.proc_template.format(
            service_name=service_name,
            processor_name=p.name,
            image=p.image,
            depends_on=depends_on_str,
            profiles=", ".join(p.profiles)
        )

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


def create_dotenv(env: Type[ForwardRef("Environment")], dest: str) -> None:
    """Create .env file to configure docker-compose

    Info is read from the config-object and written to the env file
    """
    lines = [
        f"OCRD_PS_MTU={env.mtu}",
        f"OCRD_PS_PORT={env.ocrd_ps_port}",
        f"MONGODB_USER={env.mongodb_user}",
        f"MONGODB_PASS={env.mongodb_pass}",
        f"MONGODB_URL={env.mongodb_url}",
        f"RABBITMQ_USER={env.rabbitmq_user}",
        f"RABBITMQ_PASS={env.rabbitmq_pass}",
        f"RABBITMQ_URL={env.rabbitmq_url}",
        f"USER_ID={env.user_id}",
        f"GROUP_ID={env.group_id}",
        f"DATA_DIR={env.data_dir}",
        f"RES_VOL={env.res_vol}",
        f"INTERNAL_CALLBACK_URL={env.internal_callback_url}",
    ]

    with open(dest, "w+") as fout:
        fout.write("\n".join(lines) + "\n")


def create_psconfig(env: Type[ForwardRef("Environment")], dest: str) -> None:
    """Create configuration file for ocrd network processing-server

    Info is read from the config-object and written to the yaml file
    """
    content = PROCESSING_SERVER_CONFIG_TEMPLATE.format(env=env).replace("${OCRD_PS_PORT}", str(env.ocrd_ps_port))
    with open(dest, "w") as fout:
        fout.write(content)


def wait_for_startup(processing_server_url: str) -> None:
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
  {service_name}:
    image: {image}
    container_name: {service_name}
    command: {processor_name} worker --database $MONGODB_URL --queue $RABBITMQ_URL
    profiles: [{profiles}]
    depends_on: {depends_on}
    user: "${{USER_ID}}:${{GROUP_ID}}"
    volumes:
      - "${{DATA_DIR}}:/data"
      - ocrd-resources:/usr/local/share/ocrd-resources
    environment:
      - OCRD_NETWORK_LOGS_ROOT_DIR=${{LOGS_DIR:-/data/logs}}
      - XDG_CONFIG_HOME=/usr/local/share/ocrd-resources
"""

PROCESSING_SERVER_TEMPLATE = """
  ocrd-processing-server:
    container_name: ocrd-processing-server
    image: {image}
    environment:
      - MONGODB_USER=${{MONGODB_USER:-admin}}
      - MONGODB_PASS=${{MONGODB_PASS:-admin}}
      - RABBITMQ_USER=${{RABBITMQ_USER:-admin}}
      - RABBITMQ_PASS=${{RABBITMQ_PASS:-admin}}
      - OCRD_NETWORK_SOCKETS_ROOT_DIR=${{SOCKETS_DIR:-/data/sockets}}
      - OCRD_NETWORK_LOGS_ROOT_DIR=${{LOGS_DIR:-/data/logs}}
      - XDG_CONFIG_HOME=/usr/local/share/ocrd-resources
    command: ocrd network processing-server -a 0.0.0.0:8000 /data/ocrd-processing-server-config.yaml
    healthcheck:
      test: ["CMD", "curl", "-f", "http://0.0.0.0:8000"]
      interval: 60s
      timeout: 10s
      start_period: 30s
      retries: 2
    user: "${{USER_ID}}:${{GROUP_ID}}"
    volumes:
      - ocrd-resources:/usr/local/share/ocrd-resources
      - "${{DATA_DIR}}:/data"
      - "${{PWD}}/ocrd-all-tool.json:/build/core/src/ocrd/ocrd-all-tool.json"
      - "${{PWD}}/ocrd-processing-server-config.yaml:/data/ocrd-processing-server-config.yaml"
    ports:
      - ${{OCRD_PS_PORT}}:8000
"""

PROCESSING_SERVER_CONFIG_TEMPLATE = """
internal_callback_url: {env.internal_callback_url}
use_tcp_mets: true
process_queue:
  address: ocrd-rabbitmq
  port: 5672
  skip_deployment: true
  credentials:
    username: {env.rabbitmq_user}
    password: {env.rabbitmq_pass}
database:
  address: ocrd-mongodb
  port: 27017
  skip_deployment: true
  credentials:
    username: {env.mongodb_user}
    password: {env.mongodb_pass}
hosts: []
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
    healthcheck:
      test: ["CMD", "mongosh", "--eval", "db.adminCommand('ping')"]
      interval: 60s
      timeout: 10s
      start_period: 10s
      retries: 3
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
    healthcheck:
      test: ["CMD", "rabbitmq-diagnostics", "check_port_connectivity"]
      interval: 60s
      timeout: 10s
      start_period: 10s
      retries: 3
"""

VOLUMES_TEMPLATE = """
volumes:
  ocrd-resources:
    external: true
    name: ${RES_VOL}
"""


DELEGATOR_DETECTENV_TEMPLATE = """
import os
import sys
import pathlib

# detect whether to run standalone or in ocrd_network
dotenv = pathlib.Path(".env")
if dotenv.exists():
    from dotenv import dotenv_values
    dotenv = dotenv_values(dotenv)
    ps_port = dotenv.get('OCRD_PS_PORT', '')
    if ps_port and ps_port.isdecimal():
        pass
        print("using Processing Server at localhost:%s" % ps_port, file=sys.stderr)
    else:
        ps_port = ''
        print("no OCRD_PS_PORT found in .env - starting local container", file=sys.stderr)
else:
    ps_port = ''
    print("no .env found - starting local container", file=sys.stderr)

# allow overriding detection
if policy := os.environ.get('DOCKER_RUN_POLICY', None):
    if policy in ['ocrd_network', 'client'] and not ps_port:
        exit("cannot apply DOCKER_RUN_POLICY=" + policy + ": needs OCRD_PS_PORT via .env")
    if policy in ['local', 'standalone'] and ps_port:
        ps_port = ''
        print("DOCKER_RUN_POLICY overrides: starting local container", file=sys.stderr)
"""

DELEGATOR_PROCESSOR_TEMPLATE = """#!/usr/bin/env python

import sys
import os
import pathlib
import subprocess

""" + DELEGATOR_DETECTENV_TEMPLATE + """

if not ps_port:
    # avoid re-interpreting by shell
    args = ['docker', 'run', '--rm']
    args.extend('{docker_run_opts}'.split())
    args.extend(os.environ.get('DOCKER_RUN_OPTS', '').split())
    # try to be smart: bind-mount CWD as /data if not mounted yet
    datapath = None
    for arg in args:
        if arg.endswith(':/data'):
            datapath = arg[:arg.index(':')]
            break
        if arg.endswith(',destination=/data'):
            typ, src, dst = arg.split(',')
            datapath = src.replace('source=', '')
            break
    if not datapath:
        datapath = str(pathlib.Path().absolute())
        args.extend(['-v', datapath + ':/data'])
    if datapath.endswith('/'):
        datapath = datapath[:-1]
    args.append('{docker_image}')
    args.append('{processor_name}')
    # try to be smart: translate host to container data paths
    args.extend([arg.replace(datapath + '/', '/data/') if arg.startswith('/') else arg
                 for arg in sys.argv[1:]])
    ret = subprocess.run(args)
    sys.exit(ret.returncode)

import click
from ocrd_network.cli import client_cli

run_cli = client_cli.commands['processing'].commands['run']


def callback(*args, **kwargs):
    kwargs['address'] = "http://localhost:" + ps_port
    kwargs['block'] = True
    kwargs['print_state'] = True
    return run_cli.callback("{processor_name}", *args, **kwargs)


params = [param for param in run_cli.params
          if param.name not in [
                  'processor_name',
                  'address',
                  'block',
                  'print_state',
          ]]
cli = click.Command(name="{processor_name}",
                    callback=callback,
                    params=params)

if __name__ == "__main__":
    cli()
"""


# FIXME
DELEGATOR_WORKFLOW_TEMPLATE = """#!/usr/bin/env python

from ocrd_network.cli import client_cli
import click


run_cli = client_cli.commands['workflow'].commands['run']


def callback(*args, **kwargs):
    kwargs['address'] = "http://localhost:{ps_port}"
    kwargs['block'] = True
    kwargs['print_state'] = True
    return run_cli.callback(*args, **kwargs)


params = [param for param in run_cli.params
          if param.name not in [
                  'address',
                  'block',
                  'print_state',
          ]]
cli = click.Command(name="ocrd-process", callback=callback, params=params)


if __name__ == "__main__":
    cli()
"""


@dataclass
class Processor:
    """Configuration of an ocr-d processor"""

    name: str
    image: str
    volumes: List[str] = field(default_factory=list)
    environment: List[str] = field(default_factory=list)
    profiles: List[str] = field(default_factory=list)
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
    data_dir: str = "/tmp/data"
    res_vol: str = "ocrd-models"
    internal_callback_url: str = "http://ocrd-processing-server:${OCRD_PS_PORT}"


@dataclass
class Config:
    """This object determines how the docker-compose will finally look like"""

    processors: List[Processor]
    environment: Environment = field(default_factory=Environment)
    processing_server_image: str = "ocrd/core:latest"
    processing_server_template: str = PROCESSING_SERVER_TEMPLATE
    mongodb_template: str = MONGODB_TEMPLATE
    rabbitmq_template: str = RABBITMQ_TEMPLATE
    proc_template: str = PROC_TEMPLATE
    network_template: str = NETWORK_TEMPLATE
    volumes_template: str = VOLUMES_TEMPLATE

    @staticmethod
    def from_file(yaml_file_path: str) -> "Config":
        with open(yaml_file_path, "r") as file:
            yamldict: Dict[str, Any] = yaml.safe_load(file)

        if "processors" in yamldict:
            # manual config
            processors = [Processor(**processor) for processor in yamldict["processors"]]
            print("loaded %d processors from manual config %s" % (len(processors), yaml_file_path))
        else:
            # controlled by Makefile at build time (OCRD_MODULES etc.)
            with open("ocrd-all-images.yaml", "r") as file:
                images = yaml.safe_load(file)
            processors = []
            for image in images:
                with open(image, "r") as file:
                    meta = yaml.safe_load(file)
                processors.extend([
                    Processor(name=executable, image=image,
                              # DOCKER_PROFILES is whitespace-separated in Makefile
                              profiles=(meta['profiles'] or "").split())
                    for executable in meta['tools']])
            print("loaded %d processors from generated config" % len(processors))
        yamldict["processors"] = processors

        if "environment" in yamldict:
            # manual config
            environment = Environment(**yamldict["environment"])
        else:
            # defaults
            environment = Environment()
        yamldict["environment"] = environment

        res = Config(**yamldict)
        return res


if __name__ == "__main__":
    cli()
