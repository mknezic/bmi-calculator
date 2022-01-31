pipeline {
    agent any
    environment {
        scannerHome = tool 'sqs'
        nodejs = tool 'nodejs'
    }

    stages {
        stage('SCA') {
            steps {
                withSonarQubeEnv('sonar') {
                    echo 'Code Quality checks using SonarQube Scanner'
                    sh "${scannerHome}/bin/sonar-scanner -Dsonar.projectKey=bmi-calculator -Dsonar.nodejs.executable=${nodejs}/bin/node"
                }
                timeout(time: 5, unit: 'MINUTES') {
                    waitForQualityGate abortPipeline: true
                }
            }
        }
    }
}
