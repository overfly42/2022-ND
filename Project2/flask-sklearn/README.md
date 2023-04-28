# Overview

<TODO: complete this with an overview of your project>
Within this project a simple web service is deployed as AZURE Web Service. It'll demonstrate a continous integration using
- git hub for repository
- azure as CI/CD Pipeline
- Local Build Agent 

## Project Plan

* A link to a Trello board for the project: https://trello.com/b/R6aZ3kbq/udacity2022devopsprj2
* A link to a spreadsheet that includes the original and final project plan: https://github.com/overfly42/2022-ND/blob/f9fce46ae20fa0952a337593ecea2b77eb0784fb/Project2/MGMT-Overview.xlsx

## Instructions

<TODO:  
* Architectural Diagram (Shows how key parts of the system work)>

<TODO:  Instructions for running the Python project.  How could a user with no context run this project without asking you for any help.  Include screenshots with explicit steps to create that work. Be sure to at least include the following screenshots:

### Run in Dev Environment
To run the application in DEV environment it is advisable to create a virtual environment using:
````
python -m venv /path/to/new/virtual/environment
source /path/to/new/virtual/environment/bin/activate
````
After cloning the repostiory the application could be prepared and started with the folowing commands in the Project2 folder
````
make all
python flask-sklearn/app.py
````
With this the server application is started locally. To run an example query start the make_prediction.sh
### Run in Production Environment

* Project running on Azure App Service
The following screenshot shows a deployed web service in Azure App Service: 
![Image of Azure App Service](https://github.com/overfly42/2022-ND/blob/1545af9a4dcf5f93ba9a420883ba8d83b5541ea4/Project2/Screenshot_appservice.png)
* Project cloned into Azure Cloud Shell
The Cloud Shell could be accessed via the Azure Portal and could be used like a common bash shell: for example see the following screenshot with cloned repo:
![Image of cloned repo](https://github.com/overfly42/2022-ND/blob/85f0af425d6e4105dd910ab569168c9e118f3956/Project2/Screenshot_project_cloned_into_cloud.png)

* Passing tests that are displayed after running the `make all` command from the `Makefile`

During execution of "make all" th test target is executed. The example result is visible in this screenshot:
![Image of executed tests](https://github.com/overfly42/2022-ND/blob/c1ec5a5b00a6a3099ad7671aa7294a966ee378ba/Project2/Screenshot_first_python_test.png)

* Output of a test run

* Successful deploy of the project in Azure Pipelines.  [Note the official documentation should be referred to and double checked as you setup CI/CD](https://docs.microsoft.com/en-us/azure/devops/pipelines/ecosystems/python-webapp?view=azure-devops).

To deploy the system run 
````
cd Project2/flask-sklearn
../commands.sh
````
This will request a login to Azure and populates the app. To change the name added the last parameter "cs-udacity2022" to what ever you like and is available.
* Running Azure App Service from Azure Pipelines automatic deployment

* Successful prediction from deployed flask app in Azure Cloud Shell.  [Use this file as a template for the deployed prediction](https://github.com/udacity/nd082-Azure-Cloud-DevOps-Starter-Code/blob/master/C2-AgileDevelopmentwithAzure/project/starter_files/flask-sklearn/make_predict_azure_app.sh).
The output should look similar to this:

```bash
udacity@Azure:~$ ./make_predict_azure_app.sh
Port: 443
{"prediction":[20.35373177134412]}
```
![Image of prediction](https://github.com/overfly42/2022-ND/blob/dd846eeeec575af701ce690173be61bfa9d708b6/Project2/Screenshot_sucessful_prediction.png)

* Output of streamed log files from deployed application

To view the logs the followning file could be used, followed by a screenshot:
````
az webapp log tail --name cs-udacity2022
````
![Image of log files](https://github.com/overfly42/2022-ND/blob/dd846eeeec575af701ce690173be61bfa9d708b6/Project2/Screenshot_webapp_log.png)

## Enhancements
There a several posibilies to enahnce this project:
- Website with UI
- Enahnce the model accuracy
- Increase possible input parameter
## Demo 

<TODO: Add link Screencast on YouTube>

link to the video: https://youtu.be/3v8cyjvnGAw


