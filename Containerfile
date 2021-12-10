FROM registry.fedoraproject.org/fedora-toolbox:35

RUN dnf install -y python3-pip
RUN pip install pipenv
COPY Pipfile Pipfile.lock /usr/local/src/

WORKDIR /usr/local/src/
RUN pipenv install --system --deploy

COPY scripts/* /usr/local/bin/
RUN chmod -R +x /usr/local/bin

CMD /usr/bin/bash
