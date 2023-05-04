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
			sh " ssh -o StrictHostKeyChecking=no deploy@20.232.209.34"
			sh '''
				docker pull nginx
				docker run --name mynginx -d -p 80:80 nginx
			'''
			}                  

                }

            }
        }
     }
}
