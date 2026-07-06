
Project - Terraform + Githib+ AWS

Your Laptop
     │
     │ git push
     ▼
┌──────────────────┐
│  GitHub Repo     │
│ terraform-web    │
└─────────┬────────┘
          │
          │ Push Event
          ▼
┌──────────────────┐
│ GitHub Actions   │
├──────────────────┤
│ terraform fmt    │
│ terraform validate
│ terraform plan   │
│ terraform apply  │
└─────────┬────────┘
          │
          ▼
┌──────────────────┐
│ AWS Sandbox      │
├──────────────────┤
│ Security Group   │
│ EC2              │
│ Apache           │
│ Website          │
└──────────────────┘






Fianal Architecture
┌─────────────────┐
│  GitHub Repo    │
│ terraform-web   │
└────────┬────────┘
         │ git push
         ▼
┌─────────────────┐
│ GitHub Actions  │
│ validate        │
│ plan            │
│ apply           │
└────────┬────────┘
         │
         ▼
┌────────────────────────┐
│ AWS Account            │
│                        │
│  Security Group        │
│         │              │
│         ▼              │
│      EC2 Instance      │
│         │              │
│     Apache/Nginx       │
│         │              │
│      index.html        │
│         │              │
│ "Hello Laxman"         │
│ "Terraform + GitHub"   │
└────────────────────────┘


Terraform build Locally and Successfully launch Website--

Created -terraform-web-project Repository on Github 




We usually commit:
main.tf
variables.tf
outputs.tf
user_data.sh
.gitignore
README.md

We DO NOT commit:
.terraform/
terraform.tfstate

so we created .gitignore




How should authentication work?

How should state be managed?

How should multiple environments work?

How should teams collaborate?



Created -Identity providers -in IAM

Created -Role - AdminRole-for-github  




Edited Trust policy - of -Identity providers 
sts.amazonaws.com and LuckyAWSadmin/terraform-web-project


{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Principal": {
                "Federated": "arn:aws:iam::617292774228:oidc-provider/token.actions.githubusercontent.com"
            },
            "Action": "sts:AssumeRoleWithWebIdentity",
            "Condition": {
                "StringEquals": {
                    "token.actions.githubusercontent.com:aud": "sts.amazonaws.com"
                },
                "StringLike": {
                    "token.actions.githubusercontent.com:sub": "repo:LuckyAWSadmin/terraform-web-project:*"
                }
            }
        }
    ]