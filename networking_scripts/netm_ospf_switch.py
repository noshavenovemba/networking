from netmiko import ConnectHandler
from netmiko.ssh_exception import NetMikoTimeoutException

def ospf_cost_switch():

    msk_sw_1_ip = "172.18.197.1"
    msk_sw_1_ip = "172.18.197.2"
    lnd_sw_1_ip = "172.18.197.51"
    lnd_sw_1_ip = "172.18.197.52"

    msk_sw_1 = {
        'device_type': 'arista_eos',
        'ip': msk_sw_1_ip,
        'username': 'admin',
        'password': 'dj2dkMuty7',
        'secret': 'dj2dkMuty7',
    }

    msk_sw_2 = {
        'device_type': 'arista_eos',
        'ip': msk_sw_2_ip,
        'username': 'admin',
        'password': 'dj2dkMuty7',
        'secret': 'dj2dkMuty7',
    }

    lnd_sw_1 = {
        'device_type': 'arista_eos',
        'ip': lnd_sw_1_ip,
        'username': 'admin',
        'password': 'dj2dkMuty7',
        'secret': 'dj2dkMuty7',
    }

    lnd_sw_2 = {
        'device_type': 'arista_eos',
        'ip': lnd_sw_2_ip,
        'username': 'admin',
        'password': 'dj2dkMuty7',
        'secret': 'dj2dkMuty7',
    }

    try:
        connect_msk_sw1 = ConnectHandler(**msk_sw_1)
        connect_msk_sw2 = ConnectHandler(**msk_sw_2)
        connect_lnd_sw1 = ConnectHandler(**lnd_sw_1)
        connect_lnd_sw2 = ConnectHandler(**lnd_sw_2)
        output = connect_msk_sw1.send_command("show ip route 172.18.230.0")
            if "Vlan920" in output:
                print("It goes through the main circuit")
                connect_msk_sw1.enable()
                config_msk_sw1 = ['int Vlan 920', 'ip ospf cost 300']
                output_msk_sw1 = connect_msk_sw1.send_config_set(config_msk_sw1)
                #print(output_msk_sw1)
                connect_lnd_sw1.enable()
                config_lnd_sw1 = ['int Vlan 920', 'ip ospf cost 300']
                output_lnd_sw1 = connect_lnd_sw1.send_config_set(config_lnd_sw1)
                print(output_lnd_sw1)
                print("Still need to change cost on a backup SVI")

                connect_msk_sw2.enable()
                config_msk_sw2 = ['int Vlan 942', 'ip ospf cost 150']
                output_msk_sw2 = connect_msk_sw2.send_config_set(config_msk_sw2)
                # print(output_msk_sw2)
                connect_lnd_sw2.enable()
                config_lnd_sw2 = ['int Vlan 942', 'ip ospf cost 150']
                output_lnd_sw2 = connect_lnd_sw2.send_config_set(config_lnd_sw2)
                print(output_lnd_sw2)

            else:
                print("You are already on a backup")

        print("Success!")

    except Exception as err:
        exception_type = type(err).__name__
        print(f"Oops! {err}")

if __name__ == "__main__":
    ospf_cost_switch()
