---
title: "Format text in a text box in paginated reports (Power BI Report Builder) | Microsoft Docs"
description: Discover how to format text in a text box in paginated reports, and how to mix placeholder text and static text to create mail merges or templates for text in Power BI Report Builder. 
ms.date: 01/26/2023
ms.service: powerbi
ms.subservice: report-builder
ms.topic: conceptual
author: maggiesMSFT
ms.author: maggies
ms.reviewer: rpatkar
---
# Format text in a text box in paginated reports (Power BI Report Builder)

[!INCLUDE [applies-yes-report-builder-no-desktop](../../../includes/applies-yes-report-builder-no-desktop.md)]

In Power BI paginated reports, you can format any part of the text in a text box independently, and mix placeholder text and static text in one text box. This ability to mix formats and add placeholder text enables you to create mail merges or templates for text in your paginated report. Any expression can be defined and formatted separately using a placeholder.  
  
## Combine multiple formats in a text box  
  
1.  On the **Insert** tab, select **Text Box**. Select the design surface, and then drag to create a box that is the size you want.  
  
2.  Inside the text box, select the text you want to format.  
  
3.  Right-click the selected text, and select **Text Properties**.  
  
4.  Set formatting options. For example, on the **General** tab:  
  
    -   **Tooltip** Type text or an expression that evaluates to a ToolTip. The ToolTip appears when the user pauses the pointer over the item in a report  
  
    -   **Markup type** Select an option to indicate how the selected text will be rendered:  
  
         **Plain Text** Display the selected text as simple text. HTML will be treated as literal text.  
  
         **HTML**  Display the selected text as HTML. If the expression value of the placeholder contains valid HTML tags, these tags will be rendered as HTML. For more information, see [Importing HTML into a Report &#40;Report Builder and Service&#41;](/sql/reporting-services/report-design/importing-html-into-a-report-report-builder-and-ssrs).  
  
5.  Select **OK**.  
  
6.  Repeat steps 2 through 5 for the remaining text you want to format.  
  
## Format text and placeholders differently in the same text box  
  
1.  On the **Insert** tab, select **List**. Select the design surface, and then drag to create a box that is the size you want. The **Dataset Properties** dialog box opens. You can use a dataset embedded in your report. For more information, see [Dataset Properties Dialog Box, Query &#40;Report Builder&#41;](/sql/reporting-services/report-data/dataset-properties-dialog-box-query-report-builder).  
  
2.  On the **Insert** tab, select **Text Box**. Select in the list, and then drag to create a box that is the size you want.  
  
3.  Type a label in the text box - for example, "**My Field**:".  
  
4.  Drag a field from your dataset into the text box. A placeholder is created for your field.  
  
5.  For basic formatting, select the placeholder text and then select one of the formatting options in the **Font** group on the **Home** tab. For example, select the **Bold** button.  
  
     For more formatting options, right-click the placeholder text, and then select **Placeholder Properties**.  
  
6.  Select **OK**. In report design view, the text box should contain "**My Field**: [*FieldName*]", where *FieldName* is the name of your field.  
  
7.  Select **Run**.  
  
 The list repeats one time for every value in the field, and the *FieldName* placeholder is replaced each time by the value of that field in the dataset.  
  
## Related content

- [Text Boxes &#40;Report Builder and Service&#41;](/sql/reporting-services/report-design/text-boxes-report-builder-and-ssrs)   
- [Formatting Text and Placeholders &#40;Report Builder and Service&#41;](/sql/reporting-services/report-design/formatting-text-and-placeholders-report-builder-and-ssrs)   
- [Expression Uses in Reports &#40;Report Builder and Service&#41;](/sql/reporting-services/report-design/expression-uses-in-reports-report-builder-and-ssrs)   
- [Expression Examples &#40;Report Builder and Service&#41;](/sql/reporting-services/report-design/expression-examples-report-builder-and-ssrs)   
- [Add HTML into a Report &#40;Report Builder and Service&#41;](/sql/reporting-services/report-design/add-html-into-a-report-report-builder-and-ssrs)   
- [Tables, Matrices, and Lists &#40;Report Builder and Service&#41;](../../report-builder-tables-matrices-lists.md)   
- [Formatting Numbers and Dates &#40;Report Builder and Service&#41;](/sql/reporting-services/report-design/formatting-numbers-and-dates-report-builder-and-ssrs)   
- [Placeholder Properties Dialog Box, General &#40;Report Builder and Service&#41;](./text-boxes-report-builder-and-service.md)  
  
