# aviUser

## Goals
Gather Avi User and generate a csv file

## Prerequisites:
1. Make sure Ansible in installed in the host
2. Make sure avisdk is installed:
```
pip install avisdk
ansible-galaxy install -f avinetworks.avisdk
```
3. Make sure you can reach your Avi Controllers

## Environment:
Playbook(s) has/have been tested against:

### Ansible

```
avi@ansible:~/ansible/aviSlackAlerts$ ansible --version
ansible 2.9.5
  config file = /etc/ansible/ansible.cfg
  configured module search path = [u'/home/avi/.ansible/plugins/modules', u'/usr/share/ansible/plugins/modules']
  ansible python module location = /home/avi/.local/lib/python2.7/site-packages/ansible
  executable location = /home/avi/.local/bin/ansible
  python version = 2.7.12 (default, Oct  8 2019, 14:14:10) [GCC 5.4.0 20160609]
avi@ansible:~/ansible/aviSlackAlerts$
```

### Avi version

```
Avi 18.2.8
```

## Input/Parameters:

- All the paramaters/variables are stored in vars/creds_us.json, vars/creds_asia.json and vars/creds_europe.json in the following format:

```
{"avi_credentials": {"username": "*******", "controller": "*******", "password": "*******", "api_version": "*******"}, "zone": "*******"}

```


## Use the ansible playbook to:
1. Gather Avi Users
2. Remove admin user
3. Create a csv file - attendees.csv - (column 1: name, Column2: signed-in or not (true or false), Column3: zone)

## Run the script:
./user.sh
