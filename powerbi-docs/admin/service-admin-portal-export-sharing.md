---
title: Export and sharing tenant settings
description: Learn how to configure export and sharing settings as the Power BI tenant admin. 
author: paulinbar
ms.author: painbar
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-admin
ms.custom: tenant-setting
ms.topic: how-to
ms.date: 05/05/2023
LocalizationGroup: Administration
---

# Export and sharing tenant settings

The export and sharing settings allow the Power BI tenant administrator the flexibility to determine and allow Power BI content to export to formats within their organization’s security and compliance guidelines. These settings also allow you to keep unauthorized export formats from being exported by users. 

Sharing settings are also managed through these settings. You can determine how and who can share Power BI content in your organization, as well as determine settings for sharing content with users outside your organization. These settings are configured in the tenant settings section of the Admin portal. For information about how to get to and use tenant settings, see [About tenant settings](service-admin-portal-about-tenant-settings.md).

## Allow Azure Active Directory guest users to access Power BI

When you turn on this setting, it allows Azure Active Directory Business-to-Business (Azure AD B2B) guest users to access Power BI. If you turn off this setting, guest users receive an error when trying to access Power BI. Disabling this setting for the entire organization also prevents users from inviting guests to your organization. Use the specific security groups option to control which guest users can access Power BI.

To turn on the setting:

1. Go to the Power BI Admin portal and select **Tenant settings**.
1. In the tenant settings, scroll down to the **Export and sharing settings** section.
1. Find the setting called **Allow Azure Active Directory guest users to access Power BI**. 
1. Turn this setting on if you want guest users to have access to Power BI. Turn this setting off to block guest users' access to Power BI and from inviting guests. 
1. Under **Apply to**, select the scope of users that the setting will affect:
    1. Choose **The entire organization** to apply the setting to the entire organization, or
    1. Choose **Specific security groups**, then enter the specific security groups you want to apply this setting.
    1. You can also choose one of the options mentioned previously and check the box next to **Except specific security groups**, then add the security groups you wish to exclude.
1. Select **Apply** to save your changes.


## Invite external users to your organization

The **Invite external users to your organization** setting helps organizations choose whether new external users can be invited to the organization through Power BI sharing, permissions, and subscription experiences. To invite external users to your organization, the user must also have the Azure Active Directory Guest Inviter role. This setting only controls the ability to invite through Power BI. 

> [!IMPORTANT]
> This setting was previously called “Share content with external users”.

To turn on the setting:

1. Still in the **Export and sharing settings** section of the **Tenant Settings**, find the setting called **Invite external users to your organization**.
1. Turn this setting on if you want to invite guest users to your organization with Power BI. If the setting is off, an external user who isn't already a guest user in the organization, can’t be added to the organization through Power BI.
1. Under **Apply to**, select the scope of users that the setting will affect:
    1. Choose **The entire organization** or **Specific security groups**. In addition, you can also choose one of the options check the box next to **Except specific security groups** and then add the security groups you wish to exclude.
1. Select **Apply** to save your changes.

## Allow Azure Active Directory guest users to edit and manage content in the organization

This setting allows Azure AD B2B guest users to edit and manage content in the organization. To learn more about sending Power BI content to Azure AD B2B guest users, read [Distribute Power BI content to external guest users with Azure AD B2B](../enterprise/service-admin-azure-ad-b2b.md).

To turn on the setting:

1. Still in the **Export and sharing settings** section of the **Tenant Settings**, find the setting called **Allow Azure Active Directory guest users to edit and manage content in the organization**.
1. Turn this setting on if you want to allow guests to manage and edit Power BI content. If the setting is off, an external user can’t manage and edit content in Power BI.
1. Under **Apply to**, select the scope of users that the setting will affect:
    1. Choose **The entire organization** or **Specific security groups**. In addition, you can also choose one of the options check the box next to **Except specific security groups** and then add the security groups you wish to exclude.
1. Select **Apply** to save your changes.

## Show Azure Active Directory guests in lists of suggested people

The **Show Azure Active Directory guests in lists of suggested people** setting helps organizations limit visibility of external users in sharing experiences. When disabled, Azure Active Directory (Azure AD) guest users are not shown in people picker suggested users lists. This helps prevent accidental sharing to external users and seeing which external users have been added to your organization through Power BI sharing UIs. 

