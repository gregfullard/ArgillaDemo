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
    stage('Generate Developer Manual') {
      steps {
        echo 'Generating Documentation'
        sleep 1
        sh '''cd docs/developer_manual
make html
'''
      }
    }
    stage('Deploy Development Manual') {
      steps {
        sleep 1
        sh '''mkdir -p /home/argilla/demo/nginx/dev-manual
mkdir -p /home/argilla/demo/nginx/user-manual
cp -R docs/developer_manual/build/html /home/argilla/demo/nginx/dev-manual'''
      }
    }
    stage('Run BDD Tests') {
      steps {
        sleep 1
        echo 'Running BDD Tests'
        sh '''cd testing/bdd/bdd-demo
mvn verify -Dwebdriver.chrome.driver=/usr/local/bin/chromedriver -Dwebdriver.driver=chrome -Dchrome.switches=--headless,--no-sandbox -Dcontext=chrome'''
        sh '''mkdir -p /home/argilla/demo/nginx/test-reports
cp -R testing/bdd/bdd-demo/target/site/serenity /home/argilla/demo/nginx/test-reports'''
      }
    }
    stage('Launch Drone') {
      steps {
        sleep 1
        echo 'Launching the Drone'
        sh 'curl -i http://node-drone-app:8080'
      }
    }
  }
}