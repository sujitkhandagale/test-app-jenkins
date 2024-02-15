pipeline {
    agent any

    environment {
        Docker_ImageName = "sujitkh94/asiaticesports"
        Docker_ImageTag = "latest"
    }

    stages {
        stage('Build Docker Image') {
            steps {
                script {
                    sh "docker build -t ${env.Docker_ImageName}:${env.Docker_ImageTag} ."
                }
            }
        }
        stage('Test') {
            steps {
                echo 'Testing..'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }
    }
}
