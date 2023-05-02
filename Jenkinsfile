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

        stage("Sonar quality check") {

            steps {

              script{

                    withSonarQubeEnv(installationName: 'sonar-server2' , credentialsId: 'jenkins') {
                    sh 'mvn sonar:sonar'
                    }        

                }
            }
        }

        stage("Quality gate") {

            steps {
                script {
                    def qg = waitForQualityGate()
                    if (qg.status != 'OK') {
                        error "Pipeline aborted due to Quality Gate failure: ${qg.status}"
                    } 
                
                }
                        
            }
        }
        stage ('Build') {

            steps {
                
                sh 'mvn clean package'
                
            }
        }
        
        // stage("Build docker image"){
    
        //    steps{
    
        //        script {
        //            dockerImage = docker.build registry + ":$BUILD_NUMBER"
        //        }

        //    }

        //}

        stage("Push docker image to Nexus repo"){
    
            steps{
    
                script{
                    
                    withCredentials([string(credentialsId: 'nexus', variable: 'nexus-cred')]) {
                    
                    sh '''
                    
                    docker build -t 4.188.224.23:8083/app:${VERSION} .
                    docker login -u admin -p nexus 4.188.224.23:8083
                    docker push 4.188.224.23:8083/app:${VERSION}
                    docker rmi 4.188.224.23:8083/app:${VERSION}
                    '''
                    
                    }
                                        

                }

            }

        }

        stage("Pull image"){
            steps{
    
                script{
                    
                    withCredentials([string(credentialsId: 'nexus', variable: 'nexus-cred')]) {
                    
                    sh '''
                    docker pull 4.188.224.23:8083/app:${VERSION}  
                    '''
                    }
                    def image = docker.image('mongo:latest')
                    image.pull()
                                        
                }

            }
        }

        stage('Run containers') {
            steps {
                script {
                    sh "docker container rm -f db"
                    sh "docker container rm -f app"
                    sh "docker run -d --name db -p 27017:27017 mongo:latest"
                    sh "docker run -d --name app -p 8085:8085 --link db:mongo 4.188.224.23:8083/app:${VERSION}"

                }
            }
        }
    }

}
