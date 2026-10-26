pipeline {
    agent any
    stages {
        stage('Code Checkout') {
            steps {
                checkout scm
                // הוספת ה-echo כאן
                echo 'Code checkout completed successfully!'
            }
        }
        stage('Docker Build+Tag') {
            steps {
                script {
                    sh 'docker build -t flask-app:v1 .'
                    echo 'Docker image built and tagged successfully!'
                }
            }
        }
    }
}

