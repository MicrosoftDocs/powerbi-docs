---
title: Deploy Power BI projects (PBIP) using fabric-cicd
description: Learn how to deploy Power BI Desktop projects (PBIP) using the fabric-cicd Python library for manual and automated deployments.
author: [TO_BE_FILLED]
ms.author: [TO_BE_FILLED]
ms.reviewer: [TO_BE_FILLED]
ms.service: powerbi
ms.subservice: powerbi-developer
ms.topic: tutorial
ms.date: 12/12/2025
---

# Deploy Power BI projects (PBIP) using fabric-cicd

> [!IMPORTANT]
> Power BI Desktop projects is currently in **preview**.

[fabric-cicd](https://microsoft.github.io/fabric-cicd/latest/) is a Python library developed by Microsoft that provides a code-first method for developers to deploy Power BI Desktop project (PBIP) files from source control to Fabric workspaces.

In this article, you learn how to:

* Deploy PBIP files manually from your local machine
* Automate deployments using Azure DevOps pipelines with branch-based workspace targeting
* Automate deployments using GitHub Actions workflows with branch-based workspace targeting

Learn more about PBIP format in [Power BI Desktop projects (PBIP)](./projects-overview.md) and [Fabric Git integration overview](/fabric/cicd/git-integration/intro-to-git-integration).

## Why fabric-cicd for PBIP deployment?

fabric-cicd is specifically designed for deploying source-controlled Fabric artifacts and offers several advantages:

* **Uses Fabric native REST APIs** - Built on official Microsoft Fabric APIs, ensuring compatibility and long-term support
* **Python-native** - Seamless integration with modern Python-based DevOps workflows
* **Parameterization**: Built-in support for environment-specific configurations (workspace IDs, data sources, connection strings)
* **Developer-friendly**: Simple Python scripts that can run locally or in CI/CD pipelines
* **Orphan cleanup**: Automatically removes items from workspace that no longer exist in source control
* **Reliable authentication**: Uses Azure Identity SDK with multiple authentication options

## Prerequisites

Before you begin, ensure you have:

* [Python](https://www.python.org/) (version 3.9 to 3.12)
* A Power BI Desktop project saved in PBIP format
* Access to a Microsoft Fabric workspace with Contributor role

For automated deployments, you also need:

* A service principal with at least the Contributor role on target Fabric workspaces
* Access to Azure DevOps or GitHub Actions
* Your PBIP files in source control (Git, Azure DevOps, or GitHub)

## Quick start

This quick start shows you how to deploy a PBIP project from your local machine to a Fabric workspace.

### 1. Install fabric-cicd

Open your terminal and install fabric-cicd:

```bash
pip install fabric-cicd
```

### 2. Prepare your PBIP project

Ensure your PBIP project includes the required files. A typical PBIP project structure:

```
my-powerbi-project/
├── SalesAnalytics.Report/
│   ├── definition.pbir
│   └── definition/
│       └── pages/
├── SalesAnalytics.SemanticModel/
│   ├── definition.pbism
│   └── definition/
│       ├── model.tmdl
│       ├── tables/
│       └── ...
└── SalesAnalytics.pbip
```

:::image type="content" source="media/projects-deploy-fabric-cicd/pbip-project-structure.png" alt-text="Screenshot showing PBIP project folder structure in File Explorer.":::

For detailed information on required files and formats, see [Power BI Desktop project report folder](./projects-report.md) and [Power BI Desktop project semantic model folder](./projects-dataset.md).

> [!TIP]
> To create a PBIP project, open your PBIX file in Power BI Desktop and save it using **File > Save As > Power BI Project (.pbip)**. See [Power BI Desktop projects](./projects-overview.md) for more details.

### 3. Create deployment script

Create a `deploy.py` file in your project directory:

```python
from azure.identity import InteractiveBrowserCredential
from fabric_cicd import FabricWorkspace, publish_all_items

credential = InteractiveBrowserCredential()

target_workspace = FabricWorkspace(
    workspace_name="My Development Workspace",  # Or use: workspace_id="your-workspace-id"
    environment="dev",
    repository_directory=".",
    item_type_in_scope=["SemanticModel", "Report"],  # Deploy both semantic models and reports
    token_credential=credential,
)

publish_all_items(target_workspace)
```

:::image type="content" source="media/projects-deploy-fabric-cicd/deploy-script-vscode.png" alt-text="Screenshot showing deploy.py file in VS Code with deployment configuration.":::

### 4. Deploy

Run the deployment script:

```bash
python deploy.py
```

Your browser opens for authentication. After signing in, fabric-cicd deploys your PBIP files to the target workspace. You see progress messages like:

```
[info] Publishing SemanticModel 'SalesAnalytics'
       Operation in progress. Checking again in 1 second (Attempt 1)...
       Published

[info] Publishing Report 'SalesAnalytics'
       Published
```

:::image type="content" source="media/projects-deploy-fabric-cicd/deployment-output-terminal.png" alt-text="Screenshot showing terminal output with deployment progress messages.":::

Deployment typically takes 20-30 seconds depending on the size of your semantic model.

> [!TIP]
> If you see a warning about a missing parameter.yml file, this is expected and can be ignored. The parameter file is only needed for [environment-specific parameterization](https://microsoft.github.io/fabric-cicd/latest/how_to/parameterization/).

:::image type="content" source="media/projects-deploy-fabric-cicd/fabric-workspace-deployed-items.png" alt-text="Screenshot showing deployed semantic model and report in Fabric workspace.":::

> [!NOTE]
> The first time you deploy a semantic model with data sources, you need to manually configure data source credentials in the Fabric portal. Go to workspace > semantic model > Settings > Data source credentials. Subsequent deployments reuse the saved credentials.

## Advanced features

fabric-cicd offers many advanced features beyond basic deployment:

* **Environment parameterization**: Replace workspace IDs, lakehouse IDs, and connection strings for different environments using parameter.yml files
* **Orphan cleanup**: Automatically remove items from the workspace that no longer exist in source control
* **Multiple authentication methods**: Support for Azure CLI, managed identity, and service principal authentication
* **Configuration Based Deployment**: Define all deployment settings in a single YAML configuration file instead of Python code, simplifying multi-environment deployments to one function call

For complete documentation on these features, see the [fabric-cicd documentation](https://microsoft.github.io/fabric-cicd/latest/).

## Azure DevOps automation

Automate PBIP deployments with Azure Pipelines. This example shows how to deploy to different workspaces based on the branch.

Create `.azuredevops/deploy-pipeline.yml` in your repository:

```yaml
trigger:
  branches:
    include:
      - dev
      - main

variables:
  - name: workspace_ids
    value: |
      {
        "dev": "11111111-1111-1111-1111-111111111111",
        "main": "22222222-2222-2222-2222-222222222222",
        "default": "11111111-1111-1111-1111-111111111111"
      }
  - name: environments
    value: |
      {
        "dev": "dev",
        "main": "prod",
        "default": "dev"
      }

stages:
  - stage: Build_Release
    jobs:
      - job: Build
        pool:
          vmImage: 'windows-latest'
        steps:
          - checkout: self
          - task: UsePythonVersion@0
            inputs:
              versionSpec: '3.12'
              addToPath: true
          - script: |
              pip install fabric-cicd
            displayName: 'Install fabric-cicd'
          - task: AzureCLI@2
            displayName: 'Deploy PBIP to Fabric'
            inputs:
              azureSubscription: 'fabric-service-connection'
              scriptType: 'ps'
              scriptLocation: 'inlineScript'
              inlineScript: |
                $branch_name = ${env:BUILD_SOURCEBRANCHNAME}
                
                $workspace_ids = '$(workspace_ids)' | ConvertFrom-Json
                $environments = '$(environments)' | ConvertFrom-Json
                
                if ($workspace_ids.PSObject.Properties.Name -contains $branch_name) {
                    $workspace_id = $workspace_ids.$branch_name
                } else {
                    $workspace_id = $workspace_ids.default
                }
                
                if ($environments.PSObject.Properties.Name -contains $branch_name) {
                    $environment = $environments.$branch_name
                } else {
                    $environment = $environments.default
                }
                
                python -u deploy-pipeline.py `
                  --workspace_id "$workspace_id" `
                  --environment "$environment"
```

### Create deployment script

Create `deploy-pipeline.py` that accepts command-line arguments:

```python
import argparse
from azure.identity import AzureCliCredential
from fabric_cicd import FabricWorkspace, publish_all_items

parser = argparse.ArgumentParser(description="Deploy PBIP to Fabric")
parser.add_argument("--workspace_id", type=str, required=True, help="Workspace ID")
parser.add_argument("--environment", type=str, default="prod", help="Environment")
args = parser.parse_args()

# Uses the identity from the AzureCLI@2 task
credential = AzureCliCredential()

target_workspace = FabricWorkspace(
    workspace_id=args.workspace_id,
    environment=args.environment,
    repository_directory=".",
    item_type_in_scope=["SemanticModel", "Report"],
    token_credential=credential,
)

publish_all_items(target_workspace)
```

### Set up Azure DevOps

1. **Create a service principal** in Azure AD with Contributor or Admin role on your Fabric workspaces
2. **Add the service principal to your Fabric workspace**:
   - Open Fabric portal and navigate to your workspace
   - Go to Workspace Settings > Manage access
   - Add the service principal with Contributor or Admin role
3. **Create an Azure service connection** in Azure DevOps project settings:
   - Go to Project Settings > Service connections
   - Create a new Azure Resource Manager service connection
   - Use the service principal credentials
   - Name it `fabric-service-connection` (or update the pipeline YAML)

   :::image type="content" source="media/projects-deploy-fabric-cicd/fabric-service-connection.png" alt-text="Screenshot showing Azure service connection configuration in Azure DevOps.":::

4. **Create a new pipeline** in Azure DevOps:
   - Go to Pipelines > New pipeline
   - Select your repository and choose "Existing Azure Pipelines YAML file"
   - Select the path to your deploy-pipeline.yml file

   :::image type="content" source="media/projects-deploy-fabric-cicd/azure-devops-pipeline-setup1.png" alt-text="Screenshot showing new pipeline creation in Azure DevOps.":::

   :::image type="content" source="media/projects-deploy-fabric-cicd/azure-devops-pipeline-setup2.png" alt-text="Screenshot showing pipeline YAML file selection in Azure DevOps.":::

5. **Update the workspace IDs in the YAML**:
   - Edit the `workspace_ids` variable in deploy-pipeline.yml
   - Set workspace IDs for each branch (dev, main) and a default fallback
   - The pipeline automatically selects the correct workspace based on the branch that triggered it
6. **Save and run the pipeline** to deploy your PBIP to Fabric

   :::image type="content" source="media/projects-deploy-fabric-cicd/azure-devops-pipeline-run.png" alt-text="Screenshot showing successful Azure DevOps pipeline execution deploying PBIP to Fabric.":::

## GitHub Actions automation

Automate PBIP deployments with GitHub Actions. This example shows how to deploy to different workspaces based on the branch.

Create `.github/workflows/deploy.yml` in your repository:

```yaml
name: Deploy PBIP to Fabric

on:
  push:
    branches: [dev, main]
  workflow_dispatch:

jobs:
  deploy:
    runs-on: windows-latest
    steps:
      - uses: actions/checkout@v3
      
      - uses: actions/setup-python@v4
        with:
          python-version: '3.12'
      
      - name: Set workspace variables
        id: workspace
        run: |
          $branch_name = "${{ github.ref_name }}"
          
          $workspace_ids = @{
            "dev" = "11111111-1111-1111-1111-111111111111"
            "main" = "22222222-2222-2222-2222-222222222222"
            "default" = "11111111-1111-1111-1111-111111111111"
          }
          
          $environments = @{
            "dev" = "dev"
            "main" = "prod"
            "default" = "dev"
          }
          
          if ($workspace_ids.ContainsKey($branch_name)) {
            $workspace_id = $workspace_ids[$branch_name]
          } else {
            $workspace_id = $workspace_ids["default"]
          }
          
          if ($environments.ContainsKey($branch_name)) {
            $environment = $environments[$branch_name]
          } else {
            $environment = $environments["default"]
          }
          
          echo "workspace_id=$workspace_id" >> $env:GITHUB_OUTPUT
          echo "environment=$environment" >> $env:GITHUB_OUTPUT
      
      - name: Install fabric-cicd
        run: pip install fabric-cicd
      
      - name: Azure Login
        uses: azure/login@v1
        with:
          creds: ${{ secrets.AZURE_CREDENTIALS }}
      
      - name: Deploy PBIP to Fabric
        run: python deploy-pipeline.py --workspace_id ${{ steps.workspace.outputs.workspace_id }} --environment ${{ steps.workspace.outputs.environment }}
```

### Create deployment script

Create `deploy-pipeline.py` that accepts command-line arguments:

```python
import argparse
from azure.identity import AzureCliCredential
from fabric_cicd import FabricWorkspace, publish_all_items

parser = argparse.ArgumentParser(description="Deploy PBIP to Fabric")
parser.add_argument("--workspace_id", required=True, help="Target workspace ID")
parser.add_argument("--environment", default="prod", help="Environment name")
args = parser.parse_args()

credential = AzureCliCredential()

target_workspace = FabricWorkspace(
    workspace_id=args.workspace_id,
    environment=args.environment,
    repository_directory=".",
    item_type_in_scope=["SemanticModel", "Report"],
    token_credential=credential,
)

publish_all_items(target_workspace)
```

### Set up GitHub Actions

1. **Create a service principal** in Azure AD with Contributor or Admin role on your Fabric workspaces
2. **Add the service principal to your Fabric workspace**:
   - Open Fabric portal and navigate to your workspace
   - Go to Workspace Settings > Manage access
   - Add the service principal with Contributor or Admin role
3. **Create the Azure credentials secret**:
   - Get your service principal credentials in JSON format:
     ```json
     {
       "clientId": "<service-principal-client-id>",
       "clientSecret": "<service-principal-secret>",
       "subscriptionId": "<azure-subscription-id>",
       "tenantId": "<azure-tenant-id>"
     }
     ```
   - Go to GitHub repository Settings > Secrets and variables > Actions
   - Add `AZURE_CREDENTIALS` with the JSON above

4. **Update the workspace IDs in the workflow**:
   - Edit the `workspace_ids` hashtable in the "Set workspace variables" step
   - Set workspace IDs for each branch (dev, main) and a default fallback
   - The workflow automatically selects the correct workspace based on the branch that triggered it
5. **Commit the workflow YAML** and deployment script to your repository

## Related content

* [fabric-cicd documentation](https://microsoft.github.io/fabric-cicd/latest/)
* [fabric-cicd GitHub repository](https://github.com/microsoft/fabric-cicd)
* [Fabric Git integration overview](/fabric/cicd/git-integration/intro-to-git-integration)
* [Power BI implementation planning: Content lifecycle management](../../guidance/powerbi-implementation-planning-content-lifecycle-management-overview.md)
