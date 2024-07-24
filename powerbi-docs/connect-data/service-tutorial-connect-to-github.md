---
title: 'Tutorial: Connect to a GitHub repo with Power BI'
description: Learn how to connect to real data in the GitHub service from Power BI and then examine the data in the workspace reports.
author: paulinbar
ms.author: painbar
ms.reviewer: SarinaJoan
ms.service: powerbi
ms.subservice: pbi-data-sources
ms.custom: connect-to-services
ms.topic: tutorial
ms.date: 07/24/2024
#customer intent: "As a Power BI end user, I want to connect to GitHub as an example, so I understand how to connect to my data on other services."
LocalizationGroup: Connect to services
---
# Tutorial: Connect to a GitHub repo with Power BI

In this tutorial, you connect to real data: the Power BI content public repository (also known as a *repo*) in the GitHub service. Power BI automatically creates a dashboard and report with the data. You see answers to questions like: How many people contribute to the Power BI public repo? Who contributes the most? Which day of the week has the most contributions? And other questions.

You can connect to your own private or public GitHub repos too. To use a Power BI *template app* to connect to your repos, see [Connect to GitHub with Power BI](service-connect-to-github.md).

:::image type="content" source="media/service-tutorial-connect-to-github/power-bi-github-app-tutorial-punch-card.png" alt-text="Screenshot of a sample GitHub report in Power BI.":::

In this tutorial, you complete the following steps:

> [!div class="checklist"]
>
> * Sign up for a GitHub account, if you don't have one yet.
> * Sign in to your Power BI account, or sign up, if you don't have one yet.
> * Open the Power BI service.
> * Find the GitHub app.
> * Enter the information for the Power BI public GitHub repo.
> * View the dashboard and report with GitHub data.
> * Clean up resources by deleting the app.

If you're not signed up for Power BI, [sign up for a free trial](https://app.powerbi.com/signupredirect?pbi_source=web) before you begin.

## Prerequisites

To complete this tutorial, you need a GitHub account, if you don't already have one.

* Sign up for a [GitHub account](/contribute/get-started-setup-github).

## How to connect

1. Sign in to the Power BI service (app.powerbi.com).
1. In the nav pane, select **Apps**, then **Get apps**.

   :::image type="content" source="media/service-tutorial-connect-to-github/apps-get-apps.png" alt-text="Screenshot of the apps pane with apps and get apps highlighted.":::

1. Enter **GitHub** in the search box. Select the app, and then choose **Get it now**.

   :::image type="content" source="media/service-tutorial-connect-to-github/service-github-template-app-appsource-get-it-now.png" alt-text="Screenshot of the GitHub template app with get it now highlighted.":::

1. Select **Install**.

   :::image type="content" source="media/service-tutorial-connect-to-github/confirm-install.png" alt-text="Screenshot of the GitHub app install dialog.":::

1. When you see the notification, **Your new app is ready!**, select **Go to app**.
1. On the app landing page, select **Connect your data**.

   :::image type="content" source="media/service-tutorial-connect-to-github/connect-your-data.png" alt-text="Screenshot of the app banner with connect your data highlighted.":::

1. In the connect dialog, enter the repository name and repository owner of the repo. The URL for this repo is `https://github.com/MicrosoftDocs/powerbi-docs`. Enter `MicrosoftDocs` as the repository **Owner**, and `powerbi-docs` as the **Repo** name. Select **Next**.

   :::image type="content" source="media/service-tutorial-connect-to-github/tutorial-connect-to-github.png" alt-text="Screenshot of the connect dialog with owner, repo, and next highlighted.":::

1. Make sure that **Authentication Method** is set to `OAuth2`, and then select **Sign in and connect**.

   :::image type="content" source="media/service-tutorial-connect-to-github/tutorial-sign-in-and-connect.png" alt-text="Screenshot of the connecting dialog with authentication method and sign-in and connect highlighted.":::

1. If prompted, follow the GitHub authentication instructions and give Power BI permission to access your data.

   * After Power BI can connect with GitHub, the data in your Power BI semantic model is refreshed once a day.
   * After Power BI imports the data, you see the contents in your new GitHub workspace.

1. Select **Workspaces** in the nav pane to see the dashboard, reports, and semantic models. You can select **More options** (...) to view settings.

   :::image type="content" source="media/service-tutorial-connect-to-github/github-workspace-more-options.png" alt-text="Screenshot of the workspaces list. Workspaces and the GitHub workspace are highlighted.":::

1. In workspace **Settings**, you can rename or delete the workspace.

   :::image type="content" source="media/service-tutorial-connect-to-github/github-workspace-settings-name.png" alt-text="Screenshot of the workspace settings dialog with workspace name highlighted.":::

1. Select your GitHub dashboard. You can minimize or expand the nav pane, so you have more room to see your data.

   The GitHub dashboard contains live data, so the values you see may be different.

   :::image type="content" source="media/service-tutorial-connect-to-github/github-dashboard-nav-expand.png" alt-text="Screenshot of the GitHub dashboard with the navigation pane compressed with the icon to expand highlighted.":::

## Ask a question

1. Select the **Ask a question about your data** text box. Power BI opens the **Q&A** window and offers some sample questions.

1. Enter **how many users**, Power BI offers a list of questions.

   :::image type="content" source="media/service-tutorial-connect-to-github/question-how-many-users.png" alt-text="Screenshot of the Q&A result screen with how many users highlighted.":::

1. You can edit your question, for example, in between **how many** and **users**, type **pull requests per**.

   Power BI creates a bar chart visual that shows the number of pull requests per person.

   :::image type="content" source="media/service-tutorial-connect-to-github/how-many-prs-result.png" alt-text="Screenshot of the Q&A result screen with a bar chart.":::

1. Select the pin icon to pin the visual to your dashboard, then **Exit Q&A**.

## View the GitHub report

1. On the GitHub dashboard, select **More options** (...) on the column chart **Pull Requests by Month**. Choose **Go to report**.

   :::image type="content" source="media/service-tutorial-connect-to-github/go-to-report.png" alt-text="Screenshot of the pull requests by month tile with more options and go to report highlighted.":::

1. Select a user name in the **Total pull requests by user** chart. A new tile appears with results for one user.

   :::image type="content" source="media/service-tutorial-connect-to-github/cross-filter-tiles.png" alt-text="Screenshot of the pull requests chart for a single user.":::

1. Select the **Punch Card** tab to view the next page of the report. Now you can see volumes of work by hour of the day and day of the week.

   :::image type="content" source="media/service-tutorial-connect-to-github/punch-card-tiles.png" alt-text="Screenshot of the punch card tile and commit bar charts.":::

## Clean up resources

Now that you've finished the tutorial, you can delete the GitHub app.

1. In the nav pane, select **Apps**.
2. On the app tile, select **More options** (...) and then choose **Delete**.

   :::image type="content" source="media/service-tutorial-connect-to-github/delete-an-app.png" alt-text="Screenshot of the GitHub app tile with apps, more options, and delete highlighted.":::

## Related content

In this tutorial, you've connected to a GitHub public repo and gotten data, which Power BI has formatted in a dashboard and report. You've answered some questions about the data by exploring the dashboard and report. Now you can learn more about connecting to other services, such as Salesforce, Microsoft Dynamics, and Google Analytics.

* [Connect to GitHub with a Power BI template app](service-connect-to-github.md)
