---
title: Deploy Power BI projects (PBIP) using fabric-cicd
description: Learn how to deploy Power BI Desktop projects (PBIP) using the fabric-cicd Python library for manual and automated deployments.
author: [TO_BE_FILLED]
ms.author: [TO_BE_FILLED]
ms.reviewer: ruiromano
ms.service: powerbi
ms.subservice: powerbi-developer
ms.topic: tutorial
ms.date: 12/12/2025
---

# Deploy Power BI projects (PBIP) using fabric-cicd

> [!IMPORTANT]
> Power BI Desktop projects is currently in **preview**.

[fabric-cicd](https://microsoft.github.io/fabric-cicd/latest/) is a Python library developed by Microsoft that provides the easiest way for developers to deploy Power BI Desktop project (PBIP) files from source control to Fabric workspaces.

In this article, you learn how to:

* Deploy PBIP files from your local machine
* Configure environment-specific parameters for different workspaces
* Automate deployments with CI/CD pipelines in Azure DevOps or GitHub Actions

Learn more about PBIP format in [Power BI Desktop projects (PBIP)](./projects-overview.md) and [Fabric Git integration overview](/fabric/cicd/git-integration/intro-to-git-integration).

## Why fabric-cicd for PBIP deployment?

fabric-cicd is specifically designed for deploying source-controlled Fabric artifacts and offers several advantages:

* **Uses Fabric native REST APIs** - Built on official Microsoft Fabric APIs, ensuring compatibility and long-term support
* **Format-agnostic** - Deploy TMDL or BIM semantic models without conversion
* **Integrated deployment** - Deploy semantic models and reports together from PBIP projects  
* **Python-native** - Seamless integration with modern Python-based DevOps workflows

* **Complete deployment**: Deploys both semantic models and reports in a single operation
* **Parameterization**: Built-in support for environment-specific configurations (workspace IDs, data sources, connection strings)
* **Developer-friendly**: Simple Python scripts that can run locally or in CI/CD pipelines
* **Orphan cleanup**: Automatically removes items from workspace that no longer exist in source control
* **Reliable authentication**: Uses Azure Identity SDK with multiple authentication options

## Prerequisites

Before you begin, ensure you have:

* [Python](https://www.python.org/) (version 3.9 to 3.12)
* A Power BI Desktop project saved in PBIP format
* Your PBIP files in source control (Git, Azure DevOps, or GitHub)
* Access to a Microsoft Fabric workspace with Contributor role

For automated deployments, you also need:

* A service principal with at least the Contributor role on target Fabric workspaces
* Access to Azure DevOps or GitHub Actions

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
│   ├── definition.pbir          # Required
│   └── definition/              # Required for PBIR format
│       └── pages/
├── SalesAnalytics.SemanticModel/
│   ├── definition.pbism         # Required
│   └── definition/              # Required for TMDL format
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
from azure.identity import InteractiveBrowserCredential
from fabric_cicd import FabricWorkspace, publish_all_items

credential = InteractiveBrowserCredential()

target_workspace = FabricWorkspace(
    workspace_name="My Development Workspace",  # Replace with your workspace name
    environment="dev",
    repository_directory=".",
    item_type_in_scope=["SemanticModel", "Report"],  # Deploy both semantic models and reports
    token_credential=credential,
)

publish_all_items(target_workspace)
```

> [!IMPORTANT]
> Replace `"My Development Workspace"` with your actual Fabric workspace name. The workspace must exist and you must have Contributor or Admin permissions.

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

Deployment typically takes 20-30 seconds depending on the size of your semantic model.

> [!NOTE]
> The first time you deploy a semantic model with data sources, you need to manually configure data source credentials in the Fabric portal. Go to workspace > semantic model > Settings > Data source credentials. Subsequent deployments reuse the saved credentials.

## Advanced features

fabric-cicd offers many advanced features beyond basic deployment:

* **Environment parameterization**: Replace workspace IDs, lakehouse IDs, and connection strings for different environments using parameter.yml files
* **Orphan cleanup**: Automatically remove items from the workspace that no longer exist in source control
* **Selective deployment**: Deploy only specific item types (semantic models only, reports only)
* **Multiple authentication methods**: Support for Azure CLI, managed identity, and service principal authentication
* **Workspace by ID or name**: Reference workspaces by name or GUID

For complete documentation on these features, see the [fabric-cicd documentation](https://microsoft.github.io/fabric-cicd/latest/).

## Azure DevOps automation

Automate PBIP deployments with Azure Pipelines. This example shows how to deploy to different workspaces based on the branch.

Create `.azuredevops/deploy-pipeline.yml` in your repository:

```yaml
trigger:
  branches:
    include:
      - main

pool:
  vmImage: 'ubuntu-latest'

variables:
  - group: fabric-credentials

steps:
  - task: UsePythonVersion@0
    inputs:
      versionSpec: '3.11'
    displayName: 'Use Python 3.11'

  - script: pip install fabric-cicd
    displayName: 'Install fabric-cicd'

  - task: AzureCLI@2
    displayName: 'Deploy PBIP to Fabric'
    inputs:
      azureSubscription: 'fabric-service-connection'
      scriptType: 'bash'
      scriptLocation: 'inlineScript'
      inlineScript: |
        python deploy.py
    env:
      AZURE_TENANT_ID: $(AZURE_TENANT_ID)
      AZURE_CLIENT_ID: $(AZURE_CLIENT_ID)
      AZURE_CLIENT_SECRET: $(AZURE_CLIENT_SECRET)
      FABRIC_WORKSPACE_ID: $(FABRIC_WORKSPACE_ID)
```

Update your `deploy.py` to use service principal authentication:

```python
import os
from azure.identity import ClientSecretCredential
from fabric_cicd import FabricWorkspace, publish_all_items

credential = ClientSecretCredential(
    tenant_id=os.environ["AZURE_TENANT_ID"],
    client_id=os.environ["AZURE_CLIENT_ID"],
    client_secret=os.environ["AZURE_CLIENT_SECRET"],
)

target_workspace = FabricWorkspace(
    workspace_id=os.environ["FABRIC_WORKSPACE_ID"],
    environment=os.environ.get("ENVIRONMENT", "prod"),
    repository_directory=".",
    item_type_in_scope=["SemanticModel", "Report"],
    token_credential=credential,
)

publish_all_items(target_workspace)
```

### Set up Azure DevOps

1. **Create a service principal** in Azure AD with Contributor or Admin role on your Fabric workspaces
2. **Create a variable group** named `fabric-credentials` with:
   - `AZURE_TENANT_ID`: Your Azure tenant ID
   - `AZURE_CLIENT_ID`: Service principal client ID
   - `AZURE_CLIENT_SECRET`: Service principal secret (mark as secret)
   - `FABRIC_WORKSPACE_ID`: Target workspace ID
3. **Create an Azure service connection** in Azure DevOps project settings
4. **Commit the pipeline YAML** and deployment script to your repository

> [!TIP]
> For advanced scenarios like pre-deployment validation, orphan cleanup, or environment-specific parameterization, see the [fabric-cicd documentation](https://microsoft.github.io/fabric-cicd/latest/).

## GitHub Actions automation

Automate PBIP deployments with GitHub Actions. This example shows how to deploy to different workspaces based on the branch.

Create `.github/workflows/deploy.yml` in your repository:

```yaml
name: Deploy PBIP to Fabric

on:
  push:
    branches: [main]
  workflow_dispatch:

jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      
      - uses: actions/setup-python@v4
        with:
          python-version: '3.11'
      
      - name: Install fabric-cicd
        run: pip install fabric-cicd
      
      - name: Deploy PBIP to Fabric
        run: python deploy.py
        env:
          AZURE_TENANT_ID: ${{ secrets.AZURE_TENANT_ID }}
          AZURE_CLIENT_ID: ${{ secrets.AZURE_CLIENT_ID }}
          AZURE_CLIENT_SECRET: ${{ secrets.AZURE_CLIENT_SECRET }}
          FABRIC_WORKSPACE_ID: ${{ secrets.FABRIC_WORKSPACE_ID }}
```

### Set up GitHub Actions

1. **Create a service principal** in Azure AD with Contributor or Admin role on your Fabric workspaces
2. **Add repository secrets** in GitHub (Settings > Secrets and variables > Actions):
   - `AZURE_TENANT_ID`: Your Azure tenant ID
   - `AZURE_CLIENT_ID`: Service principal client ID
   - `AZURE_CLIENT_SECRET`: Service principal secret
   - `FABRIC_WORKSPACE_ID`: Target workspace ID
3. **Commit the workflow YAML** and deployment script to your repository

> [!TIP]
> For advanced scenarios like pre-deployment validation, orphan cleanup, or environment-specific parameterization, see the [fabric-cicd documentation](https://microsoft.github.io/fabric-cicd/latest/).

## Related content

* [fabric-cicd documentation](https://microsoft.github.io/fabric-cicd/latest/)
* [fabric-cicd GitHub repository](https://github.com/microsoft/fabric-cicd)
* [Fabric Git integration overview](/fabric/cicd/git-integration/intro-to-git-integration)
* [Power BI implementation planning: Content lifecycle management](../../guidance/powerbi-implementation-planning-content-lifecycle-management-overview.md)
