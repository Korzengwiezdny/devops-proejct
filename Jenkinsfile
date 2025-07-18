pipeline {
    agent any

    environment {
        IMAGE_NAME = 'flask-devops-app'
    }

    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/Korzengwiezdny/devops-proejct'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    docker.build("${IMAGE_NAME}")
                }
            }
        }

        stage('Run Tests') {
            steps {
                script {
                    docker.image("${IMAGE_NAME}").inside {
                        sh 'pytest'
                    }
                }
            }
        }

        stage('Run Container') {
            when {
                expression { currentBuild.currentResult == 'SUCCESS' }
            }
            steps {
                script {
                    // Zatrzymaj poprzedni kontener jeśli istnieje
                    sh 'docker rm -f flask-container || true'
                    
                    // Uruchom nowy kontener
                    sh 'docker run -d -p 5000:5000 --name flask-container flask-devops-app'
                }
            }
        }
    }

    post {
        always {
            echo 'Pipeline finished.'
        }
        failure {
            echo 'Something went wrong.'
        }
    }
}
