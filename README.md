# Introduction
This repo shows an show an example file/folder structure you can use with terragrunt. It shows you how you can deploy mysql in multiple environments without duplicating any of the Terraform code that is because we are using modules and providing the right input variables in terragrunt.hcl.

Please note I have made an assumption `mysql module` is already checked in to your `git repo`. The purpose here is to make you aware of the power of terragrunt where you can use private or public urls for downloading modules instead of adding everything in one repo. When I started terraform I made blunders but then I eventually learnt to follow few best practices :). If you want to now more about terragrunt please bookmark this https://terragrunt.gruntwork.io.

## How do you deploy the infrastructure in this repo?

### Pre-requisites
1. Install [Terraform](https://www.terraform.io/) version `0.12.0` or newer and
   [Terragrunt](https://github.com/gruntwork-io/terragrunt) version `v0.23.0` or newer.
2. Update the `bucket` parameter in `mars-non-prod/terragrunt.hcl` to something unique. The one I am using is pretty generic, you can also look into adding custom prefix while naming.
3. Configure your AWS credentials. we use `aws_azure_login`

### Deployment
1. `cd` into the module's folder (e.g. `cd mars-non-prod/ap-southeast-2`). `Mars` is the name of my client.
2. Run `terragrunt plan` to see the changes you're about to apply.
3. If the plan looks good, run `terragrunt apply`.

## Terraform States
Terragrunt follow inheritence for storing states. That means you define the state configs once and all the child modules inherits them. (Sounds easy right). 
