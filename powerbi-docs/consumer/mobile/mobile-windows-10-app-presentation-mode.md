---
title: View presentation mode on Windows devices - Power BI
description: Read about displaying Power BI dashboards, reports, and tiles in presentation mode on Windows devices.
author: paulinbar
ms.author: painbar
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-mobile
ms.topic: how-to
ms.date: 12/31/2023
---
# View reports and dashboards in presentation mode on Windows devices

>[!NOTE]
> The Power BI Windows app was retired on December 31st, 2023, and is no longer supported. It's been removed from the Microsoft apps store, and no further product updates for it will be released. Please use [the Power BI service](https://app.powerbi.com/) to view your Power BI content on Windows devices.
>
> This notice only applies to the Power BI Windows app. It does not affect the Power BI Desktop app.

You can use presentation mode to display reports and dashboards in full-screen on Windows devices. Presentation mode is useful for displaying Power BI at meetings or conferences, or on a dedicated projector at the office, or even just for maximizing space on a small screen.

![Screenshot of a report in presentation mode.](./media/mobile-windows-10-app-presentation-mode/power-bi-presentation-mode-2.png)

In presentation mode:
* All the "chrome" (such as the navigation and menu bars) disappears, making it easier to focus on the data in your report.
* An action toolbar becomes available to enable you to interact with your data and to control the presentation.
* You can play a slideshow that cycles automatically between pages, bookmarks, or both pages and bookmarks.

## Use presentation mode
In the Power BI Windows app, tap the **Switch to presentation mode** icon.
![Full screen icon](././media/mobile-windows-10-app-presentation-mode/power-bi-full-screen-icon.png)
The app chrome disappears and the action toolbar appears at the bottom of the screen or on the right and left sides (depending on your screen size).

[![Report in full-screen mode with side toolbars](./media/mobile-windows-10-app-presentation-mode/power-bi-presentation-mode-toolbar.png)](./media/mobile-windows-10-app-presentation-mode/power-bi-presentation-mode-toolbar-expanded.png#lightbox)

From the toolbar you can tap to perform the following actions:

| Icon | Action |
|------|--------|
|![back icon](./media/mobile-windows-10-app-presentation-mode/power-bi-windows-10-presentation-back-icon.png)|**Go back** to the previous page. A long tap on the icon pops up the breadcrumbs windows, allowing you to navigate to the folder containing your report or dashboard.|
|![Pagination icon](./media/mobile-windows-10-app-presentation-mode/power-bi-windows-10-presentation-pages-icon.png)|**Switch pages** to another page of the report in your presentation.|
|![Bookmarks icon](./media/mobile-windows-10-app-presentation-mode/power-bi-windows-10-presentation-bookmarks-icon.png)|**Apply a bookmark** to present the particular view of your data that that bookmark captures. You can apply both personal and report bookmarks.|
|![Ink icon](./media/mobile-windows-10-app-presentation-mode/power-bi-windows-10-presentation-ink-icon.png)|**Choose an ink color** when you use your Surface pen to draw and annotate on your report page.|
|![Eraser icon](./media/mobile-windows-10-app-presentation-mode/power-bi-windows-10-presentation-eraser-icon.png)|**Erase ink marks** you might have made with the Surface pen to draw and annotate on your report page.          |
|![Reset icon](./media/mobile-windows-10-app-presentation-mode/power-bi-windows-10-presentation-reset-icon.png)|**Reset to default view** and clear any filters, slicers, or any other data view changes you might have made during the presentation.|
|![Share icon](./media/mobile-windows-10-app-presentation-mode/power-bi-windows-10-share-icon.png)|**Share** an image of the presentation view with your colleagues. The image will include any annotations you have made with the Surface pen during the presentation.|
|![Refresh icon](./media/mobile-windows-10-app-presentation-mode/power-bi-windows-10-presentation-refresh-icon.png)|**Refresh** the report.|
|![Play icon](./media/mobile-windows-10-app-presentation-mode/power-bi-windows-10-presentation-play-icon.png)|**Play the slideshow**, hiding the action bar and starting the slideshow. A selector allows you to choose to auto-rotate between pages, bookmarks, or both pages and bookmarks. By default the slideshow auto-rotates between pages once every 30 seconds. You can change these settings in [**Settings > Options**](#slideshow-settings). See [more detail](#slideshows) about slideshows|
|![Exit full-screen mode](./media/mobile-windows-10-app-presentation-mode/power-bi-windows-10-exit-full-screen-icon.png)|**Exit** presentation mode.|
|![Search icon](./media/mobile-windows-10-app-presentation-mode/power-bi-windows-10-presentation-search-icon.png)|**Search** for other artifacts in Power BI.|

You can undock the toolbar and drag and drop it to anywhere on the screen. This is useful for large screens, when you want to focus on a specific area in your report and want to have the tools available next to it. Just place your finger on the toolbar and swipe it into the report canvas.

[![Report in presentation mode and undocked toolbar](./media/mobile-windows-10-app-presentation-mode/power-bi-windows-10-presentation-drag-toolbar-2.png)](./media/mobile-windows-10-app-presentation-mode/power-bi-windows-10-presentation-drag-toolbar-2-expanded.png#lightbox)

## Slideshows

You can play a slideshow to automatically cycle through your presentation. You can set the slideshow to cycle through pages, bookmarks, or both pages and bookmarks. During the slideshow, report pages with [auto page refresh](../../create-reports/desktop-automatic-page-refresh.md) will continue to automatically refresh as configured, ensuring that the most current data is always shown.

When you select the **Play** button on the action toolbar, the slideshow begins. A controller appears that allows you to pause the slideshow or to change what's being played: pages, bookmarks, or both pages and bookmarks.

![Screenshot of slideshow selector](././media/mobile-windows-10-app-presentation-mode//power-bi-windows-10-slideshow-selector.png)

 The controller shows the name of the currently displayed view (page or bookmark and page). In the image above, we see that in the report called **Sales**, we are currently viewing the **Asia Pacific** bookmark on the **Sales Performance** page.

By default, a slideshow cycles through pages only, at a rate of one every 30 seconds. You can change the default behavior in the [Slideshow settings](#slideshow-settings).

### Auto play a slideshow on startup

You can set up the Power BI Windows app to start playing a slideshow automatically whenever the app is launched. This option is useful for creating a kiosk-like experience that runs a report in public displays without any manual intervention. See [Slideshow settings](#slideshow-settings) for detail about setting up a report for autoplay.

### Slideshow settings

By default, a slideshow cycles through pages only, at a rate of one every 30 seconds. You can change this default behavior by going to **Settings > Options**, as illustrated below. You can also turn on autoplay and choose a report to play.

1. Select the settings icon.

1. Open the options page.

1. If desired, change the default settings for what the slideshow will cycle over (pages, bookmarks, or both) and how frequently the slides will transition.

1. If you want your report to start playing automatically when the app is launched, turn on the toggle and choose **Select Report**. You will be able to search for reports you have access to.

![Screenshot of slideshow settings](././media/mobile-windows-10-app-presentation-mode//power-bi-windows-10-slideshow-settings.png)

## Related content

* [Display dashboards and reports in full-screen mode from the Power BI service](../end-user-focus.md)
* Questions? [Try asking the Power BI Community](https://community.powerbi.com/)