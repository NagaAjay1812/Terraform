variable "common_tags"{
    type = map
    default = {
        Project = "roboshop",
        terraform = "true",
        environment = "dev"
    }
}

variable "ec2_tags"{
    default = {
        Name = "terraform",
        environment = "qa"

    }
}
variable "sg_tags"{
    default = {
        Name = "terraform_sg",
        environment = "qa"

    }
}

