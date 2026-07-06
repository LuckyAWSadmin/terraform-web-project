
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