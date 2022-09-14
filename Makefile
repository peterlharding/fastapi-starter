

FILES := $(shell ls)

start:
	uvicorn app.main:app --reload

chown:
	chown -R www-data:www-data .

install:
	python3 -m pip install -r requirements.txt

setup:
	-ln env.template app/.env

ls:
	echo $(FILES)