> [!IMPORTANT]
> When the setting is set to disabled, you can still give permission to a guest user by providing their full email address in people pickers.
  
To turn this setting on or off:

1. Still in the **Export and sharing settings** section of the **Tenant Settings**, find the setting called **Show Azure Active Directory guests in lists of suggested people**.
1. Turn the switch on if you want to show guests a suggested list of users, or turn the switch off you don't want guests to see this list.
1. Under **Apply to**, select the scope of users that the setting will affect:
    1. Choose **The entire organization** or **Specific security groups**. In addition, you can also choose one of the options check the box next to **Except specific security groups** and then add the security groups you wish to exclude.
1. Select **Apply** to save your changes.

## Publish to web

As a Power BI admin, the **Publish to web** setting gives you options that let users create embed codes to publish reports to the web. This functionality makes the report and its data available to anyone on the web. Learn more about [publishing to the web](../collaborate-share/service-publish-to-web.md).

> [!NOTE]
> Only Power BI admins can allow creating new publish to web embed codes. Organizations may have existing embed codes. See the [Embed codes](service-admin-portal-embed-codes.md) section of the admin portal to review currently published reports.

The **Publish to web** setting in the admin portal gives options for which users can create embed codes.

Admins can set **Publish to web** to **Enabled** and **Choose how embed codes work** to **Allow only existing embed codes**. In that case, users can create embed codes, but they have to contact the Power BI admin to allow them to do so.

Users see different options in the UI based on what the **Publish to web** setting is.

|Feature |Enabled for entire organization |Disabled for entire organization |Specific security groups   |
|---------|---------|---------|---------|
|**Publish to web** under report **More options (...)** menu|Enabled for all|Not visible for all|Only visible for authorized users or groups.|
|**Manage embed codes** under **Settings**|Enabled for all|Enabled for all|Enabled for all<br><br>* **Delete** option only for authorized users or groups.<br>* **Get codes** enabled for all.|
|**Embed codes** within admin portal|Status has one of the following values:<br>* Active<br>* Not supported<br>* Blocked|Status displays **Disabled**|Status has one of the following values:<br>* Active<br>* Not supported<br>* Blocked<br><br>If a user isn't authorized based on the tenant setting, status displays **infringed**.|
|Existing published reports|All enabled|All disabled|Reports continue to render for all.|

## Copy and paste visuals

Turn on this setting to allow users in the organization to copy visuals from a tile or report visual and paste them as static images into external applications.

To turn this setting on or off:

1. Still in the **Export and sharing settings** section of the **Tenant Settings**, find the setting called **Copy and paste visuals**.
1. Turn the switch on or off.
1. Under **Apply to**, select the scope of users that the setting will affect.
1. Select **Apply** to save your changes.

## Export to Excel

Users in the organization can export the data from a visualization to an Excel file.

To turn this setting on or off:

1. Still in the **Export and sharing settings** section of the **Tenant Settings**, find the setting called **Export to Excel**.
1. Turn the switch on or off.
1. Under **Apply to**, select the scope of users that the setting will affect.
1. Select **Apply** to save your changes.

## Export to .csv

Users in the organization can export data from a tile, visualization, or paginated report to a .csv file.

To turn this setting on or off:

1. Still in the **Export and sharing settings** section of the **Tenant Settings**, find the setting called **Export to .csv**.
1. Turn the switch on or off.
1. Under **Apply to**, select the scope of users that the setting will affect.
1. Select **Apply** to save your changes.

## Download reports

Users in the organization can download .pbix files and paginated reports.

To turn this setting on or off:

1. Still in the **Export and sharing settings** section of the **Tenant Settings**, find the setting called **Download reports**.
1. Turn the switch on or off.
1. Under **Apply to**, select the scope of users that the setting will affect.
1. Select **Apply** to save your changes.

## Users can work with Power BI datasets in Excel using a live connection

Turn this setting on to allow users to export data to Excel from a Power BI visual or dataset, or export a dataset to an Excel workbook with Analyze in Excel, both options with a live connection to the XMLA endpoint.

To turn this setting on or off:

1. Still in the **Export and sharing settings** section of the **Tenant Settings**, find the setting called **Users can work with Power BI datasets in Excel using a live connection**.
1. Turn the switch on or off.
1. Under **Apply to**, select the scope of users that the setting will affect.
1. Select **Apply** to save your changes.

