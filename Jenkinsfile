pipeline {
  agent any
  stages {
    stage('SayHello') {
      steps {
        echo 'Hello'
      }
    }
    stage('sphinx-docs-html') {
      steps {
        sh 'sphinx-build -b html docs/source /var/www/html/documentation'
      }
    }
    stage('SayGoodbye') {
      steps {
        echo 'Goodbye'
      }
    }
  }
}
