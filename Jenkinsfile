pipeline {
    agent {label 'build'}
    stages {
        stage('my Build') {
            steps {
                     sh 'docker build -t tomcat_build:1.0.0 .'
            }
        }  
        stage('publish stage') {
            steps {
             
                sh 'docker login -u anjina -p USADPink@0524#'
                sh 'docker tag tomcat_build:1.0.0 anjina/myjenkins:1.0.0'
                sh 'docker push anjina/myjenkins:1.0.0'
            }
        } 
        stage( 'my Deploy' ) {
        agent {label 'deploy'} 
            steps {
               sh 'docker pull anjina/myjenkins:1.0.0'
               sh 'docker rm -f myjenkins'
               sh 'docker run -d -p 8090:8080 --name myjenkins anjina/myjenkins:1.0.0'
            }
        }    
    } 
}
