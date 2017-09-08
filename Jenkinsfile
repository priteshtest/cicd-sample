pipeline {
    agent {
        label 'master' 
    }
    
    stages {
        stage('Git Clone') {
            steps {
                checkout scm    
            }
        }

        stage('UI Tests') {
            steps {
                sh './run-test.sh'
            }
            
        }
    }

    post {
        
        success {
		sh 'echo "Success"'

        }

        failure {
            sh 'echo "build failed"'
            //slackSend channel: "#channel-name", message: "Build Started: ${env.JOB_NAME} ${env.BUILD_NUMBER}"
        }

    }
        
}
