

FILES := $(shell ls)
HOST  := $(shell grep HOST .env | sed 's/HOST=//')
PORT  := $(shell grep PORT .env | sed 's/PORT=//')

start:
	nohup uvicorn app.main:app --reload --host ${HOST} --port ${PORT} 2>&1 > /tmp/fastapi-starter.log &

chown:
	chown -R www-data:www-data .

install:
	python3 -m pip install -r requirements.txt

setup:
	-ln env.template app/.env

ls:
	echo $(FILES)

