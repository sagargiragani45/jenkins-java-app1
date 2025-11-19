pipeline {
    agent any

    tools {
        maven 'Maven3'
        jdk 'JDK17'
    }

    environment {
        IMAGE_NAME = "sagargiragani/jenkins-java-app"
    }

    stages {

        stage('Clone Repository') {
            steps {
                git branch: 'master',
                credentialsId: 'github-token',
                url: 'https://github.com/sagargiragani45/jenkins-java-app1.git'
            }
        }

        stage('Build with Maven') {
            steps {
                sh 'mvn clean package -DskipTests'
            }
        }

        stage('Docker Build') {
            steps {
                script {
                    echo "Building Docker image..."
                    app = docker.build("${IMAGE_NAME}:${BUILD_NUMBER}")
                }
            }
        }

        stage('Docker Push') {
            steps {
                script {
                    echo "Pushing Docker image to Docker Hub..."
                    docker.withRegistry('https://registry.hub.docker.com', 'dockerhub-creds') {
                        app.push()
                    }
                }
            }
        }
    }
}


