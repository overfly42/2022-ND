# Azure Infrastructure Operations Project: Deploying a scalable IaaS web server in Azure

### Introduction
For this project, you will write a Packer template and a Terraform template to deploy a customizable, scalable web server in Azure.

### Getting Started
1. Clone this repository

2. Create your infrastructure as code

3. Update this README to reflect how someone would use your code.

### Dependencies
1. Create an [Azure Account](https://portal.azure.com) 
    1. Setup Client Credentials for granting access for Packer / Terraform to Azure
    2. Create Resource Group named udacity-demo-rg OPTIONALLY: Adjust the server.json
2. Install the [Azure command line interface](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli?view=azure-cli-latest)
3. Install [Packer](https://www.packer.io/downloads)
4. Install [Terraform](https://www.terraform.io/downloads.html)

The Scripts located in this reposiory assume packer and terraform in the parent directory.
ALTERNATIVLY: Adjust create_image.sh and do_all.sh to adjust the path to terraform and packer

### Instructions
The followings describes the singel steps of deploying the provided soulution to your azure acount

#### Step 1 Collect data from Azure
For deploying an infrastructure with the given scripts you will need to prepare some Data from DevOps:
- submission_id
- client_secret
- client_id
- tenant_id

#### Step 2 Provide data to scripts
These values have to be placed in:
- set_creds.sh
- provider_template.tf
The parameter within the scripts are named accordingly to STEP 1

#### Step 3 (OPTIONAL) Adjust configuration
- Adjust the prefix to fit your naming conventions, the prefix is set before the newly created resource group and it's content
- Adjust vmcount to set the number of parralel VMs behind the load balancer. Default is 2 for 2 virtual maschines
- Adjust location, if this is different from "West Europe"
- Adjust the tags that shall be added to VMs and Storages

#### Step 4 Make scripts runnable
Ensure the following scripts are marked as executable
- do_all.sh
- set_creds.sh
- create_image.sh

#### Step 5 Deployment
After finishing previous instructions execute
- do_all.sh


### Output
**Your words here**
After execution of do_all.sh within the portal a all new created resources groups shall be visible:
- Virtual Network
- Security Group
- Public IP
- Load balancer
- Virtual Maschine (according to parameter vmcount)
- Virtual Disk
