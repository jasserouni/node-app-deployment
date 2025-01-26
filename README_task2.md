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
│   ├── main.yml    
│   ├── destroy_app.yml
│   ├── inventory.yml              
│   ├── tasks/
│   │   ├── configure_acm.yml
│   │   ├── security_groups.yml
│   │   ├── create_iam_role.yml
│   │   ├── create_ecr.yml
│   │   ├── build_push_ecr.yml
│   │   ├── deploy_ecs.yml
│   │   ├── configure_route53.yml
│   │   ├── create_alb.yml
│   │   ├── generate_key_pairs.yml
├── node-todo-app/
│   ├── Dockerfile                 
│   ├── package.json               
│   ├── package-lock.json          
│   ├── server.js                  
├── .github/                       
│   ├── workflows/
│   │   ├── ansible_deploy.yml  
│   │   ├── ansible_destroy.yml          
```

**Explanation of Key Files and Directories**

1. playbooks/
This directory contains Ansible playbooks and modular task files:

- main.yml: The main playbook that coordinates the deployment process.
- tasks/: Contains modular tasks to handle specific parts of the deployment, such as:

2. node-todo-app/
The Node.js application directory:

- Dockerfile: Defines how the Docker image is built.

3. .github/
This directory contains the GitHub Actions workflows:

- deploy.yml: Automates the deployment process by running Ansible playbooks when changes are pushed to the repository 
or manually triggered.

**Deployment**

CI/CD Deployment with GitHub Actions
This workflow is responsible for creating the AWS resources required for the application:

- VPC and networking components.
- ECR repository.
- ECS cluster and task definitions.
- Load Balancer and target groups.
- ACM.
- Route53.

The GitHub Actions workflow is triggered automatically on:

Pushes to the main branch.
Manual triggers via the GitHub Actions interface.
To manually trigger the workflow:

Go to Actions in the GitHub repository.
Select the Deploy Node.js App with Ansible workflow.
Click Run workflow.
