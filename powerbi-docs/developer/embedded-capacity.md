---
title: Frequently asked questions about Power BI Embedded
description: Browse a list of frequently asked questions and answers about Power BI Embedded.
author: KesemSharabi
ms.author: kesharab
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-developer
ms.topic: conceptual
ms.date: 12/04/2019 
---

# Power BI Embedded capacity

## General

### What is Power BI Embedded?

[Microsoft Power BI Embedded (PBIE)](azure-pbie-what-is-power-bi-embedded.md) allows application developers to embed stunning, fully interactive reports into their applications without having to build their own data visualizations and controls from scratch.

### Who is the target audience for Power BI Embedded?

Developers and software companies, also known as independent software vendors (ISVs), coding applications.

### How is Power BI Embedded different from Power BI the service?

Power BI is a software-as-a-service analytics solution that gives organizations a single view of their most critical business data.

Microsoft developed Power BI Embedded for ISVs wanting to embed visuals into their applications to help their customers make analytic decisions. This spares ISVs from having to build their own analytics’ solution themselves. [Embedded analytics](embedding.md) enables business users to access business data and execute queries against it to generate insights within the application.


### What is the difference between Power BI Premium and Power BI Embedded?

Power BI Premium is capacity geared toward enterprises who want a complete BI solution that provides a single view of its organization, partners, customers, and suppliers. Power BI Premium helps your organization make decisions. Power BI Premium is a SaaS product that allows users to consume content through mobile apps, internally developed apps, or at the Power BI portal.

Power BI Embedded is for ISVs who want to embed visuals into their applications. Power BI Embedded helps your customers make decisions because Power BI Embedded is for application developers, customers of that application can consume content stored on Power BI Embedded capacity, including anyone inside or outside the organization. You can't share Power BI Embedded capacity content through one-click publish to Web or one-click publish to SharePoint.

### What is the Microsoft recommendation for when a customer should buy Power BI Premium vs. Power BI Embedded?

Microsoft recommends that enterprises buy Power BI Premium, an enterprise-grade, self-service cloud BI solution. We recommend ISVs buy Power BI Embedded for its cloud-powered embedded analytics components. However, a customer has no restriction on which product to buy.

There may be some cases where an ISV (typically large), in addition to app embedding, wants to use a P SKU to get the additional benefits of the pre-packaged Power BI service within their organization. Some enterprises may decide to use A SKUs in Azure if they're only interested in building line-of-business applications and embedding analytics into them and aren't interested in using the pre-packaged Power BI service.

### How many embed tokens can I create?

