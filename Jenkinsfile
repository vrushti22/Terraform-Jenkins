pipeline {
    agent any
    environment {
        AWS_ACCESS_KEY_ID     = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
    }
    stages {
        stage('checkout'){
            steps{
                        git branch:main , url:"https://github.com/vrushti22/Terraform-Jenkins.git"
                    }
                }
        stage('Terraform Plan') {
            steps {
                sh 'terraform init'
                sh 'terraform validate'
                sh 'terraform plan'
            }
        }
        stage('Terraform Apply') {
            steps {
                sh 'terraform apply -auto-approve'
            }
        }
    }
}
