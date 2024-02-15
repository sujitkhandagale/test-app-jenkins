pipeline {
    agent any

    environment {
        Docker_ImageName = "sujitkh94/asiaticesports"
        Docker_ImageTag = "latest"
        Docker_Container_Name = "asiaticesports-development"
        Docker_Container_Port = "3005"
    }

    tools {
        nodejs "21"
    }

    stages {
        // stage('Test Code') {
        //     steps {
        //         script {
        //             sh "npm install"
        //             sh "npm run build" 
        //         }
        //     }
        // }
        
        stage('Cleanup') {
            steps {
                script {
                    // Stop and remove containers managed by Docker Compose
                    sh "docker-compose down --remove-orphans || true"
                    // clean the port also  
                }
            }
        }
        
        stage('Build Docker Image') {
            steps {
                script {
                    // Build the Docker image
                    sh "docker-compose build"
                }
            }
        }
        
        stage('Run Docker Container') {
            steps {
                script {
                    // Start the Docker containers defined in docker-compose.yml
                    sh "docker-compose up -d"
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
