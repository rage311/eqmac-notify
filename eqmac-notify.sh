#!/bin/bash

#You shouldn't need to change this
workingdir="/Users/$USER/Library/Application Support/EverQuest/Logs"

#The first name of the character whose bazaar logfiles are to be watched
#You MUST use correct capitalization
character="Yourcharacter"

#Email address that you want the notifications to be sent to
address="emailaddress@domain.com"

bazlines=`cat "$workingdir/bzrlog_52_$character.txt" | grep -v -F --file="$workingdir/bzrlog_pattern_$character.txt" | grep purchased | grep -v buyer`
if [ `echo $bazlines | wc -w` -gt 0 ]; then
    echo $bazlines | mail -s "Bazaar sale" $address;
fi
cat "$workingdir/bzrlog_52_$character.txt" > "$workingdir/bzrlog_pattern_$character.txt"

if [ `ps -Af | grep -i everquest | grep -v grep | wc -l` -lt 1 ]; then
    if [ `cat ./crash_email_sent.txt | grep 1 | wc -l` -lt 1 ]; then
	echo "Everquest is not running" | mail -s "EQ Crashed" $address;
	echo 1 > ./crash_email_sent.txt;
    fi
else
    echo 0 > ./crash_email_sent.txt;
fi
