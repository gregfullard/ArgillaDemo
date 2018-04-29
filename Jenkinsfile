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
        sh 'sphinx-build -b html docs/developer_manual/source docs/developer_manual/build/html'
      }
    }
    stage('SayGoodbye') {
      steps {
        echo 'Goodbye'
      }
    }
  }
}
