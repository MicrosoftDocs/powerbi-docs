---
title: Embed paginated reports in your Power BI embedded analytics application
description: Learn how to integrate or embed a Power BI paginated report into an embedded analytics application.
author: mberdugo
ms.author: monaberdugo
ms.reviewer: 
ms.topic: how-to
ms.service: powerbi
ms.subservice: powerbi-developer
ms.custom: ''
ms.date: 01/08/2024

---

# Embed Power BI paginated reports

With Power BI embedded analytics, you can create Power BI content that displays [paginated reports](../../paginated-reports/paginated-reports-report-builder-power-bi.md) in a fully integrated and interactive application. Embed paginated reports using the solution that works best for you, [embed for your customers](embedded-analytics-power-bi.md#embed-for-your-customers) or [embed for your organization](embedded-analytics-power-bi.md#embed-for-your-organization).

This article describes how to embed paginated reports using the embedding sample tutorials.

## Prerequisites

To get started, you need:

## [Embed for your customers](#tab/customers)

* A [service principal](embed-service-principal.md)

* Your own [Microsoft Entra tenant](create-an-azure-active-directory-tenant.md) setup

* A [capacity](#step-2---create-a-capacity)

If you don't have an Azure subscription, create a [free account](https://azure.microsoft.com/free/?WT.mc_id=A261C142F) before you begin.

## [Embed for your organization](#tab/organization)

* A [Power BI Pro license](../../enterprise/service-admin-purchasing-power-bi-pro.md) or Premium Per User (PPU) license.

* You must have your own [Microsoft Entra tenant](create-an-azure-active-directory-tenant.md) setup.

* A Premium capacity. See [what size Premium capacity do I need for paginated reports?](../../paginated-reports/paginated-reports-faq.yml#what-capacity-size-do-i-need-for-paginated-reports-)

If you don't have **Power BI Pro**, [sign up for a free trial](https://powerbi.microsoft.com/pricing/) before you begin.

---

## Method

To embed a paginated report using the sample app, follow these steps:

1. [Create a workspace](#step-1---create-a-workspace).

1. [Create a capacity](#step-2---create-a-capacity).

1. [Assign a workspace to a capacity](#step-3---assign-a-workspace-to-a-capacity).

1. [Create and upload your paginated report](#step-4---create-and-upload-your-paginated-report).

1. [Embed content using the sample application](#step-5---embed-content-using-the-sample-application).

## Step 1 - Create a workspace

### [Embed for your customers](#tab/customers)

As you're using a [service principal](embed-service-principal.md) to sign into your application, you need to create a [workspace](../../collaborate-share/service-create-the-new-workspaces.md).

Your *service principal* must also be an admin or member of the Power BI workspaces.

### [Embed for your organization](#tab/organization)

In Power BI service, create a workspace for your paginated report.

---

## Step 2 - Create a capacity

### [Embed for your customers](#tab/customers)

Before you import or upload a paginated report to embed, you must assign the workspace containing the report to a capacity. There are two types of capacity you can choose from:

* **Power BI Premium** - To embed a paginated report, you need an *EM* or *P* SKU. For more information about this subscription, see [What is Power BI Premium?](../../enterprise/service-premium-what-is.md).
* **Azure Power BI Embedded** - You can purchase a capacity from the [Microsoft Azure portal](https://portal.azure.com). This subscription uses the *A* SKUs. For details on how to create a Power BI Embedded capacity, see [Create Power BI Embedded capacity in the Azure portal](azure-pbie-create-capacity.md).

The following table describes the resources and limits of each SKU. To determine which capacity best fits your needs, see the [which SKU should I purchase for my scenario](./embedded-faq.yml#which-solution-should-i-choose-) table.

| Capacity Nodes | V-cores | RAM (GB) |
| --- | --- | --- |
| EM1/A1 | 1 |  2.5 |
| EM2/A2 | 2 |  5   |
| EM3/A3 | 4 | 10   |
| P1/A4 |  8 |  25 |
| P2/A5 | 16 |  50 |
| P3/A6 | 32 | 100 |

### [Embed for your organization](#tab/organization)

By creating a capacity, you can take advantage of having a resource for the content in your app workspace. For paginated reports, you must back your app workspace with an *EM* or a *P* capacity. You can create a capacity with [Power BI Premium](../../enterprise/service-premium-what-is.md).

The following table lists the Power BI Premium SKUs that create a capacity for paginated reports in [Microsoft Office 365](/microsoft-365):

| Capacity node | V-cores | RAM (GB) | DirectQuery/live connection limits (per sec) |
| --- | --- | --- | --- |
| EM1/A1 |   1 |     |  3.75 |
| EM2/A2 |   2 |     |  7.5 |
| EM3/A3 |   4 |     | 15  |
| P1/A4  |   8 |  25 |  30 |
| P2/A5  |  16 |  50 |  60 |
| P3/A6  |  32 | 100 | 120 |
| P4     |  64 | 200 | 240 |
| P5     | 128 | 400 | 480 |

---

## Step 3 - Assign a workspace to a capacity

### [Embed for your customers](#tab/customers)

Once you create a capacity, assign your app workspace to that capacity.

To assign a capacity to a workspace using a [service principal](embed-service-principal.md), work with the [Power BI REST API](/rest/api/power-bi/capacities/groups_assigntocapacity). When you're using the Power BI REST APIs, make sure to work with the [service principal object ID](embed-service-principal.md).

>[!NOTE]
>You can also import paginated reports into a workspace using the [Power BI REST APIs](/rest/api/power-bi/imports/postimportingroup).

### [Embed for your organization](#tab/organization)

After you create a capacity, assign your workspace to that capacity. To complete the process, follow these steps:

1. Within the Power BI service, expand workspaces and select **More** for the workspace you're using to embed your content. Then select **Workspace settings**.

    :::image type="content" source="media/embed-paginated-reports/workspace-settings.png" alt-text="A screenshot that shows how to select Workspace settings.":::

1. Select **Premium** and the license mode for the capacity you created. Then select **Save**.

1. After you save the changes, a diamond icon appears next to the app workspace name.

    :::image type="content" source="media/embed-paginated-reports/diamond.png" alt-text="A screenshot that shows the diamond icon next to the app workspace name.":::

---

## Step 4 - Create and upload your paginated report

You can create your paginated report using [Power BI Report Builder](../../paginated-reports/paginated-reports-report-builder-power-bi.md#create-reports-in-power-bi-report-builder), and then [upload the report to the service](../../paginated-reports/paginated-reports-quickstart-aw.md#upload-the-report-to-the-service).

>[!NOTE]
>The person who uploads the paginated report needs a Power BI Pro or Premium Per User (PPU) license to publish to a workspace.

## Step 5 - Embed content using the sample application

### [Embed for your customers](#tab/customers)

Follow the steps in the [embed content for your customers](embed-sample-for-customers.md) tutorial. Skip [Step 4 - Create and publish a Power BI report](embed-sample-for-customers.md#step-4---create-and-publish-a-power-bi-report) and work with the paginated report you uploaded, instead of the sample report suggested in the tutorial.

* To use a **Power BI semantic model** as a data source:

  * Make sure the tenant setting [*Allow XMLA endpoints and Analyze in Excel with on-premises datasets*](../../enterprise/service-premium-connect-tools.md#security) is enabled.
  * In the Power BI portal, set the **XMLA endpoint** to *Read Only* or *Read Write* as described in [enable read-write for a Premium capacity](/power-bi/enterprise/service-premium-connect-tools#to-enable-read-write-for-a-premium-capacity). You only need to set up the endpoint once per capacity.
  * Generate a [multi-resource embed token](/rest/api/power-bi/embed-token/generate-token) with the [dataset ID](/rest/api/power-bi/embed-token/generate-token#generatetokenrequestv2dataset) specified in the request, and the [XmlaPermissions](/rest/api/power-bi/embed-token/generate-token#xmlapermissions) set to *Read Only*.

* To use a **single sign-on (SSO)** enabled data source:

  * Power BI supports SSO-enabled data sources if the data sources directly connect to the paginated report or connect to a Power BI semantic model that's the data source of the paginated report.
  * When you embed a paginated report with SSO-enabled data sources, you must provide the identity blob for the data source in the [`DatasourceIdentity`](/rest/api/power-bi/embed-token/generate-token#datasourceidentity) at the time you generate a [multi-resource embed token](/rest/api/power-bi/embed-token/generate-token).

### [Embed for your organization](#tab/organization)

Follow the steps in the [embed content for your organization](embed-sample-for-your-organization.md) tutorial.

Skip [Step 3 - Create and publish a Power BI report](embed-sample-for-your-organization.md#step-3---create-and-publish-a-power-bi-report) and work with the paginated report you uploaded, instead of the sample report suggested in the tutorial.

---

For more information on embedding tokens, see [Embedded analytics access tokens](embed-tokens.md).

## Considerations and limitations

### [Embed for your customers limitations](#tab/customers)

* For a full list of supported datasets and their authentication methods, see [Supported data sources for Power BI paginated reports](../../paginated-reports/paginated-reports-data-sources.md#natively-supported-data-sources).
* You must use a **service principal**. You can't have a master user.
* You can't work with a [Premium Per User (PPU)](../../enterprise/service-premium-per-user-faq.yml).
* When you embed a paginated report with a Power BI semantic model, two conditions apply:
  * The paginated report and the Power BI semantic model must reside in a Premium per capacity or Embedded workspace (they can reside in two different workspaces).
  * The person who generates the embed token must have *Write* permissions in the workspaces of both the report and the semantic model.
* You can't currently embed a paginated report connected to Azure Analysis Services with single sign-on (SSO) enabled.

### [Embed for your organization limitations](#tab/organization)

* If you work with a [Premium Per User (PPU)](../../enterprise/service-premium-per-user-faq.yml) license, only PPU users in your organization can access your solution.

---

* Paginated reports don't support client-side events (like `loaded` or `rendered`).
* Paginated reports don't support client-side setAccessToken API (you can not update acccess token without reloading the report).
* Embedding paginated reports with a real-time dataset (push dataset) is not supported.

## Related content

* [Tutorial: Embed a Power BI report in an application for your organization](embed-organization-app.md)
* [Capacity and SKUs in Power BI embedded analytics](embedded-capacity.md)
* [Considerations when generating an embed token](generate-embed-token.md)
