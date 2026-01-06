---
title: Supported Browsers for Power BI and Fabric.
description: See a list of browsers that support Power BI and Fabric.
author: julcsc
ms.author: juliacawthra
ms.reviewer: ''
ms.service: powerbi
ms.subservice: pbi-fundamentals
ms.topic: concept-article
ms.date: 10/01/2025
LocalizationGroup: Get started
---
# Supported browsers for Power BI and Fabric

Power BI and Fabric are designed to work with any of the supported modern browsers mentioned here. However, performance differs depending on your browser choice. If you're using Internet Explorer, which Power BI and Fabric no longer support, you might encounter worse performance. We strongly recommend a supported modern browser, like Microsoft Edge. If you still encounter unacceptable performance, test other supported modern browsers to see if they provide better results for your Power BI solution.

Power BI and Fabric work with these browsers on all platforms where they're available:

- Microsoft Edge version 120 and newer.
- Chrome desktop latest version (newer than Chrome 94) and Windows 10 version 1703 and newer.
- Safari Mac latest version.
- Safari 16.4 and later.
- Firefox desktop latest version (newer than version 93). Firefox might change the fonts used in Power BI.

> [!NOTE]
> Power BI and Fabric don't run in any browsers on iOS 10 or earlier versions.

## Fonts

Power BI and Fabric use the Segoe UI font for text by default, the Din font for numbers, and other fonts when creating reports, dashboards, and other items. These fonts might not be available on non-Windows devices, such as Mac computers. As a result, the font, alignment of items, and visuals for the same report might look different when viewed on a Windows computer versus a Mac.

The Calibri and Cambria fonts are only installed on Mac computers that have Microsoft Office installed. Calibri and Cambria aren't included in the Mac default font set.

## Limitations and considerations

- If you're creating reports viewed on Mac computers, select fonts that display properly on a Mac. The following links provide information about which fonts are available on Mac. Microsoft doesn't support these links. We're providing them only for reference and further reading.
  - [Review the list of typefaces included with macOS.](https://wikipedia.org/wiki/List_of_typefaces_included_with_macOS)
  - [Find Calibri and Cambria for Mac.](https://apple.stackexchange.com/questions/128091/where-can-i-find-default-microsoft-fonts-calibri-cambria)
  - [Fix missing Calibri, Cambria, and Segoe UI fonts on a Mac.](https://ben.lobaugh.net/blog/204750/how-to-fix-missing-calibri-and-cambria-fonts-on-mac)
- Enable third-party cookies. Many areas of Power BI require third party cookies. Ensure that third-party cookies are enabled in your browser settings.
  - Microsoft Edge: Select **Settings > Privacy, search, and services > Cookies**. Ensure that **Allow sites to save and read cookie data (recommended)** is toggled on and **Block third-party cookies** is turned off. Optionally, scroll to **Allowed to save cookies**, select **Add site**, and add **app.powerbi.com**.
  - Chrome: Select **Settings > Privacy and security > Third-party cookies** and ensure that third-party cookies isn't turned off. Optionally, add **app.powerbi.com** to **Sites allowed to use third-party cookies**.
  - Firefox: **Settings > Privacy & security > Cookies and site data > Manage exceptions** and add **app.powerbi.com**.

## Related content

- [What is Power BI?](power-bi-overview.md)
- Check out the [Power BI forums](https://community.fabric.microsoft.com/t5/Power-BI-forums/ct-p/powerbi).
- Still have an issue? Visit the [Fabric support page](https://support.fabric.microsoft.com/support/).
