pipeline {
    agent any
    environment {
        scannerHome = tool 'sqs'
        nodejs = tool 'nodejs'
    }

    stages {
        stage('continuous integration') {
            agent {
                docker {
                    image 'node:16.13.1-alpine'
                }
            }
            stages {
                stage('npm install') {
                    steps {
                        script {
                            echo "node install"
                            sh 'node -v'
                            sh 'npm install'
                        }
                    }
                }
                /*
                stage('unit test') {
                    steps {
                        script {
                            echo "node test"
                            sh 'npm run test'
                        }
                    }
                    post {
                        always {
                            cobertura lineCoverageTargets: '70, 0, 0', coberturaReportFile: 'coverage/cobertura-coverage.xml'
                        }
                    }
                }
                */
                stage('build') {
                    steps {
                        script {
                            echo "build"
                            sh 'npm run build'
                            sh 'ls -la'
                            sh 'pwd'
                        }
                        zip dir: 'build', zipFile: 'bmi-calculator-artifacts.zip'
                        archiveArtifacts artifacts: 'bmi-calculator-artifacts.zip', fingerprint: true, onlyIfSuccessful: true
                        stash includes: 'bmi-calculator-artifacts.zip', name: 'built-artifacts'
                    }
                }
            }
        }
        /*
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
        */
    }
}
