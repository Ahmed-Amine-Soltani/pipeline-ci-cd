node {
    def registryProject = 'registry.gitlab.com/soltaniahmedamine/jenkins-tests/pipeline-ci-cd'
    def IMAGE = "${registryProject}:wartest-${env.BUILD_ID}"


    stage('Clone'){
        git 'https://github.com/Ahmed-Amine-Soltani/pipeline-ci-cd.git'
    }
    
    stage('Maven package'){
        sh 'mvn package'
    }
    
    def img = stage('Build'){
        docker.build("$IMAGE" , '.')
    }
    
    stage('Run'){
        img.withRun("--name run-$BUILD_ID -p 80:8080") { c ->
        sh 'curl localhost'
    }
}
    
}

