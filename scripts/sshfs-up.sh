#!/bin/bash
set HOST "USER@IP"
echo "Mounting sshfs $HOST"
sshfs -o workaround=nodelaysrv -o cache_stat_timeout=600 -o reconnect -o Ciphers=arcfour $HOST:/public_html/wp-content/themes/moviemewp/ /mnt/wp
echo "Mounted!"
echo "Press CTRL+C to dismount and exit"

while [ 1 ]; do
    touch /mnt/wp/touch.txt
    sleep 1
    trap "echo 'Dismounting...'; fusermount -u /mnt/wp; echo 'Dismounted!'; exit;" SIGINT SIGTERM
done

