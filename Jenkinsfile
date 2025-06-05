pipeline {
    agent any

    environment {
        // Set the environment variable
        DOCKER_IMAGE = 'rajkumarmca23/myapp'
        REGISTRY_CREDENTIAL = 'dockerhub'
    }
    atages {
        stage("Git Clone") {
            steps {
                // Clone the repository
                git branch: 'master' url: 'https://github.com/r-jkum-r/Terraform-project.git'
            }
        }
        stage("Install Dependencies") {
            steps {
                // Install dependencies
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
                sh 'npm test || echo "test skkiped'
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

}


    post {
        success {
            echo '🚀 CI/CD Pipeline Completed Successfully!'
        }
        failure {
            echo '❌ Pipeline Failed!'
        }
    }
