#!/bin/bash

echo -n "Password: "
read -s password
echo ""

hash=`echo -n $password | shasum | head -c 40`

firstfive=${hash:0:5}
everythingelse=${hash:5}

res=$(curl -s "https://api.pwnedpasswords.com/range/$firstfive")
count=`echo "$res" | grep -i $everythingelse`
clean=`echo $count | sed 's/.*://'`

echo $clean
