import csv
from jinja2 import Template


def main():
    source_file = "switchport.csv"
    interface_template_file = "jinja2.j2"

    with open(interface_template_file) as f:
        interface_template = Template(f.read())
        type(interface_template)


    with open(source_file) as f:
        reader = csv.DictReader(f)
        for row in reader:
            interface_config = interface_template.render(
                interface = row["Interface"],
                vlan = row["VLAN"],
                link = row["Link"]
            )
            interface_config += interface_config
            print(interface_config)
main()

