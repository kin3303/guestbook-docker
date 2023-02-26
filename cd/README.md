
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
- Plugin Management
	- Actions
		- Configure
			- New configuration
				- Name : kubecfg
				- Project : Guestbook
				- Plugin : EC-Kubectl 
				- Kubectl path : /usr/local/bin/kubectl
				- Kubeconfig Source : kubeconfigDefault
				- OK

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
				- https://github.com/kin3303/guestbook-docker/tree/master/cd/qa 의 values.yaml 값을 복사하여 기입
		- Process (+)
			- Name : Uninstall Application
			- Process : Undeploy
			- OK
				- New step
					- Name : Delete Release
					- Step type : Pligins
					- Plugin Category : Container Management > Helm
						- EC-Helm - Delete Release
							- Configuration Name : helmcfg - Guestbook
							- Release name : my-guestbook
							- Options : -n qa
							- OK
				- Step Add(+)
					- Name : Delete PVC
					- Step type : Command
					- Define step
						- Run this Step on a
							- Utility Resource
						- Run Shell/Script
							- kubectl delete pvc -l  app.kubernetes.io/instance=my-guestbook -n qa
							- kubectl delete ns qa
	- New cluster
		- Environment name : Guestbook-QA
		- Project : Guestbook
		- Cluster name : Guestbook-QA
		- Configuratoin provider : Kubernetes (via Helm)(Supports microservice model)
		- Configuration name : helmcfg-Guestbook
		- Namespace : qa
 
