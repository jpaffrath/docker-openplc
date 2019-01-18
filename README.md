# openplc-docker
## About
Docker container for [OpenPLC v3](http://www.openplcproject.com/) Linux Runtime.

## Installation
`sudo docker build -t openplc-docker .`

## Start
`sudo docker run --name openplc -p 8080:8080 openplc-docker`
