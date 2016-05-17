<properties
   pageTitle="Admin portal"
   description="The admin portal allows for tenant management of Power BI in your organization. It includes items such as usage metrics, access to the Office 365 admin center, and settings."
   services="powerbi"
   documentationCenter=""
   authors="guyinacube"
   manager="mblythe"
   backup=""
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
   ms.date="05/17/2016"
   ms.author="amac"/>
# Power BI admin portal

Tenant management of Power BI for your company is done through the Power BI admin portal. The admin portal is accessible to all users who are Global Admins in Office 365. 

## How to get to the admin portal

If you are a Global Admin, you will see the option, for the admin portal, under the Settings gear on the top right of the Power BI service.

![](media/powerbi-admin-portal/powerbi-admin-settings.png)

Within the portal, there are 3 tabs. These are described below.
-	[Usage metrics](#usage-metrics)
-	[Manage Users](#manage-users)
-	[Tenant settings](#tenant-settings)

![](media/powerbi-admin-portal/powerbi-admin-landing-page.png)

## Usage metrics

The first tab, in the admin portal, is **Usage metrics**. The usage metrics report gives you the ability to monitor usage within Power BI for your organization. It also provides the ability to see which users, and groups, are the most active within Power BI for your organization.

> **Note**: The first time you access the dashboard, or after you visit again after a long period of not viewing the dashboard, you'll likely see a loading screen while we load the dashboard.

Once the dashboard loads, you will see two sections of tiles. The first section includes usage data for individual users and the second section has similar information for groups in your organization.

Here’s a breakdown of what you will see in each tile:

- Distinct count of all dashboards, reports, and datasets in the user workspace

    ![](media/powerbi-admin-portal/powerbi-admin-usage-metrics-number-tiles.png)

- Most consumed dashboard by number of users who can access it. For example, if you have a dashboard that you shared with 3 users, and you also added it to a content pack two different users connected to, its count would be 6 (1 + 3 + 2)

    ![](media/powerbi-admin-portal/powerbi-admin-usage-metrics-top-dashboards.png)

- The most popular content users connected to. This would be anything the users could reach through the Get Data process, so SaaS content packs, Organizational content packs, files or databases.

    ![](media/powerbi-admin-portal/powerbi-admin-usage-metrics-top-connections.png)

- A view of your top users based on how many dashboards they have, both dashboards they created themselves and dashboards shared to them.

    ![](media/powerbi-admin-portal/powerbi-admin-usage-metrics-top-users-dashboards.png)

- A view of your top users based on how many reports they have

    ![](media/powerbi-admin-portal/powerbi-admin-usage-metrics-top-users-reports.png)

The second section shows the same type of information, but based on groups. This will let you see which groups in your organization are most active and what kind of information they are using.

With this information, you will be able to get real insights into how people are using Power BI across your organization, and be able to recognize those users, and groups, who are very active in your organization.

## Manage users

The second tab, in the admin portal, is **Manage Users**. User management, for Power BI, is done in the Office 365 admin center, so this section allows you to quickly reach the area to manage users, admins, and groups within Office 365.

![](media/powerbi-admin-portal/powerbi-admin-manage-users.png)

When you click **Go to O365 Admin Center**, you go directly to the Office 365 admin center landing page, to manage the users of your tenant.

![](media/powerbi-admin-portal/powerbi-admin-o365-admin-center.png)

## Tenant settings

The third tab, in the admin portal, is **Tenant settings**. Tenant settings give you more control over what features are made available to your organization. If you have concerns around sensitive data, some of our features may not be right for your organization. If this is the case, you can switch it off in your tenant.

> **Important**: These are global settings. Turning them off will affect all users, using Power BI, in your organization!

![](media/powerbi-admin-portal/powerbi-admin-tenant-settings.png)

When you turning settings on and off, you will see a notification letting you know it was successful. It can take up to 10 minutes for the setting to take effect for everyone in your tenant.

![](media/powerbi-admin-portal/powerbi-admin-tenant-settings-notification.png)

### Publish content packs to the entire organization

This setting controls whether users of your tenant can publish content packs to the entire organization.

![](media/powerbi-admin-portal/powerbi-admin-publish-entire-org.png)

### Allow sharing content to external users

This setting determines whether you can share a dashboard with users outside of your oganization.

![](media/powerbi-admin-portal/powerbi-admin-sharing-external.png)

### Publish to web

This setting determines whether you can use the **Publish to web** feature for reports. [Learn more](powerbi-service-publish-to-web.md)

![](media/powerbi-admin-portal/powerbi-admin-publish-to-web.png)

### Export data

This setting determines whether you can export data from a tile or visualization. [Learn more](powerbi-service-export-data.md)

![](media/powerbi-admin-portal/powerbi-admin-export-data.png)

## See also

[Administering Power BI in your Organization](powerbi-admin-administering-power-bi-in-your-organization.md)