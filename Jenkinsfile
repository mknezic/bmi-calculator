pipeline {
    agent any
    environment {
        scannerHome = tool 'sqs'
    }

    stages {
        stage('SCA') {
            steps {
                withSonarQubeEnv('sonar') {
                    echo 'Code Quality checks using SonarQube Scanner'
                    sh "${scannerHome}/bin/sonar-scanner -Dsonar.projectKey=bmi-calculator"
                }
                timeout(time: 10, unit: 'MINUTES') {
                    waitForQualityGate abortPipeline: true
                }
            }
        }
    }
}
