FROM wernight/phantomjs:latest

USER root

RUN apt-get -y update && apt-get -y install --no-install-recommends curl && rm -rf /var/lib/apt/lists/*

WORKDIR /usr/src/app
COPY . .

ENV INTERVAL 3600

CMD [ "./loop.sh" ]
