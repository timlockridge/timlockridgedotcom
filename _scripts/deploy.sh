#!/bin/bash

cd _site || exit

sshpass -e scp -r . $USERNAME@$HOST:/home/timlockridge/mainwebsite_html
