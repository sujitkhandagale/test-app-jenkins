pipeline {
    agent any

    environment {
        Docker_ImageName = "sujitkh94/asiaticesports"
        Docker_ImageTag = "latest"
    }

    stages {
        stage('Cleanup') {
            steps {
                script {
                    // Stop and remove the container only if it exists
                    sh "docker stop ${env.Docker_ImageName} || true"
                    sh "docker rm ${env.Docker_ImageName} || true"
                    sh "docker rmi ${env.Docker_ImageName}:${env.Docker_ImageTag} || true"
                }
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    sh "docker build -t ${env.Docker_ImageName}:${env.Docker_ImageTag} ."
                }
            }
        }
        stage('Run Docker Container') {
            steps {
                script {
                    sh "docker run -d --name ${env.Docker_ImageName} -p 3000:3000 ${env.Docker_ImageName}:${env.Docker_ImageTag}"
                }
            }
        }
        stage('clear cache') {
            steps {
                cleanWs()
            }
        }
    }
}
