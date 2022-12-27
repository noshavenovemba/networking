terraform refresh // query provider to get current state

terraform init // download plugin

terraform plan // see changes

terraform apply // create

terraform apply -auto-approve 

terraform apply -var "subnet=10.0.0.0/24"

terraform destroy // delete

terraform destroy -target aws.subnet.dev_subnet_1

terraform state list

terraform state show aws.subnet.dev_subnet_1

tfstate // is for saving state of rolled instance
