pipeline {
    agent any

    stages {
        stage('Build Docker Image') {
            steps {
                script {
                    docker.build('flask-devops-app')
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
