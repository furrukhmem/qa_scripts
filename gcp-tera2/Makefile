SHELL := /bin/bash
VAR_DIR = "variables"
TERRAFORM_APPLY = "terraform apply -auto-approve -var-file="
TERRAFORM_DESTROY = "terraform destroy -auto-approve -var-file="

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
	@"${TERRAFORM_APPLY}${VAR_DIR}"/poolmanger.tfvars
	@"${TERRAFORM_APPLY}${VAR_DIR}"/poolmangerapi.tfvars
	@"${TERRAFORM_APPLY}${VAR_DIR}"/poolmangerdb.tfvars

pool-destroy:
	@"${TERRAFORM_DESTROY}${VAR_DIR}"/poolmanger.tfvars
	@"${TERRAFORM_DESTROY}${VAR_DIR}"/poolmangerapi.tfvars
	@"${TERRAFORM_DESTROY}${VAR_DIR}"/poolmangerdb.tfvars

.PHONY = terraform-init jenkins-apply jenkins-destroy python-systemd-http-server-apply python-systemd-http-server-destroy pool-install pool-destroy
