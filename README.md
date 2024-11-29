1. Authenticate to Azure
First, log in to your Azure account using the Azure CLI:

# az login
This will open a browser window to authenticate you. Once authenticated, make sure to set the correct subscription ID for your deployment:

# az account set --subscription "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxx
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

4. deploy  service using helm:
    a.	Chart.yaml
    -	The primary metadata file for the Helm chart.
    -	Includes details such as the chart's name, version, and a brief description.
    b.	values.yaml
    -	The default configuration values for the Helm chart.
    o	Parameters in this file can be overridden by user-specified values during deployment.
    c.	templates/
      -	Contains Kubernetes manifest templates that define the resources the Helm chart will deploy.
      -	Each .yaml file is processed by Helm, substituting values defined in values.yaml.
        
      c.1	deployment-web.yaml: Defines the Deployment resource for the web component of the application.

      c.2	deployment-api.yaml: Specifies the Deployment for the backend API service.
   
      c.3	deployment-mongo.yaml: Manages the MongoDB database deployment.
   
      c.4	ingress.yaml: Configures the Ingress resource, typically for exposing the web and API services externally.
   
      c.5	secret-mongo.yaml: Configures secret in mongo for api connect to mongo database


4.1.	Install the Chart:
#	helm install my-web-app ./Aks-web-app-du/ -f custom-values.yaml
4.2.	Upgrade the Chart:
#	helm upgrade my-web-app ./Aks-web-app-du/ -f custom-values.yaml

