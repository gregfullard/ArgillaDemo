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
  }
}