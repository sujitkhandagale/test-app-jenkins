pipeline {
    agent any

    tools {
        nodejs "21"
    }

    stages {
        stage('Test Code') {
            steps {
                script {
                    sh "npm install"
                    sh "npm run build"
                }
            }
        }
        
        
        stage('Cleanup') {
            steps {
                script {
                    // Stop and remove containers managed by Docker Compose
                    sh "docker-compose down || true"
                    // clean the port also
                }
            }
        }
        
        stage('Build And Run Docker Image') {
            steps {
                script {
                    // Build the Docker image
                    sh "docker-compose up --build -d"
                    // Check for dangling images
                    sh "docker image prune -a --force"
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
