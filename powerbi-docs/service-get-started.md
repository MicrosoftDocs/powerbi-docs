---
title: Get started with the Power BI service
description: Get started with the Power BI online service (app.powerbi.com)
author: maggiesMSFT
manager: kfile
ms.reviewer: ''
featuredvideoid: B2vd4MQrz4M

ms.service: powerbi
ms.subservice: powerbi-service
ms.topic: conceptual
ms.date: 08/06/2019
ms.author: maggies
# Customer intent: As a Power BI customer or potential customer, I want to try it out for free and see how quick and intuitive it is so that I'll want to use it again and often, talk about it to colleagues and influence purchase and trial by others.  

LocalizationGroup: Get started

---
# Tutorial: Get started with the Power BI service (app.powerbi.com)
This tutorial helps you get started with the *Power BI service*. For an understanding of how the Power BI service fits in with the other Power BI offerings, we recommend that you start by reading [What is Power BI](power-bi-overview.md).

![Relationship between Power BI Desktop, service, mobile](media/service-get-started/power-bi-components.png)

In this tutorial, you complete the following steps:

> [!div class="checklist"]
> * Find getting started content for the Power BI service.
> * Sign in to your Power BI online account, or sign up, if you don't have one yet.
> * Open the Power BI service.
> * Get some data and open it in report view.
> * Use that data to create visualizations and save it as a report.
> * Create a dashboard by pinning tiles from the report.
> * Add another visualization to your dashboard by using the Q&A natural language tool.
> * Clean up resources by deleting the dataset, report, and dashboard.

## Sign up for the Power BI service
If you're not signed up for Power BI, [sign up for a free Power BI Pro trial](https://app.powerbi.com/signupredirect?pbi_source=web) before you begin.

If you already have an account, open a browser and type app.powerbi.com to open the Power BI service. 

![Sign in or sign up for free](media/service-get-started/power-bi-sign-up.png)

If you're looking for help with Power BI Desktop, see [Get started with Power BI Desktop](desktop-getting-started.md). If you're looking for help with Power BI mobile, see [Power BI apps for mobile devices](consumer/mobile/mobile-apps-for-mobile-devices.md).

