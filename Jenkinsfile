
pipeline {
    agent any
    
    stages {
        stage('Approval Gateway') {
            steps {
                // Step 1: Create a deployment request and send it to the manager
                script {
                    def managerEmail = 'devops473@gmail.com'
                    def subject = 'Deployment Approval Request'
                    def body = 'Please approve the deployment request at <link-to-form>'
                    
                    // Send an email to the manager with a link to the deployment request form
                    emailext (
                        subject: subject,
                        body: body,
                        to: managerEmail
                    )
                }
                
                // Step 2: Wait for the manager to approve the request
                timeout(time: 30, unit: 'MINUTES') {
                    // Wait for the manager to approve the deployment request by clicking a link in the email
                    input message: 'Do you want to approve the deployment request?', ok: 'Approve', submitter: 'devops473@gmail.com'
                }
                
                // Step 3: Deploy the code if the request is approved
                sh 'echo "Deployment Approved"'
            }
        }
    }
}
