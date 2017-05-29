node {
        step([$class: 'WsCleanup'])
      
        stage "Build"

        git branch: 'cicd', credentialsId: '7a2ccb12-d4dc-4354-a85e-9535cda95de3', url: 'git@github.ecs-digital.co.uk:ECSD/cicd-pipeline-demo.git'
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
        def app = docker.build "thiv17/jpetstore6:${env.BUILD_NUMBER}"
        
        docker.withRegistry('https://index.docker.io/v1/', '3fd5eadf-0bbf-4d9b-bf01-8922a5425f99') {
          stage "Publish"
            app.push();
        }
}