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
        stage('Deploy Private') {
            when {
                branch 'development'
            }
            steps {
                sh './jenkins/scripts/deliver-for-development.sh'
                archiveArtifacts '*.tgz'
            }
        }
        stage('Deploy Public') {
            when {
                branch 'production'
            }
            steps {
                sh './jenkins/scripts/deploy-for-production.sh'
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
