---
title: Work with third-party apps in Power BI
description: Learn how to integrate a third-party app with Power BI and then revoke permissions to an application at any time.
author: maggiesMSFT
ms.author: maggies
ms.service: powerbi
ms.subservice: pbi-collaborate-share
ms.topic: how-to
ms.reviewer: ""
ms.cunstom: ""
ms.date: 12/16/2022
LocalizationGroup: Get started
ms.custom: intro-get-started
---

# Work with third-party apps in Power BI

With Power BI, you can use an app built by a company or individual other than Microsoft. For example, you might use a third-party app that integrates Power BI tiles into a custom-built web application. When you use a third-party app, you need to grant that application certain permissions to your Power BI account and resources. It's important that you only grant permissions to applications that you know and trust. Permissions to an application can be revoked at any time. For more information, see [Revoke third party app permissions](#revoke-third-party-app-permissions).

The following section describes the access types an application can request.

## Power BI App permissions

### View all Dashboards
  
This permission allows an application to view all dashboards you have access to. This access includes dashboards that you own, have gotten from apps, have been shared with you, and are in groups that you belong to. The application can't make any modifications to the dashboard. This permission can be used by an application to embed your dashboard content into its experiences.

### View all Reports
  
This permission allows an application to view all reports you have access to. This access includes reports that you own, have gotten from apps, and are in groups that you belong to. Part of viewing the report, means that the application can also see the data within it. The application can't make any modifications to the reports themselves. Among other things, this permission can be used by an application to embed your report content into its experiences.

### View all Datasets
  
This permission allows an application to list all datasets that you have access to. This access includes datasets that you own, have gotten from apps, and are in groups that you belong to. An application can see the names of all your datasets and their structure including table and column names. This permission gives rights to read the data in a dataset. The permission doesn't give the application rights to add or make changes to a dataset.

### Read and Write all Datasets
  
This permission allows an application to list all datasets that you have access to. This access includes datasets that you own, have gotten from apps, and are in groups that you belong to. An application can see the names of all your datasets and their structure including table and column names. This permission gives rights to read and write the data in a dataset. The application can also create new datasets, or make modifications to existing ones. This permission is commonly used by an application to send to data directly to Power BI.

### View user's Groups
  
This permission allows an application to list all groups that you're a member of. It can use this permission along with some of the other permissions listed to view or update content for that particular group. The application can't make modifications to the group itself.

## Revoke third-party app permissions

You revoke permissions for a third-party app by going to the Office 365 My Apps site.

On the **Office 365 My apps** site, here's how to revoke third-party permissions:

1. Go to [Office 365 My Apps site](https://portal.office.com/myapps).

2. On the **My apps** page, locate the third-party app.

3. Hover over the app tile, select the **(...)** button, and choose **Remove**.

   ![Screenshot that shows the Remove option to revoke third-party permissions.](media/service-power-bi-get-started-third-party-apps/remove.png)
