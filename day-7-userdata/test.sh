#!/bin/bash
yum update -y
yum install httpd -y
systemctl start httpd 
systemctl enable httpd 
echo "<h1>Welcome to Naresh IT ! AWS Infra created using Terraform in us-east-1 Region</h1>"> /var/www/html/index.html
