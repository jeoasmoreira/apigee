pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                echo 'Building..'
                bat 'dir'
            }
        }
        stage('Test') {
            when {
                branch 'development'
            }
            steps {
                echo 'Testing..'
                bat 'dir'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying..'
                bat 'dir'
            }
        }
    }
}
