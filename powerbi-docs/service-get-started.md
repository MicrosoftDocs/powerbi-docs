---
title: Get started with Power BI service
description: Get started with Power BI service
author: adamw
manager: kfile
ms.reviewer: ''
featuredvideoid: B2vd4MQrz4M

ms.service: powerbi
ms.component: powerbi-service
ms.topic: conceptual
ms.date: 03/01/2018
ms.author: mihart

LocalizationGroup: Get started
---
# Get started with Power BI service (app.powerbi.com)
This tutorial helps you get started with ***Power BI service***. For an understanding of how Power BI service fits in with the other Power BI offerings, we highly recommend that you start by reading [What is Power BI](guided-learning/gettingstarted.yml#step-1).

![art showing relatioship between Desktop, service, mobile](media/service-get-started/power-bi-components.png)

Power BI service has a free version and a Pro version. No matter which version you're using, *if you already have an account*, open a browser and type app.powerbi.com to open Power BI service. If you're a new user, we recommend starting at www.powerbi.com instead. From here you can learn more about Power BI before logging in to the service.  When you're ready to try it out, select the **Sign up free** link that you'll see in the upper right corner. If your administrator has already enabled Power BI for you, don't use the Sign up free button, but instead go directly to app.powerbi.com. 

![Sign in or Sign up free](media/service-get-started/power-bi-sign-up.png)

If you're looking for help with Power BI Desktop, see [Get started with Desktop](desktop-getting-started.md). If you're looking for help with Power BI mobile, see [Power BI apps for mobile devices](mobile-apps-for-mobile-devices.md).

> [!TIP]
> Prefer a free self-paced training course instead? [Enroll in our Analyzing and Visualizing Data course on EdX](http://aka.ms/edxpbi).

Visit our [playlist on YouTube](https://www.youtube.com/playlist?list=PL1N57mwBHtN0JFoKSR0n-tBkUJHeMP2cP). A good video to start with is Introduction to Power BI service:
> 
> <iframe width="560" height="315" src="https://www.youtube.com/embed/B2vd4MQrz4M" frameborder="0" allowfullscreen></iframe>
> 
> 
> 

Microsoft Power BI helps you stay up to date with the information that matters to you.  With Power BI service, ***dashboards*** help you keep a finger on the pulse of your business.  Your dashboards display ***tiles*** that you can click to open ***reports*** for exploring further.  Connect to multiple ***datasets*** to bring all of the relevant data together in one place. Need help understanding the building blocks that make up Power BI?  See [Power BI - Basic Concepts](service-basic-concepts.md).

If you have important data in Excel or CSV files, you can create a Power BI dashboard to stay informed anywhere and share insights with others.  Do you have a subscription to a SaaS application like Salesforce?  Get a head start by connecting to Salesforce to automatically create a dashboard from that data, or [check out all the other SaaS apps](service-get-data.md) you can connect to. If you are part of an organization, see if any [apps](service-create-distribute-apps.md) have been published for you.

Read about all the other ways to [get data for Power BI](service-get-data.md).

## Step 1: Get data
Here's an example of getting data from a CSV file. Want to follow along with this tutorial? [Download this sample CSV file](http://go.microsoft.com/fwlink/?LinkID=521962).

1. [Sign in to Power BI](http://www.powerbi.com/). Don’t have an account? No worries, you can sign up for free.
2. Power BI opens in your browser. Select **Get Data** at the bottom of the left navigation bar.
   
   ![get data](media/service-get-started/getdata3.png)
3. Select **Files**. 
   
   ![get files](media/service-get-started/gs1.png)
4. Browse to the file on your computer, and choose **Open**. If you saved it in  OneDrive for Business, select that option. If you saved it locally, select **Local file**. 
   
   ![Get Data > Files screen](media/service-get-started/gs2.png)
5. For this tutorial we're going to select **Import** to add the Excel file as a dataset that we can then use to create reports and dashboards. If you select **Upload**, the entire Excel workbook is uploaded to Power BI where you can open and edit it in Excel online.
   
   ![choose Import](media/service-get-started/power-bi-import.png)
6. When your dataset is ready, select **View dataset** to open it in the report editor. 

    ![Your dataset is ready dialog](media/service-get-started/power-bi-gs.png)

    Since we haven't yet created any visualizations, the report canvas will be blank.

    ![blank report canvas](media/service-get-started/power-bi-report-editor.png)

6. Take a look at the top menubar and notice that there is an option for **Reading view**. Since you have an option for Reading view, that means you are currently in **Editing view**. 

    ![Reading view option](media/service-get-started/power-bi-editing-view.png)

    While in Editing view you can create and modify your reports because you are the *owner* of the report; you are a *creator*. When you share your report with colleagues, they'll only be able to interact with the report in Reading view; they are *consumers*. Learn more about [Reading view and Editing view](service-reading-view-and-editing-view.md).
    
    A great way to get familiar with the report editor is to [take a tour](service-the-report-editor-take-a-tour.md)
   > 
 

## Step 2: Start exploring your dataset
Now that you've connected to data, start exploring.  When you've found something interesting, you can create a dashboard to monitor it and see how it changes over time. Let's see how that works.
    
1. In the report editor, we'll use the **Fields** pane on the right side of the page to build a visualization.  Select the checkbox beside **Gross Sales** and  **Date**.
   
   ![Fields list](media/service-get-started/fields.png)

2. Power BI analyzes the data and creates a visualization.  If you selected **Date** first, you'll see a table.  If you selected **Gross Sales** first, you'll see a chart. Switch to a different way of displaying your data. Let's see this data as a line chart. Select the line chart icon (also known as a template) from the **Visualizations pane**.
   
   ![report editor with icon selected](media/service-get-started/gettingstart5new.png)

3. This looks interesting, so let's *pin* it to a dashboard. Hover over the visualization and select the **Pin** icon.  When you pin this visualization, it is stored on your dashboard and kept up-to-date so you can track the latest value at a glance.
   
   ![pin icon](media/service-get-started/pinnew.png)

5. Because this is a new report, you'll be prompted to save it before you can pin a visualization to a dashboard. Give your report a name (e.g., *Sales over time*) and select **Save and Continue**. 
   
   ![Save report dialog](media/service-get-started/pbi_getstartsaveb4pinnew.png)
   
6. Let's pin the line chart to new dashboard and name it "Financial sample for tutorial". 
   
   ![name the report](media/service-get-started/power-bi-pin.png)
   
 1. Select **Pin**.
   
    A Success message (near the top right corner) lets you know the visualization was added, as a tile, to your dashboard.
   
    ![Pinned to dashboard dialog](media/service-get-started/power-bi-pin-success.png)

8. Select **Go to dashboard** to see the line chart pinned, as a tile, to your brand new dashboard. Make your dashboard even better by adding more visualization tiles and [renaming, resizing, linking, and repositioning tiles](service-dashboard-edit-tile.md).
   
   ![dashboar with visualization pinned](media/service-get-started/power-bi-new-dashboard.png)
   
   Select the new tile on your dashboard to return to the report any time. Power BI returns you to the report editor in Reading view. To switch back to Editing view, select **Edit report** from the top menubar. Once in Editing view, continue exploring and pinning tiles. 

## Step 3:  Continue the exploration with Q&A (natural language querying)
1. For a quick exploration of your data, try asking a question in the Q&A box. The Q&A question box is located at the top of your dashboard (**Ask a question about your data**) and in the top menubar in your report (**Ask a question**). For example, try typing "what segment had the most revenue".
   
   ![Q&A canvas](media/service-get-started/powerbi-qna.png)

2. Q&A searches for an answer and presents it in the form of a visualization. Select the pin icon ![pin icon](media/service-get-started/pbi_pinicon.png) to show this visualization on your dashboard too.
3. Pin the visualization to the "Financial Sample for tutorial" dashboard.
   
    ![Pin to dashboard dialog](media/service-get-started/power-bi-pin2.png)

4. Return to your dashboard where you'll see the new tile.

   ![dashboard with chart pinned](media/service-get-started/power-bi-final-dashboard.png)

## Next steps
Ready to try more?  Here are some great ways to explore Power BI.

* [Connect to another dataset](service-get-data.md).
* [Share your dashboard](service-share-dashboards.md) with your colleagues.
* Read [tips for designing dashboards](service-dashboards-design-tips.md).
* View your dashboards with a [Power BI app on a mobile device](mobile-apps-for-mobile-devices.md)

Not quite ready to jump right in? Start with these topics designed to help you feel comfortable with Power BI.

* [Learn how reports, datasets, dashboards, and tiles all fit together](service-basic-concepts.md)
* Visit our [Power BI Guided Learning](guided-learning/index.md) site and take a few (very short) courses
* Watch some [Power BI videos](videos.md)
* [See what samples we have available for you to use](sample-datasets.md)

### Stay in touch with Power BI
* Follow [@MSPowerBI on Twitter](https://twitter.com/mspowerbi)
* Subscribe to our [YouTube video channel](https://www.youtube.com/channel/UCy--PYvwBwAeuYaR8JLmrfg)
* Watch our [Power BI Getting Started webinars](webinars.md) on demand
* Not sure where to go for help? See our [10 tips for getting help](service-tips-for-finding-help.md) page

More questions? [Try asking the Power BI Community](http://community.powerbi.com/)

