pipeline {
    agent any
    environment {
        AWS_ACCESS_KEY_ID     = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
    }
    stages {
        stage('Terraform Plan') {
            steps {
                sh 'pwd; cd /usr/bin/terraform/; terraform init'
                sh 'pwd; cd /usr/bin/terraform/; terraform validate'
                sh 'pwd; cd /usr/bin/terraform/; terraform plan'
            }
        }
        stage('Terraform Apply') {
            steps {
                sh 'pwd; cd /usr/bin/terraform/; terraform apply -auto-approve'
            }
        }
    }
}
