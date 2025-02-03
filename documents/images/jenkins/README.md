###  STEP 1: Login to Jenkins server, click New Item
___
<img src="jenkins-01.png" width="900" height="250">

___
#### input description and next
___
<img src="jenkins-02.png" width="900" height="250">

___
###  STEP 2: the configuration of Jenkinsfile build pipline below
- GIT repo: https://github.com/ericxiwang/demo_source_code.git
- Credentials: NONE, it a public repo
- Branch: Main
- Script Path of Robotframework+Selenium: 1_Robotframework_Selenium/Jenkinsfile_rt_test_pipeline
___
<img src="jenkins-03.png" width="900" height="450">

___
###  STEP 3: Execute the pipline, check the output page, it will prints test results
___
<img src="jenkins-04.png" width="900" height="400">

___
###  STEP 4: Browse the Robotframework html test reports(Jenkins Plugin)
#### summary of current auto test job
___
<img src="jenkins-05.png" width="900" height="200">

___
#### statistics of test pipline on Jenkins dashboard
___
<img src="jenkins-06.png" width="900" height="180">

___
### Single html test report for current autotest task
___
<img src="jenkins-07.png" width="900" height="400">

___