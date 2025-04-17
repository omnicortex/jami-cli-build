FROM python:3.12-bookworm

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        gnupg dirmngr ca-certificates curl \
        dbus libdbus-1-dev libglib2.0-dev libcairo2-dev libgirepository1.0-dev

RUN apt-get install -y python3-gi python3-gi-cairo gir1.2-gtk-4.0

COPY requirements.txt .
RUN pip3 install jami-commander==0.8.0 -r requirements.txt

# Clean up to reduce image size
RUN apt-get clean && \
    rm -rf \
        /var/lib/apt/lists/* \
        /tmp/* \
        /var/tmp/*
