#!/bin/bash

if  [[ $TRAVIS_PULL_REQUEST = "false" ]]
then
  export SSHPASS=$PASSWORD
  cd _site || exit
  sshpass -e scp -r . $USERNAME@$HOST:/home/timlockridge/mainwebsite_html
fi
