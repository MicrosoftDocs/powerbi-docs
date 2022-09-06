---
title: "Metadata passed From Microsoft Power BI to Microsoft Graph"
description: When the Microsoft Graph experience for Power BI is turned on, what data is shared with Microsoft 365?
author: mihart
ms.author: mihart
ms.reviewer: 'jadelynray'
ms.service: powerbi
ms.subservice: powerbi-admin
ms.topic: conceptual
ms.date: 08/18/2022
Customer intent: As a Power BI admin, I need to know what information is passed from Power BI and Microsoft Graph to Microsoft 365.
LocalizationGroup: Admin
---

# Power BI and Microsoft Graph

[!INCLUDE [applies-no-desktop-yes-service](../includes/applies-no-desktop-yes-service.md)]

Microsoft Graph is the gateway to data and intelligence in Microsoft 365. It provides a unified programmability model that you can use to access the tremendous amount of data in Microsoft 365, Windows, and Enterprise Mobility + Security (EMS). Use the wealth of data in Microsoft Graph to build apps for organizations and consumers that interact with millions of users.

Together, the Microsoft Graph API, connectors, and Data Connect power the Microsoft 365 platform. With the ability to access Microsoft Graph data and other datasets, you can derive insights and analytics, extend Microsoft 365 experiences, and build unique, intelligent applications.

For more information, visit [Microsoft Graph documentation](/graph/overview.md)

When Microsoft Graph is integrated with Power BI, details about the Power BI content and activity will be accessible from the Office.com Home page. This feature is currently available in private preview. To participate in the private preview, a Power BI administrator will need to enable the **Share data with your Microsoft 365 services** tenant setting. Before turning on the experience, learn what data will be shared with Microsoft 365.

## Data that will be shared with Microsoft 365

|Property  |Source  |What is shared  |Example  | Data classification  |  Storage location  |
|---------|---------|---------|---------|---------|---------|
|TenantID     | PBI Store        |  Azure AD Tenant Identifier       |  762049eb-7a69-4c39-bf19-75a5b7fcce1d       |OII  | SCD  |
|ArtifactID     |    PBI Store     |  Identifier for the Content Item (report, app, dashboard, scorecard etc.)       |   762049eb-7a69-4c39-bf19-75a5b7fcce1d      | OII  |  CD  |
|ACL          |  PBI Store       |   Access Control List with permissions and Azure AD User, Security Group and Distribution List Identifiers      |{"accessType": "grant", "id" : "aaaaaaaa-bbbb-cccc-dddd-eeeeeeeeeeee", "type" : "read" }   |OII  | CD  |
|DisplayName     |   PBI Store      |  Display name for the report, dashboard, etc.       |  Retail Analysis Sample       | Customer content  |  CD  |
|Location     |  PBI Store       |  Workspace name as per [Create a workspace](../collaborate-share/service-create-the-new-workspaces.md)       |  Retail workspace       | Customer content  |  CD  |
|ContainerURL     |  PBI Store       |  Workspace URL       |    `https://powerbi-df.analysis-df.windows.net/groups/8b5ac04e-89c1-4fc6-a364-e8411dfd8d17`     |
|WorkspaceID     |  PBI Store       |   Workspace identifier      |    8b5ac04e-89c1-4fc6-a364-e8411dfd8d17     | OII  |  CD  |
|URL     |  PBI Store       |   Content Item URL for report, app, dashboard, scorecard etc.      |     `https://powerbi-df.analysis-df.windows.net/groups/8b5ac04e-89c1-4fc6-a364-e8411dfd8d17/reports/762049eb-7a69-4c39-bf19-75a5b7fcce1d/ReportSection2`    | OII  |  CD  |
|SharingLinksURL     |  PBI Store       |  Sharing Link as per [Share a report using a link](../collaborate-share/service-share-dashboards.md#share-a-report-via-link)      |   OII      |CD|
|IconURL     |   Config      |    ?     |   `cdn.com/report.png`      | System metadata  |  CD  |
|Description     |  PBI Store       |  Content description as per [Report settings](../create-reports/power-bi-report-settings.md)      |   Sample containing retail sales data      | Customer content  |  CD  |
|CreatedUser     |  PBI Store       |  Azure AD User Principal Name of the User that Created the Content as per [Azure AD user principal name](/azure/active-directory/hybrid/plan-connect-userprincipalname/)       |    `user1@griffin1.org`     | EUII  |  CD  |
|CreatedDate     | PBI Store        |  Date the content was created       |   2011-06-30T23:32:46Z      | System metadata  |  CD  |
|LastModifiedDate     |   PBI Store      |  Last modified date for the content       |    2011-06-30T23:32:46Z     | System metadata  |  CD  |
|LastModifiedUser     |  PBI Store       |   Azure AD User Principal Name for the last person who modified the content      |   `user1@griffin1.org`      |EUII  |  CD  |
|LastRefreshDate     |  PBI Store   | Last refresh date for the content    |  2011-06-30T23:32:46Z   | System metadata |  SIGS  |
|UserID     |   Audit Events  | Azure AD User Principal Name for the user who acted on the content    | `user1@griffin1.org`    | EUII  | SIGS  |
|Signal Type      |  Audit Events   |  The type of action the user took on the content (Viewed, Modified)   |  Viewed   |System metadata |  SIGS  |
|ActorID     |  Audit Events   |  Users Azure AD ID   |  aaaaaaaa-bbbb-cccc-dddd-eeeeeeeeeeee   |EUII  | SIGS  |
|StartTimeEndTime     |  Audit Events   | Date/Time the user performed the action on the content    |  2011-06-30T23:32:46Z   |System metadata |  SIGS  |

## Next steps

Got feedback? We'd love to hear it at [Power BI Ideas](https://ideas.powerbi.com/ideas/).

