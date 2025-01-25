# Node.js ToDo App Deployment with Ansible and GitHub Actions

This repository automates the deployment of the [Node.js ToDo App](https://github.com/scotch-io/node-todo) using **Ansible** and **AWS**. It integrates **ECR** (Elastic Container Registry) and **ECS** (Elastic Container Service) to run the application in a containerized environment. The deployment process is automated using **GitHub Actions**.

---

## Features

- Fully automated deployment with **Ansible**.
- Dockerized application stored in **AWS ECR**.
- Application deployed on **AWS ECS (Fargate)**.
- CI/CD pipeline managed via **GitHub Actions**.

---

## Repository Structure

```bash
.
├── playbooks/
│   ├── main.yml                   # Main Ansible playbook
│   ├── tasks/
│   │   ├── prerequisites.yml      # Ensures required tools and environment are ready
│   │   ├── create_security_group.yml # Creates the AWS security group
│   │   ├── create_iam_role.yml    # Creates ECS Task Execution Role
│   │   ├── create_ecr.yml         # Creates an AWS ECR repository
│   │   ├── build_push_ecr.yml     # Builds and pushes Docker image to ECR
│   │   ├── deploy_ecs.yml         # Configures ECS cluster and service
├── node-todo-app/                 # Node.js application directory
│   ├── Dockerfile                 # Docker configuration for the app
│   ├── package.json               # Node.js project dependencies
│   ├── package-lock.json          # Exact dependency versions
│   ├── server.js                  # Main server file for the app
├── .github/                       # GitHub Actions workflow directory
│   ├── workflows/
│   │   ├── deploy.yml             # Workflow for automated deployment
├── vars/
│   ├── vars.yml                   # Centralized variables for deployment
├── README.md                      # Documentation
```

**Explanation of Key Files and Directories**

1. playbooks/
This directory contains Ansible playbooks and modular task files:

- main.yml: The main playbook that coordinates the deployment process.
- tasks/: Contains modular tasks to handle specific parts of the deployment, such as:
- Setting up prerequisites (provision_env.yml).
- Creating AWS resources like security groups and ECR (create_security_group.yml, create_ecr.yml).
- Building and pushing the Docker image (build_push_ecr.yml).
- Deploying the app to ECS (deploy_ecs.yml).

2. node-todo-app/
The Node.js application directory:

- Dockerfile: Defines how the Docker image is built.

3. .github/
This directory contains the GitHub Actions workflows:

- deploy.yml: Automates the deployment process by running Ansible playbooks when changes are pushed to the repository 
or manually triggered.

**Deployment Options**

1. Local Deployment with Ansible
Run the Ansible playbook locally to deploy the app:
```bash
ansible-playbook playbooks/main.yml
```
This will:

Create the necessary ECR repository.
Build and push the Docker image.
Deploy the app to an ECS Fargate cluster.

2. CI/CD Deployment with GitHub Actions
The GitHub Actions workflow is triggered automatically on:

Pushes to the main branch.
Manual triggers via the GitHub Actions interface.
To manually trigger the workflow:

Go to Actions in the GitHub repository.
Select the Deploy Node.js App with Ansible workflow.
Click Run workflow.
