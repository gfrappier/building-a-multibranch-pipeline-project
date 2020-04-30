pipeline {
    agent {
        docker {
            image 'node:12.16.3-alpine'
        }
        parameters {
            booleanParam(name: 'dryrun', defaultValue: false)
        }
    }
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
        [[$class: 'JiraProjectProperty'], parameters([booleanParam(defaultValue: false, description: 'Performs a dry run of the pipeline', name: 'dryrun')])]
        // or stash the last 5 builds
        //preserveStashes(buildCount: 5) 
    }
}