> [!TIP]
> Prefer a free self-paced training course instead? [Enroll in our Analyzing and Visualizing Data course on EdX](http://aka.ms/edxpbi).

Visit our [playlist on YouTube](https://www.youtube.com/playlist?list=PL1N57mwBHtN0JFoKSR0n-tBkUJHeMP2cP). A good video to start with is Introduction to the Power BI service:
> 
> <iframe width="560" height="315" src="https://www.youtube.com/embed/B2vd4MQrz4M" frameborder="0" allowfullscreen></iframe>
> 

## What is the Power BI service?
The Microsoft Power BI service is sometimes referred to as Power BI online or app.powerbi.com. Power BI helps you stay up-to-date with the information that matters to you.  With the Power BI service, *dashboards* help you keep a finger on the pulse of your business. Your dashboards display *tiles*, which you can select to open *reports* for exploring further. Connect to multiple *datasets* to bring all of the relevant data together in one place. Need help with understanding the building blocks that make up Power BI? See [Basic concepts for designers in the Power BI service](service-basic-concepts.md).

If you have important data in Excel or CSV files, you can create a Power BI dashboard to stay informed anywhere and share insights with others.  Do you have a subscription to a SaaS application like Salesforce?  Get a head start by connecting to Salesforce to automatically create a dashboard from that data, or [check out all the other SaaS apps](service-get-data.md) you can connect to. If you're part of an organization, see if any [apps](service-create-distribute-apps.md) have been published for you.

Read about all the other ways to [get data for Power BI](service-get-data.md).

## Step 1: Get data
Here's an example of getting data from a CSV file. Want to follow along with this tutorial? [Download the Financial Sample CSV file](http://go.microsoft.com/fwlink/?LinkID=521962).

1. [Sign in to Power BI](http://www.powerbi.com/). Don’t have an account? No worries, you can sign up for a free trial.
2. Power BI opens in your browser. Select **Get data** at the bottom of the left navigation bar.
   
3. Select **Files**. 
   
   ![Get files](media/service-get-started/gs1.png)
4. Browse to the file on your computer, and choose **Open**. If you saved it in  OneDrive for Business, select that option. If you saved it locally, select **Local file**. 
   
   ![Get Data > Files screen](media/service-get-started/gs2.png)
5. For this tutorial, we'll select **Import** to add the Excel file as a dataset, which we can then use to create reports and dashboards. If you select **Upload**, the entire Excel workbook is uploaded to Power BI, where you can open and edit it in Excel online.
   
   ![Choose Import](media/service-get-started/power-bi-import.png)
6. When your dataset is ready, select **View dataset** to open it in the report editor. 

    ![Your dataset is ready dialog](media/service-get-started/power-bi-gs.png)

    Because we haven't yet created any visualizations, the report canvas is blank.

    ![Blank report canvas](media/service-get-started/power-bi-report-editor.png)

7. Notice there's an option for **Reading view** on the top navigation bar. Because you have this option, that means you're currently in Editing view. 

    ![Reading view option](media/service-get-started/power-bi-editing-view.png)

    While in Editing view, you can create and modify your reports, because you're the *owner* of the report; you're a *creator*. When you share your report with colleagues, they can only interact with the report in Reading view; they're *consumers*. Learn more about [Reading view and Editing view](consumer/end-user-reading-view.md).
    
    A great way to get familiar with the report editor is to [take a tour](service-the-report-editor-take-a-tour.md).
 

## Step 2: Start exploring your dataset
Now that you've connected to data, start exploring.  When you've found something interesting, you can create a dashboard to monitor it and see how it changes over time. Let's see how that works.
    
1. In the report editor, we'll use the **Fields** pane on the right side of the page to build a visualization.  Select the checkbox beside **Gross Sales** and  **Date**.
   
   ![Fields list](media/service-get-started/fields.png)

    Power BI analyzes the data and creates a visualization. If you selected **Date** first, you'll see a table. If you selected **Gross Sales** first, you'll see a chart. 

2. Switch to a different way of displaying your data. Let's see this data as a line chart. Select the line chart icon (also known as a template) from the **Visualizations pane**.
   
   ![Report editor with line chart selected](media/service-get-started/gettingstart5new.png)

3. This chart looks interesting, so let's *pin* it to a dashboard. Hover over the visualization and select the **Pin** icon. When you pin this visualization, it's stored on your dashboard and kept up-to-date so you can track the latest value at a glance.
   
   ![Pin icon](media/service-get-started/pinnew.png)

4. Because this report is new, you'll be prompted to save it before you can pin a visualization to a dashboard. Give your report a name (for example, *Sales over time*), and then select **Save and continue**. 
   
   ![Save report dialog](media/service-get-started/pbi_getstartsaveb4pinnew.png)
   
5. Pin the line chart to a new dashboard and name it *Financial sample for tutorial*. 
   
   ![Name the report](media/service-get-started/power-bi-pin.png)
   
6. Select **Pin**.
   
    A success message (near the top-right corner) lets you know the visualization was added as a tile to your dashboard.
   
    ![Pinned to dashboard dialog](media/service-get-started/power-bi-pin-success.png)

7. Select **Go to dashboard** to see the line chart that you pinned as a tile to your new dashboard. Make your dashboard even better by adding more visualization tiles and [renaming, resizing, linking, and repositioning tiles](service-dashboard-edit-tile.md).
   
   ![Dashboard with visualization pinned](media/service-get-started/power-bi-new-dashboard.png)
   
8. Select the new tile on your dashboard to return to the report. Power BI returns you to the report editor in Reading view. To switch back to Editing view, select **Edit report** from the top menubar. After you're in Editing view, you can continue to explore and pin tiles. 

## Step 3:  Continue the exploration with Q&A (natural language querying)
1. For a quick exploration of your data, ask a question in the Q&A box. The Q&A question box is located at the top of your dashboard (**Ask a question about your data**) and in the top navigation bar in your report (**Ask a question**). For example, type *what segment had the most revenue* in the Q&A box.
   
   ![Q&A canvas](media/service-get-started/powerbi-qna.png)

2. Q&A searches for an answer and presents it in the form of a visualization. Select the pin icon ![Pin icon](media/service-get-started/pbi_pinicon.png) to show this visualization on your dashboard.
3. Pin the visualization to the **Financial Sample for tutorial** dashboard.
   
    ![Pin to dashboard dialog](media/service-get-started/power-bi-pin2.png)

4. Return to your dashboard, where you'll see the new tile.

   ![Dashboard with chart pinned](media/service-get-started/power-bi-final-dashboard.png)

## Clean up resources
Now that you've finished the tutorial, you can delete the dataset, report, and dashboard. 

1. In the left navigation bar, select **My Workspace**.
2. Select the **Datasets** tab and locate the dataset you imported for this tutorial.  
3. Select the ellipsis (...) > **Delete**.

    ![Delete the dataset](media/service-get-started/power-bi-delete.jpg)

    When you delete the dataset, Power BI also deletes the report and the dashboard. 


## Next steps

> [!div class="nextstepaction"]
> [Connect to the online services you use](service-connect-to-services.md)

