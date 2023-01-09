pipeline {
    agent {label 'sla'}
    stages {
        stage('my Build') {
            steps {
             dir ("/home/slave/new") {
                sh 'mkdir test'
             }
                sh "echo ${BUILD_VERSION}"
                sh 'mvn deploy'
            }
        }    
        stage( 'my deploy' ) {
        agent {label 'service'} 
            steps {
               sh 'curl -u prajwalmore336@gmail.com:Admin@123 -O https://prajwal1327.jfrog.io/artifactory/libs-release-local/com/efsavage/hello-world-war/${BUILD_VERSION}/hello-world-war-${BUILD_VERSION}.war'
               sh 'cp -R hello-world-war-${BUILD_VERSION}.war /opt/tomcat/webapps/' 
               sh 'sudo sh /opt/tomcat/bin/shutdown.sh'
               sh 'sleep 2'
               sh 'sudo sh /opt/tomcat/bin/startup.sh' 
            }
        }    
    } 
}
