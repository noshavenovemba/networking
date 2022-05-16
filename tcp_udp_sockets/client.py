import socket

def tcp_func():
    host = '127.0.0.1'
    port = 12345
    BUFFER_SIZE = 1024

    MESSAGE = 'This is your first message'

    with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as socket_tcp:
        socket_tcp.connect((host, int(port)))
        socket_tcp.send(MESSAGE.encode('utf-8'))
        socket_tcp.recv(BUFFER_SIZE)

def udp_func():
    host = '127.0.0.1'
    port = 12345
    buffer = 4096

    address = (host, port)
    socket_client = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
    while True:
        message = input('Enter you message')
        if message == "exit":
            break
        socket_client.sendto(message.encode(), address)
        resource, addr = socket_client.recvfrom(buffer)
        print ("Server responce +> %s" % resource)

udp_func()
