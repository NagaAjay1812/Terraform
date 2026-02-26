# Terraform
Terraform is responsible for managing infrastructure using the state file.
It ensures that the desired infrastructure matches the actual infrastructure.
Whatever resources we define in .tf files, Terraform will create, update, or delete them accordingly.

# conditions
Conditions in Terraform use the ternary expression format:
expression ? "true-value" : "false-value"
ex: instance_type = var.environment = "dev" ? "t3.micro" : "t3.small"

# count
Its suitable for list, it will allow duplicates and preserve order.
Terraform provides a special variable called count.index during iteration.

# each
Its suitable for map or set, it doesn't not allow duplicates & will not follow order.
Terraform provides special variables: each.key and each.value

# dynamic
In Terraform, a dynamic block is used when we want to create multiple repeated nested blocks (like ingress rules) using loops.

# data_sources
it is used to retrive the information from proiders

# state file
State file is memory for the terraform, it stores information about all the resources that are created, updated, or deleted. 

# remote state 
state file is stored in s3 bucket, so we can prevent error and duplicates and it should be locked parallel modification should not be allowed.
The parameter use_lockfile = true enables state locking.

# locals
locals are like variables but extra capabilities
* you can refer other variables inside the locals.
* the values can't overriden inside the locals.
* functions and expression can store in locals.
what we achieved here is readability