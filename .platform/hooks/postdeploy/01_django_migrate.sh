#!/bin/bash

source "$PYTHONPATH/activate" && {
    # migrate
    if [[ $EB_IS_COMMAND_LEADER == "true" ]];
    then
        echo "Leader found, running migrate";
        python manage.py showmigrations;
        python manage.py migrate --noinput;
        python manage.py collectstatic --noinput;
        python createSuperUser.py
    else 
        echo "this instance is NOT the leader";
    fi
}
