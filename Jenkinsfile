pipeline {
    agent any

    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'main', url: 'https://github.com/Sumit192002/CICD.git', credentialsId: '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'
            }
        }
        stage('Deploy Nginx') {
            steps {
                script {
                    docker.image('nginx:latest').run('-p 80:80 -d')
                }
            }
        }
        stage('Deploy Website') {
            steps {
                script {
                    // Find the running Nginx container ID
                    def containerId = sh(script: "docker ps -q --filter ancestor=nginx:latest", returnStdout: true).trim()
                    
                    // Copy index.html to the Nginx container
                    sh "docker cp index.html ${containerId}:/usr/share/nginx/html/index.html"
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
