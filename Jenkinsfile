pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    sh "docker build -t miapp-uoc ."
                }
            }
        }
        stage('Deploy') {
            steps {
                script {
                    // Esto para el contenedor viejo si existe y lanza el nuevo
                    sh "docker rm -f mi-contenedor-uoc || true"
                    sh "docker run -d -p 8081:8080 --name mi-contenedor-uoc miapp-uoc"
                }
            }
        }
    }
}
