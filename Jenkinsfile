pipeline {
    agent any

    stages {
        stage('Git Clone') {
            steps {
                git branch: 'main', url: 'https://github.com/ec2tech-projects/Project-1.git'
            }
        }
        
        stage('Terraform Version Check') {
            steps {
                sh 'terraform --version'
            }
        }

        stage('Terraform Format Code') {
            steps {
                dir('terraform-aws-3tier-modular') {
                    sh 'terraform fmt'
                }
            }
        }
        
        stage('Terraform Initialize') {
            steps {
                dir('terraform-aws-3tier-modular') {
                    sh 'terraform init'
                }
            }
        }
        
        stage('Terraform Validate') {
            steps {
                dir('terraform-aws-3tier-modular') {
                    sh 'terraform validate'
                }
            }
        }

        
        
        stage('Terraform Plan') {
            steps {
                dir('terraform-aws-3tier-modular') {
                    sh 'terraform plan'
                }
            }
        }
        
        stage('Terraform Apply/Destroy') {
            steps {
                dir('terraform-aws-3tier-modular') {
                    sh 'terraform ${Action} --auto-approve'
                }
            }
        }
    }
}
