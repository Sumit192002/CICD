pipeline {
    agent any

    stages {
        stage('Clone Repository') {
            steps {
                git url: 'https://github.com/your-username/your-repo.git', branch: 'main'
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    dockerImage = docker.build("my-nginx-image")
                }
            }
        }
        stage('Deploy to Docker') {
            steps {
                script {
                    dockerImage.run('-d -p 80:80 my-nginx-image')
                }
            }
        }
        stage('Display Website') {
            steps {
                sh 'echo "My Website" > /usr/share/nginx/html/index.html'
            }
        }
    }
    post {
        always {
            cleanWs()
        }
    }
}
