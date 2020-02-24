# Git Ops Sample Project
[![](https://cdn.travis-ci.com/images/favicon-076a22660830dc325cc8ed70e7146a59.png)](https://travis-ci.com/luanngominh/gitops)![Build](https://travis-ci.com/luanngominh/gitops.svg?token=EpsxfuypGaA6JyTMzhSY&branch=master)

<br/>
Sample project, using flux to delivery app to kubernetes cluster

# Usage
* Change {{ DEPLOY_KEY }} in flux.yaml with deploy key
* Change {{ DOCKER_REDENTIAL }} in namespaces/secret.yaml with your images registry credential
Registry credential example:
```json
{
	"auths": {
		"https://index.docker.io/v1/": {
			"auth": "bHVhbm5nb21pbmg6NmQxNjdmZTktNTk0Yy00N2RlLWEwYzAtZTlhNTkyOTViZmNk"
		}
	},
	"HttpHeaders": {
		"User-Agent": "Docker-Client/19.03.5-ce (linux)"
	}
}
```
