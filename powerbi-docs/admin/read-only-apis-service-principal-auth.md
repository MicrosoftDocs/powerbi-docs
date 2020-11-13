---
title: Use Power BI read-only Admin APIs with service principal authentication (preview)
description: Learn how to enable service principal authentication to permit use of Power BI APIs.
author: paulinbar
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-admin
ms.topic: how-to
ms.date: 11/13/2020
ms.author: painbar
ms.custom:

LocalizationGroup: Administration
---

# Use Power BI read-only Admin APIs with service principal authentication (preview)

Service principal is an authentication method that can be used to let an Azure Active Directory (Azure AD) application access Power BI service content and APIs.
When you create an Azure AD app, a [service principal object](https://docs.microsoft.com/azure/active-directory/develop/app-objects-and-service-principals#service-principal-object) is created. The service principal object, also known simply as the service principal, allows Azure AD to authenticate your app. Once authenticated, the app can access Azure AD tenant resources.

## Method

To use a service principal, follow these steps:

1. [Create an Azure AD app](https://docs.microsoft.com/azure/active-directory/develop/howto-create-service-principal-portal). You can skip this step if you already have an Azure AD app you want to use. 
2. Create a new **Security Group** in Azure Active Directory. [Read more about how to create a basic group and add members using Azure Active Directory](https://docs.microsoft.com/azure/active-directory/fundamentals/active-directory-groups-create-azure-portal). You can skip this step if you already have a security group you would like to use.
    Make sure to select **Security** as the Group Type.

    ![Screenshot of new group creation dialog in Azure portal.](media/read-only-apis-service-principal-auth/azure-portal-new-group-dialog.png)

3. Add your App-Id as a member of the security group you created. To do so:
    1. Navigate to **Azure portal > Azure Active Directory > Groups**, and choose the security group you created in Step 2.
    1. Select **Add Members**.
    Note: Make sure the app you use does not have any Power BI admin roles set on it in Azure portal. 
    * Sign into the **Azure portal** as a Global Administrator, an Application Administrator, or a Cloud Application Administrator. 
    * Select **Azure Active Directory**, then **Enterprise applications**. 
    * Select the application you want to grant access to Power BI. 
    * Select **Permissions**. Make sure there are no Power BI admin-consent-required permissions set on this application. See [Managing consent to applications and evaluating consent requests](https://docs.microsoft.com/azure/active-directory/manage-apps/manage-consent-requests) for more information. 
4. Enable the Power BI service admin settings. To do this:
    1. Log into the Power BI Admin portal. You need to be a Power BI admin to see the Tenant settings page.
    1. Under **Developer settings**, you will see **Allow service principals to use read-only Power BI Admin APIs (preview)**. Select the **Specific security groups** radio button, and then add the security group you created in Step 2 in the text field that appears below it, as shown in the figure below.

    ![Screenshot of allow service principals tenant setting.](media/read-only-apis-service-principal-auth/allow-service-principals-tenant-setting.png)

 5. Start using the read-only Admin APIs. See the list of supported APIs below.

    >[!IMPORTANT]
    >Once you enable the service principal to be used with Power BI, the application's AD permissions no longer have any effect. The application's permissions are then managed through the Power BI admin portal.

## Considerations and limitations
* You can't sign into the Power BI portal using service principal.
* Power BI admin rights are required to enable service principal in the developer settings in the Power BI admin portal.
* Service principal currently support the following APIs:
    1. [GetGroupsAsAdmin](https://docs.microsoft.com/rest/api/power-bi/admin/groups_getgroupsasadmin) with $expand for dashboards, datasets, reports, and dataflows 
    1. [GetDashboardsAsAdmin](https://docs.microsoft.com/rest/api/power-bi/admin/dashboards_getdashboardsasadmin) with $expand tiles
    1. [GetDatasourcesAsAdmin](https://docs.microsoft.com/rest/api/power-bi/admin/datasets_getdatasourcesasadmin) 
    1. [GetDatasetToDataflowsLinksAsAdmin](https://docs.microsoft.com/rest/api/power-bi/admin/datasets_getdatasettodataflowslinksingroupasadmin)
    1. [GetDataflowDatasourcesAsAdmin](https://docs.microsoft.com/rest/api/power-bi/admin/dataflows_getdataflowdatasourcesasadmin) 
    1. [GetDataflowUpstreamDataflowsAsAdmin](https://docs.microsoft.com/rest/api/power-bi/admin/dataflows_getupstreamdataflowsingroupasadmin) 
    1. [GetCapacitiesAsAdmin](https://docs.microsoft.com/rest/api/power-bi/admin/getcapacitiesasadmin)
    1. [GetActivityLog](https://docs.microsoft.com/rest/api/power-bi/admin/getactivityevents)
    1. GetModifiedWorkspaces
    1. WorkspaceGetInfo
    1. WorkspaceScanStatus
    1. WorksapceScanResponse
