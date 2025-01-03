pipeline {
    agent any

    triggers {
        pollSCM('H/5 * * * *') // Cek perubahan setiap 5 menit
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/user/repo.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    docker.build("simple-website:latest")
                }
            }
        }

        stage('Deploy') {
            steps {
                script {
                    sh 'docker stop simple-website || true && docker rm simple-website || true'
                    sh 'docker run -d -p 8080:80 --name simple-website simple-website:latest'
                }
            }
        }
    }
}
