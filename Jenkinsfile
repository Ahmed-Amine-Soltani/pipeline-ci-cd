node {
    def registryProject = 'registry.gitlab.com/soltaniahmedamine/jenkins-tests/pipeline-ci-cd'
    def IMAGE_NAME = "${registryProject}:wartest-${env.BUILD_ID}"


    stage('Clone'){
        git 'https://github.com/Ahmed-Amine-Soltani/pipeline-ci-cd.git'
    }
    
    stage('Build - Maven package'){
        sh 'mvn package'
    }
    
    def img = stage('Build - image'){
        docker.build("$IMAGE_NAME" , '.')
    }
    
    stage('Local run - Test'){
        img.withRun("--name run-$BUILD_ID -p 80:8080") { c ->
        sh 'sleep 30s'
        sh 'curl 127.0.0.1:80'
    }
}
    
    stage('Push image'){
        docker.withRegistry('https://registry.gitlab.com' ,'reg1'){
            img.push()
        }
}

stage('Ansible run container on ec2') {
      ansiblePlaybook (
          colorized: true,
          become: true,             
          playbook: 'ansible-playbook/docker-install-run-image-playbook.yaml',
          inventory: 'ansible-playbook/inventory',
          extras: "--extra-vars 'image=$IMAGE_NAME'"
      )
    }
}

