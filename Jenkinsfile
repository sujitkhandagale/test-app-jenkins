pipeline {
    agent any

    environment {
        Docker_ImageName = "sujitkh94/asiaticesports"
        Docker_ImageTag = "latest"
    }

    stages { 
    // remove old docker image and its running container 
        stage('Cleanup') {
            steps {
                script {
                    sh "docker stop ${env.Docker_ImageName}"
                    sh "docker rm ${env.Docker_ImageName}"
                    sh "docker rmi ${env.Docker_ImageName}:${env.Docker_ImageTag}"
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
                    sh "docker run -d --name -p 3000:3000 ${env.Docker_ImageName} ${env.Docker_ImageName}:${env.Docker_ImageTag}"
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
