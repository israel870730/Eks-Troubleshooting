pipeline {
    agent any
    
    parameters {
        string(name: 'IMAGE_TAG', defaultValue: 'latest', description: 'Tag of the Docker image')
    }
    
    stages {
        stage('Checkout') {
            steps {
                checkout scmGit(branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/israel870730/Eks-Troubleshooting']])
            }
        }
        
        stage('Build Docker Img'){
            steps {
                script {
                    dockerImage = docker.build "870730/ekstroubleshooting"
                }   
            }   
        }
        
        stage('Docker Tag'){
            steps {
                script {
                    dockerImage.tag("${params.IMAGE_TAG}")
                }   
            }   
        }
        
        stage('Uploading Img'){
            steps {
                script{
                    docker.withRegistry('', 'dockerhug_id') {
                       dockerImage.push("${params.IMAGE_TAG}")
                    }
                }
            }
        }
    }
}