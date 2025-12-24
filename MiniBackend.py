import socket
import json

sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
sock.bind(("127.0.0.1", 7778))

print("Listening on 127.0.0.1:7778")

while True:
    data, addr = sock.recvfrom(4096)

    try:
        frame = json.loads(data.decode("utf-8"))
    except json.JSONDecodeError:
        print("Invalid JSON:", data)
        continue

    print("RECEIVED:", frame)
