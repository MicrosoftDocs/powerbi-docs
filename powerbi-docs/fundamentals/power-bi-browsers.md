---
title: Supported browsers for Power BI and Fabric.
description: See a list of browsers that support Power BI and Fabric.
author: mihart
ms.author: mihart
ms.reviewer: ''
ms.service: powerbi
ms.subservice: pbi-fundamentals
ms.topic: conceptual
ms.date: 07/08/2024
LocalizationGroup: Get started
---
# Supported browsers for Power BI and Fabric

Power BI and Fabric are designed to work with any of the supported modern browsers mentioned here. However, performance differs depending on your choice of a browser. If you're using Internet Explorer in particular, which is no longer supported by Power BI or Fabric, you might encounter worse performance. We strongly recommend a supported modern browser, like Microsoft Edge. If you still encounter unacceptable performance, test other supported modern browsers to see if they provide better results for your Power BI solution.

Power BI and Fabric work with these browsers on all platforms where they're available:

- Microsoft Edge version 120 and newer.
- Chrome desktop newest version (older than Chrome 94) and Windows 10 version 1703 and newer.
- Safari Mac newest version.
- Safari 16.4 and newer.
- Firefox desktop newest version (older than version 93). Firefox might change the fonts used in Power BI.

> [!NOTE]
> Power BI and Fabric don't run in any browsers in iOS10 or previous versions.

## Fonts

Power BI and Fabric use the Segoe UI font for text as its default, and the Din font for numbers, and other fonts when creating reports, dashboards, and other items. These fonts might not be available on non-Windows computers such as Macs. As a result the font, alignment of items, and visuals for the same report look different when viewed on a Windows computer versus a Mac.

The Calibri and Cambria fonts are only installed on Macs that have Microsoft Office installed. Calibiri and Cambria aren't included in the default set of fonts on Macs.

## Limitations and considerations

- If you're creating reports viewed on Mac computers, select fonts that display properly on Macs. The following links provide information about which fonts are available on Macs. Microsoft doesn't support these links. We are providing them only for reference and further reading.
    - [Review the list of typefaces included with macOS.](https://wikipedia.org/wiki/List_of_typefaces_included_with_macOS)
    - [Find Calibri and Cambria for Macs.](https://apple.stackexchange.com/questions/128091/where-can-i-find-default-microsoft-fonts-calibri-cambria)
    - [Fix missing Calibri, Cambria, and Segoe UI fonts on a Mac.](https://ben.lobaugh.net/blog/204750/how-to-fix-missing-calibri-and-cambria-fonts-on-mac)
- Enable third-party cookies. Many areas of Power BI require third party cookies. Ensure that third-party cookies are enabled in your browser settings.
    - Microsoft Edge: Select **Settings > Cookies and site permissions > Cookies and data stored > Manage and delete cookies and site data**. Ensure that **Allow** is toggled on and **Block 3rd-party cookies** is turned off. Optionally, scroll to **Allow** and add **app.powerbi.com**.
    - Chrome: Select **Settings > Privacy and security > Third-party cookies** and ensure that third-party cookies isn't turned off. Optionally, add **app.powerbi.com** to **Allowed to use third-party cookies**.
    - Firefox: **Settings -> Privacy and security -> Cookies and site data -> Manage exceptions** and add **app.powerbi.com**.

## Related content

- [What is Power BI?](power-bi-overview.md)
- Ask the [Community](https://community.powerbi.com/)
- Still have an issue? Visit the [Power BI support page](https://powerbi.microsoft.com/support/)
