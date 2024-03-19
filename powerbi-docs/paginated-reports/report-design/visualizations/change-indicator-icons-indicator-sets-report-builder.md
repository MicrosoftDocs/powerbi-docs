---
title: "Change indicator icons and indicator sets in Power BI paginated reports | Microsoft Docs"
description: Learn how to change the indicator icons and sets in Power BI paginated report to include different, more, or fewer indicator icons enabling you to depict data better in Power BI Report Builder.  
ms.date: 04/24/2023
ms.service: powerbi
ms.subservice: report-builder
ms.topic: conceptual
author: maggiesMSFT
ms.author: maggies
ms.reviewer: saurkumar
---
# Change indicator icons and indicator sets in Power BI paginated reports (Power BI Report Builder)

[!INCLUDE [applies-yes-report-builder-no-desktop](../../../includes/applies-yes-report-builder-no-desktop.md)]

  The pre-configured indicators sets that are provided for Power BI paginated reports might not always depict your data effectively and work well in the delivered report. This topic provides procedures to change the appearance of indicator icons and change the indicator sets to include different, more, or fewer indicator icons.  
  
 Options such as colors can be set by using expressions. For more information, see [Expressions &#40;Power BI Report Builder&#41;](/sql/reporting-services/report-design/expressions-report-builder-and-ssrs).  
  
## Change the color of an indicator icon  
  
1.  Right-click the indicator you want to change and select **Indicator Properties**.  
  
2.  Select **Values and States** in the left pane.  
  
3.  Select the down arrow in the **Color** column next to the icon that you want to change and select the color to use, **No Color**, or **More colors**.  
  
     Optionally, select the **Expression** (*fx*) button to edit an expression that sets the value of the **Color** option.  
  
     If you selected **More Colors**, the **Select Color** dialog box opens, where you can choose from a wide array of colors. For more information about its options, see [Select Color Dialog Box &#40;Power BI Report Builder&#41;](/sql/reporting-services/report-design/formatting-lines-colors-and-images-report-builder-and-ssrs). Select **OK** to close the **Select Color** dialog box.  
  
4.  Select **OK**.  
  
## Change the icon  
  
1.  Right-click the indicator you want to change and select **Indicator Properties**.  
  
2.  Select **Values and States** in the left pane.  
  
3.  Select the down arrow next to the icon that you want to change and select a different icon.  
  
     Optionally, select the **Expression** (*fx*) button to edit an expression that sets the value of the **Icon** option.  
  
4.  Select **OK**.  
  
## Use a custom image as an indicator icon  
  
1.  Right-click the indicator you want to change and select **Indicator Properties**.  
  
2.  Select **Values and States** in the left pane.  
  
3.  Select the down arrow next to the icon that you wan to change and select **Image**.  
  
4.  In the **Select the image source** list, select **External**, **Embedded**, or **Database**.  
  
5.  Depending on the source of the image, do the one of the following:  
  
    -   To use an image that is stored externally to the report, select **Browse** and locate the image. The report will include a reference to the image.  
  
    -   To use an image that is embedded in the report, select **Import** and locate the image. The image will be added to the report definition and saved with it.  
  
    -   To use an image that is in a database, in the **Use this field** list. select the field from the list and then in the **Use this MIME type** list, select the MIME type of the image.  
  
6.  Select **OK**.  
  
## Add an icon to the indicator set  
  
1.  Right-click the indicator you want to change and select **Indicator Properties**.  
  
2.  Select **Values and States** in the left pane.  
  
3.  Select **Add**. An indicator is added, using the default icon and the **No Color** option.  
  
     Configure the indictor to use the icon and color you want. Procedures earlier in this topic describe the steps to do this.  
  
4.  Select **OK**.  
  
## Delete an icon to the indicator set  
  
1.  Right-click the indicator you want to change and select **Indicator Properties**.  
  
2.  Select **Values and States** in the left pane.  
  
3.  Select the icon to delete, and select **Delete**.  
  
4.  Select **OK**.  
  
## Related content

- [Indicators &#40;Power BI Report Builder&#41;](/sql/reporting-services/report-design/indicators-report-builder-and-ssrs)  
  

