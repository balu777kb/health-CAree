node{
    def mavenHome
    def Docker
    def DockerCMD
    def tagName
    stage('Prepare environment')
       echo "initialise all variable"
        mavenHome = tool name: 'maven' , type: 'maven'
        Docker = tool name: 'Docker' , type: 'org.jenkinsci.plugins.docker.commons.tools.DockerTool'
        DockerCMD = "${docker}/bin/docker"
        tagName="1.0"
        
    stage('Code Checkout')
       try{
        echo "checkout from git repo"
        git 'https://github.com/balu777kb/health-CAree.git'
        }
       catch(Exception e){
            echo 'Exception occured in Git Code Checkout Stage'
            currentBuild.result = "FAILURE"
            emailext body: '''Dear All,
            The Jenkins job ${JOB_NAME} has been failed. Request you to please have a look at it immediately by clicking on the below link. 
            ${BUILD_URL}''', subject: 'Job ${JOB_NAME} ${BUILD_NUMBER} is failed', to: 'vikul@gmail.com'
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
          sh "${DockerCMD} build -t balu777kb/insureme:${tagName} . "
      }
      stage('Pushing it ot the DockerHub'){
        echo 'Pushing the docker image to DockerHub'
        withCredentials([string(credentialsId:'docker',variable: 'docker')]) {
            sh "${DockerCMD} login -u balu777kb -p ${docker}"
            sh "${DockerCMD} push balu777kb/insureme:${tagName}"
      }

      stage('Configure and Deploy to the test-serverusing ansible'){  
          ansiblePlaybook become: true, credentialsId: 'ansible-key', disableHostKeyChecking: true, installation: 'ansible', inventory: '/etc/ansible/hosts', playbook: 'ansible-playbook.yml'
      }

}
}

