---
title: Deploy Power BI projects (PBIP) using fabric-cicd
description: Learn how to deploy Power BI Desktop projects (PBIP) using the fabric-cicd Python library for manual and automated deployments.
author: justinmartin
ms.author: justinmartin
ms.reviewer: ruiromano
ms.service: powerbi
ms.subservice: powerbi-developer
ms.topic: tutorial
ms.date: 1/20/2026
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

> [!NOTE]
> For complete documentation, see the [fabric-cicd documentation](https://microsoft.github.io/fabric-cicd/latest/).

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

For detailed information on required files and formats, see [Power BI Desktop project report folder](./projects-report.md) and [Power BI Desktop project semantic model folder](./projects-dataset.md).

> [!TIP]
> To create a PBIP project, open your PBIX file in Power BI Desktop and save it using **File > Save As > Power BI Project (.pbip)**. See [Power BI Desktop projects](./projects-overview.md) for more details.

### 3. Create deployment script

Create a `deploy.py` file in your project directory:

```python
import argparse
import sys
from azure.identity import InteractiveBrowserCredential, AzureCliCredential
from fabric_cicd import FabricWorkspace, publish_all_items

parser = argparse.ArgumentParser(description="Deploy PBIP to Fabric")
parser.add_argument("--workspace_id", type=str, required=True, help="Target workspace ID")
parser.add_argument("--environment", type=str, default="dev", help="Environment name")
args = parser.parse_args()

# Use AzureCliCredential in CI/CD, fall back to InteractiveBrowserCredential for local
try:
    credential = AzureCliCredential()
except Exception:
    credential = InteractiveBrowserCredential()

workspace_params = {
    "workspace_id": args.workspace_id,
    "environment": args.environment,
    "repository_directory": ".",
    "item_type_in_scope": ["SemanticModel", "Report"],
    "token_credential": credential,
}

target_workspace = FabricWorkspace(**workspace_params)
publish_all_items(target_workspace)
```

### 4. Deploy

Run the deployment script with your workspace ID:

```bash
python deploy.py --workspace_id "11111111-1111-1111-1111-111111111111"
```

Your browser opens for authentication. After signing in, fabric-cicd deploys your PBIP files to the target workspace. You see progress messages like:

```
[info] Publishing SemanticModel 'SalesAnalytics'
       Operation in progress. Checking again in 1 second (Attempt 1)...
       Published

[info] Publishing Report 'SalesAnalytics'
       Published
```

Deployment typically takes 20-30 seconds depending on the size of your semantic model.

> [!NOTE]
> The first time you deploy a semantic model with data sources, you need to manually configure data source credentials in the Fabric portal. Go to workspace > semantic model > Settings > Data source credentials. Subsequent deployments reuse the saved credentials.

## Environment-specific parameterization

One of fabric-cicd's most powerful features is the ability to parameterize your PBIP files for different environments. This is essential when your semantic models reference environment-specific resources like workspace IDs, lakehouse IDs, or connection strings.

### Example: Parameterize workspace and lakehouse IDs

Create a `parameter.yml` file in your project root to define environment-specific values:

```yaml
find_replace:
  # Replace workspace ID for DirectLake connection
  - find_value: "11111111-1111-1111-1111-111111111111"
    replace_value:
      dev: "11111111-1111-1111-1111-111111111111"  # Dev workspace
      prod: "22222222-2222-2222-2222-222222222222"  # Prod workspace

  # Replace lakehouse ID for DirectLake semantic model
  - find_value: "aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa"
    replace_value:
      dev: "aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa"  # Dev lakehouse
      prod: "bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb"  # Prod lakehouse
```

When you run `python deploy.py --workspace_id "11111111-1111-1111-1111-111111111111" --environment dev`, fabric-cicd automatically:
1. Reads the parameter.yml file
2. Finds all instances of `find_value` in your PBIP definition files
3. Replaces them with the corresponding environment-specific `replace_value`
4. Deploys the modified definitions to the target workspace

## Azure DevOps automation

Automate PBIP deployments with Azure Pipelines. This example shows how to deploy to different workspaces based on the branch.

Create `azure-pipelines.yml` in your repository root:

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
        "main": "22222222-2222-2222-2222-222222222222"
      }
  - name: environments
    value: |
      {
        "dev": "dev",
        "main": "prod"
      }

