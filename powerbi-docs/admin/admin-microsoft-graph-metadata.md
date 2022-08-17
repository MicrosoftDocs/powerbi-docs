---
title: "Metadata passed From Microsoft Power BI to Microsoft Graph"
description: When the Microsoft Graph experience for Power BI is turned on, what data is shared with Microsoft 365?
author: mihart
ms.author: mihart
ms.reviewer: 'jadelynray'
ms.service: powerbi
ms.subservice: powerbi-admin
ms.topic: conceptual
ms.date: 08/17/2022
Customer intent: As a Power BI admin, I need to know what information is passed from Power BI and Microsoft Graph to Microsoft 365.
LocalizationGroup: Admin
---

# Power BI and Microsoft Graph

[!INCLUDE [applies-no-desktop-yes-service](../includes/applies-no-desktop-yes-service.md)]

The Microsoft Graph in Power BI experience can be turned on or off by the xxx administrator. Before turning the experience on, learn what data will be shared with Microsoft 365.

## Data that is shared with Microsoft 365

|Property  |Source  |What is shared  |Example  | Data classification  |  Storage location  |
|---------|---------|---------|---------|---------|---------|
|TenantID     | PBI Store        |  Azure Active Directory Tenant Identifier       |  762049eb-7a69-4c39-bf19-75a5b7fcce1d       |OII  | SCD  |
|ArtifactID     |    PBI Store     |  Identifier for the Content Item (report, app, dashboard, scorecard etc.)       |   762049eb-7a69-4c39-bf19-75a5b7fcce1d      | OII  |  CD  |
|ACL          |  PBI Store       |   Access Control List with permissions and Azure Active Directory User, Security Group and Distribution List Identifiers      |{"accessType": "grant", "id" : "aaaaaaaa-bbbb-cccc-dddd-eeeeeeeeeeee", "type" : "read" }   |OII  | CD  |
|DisplayName     |   PBI Store      |  Display name for the report, dashboard, etc.       |  Retail Analysis Sample       | Customer content  |  CD  |
|Location     |  PBI Store       |  Workspace name as per [Create a workspace](../collaborate-share/service-create-the-new-workspaces.md)       |  Retail workspace       | Customer content  |  CD  |
|ContainerURL     |  PBI Store       |  Workspace URL       |    `https://powerbi-df.analysis-df.windows.net/groups/8b5ac04e-89c1-4fc6-a364-e8411dfd8d17`     |
|WorkspaceID     |  PBI Store       |   Workspace identifier      |    8b5ac04e-89c1-4fc6-a364-e8411dfd8d17     | OII  |  CD  |
|URL     |  PBI Store       |   Content Item URL for report, app, dashboard, scorecard etc.      |     `https://powerbi-df.analysis-df.windows.net/groups/8b5ac04e-89c1-4fc6-a364-e8411dfd8d17/reports/762049eb-7a69-4c39-bf19-75a5b7fcce1d/ReportSection2`    | OII  |  CD  |
|SharingLinksURL     |  PBI Store       |  Sharing Link as per [Share a report using a link](../collaborate-share/service-share-dashboards.md#share-a-report-via-link)      |   OII      |CD|
|IconURL     |   Config      |    ?     |   `cdn.com/report.png`      | System metadata  |  CD  |
|Description     |  PBI Store       |  Content description as per [Report settings](../create-reports/power-bi-report-settings.md)      |   Sample containing retail sales data      | Customer content  |  CD  |
|CreatedUser     |  PBI Store       |  Azure Active Directory User Principal Name of the User that Created the Content as per [AAD user principal name](/azure/active-directory/hybrid/plan-connect-userprincipalname/)       |    `user1@griffin1.org`     | EUII  |  CD  |
|CreatedDate     | PBI Store        |  Date the content was created       |   2011-06-30T23:32:46Z      | System metadata  |  CD  |
|LastModifiedDate     |   PBI Store      |  Last modified date for the content       |    2011-06-30T23:32:46Z     | System metadata  |  CD  |
|LastModifiedUser     |  PBI Store       |   Azure Active Directory User Principal Name for the last person who modified the content      |   `user1@griffin1.org`      |EUII  |  CD  |
|LastRefreshDate     |  PBI Store   | Last refresh date for the content    |  2011-06-30T23:32:46Z   | System metadata |  SIGS  |
|UserID     |   Audit Events  | Azure Active Directory User Principal Name for the user who acted on the content    | `user1@griffin1.org`    | EUII  | SIGS  |
|Signal Type      |  Audit Events   |  The type of action the user took on the content (Viewed, Modified)   |  Viewed   |System metadata |  SIGS  |
|ActorID     |  Audit Events   |  Users Azure Active Delivery(AAD) ID   |  aaaaaaaa-bbbb-cccc-dddd-eeeeeeeeeeee   |EUII  | SIGS  |
|StartTimeEndTime     |  Audit Events   | Date/Time the user performed the action on the content    |  2011-06-30T23:32:46Z   |System metadata |  SIGS  |

## Next steps

Got feedback? We'd love to hear it at [Power BI Ideas](https://ideas.powerbi.com/ideas/).
