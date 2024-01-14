---
title: "Display page numbers or other Power BI paginated report properties | Microsoft Docs"
description:  Add properties of your Power BI paginated report including page numbers, filenames, and titles, for display in page headers or footers. 
ms.date: 06/26/2023
ms.service: powerbi
ms.subservice: report-builder
ms.topic: conceptual
author: maggiesMSFT
ms.author: maggies
ms.reviewer: saurkumar
---
# Display page numbers or other paginated report properties (Power BI Report Builder)

[!INCLUDE [applies-yes-report-builder-no-desktop](../../includes/applies-yes-report-builder-no-desktop.md)]

  It's easy to add page numbers, a report title, file name, and other report properties to the page headers or footers of your Power BI paginated report. These properties are stored as fields in the Built-in Fields folder in the Report Data pane:  
  
- Execution time    
- Page number  
- Report name   
- Render format name 
- Total pages  
- User ID   
- Language  
  
 For a page number, you may want to add the word "Page" before the number. You may also want to show the total number of pages.  
   
## To add a page number or other report properties  
  
1.  In the Report Data pane, expand the Built-in Fields folder.  
  
    If you don't see the Report Data pane, on the View tab, check **Report Data**.  
  
1.  Drag the **Page Number** field from the Report Data pane to the report header or footer.  

    A text box that contains the simple expression [&PageNumber] is added. 

    > [!NOTE]  
    >  The page footer is added to the report automatically. To add a page header, on the **Insert** tab, select **Header**, and then select **Add Header**.  
  
## To add the word "Page" before the page number  
  
1.  Right-click the text box that contains [&PageNumber] and select **Expressions**.  
  
     The **Set Expression for: Value** text box contains the expression =Globals!PageNumber.  
  
1.  Place the cursor after the = sign and type **"Page " &**.  
  
     The expression is now  ="Page "&Globals!PageNumber  
  
1.  Select **OK**.
  
## To add total number of pages after the page number  
  
1.  Right-click the text box with the expression and select **Expressions**.  
  
1.  Type **&" of "&** at the end of the expression.  
  
1.  In the Category pane, expand **Built-in Fields** and double-click **TotalPages**.  
  
     The expression is now ="Page "&Globals!PageNumber &" of "&Globals!TotalPages  
  
1.  Select **OK**.

## Considerations and limitations

- Calculating the total number of pages may slow performance when you run or preview your report. We don't fully paginate the report unless you go to the end, as the tooltip states. The question mark (**?**) is by design, but you can force full pagination. One way to force it is to add a hidden text box in the footer or header with the expression "=Globals!OverallTotalPages". The report has to generate every page to answer that expression. 

- You can create and modify paginated report definition (.rdl) files in Power BI Report Builder.

## Related content

- [Page headers and footers in a paginated report (Power BI Report Builder)](page-headers-footers-report-builder-service.md)  
- [Format Text in a Text Box (Power BI Report Builder)](textbox/format-text-in-a-text-box-report-builder-and-service.md)  
  
  
