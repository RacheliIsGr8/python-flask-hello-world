pipeline {
    agent any
    environment {
        IMAGE_NAME = "flask-app" // הגדרת שם האימג' לשימוש בגלובל
    }
    stages {
        stage('Code Checkout') {
            steps {
                checkout scm
                echo 'Code checkout completed successfully!'
            }
        }
        stage('Docker Build+Tag') {
            steps {
                script {
                    sh 'docker build -t ${IMAGE_NAME}:latest .'
                    echo 'Docker image built and tagged successfully!'
                }
            }
        }
        // שלב חדש - Docker Push לפי המשימה
        stage('Docker Push'){
            steps{
                withCredentials([usernamePassword(credentialsId: 'dockerhub-credentials', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]){
                    sh '''
                    echo $DOCKER_PASS | docker login -u $DOCKER_USER --password-stdin
                    docker push ${IMAGE_NAME}:latest
                    '''
                }
            }
        }
    }
}
