# guestbook-docker

## Upload Guestbook Docker Images

- Requrement : Save Flow, Devops Installer in **/tmp** folder

```console
 $ git clone https://github.com/kin3303/guestbook-docker.git
 $ cd guestbook-docker
 $ export TAG=v1
 $  export REG="index.docker.io/kin3303" (이 예는 dockerhub 인 경우)
 $ docker login
 $ make
``` 
