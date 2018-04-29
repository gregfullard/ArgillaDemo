pipeline {
  agent any
  stages {
    stage('cleanup') {
      steps {
        deleteDir()
        checkout scm
      }
    }
    stage('sphinx-docs-publish') {
      steps {
        sh 'sphinx-build -b html Documentation/source /var/www/html/documentation'
      }
    }
  }
}
