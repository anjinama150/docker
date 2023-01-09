pipeline {
    agent {label 'build'}
    stages {
        stage('my Build') {
            steps {
                sh "echo ${BUILD_VERSION}"
                sh 'docker build -t tomcat_build:${BUILD_VERSION} --build-arg BUILD_VERSION=${BUILD_VERSION} .'
            }
        }  
        stage('publish stage') {
            steps {
                sh "echo ${BUILD_VERSION}"
                sh 'docker login -u anjina -p USADPink@0524#'
                sh 'docker tag tomcat_build:${BUILD_VERSION} anjina/myjenkins:${BUILD_VERSION}'
                sh 'docker push anjina/myjenkins:${BUILD_VERSION}'
            }
        } 
        stage( 'my Deploy' ) {
        agent {label 'deploy'} 
            steps {
               sh 'docker pull anjina/myjenkins:${BUILD_VERSION}'
               sh 'docker rm -f myjenkins'
               sh 'docker run -d -p 8080:8080 --name myjenkins anjina/myjenkins:${BUILD_VERSION}'
            }
        }    
    } 
}
