# Contributing

## Develop

To run this project in development mode, you will need the following requirements:

* [Python 3.10](https://www.python.org/downloads/release/python-3100/)
* [Pipenv](https://pipenv.pypa.io/en/latest/)

Once installed, you just need to run the following commands:

```bash
pipenv install
pipenv shell

python3 [path_to_script]
```

## Troubleshooting

If you face issues installing the library `python-ldap`, just run the following command to install the required dependencies:

**Debian/Ubuntu:**

`sudo apt-get install libsasl2-dev python-dev libldap2-dev libssl-dev`

**RedHat/CentOS:**

`sudo yum install python-devel openldap-devel`