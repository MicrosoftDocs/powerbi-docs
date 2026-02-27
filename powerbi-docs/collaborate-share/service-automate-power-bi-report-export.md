---
title: Export and Email a Report with Power Automate
description: In this article, you use Power Automate to automate the export and distribution of Power BI reports in various supported formats and scenarios.  
author: JulCsc
ms.author: juliacawthra
ms.reviewer: ''
ms.service: powerbi
ms.subservice: pbi-collaborate-share
ms.topic: how-to
ms.date: 02/18/2026
ai-usage: ai-assisted
LocalizationGroup: Get started
ms.custom: sfi-image-nochange
---
# Export and email a Power BI report with Power Automate

With [Power Automate](/power-automate/getting-started), you can automate exporting and distributing Power BI reports in different formats and scenarios. In this article, you create your own flow from scratch. Use the **Export to File for Power BI Reports** action to automatically distribute a Power BI report via email.

:::image type="content" source="media/service-automate-power-bi-report-export/automate-power-bi-report-overview.png" alt-text="Screenshot of the Power BI Automate window showing create options.":::

Power Automate is a no-code way to interact with the Export To File API in the user interface. See [Export to File for Power BI Reports](/connectors/powerbi/#export-to-file-for-power-bi-reports) to start interacting with the API directly.
Before you use Power Automate to export Power BI Reports, see [Export reports from Power BI to PDF](end-user-pdf.md) for PDF and [Export your Power BI report to PowerPoint](end-user-powerpoint.md#export-your-power-bi-report-to-powerpoint).

## Prerequisites  

To follow along, make sure you have the following prerequisites:

- At least one workspace in your Power BI tenant backed by a reserved capacity. Read more about [reserved capacities in Power BI Premium](/fabric/enterprise/powerbi/service-premium-what-is).
- Access to the standard connectors in Power Automate which come with any Microsoft 365 subscription.

## Create a flow from scratch

In this task, you create a simple flow from scratch. The flow exports a Power BI report as a PDF, and attaches it to an email that is sent on a weekly basis.  

1. Sign in to [Power Automate](https://powerautomate.microsoft.com/).
1. Select **Create** > **Scheduled cloud flow**.

    :::image type="content" source="media/service-automate-power-bi-report-export/schedule-a-cloud-flow-1.png" alt-text="Screenshot showing the Power BI create window and scheduled cloud flow is highlighted." lightbox="media/service-automate-power-bi-report-export/schedule-a-cloud-flow-1.png":::

1. In **Build a scheduled flow**, give your flow a name.
1. In **Run this flow**, select the starting date and time for your flow and the repetition frequency.
1. In **On these days**, select which days you want your flow to run, and select **Create**.

    :::image type="content" source="media/service-automate-power-bi-report-export/automate-report-build-flow-5.png" alt-text="Screenshot showing the build a scheduled cloud flow dialog.":::

1. In **Recurrence**, select **Edit** > **Show advanced options**. Enter a value in **At these hours** and **At these minutes** to set a specific time for your flow to run.

    :::image type="content" source="media/service-automate-power-bi-report-export/automate-report-recurrence-6.png" alt-text="Screenshot showing the recurrence dialog.":::

1. Select **New Step**.
1. In **Choose an operation**, search for **Power BI** and select **Export To File for Power BI Reports**.

    :::image type="content" source="media/service-automate-power-bi-report-export/automate-report-choose-action-8.png" alt-text="Screenshot showing the Power Automate dialog for choosing an operation. Export to file for Power BI reports is highlighted.":::

1. In **Export to File for Power BI Reports**, select a **Workspace** and **Report** from the dropdowns.
1. Select the desired **Export Format** for your Power BI report.

    :::image type="content" source="media/service-automate-power-bi-report-export/automate-report-export-file-10.png" alt-text="Screenshot of the export to file for Power BI reports.":::

    > [!NOTE]
    > If you export multiple pages to PNG format, a series of *.png* files, each file representing one report page, are compressed into a *.zip* file which is then attached to your email.

1. Optionally, indicate specific pages to export in the **Pages pageName -1** field. The page name parameter is different from the display page name. To find the page name:

    1. Navigate to the page in the Power BI service.
    1. Look at the URL in your browser's address bar. The page name is the segment between the report GUID and the `?` query parameters.

    For example, in this URL:

    `https://app.powerbi.com/groups/338cd931-b957-4ba6-a5fa-b0113dab53aa/reports/85ac7583-3bb2-4c2c-a1fa-5a4a875ba88c/ReportSection?ctid=72f988bf-86f1-41af-91ab-2d7cd011db47`

    The page name is **ReportSection** (highlighted between the last `/` and the `?`). This is the default name for the first page. If you renamed your page in Power BI or navigated to other pages, you see different identifiers like `ReportSection1`, `ReportSection2`, or a custom name such as `SalesOverview`.

1. Optionally, indicate a specific visual to export in the **Visual Name** field. To find the visual name:

    1. Open the report in **Edit** mode in the Power BI service.
    1. Select the visual you want to export.
    1. In the **Visualizations** pane, select the **Format visual** icon (paint roller).
    1. Expand **General** > **Properties**.
    1. Copy the value in the **Name** field.

    This name is typically an auto-generated identifier like `abc123def456` unless you explicitly renamed the visual. You can also rename the visual here to make it easier to reference in your flow.

1. Optionally, indicate a specific bookmark to display in the **Bookmark Name** field. You can find the bookmark name in the report URL after bookmarkGuid=, as shown in the example. Only *report* bookmarks are supported, not *personal* bookmarks. You can specify other parameters for the Power BI report. Find detailed descriptions of these parameters in the [Export to File for Power BI Reports](/connectors/powerbi/#export-to-file-for-power-bi-reports).

    `https://app.powerbi.com/groups/workspaceGuid/reports/reportGuid/ReportSection?bookmarkGuid=xxxxxxxxxx`

1. Select **New Step**.
1. In **Choose an operation**, search for **Outlook** and select **Send an email (V2)**.
1. In **Send an email (V2)**, complete the **To**, **Subject**, and **Body** fields for your email.
1. Select **Show advanced options**. In **Attachments Name – 1**, enter a name for your attachment. Add a file extension to the file name (for example, .PDF) that matches your desired **Export Format**.
1. In **Attachment Content**, select **File Content** to attach your exported Power BI report.

    :::image type="content" source="media/service-automate-power-bi-report-export/automate-report-send-email-17.png" alt-text="Screenshot showing the send an email dialog.":::

1. When you're done, select **Next step** or **Save**. Power Automate creates and evaluates the flow, and lets you know if it finds errors.
1. If there are errors, select **Edit flow** to fix them. Otherwise, select the **Back** arrow to view the flow details and run the new flow.
    When you run the flow, Power Automate exports a Power BI report in the specified format and sends it as an email attachment as scheduled.  

## Row-level security in Power Automate

Optionally, if you want to send the report based on row-level security (RLS), you need to add the following details:

:::image type="content" source="media/service-automate-power-bi-report-export/export-power-automate-rls-field.png" alt-text="Screenshot of updating Identities Username fields.":::

- **Identities Username - 1** = The effective username reflected by a token for applying RLS rules. For an on-premises model, username can be composed of alpha-numerical characters, or any of the following characters: `'.', '-', '_', '!', '#', '^', '~', '\', and '@'`. For cloud models, username can be composed of all ASCII characters. Also, username can be up to 256 characters, and can't contain spaces.
- **Identities Semantic model - 1** = You can get this value by going to the settings of the semantic model, and then copying the semantic model ID from the address bar, as shown in this example and in the following image:

    `https://app.powerbi.com/groups/me/settings/datasets/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx`

    :::image type="content" source="media/service-automate-power-bi-report-export/export-power-automate-rls-dataset-id.png" alt-text="Screenshot of an example semantic model ID.":::

- **Identities Roles Item - 1** = RLS name defined in the report

## Considerations & limitations

- The exported files will reflect the saved default slicer values (even if the slicer selection is changed in subsequent user actions). To update the default slicer values, re-save the report. To generate exports with updated slicer selection, values should be set explicitly via [API calls](/connectors/powerbi/).

## Related content

- [Integrate Power BI data alerts with Power Automate](service-flow-integration.md)
- [Get started with Power Automate](/power-automate/getting-started/)
- [Create a Power Automate button visual](../create-reports/power-bi-automate-visual.md)
- More questions? [Try the Power BI Community](https://community.powerbi.com/)
