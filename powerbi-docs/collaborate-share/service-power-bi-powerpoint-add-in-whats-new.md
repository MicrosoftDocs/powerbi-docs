---
title: What's new in the Power BI add-in for PowerPoint
description: Learn about new features recently added to the Power BI add-in for PowerPoint.
author: ajburnle
ms.author: ajburnle
ms.reviewer: ''
featuredvideoid: ''
ms.service: powerbi
ms.subservice: pbi-collaborate-share
ms.topic: how-to
LocalizationGroup: Share your work
ms.date: 02/26/2024
---

# What's new in the Power BI add-in for PowerPoint

## March 2024

### Improved static image mode in the Power BI add-in for PowerPoint

The "save as static image" functionalilty that enables you to turn your live view of Power BI data into a static image has been improved and expanded. It's now easier to use, and provides an option that lets you use static image mode without having to worry about the image exposing Power BI content to unauthorized users.

First, a new dropdown menu in the add-in footer makes it easier to switch between live data and a static image.

:::image type="content" source="./media/service-power-bi-powerpoint-add-in-whats-new/snapshot-toggle.png" alt-text="Screenshot of the Power BI PowerPoint add-in showing the snapshot menu." border="false":::

Next, for the static image, you now have two options: *Snapshot* and *Public snapshot*.

* **Snapshot**: If you select Snapshot, only users who have permission to view the report in Power BI will be able see the static image of the Power BI content. Users who don't have permission will be able to request access. This option helps you keep from inadvertently showing Power BI content to unauthorized users.

* **Public snapshot**: If you select Public snapshot, anyone who can view the presentation to be able to see the static image of the Power BI content, regardless of their permissions in Power BI.

#### Slide thumbnails

The improved functionality also prevents static images from being exposed to unauthorized users in the slide thumbnail images that appear in such places as the slide navigation pane and the slide sorter.

Here's how it works. When you open a presentation, the thumbnail images of slides that have the add-in just display a blue-cube. Then, when a slide with the add-in is actually loaded into edit mode, permissions are checked. At that point
* If the static image was saved as "Snapshot", the thumbnail will switch to display the Power BI logo.
* If the static image was saved as "Public snapshot", the thumbnail will switch to display the saved static image.

In short, with the snapshot option, you don't have to worry about your static image exposing Power BI content to unauthorized users, even in the slide thumbnails!

#### Important considerations

The improved save-as-static-image functionallty requires **Office version 2312 (Build 17126)** or later. If your Office version meets this requirement, don't use the *Save as image* option located the add-in side pane.

You can only switch between **Live Data** and **Snapshot** in the PowerPoint desktop application - you can't do this in PowerPoint for the web. However, PowerPoint for the web **does** respect the the choice you made in the desktop application. So whatnever view you selected in the desktop app will be the view that you'll see in PowerPoint for the web.

## February 2024

### Change a direct link to a shareable Link

When you paste a direct report link (the URL copied from the browser) to the Power BI add-in in a presentation, you can now make that link shareable within the Power BI add-in. Previously, when you pasted a direct report link into the Power BI add-in, there was no option to make it sharable in the add-in before you added it to the presentation. Viewers of the presentation had to have access to the report before you used the direct report link or they wouldn't be able to see the data. 

Now, if you have permissions to re-share a report, the Power BI add-in can replace the link you pasted with a shareable link. When you have sharable links enabled, you'll see a checkbox added below the report URL that asks you if you want to give viewers automatic access to the data. Mark this checkbox and Power BI add-in creates a shareable link for you. If you use a sharable link, other users viewing the presentation will have the required permissions to see the report and won't need to request access when the viewing the presentation.

You must have sharable links enabled for your organization to use this feature. For more information on using sharable links, go to [Change a direct link to a shareable link](./service-power-bi-powerpoint-add-in-install.md#change-a-direct-link-to-a-shareable-link).
## December 2023

### Suggested content

It's easier to find and insert the Power BI reports you need for your presentation. Now, when you add the Power BI add-in to your slide, the add-in automatically scans the title of the slide and suggests Power BI content that might be relevant. Let's say the title of your slide is "New stores sales," for example. The add-in shows you a list of Power BI reports that contain data about sales. The add-in also shows you your recently visited Power BI reports, and makes it easy to access reports you're working on or frequently use. [Learn more about the new feature](https://powerbi.microsoft.com/en-us/blog/power-bi-december-2023-feature-summary/#post-25451-_Toc152674248)

:::image type="content" source="./media/service-power-bi-powerpoint-add-in-whats-new/suggested-content.gif" alt-text="Screenshot showing suggest content for the Power BI add-in for PowerPoint.":::

## April 2023

### Put a border around your add-in

Now you can add a custom outline to your Power BI add-in. Customize color, weight, transparency, and more to make your data stand out.

:::image type="content" source="./media/service-power-bi-powerpoint-add-in-whats-new/power-bi-powerpoint-addin-add-border.gif" alt-text="Animation showing adding a border around the Power BI add-in for PowerPoint.":::

## March 2023

### Storytelling with Power BI in PowerPoint is now GA

With exciting, recently released features you can now:
* Easily add single visualizations to your slides
* Generate and add Smart insights to your presentations
* Enjoy the Power BI/PowerPoint integration in national/regional clouds 

[Check out the blog](https://powerbi.microsoft.com/blog/storytellingga/)

### National cloud support

The Power BI add-in for PowerPoint is now supported in national/regional clouds as an admin-managed add-in. For more information, see [Deploying the add-in in national/regional clouds](./service-power-bi-powerpoint-add-in-admin.md#deploying-the-add-in-in-nationalregional-clouds).

## February 2023

### Add individual live Power BI visuals to your PowerPoint slides

Ever want to put just a single live visual on a slide? Well, now it's super easy. Right select on the visual and choose **Open in PowerPoint** to open a new presentation with the visual already loaded into the add-in. If you're adding the visual to an existing presentation, choose **Link to selection** to get the visual's URL for pasting into the add-in in the existing presentation. You can do the same from the **More options (...)** menu. Check out the [documentation](./service-power-bi-powerpoint-add-in-install.md#use-the-direct-url-to-add-live-data-to-a-presentation) for details.

:::image type="content" source="./media/service-power-bi-powerpoint-add-in-whats-new/share-visual-option.png" alt-text="Screenshot showing the share options for adding a visual to a PowerPoint slide.":::

### Enhance your presentations with Power BI data insights

Power BI's data insights help you find and explore insights such as anomalies and trends as you consume and interact with your data. Now with the add-in, you can easily generate insights, which you can then either paste directly into your slide or copy to the clipboard for pasting elsewhere, such as in the slide's notes. [Learn more](./service-power-bi-powerpoint-add-in-view-present.md#enrich-your-presentation-with-data-insights).

:::image type="content" source="./media/service-power-bi-powerpoint-add-in-whats-new/single-visual-and-insights-demo.gif" alt-text="Animated image showing how to add a data insight to a PowerPoint presentation.":::

## Related content

* [About storytelling with Power BI in PowerPoint](./service-power-bi-powerpoint-add-in-about.md)
* [Add live Power BI data to PowerPoint](./service-power-bi-powerpoint-add-in-install.md)
* [View and present live Power BI data in PowerPoint](./service-power-bi-powerpoint-add-in-view-present.md)
* [Troubleshoot the Power BI add-in for PowerPoint](./service-power-bi-powerpoint-add-in-troubleshoot.md)
* More questions? [Try asking the Power BI Community](https://community.powerbi.com/)