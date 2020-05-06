---
title: Organizational visuals
description: This article discusses how you can display tooltips in Power BI visuals.
author: KesemSharabi
ms.author: kesharab
ms.reviewer: sranins
ms.service: powerbi
ms.subservice: powerbi-custom-visuals
ms.topic: conceptual
ms.date: 04/09/2020
---

# Tooltips in Power BI visuals

## <a name="organizational-visuals">Organization visuals</a> 

The **Organization visuals** tab enables you to deploy and manage Power BI visuals inside your organization. With organizational visuals, you can easily deploy proprietary visuals in your organization, which report authors can then discover and import into their reports from Power BI Desktop. [Learn more](developer/visuals/power-bi-custom-visuals-organization.md)

> [!WARNING]
> A custom visual could contain code with security or privacy risks; make sure you trust the author and the source of the custom visual before deploying to the organization's repository.

The following image shows all the Power BI visuals that are currently deployed in an organization's repository.

![Org admin visual](media/service-admin-portal/power-bi-custom-visuals-organizational-admin-01.png)

### Add a new custom visual

To add a new custom visual to the list, follow these steps. 

1. In the right pane, select **Add a custom visual**.

    ![Power BI visuals form](media/service-admin-portal/power-bi-custom-visuals-organizational-admin-02.png)

1. Fill in the **Add custom visual** form:

    * **Choose a .pbiviz file** (required): select a custom visual file to upload. Only versioned API Power BI visuals are supported (read here what this means).

    Before you upload a custom visual, you should review that visual for security and privacy to make sure it fits your organization's standards.

    * **Name your custom visual** (required): give a short title to the visual so Power BI Desktop users easily understand what it does

    * **Icon**: The icon file that is shown in the Power BI Desktop UI.

    * **Description**: a short description of the visual to provide more context and education to the user

1. Select **Add** to initiate the upload request. If successful you can see the new item in the list. If failed, you can get an appropriate error message

### Delete a custom visual from the list

To permanently delete a visual, select the trash bin icon for the visual in the repository.

> [!IMPORTANT]
> Deletion is irreversible. Once deleted, the visual immediately stops rendering in existing reports. Even if you upload the same visual again, it won't replace the previous one that was deleted. However, users can import the new visual again and replace the instance they have in their reports.

### Disable a custom visual in the list

To disable the visual from the organizational store, select the gear icon. In the **Access** section, disable the custom visual.

After you disable the visual, the visual won't render in existing reports, and it displays the error message below.

*This custom visual is no longer available. Please contact your administrator for details.*

However, visuals that are bookmarked still work.

After any update or administrator change, Power BI Desktop users should restart the application or refresh the browser in the Power BI service to see the updates.

### Update a visual

To update the visual from the organizational store, select the gear icon. Browse and upload a new version of the visual.

Make sure the Visual ID remains unchanged. The new file replaces the previous file for all the reports throughout the organization. However, if the new version of the visual might break any usage or data structure of the previous version of the visual, then do not replace the previous version. Instead, you should create a new listing for the new version of the visual. For example, add a new version number (version X.X) to the title of the new listed visual. This way it is clear that it is the same visual just with an updated version number, so existing reports do not break their functionality. Again, make sure the Visual ID remains unchanged. Then the next time users enter the organization repository from Power BI Desktop, they can import the new version, which prompts them to replace the current version that they have in the report.

For more information, visit [Frequently asked questions about organizational Power BI visuals](developer/visuals/power-bi-custom-visuals-faq.md#organizational-power-bi-visuals)