pipeline {
    agent {
        docker {
            image 'node:12.16.3-alpine'
        }
        parameters {
            booleanParam(name: 'dryrun', defaultValue: false)
        }
    }
    properties([[$class: 'JiraProjectProperty'], parameters([booleanParam(defaultValue: true, description: '', name: 'dryrun')])])
    environment {
        CI = 'true'
    }
    stages {
        stage('Build') {
            steps {
                sh 'npm install'
            }
        }
        stage('Test') {
            steps {
                sh './jenkins/scripts/test.sh'
            }
        }
        stage('Deliver for development') {
            when {
                branch 'development'
            }
            steps {
                sh './jenkins/scripts/deliver-for-development.sh'
            }
        }
        stage('Deploy for production') {
            when {
                branch 'production'
            }
            steps {
                sh './jenkins/scripts/deploy-for-production.sh'
            }
        }
    }

    options {
    // Stash one pipeline run until successful    
    preserveStashes() 
    // or stash the last 5 builds
    //preserveStashes(buildCount: 5) 
}
}
