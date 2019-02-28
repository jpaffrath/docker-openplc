# openplc-docker
## About
Docker container for [OpenPLC v3](http://www.openplcproject.com/) Linux Runtime.

## Build
`docker build -t openplc-docker .`

## Run
Place a structured text file _script.st_ in a directory and run the container

`docker run --name plc -d -p 8080:8080 -p 502:502 -v /PATH/TO/SCRIPT:/home/openplc/scripts openplc-docker`
