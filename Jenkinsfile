pipeline {
    agent any

    stages {
    

        stage("Run image on remote server"){
            steps{
    
                script {

                    withCredentials([sshUserPrivateKey(credentialsId: 'deploy', keyFileVariable: 'key', usernameVariable: 'deploy')]) {
                    def remote = [:]
                    remote.user = 'deploy'
                    remote.host = '20.232.209.34'
                    remote.name = 'deploy'
                    remote.password = 'deploy@12345678'
                    remote.allowAnyHosts = 'true'
                    sshCommand remote: remote, command: "docker pull nginx"
                    sshCommand remote: remote, command: 'docker run -p 8080:80 nginx'
                    }

                }
            }
        }
    }
}
