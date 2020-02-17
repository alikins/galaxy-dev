
FROM fedora:31

ENV PYTHONUNBUFFERED=1

RUN dnf install -y nodejs git git-core \
    && dnf clean all

COPY ansible-hub-ui/ /code/ansible-hub-ui/

WORKDIR /code/ansible-hub-ui/
RUN npm install

CMD npm run start
