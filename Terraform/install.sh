#!/bin/sh

    # install ansible:
    sudo apt update -y
    sudo apt install -y software-properties-common 
    sudo apt-add-repository --yes --update ppa:ansible/ansible
    sudo apt install -y ansible

    # install Docker:
    sudo apt install docker docker.io -y 
    sudo usermod -aG docker ${USER}
    newgrp docker
   
    # sonarqube
    docker container run -d -p 9000:9000 --name sonarserver sonarqube:8.2-community

    # MySql Database
    docker run  --name mysql -e MYSQL_ROOT_PASSWORD=mysql -e MYSQL_USER=mysql -e MYSQL_DATABASE=mysql -e MYSQL_PASSWORD=mysql -d -p 3306:3306 mysql
    
    # install Terraform
    sudo apt-get update && sudo apt-get install -y gnupg software-properties-common
    wget -O- https://apt.releases.hashicorp.com/gpg | \
    gpg --dearmor | \
    sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg
    gpg --no-default-keyring \
    --keyring /usr/share/keyrings/hashicorp-archive-keyring.gpg \
    --fingerprint
    echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] \
    https://apt.releases.hashicorp.com $(lsb_release -cs) main" | \
    sudo tee /etc/apt/sources.list.d/hashicorp.list
    sudo apt update -y
    sudo apt-get install terraform

    # Clone the git hub repository for cloudfront implementation and running playbooks
    git clone https://github.com/m-shaikh1/duihua-devops-project.git 
    cd duihua-devops-project/Ansible-Playbooks
    ansible-playbook jenkins-mvn-jdk-playbook.yml
    ansible-playbook pip-awscli-playbook.yml