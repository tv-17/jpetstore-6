node {
        step([$class: 'WsCleanup'])

        stage "Build"
        git branch: 'cicd', url: 'https://github.com/tv-17/jpetstore-6.git'
        sh 'export PATH=/opt/maven/bin:${PATH} && mvn clean package'

        stage "Integration Test"
        sh "export PATH=/opt/maven/bin:${PATH} && nohup mvn cargo:run -P tomcat85 2>&1 > /dev/null &"
        sh "echo \$! > save_pid.txt"

        stage "User Acceptance Test"
        sh 'sleep 10'
        sh 'scl enable python27 bash && python test/user_acceptance_tests.py'
        sh 'kill -9 `cat save_pid.txt`'
}
