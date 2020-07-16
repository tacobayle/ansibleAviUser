#!/bin/bash
rm -f *.csv
ansible-playbook pbAviGetUser.yml --extra-vars "@vars/creds_us.json"
ansible-playbook pbAviGetUser.yml --extra-vars "@vars/creds_europe.json"
ansible-playbook pbAviGetUser.yml --extra-vars "@vars/creds_asia.json"
cat usSignedIn.csv > attendeesSignedInDup.csv
cat europeSignedIn.csv >> attendeesSignedInDup.csv
cat asiaSignedIn.csv >> attendeesSignedInDup.csv
awk -F\; '++seen[$1]==1' attendeesSignedInDup.csv > attendeesSignedIn.csv
cat usNotSignedIn.csv > attendeesNotSignedInDup.csv
cat europeNotSignedIn.csv >> attendeesNotSignedInDup.csv
cat asiaNotSignedIn.csv >> attendeesNotSignedInDup.csv
awk -F\; '++seen[$1]==1' attendeesNotSignedInDup.csv > attendeesNotSignedIn.csv
cat attendeesSignedIn.csv > attendeesDup.csv
cat  attendeesNotSignedIn.csv >> attendeesDup.csv
awk -F\; '++seen[$1]==1' attendeesDup.csv > attendees.csv
rm -f usSignedIn.csv europeSignedIn.csv asiaSignedIn.csv attendeesSignedInDup.csv \
      usNotSignedIn.csv europeNotSignedIn.csv asiaNotSignedIn.csv attendeesNotSignedInDup.csv \
      attendeesNotSignedIn.csv attendeesDup.csv attendeesSignedIn.csv
