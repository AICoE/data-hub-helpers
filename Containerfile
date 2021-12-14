FROM registry.fedoraproject.org/fedora-toolbox:35

RUN dnf install -y gcc openldap-devel python3-devel python3-pip
RUN pip install pipenv
COPY Pipfile Pipfile.lock config.yaml /usr/local/src/

WORKDIR /usr/local/src/
RUN pipenv install --system --deploy

COPY scripts/* /usr/local/bin/
RUN chmod -R +x /usr/local/bin

CMD /usr/bin/bash
