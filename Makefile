

FILES := $(shell ls)

NAME  := $(shell grep NAME .env | sed 's/.*=//')
HOST  := $(shell grep HOST .env | sed 's/.*=//')
PORT  := $(shell grep PORT .env | sed 's/.*=//')

LOG   := /var/log/sites/${NAME}.log


# -----------------------------------------------------------------------------

chk-env:
	@echo "    NAME |${NAME}|"
	@echo "    HOST |${HOST}|"
	@echo "    PORT |${PORT}|"

check:
	@echo
	@echo "Checking for App on port ${PORT}:"
	-netstat -anp | grep ${PORT}
	@echo

chown:
	chown -R www-data:www-data .

install:
	python3 -m pip install -r requirements.txt

setup:
	-ln env.template app/.env

ls:
	echo $(FILES)


# -----------------------------------------------------------------------------

lrun:
	uvicorn app.main:app --reload --host ${HOST} --port ${PORT}

start:
	nohup uvicorn app.main:app --reload --host ${HOST} --port ${PORT} 2>&1 > ${LOG} &
	@sleep 2
	netstat -anp | grep ${PORT}
	tail -10 ${LOG}


stop:
	./kill.sh


# -----------------------------------------------------------------------------

