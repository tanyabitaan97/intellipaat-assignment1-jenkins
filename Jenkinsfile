pipeline {
    agent any

    environment {
        IMAGE_NAME = 'site-image'
        CONTAINER_NAME = 'site-container'
    }

    stages {
        stage('Checkout Code') {
            steps {
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    sh "docker build -t $IMAGE_NAME ."
                }
            }
        }

        stage('Run Container (Only on master)') {
            when {
                branch 'master'
            }
            steps {
                script {
                    sh """
                    docker rm -f $CONTAINER_NAME || true
                    docker run -d --name $CONTAINER_NAME -p 82:82 $IMAGE_NAME
                    """
                }
            }
        }
    }

    post {
        success {
            echo "Build complete for branch: ${env.BRANCH_NAME}"
        }
    }
}
