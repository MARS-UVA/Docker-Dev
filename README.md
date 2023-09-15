# Docker-Dev
Useful docker commands:\
[docker pull {imageName}:{tag}] //pull image (version = tag) from docker hub\
[docker images] //check available downloaded images\
[docker ps] //check running containers\
[docker run {imageName}:{tag}] //create new container in current terminal\
[docker run -d {imageName}:{tag}] //create new container in detach mode\
[docker logs {containerId}] //show container logs running in detach mode\
[docker stop {containerId}] //stop container\
[docker run -d -p {HOST_PORT}:{CONTAINER_PORT} {imageName}:{tag}] //run image in detach mode and expose container to localhost network\
[docker ps -a] //check all containers\
[docker start {containerId}] //start existing container\
[docker run --name {name} {imageName}:{tag}] //name as creating a container (to use as id)\
[docker build -t {imageName}:{tag} {dockerFileDir}] //build image based on docker file

Notes
1. Can run images in remote repo directly (automatic pull)
2. Standard practice to make HOST_PORT equal to CONTAINER_PORT
3. Registry is a service that stores repositories, in which repos store images
4. Base image: docker image that your image is based on (ex. Java, node, etc.)
5. Docker file: defines how to build your image (maps commands to file)
     Sample docker file:\
   {\
       FROM node:19-alpine //base image\
       COPY package.json /app/\
       COPY src /app/\
       WORKDIR /app\
       RUN npm install\
       CMD ["node", "server.js"]\
   }\

     
