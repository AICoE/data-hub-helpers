# Data Hub Helpers

Scripts for automation of toil

## Usage

We have created a data-hub-helpers toolbox image to simplify the dependency aspect of these scripts.
To enter the toolbox, you just need to run the following:

1. `toolbox create --image quay.io/internaldatahub/data-hub-helpers:<tag>`
2. `toolbox enter data-hub-helpers-<tag>`

This will allow you to call scripts from any location on your local machine.

---

:warning: The repository in Quay is private, so you will need to be logged in/added to the correct team on Quay

---

## Scripts

### approval-check

`approval-check` determines if a given user is allowed to access Telemetry data.

Example call: `approval-check <kerberos_id>`

### trino-acl

`trino-acl` downloads the latest acl file from github and modifies it according to the passed arguments.
It writes to `new-trino-config-secret.yaml` in your current directory. This file can be used to raise a PR to the internal-data-hub repo. The script currently does not check for existing duplicate items, so be careful when adding new acl rules.

Example create call: `trino-acl -a create -c schemas -u user -n test -r foo`
Example delete call: `trino-acl -a delete -c tables -u group -n cost-management -r costmgmt`
Example update call: `trino-acl -a update -c schemas -f schema -s jdbc  -g group -t new-group`
Example update call: `trino-acl -a update -c tables -f schema -s telemetry  -g group -v grokket -t new-grokket`

For a full list of arguments, refer to the `--help` output

## Releasing New Versions of the Toolbox

To build the image, run through the following steps:

1. `sops -d config.enc.yaml > config.yaml`
2. `podman build . -t quay.io/internaldatahub/data-hub-helpers:<latest_tag+1>`
3. `podman push quay.io/internaldatahub/data-hub-helpers:<latest_tag+1>`
