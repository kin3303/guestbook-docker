
## guestbook-cdro 설정 방법 
 
 
### DevOps Essentials

- Projects 
	- Add(+) 
		- Guestbook 
- Projects
	-  Guestbook
		- Credentials 
			- Add(+) 
				- harbor
					- username : admin
					- password: password
- Plugin Management
	- Actions
		- Configure
			- New configuration
				- Name : helmcfg
				- Project : Guestbook
				- Plugin : EC-Helm
				- Helm executable path : /usr/local/bin/helm
				- Kubectl executable path : /usr/local/bin/kubectl
				- Helm version : 3.x.x
				- Config file : Default
				- Test Connection > OK 확인

### Deployment Automation

- Application
	- New (+)
		- Create New
			- Name : Guestbook
			- Select Project : Guestbook
			- Application type : Microservice
	- New microservice
		- Next
			- Name : Guestbook
			- Definition type : Helm
			- Definition source : Helm repository
			- Repository URL :  https://harbor.idtplateer.com/chartrepo/guestbook
			- Repository name : guestbook-repo
			- Repository credentials 
				- Browse
					- Project Credential
						- Select Project : Guestbook
						- Select Credential : harbor
			- Release name : my-guestbook
			- Chart: guestbook
			- Chart version : 0.1.0
			- Additional options : 
				- --create-namespace
			- Values:
				- https://github.com/kin3303/guestbook-docker/tree/master/cd/dev 의 values.yaml 값을 복사하여 기입
	- New cluster
		- Environment name : dev
		- Project : Guestbook
		- Cluster name : dev
		- Configuratoin provider : Kubernetes (via Helm)(Supports microservice model)
		- Configuration name : helmcfg-Guestbook
		- Namespace : dev
