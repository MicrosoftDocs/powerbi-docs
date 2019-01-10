---
title: Migrate a content pack to a template app in Power BI
description: How to migrate existing content packs in Power BI to template apps that you can distribute to any Power BI customer.
author: maggiesMSFT
manager: kfile
ms.reviewer: ''
ms.service: powerbi
ms.component: powerbi-service
ms.topic: conceptual
ms.date: 01/08/2019
ms.author: maggies
---

# Migrate a content pack to a template app

Power BI template apps are a new capability that enables Power BI partners to build Power BI apps with little or no coding, and deploy them to any Power BI customer. Prior to template packs, you may have created Power BI service content packs from services like Salesforce or Microsoft Dynamics. This article explains how to migrate from an existing content pack to a a Power BI template app. 

If you can create Power BI reports and dashboards, you can become a *template app builder* who builds and packages analytical content into an *app*. You can then deploy your app to other Power BI tenants through any available platform, such as AppSource, or by using it in your own web service. As a builder you can create a protected analytics package for distribution. 

Power BI tenant admins govern and control who in their organization is authorized to install a template app. Those who are authorized can install your template app, then modify it and distribute it to the Power BI consumers in their organization.

## Prerequisites 

The requirements for migrating a content pack to a template app are few:  

- A [Power BI pro license](service-self-service-signup-for-power-bi.md)
- Familiarity with the [basic concepts of Power BI ](service-basic-concepts.md)

## Resources 

In this tutorial, you create a Jira content pack with sample credentials. Then you migrate it to a template app. We provide a sample app installalation with two sample accounts for Atlassian Jira.  

Source files for Jira content pack  
https://powerbi-df.analysis-df.windows.net/Redirect?action=InstallApp&appId=dcfea0ea-6ceb-404c-b9d0-df904fff18e0&packageKey=bb61bf48-e9d8-4f9a-922c-00570fab44a4amuBoWXK11GJKFuj2TpL3BU6zWTyamFCbL4mvhsEDIg&ownerId=f686d426-8d16-42db-81b7-ab578e110ccd 

Atlassian Jira: 
https://www.atlassian.com/software/jira 

Jira sample Account1:  

https://bepowerbi1.atlassian.net 
User name: boefraty@microsoft.com 
Password: mli4daLo 
 

## Download the template file

Step 1 

1. Download the .pbit file to your computer from: 
    https://pbix.visualstudio.com/DataConnectors/_versionControl?path=%24%2FDataConnectors%2FOther%2FJIRA#path=%24%2FDataConnectors%2FOther%2FJIRA%2FJira_PowerBI_ContentPack.pbit&version=T 

2. Open the .pbit file in Power BI Desktop.  
3. In the **URL** box, paste this URL:
    https://bepowerbi1.atlassian.net 
4. Select the arrow on the **Load** button and select **Edit**.
    The query opens in the Query Editor window.
5. Select **Edit Credentials** and provide these sample account credentials:
    User name: boefraty@microsoft.com 
    Password: mli4daLo 
6. Select **Connect**.
7. Save file as .pbix, and make sure your data is refreshable.  
8. On the **Home** > **Edit Queries** > **Edit Parameters**  
9. Edit all the parameters to make sure they have a specific type, for example, "Text". Make sure none has type "Any", which is the default in .pbit files. 


## Create the app workspace
Open Power BI service in browser and create new app workspace:    

Workspaces > Create app workspace (Specify name, description and logo image) 

 

Upload new report (including dataset) from PBIX defined in previous step 

Make sure dataset is refreshable in service  

 

 

Step 3 

Create dashboard by pinning tiles in your report and design its overlay 

 

Step 4 

Now you ready to create service app  

Create Service app and specify all required metadata (Branding, Content and Permission settings). More details about App parametrization can be found in “How to build a Service App” documentation 

Go to “Release management” and “Create test app”  

 

Step 5 

Copy the link generated in previous step and paste it in the new tab 

Follow the installation process and click on  
 

In next window,  

 

Explore app: (the most limited option) you should be able to explore the app with sample data (reports, dashboards and datasets) 

Connect data: you will be guided through dialogs to redefine your data sources and credentials  

Go to workspace: (the most powerful option) redirects to associated workspace, where you should be able to make changes allowed by app creator (in step 4).  You can also redefine data source in this step.    

Use “Update app” to trigger the changes in associated app. 

   

 
 

Step 6  

Follow the release management flow to promote your app to Pre-production or / and Production stages.  
The main purpose of different stages is:  
 

Test app: internal testing (inside of your organization / tenant)  

Pre-prod app: testing with partners external for your organization 

Prod app: production version, which can be shared via AppSource or buisness-to-buisness.  
 

 

References  

 

Known limitations of Service Apps (preview) 

Step-by-step documentation “How to build a Service App” 

Step-by-step documentation “How to install, customize it and distribute service app in you organization” 

If you are interested to make you app widely available for thousands of Power BI users. See, “Submission of Service App to AppSource Manual”  

Power BI documentation 
## Next steps

Known limitations of template apps (preview)

[Install, customize, and distribute template apps in your organization](service-template-apps-install-distribute.md)






