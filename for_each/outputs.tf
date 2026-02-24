output "ec2_output"{            # we need to see the output to create r53 records
    value  = aws_instance.roboshop_instance  
}