---
title: Power BI Archived Workspace
description: Power BI Archived Workspace after managing your Office 365 tenant
author: mgblythe
manager: kfile
ms.reviewer: ''

ms.service: powerbi
ms.subservice: powerbi-admin
ms.topic: conceptual
ms.date: 11/02/2018
ms.author: mblythe

LocalizationGroup: Administration
---

# Power BI Archived Workspace

With Power BI, anyone can sign up and start using the service in a few minutes.  Later, your organization's IT department might choose to take over managing Power BI for users in your organization.  If this takeover occurs, you benefit from central management of users and permissions in your organization. You might also be able to take advantage of streamlined sign-in using the same username and password you use for other services in your organization.

Any content you created before your IT department started managing Power BI is be placed in a Power BI Archived Workspace, which is accessible from the left navigation of [Power BI](https://app.powerbi.com). You should start creating new Power BI content in My Workspace, which is secured and managed by your organization's IT department.  Your Archived Workspace will continue to exist, but there are restrictions on actions you can perform on content in your Archived Workspace.  To remove these restrictions, you must migrate the content from your Archived Workspace to My Workspace, managed by your IT department.

## Restrictions in your Archived Workspace

Power BI won't delete content from your Archived Workspace. You can continue to get data, create reports and dashboards, and refresh datasets. Existing users you have shared content with can still view the content in their Archived Workspace too. However, there are some restrictions on content in your Archived Workspace:

* **OneDrive for Business**: For datasets in your Archived Workspace, you can no longer get or refresh data from OneDrive for Business.  If you try to connect to this source, you receive a warning.

* **Sharing dashboards**: You can't share dashboards with other users from your Archived Workspace.  Any users that already have access can continue to view shared dashboards by accessing their Archived Workspace.

* **Creating groups**: You can't create groups in your Archived Workspace.

* **Access on Power BI mobile apps**: While you can still view content on the web in your Archived Workspace, this content no longer appears in the Power BI mobile apps.

## Migrating Content in your Archived Workspace

To continue using Power BI, you should create new content in My Workspace. You should also plan to migrate any content in your Archived Workspace to My Workspace.  How you migrate content depends on the kind of content:

* **Excel or Power BI Desktop datasets**: Migrate these datasets by switching from your Archived Workspace to My Workspace and re-uploading the Excel or Power BI Desktop file by selecting the **My Data** button.  If you set up scheduled refresh, you must reconfigure those settings for the new dataset in My Workspace.

* **Other Datasets**: Switch to My Workspace and then select the **Get Data** button to reconnect to any other datasets you created in your Archived Workspace.  You may need to re-enter security or connection information.

* **Reports**: Reports contained in Excel or Power BI Desktop files are automatically recreated once you re-upload the corresponding Excel or Power BI Desktop file. Reports installed as part of a content pack are also recreated when you reconnect to the content pack. If you created your own reports through the Power BI service, recreate those reports in My Workspace.

* **Dashboards**: Dashboards installed as part of content packs are automatically recreated when you reconnect to the content pack in My Workspace. If you created your own dashboards through the Power BI service, recreate those dashboards in My Workspace.

More questions? [Try asking the Power BI Community](http://community.powerbi.com/)

