# Find Optimal TimeSlots (FOTS)
This repository contains the **FastAPI** backend and **Azure DevOps pipeline** used to build, package, and deploy the API to an Azure App Service environment.  
Infrastructure resources (resource groups, App Service, etc.) are provisioned using **Bicep** templates. 

Architecture can be found in architechture.png

## Tech used:
Python, YML, Bicep, JSON

## Instructions
The deployment process is automated via Azure DevOps using azure-pipelines.yml.

### Infrastructure Set Up
#### 1. Azure Resources Needed
- Subscription
- Service Connection (can be created in ADO) with Contributor right to subcription

#### 2. Azure DevOps SetUp
- Create a Service Connection
- Go to: Project Settings → Service Connections → New service connection → Azure Resource Manager
- Authentication: Service Principal (automatic)
- Name it: FOTS-infra-SC (in this project)
- --> Gives it automatically contributor to subscription scope

- Give the SC pipeline access
- Check “Grant access permission to all pipelines” or to the pipeline you are running

### How to Push Changes
#### 1. Push to Azure DevOps (main CI/CD pipeline)
- git add .
- git commit -m "your message"
- git push origin master

#### 2. Push to GitHub (public repo copy)
git push github master

#### 3. Push branches (optional)
git push github <branch>
git push origin <branch>

### Pipeline Parameters
Parameter	Description	Default
Environment ->	Target environment -> (dev, test, or prod)	default dev
DeployInfra ->	Whether to deploy infrastructure -> default	false
DeployAPI	-> Whether to build and deploy the API to App Service -> default	false

### Pipeline Stages
1. Validate
Placeholder for validation and pre-deployment checks.

2. DeployRG
Creates resource groups if they don’t already exist (based on resourceGroups.json).

3. DeployResources
Deploys Azure resources (App Service, Storage, etc.) using Bicep templates and parameters from resourceVariables.json.
-> Right now the basic pipeline deploys only KeyVault, ASP and AppService

4. BuildAPI
Runs optional lint/tests (only placeholder).
Packages FastAPI app into a ZIP file (api.zip).
Publishes the ZIP as a pipeline artifact.

5. DeployAPI
Downloads the build artifact.
Loads resource variables for the selected environment.
Enables App Service build during deployment.
Configures the startup command
Deploys the API ZIP to the target Azure App Service.

## Checking the API after deployment:
https://fots-app-dev-as.azurewebsites.net//docs#/default/main_optimize_post



----------------------------------------------------------------------



## How to run and test API locally:

### In powershell terminal:

#### creates the environment
python -m venv .venv
.\.venv\Scripts\activate

#### install dependencies
pip install -r API/app/requirements.txt

#### start api
cd api/app
uvicorn main:app --reload


#### test in powershell (windows machines), run in the same location where the project is located
Invoke-RestMethod -Uri http://localhost:8000/optimize -Method POST -ContentType "application/json" -InFile .\api\test_data.json | ConvertTo-Json -Depth 5

--> output will be presented like this:

{
  "meetingName": "Design Sync",
  "optimalSlots": {
    "2024-06-10T10:00": ["Alice", "Bob", "Carol"]
  },
  "maxParticipants": 3
}

#### test in Swagger UI in browser
Root endpoint: http://localhost:8000/docs
Open the endpoint and open the /post/optimize, there you can also test by copying the test_data.json into the field
You should get similar results to the powershell test
