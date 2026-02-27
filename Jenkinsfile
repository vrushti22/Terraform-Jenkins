pipeline {
    agent any
    environment {
        AWS_ACCESS_KEY_ID     = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
    }
    stages {
        stage('checkout'){
            steps{
                script{
                    dir("terraform")
                    {
                        git "https://github.com/vrushti22/Terraform-Jenkins.git"
                    }
                }
            }
        }
        stage('Terraform Plan') {
            steps {
                sh 'pwd; cd terraform/; terraform init'
                sh 'pwd; cd terraform/; terraform validate'
                sh 'pwd; cd terraform/; terraform plan'
            }
        }
        stage('Terraform Apply') {
            steps {
                sh 'pwd; cd terraform/; terraform apply -auto-approve'
            }
        }
    }
}
