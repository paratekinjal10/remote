pipeline {


    stages {
    

        stage("Run image on remote server"){
            steps{
    
                script {

                    withCredentials([sshUserPrivateKey(credentialsId: 'deploy', keyFileVariable: 'key', usernameVariable: 'deploy')]) {
                    def remote = [:]
                    remote.user = 'deploy'
                    remote.host = '20.232.209.34'
                    remote.name = 'deploy'
                    remote.identityFile = '/root/.ssh'
                    remote.allowAnyHosts = 'true'
                    sshCommand remote: remote, command: 'docker run hello-world'
                    }

                }
            }
        }
    }
}
