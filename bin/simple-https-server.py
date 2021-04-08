#!/usr/bin/env python3

# Ported to Python 3 by Telmo "Trooper" (telmo.trooper@gmail.com)
#
# Original code from:
# http://www.piware.de/2011/01/creating-an-https-server-in-python/
# https://gist.github.com/dergachev/7028596
#
# To generate a certificate use:
# openssl req -new -x509 -keyout server.pem -out server.pem -days 365 -nodes
# TIP: just fill the first question with aa and then go pressing ENTER > ENTER...

from http.server import HTTPServer, SimpleHTTPRequestHandler
import ssl

separator = "-" * 80
port = 4443
httpd = HTTPServer(("", port), SimpleHTTPRequestHandler)
httpd.socket = ssl.wrap_socket(httpd.socket, certfile="/Users/nicalmei/bin/server.pem", server_side=True)

print(separator)
print("Server running on https://localhost:" + str(port))
print(separator)

httpd.serve_forever()