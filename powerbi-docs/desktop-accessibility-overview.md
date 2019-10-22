---
title: Overview of accessibility in Power BI
description: Features and suggestions for creating accessible Power BI Desktop reports
author: davidiseminger
manager: kfile
ms.reviewer: ''

ms.service: powerbi
ms.subservice: powerbi-desktop
ms.topic: conceptual
ms.date: 10/25/2019
ms.author: davidi

LocalizationGroup: Create reports
---
# Overview of accessibility in Power BI
When working with Power BI, it’s important to consider the different types of users who may be interacting with your reports. Creating and presenting reports that are easily navigated and understood by keyboard or screen reader users enables users, who may have visual or physical impairments, to receive the same information.

![High contrast windows settings](media/desktop-accessibility/accessibility-05b.png)

This article provides an overview of Power BI and accessibility. Additional articles provide guidance, and tools, that can help you create great reports with accessibility in mind.

## Universal design

Universal design is the design of products that are usable by as many people as reasonable possible, without the need for special adaptation or specialized design. When creating reports or experiences in Power BI, it’s important to consider the needs of your users. Designing an accessible experience will not only benefit your end users who may have hearing, motor, cognitive, or visual impairments. It can help all the end users in your organization. Power BI gives you the tools to make and consume accessible reports. It’s up to you, as a report creator, to use those tools to improve everyone’s experience.

## Accessibility standards

Power BI is compliant to the following accessibility standards.  This helps ensure that your Power BI experiences are accessible to as many people as possible.

### WCAG 2.1
Power BI adheres to Web Content Accessibility (WCAG) 2.1 guidelines. There are three primary principles of WCAG:

1. **Perceivable** - Information and user interface components must be presentable to users in ways they can perceive.
2. **Operable** - User interface components and navigation must be operable.
3. **Understandable** - Information and the operation of user interface must be understandable.

### US Section 508

US Section 508 is a standard that requires governments and federal agencies to make their electronic and information technology accessible to people with disabilities.

### EN 301 549
EN 301 549 is the Harmonized European Standard for Accessibility requirements for ICT products and services.  

## Report accessibility checklist

In addition to providing accessibility tools and functionality, Power BI provides the following checklist you can use when creating reports. This checklist helps ensure your reports are accessible, and available to the largest audience, before you publish it. 

### All visuals

* Ensure color contrast between title, axis label, and data label text and the background are at least 4.5:1.
* Avoid using color as the only means of conveying information. Use text or icons to supplement or replace the color.
* Replace unnecessary jargon or acronyms.
* Ensure **alt text** is added to all non-decorative visuals on the page.
* Check that your report page works for users with color vision deficiency.

### Slicers
* If you have a collection of several slicers on your report pages, ensure your design is consistent across pages. Use the same font, colors, and spatial position as much as possible.

### Textbox
* Ensure color contrast between font and background are at least 4.5:1.
* Make sure to put text contents in the **alt text** box so screen readers can read them.

### Visual interactions
* Is key information only accessible through an interaction? If so, rearrange your visuals so they are pre-filtered to make the important conclusion more obvious.
* Are you using bookmarks for navigation? Try navigating your report with a keyboard to ensure the experience is acceptable for keyboard-only users.

### Sort order
* Have you purposefully set the sort order of each visual on the page? The accessible **Show Data** table shows the data in the sort order you have set on the visual.

### Tooltips
* Don’t use tooltips to convey important information. Users with motor issues and users who do not use a mouse will have difficulties accessing them.
* Do add tooltips to charts as ancillary information. It is included in the accessible **Show Data** table for each visual.

### Video
* Avoid video that automatically starts when the page is rendered.
* Ensure your video has captions or provide a transcript.

### Audio
* Avoid audio that automatically starts when the page is rendered.
* Provide a transcript for any audio.

### Shapes
* Make sure any decorative shapes are marked as hidden in tab order, so they aren’t announced by a screen reader.
* Avoid using too many decorative shapes to the point where they are distracting.
* When using shapes to call out data points, use **alt text** to explain what is being called out.

### Images
* When using images to call out data points, use **alt text** to explain what is being called out.
* Make sure any decorative images are marked as hidden in tab order, so they aren’t announced by a screen reader.
* Avoid using too many decorative images, to the point where they are distracting.

### Custom visuals
* Check the accessible **Show Data** table for custom visuals. If the information shown is not enough, look for another visual.
* If using the *Play Axis* custom visual, ensure it does not auto play. Make it obvious that the user must press the play/pause button to start/stop the changing values.

### Across visuals on the page
* Set tab order and turn off tab order (mark the item as hidden) on any decorative items.


## Next steps

The collection of articles for Power BI accessibility are the following:

* [Creating accessible Power BI reports](desktop-accessibility-creating-reports.md) 
* [Consuming Power BI reports with accessibility tools](desktop-accessibility-consuming-tools.md)
* [Creating Power BI reports with accessibility tools](desktop-accessibility-creating-tools.md)
* [Accessibility keyboard shortcuts for Power BI reports](desktop-accessibility-keyboard-shortcuts.md)



