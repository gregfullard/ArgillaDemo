pipeline {
  agent any
  stages {
    stage('Start') {
      steps {
        echo 'Start Automated Build'
      }
    }
    stage('Fetch Repo') {
      steps {
        sleep 1
        git(url: 'ssh://git@argilla-gitlab/root/ArgillaDemo.git', branch: 'master', credentialsId: 'GitLab')
      }
    }
    stage('Deploy Node Demo App') {
      steps {
        sh 'cp src/node/node-demo-app/server.js /home/argilla/demo/node-demo-app/server.js'
      }
    }
    stage('Finish') {
      steps {
        echo 'Complete'
      }
    }
  }
}