pipeline {
    agent any
    environment {
        IMAGE_NAME = "python-flask-hello-world" // הגדרת שם האימג' לשימוש בגלובל
    }
    stages {
        stage('Code Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/RacheliIsGr8/python-flask-hello-world.git'
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
        // שלב חדש - Task 9: הרצת הקונטייר
        stage('Docker Run') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerhub-credentials', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
                    script {
                        // עצירה ומחיקה של קונטייר ישן אם קיים כדי למנוע התנגשויות פורטים
                        sh 'docker stop my-flask-container || true'
                        sh 'docker rm my-flask-container || true'
                        
                        // הרצת האימג' העדכני שירד מ-Docker Hub
                        sh 'docker run -d -p 5000:5000 --name my-flask-container $DOCKER_USER/python-flask-hello-world:latest'
                        
                        echo 'Container is up and running successfully!'
                    }
                }
            }
        }
    }
}
