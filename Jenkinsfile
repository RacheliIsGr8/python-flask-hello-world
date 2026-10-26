pipeline {
    agent any
    environment {
        IMAGE_NAME = "python-flask-hello-world" // הגדרת שם האימג' לשימוש בגלובל
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
stage('Docker Push'){
    steps{
        withCredentials([usernamePassword(credentialsId: 'dockerhub-credentials', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]){
            sh '''
            echo $DOCKER_PASS | docker login -u $DOCKER_USER --password-stdin
            
            # תיוג האימג' עם שם המשתמש שלך ב-Docker Hub
            docker tag ${IMAGE_NAME}:latest $DOCKER_USER/python-flask-hello-world:latest
            
            # דחיפה לענן
            docker push $DOCKER_USER/python-flask-hello-world:latest
            '''
        }
    }
}
    }
}
