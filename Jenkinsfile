pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    dockerImage = docker.build("flask-devops-app")
                }
            }
        }

        stage('Run Tests') {
            steps {
                script {
                    dockerImage.inside {
                        sh 'pytest'
                    }
                }
            }
        }

        stage('Run Container') {
            steps {
                sh 'docker run -d -p 5000:5000 flask-devops-app'
            }
        }
    }
}
