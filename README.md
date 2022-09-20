# Project Description 

The project is designed to provision a Sonarqube and MySql server using Docker Containers to be used in this Module.
- it uses Terraform Scripts as infrastructure as a code (IaC) to create:

  - EC2 instance
  - VPC  
  - S3 bucket
  - ElasticBeanstalk on high-availability infrastructure (Load Balancer)
  - CloudFront
  
  The project will host the maven application that is tested, scanned using Sonarqube, and built using Jenkins pipeline as a CI/CD tool.
  
  
# Architecture-diagram
![architecture-diagram](https://user-images.githubusercontent.com/55548241/190977085-22105029-e22e-4236-a3f1-0cf1e686bba8.png)

# Terraform structure
```
  .
  └── Terraform
    ├── install.sh
    ├── main.tf
    ├── outputs.tf
    ├── variables.tf
    ├── modules
         ├── aws-ec2
         │   ├── main.tf
         │   ├── outputs.tf
         │   └── variables.tf
         ├── aws-ec2-key
         │   ├── main.tf
         │   ├── outputs.tf
         │   └── variables.tf
         ├── aws-elasticbeanstalk-cloudfront
         │   ├── main.tf
         │   ├── outputs.tf
         │   └── variables.tf
         ├── aws-s3bucket
         │   ├── main.tf
         │   ├── outputs.tf
         │   └── variables.tf
         └── aws-vpc
            ├── main.tf
            ├── outputs.tf
            └── variables.tf
```



# Step by Step Guide 
to run this deployment pipline follow this steps:

  To clone a specific branch:

  ```
  git clone --branch <branch> <remote_repo_url>
  ```

  - add the deployment pipline files in youre project 
  
    - ![image](https://user-images.githubusercontent.com/55548241/190960574-9fa70867-9e50-4f5e-b312-8232e7d23ec8.png)

    - ![Screenshot 2022-09-19 093436](https://user-images.githubusercontent.com/55548241/190961385-b9d9e7be-ba9c-4b8c-8dc3-9cb61c2443d5.png)

  - Add the `.gitignore` file content in this repository to the `.gitignore` file in your project
    - ![image](https://user-images.githubusercontent.com/55548241/190961658-64b7b6f2-ba4c-4850-9858-9c93be3c325e.png)

  - search for /// and fill the necessary changes which are :
    - S3  bucket name 
    - ![Screenshot 2022-09-19 115443](https://user-images.githubusercontent.com/55548241/190982729-34b9e7dc-f33f-4468-a03e-e813564fa396.png)

  - Run the next commands in main diectory:
     -  ``` terraform -chdir=Terraform init ```
      - ![Screenshot 2022-09-19 120256](https://user-images.githubusercontent.com/55548241/190984215-81341de0-29a3-4bb2-8a50-a638cff8f655.png)
      
     -  ``` terraform -chdir=Terraform plan ```
     
     - ``` terraform -chdir=Terraform apply```
      - ![Screenshot 2022-09-19 125708](https://user-images.githubusercontent.com/55548241/190993522-50181a81-c7f8-4adc-9b3d-0ad8b4fe4f17.png)
      
        - After the apply the Public public_ip of The EC2 instance will be printed in the Termianl
          -  ![Screenshot 2022-09-19 121134](https://user-images.githubusercontent.com/55548241/190985702-13c274e6-b2aa-4ea8-97d3-960faf1fba10.png)
     


      - **First: Change the `application.properties`**
        - we used a docker container image as our MySql Database 
          - go to `\src\main\resources\application.properties` and change the Database properties to 
            ```
            spring.mvc.view.prefix=/WEB-INF/
            spring.datasource.url=jdbc:mysql://public_ip:3306/mysql
            spring.datasource.username=mysql
            spring.datasource.password=mysql
            spring.jpa.hibernate.ddl-auto=create
            spring.mvc.hiddenmethod.filter.enabled=true
            ```
          - ![image](https://user-images.githubusercontent.com/55548241/190994056-b930ab4c-8d51-46d3-899f-152f160f7f1b.png)


        ---
    - **Secound: SonarQube**
      - go to public_ip:9000 which will open the SonarQube Login page
        - ![image](https://user-images.githubusercontent.com/55548241/190986501-b1139e06-28b0-4084-847e-004694b1f1ae.png)
        - Login as Admin
          - Username: admin
          - Passowrd: admin
          - ![image](https://user-images.githubusercontent.com/55548241/190986640-ce54a64e-7825-4e2e-a406-fdfde4356285.png)
       - Create a SonarQube Project 
         - ![image](https://user-images.githubusercontent.com/55548241/190986899-58710b69-563c-4a3a-9d8c-848e6f6b5c6d.png)
       - add the values in **Jenkinsfile** of youre project
          - ![Screenshot 2022-09-19 122141](https://user-images.githubusercontent.com/55548241/190987622-1029d506-2d65-4bc3-aa10-e0c6cfe71e19.png)
        
       - push it to youre git-hub Repository 
        
      ---
      
    - **Third: Jenkins server**
      - ssh into the aws EC2 instance and run
        ```
        sudo cat /var/lib/jenkins/secrets/initialAdminPassword
        ```
        - ![2022-09-19 (20)](https://user-images.githubusercontent.com/55548241/190996462-fe76e142-1d3c-4421-9af7-41a78fb93a4f.png)
      - copy the password and set up Jenkins at public_ip:8080
        - ![image](https://user-images.githubusercontent.com/55548241/190988934-949e6835-0038-4687-bde8-35886ff30735.png)
        - ![image](https://user-images.githubusercontent.com/55548241/190989158-240489b2-f662-4405-9559-aa6686d5bf2c.png)

      - Jenkins Credentials you need to run this project:
        - aws Credentails
          - add aws Credentails with these ID in Jenkins server:
             - jenkins-access-key-id
             - jenkins-secret-access-key
                - ![image](https://user-images.githubusercontent.com/55548241/190990068-a74e0114-2d97-4d65-a5ae-8bd5e6962f60.png)

        -  Git-hub App (if youre repository was private)
      
    - **Forth: Create a pipline in Jenkins**
       - set Your Git-hub Repository in it and Build it
         - ![image](https://user-images.githubusercontent.com/55548241/190990312-75bde35f-9f0b-4bff-9a7e-c940557f1267.png)
    ---
    
## ElasticBeanStalk:
 - ![image](https://user-images.githubusercontent.com/55548241/190992052-4b45e2c3-1e98-4121-90fd-824f41362ec9.png)
 
 - ![image](https://user-images.githubusercontent.com/55548241/190992239-a895a499-e17c-428e-b390-cf1fbfcaabb9.png)
 
 - ![image](https://user-images.githubusercontent.com/55548241/190992275-c03fc4ab-1393-4a8a-8857-b3f748a8ab78.png)
 
---

## CloudFront:
  - ![image](https://user-images.githubusercontent.com/55548241/190992637-ce42ca5d-260c-49a8-83d8-ec61e97e849d.png)
  - ![image](https://user-images.githubusercontent.com/55548241/190992694-ba7dc384-4b7a-46c6-8be2-e5d93c594310.png)
  - ![image](https://user-images.githubusercontent.com/55548241/190992737-4f3840af-004b-4cda-be1f-21b133becf00.png)
### The End .

# Contributors
### Sudos Team: 
1. [Mohammed Shaikh](https://github.com/m-shaikh1)
2. [Raghad Almutlaq](https://github.com/raghadmta)
3. [Aisha Alsubaie](https://github.com/Aishabs/)
4. [Roba Almehmadi](https://github.com/Robamohammed)
5. [Eman Alotaibi ](https://github.com/emanfeah)
