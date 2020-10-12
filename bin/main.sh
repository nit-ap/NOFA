#!/bin/bash
echo "..............Heroku Deployment................"
stack1="Node.js"
stack2="Flask"
echo "Enter 1 for ${stack1} and 2 for ${stack2}"
read -p "Enter your stack choice 1 or 2 : " choice

if ((${choice} == 1))
then
 nodejs.sh
else
 flask.sh
fi