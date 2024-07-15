## Terraform: How to run templates

### Getting Started
## Cloning CodeCommit Repo

You can install Git followign the instructions [here](https://www.atlassian.com/git/tutorials/install-git).
Use git credentials provided in the assignment email to clone the CodeCommit repository.

**Important for Mac Users:**
If running `git clone` command below results in *Unable to access: 403* error, follow this [link](https://stackoverflow.com/questions/34517534/running-git-clone-against-aws-codecommits-gets-me-a-403-error) to troubleshoot Keychain Access issue.

```shell
git clone https://git-codecommit.us-west-2.amazonaws.com/v1/repos/onica-careers-ce-candidates

cd onica-careers-ce-candidates/tf/ce_express
```

## Pre-requisite to run Terraform

The scripts were created using Terraform 0.12.

You can install Terraform following the instructions [here](https://learn.hashicorp.com/terraform/getting-started/install).

Once you have Terraform installed successfully, you should configure the [AWS Credentials](https://www.terraform.io/docs/providers/aws/index.html)

We encourage you to use any other Vault tool for example the Opensource [AWS Vault](https://github.com/99designs/aws-vault)

### Deployment

The project should be created in the following order:

1. networking
2. web_server

To execute Terraform you should run the commands below.
First run from ```networking``` and then from ```web_server_[linux,windows]``` subfloder of ```ce_express``` folder.

```shell
terraform init
terraform plan
terraform apply
```

### Commits

**Make regular commits to remote repo as it will be used to evaluate the candidate's performance.**

## Clean Up
When you are done ***(everything tested)***, run for each folder:

```shell
terraform destroy
```

But now in this order:

1. web_server
2. networking

## Submitting the Test

Upon completing the assignment, do the following to submit it:

1. Clone the latest version of CodeCommit repository that has all your changes
2. ZIP the cloned repository including all relevant files.
3. Email a compressed copy of your repo in a reply back to the Rackspace HR email you previously received.   Indicate in this email that your assignment has been submitted.