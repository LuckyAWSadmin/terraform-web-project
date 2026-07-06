
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


dir -force
git status
git agg .
git add .
git status
git commit -m "Initial Terraform website deployment"
git status
git remote -v
git remote add origin git@github.com:LuckyAWSadmin/LuckyAWSadmin.git
git remote -v
git remote remove origin
git remote -v
git remote add origin git@github.com:LuckyAWSadmin/terraform-web-project.git
clear
git remote -v
ssh -T git@github.com
dir $HOME\.ssh
ssh-keygen -t ed25519 -C "lucky.patil92@gmail.com"
Get-Content $HOME\.ssh\id_ed25519.pub
ssh -T git@github.com
clear
ssh -T git@github.com
Get-Content $HOME\.ssh\id_ed25519.pub
git status
clear
git status
dir
clear
git status
git log --oneline
git push -u origin master
git pull origin master
vim .\variables.tf
git status
git add --all
git status
git commit -m "remove profile variables from providers"
git status
git push origin master