stages:
  - stage: Deploy
    jobs:
      - job: DeployPBIP
        pool:
          vmImage: 'windows-latest'
        steps:
          - checkout: self
          - task: UsePythonVersion@0
            inputs:
              versionSpec: '3.12'
              addToPath: true
          - task: AzureCLI@2
            displayName: 'Deploy PBIP to Fabric'
            inputs:
              azureSubscription: 'your-azure-service-connection'
              scriptType: 'ps'
              scriptLocation: 'inlineScript'
              inlineScript: |
                cd "$(Build.SourcesDirectory)"
                
                pip install fabric-cicd
                
                $branch_ref = $env:BUILD_SOURCEBRANCH
                $branch_name = $branch_ref -replace '^refs/heads/', ''
                
                $workspace_ids = '$(workspace_ids)' | ConvertFrom-Json
                $environments = '$(environments)' | ConvertFrom-Json
                
                $workspace_id = $workspace_ids.$branch_name
                $environment = $environments.$branch_name
                
                python -u deploy.py --workspace_id "$workspace_id" --environment "$environment"
                
                if ($LASTEXITCODE -ne 0) {
                    Write-Error "Deployment failed with exit code: $LASTEXITCODE"
                    exit $LASTEXITCODE
                }
```

### Set up Azure DevOps

1. **Create a service principal** in Azure AD with Contributor or Admin role on your Fabric workspaces
2. **Add the service principal to your Fabric workspace**:
   - Open Fabric portal and navigate to your workspace
   - Go to Workspace Settings > Manage access
   - Add the service principal with Contributor or Admin role

> [!NOTE]
> Service principals must be enabled at the tenant level to use Fabric APIs. For more information, see [Service principals can call Fabric public APIs](/fabric/admin/service-admin-portal-developer#service-principals-can-call-fabric-public-apis).

3. **Create an Azure service connection** in Azure DevOps project settings:
   - Go to Project Settings > Service connections
   - Create a new Azure Resource Manager service connection using your service principal credentials
   - For detailed instructions, see [Connect to Microsoft Azure](/azure/devops/pipelines/library/connect-to-azure)
   - Update the `azureSubscription` value in the YAML to match your service connection name
4. **Update the workspace IDs in the YAML**:
   - Edit the `workspace_ids` variable in azure-pipelines.yml in your repository
   - Set your dev and prod workspace IDs
   - Commit and push the changes to source control
5. **Create a new pipeline** in Azure DevOps:
   - Go to Pipelines > New pipeline
   - Select your repository and choose "Existing Azure Pipelines YAML file"
   - Select azure-pipelines.yml
   - For detailed instructions, see [Create your first pipeline](/azure/devops/pipelines/create-first-pipeline)
   - Save and run the pipeline to deploy your PBIP to Fabric

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
        shell: pwsh
        run: |
          $branch_name = "${{ github.ref_name }}"
          
          $workspace_ids = @{
            "dev" = "11111111-1111-1111-1111-111111111111"
            "main" = "22222222-2222-2222-2222-222222222222"
          }
          
          $environments = @{
            "dev" = "dev"
            "main" = "prod"
          }
          
          $workspace_id = $workspace_ids[$branch_name]
          $environment = $environments[$branch_name]
          
          echo "workspace_id=$workspace_id" >> $env:GITHUB_OUTPUT
          echo "environment=$environment" >> $env:GITHUB_OUTPUT
      
      - name: Azure Login
        uses: azure/login@v1
        with:
          creds: ${{ secrets.AZURE_CREDENTIALS }}
      
      - name: Deploy PBIP to Fabric
        shell: pwsh
        run: |
          pip install fabric-cicd
          
          python -u deploy.py --workspace_id "${{ steps.workspace.outputs.workspace_id }}" --environment "${{ steps.workspace.outputs.environment }}"
          
          if ($LASTEXITCODE -ne 0) {
              Write-Error "Deployment failed with exit code: $LASTEXITCODE"
              exit $LASTEXITCODE
          }
```

### Set up GitHub Actions

1. **Create a service principal** in Azure AD with Contributor or Admin role on your Fabric workspaces
2. **Add the service principal to your Fabric workspace**:
   - Open Fabric portal and navigate to your workspace
   - Go to Workspace Settings > Manage access
   - Add the service principal with Contributor or Admin role

> [!NOTE]
> Service principals must be enabled at the tenant level to use Fabric APIs. For more information, see [Service principals can call Fabric public APIs](/fabric/admin/service-admin-portal-developer#service-principals-can-call-fabric-public-apis).

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
   - Edit the `workspace_ids` hashtable in the "Set workspace variables" step in `.github/workflows/deploy.yml`
   - Set your dev and prod workspace IDs
   - Commit and push the workflow YAML to your repository

## Related content

* [fabric-cicd documentation](https://microsoft.github.io/fabric-cicd/latest/)
* [fabric-cicd GitHub repository](https://github.com/microsoft/fabric-cicd)
* [Fabric Git integration overview](/fabric/cicd/git-integration/intro-to-git-integration)
* [Power BI implementation planning: Content lifecycle management](../../guidance/powerbi-implementation-planning-content-lifecycle-management-overview.md)
