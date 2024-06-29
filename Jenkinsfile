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
                    sh 'docker run -d -p 8082:80 my-nginx-image'
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



