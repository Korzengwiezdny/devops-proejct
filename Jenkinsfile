pipeline {
    agent any

    stages {
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
                    docker.image("flask-devops-app").inside {
                        sh 'pytest'
                    }
                }
            }
        }

        stage('Run Container') {
            steps {
                script {
                    sh 'docker run -d -p 5000:5000 flask-devops-app'
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
