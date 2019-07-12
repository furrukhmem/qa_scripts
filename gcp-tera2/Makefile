SHELL := /bin/bash
VAR_DIR = "variables"
TERRAFORM_APPLY = "terraform apply -auto-approve -var-file="
TERRAFORM_DESTROY = "terraform destroy -auto-approve -var-file="

tera apply -auto-approve -var-file=./variables/poolmangerapi.tfvars -target=google_compute_instance.api
tera apply -auto-approve -var-file=./variables/poolmangerdb.tfvars -target=google_compute_instance.db
tera apply -auto-approve -var-file=./variables/poolmangerui.tfvars -target=google_compute_instance.ui

terraform-init:
	@terraform init

jenkins-apply:
	@"${TERRAFORM_APPLY}${VAR_DIR}"/jenkins.tfvars

jenkins-destroy:
	@"${TERRAFORM_DESTROY}${VAR_DIR}"/jenkins.tfvars

python-systemd-http-server-apply:
	@"${TERRAFORM_APPLY}${VAR_DIR}"/python-systemd-http-server.tfvars

python-systemd-http-server-destroy:
	@"${TERRAFORM_APPLY}${VAR_DIR}"/python-systemd-http-server.tfvars

pool-install:
	@"${TERRAFORM_APPLY}${VAR_DIR}"/poolmangerapi.tfvars -target=google_compute_instance.api
	@"${TERRAFORM_APPLY}${VAR_DIR}"/poolmangerdb.tfvars -target=google_compute_instance.db
	@"${TERRAFORM_APPLY}${VAR_DIR}"/poolmangerui.tfvars -target=google_compute_instance.ui
	terraform apply -auto-approve -target=google_compute_firewall.default

pool-destroy:
	@"${TERRAFORM_DESTROY}${VAR_DIR}"/poolmangerui.tfvars -target=google_compute_instance.ui
	@"${TERRAFORM_DESTROY}${VAR_DIR}"/poolmangerapi.tfvars -target=google_compute_instance.api
	@"${TERRAFORM_DESTROY}${VAR_DIR}"/poolmangerdb.tfvars -target=google_compute_instance.db
	terraform destroy -auto-approve -target=google_compute_firewall.default

.PHONY = terraform-init jenkins-apply jenkins-destroy python-systemd-http-server-apply python-systemd-http-server-destroy pool-install pool-destroy
