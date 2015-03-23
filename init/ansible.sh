ln -s ~/.files/ansibleconfig ~/.ansible.cfg
ln -s ~/.files/ansible/plugins/inventory/ec2.py ~/ansible_hosts
ln -s ~/.files/ansibleconfig /etc/ansible/ec2.ini
cd ~/.files/ansible; sudo python setup.py install
