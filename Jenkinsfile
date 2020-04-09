node{
    
    stage("checkout SCM"){
        //to check the github URL and clone the code from URL
        git 'https://github.com/josefreddy/helloworld.git'
    }
    
    stage("Build for mvn package"){
        //by using mvn tool for build the code to get an Artifcory
        sh label: '', script: 'mvn clean package'
    }

    stage("Deplot for Test"){
        //we getting war file and then we deploy for testing into Tomcat server
        deploy adapters: [tomcat8(credentialsId: '217925ca-b702-419f-82f5-3eab1446c59b', path: '', url: 'http://172.31.32.112:8080/')], contextPath: 'webtom', war: '**/*.war'
    }
    
    stage("Build the Docker Image"){
        //to build the docker image by using dockerfile 
        sh label: '', script: 'sudo docker build  -t subbu7898/hello-app .'
    }

    stage("Push the image DockerHub"){
        //login into hub.docker.com with this credencials
        withCredentials([string(credentialsId: 'b11d66c6-8368-4cc9-a06b-8a7c88161510', variable: 'dockerhub')]) {
        sh label: '', script: '''sudo docker login -u subbu7898 -p ${dockerhub} '''
        }
        
        //after login topush the image into repository
       sh label: '', script: 'sudo docker push subbu7898/hello-app:latest'
    }
    
    stage("To Deploy in Remote machine and run"){
        def remove = 'sudo docker rm -f hello-app'
        def running = ' sudo docker run --rm --name hello-app -p 9090:8080 -d subbu7898/hello-app'
        sshagent(['ssh-docker']) {
            //sh "sudo docker stop hello-app"
            sh "ssh -o StrictHostKeyChecking=no ubuntu@172.31.6.252 ${remove}"
            sh "ssh -o StrictHostKeyChecking=no ubuntu@172.31.6.252 ${running}"
        }
       
    }
}
