---
title: "Quickstart: Create a paginated report and upload it to the Power BI service | Microsoft Docs"
description: In this quickstart, you use a wizard in Report Builder to create a paginated report with a pie chart. Then you upload the paginated report to the Power BI service.  
author: maggiesMSFT
manager: kfile
ms.reviewer: ''

ms.service: powerbi
ms.component: report-builder
ms.topic: quickstart
ms.date: 08/01/2018
ms.author: maggies
---

# Quickstart: Create a paginated report and upload it to the Power BI service

In this quickstart, you create a paginated report with a pie chart by using a wizard in Report Builder. You add percentages and modify the pie chart. Then you upload the paginated report to the Power BI service.
  
This quickstart uses XML data that you copy from this article and paste into the wizard. You don't need to be connected to a SQL Server Reporting Services report server or Power BI Report Server, and you don't need access to an instance of SQL Server.  
 
## Prerequisites  

To create the paginated report:

- You need to install [Report Builder from the Microsoft Download Center](http://go.microsoft.com/fwlink/?LinkID=734968). 

To upload your paginated report to the Power BI service:

- You need a [Power BI Pro license](service-admin-power-bi-pro-in-your-organization.md).
- Your **My Workspace** or app workspace on the service needs to be in a [Power BI Premium capacity](service-premium.md). Look for the diamond icon ![Premium diamond icon](media/paginated-reports-quickstart-chart/premium-diamond.png) next to the workspace name.

## Create the pie chart
  
1.  Start Report Builder from your computer.  
  
     The **Getting Started** dialog box opens.  
  
     "Report Builder Get Started" 
  
     If the **Getting Started** dialog box does not open, select **File** > **New**. The **New Report or Dataset** dialog box has most of the same contents as the **Getting Started** dialog box.  
  
2.  In the left pane, verify that **New Report** is selected.  
  
3.  In the right pane, select **Chart Wizard**, and then select **Create**.  
  
4.  In the **Choose a dataset** page, select **Create a dataset**, and then select **Next**.  
  
5.  In the **Choose a connection to a data source** page, select **New**.  
  
     The **Data Source Properties** dialog box opens.  
  
6.  You can name a data source anything you want. In the **Name** box, type **MyPieChart**.  
  
7.  In the **Select connection type** box, select **XML**.  
  
8.  select the **Credentials** tab, select **Use current Windows user. Kerberos delegation might be required**, and then select **OK**.  
  
9. In the **Choose a connection to a data source** page, select **MyPieChart**, and then select **Next**.  
  
10. Copy the following text and paste it in the large box in the top of the **Design a query** page.  
  
    ```  
    <Query>  
    <ElementPath>Root /S  {@Sales (Integer)} /C {@FullName} </ElementPath>  
    <XmlData>  
    <Root>  
    <S Sales="150">  
      <C FullName="Jae Pak" />  
    </S>  
    <S Sales="350">  
      <C FullName="Jillian  Carson" />  
    </S>  
    <S Sales="250">  
      <C FullName="Linda C Mitchell" />  
    </S>  
    <S Sales="500">  
      <C FullName="Michael Blythe" />  
    </S>  
    <S Sales="450">  
      <C FullName="Ranjit Varkey" />  
    </S>  
    </Root>  
    </XmlData>  
    </Query>  
    ```  
  
11. Select the **Run** button (**!**) to see the data your chart will be based on.  
  
     "Report Builder Design Query"
  
12. Select **Next**.  
  
13. In the **Choose a chart type** page, select **Pie**, and then select **Next**.  
  
14. In the **Arrange chart fields** page, double-click the **Sales** field in the **Available fields** box.  
  
    It automatically moves to the **Values** box, because it is a numerical value.  
  
    "Report Builder Wizard Arrange Fields"  
  
15. Drag the **FullName** field from the **Available fields** box to the **Categories** box (or double-click it; it will go to the **Categories** box), and then select **Next**.  
  
     The Preview page shows your new pie chart with representational data. The legend reads Full Name 1, Full Name 2, etc., rather than the salespeople's names, and the size of the slices of pie are just samples, to give you an idea of what your report will look like.  
  
     "Report Builder New Chart Preview" 
  
16. Select **Finish**.  
  
    Now you see your new pie chart report in Design View, still with representational data.  
  
    "Report Builder New Pie in Design View"  
  
17. To see your actual pie chart, select **Run** on the **Home** tab of the Ribbon.  
  
     "Report Builder New Chart Run"  
  
     Now that you've made your pie chart report, you can play with it. 

18. Save the report to your local computer.
  
## Make the chart bigger  
You may want the pie chart to be bigger. 

1. On the **Run** tab of the Ribbon, select **Design**, so you can continue modifying it.  
 
2. Select the chart, but not on any element in the chart, and drag the lower-right corner to resize it.  

Notice the design surface gets larger as you drag.
  
## Add a report title  

1. Select the words **Chart title** at the top of the page, then type **Sales Pie Chart**.  
2. With the title selected, in the Properties pane, change **Color** to **Blue**.
  
## Add percentages  
 
1.  Right-click the pie chart and select **Show Data Labels**. The data labels appear within each slice on the pie chart.  
  
2.  Right-click the labels and select **Series Label Properties**. The **Series Label Properties** dialog box appears.  
  
3.  In the **Label data** box, type **#PERCENT{P0}**.  
  
     The **{P0}** gives you the percentage without decimal places. If you type just **#PERCENT**, your numbers will have two decimal places. **#PERCENT** is a keyword that performs a calculation or function for you; there are many others.  
     
4. Select **Yes** to confirm you want to set **UseValueAsLabel** to **False**.

5. On the **Font** tab, select **Bold** and change **Color** to **White**.

6. Select **OK**.     
  
##  Upload the report to the Power BI service

Now that you've created this paginated report, it's time to upload it to the service.

1. In the Power BI service (http://app.powerbi.com), go to the workspace. It needs to have a diamond icon next to the name to show that it's in a Premium capacity.
    
    ![Diamond Premium icon](media/paginated-reports-quickstart-chart/power-bi-paginated-my-workspace-premium.png)

    If the workspace isn't in a Premium capacity, when you try to upload your report you see the message, "Unable to upload paginated report." Contact your Power BI administrator to move the workspace.

1. Select **Get Data**.
2. In the **Files** box > **Get**.
3. Select **Local File**, navigate to where you saved the file > **Open**.
   Power BI imports your file.



## Next steps


  

