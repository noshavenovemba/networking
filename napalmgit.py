from napalm import get_network_driver
import json

def test_of_napalm():
	driver = get_network_driver('ios')
	optional_args = {'secret': 'test'}
	connection = driver('51.250.31.71', 'test', 'test', optional_args=optional_args)

	connection.open()
	connection_output_int = connection.get_interfaces()
	connection_output_bgp = connection.get_bgp_neighbors()
	connection_ping = connection.ping('google.com')

	print(json.dumps(connection_output_int, sort_keys=True, indent = 4 ))
	print(json.dumps(connection_ping, indent =4 ))
	print(json.dumps(connection_output_bgp, indent=4))

	connection.close()

if __name__ == '__main__':
    test_of_napalm()