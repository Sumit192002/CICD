pipeline {
    agent any

    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'main', url: 'https://github.com/Sumit192002/CICD.git', credentialsId: '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'
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    // Build the Docker image
                    docker.build('my-nginx-image')
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
