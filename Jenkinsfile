pipeline {
    agent any

    stages {
        stage('Code Checkout') {
            steps {
                // משיכת הקוד מתוך ה-GitHub Repository
                checkout scm
                echo 'Code checkout completed successfully!'
            }
        }
    }
}
