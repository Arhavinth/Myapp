pipeline {
    agent any

    environment {
        IMAGE_NAME = "Dockerfile"
        CONTAINER_NAME = "Jenkinscontainer"
    }
i
    stages {

        stage('Git Pull') {
            steps {
                echo "Pulling latest code from Git..."
                git branch: 'master', url: 'https://github.com/Arhavinth/Myapp.git'
            }
        }

        stage('Run Tests') {
            steps {
                echo "Running test script..."
		sh 'chmod 755 test.sh'
                sh 'ls -l test.sh'
                sh './test.sh'
            }
        }

        stage('Build Docker Image') {
            steps {
                echo "Building Docker image..."
                sh "docker build -t ${Dockerfile}:latest ."
            }
        }

        stage('Stop & Remove Old Container') {
            steps {
                echo "Stopping old container if exists..."
                sh """
                if [ \$(docker ps -q -f name=${Jenkinscontainer}) ]; then
                    docker stop ${Jenkinscontainer}
                    docker rm ${Jenkinscontainer}
                else
                    echo "No running container found."
                fi
                """
            }
        }

        stage('Run New Container') {
            steps {
                echo "Running new container..."
                sh "docker run -d --name ${Jenkinscontainer} -p 5000:5000 ${Dockerfile}:latest"
            }
        }
    }

    post {
        success {
            echo "Pipeline executed successfully!"
        }
        failure {
            echo "Pipeline failed!"
        }
    }
}

