.PHONY: server shell

DATABASE = db.sqlite3

server: env $(DATABASE)
	. env/bin/activate && python manage.py runserver

env: requirements.txt
	virtualenv env && .env/bin/activate && pip install --requirement requirements.txt

$(DATABASE): env
	. env/bin/activate && python manage.py migrate

# Spawn a shell in the virtual environment
shell:
	bash --rcfile env/bin/activate; exit
