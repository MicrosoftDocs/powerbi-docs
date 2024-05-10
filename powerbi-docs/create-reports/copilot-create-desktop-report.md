---
title: Create reports in Power BI Desktop with Copilot
description: Using Copilot in Power BI Desktop, you can quickly create a Power BI report.
author: maggiesMSFT
ms.author: maggies
ms.reviewer: kaurharleen
ms.service: powerbi
ms.subservice: pbi-reports-dashboards
ms.topic: how-to
ms.date: 04/26/2024
LocalizationGroup: Create reports
no-loc: [Copilot]
#customer intent: As a report creator, I want to learn how to use Copilot in Power BI Desktop to create a Power BI report quickly.
---

# Create reports in Power BI Desktop with Copilot

[!INCLUDE [applies-no-desktop-yes-service](../includes/applies-no-desktop-yes-service.md)]

When you use the Copilot chat pane in Power BI Desktop, Copilot helps you use the transformational power of generative AI to get the most from your data. This article provides an overview of the Copilot chat pane capabilities for Power BI Desktop. 

To use Copilot in Power BI Desktop, you need admin, member, or contributor access to at least a single workspace that is assigned to a paid Fabric capacity (F64 or higher) or Power BI Premium capacity (P1 or higher) that has Copilot enabled.

:::image type="content" source="media/copilot-create-desktop-report/copilot-create-popular-islands-page.png" alt-text="Screenshot showing Copilot creating a page about the popular islands." lightbox="media/copilot-create-desktop-report/copilot-create-popular-islands-page.png":::

## Before you start

Read about all the ways Copilot can help you in the [overview of Copilot for Power BI](copilot-introduction.md) for more guidance before you start.

- You need to be signed in to the Power BI service to start using Copilot in Power BI Desktop in report view. 
- You need to select a compatible workspace that you have write access to. It needs to be a workspace that's assigned to a Copilot-enabled capacity, in other words, a paid Fabric capacity (F64 or higher) or a Power BI Premium capacity (P1 or higher). 

    Learn more about [Copilot for Power BI capacity requirements](copilot-introduction.md#power-bi-service).

[!INCLUDE [copilot-notes](../includes/copilot-notes.md)]

## Use Copilot the first time

1. Open Power BI Desktop.

1. In the ribbon, select **Get Data**, then select the type of data source, select a data source, and select **Connect**.

1. Now that you have data, select the **Copilot** icon in the ribbon to open the Copilot pane in the report view. 

    > [!TIP]
    > If you don't see **Copilot**, your admins may need to [enable Copilot in Microsoft Fabric](/fabric/get-started/copilot-fabric-overview).

1. The first time you select the **Copilot** ribbon button, Power BI prompts you to pick a Copilot-compatible workspace. Select any workspace assigned to the required capacity. 

    > [!NOTE]
    > - The workspace you select here doesn’t need to be the workspace where you publish your report.
    > - If you cancel or close the workspace picker dialog without any selection, you see an error message saying that something went wrong.

1. In the Copilot pane, you see a welcome card. Select **Get started** to start your interaction with Copilot.

    After you've successfully completed those steps the first time, you won't have to repeat them again.

### Change the selected workspace

You can change the selected workspace to another Copilot-compatible workspace anytime. To change the selected workspace:

- Select **File** > **Options and settings** > **Options** > **Copilot (preview)** setting under **Global**.

  You see the name of the selected workspace and an option to select a new workspace.

## Start using Copilot

1. Open Power BI Desktop.

1. In the ribbon, select **Get Data**, then select the data source, and select **Connect**.

1. In the ribbon, select the **Copilot** icon in the ribbon to open the Copilot pane in the report view.

1. Select **Suggest content for this report**.

    Copilot evaluates the data and suggests possible pages for your report.

1. Select **Create** next to the first page you want Copilot to create.

    :::image type="content" source="media/copilot-create-desktop-report/copilot-suggests-four-pages.png" alt-text="Screenshot showing selecting the Create page button.":::

    Copilot creates that page.

    :::image type="content" source="media/copilot-create-desktop-report/copilot-create-visitor-analysis-page.png" alt-text="Screenshot of Copilot creating the Visitor Analysis page." lightbox="media/copilot-create-desktop-report/copilot-create-visitor-analysis-page.png":::

    Continue creating the pages that Copilot suggests. Otherwise select **Create a report that shows** and provide guidance on what you want in the report.

1. If you need help with writing prompts that get you the report page you want, see [Write Copilot prompts that produce results in Power BI](copilot-prompts-report-pages.md) for guidance.

## Create a narrative summary

You can also use Copilot for Power BI to create a narrative summary with just a few clicks. This narrative can summarize the entire report, specific pages, or even specific visuals. The summary can help you plan what visualizations you want to include in your report. See [Create a narrative summary visual with Copilot for Power BI](copilot-create-narrative.md) to learn how.

## Undo a page

After Copilot generates the page, then you can review it. You have the option to start over by selecting the **Undo** button.  After you select the **Undo** button, Copilot starts over. The content on the page is removed and you start over with topic selection by either generating new topics or selecting the one from the top, when you first started.

## Save the report

When you're satisfied with the report, you save the report just like any other report.

## Considerations and limitations

There are limitations related to creating pages in specific semantic model scenarios.
- **Real-Time Streaming Models**: Report pages cannot be created by Copilot for semantic models utilizing real-time streaming.
- **Live Connection to Analysis Services**: Semantic models connected live to Analysis Services are not supported by page creation.

## Next steps

- [Overview of Copilot for Power BI](copilot-introduction.md)
- [Create reports in the Power BI service with Copilot](copilot-create-report-service.md)
- [Create a narrative summary visual with Copilot for Power BI](copilot-create-narrative.md)
- [Privacy, security, and responsible use for Copilot for Fabric and Power BI](/fabric/get-started/copilot-power-bi-privacy-security)
- [Update your data model to work well with Copilot](copilot-evaluate-data.md)
