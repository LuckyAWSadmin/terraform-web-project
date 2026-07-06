#!/bin/bash

yum update -y

yum install httpd -y

systemctl enable httpd
systemctl start httpd

cat <<EOF > /var/www/html/index.html
<h1>Hello Laxman !!</h1>
<h2>Terraform + GitHub Actions Demo</h2>
EOF