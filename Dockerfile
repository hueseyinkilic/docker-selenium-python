FROM python:3.8-alpine3.10

# update apk repo
RUN echo "https://dl-4.alpinelinux.org/alpine/v3.10/main" >> /etc/apk/repositories && \
    echo "https://dl-4.alpinelinux.org/alpine/v3.10/community" >> /etc/apk/repositories

# install chromedriver
RUN apk update
RUN apk add chromium chromium-chromedriver
# upgrade pip
RUN pip install --upgrade pip

# install selenium
RUN pip install selenium

RUN mkdir -p /app
WORKDIR /app
COPY docker-script.py /app

ENTRYPOINT docker-script.py