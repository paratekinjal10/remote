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
                    
                    sshPublisher(
                        publishers: [
                            sshPublisherDesc(
                                configName: remote.name,
                                transfers: [
                                    sshTransfer(
                                        sourceFiles: 'docker-compose.yaml',
                                        excludes: '',
                                        remoteDirectory: '.'
                                    )
                                ]
                            )
                        ]
                    )

                    sshCommand remote: remote, command: 'docker-compose up -d', tty: true
                    }
                }

                }
            }
        }
    }
}
