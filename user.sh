#!/bin/bash
rm -f *.csv
ansible-playbook pbAviGetUser.yml --extra-vars "@vars/creds_asia.json"
ansible-playbook pbAviGetUser.yml --extra-vars "@vars/creds_us.json"
ansible-playbook pbAviGetUser.yml --extra-vars "@vars/creds_europe.json"
touch attendees.csv
cat asia.csv >> attendees.csv
cat us.csv >> attendees.csv
cat europe.csv >> attendees.csv
