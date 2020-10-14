locals {
  environment_vars = read_terragrunt_config(find_in_parent_folders("env.hcl"))
  env              = local.environment_vars.locals.environment
}

include {
  path = find_in_parent_folders()
}
terraform {
  source = "git::ssh://git@${get_env("GITHUB_URL", "")}/mysql?ref=${get_env("MYSQL_TAG", "")}"
}

inputs = {
  name              = "mysql_${local.env}"
  instance_class    = "db.t2.micro"
  allocated_storage = 20
  storage_type      = "standard"
  master_username   = "admin"
}