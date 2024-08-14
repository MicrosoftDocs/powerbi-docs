---
title: Azure DevOps build pipeline integration with Power BI Desktop projects
description: Learn about Azure Pipelines and how to use them with Power BI projects to validate developments.
author: mberdugo
ms.author: monaberdugo
ms.reviewer: ruiromano
ms.service: powerbi
ms.subservice: powerbi-developer
ms.topic: tutorial
ms.date: 08/13/2024
---

# Power BI Project (PBIP) and Azure DevOps build pipelines for validation

Combining Fabric Git Integration with Azure DevOps, enables you to connect a workspace to a branch in an Azure DevOps repository and automatically synchronizes between them.

Integrating the PBIP format with Azure DevOps lets you use Azure Pipelines to automate [Continuous Integration/Continuous Deployment](/azure/devops/pipelines/architectures/devops-pipelines-baseline-architecture) (CI/CD) pipelines. These pipelines process the PBIP metadata files and apply a series of quality checks to your development before deploying it to the production system.

In this article, we focus on continuous integration and describe how to create an Azure DevOps pipeline that guarantees best practices for all semantic models and reports within a Fabric workspace. By implementing automated quality tests, you can prevent common mistakes, and enhances team efficiency. For example, this approach ensures that new team members adhere to established standards for semantic model and report development.

Learn more about PBIP and Fabric Git Integration in [project-overview](./projects-overview.md) and [Fabric Git integration overview](/fabric/cicd/git-integration/intro-to-git-integration).

The following diagram illustrates the end-to-end scenario with two development workflows that trigger the Azure DevOps pipeline to validate development quality. The pipeline execute does the following actions:

:::image type="content" source="./media/projects-build-pipelines/pipeline.png" alt-text="Diagram showing workflow of DevOps pipeline." border="false" lightbox="./media/projects-build-pipelines/pipeline.png":::

