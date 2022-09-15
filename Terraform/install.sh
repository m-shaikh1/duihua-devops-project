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

    # create ansible-playbook:
    # takes a long time to open page
    # git clone https://<Token>:x-oauth-basic@github.com/Sudos-Team/DuiHua.git
    # Token:select the scope Repo – Full Control

    git clone https://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:x-oauth-basic@github.com/Sudos-Team/DuiHua.git
    cd DuiHua/Ansible-Playbooks
    ansible-playbook jenkins-mvn-jdk-playbook.yml
    ansible-playbook pip-awscli-playbook.yml