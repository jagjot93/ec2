output "myec2" {
  value = "arn  = ${aws_instance.myec2.arn} and private_dns = ${aws_instance.myec2.private_dns}"
}

/*
output "myec2" {
  value = aws_instance.myec2 # this will output all the attributes associated with the aws ec2 instance type
}
*/

/*
output "myec2" {
  value = aws_instance.myec2.arn # this will output only the 'arn' attribute associated with the aws ec2 instance type
}
*/
