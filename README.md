# guestbook-docker

## Upload Guestbook Docker Images
 
 [원본소스](https://github.com/kubernetes/examples/blob/master/guestbook/php-redis/guestbook.php)

```console
 $ git clone https://github.com/kin3303/guestbook-docker.git
 $ cd guestbook-docker
 $ export TAG=<YOUR_TAG> (default : v1)
 $ export REG=<YOUR_REGISTRY>  (default : index.docker.io/kin3303)
 $ docker login
 $ make
``` 

## Jenkins Pipeline 설정

 + New Item -> Pipeline
 
  ![Pipeline Settings](./jenkins_setup/pipelinesettings.png/)


## Jenkins Pipeline 구조

  1. app image 빌드 및 harbor 에 이미지 업로드
  2. helm chart 패키징 및 원격 저장소 업로드
     -  [관련소스](https://github.com/kin3303/guestbook)


