FROM alpine:3.8

EXPOSE 2525
#"mb", "--pidfile", "/tmp/mb.pid", "--logfile", "/tmp/mb.log"
CMD ["mb", "--configfile", "/tmp/perf_sven_auth0/imposters.ejs", "--allowInjection",  "--logfile", "/var/log/mb_auth0.log", "--port", "6105" ]

ENV NODE_VERSION=8.14.0-r0

RUN apk update \
 && apk add --no-cache nodejs=${NODE_VERSION} \
 && apk add --no-cache npm=${NODE_VERSION}

ENV MOUNTEBANK_VERSION=1.15.0

RUN cd /usr/lib/node_modules; npm install -g mountebank@${MOUNTEBANK_VERSION} --production \
 && npm cache clean --force 2>/dev/null \
 && rm -rf /tmp/npm* \
 && npm install xml2js \
 && npm install dateformat \
 && npm install node-uuid \
 && npm install url \
 && npm install sax \
 && npm install xmlbuilder

RUN mkdir /tmp/perf_sven_auth0
RUN mkdir /tmp/perf_sven_auth0/auth0

COPY ./auth0/* /tmp/perf_sven_auth0/auth0/
COPY ./imposters.ejs /tmp/perf_sven_auth0/imposters.ejs
