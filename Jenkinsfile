pipeline {
    agent any
    environment {
        AWS_ACCESS_KEY_ID     = credentials('aws-terraform-user_USR')
        AWS_SECRET_ACCESS_KEY = credentials('aws-terraform-user_PSW')
    }
    stages {
        stage('Terraform Start') {
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
