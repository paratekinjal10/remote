pipeline {
    agent any

    stages {
    

        stage("Run image on remote server"){
            steps{
    
                script {

                    withCredentials([string(credentialsId: 'nexus', variable: 'nexus-cred')]) {
                    
                        

                    withCredentials([sshUserPrivateKey(credentialsId: 'deploy', keyFileVariable: 'key', usernameVariable: 'deploy')]) {
                    def remote = [:]
                    remote.user = 'deploy'
                    remote.host = '20.232.209.34'
                    remote.name = 'deploy'
                    remote.password = 'deploy@12345678'
                    remote.allowAnyHosts = 'true'
                    sshCommand remote: remote, command: 'docker pull 4.188.224.23:8083/app:49', tty: true
                    sshCommand remote: remote, command: 'docker pull mongo:latest', tty: true
                    sshCommand remote: remote, command: 'docker run -d --name db -p 27017:27017 mongo:latest', tty: true
                    sshCommand remote: remote, command: 'docker run -d --name app -p 8085:8085 --link db:mongo 4.188.224.23:8083/app:49', tty: true
                    }
                }

                }
            }
        }
    }
}
