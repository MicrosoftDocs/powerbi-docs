---
title: "Metadata passed from Microsoft Fabric to Microsoft Graph"
description: Learn about sharing Fabric metadata with Microsoft 365 services.
author: paulinbar
ms.author: painbar
ms.reviewer: 'jadelynray'
ms.service: powerbi
ms.subservice: powerbi-admin
ms.topic: conceptual
ms.date: 03/07/2023
Customer intent: As a Fabric admin, I need to know what information is passed from Fabric and Microsoft Graph to Microsoft 365.
LocalizationGroup: Admin
---

# Share data with your Microsoft 365 services

[!INCLUDE [applies-no-desktop-yes-service](../includes/applies-no-desktop-yes-service.md)]

This article is aimed at Fabric administrators and decision makers who need to know how and where Fabric metadata is being used.

Fabric metadata sharing with Microsoft 365 services is a feature that allows metadata from Fabric to be shared with Microsoft 365 services (typically via [Microsoft Graph](/graph/overview)) and combined with data from across Microsoft 365, Windows, and Enterprise Mobility + Security (EMS) to build apps for organizations and consumers that interact with millions of users. **The feature is enabled by default**.

When shared with Microsoft 365 services, Fabric content will be listed in the Most Recently Viewed list on the Office.com home page. The Fabric content affected includes reports, dashboards, apps, workbooks, paginated reports, and workspaces. The information required by the Most Recently Viewed functionality includes:

* The display name of the content
* When the content was last accessed
* The type of content that was accessed (report, dashboard etc.)

See [the complete list of Fabric metadata that is shared with Microsoft 365 services](#data-that-is-shared-with-microsoft-365).

## Data residency

Fabric and Microsoft 365 are distinct and separately operated Microsoft cloud services, each deployed according to its own service-specific data center alignment rules, even when purchased together. As a result, it's possible that your Microsoft 365 Services and your Fabric service are not deployed in the same geographic region.

By default, Fabric metadata is available only in the region where the Fabric tenant is located. However, you can allow Fabric to share metadata across regions by turning on a toggle switch in the **Users can see Microsoft Fabric metadata in Microsoft 365** tenant setting. For more information, see [How to turn sharing with Microsoft 365 services on and off](#how-to-turn-sharing-with-microsoft-365-services-on-and-off).

### Where is Fabric data stored?

For more information about data storage locations, see [Find the default region for your organization](./service-admin-where-is-my-tenant-located.md) and [Product Availability by Geography](https://powerplatform.microsoft.com/availability-reports/).

### Where is Microsoft 365 data stored?

For more information about data storage for Microsoft 365, see [Where your Microsoft 365 customer data is stored](/microsoft-365/enterprise/o365-data-locations) and [Multi-Geo Capabilities in Microsoft 365](https://www.microsoft.com/microsoft-365/business/multi-geo-capabilities).

## How to turn sharing with Microsoft 365 services on and off

Sharing metadata with Microsoft 365 services is controlled by the **Users can see Microsoft Fabric metadata in Microsoft 365** tenant setting. The setting is **Enabled** by default. To turn off the feature, or to turn it on again after it's been turned off, go to **Admin portal** > **Tenant settings** > **Users can see Microsoft Fabric metadata in Microsoft 365** and set the toggle as appropriate.

By default, Fabric metadata is available only in the region where the Fabric tenant is located. To allow Fabric to share metadata across regions, set second toggle switch to **Enabled**. When you enable the second toggle, you acknowledge that Fabric metadata may flow outside the geographic region it's stored in.

:::image type="content" source="./media/admin-share-power-bi-metadata-microsoft-365-services/fabric-share-metadata-microsoft-365-services-tenant-setting.png" alt-text="Screenshot of Users can see Microsoft Fabric metadata in Microsoft 365 tenant setting.":::

## Data that is shared with Microsoft 365

The tables below list the data that is shared with Microsoft 365 services.

**Artifact metadata that is mainly used when using the "search" mechanism to look for Fabric content within your Microsoft 365 services**

|Property|What is Shared|Example|
|---------|---------|---------|---------|
|TenantID|Azure AD Tenant Identifier|762049eb-7a69-4c39-bf19-75a5b7fcce1d|
|Artifact ID|Identifier for the Content Item (report, app, dashboard, scorecard etc.)|762049eb-7a69-4c39-bf19-75a5b7fcce1d|
|ACL|Access Control List with permissions and Azure AD User, Security Group and Distribution List Identifiers|{"accessType": "grant", "id" : "aaaaaaaa-bbbb-cccc-dddd-eeeeeeeeeeee", "type" : "read" }|
|DisplayName|Display name for the report, dashboard, etc.|Retail Analysis Sample|
|Workspace name|Workspace name as per [Create a workspace](../collaborate-share/service-create-the-new-workspaces.md)|Retail workspace|
|Workspace URL|Workspace URL|https://powerbi-df.analysis-df.windows.net/groups/8b5ac04e-89c1-4fc6-a364-e8411dfd8d17|
|Workspace ID|Workspace identifier|8b5ac04e-89c1-4fc6-a364-e8411dfd8d17|
|URL|Content Item URL for report, app, dashboard, scorecard etc.|https://powerbi-df.analysis-df.windows.net/groups/8b5ac04e-89c1-4fc6-a364-e8411dfd8d17/reports/762049eb-7a69-4c39-bf19-75a5b7fcce1d/ReportSection2|
|SharingLinksURL|Sharing Link as per [Share a report using a link](../collaborate-share/service-share-dashboards.md#share-a-report-via-link)|["https://app.powerbi.com/links/xyz123"]|
|IconURL||cdn.com/report.png|
|Description|Content description as per [Report settings](../create-reports/power-bi-report-settings.md)|Sample containing retail sales data|
|Owner/Creator|Azure AD User Principal Name of the User that Created the Content as per [Azure AD user principal name](/azure/active-directory/hybrid/plan-connect-userprincipalname/)|user1@griffin1.org|
|CreatedDate|Date the content was created|2011-06-30T23:32:46Z|
|LastModifiedDate|Last modified date for the content|2011-06-30T23:32:46Z|
|LastModifiedUser|Azure AD User Principal Name for the last person who modified the content|user1@griffin1.org|

**User activity that is leveraged for showing Fabric content within your "Recents" and "Recommended" sections at Office.com**

|Property|What is Shared|Example|
|---------|---------|---------|---------|
|LastRefreshDate|Last refresh date for the content|2011-06-30T23:32:46Z|
|UserID|Azure AD User Principal Name for the user who acted on the content|user1@griffin1.org|
|Signal Type|The type of action the user took on the content (Viewed, Modified)|Viewed|
|ActorID|Users Azure AD ID for the user who acted on the content|aaaaaaaa-bbbb-cccc-dddd-eeeeeeeeeeee|
|StartTime/EndTime|Date/Time the user performed the action on the content|2011-06-30T23:32:46Z|

## Next steps

>[!div class="nextstepaction"]
>[Share data with your Microsoft 365 services tenant settings](service-admin-portal-share-data-microsoft-365-services.md)