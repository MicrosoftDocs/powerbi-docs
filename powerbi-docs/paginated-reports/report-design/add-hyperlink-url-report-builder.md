---
title: "Add a hyperlink to a URL in a Power BI paginated report | Microsoft Docs"
description: Discover how to add hyperlink actions to text boxes, images, charts, and gauges in paginated reports in Power BI Report Builder.
ms.date: 06/26/2023
ms.service: powerbi
ms.subservice: report-builder
ms.topic: conceptual
author: maggiesMSFT
ms.author: maggies
ms.reviewer: saurkumar
---
# Add a hyperlink to a URL in a paginated report (Power BI Report Builder)

[!INCLUDE [applies-yes-report-builder-no-desktop](../../includes/applies-yes-report-builder-no-desktop.md)]

Learn how to add hyperlink actions to text boxes, images, charts, and gauges in Power BI paginated reports. Links can go to other reports, to bookmarks in a report, or to  static or dynamic URLs.

 You can add a hyperlink action to any item that has an **Action** property, for example, a text box, an image, or a calculated series in a chart. When the user selects that report item, the action that you define takes place.  
  
* You can **add a hyperlink that will open a browser with a URL** that you specify. The hyperlink can be a static URL or an expression that evaluates to a URL. If you have a field in a database that contains URLs, the expression can contain that field, resulting in a dynamic list of hyperlinks in the report. Make sure your report readers have access to the URL that you provide.  
   
* You can also **specify URLs to create drillthroughs** to any reports in the Power BI service that you and your users have permission to view using URL requests. 
 
 * You can **add a bookmark to a specific place** in the same report. 
  
Try adding hyperlinks with sample data in [Tutorial: Format Text (Power BI Report Builder)](/sql/reporting-services/tutorial-format-text-report-builder).  
  
> [!NOTE]  
>  Links that are bound to dataset fields can be vulnerable to tampering for malicious purposes. For more information, see [Secure Reports and Resources](/sql/reporting-services/security/secure-reports-and-resources).  
  
## Add a hyperlink  
  
1. In report design view, right-click the text box, image, or chart to which you want to add a link and then select **Properties**.  
  
1. In the Properties dialog box, select the **Action** tab. Read on for information about your options.  

Now that you're in the Properties box, you have your choice of actions.

- [Add drillthrough to another report](#add-drillthrough-to-another-report).
- [Add a bookmark](#add-a-bookmark).
- [Add a hyperlink](#add-a-hyperlink-1).

### Add drillthrough to another report

1. On the **Action** tab, select **Go to report**. 

1. Specify the target report and parameters you want to use. The parameter names must match the parameters defined for the target report. 

1. Use the **Add** and **Delete** buttons to add and remove parameters, and the up and down arrows to order the list of parameters.

1. Type or select a **Value** to pass for the named parameter in the drillthrough report. Select the Expression (fx) button to edit the expression.

1. Select **Omit** to prevent the parameter from running. By default, this check box is cleared and not active. To select the check box, select the Expression (fx) button and either type True or create an expression. The check box is selected when you select **OK** in the Expression dialog box.
  
   See [Add a drillthrough action on a paginated report](../../paginated-reports/report-design/add-drillthrough-action-report-report-builder.md) for more information. 
   
1. Select **OK**.
   
### Add a bookmark

You can link to bookmarks to a location in the current report. To link to a bookmark, you must first set the **Bookmark** property of a report item. To set the **Bookmark** property, select a report item, and in the Properties pane, type a value or expression for the bookmark ID; for example, SalesChart or TopSales.

1. On the **Action** tab, select **Go to bookmark**. 

1. Type or select the bookmark ID for the report to jump to. Select the Expression (fx) button to change the expression. 

   The bookmark ID can be either a static ID or an expression that evaluates to a bookmark ID. The expression can include a field that contains a bookmark ID.
   
   See [Add a bookmark to a report](add-bookmark-report-report-builder.md) for more information.
   
1. Select **OK**.

### Add a hyperlink 
  
1. On the **Action** tab, select **Go to URL**. An additional section appears in the dialog box for this option.  
  
1. In **Select URL**, type or select a URL or an expression that evaluates to a URL, or select the drop-down arrow and select the name of a field that contains a URL. 

    For an item published to the Power BI service, use a full or relative path. For example,
   `https://app.powerbi.com/groups/<xxxxxxxxx>/rdlreports/<xxxxxxxxxxxx>?experience=power-bi`. 
      
1. Select **OK**.

## After you add a hyperlink
  
1. (Optional) The text isn't automatically formatted as a link. For text, it's helpful to change the color and effect of the text to indicate that the text is a link. For example, change the color to blue and the effect to underline in the **Font** section in the Home tab of the Ribbon.  
  
1. To test the link, select **Run** to preview the report, and then select the report item that you set this link on.  
  
## Related content

* [Add a drillthrough action on a paginated report](../../paginated-reports/report-design/add-drillthrough-action-report-report-builder.md)
* [Add a bookmark to a report](add-bookmark-report-report-builder.md)

  
  
