#!/bin/sh

# Postfix Mail Kuyruğundaki Mail Sayısını Döndürür

PSLIST=$(/usr/sbin/postqueue -p | grep -c '^[A-Z0-9]')

if [ -z "$PSLIST" ]; then
    PSLIST=0
fi

echo "0:$PSLIST:$PSLIST Adet"
