node{
    environment {
    DOCKERHUB_CREDENTIALS = credentials('docker')
    }
    stage('Code Checkout')
       try{
        echo "checkout from git repo"
        git 'https://github.com/balu777kb/health-CAree.git'
        }
       catch(Exception e){
            echo 'Exception occured in Git Code Checkout Stage'
            currentBuild.result = "FAILURE"
            emailext body: '''Dear All,
            The Jenkins job  {JOB_NAME} has been failed. Request you to please have a look at it immediately by clicking on the below link. 
             {BUILD_URL}''', subject: 'Job  {JOB_NAME}  {BUILD_NUMBER} is failed', to: 'admin@gmail.com'
        }
      stage('Build the Application'){
        echo "Cleaning... Compiling...Testing... Packaging..."
        //sh 'mvn clean package'
        sh "mvn clean package"     
    }
      stage('publish the report'){
          echo "generating test reports"
          publishHTML([allowMissing: false, alwaysLinkToLastBuild: false, keepAll: false, reportDir: '/var/lib/jenkins/workspace/insureme project/target/surefire-reports', reportFiles: 'index.html', reportName: 'HTML Report', reportTitles: '', useWrapperFileDirectly: true])
      }
      stage('Containerise the application'){
          echo "making the image out of the application"
          sh " docker build -t insureme . "
          sh "docker tag insureme:latest balu777kb/insuremee:latest"
      }
      stage('login to dockerhub') {
            steps{
                sh "echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin"
            }
        }
        stage('push image') {
            steps{
                sh "docker push balu777kb/insuremee:latest"
               }
          }
      stage('Configure and Deploy to the test-serverusing ansible'){  
          ansiblePlaybook become: true, credentialsId: 'ansible-key', disableHostKeyChecking: true, installation: 'ansible', inventory: '/etc/ansible/hosts', playbook: 'ansible-playbook.yml'
      }

}
}

