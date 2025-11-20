pipeline {
    agent any

    tools {
        maven 'Maven3'
        jdk 'JDK17'
    }

    environment {
        IMAGE = "sagargiragani/jenkins-java-app:${BUILD_NUMBER}"
        DOCKER_CRED = credentials('dockerhub-cred')
    }

    stages {

        stage('Clone Repository') {
            steps {
                git branch: 'master',
                credentialsId: 'github-token',
                url: 'https://github.com/sagargiragani45/jenkins-java-app1.git'
            }
        }

        stage('Build Maven') {
            steps {
                sh "mvn clean package -DskipTests"
            }
        }

        stage('Docker Build') {
            steps {
                script {
                    app = docker.build("${IMAGE}")
                }
            }
        }

        stage('Docker Push') {
            steps {
                script {
                    docker.withRegistry('https://registry.hub.docker.com', 'dockerhub-cred') {
                        app.push()
                    }
                }
            }
        }

        stage('Deploy to Kubernetes (CD)') {
            steps {
                script {
                    sh """
                        sed -i 's|jenkins-java-app:latest|jenkins-java-app:${BUILD_NUMBER}|g' k8s/deployment.yaml

                        kubectl apply -f k8s/deployment.yaml
                        kubectl apply -f k8s/service.yaml
                    """
                }
            }
        }
    }
}