## Allow live connections

Users in the organization can use Power BI service Live Connect. If you turn this setting on to allow live connections, this also allows users to Analyze in Excel.

To turn this setting on or off:

1. Still in the **Export and sharing settings** section of the **Tenant Settings**, find the setting called **Allow live connections**.
1. Turn the switch on or off.
1. Under **Apply to**, select the scope of users that the setting will affect.
1. Select **Apply** to save your changes.

## Export reports as PowerPoint presentations or PDF documents

Users in the organization can export reports as PowerPoint files or PDF documents.

To turn this setting on or off:

1. Still in the **Export and sharing settings** section of the **Tenant Settings**, find the setting called **Export reports as PowerPoint presentations or PDF documents**.
1. Turn the switch on or off.
1. Under **Apply to**, select the scope of users that the setting will affect.
1. Select **Apply** to save your changes.

## Export reports as MHTML documents

Users in the organization can export Paginated reports as MHTML documents when this setting is turned on.

To turn this setting on or off:

1. Still in the **Export and sharing settings** section of the **Tenant Settings**, find the setting called **Export reports as MHTML documents**.
1. Turn the switch on or off.
1. Under **Apply to**, select the scope of users that the setting will affect.
1. Select **Apply** to save your changes.

## Export reports as Word documents

Turn this setting on to allow users in the organization to export Paginated reports as Word documents.

To turn this setting on or off:

1. Still in the **Export and sharing settings** section of the **Tenant Settings**, find the setting called **Export reports as Word documents**.
1. Turn the switch on or off.
1. Under **Apply to**, select the scope of users that the setting will affect.
1. Select **Apply** to save your changes.

## Export reports as XML documents

Users in the organization can export Paginated reports as XML documents.

To turn this setting on or off:

1. Still in the **Export and sharing settings** section of the **Tenant Settings**, find the setting called **Export reports as XML documents**.
1. Turn the switch on or off.
1. Under **Apply to**, select the scope of users that the setting will affect.
1. Select **Apply** to save your changes.

## Export reports as image files

Users in the organization can use the export report to file API to export reports as image files.

To turn this setting on or off:

1. Still in the **Export and sharing settings** section of the **Tenant Settings**, find the setting called **Export reports as image files**.
1. Turn the switch on or off.
1. Under **Apply to**, select the scope of users that the setting will affect.
1. Select **Apply** to save your changes.

## Print dashboards and reports

To turn this setting on or off:

1. Still in the **Export and sharing settings** section of the **Tenant Settings**, find the setting called **Print dashboards and reports**.
1. Turn the switch on or off.
1. Under **Apply to**, select the scope of users that the setting will affect.
1. Select **Apply** to save your changes.

## Certification

Allow users in this org to certify datasets, dataflows, reports, and apps. Read [Enable content certification](service-admin-setup-certification.md) for more details.

To turn this setting on:

1. Still in the **Export and sharing settings** section of the **Tenant Settings**, find the setting called **Certification**.
1. Turn the switch on.
1. Under **Specify URL for documentation page** enter the URL link.
1. Under **Apply to**, select the scope of users that the setting will affect.
1. Select **Apply** to save your changes.

## Users can set up email subscriptions

Users can create email subscriptions to reports and dashboards. Read [Email subscriptions for reports and dashboards in the Power BI service](../collaborate-share/end-user-subscribe.md) to learn more.

To turn this setting on:

1. Still in the **Export and sharing settings** section of the **Tenant Settings**, find the setting called **Users can set up email subscriptions**.
1. Turn the switch on.
1. Select **Apply** to save your changes.

## Allow email subscriptions to be sent to external users 

The **Allow email subscriptions to be sent to external users** setting helps organizations choose whether external users can be included as recipients of email subscriptions.

External users are users outside of the organization that have not been added as Azure Active Directory business-to-business (B2B) guest users. If this setting is turned off, an external user who isn't already a guest user in the organization can't be included as a recipient of an email subscription.

To turn on this setting:

1. Still in the **Export and sharing settings** section of the **Tenant Settings**, find the setting called **Allow email subscriptions to be sent to external users**.
1. Turn the switch on.
1. Under **Apply to**, select the scope of users that the setting will affect.
1. Select **Apply** to save your changes.

## B2B guest users can set up and be subscribed to email subscriptions

