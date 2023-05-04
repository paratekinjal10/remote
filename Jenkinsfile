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
                    sshRemove remote: remote, path: 'docker-compose.yaml'
                    sshGet remote: remote, from: 'paratekinjal10/remote/docker-compose.yaml', into: '.', failOnError: true
                    //sshCommand remote: remote, command: "docker-compose build", tty: true
                    sshCommand remote: remote, command: 'docker-compose up -d', tty: true
                    }
                }

                }
            }
        }
    }
}
