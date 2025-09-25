# Task-3-Terraform-Docker
Creating Container with terraform

Terraform + Docker IaC: Step-by-Step Workflow
Step 1: Install Docker
1. Download and install Docker Desktop (Windows) or install via package manager on Linux.
2. Verify installation:
docker --version
Step 2: Install Terraform
1. Install Terraform (Windows via Chocolatey or Linux via apt).
2. Verify installation:
terraform -v
Step 3: Create Project Folder
mkdir terraform-docker
cd terraform-docker
Step 4: Create Terraform Configuration (main.tf)
- Define the Docker provider.
- Pull the nginx Docker image.
- Create a Docker container using the image.
Example configuration:
terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.2"
    }
  }
}

provider "docker" {}

# Pull Docker image
resource "docker_image" "nginx" {
  name = "nginx:latest"
}

# Create container from image
resource "docker_container" "nginx_container" {
  name  = "my-nginx"
  image = docker_image.nginx.name   #  FIXED
  ports {
    internal = 80
    external = 8080
  }
}
Step 5: Run Terraform Commands
1. Initialize Terraform
terraform init
2. See what Terraform will do
terraform plan
3. Apply the configuration (create container)
terraform apply -auto-approve
4. Check running containers
docker ps
5. View Terraform-managed resources
terraform state list
6. Destroy infrastructure when done
terraform destroy -auto-approve
Step 6: Save Execution Logs
- Save logs to files:
terraform plan > plan.log
terraform apply -auto-approve > apply.log
terraform destroy -auto-approve > destroy.log
- Optional debug logging:
set TF_LOG=DEBUG
set TF_LOG_PATH=terraform-debug.log
terraform apply
Outcome:
- Docker container provisioned using Terraform.
- Learned IaC workflow: init  plan  apply  state  destroy.
- Infrastructure is fully automated and manageable declaratively. 
