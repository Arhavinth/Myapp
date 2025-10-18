pipeline {
    agent any

    environment {
        IMAGE_NAME = "myapp"             // Your app image name
        CONTAINER_NAME = "myapp_container" // Container name for your app
    }

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
                sh 'chmod +x test.sh'
                sh 'ls -l test.sh'
                sh './test.sh'
            }
        }

        stage('Build Docker Image') {
            steps {
                echo "Building Docker image..."
                sh "docker build -t ${IMAGE_NAME}:latest ."
            }
        }

        stage('Stop & Remove Old Container') {
            steps {
                echo "Stopping old container if exists..."
                sh """
                if [ \$(docker ps -q -f name=${CONTAINER_NAME}) ]; then
                    docker stop ${CONTAINER_NAME}
                    docker rm ${CONTAINER_NAME}
                else
                    echo "No running container found."
                fi
                """
            }
        }

        stage('Run New Container') {
            steps {
                echo "Running new container..."
                sh "docker run -d --name ${CONTAINER_NAME} -p 5000:5000 ${IMAGE_NAME}:latest"
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

