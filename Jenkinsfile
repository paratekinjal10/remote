pipeline {
    agent any
    environment{
    
        VERSION = "${env.BUILD_ID}"

    }
    stages {
        stage('Deploy') {
            steps {
                // Step 1: Create a deployment request and send it to the manager
                script {
                    def managerEmail = 'devops473@gmail.com'
                    def subject = 'Deployment Request'
                    def body = "Please approve the deployment request at this <a href='${env.JOB_URL}'> link</a>"
                    
                    // Send an email to the manager with a link to the deployment request form using the email-ext plugin
                    emailext (
                        subject: subject,
                        body: body,
                        to: managerEmail,
                        attachLog: true,
                        mimeType: 'text/html',
                        replyTo: 'noreply@example.com',
                        from: 'jenkins@example.com',
                        smtpServer: 'smtp.example.com',
                        smtpPort: '465',
                        smtpAuth: 'true',
                        smtpUsername: 'devops473@gmail.com',
                        smtpPassword: 'opsdev@473'
                    )
                }
                
                // Step 2: Wait for the manager to approve the request
                timeout(time: 30, unit: 'MINUTES') {
                    // Wait for the manager to approve the deployment request by replying to the email
                    input message: 'Do you want to approve the deployment request?', ok: 'Approve', submitter: 'devops473@gmail.com'
                }
                
                // Step 3: Deploy the code if the request is approved
                sh 'echo "Deploying code..."'
            }
        }
    }
}
