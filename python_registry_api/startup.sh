#!/bin/bash
python manage.py create_db
flask db upgrade
gunicorn -w 4 -b 0.0.0.0:5000 'app:create_app()' --error-logfile "-" --enable-stdio-inheritance --reload --log-level "debug"