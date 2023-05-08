pipeline {
    agent any
    
    stages {
        stage('Approval Gateway') {
            steps {
                // Step 1: Create a deployment request form and send it to the manager
                sh 'echo "Deployment request form"'
                sh 'echo "Please review and approve the deployment request at <link-to-form>"'
                
                // Step 2: Wait for the manager to approve the request
                timeout(time: 30, unit: 'MINUTES') {
                    // Wait for the manager to approve the deployment request
                    input message: 'Do you want to approve the deployment request?', ok: 'Approve', submitter: 'devops473@gmail.com'
                }
                
                // Step 3: Deploy the code if the request is approved
                sh 'echo "Approved"'
            }
        }
    }
}
