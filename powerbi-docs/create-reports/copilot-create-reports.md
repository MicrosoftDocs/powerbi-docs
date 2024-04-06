---
title: Create report pages with Copilot
description: Using Copilot in Power BI Desktop, you can quickly create a Power BI report.
author: maggiesMSFT
ms.author: maggies
ms.reviewer: kaurharleen
ms.service: powerbi
ms.subservice: pbi-reports-dashboards
ms.topic: how-to
ms.date: 04/05/2024
LocalizationGroup: Create reports
no-loc: [Copilot]
---

# Create reports with Copilot

[!INCLUDE [applies-no-desktop-yes-service](../includes/applies-no-desktop-yes-service.md)]

When you use the Copilot chat pane in Power BI, Copilot helps you use the transformational power of generative AI to get the most from your data. This article provides an overview of the Copilot chat pane capabilities for Power BI.

:::image type="content" source="media/copilot-create-desktop-report/copilot-create-popular-islands-page.png" alt-text="Screenshot showing Copilot creating a page about the popular islands." lightbox="media/copilot-create-desktop-report/copilot-create-popular-islands-page.png":::

The same report creation experience is available for preview in the Power BI service and in Power BI Desktop.

- [Create reports in the Power BI service with Copilot](copilot-create-report-service.md)
- [Create reports in Power BI Desktop with Copilot](copilot-create-desktop-report.md)

With the current preview, you can create reports faster and easier in the Power BI experience. You can now open the Copilot pane and ask Copilot to:

- **Summarize a semantic model**: Copilot can help you understand your Power BI semantic model by summarizing the data in your model. This summary can help you gain a better understanding of your model, identify important insights, and improve your data exploration experience by allowing you to delve deeper into the data.
- **Suggest a topic**: Copilot can help you get started on a new report by suggesting topics based on your data. When you select this option in the chat, Copilot evaluates the data and provides a report outline with suggested pages that you can explore, and Copilot can create them for you.
- **Create a report page**: Copilot  for Power BI can assist you in creating a report page by identifying the tables, fields, measures, and charts for your data. If you give Copilot a high-level prompt that's specific to your data, it can generate a report page that you can then customize and modify using the existing editing tools. It can help you get started on your report page quickly and save you a lot of time and effort in the process. The following are some examples of high-level prompts to get you started:

  - Create a page to evaluate the performance of different shifts based on good count, reject count, and alarm count over time.
  - Create a page to analyze the efficiency of the production line and overall equipment effectiveness.
  - Create a page to compare the cost and material of each product and their impact on production.

## Before you start

To get started using Copilot, you need write access to at least one workspace that's assigned to a Copilot-enabled capacity, in other words, a paid Fabric capacity (F64 or higher) or a Power BI Premium capacity (P1 or higher). Learn more about [Copilot for Power BI capacity requirements](copilot-introduction.md#power-bi-service).

You may need to do some clean-up work on your dataset. Read the article [Update your data model to work well with Copilot](copilot-evaluate-data.md) to see if you need to modify your semantic model so that Copilot can get insights from it.

[!INCLUDE [copilot-notes](../includes/copilot-notes.md)]

## Get started using Copilot the first time

You need to be signed in to start using Copilot in Desktop in report view.

1. Open Power BI Desktop.

1. In the ribbon, select **Get Data**, then select the type of data source, select a data source, and select **Connect**.

1. Now that you have data, in the ribbon, select the **Copilot** icon in the ribbon to open the Copilot pane in the report view. 

    > [!TIP]
    > If you don't see **Copilot**, your admins may need to [enable Copilot in Microsoft Fabric](/fabric/get-started/copilot-fabric-overview).

1. The first time you select the **Copilot** ribbon button, Power BI prompts you to pick a Copilot-compatible workspace. Select any workspace assigned to required capacity. 

    > [!NOTE]
    > - The workspace you select here doesn’t need to be the workspace where you publish your report.
    > - If you cancel or close the workspace picker dialog without any selection, you will see an error message saying that something went wrong.

1. In the Copilot pane, you see a welcome card. Select **Get started** to start your interaction with Copilot.

    After you've successfully completed those steps the first time, you won't have to repeat them again. 

## Get started using Copilot

1. In the ribbon, select the **Copilot** icon in the ribbon to open the Copilot pane in the report view.

1. Select **Suggest content for this report**.

    Copilot evaluates the data and suggests possible pages for your report.

1. Select **Create** next to the first page you want Copilot to create.

    :::image type="content" source="media/copilot-create-desktop-report/copilot-suggests-four-pages.png" alt-text="Screenshot showing selecting the Create page button.":::

    Copilot creates that page.

    :::image type="content" source="media/copilot-create-desktop-report/copilot-create-visitor-analysis-page.png" alt-text="Screenshot of Copilot creating the Visitor Analysis page." lightbox="media/copilot-create-desktop-report/copilot-create-visitor-analysis-page.png":::

    Continue creating the pages that Copilot suggests. Otherwise select **Create a report that shows** and provide guidance on what you want in the report.

1. If you need help with writing prompts that get you the report page you want, see [Write Copilot prompts that produce results in Power BI](copilot-prompts-report-pages.md) for guidance.

## Create a summary

You can also use Copilot for Power BI to create a narrative summary with just a few clicks. This narrative can summarize the entire report, specific pages, or even specific visuals. See [Create a narrative summary visual with Copilot for Power BI](copilot-create-narrative.md) to learn how.

## Undo a page  

After Copilot has generated the report, you can review the page. You have the option to start over by selecting the **Undo** button.  After you select the **Undo** button, Copilot starts over. The content on the page is removed and you start over with topic selection by either generating new topics or selecting the one from the top, when you first started.

## Save the report

When you're satisfied with the report, you save the report just like any other report.

## Considerations and limitations

We're continuously working to improve the quality of the report pages, including visuals and summaries generated by Copilot. Here are the current limitations. 

- Unlike the Data pane or Visualization pane, you can't resize the Copilot pane. 
- Fabric Copilot experiences in Power BI are preview experiences.  This experience is in public preview. 
- We work continuously to improve the quality of the reports (including visuals) generated by Copilot. We aim to deliver a better experience for when the product reaches general availability.
- AI may generate content that has mistakes. Make sure it's accurate and appropriate before using it.
- You can't tell Copilot which kind of visual to create.
- Copilot can't modify the visuals after it has generated them.
- Copilot can't add filters or set slicers if you specify them in the prompts. For example, if you say: "Create a sales report for the last 30 days." Copilot can't interpret 30 days as a date filter.
- Copilot can't make layout changes. For example, if you tell Copilot to resize the visuals, or to align all the visuals perfectly, it won't work.
- Copilot can't understand complex intent. For example, suppose you frame a prompt like: "Generate a report to show incidents by team, incident type, owner of the incident, and do this for only 30 days." This prompt is complex, and Copilot will probably generate irrelevant visuals.
- Copilot doesn't produce a message for the skills that it doesn't support. For example, if you ask Copilot to edit or add a slicer, it doesn't complete the instruction successfully, as mentioned above. Unfortunately, it *doesn't* give an error message either.
- Read [Update your data model to work well with Copilot](copilot-evaluate-data.md) for more tips.

## Next steps

- [Overview of Copilot for Power BI](copilot-introduction.md)
- [Create a narrative summary visual with Copilot for Power BI](copilot-create-narrative.md)
- [Privacy, security, and responsible use for Copilot for Power BI](/fabric/get-started/copilot-power-bi-privacy-security)
