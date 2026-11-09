# Docker CI/CD

A container pipeline should test source code before building an image, scan the image before publishing and deploy the same immutable image that passed validation.

Common flow: Git checkout → tests → image build → vulnerability scan → registry push → deployment → health verification. Use a separate deployment identity and approval for production. Keep credentials in Jenkins Credentials or the CI platform's secret store.