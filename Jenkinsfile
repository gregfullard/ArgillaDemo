pipeline {
  agent any
  stages {
    stage('Start') {
      steps {
        echo 'Start Automated Build'
        sleep 1
      }
    }
    stage('Fetch Repo') {
      steps {
        echo 'Retrieving Latest Code'
        sleep 1
        git(url: 'ssh://git@argilla-gitlab/root/ArgillaDemo.git', branch: 'master', credentialsId: 'GitLab')
      }
    }
    stage('Deploy Node Demo App') {
      parallel {
        stage('Deploy Node Demo App') {
          steps {
            sh 'cp src/node/node-demo-app/server.js /home/argilla/demo/node-demo-app/server.js'
            sleep 1
            echo 'Deploying Node Demo App'
          }
        }
        stage('Deploy Node Drone App') {
          steps {
            sleep 1
            sh 'cp src/node/node-drone-app/server.js /home/argilla/demo/node-drone-app/server.js'
            sh 'cp src/node/node-drone-app/node_modules/node-bebop/examples/GoDrone.js /home/argilla/demo/node-drone-app/node_modules/node-bebop/examples/GoDrone.js'
            echo 'Deploying Node Drone App'
          }
        }
      }
    }
    stage('Documentation') {
      steps {
        echo 'Generating Developer Manual'
        sleep 1
        sh '''cd docs/developer_manual
make clean
make html'''
        sh '''mkdir -p /home/argilla/demo/nginx/dev-manual
cp -R docs/developer_manual/build/html /home/argilla/demo/nginx/dev-manual
'''
        echo 'Generating User Manual'
        sh '''cd docs/user_manual
make html'''
        sh '''mkdir -p /home/argilla/demo/nginx/user-manual
cp -R docs/user_manual/build/html /home/argilla/demo/nginx/user-manual
'''
      }
    }
    stage('Prepare Staging') {
      steps {
        sleep 1
        echo 'Preparing the Staging Environment'
      }
    }
    stage('Run BDD Tests') {
      steps {
        echo 'Running BDD Tests'
        sh '''cd testing/bdd/bdd-demo
mvn clean verify -Dwebdriver.chrome.driver=/usr/local/bin/chromedriver -Dwebdriver.driver=chrome -Dchrome.switches=--headless,--no-sandbox -Dcontext=chrome'''
      }
    }
    stage('Test Flight') {
      parallel {
        stage('Test Flight') {
          steps {
            sleep 1
            echo 'Launching the Drone'
            sh 'curl -i http://node-drone-app:8080'
          }
        }
        stage('Demo Something') {
          steps {
            echo 'We\'re done'
          }
        }
      }
    }
  }
  post {
    always {
      sh '''mkdir -p /home/argilla/demo/nginx/test-reports
cp -R testing/bdd/bdd-demo/target/site/serenity /home/argilla/demo/nginx/test-reports'''

    }

  }
}