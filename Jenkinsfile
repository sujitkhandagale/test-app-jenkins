pipeline {
    agent any

    environment {
        Docker_ImageName = "sujitkh94/asiaticesports"
        Docker_ImageTag = "latest"
        Docker_Container_Name = "asiaticesports-development"
        Docker_Container_Port = "3005"
    }

    stages {
        stage('Cleanup') {
            steps {
                script {
                    sh "docker stop ${env.Docker_Container_Name} || true"
                    sh "docker rm ${env.Docker_Container_Name} || true"
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
                    sh "docker run -d --name ${env.Docker_Container_Name} -p 3000:3000 ${env.Docker_ImageName}:${env.Docker_ImageTag}"
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
