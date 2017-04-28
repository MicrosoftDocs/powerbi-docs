<properties 
   pageTitle="Create and distribute an app in Power BI"
   description="Apps are a collection of dashboards and reports purpose-built by your organization to deliver key metrics for faster data-driven decisions."
   services="powerbi" 
   documentationCenter="" 
   authors="maggiesMSFT" 
   manager="erikre" 
   editor=""
   tags=""
   qualityFocus="no"
   qualityDate=""/>
 
<tags
   ms.service="powerbi"
   ms.devlang="NA"
   ms.topic="article"
   ms.tgt_pltfrm="NA"
   ms.workload="powerbi"
   ms.date="04/27/2017"
   ms.author="maggies"/>

# Create and distribute an app in Power BI

## What are Power BI apps?
An app is a collection of dashboards and reports purpose-built by your organization to deliver key metrics for faster and easier data-driven decisions. 

Often, business users need multiple Power BI dashboards and reports to run their business. For example, a sales manager might need a dashboard to monitor the leads funnel, another dashboard to monitor the sales leaderboards, and yet another to monitor and analyze sales forecasts. They have to try to remember the names of all these dashboards and how to navigate to them.

For you as a report creator or admin, managing permissions on each individual dashboard is time-consuming and error prone. 

With Power BI apps, now in preview, you can deploy and manage collections of purpose-built dashboards and reports to a large number of business users. You can distribute these apps to the whole organization or to specific people or groups.  

Business users can install these apps from Microsoft AppSource, or you can send them a direct link. They can easily find and return to your content because it’s all in one place. They get all your updates automatically and you can control how frequently the data refreshes.  

You need a Power BI Pro license to distribute apps, and business users need Power BI Pro licenses to view them. However, we're going to be releasing the new Premium licensing. With a Premium license, if the app workspace resides in Power BI Premium capacity, then business users can access the content without a Power BI Pro license.  

Now that you’ve got an overview of apps, let’s talk about app workspaces, where you create apps. 

## App Workspaces 

App workspaces are the places where you create apps, so to create an app, you first need to create the *app workspace*. If you’ve ever worked in a group workspaces in Power BI, then app workspaces will seem familiar. They’re the evolution of group workspaces – staging areas and containers for the content in the app. 

You can add other collaborators to these workspaces as members or admins. You and your colleagues can collaborate on dashboards, reports, and other articles that you plan to distribute to a wider audience, or even your entire organization. 

When the content is ready, you distribute the app. You can send a direct link to  that wider audience, or they can find your app in AppSource by going to Get Data. Those people can’t modify the contents of the app, but they can interact with it either in the Power BI service, or one of the mobile apps -– filtering, highlighting, and sorting the data themselves. 

### How are app workspaces different from group workspaces? 

All existing group workspaces can serve as app workspaces, and you can publish apps from any of these workspaces. Over time, we will be decoupling workspaces from Office 365 groups and adding more functionality.  See the roadmap in the Power BI blog, and the FAQ section for plans on evolving this functionality in the future. 

Here’s one way app workspaces are different from the former groups: You create an app workspace as a place to create a specific app. There’s a one-to-one relationship between the app and the app workspace. Everything in the app workspace will be in the app when you distribute it. 

Now that you understand what apps and app workspaces are, let's start creating and publishing an app 

## Create an app in an app workspace

1. Start by creating the workspace. 

     ![](media/powerbi-service-create-apps/power-bi-apps-create-app-workspace.png)

    This will be the place to put content that other people can access and work on.

2. Give the workspace a name. If the workspace ID already exists, edit it to come up with a unique ID.
3. You have a few options to set. If you choose Public, anyone in your organization can see what’s in the workspace. Private, on the other hand, means only members of the workspace can see its contents.
4. You can also choose if members can edit or have view-only access.
5. Now add email addresses of people you want to have access to the workspace. You can’t add group aliases, just individuals.
6. Decide whether each person is a member or an admin, and save.

Power BI creates the workspace and opens it. It appears in the list of workspaces you’re a member of. Because you’re an admin, you can click the ellipsis (…) to go back and make changes to it, adding new members or changing their permissions.

It’s empty, so now you add content to it. Adding content is just like adding content to your My Workspace, except the other people in the workspace can see and work on it, too. Another difference is that when you get done, you can distribute the content as an app. While in the app workspace, you can upload or connect to files, or connect to third-party services, just as you would in your own My Workspace. For example:
•	[Connect to services](powerbi-content-packs-services.md) such as Microsoft Dynamics CRM, Salesforce, or Google Analytics.
•	[Get data from files](powerbi-service-get-data-from-files.md) such as Excel, CSV, or Power BI Desktop (PBIX) files.



## Next steps
- [Create and distribute apps in Power BI](powerbi-service-create-apps.md)
- Questions? [Try asking the Power BI Community](http://community.powerbi.com/)
