node {
        step([$class: 'WsCleanup'])

        stage "Build"
        git branch: 'cicd', url: 'https://github.com/tv-17/jpetstore-6.git'
        sh 'export PATH=/opt/maven/bin:${PATH} && mvn clean package'

        stage "Integration Test"
        sh 'chmod +x pipeline-helper-scripts/integration_stage.sh && ./pipeline-helper-scripts/integration_stage.sh'

        stage "User Acceptance Test"
        sh 'chmod +x pipeline-helper-scripts/user_acceptance_stage.sh && ./pipeline-helper-scripts/user_acceptance_stage.sh'
}
