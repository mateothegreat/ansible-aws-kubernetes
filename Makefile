
#
# Install pre-requisites for aws + ansible
#
install: install/requirements   ; pip install --upgrade botocore boto3 boto
install/requirements:           ; ansible-galaxy install -r requirements.yml

keypair/create:                 ; ansible-playbook ec2.yml --tags keypair

vms/create:                     ; ansible-playbook ec2.yml --tags vmdev
vms/terminate:                  ; ansible-playbook ec2.yml --tags vmdev,terminate
# vms/create:         ; ansible-playbook -vvv ec2.yml

setup/ec2.py:

	wget https://raw.githubusercontent.com/ansible/ansible/devel/contrib/inventory/ec2.py
	chmod +x ec2.py
	wget https://raw.githubusercontent.com/ansible/ansible/devel/contrib/inventory/ec2.ini

