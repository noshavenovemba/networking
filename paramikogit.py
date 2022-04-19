from netmiko import ConnectHandler
from netmiko.ssh_exception import  NetMikoTimeoutException

ipaddr = "127.0.0.1"

iosv_l3 = {
    'device_type': 'cisco_ios',
    'ip': ipaddr,
    'username': 'test',
    'password': 'test',
    'secret': 'test',
}

all_devices = [iosv_l3]

try:

    #show config
    net_connect = ConnectHandler(**iosv_l3)
    output = net_connect.send_command('show ip int brief')
    print(output)

    #simple send config
    net_connect.enable()
    config_commands = ['int loop 1', 'ip address 5.5.5.5 255.255.255.255']
    output = net_connect.send_config_set(config_commands)
    print(output)

    #loop for subs
    for n in range(2,4):
        net_connect.enable()
        print("Creating sub-interface " +str(n))
        config_commands = ['int Gi1.' + str(n), 'encapsulation dot1Q ' + str(n), 'ip addr 172.18.1.' + str(n) + ' 255.255.255.0']
        output = net_connect.send_config_set(config_commands)
        print(output)

    #config from file
    with open('new_config.txt') as f:
        lines = f.read().splitlines()
    print(lines)

    one_more_connect = ConnectHandler(**iosv_l3)
    output = net_connect.send_config_set(lines)
    print(output)

except NetMikoTimeoutException as err:
    print(f"Connection Refused: {err}")
except Exception as err:
    exception_type = type(err).__name__
    print(f"Oops! {err}")
