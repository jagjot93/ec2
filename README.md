**Terraform version**

[root@ip-172-31-16-187 terraform]# terraform version
Terraform v1.0.0
on linux_amd64
+ provider registry.terraform.io/hashicorp/aws v3.75.0

Your version of Terraform is out of date! The latest version
is 1.1.7. You can update by downloading from https://www.terraform.io/downloads.html




**The Key pair 'terraform' was manually created using the console and only passed in the 'ec2.tf' file.**

**We have imported the VPC and subnet into the terraform using the commands below:**

[root@ip-172-31-16-187 terraform]# terraform init

Initializing the backend...

Initializing provider plugins...
- Reusing previous version of hashicorp/aws from the dependency lock file
- Installing hashicorp/aws v3.75.0...
- Installed hashicorp/aws v3.75.0 (signed by HashiCorp)

Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.
[root@ip-172-31-16-187 terraform]#
[root@ip-172-31-16-187 terraform]# terraform import aws_vpc.main vpc-0202c5688c5675d39
aws_vpc.main: Importing from ID "vpc-0202c5688c5675d39"...
aws_vpc.main: Import prepared!
  Prepared aws_vpc for import
aws_vpc.main: Refreshing state... [id=vpc-0202c5688c5675d39]

Import successful!

The resources that were imported are shown above. These resources are now in
your Terraform state and will henceforth be managed by Terraform.

[root@ip-172-31-16-187 terraform]#


[root@ip-172-31-16-187 terraform]# terraform import aws_subnet.subnet1 subnet-0efc6817d03adb31f
aws_subnet.subnet1: Importing from ID "subnet-0efc6817d03adb31f"...
aws_subnet.subnet1: Import prepared!
  Prepared aws_subnet for import
aws_subnet.subnet1: Refreshing state... [id=subnet-0efc6817d03adb31f]

Import successful!

The resources that were imported are shown above. These resources are now in
your Terraform state and will henceforth be managed by Terraform.



**After importing, if we destroy using terraform, it would destory the instance, the netwokr interface, the VPC and the subnet itself. Hence, manually terminated the instance**
