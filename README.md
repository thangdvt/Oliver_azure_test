1. Authenticate to Azure
First, log in to your Azure account using the Azure CLI:

# az login
This will open a browser window to authenticate you. Once authenticated, make sure to set the correct subscription ID for your deployment:

# az account set --subscription "f43dfad2-7616-404b-8932-e01229059371"
2. Deploy Infrastructure using Terraform
The project structure includes the necessary Terraform configurations for deploying Azure resources (e.g., AKS, networking).

a. Navigate to the Terraform directory:

# cd WORK-DU/AKS_resource

b. Initialize Terraform:
Initialize the Terraform configuration to download necessary providers and set up the environment:

# terraform init

c. Apply the Terraform Configuration:
Terraform will create the necessary resources in Azure as per the configuration files.

# terraform apply

This will prompt Terraform to deploy your resources. Review the plan before applying if needed.

Once the deployment is complete, Terraform will provide the necessary outputs, including details for your AKS cluster.

3. Configure kubectl for AKS
After deploying the AKS resources, configure kubectl to access your AKS cluster. Use the following command to retrieve the credentials for your cluster:

az aks get-credentials --resource-group <your-resource-group> --name <your-cluster-name>
This will configure your kubectl to connect to your Azure Kubernetes Service.