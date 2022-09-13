#!/bin/bash

from=noreply@noreploy.com
to=admin@example.com    # replace with required system admin email id which can receive emails
user=$1

expirydate=`chage -l $user | grep -i "^password expires" | awk -F": " '{print $NF}' | sed -e 's/,//g'`
currentdate=$(date +%Y%m%d)

checkexpiry()
{

        if [[ $expirydate == 'never' ]]
        then
                echo "Password never expires"
        else
                expiry=`date -d "$expirydate" +%Y%m%d`
                let DIFF=($(date +%s -d $expiry)-$(date +%s -d $currentdate))/86400
                #echo $expiry
                #echo $currentdate
                #echo $DIFF
                if [[ $DIFF -lt 0 ]]
                then
                        echo "$user - Password expired"
                        #(echo "From: $from"; echo "To: $to"; echo "Subject: Password expired") | sendmail -t # Make sure sendmail is configured to send email
                elif [[ $DIFF -lt 7 ]]
                then
                        echo "$user - Password expires within 7 days"
                        #(echo "From: $from"; echo "To: $to"; echo "Subject: Password expires within 7 days") | sendmail -t # Make sure sendmail is configured to send email                        
                else
                        echo "$user - Password has time to expire"
                        #(echo "From: $from"; echo "To: $to"; echo "Subject: Password has time to expire") | sendmail -t # Make sure sendmail is configured to send email
                fi
        fi

}

if id "$user" >/dev/null 2>&1; then
        checkexpiry
else
        echo "$user - user does not exist"
fi