
FROM fedora:29

ENV PYTHONUNBUFFERED=1 \
    LANG=en_US.UTF-8

RUN dnf update -y && \
        dnf install -y nodejs git git-core && \
        dnf clean all

COPY ansible-hub-ui/ /code/ansible-hub-ui/

WORKDIR /code/ansible-hub-ui/
RUN npm install

CMD npm run start
