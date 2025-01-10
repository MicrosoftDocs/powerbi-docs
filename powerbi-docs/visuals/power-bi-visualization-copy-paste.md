---
title: Copy and paste a visualization in Power BI.
description: Learn how to copy and paste visualizations within Power BI reports and dashboards, and how to manage permissions for copying visuals.
author: JaedenArmstrong
ms.author: miguelmyers
ms.reviewer: davidiseminger
ms.service: powerbi
ms.subservice: pbi-visuals
ms.topic: how-to
ms.date: 01/09/2025
ms.custom: Sample - Sales and Marketing, Sample - Corporate Spend
LocalizationGroup: Visualizations
#customer intent: As a Power BI user, I want to copy and paste visualizations so that I can easily share and reuse them across different reports and applications.
---

# Copy and paste a report visualization

[!INCLUDE [applies-yes-desktop-yes-service](../includes/applies-yes-desktop-yes-service.md)]

In this article, we cover how to copy and paste a visual, a fundamental task that allows you to duplicate visuals within your reports. Reusing your visual elements and can help to ensure consistency across different parts of your report while avoiding the time and effort often needed to recreate visuals from scratch. This article provides step-by-step instructions, tips, and best practices to help you efficiently copy and paste visuals in Power BI.

## Prerequisites

- In **Power BI service** you need edit permissions for the report enabling you to copy a visual and then paste it into another page in your report.
- In **Power BI service** open the report in [Editing View](../consumer/end-user-reading-view.md).
- In **Power BI service** and **Power BI mobile**, you can also copy an image of a visual and paste it into other applications, like Word or PowerPoint.

## Copy and paste visuals within the same report

Visuals in Power BI reports can be copied from one page in the report to the same page or different page in the same report.

#### [Power BI Desktop](#tab/desktop)

#### Copy and paste in Power BI Desktop

1. Open a report that has at least one visualization.  
2. Select a visual. With **Home** selected on the menu bar, select **Copy** on the command bar, or use **Ctrl +C** to copy.
3. To paste the visual elsewhere in your report, use **Paste** from the command bar, or use **Ctrl +V**.

#### [Power BI service](#tab/service)

#### Copy and paste in Power BI service

1. Open a report that has at least one visualization. Select **Edit** from the command bar.
2. Select a visual. Right-click on the visual and select **Copy > Copy visual**, or you can use **Ctrl +C** to copy.
3. Use **Ctrl +V** to paste the visual elsewhere in your report.

---

## Copy a visual as a static image to your clipboard

These steps explain how to copy a static image of a visual in Power BI. Once copied, you can paste it into Microsoft OneNote, Word, Outlook, or any other application that supports pasting images.

#### In Power BI service, copy and paste a static image of a visual

When you copy a static image of a visual, the copied image displays whatever filters are applied to it along with its metadata including the following information:

- An **Open in Power BI** link to the Power BI report or dashboard.
- The title of the report or dashboard.
- A notice if the image contains confidential information.
- A time stamp indicating date and time of data in the static image of the visual.
- A text description of any filters applied to the static image of the visual.

Keep in mind that visuals can be copied from both Power BI dashboards and from Power BI reports.

#### [Dashboard](#tab/dashboard)

#### Copy from a dashboard tile

1. Open the Power BI service and navigate to the dashboard you want to copy from.

1. From the upper corner of the visual, select the ellipsis (**...**) to open a menu of options and choose **Copy visual as image**.

   :::image type="content" source="media/power-bi-visualization-copy-paste/power-bi-dashboard-copy.png" alt-text="Screenshot showing the selection of Copy visual as image.":::

1. If your visual has a sensitivity label applied, you receive a warning before the copy is made. If the data shouldn't be shared with others, select **Cancel**. If you select **Copy**, the sensitivity label is added to the metadata under the pasted visual.

    :::image type="content" source="media/power-bi-visualization-copy-paste/power-bi-sensitivity.png" alt-text="Screenshot showing a warning message for visuals with sensitivity labels.":::

1. When the **Image with caption copied** dialog appears, review the image and caption. If it looks OK, select **Copy** to copy the image to the clipboard and then close the dialog.

   :::image type="content" source="media/power-bi-visualization-copy-paste/power-bi-copy-preview.png" alt-text="Screenshot of a dialog with the Copy to clipboard option.":::

1. With your visual copied to the clipboard, you can paste it into another application using **Paste** from the command bar, or ***right-click*** > **Paste**, or use **Ctrl + V**. In this screenshot, we pasted the visual into Microsoft OneNote.

   :::image type="content" source="media/power-bi-visualization-copy-paste/power-bi-paste-onenote.png" alt-text="Screenshot of the visual pasted into Microsoft OneNote.":::

#### [Report](#tab/report)

#### Copy from a report visual

1. Open the Power BI service and navigate to the report you want to copy from.

