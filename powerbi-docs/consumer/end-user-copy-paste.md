---
title: Copy and paste a visualization in the Power BI service
description: Learn how to copy a visual from Power BI and paste it into other applications such as Word, PowerPoint, and emails.
author: mihart
ms.author: mihart
ms.reviewer: maggie.tsang
ms.service: powerbi
ms.subservice: pbi-explore
ms.topic: how-to
ms.date: 01/18/2023
LocalizationGroup: Visualizations
---
# Copy a visual and then paste it into another application

[!INCLUDE[consumer-appliesto-yyyn](../includes/consumer-appliesto-yyyn.md)]

Have you ever wanted to share an image from a Power BI report or dashboard? Now you can copy a visual and paste it into other applications that support the paste option. Copy a visual and paste it into an email message, Word, PowerPoint, another Power BI report, and many more applications.

:::image type="content" source="media/end-user-copy-paste/power-bi-paste-copy.png" alt-text="Screenshot of a Power BI visual and the Copy as image with caption icon highlighted.":::

When you copy a static image of a visual, you get a copy of the visual along with the metadata. This includes the following:

* Link back to the Power BI report or dashboard
* Title of the report or dashboard
* Notice if the image contains confidential information
* Last updated time stamp
* Filters applied to the visual

## Copy the visual

The process is almost identical for copying a visual from a dashboard or a report. Only the first step varies.

1. Navigate to the report or dashboard that has the image that you want to copy.

1. Copy the visual.

    * **To copy from a dashboard.** On the upper right corner of the visual, select **More actions (...)**, then choose **Copy visual as image**.

        :::image type="content" source="media/end-user-copy-paste/power-bi-copy-dash.png" alt-text="Screenshot of a visual with the More actions menu open and Copy visual as image option highlighted.":::

    * **To copy from a report page.** From the upper right corner of the visual, select the icon for **Copy as image with caption**.

        :::image type="content" source="media/end-user-copy-paste/power-bi-copy-icon.png" alt-text="Screenshot showing the Copy as image with caption icon.":::

1. If there's a data sensitivity label applied to the report that contains the visual, you'll receive a warning. For more information, see [Data that has been labeled as confidential or sensitive](#data-that-has-been-labeled-as-confidential-or-sensitive).

    :::image type="content" source="media/end-user-copy-paste/power-bi-sensitive-dashboard.png" alt-text="Screenshot that shows a warning message about sensitive data.":::

1. When you see a dialog window appear with **Image with caption copied**, select **Copy**.

    :::image type="content" source="media/end-user-copy-paste/power-bi-image-copied.png" alt-text="Screenshot of a dialog window with the copied visual and a copy button icon.":::

1. After your visual is copied, paste it into another application using **Ctrl + V** or **right-click** > **Paste**. The following screenshot shows the visual pasted into Microsoft Word.

    :::image type="content" source="media/end-user-copy-paste/power-bi-paste-into-word.png" alt-text="Screenshot of a visual pasted into Microsoft Word.":::

## Data that has been labeled as confidential or sensitive

If there's a data sensitivity label applied to the report containing the visual, you'll receive a warning when you select the copy icon.  

:::image type="content" source="media//end-user-copy-paste/power-bi-sensitive.png" alt-text="Screenshot that displays a warning message about sensitive data.":::

A sensitivity label will also be added to the metadata of the copied visual. The sensitivity label will appear below the visual when you paste it.

:::image type="content" source="media//end-user-copy-paste/power-bi-confidential.png" alt-text="Screenshot that shows a visual with the confidential info label.":::

## Considerations and troubleshooting

  :::image type="content" source="media//end-user-copy-paste/power-bi-copy-grey.png" alt-text="Screenshot of a visual with the Copy icon disabled.":::

Q: Why is the Copy icon disabled on a visual?
A: We currently support native Power BI visuals and certified custom visuals. There's limited support for certain visuals. This includes:

* ESRI and other map visuals
* Python visuals
* R visuals
* PowerApps visuals

A: The ability to copy a visual can be turned off by your IT department or Power BI administrator.

Q: Why is my visual not pasting correctly?  
A: There are limitations for custom visuals and animated visuals.

Q: Can I to copy a visual from my embedded Power BI report?  
A: *Copy visual* is supported only in the **embed for your organization** scenario. It isn't available in the **embed for your customers** scenario.

## Next steps

* [Visualizations types in Power BI](../visuals/power-bi-visualization-types-for-reports-and-q-and-a.md)
* [Copy and paste a report visualization](../visuals/power-bi-visualization-copy-paste.md).
* More questions? [Try the Power BI Community](https://community.powerbi.com/)
