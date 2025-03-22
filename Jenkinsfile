pipeline {

    agent {
        node {
            label 'docker-agent-python'
        }
    }

    environment {
        // You can define environment variables such as the image name here
        IMAGE_NAME = "helloworld-flask"
    }

    stages {
        stage('Checkout') {
            steps {
                // Check out source code from your SCM (Git, etc.)
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // Build the Docker image tagged with the build ID for uniqueness
                    dockerImage = docker.build("${env.IMAGE_NAME}:${env.BUILD_ID}")
                }
            }
        }

        stage('Test') {
            steps {
                script {
                    sh '''
                    echo "Running tests ..."
                    '''
                }
            }
        }

        stage('Deploy') {
            steps {
                script {
                    // For a simple deployment, run the container detached.
                    // In a production setup you might push the image to a registry and deploy on a dedicated host.
                    dockerImage.run("-d -p 8000:8000")
                }
            }
        }
    }

    post {
        always {
            // Clean up the workspace after the build.
            cleanWs()
        }
    }
}
