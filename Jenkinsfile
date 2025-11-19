pipeline {
    agent any


    tools {
        maven 'Maven3'
        jdk 'JDK17'
    }

    environment {
        DOCKERHUB_CREDENTIALS = credentials('dockerhub-creds')
        IMAGE_NAME = "sagargoud/jenkins-java-app"
    }

    stages {
        stage('clone repository') {
            steps {
                git branch: 'master',
                credentialsId: 'github-token',
                url: 'https://github.com/sagargiragani45/jenkins-java-app1.git'
            }
        }

        stage('Build the Maven') {
            steps {
                sh 'mvn clean package'
            }
        }

        stage('Docker Build') {
            steps {
                sh 'docker build -t $IMAGE_NAME:$BUILD_NUMBER .'
            }
        }

        stage('Docker Push') {
            steps {
                sh "echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --passwd-stdin"
            }
        }

        stage('Docker Push') {
            steps {
                sh 'docker push $IMAGE_NAME:$BUILD_NUMBER'
            }
        }

    }
}
    

           


        

