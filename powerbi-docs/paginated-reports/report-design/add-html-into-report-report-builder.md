---
title: "Add HTML into a Power BI paginated report | Microsoft Docs"
description: Find out how to import HTML using a placeholder from a field in your dataset to use in your paginated report in Power BI Report Builder.
ms.date: 06/27/2023
ms.service: powerbi
ms.subservice: report-builder
ms.topic: conceptual
author: maggiesMSFT
ms.author: maggies
ms.reviewer: saurkumar
---
# Add HTML into a paginated report (Power BI Report Builder)

[!INCLUDE [applies-yes-report-builder-no-desktop](../../includes/applies-yes-report-builder-no-desktop.md)]

  Using a placeholder, you can import HTML from a field in your dataset for use in the Power BI paginated report. By default, a placeholder represents plain text, so you will need to change the placeholder mark-up type to HTML. For more information, see [Importing HTML into a report (Power BI Report Builder)](/sql/reporting-services/report-design/importing-html-into-a-report-report-builder-and-ssrs).  
  
  
## Add HTML from a field in your dataset into a text box  
  
1. On the **Insert** tab, select **List**. Select the design surface, and then drag to create a box that is the size you want.  
  
     The **Dataset Properties** dialog box opens. You can use a shared dataset or a dataset embedded in your report. For more information, select [Dataset properties dialog box, query (Power BI Report Builder)](/sql/reporting-services/report-data/dataset-properties-dialog-box-query-report-builder) or [Dataset properties dialog box, query](/previous-versions/sql/).  
  
1. On the **Insert** tab, select **Text Box**. Select in the list, and then drag to create a box that is the size you want.  
  
1. Drag an HTML field from your dataset into the text box. A placeholder is created for your field.  
  
1. Right-click the placeholder, and then select **Placeholder Properties**.  
  
1. On the **General** tab, verify that the **Value** box contains an expression that evaluates to the field you dropped in step 3.  
  
1. Select **HTML - Interpret HTML tags as styles**. This causes the field to be evaluated as HTML.  
  
1. Select **OK**.
  
## Next steps  
 [Formatting numbers and dates (Power BI Report Builder)](/sql/reporting-services/report-design/formatting-numbers-and-dates-report-builder-and-ssrs)   
 [Formatting lines, colors, and images (Power BI Report Builder)](/sql/reporting-services/report-design/formatting-lines-colors-and-images-report-builder-and-ssrs)   
 [Placeholder properties dialog box, general (Power BI Report Builder)](/sql/reporting-services/report-design/text-boxes-report-builder-and-ssrs)  
  
