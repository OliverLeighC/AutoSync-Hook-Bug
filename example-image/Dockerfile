FROM --platform=linux/amd64 postgres:13
ENV POSTGRES_PASSWORD asupercoolpassword

ENV FlywayVersion="8.0.3"

RUN apt-get update
RUN apt-get install -y curl
RUN curl -sL https://deb.nodesource.com/setup_12.x | bash
RUN apt-get install -y nodejs
RUN apt-get install -y wget
RUN apt-get install -y netcat
RUN apt-get clean

WORKDIR /scripting
COPY ./postgres/staged/ ./
COPY ./migrations/ ./migrations/

WORKDIR /scripting/schema-baselining
RUN rm -rf node_modules
RUN npm i

WORKDIR /flyway
RUN wget -qO- https://repo1.maven.org/maven2/org/flywaydb/flyway-commandline/$FlywayVersion/flyway-commandline-$FlywayVersion-linux-x64.tar.gz | tar xvz && ln -s `pwd`/flyway-$FlywayVersion/flyway /usr/local/bin 

WORKDIR /scripting
# https://github.com/docker-library/postgres/issues/404
ENV PGDATA /var/lib/postgresql/data-novol
RUN "./setup.sh"

HEALTHCHECK --interval=30s --retries=4 CMD nc -z localhost 5432 || exit 1