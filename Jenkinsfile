node {
        step([$class: 'WsCleanup'])

        stage "Build"
        git branch: 'cicd', url: 'git@github.ecs-digital.co.uk:ECSD/cicd-pipeline-demo.git/'
        sh 'export PATH=/opt/maven/bin:${PATH} && mvn clean package'

        stage('SonarQube analysis') {
            withSonarQubeEnv('SQ') {
              sh "/etc/sonar-scanner-3.0.3.778-linux/bin/sonar-scanner"
            }
        }

        stage "Integration Test"
        sh 'chmod +x pipeline-helper-scripts/integration_stage.sh && ./pipeline-helper-scripts/integration_stage.sh'

        stage "User Acceptance Test"
        sh 'chmod +x pipeline-helper-scripts/user_acceptance_stage.sh && ./pipeline-helper-scripts/user_acceptance_stage.sh'

        stage "Build Docker Image"
        def app = docker.build "web-app-jpetstore6"d
}