#!/bin/bash
procfile_="Procfile"
g_=".git"
run_="runtime.txt"
requirement_="requirements.txt"
if [ ! -f ${procfile_} ]
then
    read -p "Enter entry point filename of project without .py extension eg. app.py then app :" name
    read -p "Enter the flask app name eg. app=Flask(__name__) : " app
    echo "web: gunicorn ${name}:${app}" >> Procfile
fi
if [ ! -f ${run_} ]
then
    read -p "Enter the python version eg. python-3.7.5 : " python
    echo ${python} >> runtime.txt
fi
read -p "Enter the name of webapp : " webapp
read -p "Enter the commit message : " message
if [ ! -f ${requirement_} ]
then
    echo "Please provide requirements.txt file or used command: pip freeze >> requirements.txt"
    exit
fi
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