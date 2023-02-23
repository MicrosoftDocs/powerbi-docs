---
title: Add a live Power BI report page to PowerPoint
description: Learn how to install the Power BI PowerPoint add-in in a PowerPoint slide.
author: paulinbar
ms.author: painbar
ms.reviewer: ''
featuredvideoid: ''
ms.service: powerbi
ms.subservice: pbi-collaborate-share
ms.topic: how-to
LocalizationGroup: Share your work
ms.date: 02/23/2023
---

# Add live Power BI data to PowerPoint (preview)

With the Power BI add-in for PowerPoint, you can add both individual visuals and whole report pages to your PowerPoint slides.

* When you add a whole report page, the left-hand page navigation pane isn't brought in by the add-in, but any page navigation visuals on the report page itself will function normally as they do in the Power BI service.
* Adding individual visuals is useful when you want your slide to focus on a single visualization - chart, graph, table, etc.

To add live Power BI data to a PowerPoint slide, you first need to get the URL of the report page or visual. You then paste the URL into the Power BI add-in in PowerPoint.

* Get the URL: [Report page](#get-the-url-of-a-report-page) | [Visual](#get-the-url-of-a-visual)

* [Paste the URL into the Power BI add-in in PowerPoint](#paste-the-url-of-a-report-or-visual-into-the-add-in)

## Get the URL of a report page

If you want to add a live report page to your presentation, you need to have it's URL. There are three ways to get the report page URL:

* Through the **Share** option
* Through the **Export** option
* From the browser's address bar

These methods differ in whether or not they can preserve the report page's current state, and what permissions people who open the PowerPoint presentation will have for viewing the report. The table below summarizes the differences.

| URL source | URL can preserve current state | Can users who open the presentation view the report? |
|:---------|:---------|:---------|
| Share     | Yes        | Yes, if you grant read permissions when generating the shareable link.        |
| Export     | Yes         |  Depends on the user's Power BI permissions |
| Address bar     | No        |  Depends on the user's Power BI permissions |

Use the **Share** option if you want to be sure that all users who open the presentation will be able to view the report.

Choose how you want to get the report page URL.

# [Share option](#tab/share)

1. In the Power BI service, open the report to the page you want to insert. If desired, configure the page to the desired state using filters, selection, slicers, etc.

1. Choose **Share**.

    ![Screenshot of Power B I report Share option.](media/service-power-bi-powerpoint-add-in-install/share-report-option.png)

1. Choose the permissions you want to grant and who you want to grant them to, as described in the [sharing reports documentation](service-share-dashboards.md#share-a-report-via-link). Select **Apply**.

    :::image type="content" source="media/service-power-bi-powerpoint-add-in-install/send-link-dialog.png" alt-text="Screenshot of Power B I report send link dialog.":::

1. Check the **Include my changes** box if you want to share the report pages current state, and then select **PowerPoint**.

    :::image type="content" source="media/service-power-bi-powerpoint-add-in-install/include-my-changes-checkbox.png" alt-text="Screenshot of Power B I report include my changes checkbox.":::

1. Copy the URL to paste into the Power BI PowerPoint add-in. Alternatively, if you want to create a new presentation with the report already loaded into the add-in, choose **Open in PowerPoint**.

    :::image type="content" source="media/service-power-bi-powerpoint-add-in-install/copy-link-dialog.png" alt-text="Screenshot of Power B I report copy link dialog.":::

# [Export option](#tab/export)

1. In the Power BI service, open the report to the page you want to insert. If desired, configure the page to the desired state using filters, selection, slicers, etc.

1. Choose **Export > PowerPoint > Embed live data**.

    ![Screenshot of Power B I report embed live data option.](media/service-power-bi-powerpoint-add-in-install/embed-live-data-option.png)

1. Check the **Embed report with the data filters you selected** box if you want to export the current state, and then copy the URL and [paste it into the Power BI PowerPoint add-in](#paste-the-url-of-a-report-or-visual-into-the-add-in). If you're creating a new presentation, you can just choose **Open in PowerPoint**. This opens a new PowerPoint presentation with the report already loaded into the add-in.

    :::image type="content" source="media/service-power-bi-powerpoint-add-in-install/embed-live-data-dialog.png" alt-text="Screenshot of Power B I report embed live data dialog.":::

    >[!NOTE]
    > Although this option is located in the Export menu and is labeled "Embed live data", no data actually becomes part of the PowerPoint file. The data remains secure in Power BI.

# [Browser address bar](#tab/addressbar)

In the Power BI service, open the report to the page you want to insert, copy the URL from the browser's address bar, and then copy the URL to paste into the Power BI add-in in PowerPoint.

![Screenshot of Power B I report URL in browser address bar.](media/service-power-bi-powerpoint-add-in-install/report-page-url-address-bar.png)

---

## Get the URL of a visual

If you want to add a live visual to your presentation, you need to have its URL. The easiest way to get a visual's URL is as follows.

1. In the Power BI service, open the report to the page that has the visual you want to insert. If desired, configure the visual to the desired state using filters, selection, slicers, etc.

1. Right-click the visual and choose **Share > Open in PowerPoint**. Alternatively, use the **More options (...)** menu.

    :::image type="content" source="media/service-power-bi-powerpoint-add-in-install/share-visual-option.png" alt-text="Screenshot of Power B I visual Share option.":::

1. Copy the URL and then [paste it into the Power BI PowerPoint add-in](#paste-the-url-of-a-report-or-visual-into-the-add-in). If you're creating a new presentation, you can just choose **Open in PowerPoint**. This opens a new PowerPoint presentation with the visual already loaded into the add-in.

    :::image type="content" source="media/service-power-bi-powerpoint-add-in-install/copy-visual-link-dialog.png" alt-text="Screenshot of Power B I visual copy link dialog.":::

## Paste the URL of a report or visual into the add-in

When you have the report or visual URL you need, paste it into the Power BI add-in in PowerPoint. This step isn't relevant if you chose **Open in PowerPoint** while in Power BI.

1. Open PowerPoint and navigate to the slide where you want to add the report or visual.

1. Select the **Insert** ribbon and choose the **Power BI** button.

    ![Screenshot of selecting the Power B I report add-in.](media/service-power-bi-powerpoint-add-in-install/insert-power-bi-add-in.png)

    >[!NOTE]
    > If you don't see the **Power BI** button, choose **Get Add-ins** and look for "Microsoft Power BI" in the Office Add-ins store. If the add-in is admin managed, it will appear in a separate ribbon.

1. Paste the URL into the text box and then select **Insert**. The report or visual will load into the slide.

    >[!NOTE]
    > If you get a **Cannot run Power BI error message**, it is most likely because you need to install WebView2, a component necessary for running Power BI in PowerPoint. WebView2 is very simple and quick to install. See [Troubleshoot the Power BI add-in for PowerPoint](./service-power-bi-powerpoint-add-in-troubleshoot.md) for details.

    The image below illustrates inserting the add-in into a slide and pasting in the URL.

    :::image type="content" source="media/service-power-bi-powerpoint-add-in-install/inserting-power-bi-add-in.gif" alt-text="Screenshot of inserting the Power B I report page into the add-in.":::

    Once the report or visual has loaded, it's live and you can select the data as desired. Any changes you make while editing the presentation will be saved. The next time you open the presentation, the report or visual will appear in the state you last left it in. For more information, see [View and present live Power BI data in PowerPoint](./service-power-bi-powerpoint-add-in-view-present.md).

## Next steps

* [About storytelling with Power BI in PowerPoint](./service-power-bi-powerpoint-add-in-about.md)
* [View and present live Power BI data in PowerPoint](./service-power-bi-powerpoint-add-in-view-present.md)
* [Information for Power BI administrators](./service-power-bi-powerpoint-add-in-admin.md)
* [Troubleshoot the Power BI add-in for PowerPoint](./service-power-bi-powerpoint-add-in-troubleshoot.md)
* More questions? [Try asking the Power BI Community](https://community.powerbi.com/)
