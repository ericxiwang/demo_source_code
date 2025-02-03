###  STEP 1: Open browser to argoCD. click the "+ NEW APP" button as shown below
___
<img src="argocd-1.png" width="700" height="400">

___
### STEP 2: Give current app name, use the project default
___
<img src="argocd-2.png" width="700" height="370">

___
### STEP 3: Input the K8S manifest git repo, here example is helm chart, select the root chart path
___
<img src="argocd-3.png" width="700" height="320">

#### For Destination, set cluster URL to https://kubernetes.default.svc (or in-cluster for cluster name) and namespace to default

<img src="argocd-3-1.png" width="400" height="250">

___
### STEP 4: Browse the helm chart content and create the app
___
<img src="argocd-4.png" width="700" height="500">

___
### STEP 5: Syncing via UI，On the Applications page, click on Sync button of the guestbook application
You can see more details by clicking at the guestbook application:
___
<img src="argocd-5.png" width="700" height="500">

___
### STEP 6: More info of guestbook below

___
<img src="argocd-6.png" width="700" height="300">

___