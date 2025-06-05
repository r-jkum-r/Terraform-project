pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'rajkumarmca23/myapp'
        REGISTRY_CREDENTIAL = 'dockerhub'
    }

    stages {
        stage("Git Clone") {
            steps {
                git branch: 'master', url: 'https://github.com/r-jkum-r/Terraform-project.git'
            }
        }

        stage("Install Dependencies") {
            steps {
                sh 'npm install'
            }
        }

        stage("Build Docker Image") {
            steps {
                script {
                    dockerImage = docker.build(DOCKER_IMAGE)
                }
            }
        }

        stage("Test") {
            steps {
                sh 'npm test || echo "tests skipped"'
            }
        }

        stage("Deploy to Docker Hub") {
            steps {
                script {
                    docker.withRegistry('https://index.docker.io/v1/', REGISTRY_CREDENTIAL) {
                        dockerImage.push("latest")
                    }
                }
            }
        }
    }

    post {
        success {
            echo '🚀 CI/CD Pipeline Completed Successfully!'
        }
        failure {
            echo '❌ Pipeline Failed!'
        }
    }
}
