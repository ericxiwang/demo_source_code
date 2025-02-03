###  STEP 1: Login to AWX, select 'Inventories' and click 'Add inventories'
___
<img src="awx-1.png" width="700" height="350">

___

####  Input name and description of inventory and save
___
<img src="awx-2.png" width="700" height="350">

___

###  STEP 2: Enter Inventory edit page, select add to create Host(Can also create host on left nav bar)
___
<img src="awx-3.png" width="700" height="350">

___
#### Input the target host IP and description, click save
___
<img src="awx-4.png" width="700" height="200">

___
#### If new host is created via left nav var Hosts, need assign an inventory to it
___
<img src="awx-5.png" width="700" height="400">

___
###  STEP 3: Create Credentials
#### select Credentials and click Add
___
<img src="awx-6.png" width="700" height="350">

___
#### Fill the info which are labeled by red rectangle
___
<img src="awx-7.png" width="700" height="350">

___
#### Don't forget set sudo privilege below
___
<img src="awx-8.png" width="700" height="400">

___
###  STEP 4: Create Project, project is core function based on ansible-playbooks
___
<img src="awx-9.png" width="700" height="250">

___
#### Input project name, here select IaC code source is GIT,input ansible-playbook git repo url and save
___
<img src="awx-10.png" width="700" height="250">

___
###  STEP 5: Create Template
___
<img src="awx-11.png" width="700" height="300">

___
#### Template will integrates Inventories, Credentials and Projects together
___
<img src="awx-12.png" width="700" height="340">

___
#### Click 'Launch' on template page and check the output on page
___
<img src="awx-13.png" width="700" height="460">

___