FROM fedora:29

RUN dnf install -y nodejs \
    && dnf -y clean all

COPY insights-proxy/ /code/insights-proxy/

WORKDIR /code/insights-proxy/

RUN npm install

# COPY ./certs /certs
# COPY ./ssl /ssl

# COPY ./spandx.config.js /spandx.config.js

CMD npm run start
# CMD [ "/usr/bin/node", "/node_modules/spandx/app/cli.js" ]
