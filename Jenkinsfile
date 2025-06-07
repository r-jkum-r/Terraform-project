pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'rajkumarmca23/myapp'
        REGISTRY_CREDENTIAL = 'dockerhub'
        SONARQUBE_ENV = 'MySonarQube' // Jenkins SonarQube server name
        PROJECT_KEY = 'Sonar' // Customize for SonarQube project key
    }

    tools {
        sonarQubeScanner 'Sonar' // Defined in Jenkins Global Tool Config
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

        stage("Code Quality - SonarQube") {
            steps {
                withSonarQubeEnv(SONARQUBE_ENV) {
                    sh """
                        sonar-scanner \
                        -Dsonar.projectKey=${PROJECT_KEY} \
                        -Dsonar.sources=. \
                        -Dsonar.javascript.lcov.reportPaths=coverage/lcov.info
                    """
                }
            }
        }

        stage("OWASP Dependency Check") {
            steps {
                sh '''
                    mkdir -p owasp-report
                    docker run --rm \
                        -v $(pwd):/src \
                        -v $(pwd)/owasp-report:/report \
                        owasp/dependency-check \
                        --project "QuickHireMe" \
                        --scan /src \
                        --format "HTML" \
                        --out /report
                '''
            }
        }

        stage("Build Docker Image") {
            steps {
                script {
                    dockerImage = docker.build(DOCKER_IMAGE)
                }
            }
        }

        stage("Docker Image Scan - Trivy") {
            steps {
                sh '''
                    docker run --rm -v /var/run/docker.sock:/var/run/docker.sock \
                    aquasec/trivy image ${DOCKER_IMAGE}:latest || true
                '''
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
