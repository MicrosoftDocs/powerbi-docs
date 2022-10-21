---
title: "Metadata passed from Microsoft Power BI to Microsoft Graph"
description: When the Microsoft Graph experience for Power BI is turned on, what data is shared with Microsoft 365?
author: paulinbar
ms.author: painbar
ms.reviewer: 'jadelynray'
ms.service: powerbi
ms.subservice: powerbi-admin
ms.topic: conceptual
ms.date: 10/21/2022
Customer intent: As a Power BI admin, I need to know what information is passed from Power BI and Microsoft Graph to Microsoft 365.
LocalizationGroup: Admin
---

# Share data with your Microsoft 365 services

[!INCLUDE [applies-no-desktop-yes-service](../includes/applies-no-desktop-yes-service.md)]

This article is aimed at Power BI administrators and decision makers who need to know how and where Power BI metadata is being used.

Power BI metadata sharing with Microsoft 365 services is a feature that allows metadata from Power BI to be shared with Microsoft 365 services (typically via [Microsoft Graph](/graph/overview) and combined with data from across Microsoft 365, Windows, and Enterprise Mobility + Security (EMS) to build apps for organizations and consumers that interact with millions of users. The feature is disabled by default.

When shared with Microsoft 365 services, Power BI content will be listed in the Most Recently Viewed list on the Office.com home page. The Power BI content affected includes reports, dashboards, apps, workbooks, paginated reports, and workspaces. The information required by the Most Recently Viewed functionality includes:

* The display name of the content
* When the content was last accessed
* The type of content that was accessed (report, dashboard etc.)

See [the complete list of Power BI metadata that is shared with Microsoft 365 services](#data-that-will-be-shared-with-microsoft-365).

## How to turn on sharing with Microsoft 365 services

To enable sharing Power BI metadata with Microsoft 365 services, a Power BI administrator must turn on the **[Share data with your Microsoft 365 services](./service-admin-portal-share-data-microsoft-365-services.md)** tenant setting. Before turning on the experience, the administrator should review the list of [data that will be shared with Microsoft 365](#data-that-will-be-shared-with-microsoft-365).

## Data residency

If Power BI and your Microsoft 365 services are in different geographic regions, information may flow outside the region it's stored in. By enabling this setting, the Power BI administrator explicitly opts in to this feature, and acknowledges enabling these cross-service capabilities may result in Power BI metadata flowing outside the geographic region it's stored in. For more information, see [Where data is located when Power BI data is shared with your Microsoft 365 services](./service-admin-m365-data-access-storage.md).

References:
* [Where is my Power BI tenant located?](service-admin-where-is-my-tenant-located.md)
* [Microsoft Privacy - Where is Your Data Located](https://www.microsoft.com/trust-center/privacy/data-location)
* [Where data is located when Power BI data is shared with your Microsoft 365 services](./service-admin-m365-data-access-storage.md)

## Data that will be shared with Microsoft 365

The tables below list the data that is shared with Microsoft 365 services.

**Artifact metadata that is mainly used when using the "search" mechanism to look for Power BI content within your Microsoft 365 services**

||Property|What is Shared|Example|
|---------|---------|---------|---------|
|1|TenantID|Azure AD Tenant Identifier|762049eb-7a69-4c39-bf19-75a5b7fcce1d|
|2|Artifact ID|Identifier for the Content Item (report, app, dashboard, scorecard etc.)|762049eb-7a69-4c39-bf19-75a5b7fcce1d|
|3|ACL|Access Control List with permissions and Azure AD User, Security Group and Distribution List Identifiers|{"accessType": "grant", "id" : "aaaaaaaa-bbbb-cccc-dddd-eeeeeeeeeeee", "type" : "read" }|
|4|DisplayName|Display name for the report, dashboard, etc.|Retail Analysis Sample|
|5|Workspace name|Workspace name as per [Create a workspace](../collaborate-share/service-create-the-new-workspaces.md)|Retail workspace|
|6|Workspace URL|Workspace URL|https://powerbi-df.analysis-df.windows.net/groups/8b5ac04e-89c1-4fc6-a364-e8411dfd8d17|
|7|Workspace ID|Workspace identifier|8b5ac04e-89c1-4fc6-a364-e8411dfd8d17|
|8|URL|Content Item URL for report, app, dashboard, scorecard etc.|https://powerbi-df.analysis-df.windows.net/groups/8b5ac04e-89c1-4fc6-a364-e8411dfd8d17/reports/762049eb-7a69-4c39-bf19-75a5b7fcce1d/ReportSection2|
|9|SharingLinksURL|Sharing Link as per [Share a report using a link](../collaborate-share/service-share-dashboards.md#share-a-report-via-link)|["https://app.powerbi.com/links/xyz123"]|
|10|IconURL||cdn.com/report.png|
|11|Description|Content description as per [Report settings](../create-reports/power-bi-report-settings.md)|Sample containing retail sales data|
|12|Owner/Creator|Azure AD User Principal Name of the User that Created the Content as per [Azure AD user principal name](/azure/active-directory/hybrid/plan-connect-userprincipalname/)|user1@griffin1.org|
|13|CreatedDate|Date the content was created|2011-06-30T23:32:46Z|
|14|LastModifiedDate|Last modified date for the content|2011-06-30T23:32:46Z|
|15|LastModifiedUser|Azure AD User Principal Name for the last person who modified the content|user1@griffin1.org|

**User activity that is leveraged for showing Power BI content within your "Recents" and "Recommended" sections at Office.com**

||Property|What is Shared|Example|
|---------|---------|---------|---------|
|16|LastRefreshDate|Last refresh date for the content|2011-06-30T23:32:46Z|
|17|UserID|Azure AD User Principal Name for the user who acted on the content|user1@griffin1.org|
|18|Signal Type|The type of action the user took on the content (Viewed, Modified)|Viewed|
|19|ActorID|Users Azure AD ID for the user who acted on the content|aaaaaaaa-bbbb-cccc-dddd-eeeeeeeeeeee|
|20|StartTime/EndTime|Date/Time the user performed the action on the content|2011-06-30T23:32:46Z|

## Next steps

* [Share data with your Microsoft 365 services tenant settings](service-admin-portal-share-data-microsoft-365-services.md)
* [Where data is located when Power BI data is shared with your Microsoft 365 services](./service-admin-m365-data-access-storage.md)

Got feedback? We'd love to hear it at [Power BI Ideas](https://ideas.powerbi.com/ideas/).