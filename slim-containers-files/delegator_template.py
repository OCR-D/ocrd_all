#!/usr/bin/env python
import sys
import subprocess
from http.server import BaseHTTPRequestHandler, HTTPServer
from os.path import basename

processing_server_address = "http://localhost:{{ OCRD_PS_PORT }}"
processor_name = basename(sys.argv[0])

STOP_WAITING_SERVER = False


class CallbackReceiver(BaseHTTPRequestHandler):
    """Simple http-server to wait for a processor to finish working.

    The OCR-D processor is started with a callback-url which points to this server. The processor
    starts working in the background but the call is returned immediately. When the processor is
    finished it sends a request to the callback-url. The purpose of this server is to wait for the
    processor to finish and print its result.
    """
    def do_POST(self):
        self.send_response(200)
        self.send_header("Content-Type", "text/plain")
        self.end_headers()
        self.wfile.write("finished".encode("utf-8"))
        len = int(self.headers.get("Content-Length", 0))
        data = self.rfile.read(len).decode("utf-8")
        # TODO: how should the callback-content be handled/printed
        print(f"Processor finished: {data}")
        global STOP_WAITING_SERVER
        STOP_WAITING_SERVER = True


def call_processor_and_wait():
    server = HTTPServer(("0.0.0.0", 0), CallbackReceiver)
    callback_url = f"http://172.17.0.1:{server.server_address[1]}"
    cmd = [
        "ocrd", "network", "client", "processing", "processor",
        processor_name, "--address", processing_server_address,
        "--callback-url", callback_url
    ]
    args = list(sys.argv)
    subprocess.run(cmd + args[1:])
    while not STOP_WAITING_SERVER:
        server.handle_request()


if __name__ == "__main__":
    call_processor_and_wait()
