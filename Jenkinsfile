pipeline {
    agent any
Docker_ImageName = "sujitkh94/asiaticesports"
    Docker_ImageTag = "latest"  

    stages {
        stage('Build Docker Image') {
            steps {
                sh 'docker build -t ${Docker_ImageName}:${Docker_ImageTag} .'
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