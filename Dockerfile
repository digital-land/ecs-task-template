# syntax=docker/dockerfile:1

FROM python:3.8-slim-bookworm
WORKDIR /
RUN apt-get update
RUN apt-get upgrade -y

COPY requirements/requirements.txt /requirements.txt
RUN pip install --upgrade pip
RUN pip install --upgrade -r requirements.txt

COPY task /task
# USER task
# RUN chown task:task -R /task

WORKDIR /task

ENTRYPOINT ["sh","./run.sh"]