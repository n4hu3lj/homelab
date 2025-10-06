#!/bin/bash
echo "que archivo buscas?"
read archivo

echo "full o head?"
read modo
if [ "$modo" = "full" ]; then
        sudo find / -type f -iname "*$archivo*"
else
        sudo find / -type f -iname "*$archivo*" | head
fi