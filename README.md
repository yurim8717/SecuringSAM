The files structure:

Terraform folder:
1. elb.tf - create load balancer in Azure
2. instances.tf - create an AWS instance that will be accessible behind elb
3. provider.tf - set the environment provider to AWS
4. security-groups.tf - security groups rule that allows traffic via port 80 to the instance
5. variables.tf - list of variables for the terraform setup
6. vpc.tf - create vpc, public subnet, private subnet, internet gateway and route table with rules

Python folder:
primenumberapp.py - small application that checks if number input from user is a primary number
requirements.txt - list of existing dependencies required for installation to run the primenumberapp program
dockerfile - required commands to run the docker image creation

Root folder:
buildandpush.yml - YAML file to build and push the dockerfile (containing the python program) to a docker registry in azure
build and push to container registry.png - screenshot of the settings in azuure build pipeline for the build and push to docker registry stage
