pipeline {
    agent any

    environment {
        DOCKER_BUILDKIT = '1'
    }

    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'main', url: 'https://github.com/Sumit192002/CICD.git', credentialsId: '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'
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    // Build the Docker image using Buildx
                    sh 'docker buildx build --tag my-nginx-image .'
                }
            }
        }
        stage('Deploy to Docker') {
            steps {
                script {
                    // Stop Apache to free up port 80
        
                    
                    // Run the Docker container on port 80
                    sh 'docker run -d -p 8081:80 my-nginx-image'
                }
            }
        }
    }

    post {
        success {
            echo 'Deployment Successful'
        }
        failure {
            echo 'Deployment Failed'
        }
    }
}



