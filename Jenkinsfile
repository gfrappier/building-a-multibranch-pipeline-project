pipeline {
    agent {
        docker {
            image 'node:12.16.3-alpine'
        }
    }
    environment {
        CI = 'true'
    }
    stages {
        stage('Install') {
            steps {
                sh 'npm install'
            }
        }
        stage('Build') {
            steps {
                sh 'npm run build'
            }
        }
        stage('Test') {
            steps {
                sh './jenkins/scripts/test.sh'
            }
        }
        stage('Run Snyk') {
            when {
                expression { return branch 'master' || branch 'production' }
                //branch 'master' || 'production'
            }
            steps {
                sh './jenkins/scripts/run-snyk.sh'
            }
        }
        stage('Run Certifiers') {
            when {
                branch 'production'
            }
            steps {
                sh './jenkins/scripts/run-certifiers.sh'
            }
        }
        stage('Deploy NPM Private') {
            when {
                branch 'development'
            }
            steps {
                sh './jenkins/scripts/deliver-for-development.sh'
                sh './jenkins/scripts/run-snyk.sh'
                archiveArtifacts '*.tgz'
            }
        }
        stage('Deploy NPM Public') {
            when {
                branch 'production'
            }
            steps {
                sh './jenkins/scripts/deploy-for-production.sh'
                sh './jenkins/scripts/run-snyk.sh'
                archiveArtifacts '*.tgz'
            }
        }
    }

    options {
        // Stash one pipeline run until successful    
        preserveStashes() 
        // or stash the last 5 builds
        //preserveStashes(buildCount: 5) 
        buildDiscarder(logRotator(numToKeepStr: '1'))
    }
}
