<properties
   pageTitle="Create Out-of-the-Box Dashboards with Cloud Services"
   description="Easily create Dashboards with your favorite cloud services"
   services="powerbi"
   documentationCenter=""
   authors="davidiseminger"
   manager="mblythe"
   editor=""
   tags=""
   featuredVideoId="2kAkUjQQD08"/>

<tags
   ms.service="powerbi"
   ms.devlang="NA"
   ms.topic="article"
   ms.tgt_pltfrm="NA"
   ms.workload="powerbi"
   ms.date="02/17/2016"
   ms.author="v-jescoo"/>

# Create Out-of-the-Box Dashboards with Cloud Services

With Power BI, connecting to data is easy. From the Power BI service, you can simply select the Get Data button in the bottom left corner of the home screen.

![](media/powerbi-learning-course0-article3/c0a3_1.png)

The *canvas* (the area in the center of the Power BI service) shows you the available sources of data in the Power BI service. In addition to common data sources such as Excel files, databases, or Azure data, Power BI can connect to **software services** (also called SaaS providers) such as Salesforce, Facebook, Google Analytics, and a whole assortment of other SaaS services just as easily.

![](media/powerbi-learning-course0-article3/c0a3_2.png)

For these software services, the **Power BI service** provides a collection of ready-made visuals, pre-arranged in dashboards and reports, called **Content Packs**. Content packs get you up and running in Power BI quickly with data from the service that you select. For example, when you use the Salesforce content pack, Power BI connects to your Salesforce account (once you provide your credentials) and then populates a pre-defined collection of visuals and dashboards in Power BI.

Power BI provides content packs for all sorts of services. The following image shows the first screen of services, in alphabetical order, that is displayed when you select **Get** from the **Services** box (shown in the previous image). As you can see from the image below, there are many to choose from.

![](media/powerbi-learning-course0-article3/c0a3_3.png)

For our purposes, we’ll choose **GitHub**. GitHub is an application for online source control. Once I enter the information and credentials for the GitHub content pack, it begins importing my data.

![](media/powerbi-learning-course0-article3/c0a3_4.png)

Once the data is loaded, the pre-defined GitHub content pack dashboard appears.

![](media/powerbi-learning-course0-article3/c0a3_5.png)

In addition to the **Dashboard**, the **Report** that was generated (as part of the GitHub content pack) to create the dashboard is available too, as is the **Dataset** (the collection of data pulled from GitHub) that was created during the data import, and used to create the GitHub Report.

![](media/powerbi-learning-course0-article3/c0a3_6.png)

On the Dashboard, you can click on any of the visuals, and automatically be taken to the **Report** page from which that visual was created. So when the **Top 5 users by pull requests** visual is clicked, Power BI opens the **Pull Requests** page in the Report (the Report page from which that visual was created).

## Asking Questions of your data
You can also ask questions of your data, and the Power BI service will create visuals based on your question, in real time. In the following image, you can see Power BI creates a number visual showing the Count of Issues closed, based on what is typed in the **Natural Language Query** bar.

![](media/powerbi-learning-course0-article3/c0a3_7.png)

When you have a visual that you like, you can select the **Pin** icon, to the right of the Natural Language Query bar, to pin that visual to the dashboard. In this case, the visual is pinned to the GitHub dashboard, since that’s the dashboard currently selected.

![](media/powerbi-learning-course0-article3/c0a3_8.png)

## Refreshing data in the Power BI service

You can also choose to **refresh** the dataset for a content pack, or other data you use in Power BI. To set refresh settings, select the ellipses (the three dots) next to a data set, and a menu appears.

![](media/powerbi-learning-course0-article3/c0a3_9.png)

Select the **Schedule Refresh** option from the bottom of that menu. The Settings dialog appears on the canvas, letting you set the refresh settings that meet your needs.

![](media/powerbi-learning-course0-article3/c0a3_10.png)

That’s it for now. Remember that there are many different types of data you can connect to, and all sorts of content packs, with more of each coming all the time.
