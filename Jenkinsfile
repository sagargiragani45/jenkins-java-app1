pipeline {
    agent any


    tools {
        maven 'Maven3'
        jdk 'JDK11'
    }

    environment {
        DOCKERHUB_CREDENTIALS = creddentials('dockerhub-creds')
        IMAGE_NAME = "sagargoud/jenkins-java-app"
    }

    stages {
        stage('clone repository') {
            steps {
                git branch: 'master',
                creddentialsId: 'github-token',
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
                script {
                echo "Building docker image..."
                app =docker.builf ("sagargiragani/jenkins-java-app:${BUILD_NUMBER}")
                }
            }
        }
        stage('Docker Push') {
            steps {
                script {
                    echo "Pushing Docker image to Docker Hub..."
                    docker.withRegistry('https://registry.hub.docker.com', 'dockerhub-cred') {
                        app.push()}
                }
            }
        }

        

    

    }
}
    

           


        


        

