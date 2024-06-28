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
                    // Run the Docker container
                    docker.image('my-nginx-image').run('-p 80:80 -d')
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
