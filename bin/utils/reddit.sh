#!/bin/sh

url="https://www.reddit.com/message/unread/.json?feed=58c20495ed52291e476142d4ce76de9d5c2d1231&user=peritrima"
unread=$(curl -sf "$url" | jq '.["data"]["children"] | length')

case "$unread" in
    ''|*[!0-9]*)
	unread=0
esac;

if [ "$unread" -gt 0 ]; then
   echo " $unread"
else
   echo ""
fi
