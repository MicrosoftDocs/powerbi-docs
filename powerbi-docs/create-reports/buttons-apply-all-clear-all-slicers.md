---
title: Create Apply all slicers and Clear all slicers buttons in Power BI reports 
description: You can add buttons in Power BI reports that apply all the slicers or clear all the slicers on the page.
author: maggiesMSFT
ms.author: maggies
ms.reviewer: ''
ms.service: powerbi
ms.subservice: pbi-reports-dashboards
ms.topic: how-to
ms.date: 03/10/2023
ms.custom: sample-get-started-desktop-best-worst-states, sample-sales-&-returns
LocalizationGroup: Create reports
---
# Create Apply all slicers and Clear all slicers buttons in reports

[!INCLUDE [applies-yes-desktop-yes-service](../includes/applies-yes-desktop-yes-service.md)]

With *Apply all slicers* and *Clear all slicers* buttons, you can create buttons in Power BI reports that apply all the slicers or clear all the slicers on a page.

![Screenshot showing Apply all slicers button in Power BI.](media/desktop-buttons/power-bi-qna-button.png)

## Create an Apply all button in reports

### [Power BI Desktop](#tab/powerbi-desktop)

In Power BI Desktop, on the **Insert** ribbon, select **Buttons** to reveal a drop-down menu, then select the **Apply all** button.

![Screenshot showing Add a button control in Power BI Desktop.](media/buttons-apply-all-clear-all-slicers/power-bi-apply-all-button-dropdown.png)

### [Power BI service](#tab/powerbi-service)

In the Power BI service, open the report in Editing view. Select **Buttons** in the top menu bar to reveal a drop-down menu, where you can select the button you want from a collection of options.

![Screenshot showing Add a button control in the Power BI service.](media/desktop-buttons/power-bi-button-service-dropdown.png)

---

## Customize a button

Whether you create a button in Power BI Desktop or the Power BI service, the rest of the process is the same. When you select a button on the report canvas, the **Format** pane shows you the many ways you can customize the button to fit your requirements. For example, you can customize the shape of a button.

:::image type="content" source="media/desktop-buttons/power-bi-customize-shape-parallelogram.png" alt-text="Screenshot showing how to customize the shape of an arrow button to a parallelogram.":::

For more information, see [Customize buttons in Power BI reports](power-bi-customize-button.md).

## Considerations and limitations

### Considerations about the buttons

Some things to keep in mind with these buttons:

- **Apply all slicers** and **Clear all slicers** buttons impact all the slicers on the report page. You can't pick and choose which slicers you want each button to control. They also don't control the Filters pane.

- You can have as many of these buttons on your report page as you like. If you have most of your slicers in one section, with one or two slicers in another section, you can have a button in both sections. When you press either button it applies to all the slicers on the report page.

- Hiding the last Apply all slicers button releases its control over the slicers. They revert to instantly applying selections as you click.

### Considerations about the slicers

Some things to keep in mind with the slicers:

- The slicers with selections not yet applied to other visuals are in a pending state.
- This pending state of the slicer is indicated in the Slicer header with a pending clock icon and some customizable text.
- The slicer pending icon can't be changed. However, you can change the pending icon color, size, transparency, if it’s to the left or right of the header, or even if it’s shown at all, in the formatting pane.
- If the slicer header is turned off, then there's no indication of the pending state of the selections on the slicer itself. However, the Apply all slicers button is in a disabled state until one or more of the slicers has a pending change.

## Next steps

For more information about features that are similar or interact with buttons, take a look at the following articles:

- [Create page and bookmark navigators](button-navigators.md)
- [Identify and use buttons in the Power BI service](../consumer/end-user-buttons.md)
- [Use drillthrough in Power BI reports](desktop-drillthrough.md)
- [Use bookmarks to share insights and build stories in Power BI](desktop-bookmarks.md)
- [Create a drillthrough button](desktop-drill-through-buttons.md)