Embed tokens with PRO license are intended for development testing, so a Power BI master account or [service principal](embed-service-principal.md) can only generate a limited number of tokens. [Purchase a capacity](#technical) for embedding in a production environment. There's no limit to how many embed tokens you can generate when you purchase a capacity. Go to [Available Features](https://docs.microsoft.com/rest/api/power-bi/availablefeatures) to check the usage value that indicates the current embedded usage in percentage.

## Technical

### What is the difference between the A SKUs in Azure and the EM SKUs in Office 365?

PowerBI.com is an enterprise Software as a Service (SaaS) solution with many capabilities such as social collaboration, email subscription, and other features. PowerBI.com helps ISVs manage their embedded analytics solution content and tenant level settings.

Power BI Embedded is a Platform as a Service (PaaS) set of APIs developers can use to create an embedded analytics solution.

 Here is a partial list of feature differences.


<table style="width: 505px;">
<tbody>
<tr>
<td style="width: 107px;" rowspan="2">Feature</td>
<td style="width: 10px;">Power BI Embedded</td>
<td style="width: 20px;" colspan="2">Power BI Premium</td>
</tr>
<tr>
<td style="width: 10px;">
<p>A SKUs</p>
<p>(Azure)</p>
</td>
<td style="width: 10px;">
<p>EM SKUs</p>
<p>(Office)</p>
</td>
<td style="width: 10px;">
<p>P SKUs</p>
<p>(Office)</p>
</td>
</tr>
<tr>
<td style="width: 107px;">Embed artifacts from a Power BI workspace</td>
<td style="width: 10px;">

[!div class="checklist"]
*

</td>
<td style="width: 10px;">

[!div class="checklist"]
*

</td>
<td style="width: 10px;">

[!div class="checklist"]
*

</td>
</tr>
<tr>
<td style="width: 107px;">Consume Power BI reports in an embedded application for your organization (user owns data)</td>
<td style="width: 10px;"><font color="red"><strong>X</strong></font></td>
<td style="width: 10px;">

[!div class="checklist"]
*

</td>
<td style="width: 10px;">

[!div class="checklist"]
*

</td>
</tr>
<tr>
<td style="width: 107px;">Consume Power BI reports in an embedded application&nbsp;for your customers (app owns data)</td>
<td style="width: 10px;">

[!div class="checklist"]
*

</td>
<td style="width: 10px;">

[!div class="checklist"]
*

</td>
<td style="width: 10px;">

[!div class="checklist"]
*

</td>
</tr>
<tr>
<td style="width: 107px;">
<table>
<tbody>
<tr>
<td>Access content with a free Power BI license in&nbsp;Power BI service&nbsp;and Power BI mobile</td>
</tr>
</tbody>
</table>
</td>
<td style="width: 10px;"><font color="red"><strong>X</strong></font></td>
<td style="width: 10px;"><font color="red"><strong>X</strong></font></td>
<td style="width: 10px;">

[!div class="checklist"]
*

</td>
</tr>
<tr>
<td style="width: 107px;">
<p>Access content with a free Power BI license in MS Office apps</p>
</td>
<td style="width: 10px;"><font color="red"><strong>X</strong></font></td>
<td style="width: 10px;">

[!div class="checklist"]
*

</td>
<td style="width: 10px;">

[!div class="checklist"]
*

</td>
</tr>
<tr>
<td style="width: 107px;">&nbsp;</td>
<td style="width: 10px;">&nbsp;</td>
<td style="width: 10px;">&nbsp;</td>
<td style="width: 10px;">&nbsp;</td>
</tr>
</tbody>
</table>

Here is a partial list of feature differences.
Here is a partial list of feature differences.
Here is a partial list of feature differences.


| Feature | Power BI Embedded | Power BI Premium Capacity | Power BI Premium Capacity |
|----------------------------------------------------------------------------------|-------------------|---------------------------|---------------------------|
|   | A SKUs-Azure capacity | EM SKUs-O365 capacity | P SKUs-O365 capacity |
| Embed artifacts from a Power BI workspace | Yes | Yes | Yes |
| Consume Power BI reports in an embedded application - SaaS | No | Yes | Yes |
| Consume Power BI reports in an embedded application - PaaS | Yes | Yes | Yes |
| Consume Power BI reports in SharePoint | No | Yes | Yes |
| Consume Power BI reports in Dynamics | No | Yes | Yes |
| Consume Power BI reports in Teams (excludes mobile app) | No | Yes | Yes |
| Access content with a FREE Power BI license in Powerbi.com   and Power BI mobile | No | No | Yes |
| Access content with a FREE Power BI license embedded in MS Office apps | No | Yes | Yes |

### Power BI now offers three SKUs for embedding: A SKUs, EM SKUs, and P SKUs. Which one should I purchase for my scenario?

|  |A SKU (Power BI Embedded)  |EM SKU (Power BI Premium)  |P SKU (Power BI Premium)  |
|---------|---------|---------|---------|
|Purchase  |Azure portal |Office |Office |
|Use cases | Embed content in your own application | <li> Embed content in your own application <br><br><br> <li> Embed content in MS Office applications: <br> - [SharePoint](https://powerbi.microsoft.com/blog/integrate-power-bi-reports-in-sharepoint-online/) <br> - [Teams (excludes mobile app)](https://powerbi.microsoft.com/blog/power-bi-teams-up-with-microsoft-teams/) <br> - [Dynamics 365](https://docs.microsoft.com/dynamics365/customer-engagement/basics/add-edit-power-bi-visualizations-dashboard) | <li> Embed content in your own application <br><br><br> <li> Embed content in MS Office applications: <br> - [SharePoint](https://powerbi.microsoft.com/blog/integrate-power-bi-reports-in-sharepoint-online/) <br> - [Teams (excludes mobile app)](https://powerbi.microsoft.com/blog/power-bi-teams-up-with-microsoft-teams/) <br> - [Dynamics 365](https://docs.microsoft.com/dynamics365/customer-engagement/basics/add-edit-power-bi-visualizations-dashboard) <br><br><br> <li> Share content with Power BI users through the [Power BI service](https://powerbi.microsoft.com/)  |
|Billing |Hourly |Monthly |Monthly |
|Commitment  |No commitment |Yearly  |Monthly/Yearly |
|Differentiation |Full elasticity- can scale up/ down, pause/ resume resources in Azure portal or through API  |You can use to embed content in SharePoint Online and Microsoft Teams (excludes mobile app) |Combine embedding in applications and use the Power BI Service in the same capacity |

### What is Power BI Embedded's authentication model?

Power BI Embedded continues to use Azure AD for master user (a designated Power BI Pro licensed user) authentication, or with [service principal](embed-service-principal.md) for authenticating the application inside Power BI.  

 An ISV can implement their own authentication and authorization for their applications.

You can use your existing directory if you already have an Azure AD tenant. You can also create a new Azure AD tenant for your embedded application content security.

To get an AAD token, you can use one of the [Azure Active Directory Authentication Libraries](https://docs.microsoft.com/azure/active-directory/develop/active-directory-authentication-libraries). There are client libraries available for multiple platforms.
