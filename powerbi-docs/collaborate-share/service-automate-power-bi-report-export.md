---
title: Export and email a report with Power Automate
description: In this article, you use Power Automate to automate the export and distribution of Power BI reports in a variety of supported formats and scenarios.  
author: maggiesMSFT
ms.author: maggies
ms.reviewer: ''
ms.service: powerbi
ms.subservice: pbi-collaborate-share
ms.topic: how-to
ms.date: 06/08/2021
LocalizationGroup: Get started
---
# Export and email a Power BI report with Power Automate

With [Power Automate](/power-automate/getting-started), you can automate exporting and distributing Power BI reports to a variety of formats and scenarios. In this article, you create your own flow from scratch. You use the Export to File for Power BI Reports action to automatically distribute a Power BI report via email.

:::image type="content" source="media/service-automate-power-bi-report-export/automate-power-bi-report-overview.png" alt-text="Power Automate steps to export and email a report.":::

## Prerequisites  

To follow along, make sure you have:

- At least one workspace in your Power BI tenant backed by a reserved capacity. This capacity can be any of the A1/EM1 - A6/P3 SKUs. Read more about [reserved capacities in Power BI Premium](../admin/service-premium-what-is.md).
- Access to the standard connectors in Power Automate, which come with any Office 365 subscription.

## Create a flow from scratch 

In this task, you create a simple flow from scratch. The flow exports a Power BI report as a PDF, and attaches it to an email to be sent on a weekly basis.  

1. Sign in to Power Automate (flow.microsoft.com).
2. Select **Create** > **Scheduled cloud flow**. 

    :::image type="content" source="media/service-automate-power-bi-report-export/automate-report-scheduled-flow-2.png" alt-text="Create a scheduled flow in Power Automate.":::

3. In **Build a scheduled flow**, give your flow a name. 
4. In **Run this flow**, select the starting date and time for your flow, as well as the repetition frequency.
5. In **On these days**, select which days you want your flow to run, and select **Create**.

    :::image type="content" source="media/service-automate-power-bi-report-export/automate-report-build-flow-5.png" alt-text="Power Automate, schedule the flow.":::

6. In **Recurrence**, select **Edit** > **Show advanced options** and enter a value in **At these hours** and **At these minutes** to set a specific time for your flow to run.
 
    :::image type="content" source="media/service-automate-power-bi-report-export/automate-report-recurrence-6.png" alt-text="Set recurrence in Power Automate.":::

7. Select **New Step**.
8. In **Choose an operation**, search for **Power BI** and select **Export to File for Power BI Reports**.
 
    :::image type="content" source="media/service-automate-power-bi-report-export/automate-report-choose-action-8.png" alt-text="Choose an operation in Power Automate.":::

9. In **Export to File for Power BI Reports**, select a **Workspace** and **Report** from the dropdowns.
10. Select the desired **Export Format** for your Power BI report.
 
    :::image type="content" source="media/service-automate-power-bi-report-export/automate-report-export-file-10.png" alt-text="Select export format in Power Automate.":::

11. Optionally, indicate specific pages to export in the **Pages pageName -1** field. Note the page name parameter is different from the display page name. Find the page name by navigating to the page in the Power BI service, and copying the last portion of the URL.
 
     :::image type="content" source="media/service-automate-power-bi-report-export/automate-report-copy-url-11.png" alt-text="Select the pane name in the U R L.":::

12. Optionally, indicate a specific bookmark to display in the **Pages Bookmark Name** field. As with the page name parameter, you find the bookmark name parameter in the report URL. You can specify additional parameters for the Power BI report. Find detailed descriptions of these parameters in the [connector reference for the Power BI REST API](/connectors/powerbi/#export-to-file-for-power-bi-reports).

    :::image type="content" source="media/service-automate-power-bi-report-export/automate-report-bookmark-url-12.png" alt-text="Select the bookmark name in the U R L.":::

13. Select **New Step**.
14. In **Choose an operation**, search for **Outlook** and select **Send an email (V2)**.
15. In **Send an email (V2)**, complete the **To**, **Subject**, and **Body** fields for your email.
16. Select **Show advanced options**. In **Attachments Name – 1**, enter a name for your attachment. Add a file extension to the file name (for example, .PDF) that matches your desired **Export Format**.
17. In **Attachment Content**, select **File Content** to attach your exported Power BI report.  
 
    :::image type="content" source="media/service-automate-power-bi-report-export/automate-report-send-email-17.png" alt-text="Select your exported report to email.":::

18. When you're done, select **Next step** or **Save**. Power Automate creates and evaluates the flow, and lets you know if it finds errors.
1. If there are errors, select **Edit flow** to fix them. Otherwise, select the **Back** arrow to view the flow details and run the new flow.
    When you run the flow, Power Automate exports a Power BI report in the specified format and sends it as an email attachment as scheduled.  

## Row-level security in Power Automate 
Optionally, if you want to send the report based on row-level security (RLS), you need to add the following details:

:::image type="content" source="media/service-automate-power-bi-report-export/export-power-automate-rls-fields.png" alt-text="Screenshot of updating Identities Username fields.":::

- **Identities Username - 1** = The effective username reflected by a token for applying RLS rules. For an on-premises model, username can be composed of alpha-numerical characters, or any of the following characters: `'.', '-', '_', '!', '#', '^', '~', '\', and '@'`. For cloud models, username can be composed of all ASCII characters. Also, username can be up to 256 characters, and can't contain spaces.
- **Identities Dataset - 1** = You can get this value by going to the settings of the dataset, and then copying the dataset ID from the address bar, as shown in this example and in the following image:

    Example: `https://app.powerbi.com/groups/me/settings/datasets/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx`

    :::image type="content" source="media/service-automate-power-bi-report-export/export-power-automate-rls-dataset-id.png" alt-text="Screenshot of example dataset ID.":::

- **Identities Roles Item - 1** = RLS name defined in the report

## Next steps

- [Integrate Power BI data alerts with Power Automate](service-flow-integration.md)
- [Get started with Power Automate](/power-automate/getting-started/)
- [Create a Power Automate button visual](../create-reports/power-bi-automate-visual.md)
- More questions? [Try the Power BI Community](https://community.powerbi.com/)
