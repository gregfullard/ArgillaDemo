pipeline {
  agent any
  stages {
    stage('Start') {
      steps {
        echo 'Start Automated Build'
      }
    }
    stage('Deplou Node Demo App') {
      steps {
        sleep 1
        git(url: 'ssh://git@argilla-gitlab/root/ArgillaDemo.git', branch: 'master', credentialsId: 'GitLab')
      }
    }
  }
}