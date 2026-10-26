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
        stage('Docker Build+Tag') {
		    steps {
		        script {
		            // הגדרת שם האימג' ותגית (לדוגמה: שימוש ב-BUILD_NUMBER של ג'נקינס כמזהה ייחודי)
		            def imageName = "my-flask-app"
		            def imageTag = env.BUILD_NUMBER ? env.BUILD_NUMBER : "latest"
		            
		            echo "Building Docker image: ${imageName}:${imageTag}"
		            
		            // בניית האימג' מתוך התיקייה הנוכחית (.) ותיוג כפול (גם לפי מספר ריצה וגם כ-latest)
		            sh "docker build -t ${imageName}:${imageTag} -t ${imageName}:latest ."
		        }
		    }
        }
    }
}
    
}
