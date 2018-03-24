#!/bin/bash

if  [[ $TRAVIS_PULL_REQUEST = "false" ]]
then
    ncftp -u "$USERNAME" -p "$PASSWORD" "$HOST"<<EOF
EOF

    cd _site || exit
    ncftpput -R -v -u "$USERNAME" -p "$PASSWORD" "$HOST" /home/timlockridge/mainwebsite_html .
fi
