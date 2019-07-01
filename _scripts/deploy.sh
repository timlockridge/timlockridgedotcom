#!/bin/bash

if  [[ $TRAVIS_PULL_REQUEST = "false" ]]
then
  SSHPASS=$PASSWORD
  cd _site || exit
  sshpass -e scp -r . $USERNAME@$HOST:/home/timlockridge/mainwebsite_html
fi
