node {
        step([$class: 'WsCleanup'])

        stage "Build"
        git branch: 'cicd', url: 'https://github.com/tv-17/jpetstore-6.git'
        sh 'export PATH=/opt/maven/bin:${PATH} && mvn clean package'

        stage "Integration Test"
        sh 'chmod +x pipeline-helper-scripts/integration_stage.sh && ./pipeline-helper-scripts/integration_stage.sh'

        stage "User Acceptance Test"
        sh 'sleep 10'
        sh 'scl enable python27 bash && python test/user_acceptance_tests.py'
        sh 'kill -9 `cat save_pid.txt`'
}
