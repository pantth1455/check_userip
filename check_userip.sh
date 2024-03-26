#!/bin/bash
function check_ip(){
    local IP=$1
    VALID_CHECK=$(echo $IP |awk -F"."  '{if($1<=255&&$2<=255&&$3<=255&&$4<=255) print "yes" ; else print "no"}')
    if echo $IP|grep -E "^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$">/dev/null; then
        if [[ "$VALID_CHECK" == "yes" ]]; then
            echo "$IP available."
            return 0
        else
            echo "$IP not available!"
            return 1
        fi
    else
        echo "Format error!"
        return 1
    fi
}

while true; do
    read -p "Please enter IP: " ip
    check_ip $ip
    [ $? -eq 0 ] && break || continue
done
