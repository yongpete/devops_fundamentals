pipeline {
    agent any
    stages{
        stage('checkout'){
            steps {
                sh 'rm -rf ./*'
                sh 'git clone https://github.com/yongpete/devops_fundamentals'
                sh 'cd ./devops_fundamentals && git checkout feature/jenkins'
            }
        }
        stage('Confirm') {
            steps {
                sh 'echo git repo cloned successfully'
            }
        }
        
        stage('Terraform init') {
            steps {
                sh 'cd ./devops_fundamentals/terraform_handson && terraform init'
            }
        }
        
        stage('Terraform validate') {
            steps {
                sh 'cd ./devops_fundamentals/terraform_handson && terraform validate'
            }
        }
        
        // stage('Terraform plan') {
        //     steps {
        //         sh 'cd ./devops_fundamentals/terraform_handson && terraform plan -var-file="terraform.tfvars"'
        //     }
        // }
    }
}