1. *User 1* develops [using Power BI Desktop](/fabric/cicd/git-integration/manage-branches#develop-using-client-tools).

   1. Create a branch from main using **VS Code** (feature/datasetchange)
   1. Make changes to semantic model using Power BI Desktop
   1. Commit changes to remote repository branch using **VS Code**
   1. Create Pull Request to main branch using Azure DevOps

1. At the same time, *User 2* develops [using another Fabric workspace](/fabric/cicd/git-integration/manage-branches#develop-using-another-workspace).

   1. Create branch from main using Fabric Git (feature/reportchange)
   1. Make report changes in the Fabric workspace
   1. Commit changes to remote repository branch using Fabric Git
   1. Create Pull Request to main branch using Azure DevOps

1. The team lead reviews the Pull Requests and synchronizes the changes to the team workspace using Fabric Git.
1. The Pull Request triggers the Azure DevOps pipeline to inspect the semantic model and report development quality.

>[!NOTE]
>
>In this example, the pipeline uses two open-source community tools that enable a developer to apply (customizable) best practice rules to the metadata of semantic models and reports within a Power BI Project folder:
>
>* [Tabular Editor](https://github.com/TabularEditor/TabularEditor) and [Best Practice Rules](https://github.com/microsoft/Analysis-Services/tree/master/BestPracticeRules)
>* [PBI Inspector](https://github.com/NatVanG/PBI-Inspector)
>
>An approach similar to the example in this article would apply to other community tools. This article doesn't delve into the specifics of the community tools mentioned previously nor rule creation and editing. For in-depth information on these topics, refer to the links provided. The focus of this article is on the *process* of establishing a quality gate between source control and Fabric Workspace. It's important to note that the referred community tools are developed by third-party contributors, and Microsoft does not offer support or documentation for them.

## Step 1 - Connect Fabric workspace to Azure DevOps

[Connect your Fabric workspace to Azure DevOps](/fabric/cicd/git-integration/git-get-started?tabs=commit-to-git#connect-a-workspace-to-an-azure-repo):

:::image type="content" source="./media/projects-build-pipelines/connect.png" alt-text="Screenshot showing the Git connection to DevOps.":::

When Fabric Git integration finishes exporting your workspace items, your Azure DevOps branch will contain a folder for each item in your workspace:

:::image type="content" source="./media/projects-build-pipelines/connected-branch.png" alt-text="Screenshot showing the Azure DevOps branch with folders for different workspace items.":::

## Step 2 - Create and run an Azure DevOps pipeline

To create a new pipeline:

1. From the **Pipelines** tab of the left navigation menu, select **Create Pipeline** :

   :::image type="content" source="./media/projects-build-pipelines/create-pipeline.png" alt-text="Screenshot showing how to create a pipeline.":::

1. Select **Azure Repos Git** and select the first repository (the same repository that's connected to the Fabric workspace):

   :::image type="content" source="./media/projects-build-pipelines/code.png" alt-text="Screenshot showing Azure repo Git selected as the code source for the pipeline.":::

   :::image type="content" source="./media/projects-build-pipelines/select-repo.png" alt-text="Screenshot showing the Demo-ADObuild repo selected.":::

1. Select **Starter pipeline**.

   :::image type="content" source="./media/projects-build-pipelines/configure-pipeline.png" alt-text="Screenshot showing the starter pipeline icon selected.":::

   The following YAML code appears in the editor:

   :::image type="content" source="./media/projects-build-pipelines/review-yaml.png" alt-text="Screenshot showing the default YAML code.":::

1. Copy and paste the [YAML code from the Power BI developer mode pipeline](https://aka.ms/pbidevmode-ado-cipipeline) into the pipeline you created:

   :::image type="content" source="./media/projects-build-pipelines/yaml-code-1.png" alt-text="Screenshot showing YAML code to be added.":::

   :::image type="content" source="./media/projects-build-pipelines/demo-build.png" alt-text="Screenshot showing second part of YAML code.":::

1. Select **Save and Run** to commit your new pipeline to the repository.

   :::image type="content" source="./media/projects-build-pipelines/review-pipeline-yaml.png" alt-text="Screenshot of a review of the YAML code.":::

   :::image type="content" source="./media/projects-build-pipelines/save-run.png" alt-text="Screenshot showing save and run selection.":::

Azure DevOps runs the pipeline and starts two build jobs in parallel:

:::image type="content" source="./media/projects-build-pipelines/set-up-pipeline.png" alt-text="Screenshot showing Azure DevOps running a pipeline.":::

* Build_Datasets
  * Downloads Tabular Editor binaries.
  * Download Best Practice Analyzer [default rules](https://github.com/microsoft/Analysis-Services/tree/master/BestPracticeRules). To customize the rules, add a *Rules-Dataset.json* to the root of the repository.
  * Cycle through all the semantic model item folders and run Tabular Editor BPA Rules.
* Build_Reports
  * Download PBI Inspector binaries.
  * Download PBI Inspector [default rules](https://github.com/NatVanG/PBI-Inspector/blob/main/Rules/Base-rules.json). To customize the rules, add a *Rules-Report.json* to the root of the repository.
  * Cycle through all the report item folders and run Power BI Inspector rules.

When it finishes, Azure DevOps creates a report of all the warnings and errors it encountered:

:::image type="content" source="./media/projects-build-pipelines/errors.png" alt-text="Screenshot showing error report.":::

Select on the link to open a more detailed view of the two jobs:

:::image type="content" source="./media/projects-build-pipelines/view-log.png" alt-text="Screenshot showing view log button.":::

:::image type="content" source="./media/projects-build-pipelines/report-rules.png" alt-text="Screenshot showing expanded error log.":::

If your report or semantic model fails a rule with a higher severity level, the build fails, and the error is highlighted:

:::image type="content" source="./media/projects-build-pipelines/manual-run.png" alt-text="Screenshot showing highlighter errors.":::

## Step 3 - Define branch policies

Once the pipeline is up and running, enable **Branch Policies** on the *main* branch. This step ensures that no commits can be made directly into main. A ["pull request"](/azure/devops/repos/git/pull-requests?tabs=browser) is always required to merge changes back into *main* and you can configure the pipeline to run with every pull request.

1. Select **Branches** > **main Branch** > **Branch policies**:

   :::image type="content" source="./media/projects-build-pipelines/branch-policies.png" alt-text="Screenshot showing branch policies.":::

1. Configure the created pipeline as a *Build Policy* for the branch:

   :::image type="content" source="./media/projects-build-pipelines/build-policy.png" alt-text="Screenshot showing the build policy UI.":::

   :::image type="content" source="./media/projects-build-pipelines/build-policy-2.png" alt-text="Screenshot showing second part of the build policy UI.":::

## Step 4 - Create pull request

If you return to your Fabric Workspace, make a modification to one of the reports or semantic models, and attempt to commit the change, you receive the following error:

:::image type="content" source="./media/projects-build-pipelines/commit-change.png" alt-text="Screenshot showing the unable to commit change error.":::

You can only make changes to the main branch through a pull request. To create a pull request checkout a new branch to make the changes on:

Create a branch directly from the Fabric Workspace:

1. In the Source Control pane, select on **Checkout new branch** and provide a name for the branch.

   :::image type="content" source="./media/projects-build-pipelines/source-control.png" alt-text="Screenshot showing the source control screen to checkout a new branch.":::

   :::image type="content" source="./media/projects-build-pipelines/checkout-branch.png" alt-text="Screenshot showing how to checkout a new branch.":::

   Alternatively, you can choose to develop within a separate, isolated workspace or in Power BI Desktop. For more information, see [develop using another workspace](/fabric/cicd/git-integration/manage-branches#develop-using-another-workspace)

1. Commit your changes to this new branch.

   :::image type="content" source="./media/projects-build-pipelines/commit-change-to-branch.png" alt-text="Screenshot showing commit changes to branch.":::

1. Following the commit, create a pull request into the *main* branch from the Azure DevOps portal.

   :::image type="content" source="./media/projects-build-pipelines/create-pull-request.png" alt-text="Screenshot showing a new pull request created.":::

   :::image type="content" source="./media/projects-build-pipelines/new-pull-request.png" alt-text="Screenshot showing created pull request.":::

The pull request workflow not only allows you to validate and review the changes, but also automatically triggers the pipeline.

:::image type="content" source="./media/projects-build-pipelines/report-change.png" alt-text="Screenshot showing report change.":::

If there's a high-severity error in one of the rules, you can't finalize the pull request and merge the changes back into the main branch.

:::image type="content" source="./media/projects-build-pipelines/complete-pull-request.png" alt-text="Screenshot completed pull request.":::

Learn more about PBIP and Fabric Git Integration in [blog post](https://powerbi.microsoft.com/blog/deep-dive-into-power-bi-desktop-developer-mode-preview/).
