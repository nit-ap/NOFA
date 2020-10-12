#!/bin/bash
file_="Procfile"
g_=".git"
if [ ! -f ${file_} ]
then
    read -p "Enter entry point filename of project :" name
    touch Procfile 
    echo "web: node ${name}" >> Procfile
fi
read -p "Enter the name of webapp : " webapp
read -p "Enter the commit message : " message
if [ ! -x ${g_} ]
then 
    git init
fi
heroku login
heroku create ${webapp}
heroku git:remote -a ${webapp}
git add .
git commit -m ${message}
git push heroku master