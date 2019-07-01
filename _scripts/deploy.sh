#!/bin/bash

if  [[ $TRAVIS_PULL_REQUEST = "false" ]]
then
  export SSHPASS=$PASSWORD
  cd _site || exit
  sshpass -e scp -o StrictHostKeyChecking=no -r . $USERNAME@$HOST:/home/timlockridge/mainwebsite_html
fi
