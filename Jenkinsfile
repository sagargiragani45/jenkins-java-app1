pipeline {
    agent any

    tools {
        maven 'Maven3'
        jdk 'JDK17'
    }

    environment {
        IMAGE_NAME = "sagargiragani/jenkins-java-app"
        DOCKERHUB = credentials('dockerhub-cred')
    }

    stages {

        stage('Clone Repo') {
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
                sh '''
                echo "Building Docker image..."
                docker build -t ${IMAGE_NAME}:${BUILD_NUMBER} .
                '''
            }
        }

        stage('Docker Push') {
            steps {
                sh '''
                echo "Logging into Docker Hub..."
                echo "${DOCKERHUB_PSW}" | docker login -u "${DOCKERHUB_USR}" --password-stdin

                echo "Pushing Docker image..."
                docker push ${IMAGE_NAME}:${BUILD_NUMBER}
                '''
            }
        }
    }
}


