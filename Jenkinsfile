node {
    stage "Build"
    git 'https://github.com/tv-17/jpetstore-6.git'
    sh "mvn clean package"

    stage "Integration Test"
    sh "mvn cargo:run -P tomcat85 2>&1 > /dev/null"

    stage "User Accepted Test"
    sh "python test/integration_test.py"
}