B2B users can be specifically granted permission to view content in Power BI by a Power BI tenant admin. So, there may be instances that admin may want B2B users to receive email subscriptions but not other external users.  

When this setting is on, users in the organization can subscribe B2B users [(if they also have permissions and license to subscribe others)](../collaborate-share/end-user-subscribe.md#subscribe-others), and  B2B users can create their own content subscription to which they have access.

To turn on this setting:

1. Still in the **Export and sharing settings** section of the **Tenant Settings**, find the setting called **Allow email subscriptions to be sent to external users**.
1. Turn the switch on.
1. Under **Apply to**, select the scope of users that the setting will affect.
1. Select **Apply** to save your changes.

If you have this setting off, users in the organization cannot subscribe content to B2B users, and B2B users can't create their own email subscriptions. 

> [!IMPORTANT]
> The admin switch that controls email subscriptions to external users will be automatically turned off. This is because B2B users are external users that have been granted elevated permissions to access content. It would not make sense to prevent email subscriptions from being sent to B2B users but continue to allow them to be sent to other external users.  

## Featured content

By default, anyone with the Admin, Member, or Contributor role in a workspace in your organization can feature content on Power BI Home. See [Feature content on colleagues' Power BI Home page](../collaborate-share/service-featured-content.md) for details.

This setting enables you to enable or disable the ability of users in your organization to promote their published content to the **Featured** section of the Power BI Home page.

To use this setting:

1. Still in the **Export and sharing settings** section of the **Tenant Settings**, find the setting called **Featured content**.
1. Turn the switch on.
1. Under **Apply to**, select the scope of users that the setting will affect.
1. Select **Apply** to save your changes.

You can also manage featured content on the **Featured content** page in the Admin portal. Go to [Manage featured content](service-admin-portal-featured-content.md) for more details.

## Allow connections to featured tables

This setting lets Power BI admins control who in the organization can use featured tables in the Excel Data Types Gallery. Read more about [Power BI featured tables in Excel](../collaborate-share/service-excel-featured-tables.md). 

To turn this setting on:

1. Still in the **Export and sharing settings** section of the **Tenant Settings**, find the setting called **Allow connections to featured tables**.
1. Turn the switch on.
1. Under **Apply to**, select the scope of users that the setting will affect.
1. Select **Apply** to save your changes.

>[!NOTE]
>Connections to featured tables are also disabled if the [Allow live connections](service-admin-portal-export-sharing.md#allow-live-connections) setting is set to Disabled.

## Enable Microsoft Teams integration in the Power BI service

This setting allows organizations to access features that work with Microsoft Teams and the Power BI service. These features include launching Teams experiences from Power BI like chats, the Power BI app for Teams, and getting Power BI notifications from Teams. To completely enable or disable Teams integration, work with your Teams admin.

To turn this setting on:

1. Still in the **Export and sharing settings** section of the **Tenant Settings**, find the setting called **Enable Microsoft Teams integration in the Power BI service**.
1. Turn the switch on.
1. Under **Apply to**, select the scope of users that the setting will affect.
1. Select **Apply** to save your changes.

Read more about [collaborating in Microsoft Teams with Power BI](../collaborate-share/service-collaborate-microsoft-teams.md).

## Install the Power BI app for Teams automatically

Automatic installation makes it easier to install the Power BI app for Microsoft Teams, without needing to change Microsoft Teams app setup policies. This change speeds up the installation and removes admin hassles of configuring and maintaining infrastructure needed by an app setup policy.

To turn this setting on:

1. Still in the **Export and sharing settings** section of the **Tenant Settings**, find the setting called **Install the Power BI app for Teams automatically**.
1. Turn the switch on.
1. Under **Apply to**, select the scope of users that the setting will affect.
1. Select **Apply** to save your changes.

The automatic installation happens for a user under the following conditions:

- The Power BI app for Microsoft Teams is set to **Allowed** in the Microsoft Teams admin portal.
- The Power BI tenant setting **Install Power BI app for Microsoft Teams automatically** is **Enabled**. 
- The user has a Microsoft Teams license.
- The user opens the Power BI service (e.g. app.powerbi.com) in a web browser.

Read more about automatic installation in [Power BI app for Microsoft Teams](../collaborate-share/service-microsoft-teams-app.md).

## Enable Power BI add-in for PowerPoint

The Power BI add-in for PowerPoint makes it possible for users to add live, interactive data from Power BI to a PowerPoint presentation. See [About the Power BI add-in for PowerPoint](../collaborate-share/service-power-bi-powerpoint-add-in-about.md) for more detail.

When this setting is on (default), entry points for opening a new PowerPoint presentation with the add-in already loaded are available in Power BI. When this setting is off, the entry points in Power BI are unavailable.

To turn this setting on:

1. Still in the **Export and sharing settings** section of the **Tenant Settings**, find the setting called **Enable Power BI add-in for PowerPoint**.
1. Turn the switch on.
1. Under **Apply to**, select the scope of users that the setting will affect.
1. Select **Apply** to save your changes.

>[!NOTE]
> If you turn this setting off, that doesn't prevent people from using the add-in starting from PowerPoint. To completely block adding live Power BI report pages to PowerPoint slides using the add-in, the add-in must be turned off in both Power BI and PowerPoint.

## Allow shareable links to grant access to everyone in your organization
This tenant setting is available for admins looking to disable creating shareable links to **People in your organization**.

To turn on this setting:

1. Still in the **Export and sharing settings** section of the **Tenant Settings**, find the setting called **Allow shareable links to grant access to everyone in your organization**.
1. Turn the switch on.
1. Under **Apply to**, select the scope of users that the setting will affect.
1. Select **Apply** to save your changes.

If this setting is turned off for a user with share permissions to a report, that user can only share the report via link to **Specific people** or **People with existing access**. The following image shows what that user will see if they attempt to share the report via link:

![Screenshot showing share option disabled.](media/service-admin-portal-export-sharing/admin-share-option-disabled.png)

## Allow DirectQuery connections to Power BI datasets

When this setting is turned on (default), users can use DirectQuery to connect to Azure Analysis Services or Power BI datasets. See [Using DirectQuery for Power BI datasets and Azure Analysis Services](../connect-data/desktop-directquery-datasets-azure-analysis-services.md) for more detail.

To turn on this setting:

1. Still in the **Export and sharing settings** section of the **Tenant Settings**, find the setting called **Allow DirectQuery connections to Power BI datasets**.
1. Turn the switch on.
1. Under **Apply to**, select the scope of users that the setting will affect.
1. Select **Apply** to save your changes.

If you turn this switch off, it effectively stops users from publishing new composite models on Power BI datasets to the service. Existing reports that leverage a composite model on a Power BI dataset will continue to work, and users will still be able to create composite models using Desktop, but they can't publish to the service.

>[!NOTE]
> Live connections to Power BI datasets aren't affected by this switch, nor are live or DirectQuery connections to Azure Analysis Services. These'll continue to work regardless of whether the setting is on or off. In addition, any published reports that leverage a composite model on a Power BI dataset will continue to work even if the setting has been turned off after they were published.

## Allow guest users to work with shared datasets in their own tenants

When this setting is turned on, Azure AD B2B guest users of datasets shared with them by users in your organization will be able to access and build on those datasets in their own tenant. See [Use in-place dataset sharing to enable external users to view and share datasets in their own tenants (preview) - Admin info](../collaborate-share/service-dataset-external-org-share-admin.md) for detailed information.

To turn on this setting:

1. Still in the **Export and sharing settings** section of the **Tenant Settings**, find the setting called **Allow guest users to work with shared datasets in their own tenants**.
1. Turn the switch on.
1. Select **Apply** to save your changes.

## Allow specific users to turn on external data sharing

As a Power BI admin, you can specify which users or user groups in your organization can share datasets externally with guests from a different tenant through the in-place mechanism. Disabling this setting prevents any user from sharing datasets externally by blocking the ability of users to turn on external sharing for datasets they own or manage.  See [Use in-place dataset sharing to enable external users to view and share datasets in their own tenants (preview) - Admin info](../collaborate-share/service-dataset-external-org-share-admin.md) for detailed information.

To turn on this setting:

1. Still in the **Export and sharing settings** section of the **Tenant Settings**, find the setting called **Allow specific users to turn on external data sharing**.
1. Turn the switch on.
1. Under **Apply to**, select the scope of users that the setting will affect.
1. Select **Apply** to save your changes.

## Next steps

* [About tenant settings](service-admin-portal-about-tenant-settings.md)