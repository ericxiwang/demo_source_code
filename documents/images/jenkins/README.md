###  STEP 1: Login to Jenkins server, click New Item
___
<img src="jenkins-01.png" width="1000" height="440">

___
#### input description and next
___
<img src="jenkins-02.png" width="1000" height="460">

___
###  STEP 2: the configuration of Jenkinsfile build pipline below
- GIT repo: https://github.com/ericxiwang/demo_source_code.git
- Credentials: NONE, it a public repo
- Branch: Main
- Script Path of Robotframework+Selenium: 1_Robotframework_Selenium/Jenkinsfile_rt_test_pipeline
___
<img src="jenkins-03.png" width="1000" height="600">

___
###  STEP 3: Execute the pipline, check the output page, it will prints test results
___
<img src="jenkins-04.png" width="1000" height="500">

___
###  STEP 4: Browse the Robotframework html test reports(Jenkins Plugin)
#### summary of current auto test job
___
<img src="jenkins-05.png" width="1000" height="300">

___
#### statistics of test pipline on Jenkins dashboard
___
<img src="jenkins-06.png" width="1000" height="280">

___
### Single html test report for current autotest task
___
<img src="jenkins-07.png" width="1000" height="500">

___
___
# Example of pipeline script(not SCM JenkinsFile)
### This pipline is the demo of Postman(Newman) API autotest
___
<img src="jenkins-08.png" width="1000" height="500">

___
### Console output of API test results
___
<img src="jenkins-09.png" width="1000" height="1000">

___
### Newman can generate html test reports
___
<img src="jenkins-10.png" width="1000" height="560">

___
### Example of Postman/Newman html auotest reports
___
<img src="jenkins-11.png" width="1000" height="1000">

___

#### Details of API request for each test case
___
<img src="jenkins-12.png" width="1000" height="1000">
___