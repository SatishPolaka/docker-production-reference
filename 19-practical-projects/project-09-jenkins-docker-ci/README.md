# Project 09 — Docker CI in Jenkins

Use `15-ci-cd/jenkins/Jenkinsfile` as a starting point. Configure an isolated Docker-capable agent, the `registry-credentials` entry and Trivy. Replace the sample registry URL and test command. Verify that the pipeline pushes the same tag that passed scanning.