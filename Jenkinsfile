pipeline {
    
    agent any
    
    tools{
        maven 'maven-3.9.1'
    }
    
    // environment{
    
    //     registry = 'demokinjal/trial'
    //     registryCredential = 'demokinjal'
    //     dockerImage = ''

    // }

    environment{
    
        VERSION = "${env.BUILD_ID}"

    }

    stages {
    

        stage("Run image on remote server"){
            steps{
    
                script{
                    
                	sshagent(credentials: ['remote-ssh'], ignoreMissing: true) {
			
			sh "docker run hello-world"
			}                  

                }

            }
        }
     }
}