1. From the upper right corner of the visual, select the icon for **Copy as image with caption**.

   :::image type="content" source="media/power-bi-visualization-copy-paste/power-bi-copy-report.png" alt-text="Screenshot showing 'Copy visual as image' icon.":::

1. If your visual has a sensitivity label applied, you receive a warning before the copy is made. If the data shouldn't be shared with others, select **Cancel**. If you select **Copy**, the sensitivity label is added to the metadata under the pasted visual.

    :::image type="content" source="media/power-bi-visualization-copy-paste/power-bi-sensitivity-2.png" alt-text="Screenshot showing a warning message for visuals with sensitivity labels.":::

1. When the **Image with caption copied** dialog appears, review the image and caption. If it looks OK, select **Copy** and then close the dialog.

    :::image type="content" source="media/power-bi-visualization-copy-paste/power-bi-copy-reports.png" alt-text="Screenshot showing the Copy visual as image icon displayed.":::

1. When your visual is ready, paste it into another application using **Ctrl + V** or ***right-click*** > **Paste**. In this screenshot, we pasted the visual into an email.

   :::image type="content" source="media/power-bi-visualization-copy-paste/power-bi-email.png" alt-text="Screenshot showing the visual pasted into Outlook.":::

---

### Manage use of copying a visual as an image

If you're the content owner or administrator of the tenant, you can control whether a visual can be copied as an image from a report or dashboard.

#### Disable copy and paste for a specific visual

You can remove the copy icon from that visual in the Power BI service if you don't want users to be able to copy a specific visual. (Not available in Power BI Desktop).

1. Open the report in Editing mode.
1. Make the visual active by selecting it.
1. Select the paint brush icon to open the Formatting pane.
1. Select **General** > **Header icons** > **Icons** and expand the card.
1. Scroll down to the bottom of the card and toggle off **Copy icon**.

   :::image type="content" source="media/power-bi-visualization-copy-paste/power-bi-headers.png" alt-text="Image of Power BI service highlighting location of 'Copy icon' selected.":::

1. If you can't find the **Visual header** setting, turn on the modern visual header option under **Report settings**.

   :::image type="content" source="media/power-bi-visualization-copy-paste/power-bi-use-modern.png" alt-text="Screenshot showing Enable modern visual header selected.":::

1. Save changes. Reshare and republish as needed.

#### Disable copy and paste for a group of users

If you own the content or are an administrator of the tenant, you can control who can copy visuals. This setting disables *copy as image with caption* in reports and *copy visual as image* on dashboards for all users of the Power BI tenant. Users might still see the copy and paste options but they receive an error message when they try to use them.
  
1. Navigate to the Admin Portal.

1. Under **Tenant settings**, locate **Export and sharing settings**.

   :::image type="content" source="media/power-bi-visualization-copy-paste/power-bi-enable.png" alt-text="Screenshot showing the 'Copy and paste visuals' toggle enabled.":::

1. Disable **Copy and paste visuals**, for your selected Security groups.
  
## Considerations and limitations

As a Power BI user, the awareness of any considerations and limitations when copying and pasting visuals is helpful whether you're a novice or an experienced user. Here's some practical information to consider:

Q: Why is the Copy icon disabled on a visual?
A: The content owner or administrator of the tenant can turn off the copy feature for a visual which would disable the Copy icon.

:::image type="content" source="media/power-bi-visualization-copy-paste/power-bi-copy-grey.png" alt-text="Screenshot showing the 'Copy' icon grayed-out or disabled.":::

Q: Which visuals aren't fully supported for copying and pasting?
A: We support native Power BI visuals and certified custom visuals. There's limited support for certain visuals including:

- ESRI (Environmental Systems Research Institute) and other map visuals.
- Python visuals.
- R visuals.
- Power Apps visuals.
- Slicers and visuals that use *Filter APIs* which act as slicers. Learn more about [visual filter APIs](../developer/visuals/filter-api.md).
- [Licensed visuals](../developer/visuals/licensing-faq.yml#what-are-licensed-visuals-)
- Custom visuals that aren't certified. See [how to certify your custom visual.](../developer/visuals/power-bi-custom-visuals-certified.md)
- [AppSource visuals that are managed in your organizational store.](/fabric/admin/organizational-visuals#add-a-visual-from-appsoruce)
- Visuals with applied themes and colors.
- Freshly pinned dashboard tiles.
- Visuals with data filters can't be redirected.
- Visuals with personal bookmarks and other *sticky* states.

Q: Can I paste into any application?
A: No, only applications with support for pasting HTML.

Q: Why does the copied visual look different from the original?
A: Formatted content from the clipboard might not render everything that was copied from the visual.

Visualizations on *dashboards* can't be copied and pasted into Power BI reports or other dashboards.

## Related content

More about [Visualizations in Power BI reports.](power-bi-report-visualizations.md)

More questions? [Try the Power BI Community.](https://community.powerbi.com/)
