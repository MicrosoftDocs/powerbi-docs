---
title: Azure DevOps pipeline integration with Power BI Desktop projects
description: Learn about Azure DevOps pipelines and how to use them with Desktop projects
author: mberdugo
ms.author: monaberdugo
ms.reviewer: ruiromano
ms.service: powerbi
ms.subservice:
ms.topic: tutorial
ms.date: 10/15/2023
---

# Power BI Project (PBIP) and Azure DevOps Pipelines

Combining Fabric Git Integration with Azure DevOps, enables you to can connect a workspace to a branch in an Azure DevOps repository and automatically synchronizes between them.

Integrating the PBIP format with Azure DevOps lets you leverage Azure Pipelines to automate Continuous Integration/Continuous Deployment (CI/CD) pipelines. These pipelines process the PBIP metadata files and apply a series of quality checks to your development before deploying it to the production system.

In this article, we will focus on continuous integration and describe how to create an Azure DevOps build pipeline that guarantees best practices for all datasets and reports within a Fabric workspace. By implementing automated quality tests, you can prevent common mistakes, and enhances team efficiency. For example, this approach ensures that new team members adhere to established standards for dataset and report development.

Learn more about PBIP and Fabric Git Integration in our [blog post](https://powerbi.microsoft.com/blog/deep-dive-into-power-bi-desktop-developer-mode-preview/).

The following diagram illustrates the end-to-end scenario with two development workflows that trigger the Azure DevOps build pipeline to validate development quality:

:::image type="content" source="./media/projects-adzo-pipelines/pipeline.png" alt-text="Diagram showing workflow of build pipeline.":::

1. *User 1* develops [using Power BI Desktop](/fabric/cicd/git-integration/manage-branches#develop-using-client-tools).

   1. Create a branch from main using VS Code (feature/datasetchange)
   1. Make changes to dataset using Power BI Desktop
   1. Commit changes to remote repository branch using VS Code
   1. Create Pull Request to main branch using Azure DevOps

1. At the same time, *User 2* develops [using another Fabric workspace](/fabric/git-integration/manage-branches#develop-using-another-workspace).

   1. Create branch from main using Fabric Git (feature/reportchange)
   1. Make report changes in the Fabric workspace
   1. Commit changes to remote repository branch using Fabric Git
   1. Create Pull Request to main branch using Azure DevOps

1. The team lead reviews the Pull Requests and synchronizes the changes to the team workspace using Fabric Git.
1. The Pull Request triggers the Azure DevOps build pipeline to inspect the dataset and report development quality.

>[!NOTE]
>
>In this example, the build pipeline uses two open-source community tools that enable a developer to apply (customizable) best practice rules to the metadata of datasets and reports within a Power BI Project folder:
>
>* [Tabular Editor](https://github.com/TabularEditor/TabularEditor) (by Daniel Otykier) and [Best Practice Rules](https://github.com/microsoft/Analysis-Services/tree/master/BestPracticeRules) (by Michael Kovalsky)
>* [PBI Inspector](https://github.com/NatVanG/PBI-Inspector) (by Nat Van Gulck)
>
>The same approach would apply any similar. This article doesn't delve into the specifics of the community tools mentioned above nor rule creation and editing. For in-depth information on these topics, refer to the links provided. The focus of this article is on the *process* of establishing a quality gate between source control and Fabric Workspace. It's important to note that the referred community tools are developed by third-party contributors, and Microsoft does not offer support or documentation for them.

## Step 1 - Connect Fabric Workspace to Azure DevOps

[Connect your Fabric workspace to Azure DevOps](https://learn.microsoft.com/fabric/cicd/git-integration/git-get-started?tabs=commit-to-git#connect-a-workspace-to-an-azure-repo):

:::image type="content" source="./media/projects-adzo-pipelines/connect.png" alt-text="Screenshot showing the Git integration tab of the workspace settings.":::

When Fabric Git integration finishes exporting your workspace items, your Azure DevOps branch will contain a folder for each item in your workspace:

:::image type="content" source="./media/projects-adzo-pipelines/connected-branch.png" alt-text="Screenshot showing the Azure DevOps branch with folders for different workspace items.":::

## Step 2 - Create and Run an Azure DevOps Build Pipeline

To create a new build pipeline:

1. From the **Pipelines** tab of the left navigation menu, select **Create Pipeline** :

   :::image type="content" source="./media/projects-adzo-pipelines/create-pipeline.png" alt-text="Screenshot showing the Git integration tab of the workspace settings.":::

1. Select **Azure Repos Git** and select the first repository (the same repository that's connected to the Fabric workspace):

   :::image type="content" source="./media/projects-adzo-pipelines/code.png" alt-text="Screenshot showing Azure repo Git selected as the code source for the pipeline.":::

   :::image type="content" source="./media/projects-adzo-pipelines/select-repo.png" alt-text="Screenshot showing the the Demo-ADObuild repo selected.":::

1. Select **Starter pipeline**.

   :::image type="content" source="./media/projects-adzo-pipelines/configure-pipeline.png" alt-text="Screenshot showing the the starter pipeline icon selected.":::

   The following YAML code appears in the editor:

   :::image type="content" source="./media/projects-adzo-pipelines/review-yaml.png" alt-text="Screenshot showing the the starter pipeline icon selected.":::

1. Copy and paste the YAML code from the following link into the pipeline you just created:

   [powerbi-devmode-pipelines/azure-pipelines-build.yml at main · RuiRomano/powerbi-devmode-pipelines (github.com)](https://github.com/RuiRomano/powerbi-devmode-pipelines/blob/main/azure-pipelines-build.yml)

   :::image type="content" source="./media/projects-adzo-pipelines/yaml-code-1.png" alt-text="Screenshot showing YAML code to be added.":::

   :::image type="content" source="./media/projects-adzo-pipelines/demo-build.png" alt-text="Screenshot showing second part of YAML code.":::

1. Click **Save and Run** and commit your new pipeline to the repository.

   :::image type="content" source="./media/projects-adzo-pipelines/review-pipeline-yaml.png" alt-text="Screenshot a review of the YAML code.":::

   :::image type="content" source="./media/projects-adzo-pipelines/save-run.png" alt-text="Screenshot showing save and run selection.":::

Azure DevOps will run the pipeline and start two build jobs in parallel:

:::image type="content" source="./media/projects-adzo-pipelines/setup-pipeline.png" alt-text="Screenshot showing Azure DevOps building a pipeline.":::

* Build_Datasets
  * Downloads Tabular Editor binaries.
  * Download Best Practice Analyzer [default rules](https://github.com/microsoft/Analysis-Services/tree/master/BestPracticeRules). To customize the rules, add a *Rules-Dataset.json* to the root of the repository.
  * Cycle through all the dataset item folders and run Tabular Editor BPA Rules.
* Build_Reports
  * Download PBI Inspector binaries.
  * Download PBI Inspector [default rules](https://github.com/NatVanG/PBI-Inspector/blob/main/Rules/Base%20rules.json). To customize the rules, add a *Rules-Report.json* to the root of the repository.
  * Cycle through all the report item folders and run Power BI Inspector rules.

When it finishes, Azure DevOps will provide you with a report of all the warnings and errors it encountered:

:::image type="content" source="./media/projects-adzo-pipelines/errors.png" alt-text="Screenshot showing error report.":::

Click on the link to open a more detailed view of the two build jobs:

:::image type="content" source="./media/projects-adzo-pipelines/view-log.png" alt-text="Screenshot showing view log button.":::

:::image type="content" source="./media/projects-adzo-pipelines/report-rules.png" alt-text="Screenshot showing expanded error log.":::

If your report or dataset fails a rule with a higher severity level, the build will fail, and the error will be highlighted:

:::image type="content" source="./media/projects-adzo-pipelines/manual-run.png" alt-text="Screenshot showing highlighter errors.":::

## Branch Policies

Once the pipeline is up and running, enable **Branch Policies** on the *main* branch. This step ensures that no commits can be made directly into main. A ["pull request"](https://learn.microsoft.com/azure/devops/repos/git/pull-requests?view=azure-devops&tabs=browser) is always required to merge changes back into *main* and you can configure the build pipeline to run with every pull request.

1. Select **Branches** > **main Branch** > **Branch policies**:

   :::image type="content" source="./media/projects-adzo-pipelines/branch-policies.png" alt-text="Screenshot showing branch policies.":::

1. Configure the created pipeline as a *Build Policy* for the branch:

   :::image type="content" source="./media/projects-adzo-pipelines/build-policy.png" alt-text="Screenshot showing the build policy UI.":::

   :::image type="content" source="./media/projects-adzo-pipelines/build-policy-2.png" alt-text="Screenshot showing second part of the buildpolicy UI.":::

## Changes and Pull Request

If you return to your Fabric Workspace, make a modification to one of the reports or datasets, and attempt to commit the change, you will receive the following error:

:::image type="content" source="./media/projects-adzo-pipelines/commit-change.png" alt-text="Screenshot showing the unable to commit change error.":::

You can only make changes to the main branch through a pull request. To create a pull request checkout a new branch to make the changes on:

Create a branch directly from the Fabric Workspace:

1. In the Source Control pane, click on **Checkout new branch** and provide a name for the branch:

   :::image type="content" source="./media/projects-adzo-pipelines/source-control.png" alt-text="Screenshot showing the source control screen to checkout a new branch.":::

   :::image type="content" source="./media/projects-adzo-pipelines/checkout-branch.png" alt-text="Screenshot showing how to checkout a new branch.":::

   Alternatively, you can choose to develop within a separate, isolated workspace or in Power BI Desktop. For more information, refer to [develop using another workspace](/fabric/cicd/git-integration/manage-branches#develop-using-another-workspace)

1. Commit your changes to this new branch.

   :::image type="content" source="./media/projects-adzo-pipelines/commit-change-to-branch.png" alt-text="Screenshot showing commit changes to branch.":::

1. Following the commit, create a pull request into the *main* branch from the Azure DevOps portal.

:::image type="content" source="./media/projects-adzo-pipelines/create-pull-request.png" alt-text="Screenshot showing a new pull request created.":::

:::image type="content" source="./media/projects-adzo-pipelines/new-pull-request.png" alt-text="Screenshot showing created pull request.":::

The pull request workflow not only allows you to validate and review the changes, but also automatically triggers the build pipeline.

:::image type="content" source="./media/projects-adzo-pipelines/report-change.png" alt-text="Screenshot showing report change.":::

In the event of a high-severity build error in one of the rules, it won't be possible to finalize the Pull Request and merge the changes back into the main branch.

:::image type="content" source="./media/projects-adzo-pipelines/complete-pull-request.png" alt-text="Screenshot completed pull request.":::
