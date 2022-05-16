import socket
import sys


def tcp_func():

    host = "127.0.0.1"
    port = 12345
    BUFFER_SIZE = 1024

    with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as socket_tcp:
        socket_tcp.bind((host, int(port)))

        socket_tcp.listen(5)

        connection, addr = socket_tcp.accept()
        with connection:
            print('[*] Established connection')
            while True:
                data = connection.recv(BUFFER_SIZE)
                if not data:
                    break
                else:
                    print ('[*] Data recevied ' .format(data.decode('utf-8')))
                connection.send(data)

def udp_func():

    host = "127.0.0.1"
    port = 12345
    buffer = int(4096)

    socket_server = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    socket_server.bind((host, int(port)))
    while True:
        print('Waiting for client data')
        data,addres = socket_server.recvfrom(buffer)
        data = data.strip()
        print ("Data received frorm addr ", addres)
        print ("message", data)

        try:
            responce = "Hi %s" % sys.platform
        except Exception as e:
            responce = "%s" % sys.exc_info()[0]
        print (responce)

        print("Response ", responce)

        socket_server.sendto(responce.encode(), addres)

    socket_server.close()

udp_func()
