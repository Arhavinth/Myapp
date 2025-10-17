pipeline {
  agent any

  stages {
    stage('Clone') {
      steps {
        git 'https://github.com/Arhavinth/myapp.git'
      }
    }

    stage('Test') {
  steps {
    sh '''
      pwd
      ls -l
      chmod +x ./test.sh
      ./test.sh
    '''
  }
}

    stage('Build Docker Image') {
      steps {
        sh 'docker build -t myapp:latest .'
      }
    }

    stage('Remove Old Container') {
      steps {
        sh 'docker rm -f myapp || true'
      }
    }

    stage('Run New Container') {
      steps {
        sh 'docker run -d --name myapp -p 5000:5000 myapp:latest'
      }
    }
  }
}
