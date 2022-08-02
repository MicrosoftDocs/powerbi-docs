---
title: Embed reports that use object-level security
description: How to embed a report that has object-level security (OLS).
author: mberdugo
ms.author: monaberdugo
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-developer
ms.topic: how-to
ms.date: 07/31/2022
---

# Object level security (OLS)

Object-level security (OLS) enables model authors to secure specific tables or columns from report viewers. For example, a column that includes personal data can be restricted so that only certain viewers can see and interact with it. In addition, you can also restrict object names and metadata. This added layer of security prevents users without the appropriate access levels from discovering business critical or sensitive personal information like employee or financial records. For viewers that don’t have the requisite permission, it's as if the secured tables or columns don't exist.  

## Create a report that uses OLS

Like RLS, OLS is also defined within model roles. Currently, you can't create OLS definitions natively in Power BI Desktop.

* To create rules on **Power BI Desktop** datasets, use external tools such as [Tabular Editor](https://tabulareditor.github.io/).  
* To create rules in **Power BI Service**, set the [XMLA endpoint](/power-bi/enterprise/service-premium-connect-tools) using [TMSL](/analysis-services/tmsl/tabular-model-scripting-language-tmsl-reference) or [TOM](/analysis-services/tom/introduction-to-the-tabular-object-model-tom-in-analysis-services-amo).

### Configure object level security using tabular editor

1. In Power BI Desktop, create the roles that will define your OLS rules. Select the **Manage Roles** button in the Modeling tab on the ribbon.
  :::image type="content" source="./media/embed-object-level-security/manage-roles.png" alt-text="Screenshot of creating roles in Desktop.":::

2. On the **External Tools** ribbon, select **Tabular Editor**. If you don’t see the Tabular Editor button, install the [program](https://tabulareditor.github.io). When open, Tabular Editor will automatically connect to your model.
  :::image type="content" source="./media/embed-object-level-security/external-tools.png" alt-text="Screenshot of External tools Menu.":::

3. In the **Model** view, select the drop-down menu under **Roles**. The roles created in the previous step will appear.
  :::image type="content" source="./media/embed-object-level-security/display-roles.png" alt-text="Screenshot of roles names being displayed under roles folder in model view.":::

4. Select the role you want to enable an OLS definition for, and set the rule to *None* or *Read*.
  :::image type="content" source="./media/embed-object-level-security/define-rule.png" alt-text="Screenshot of OLS rule defined on 3 out of 22 tables.":::

5. After you define object-level security for the roles, save your changes.
  :::image type="content" source="./media/embed-object-level-security/save-roles.png" alt-text="Screenshot of saving role definitions.":::

6. In Power BI Desktop, publish your dataset to the Power BI service. In the Power BI service, navigate to the **Security** page by selecting the **more options** menu on the dataset, and assign members or groups to their appropriate roles.

The OLS rules are now defined. Users who don't have the requisite permission will receive a message that the field doesn't exist for all report visuals using the field.

### Create rules for OLS using XMLA endpoints

To query the dataset directly or set up OLS rules with TOM or TMSL, first enable the XMLA endpoint, so you can use tools like SQL Server Management Studio (SSMS).

:::image type="content" source="./media/embed-object-level-security/set-xmla-endpoints.png" alt-text="Screenshot of setting XMLA endpoints.":::

If a user does a direct query but doesn’t have access to OLS secured objects, the error message returned will be the same error message as if the objects did't exist.

:::image type="content" source="./media/embed-object-level-security/error-message.png" alt-text="Screenshot showing error message that column can't be found or may not be used.":::

## Embed a report that use object level security

The process of [generating embed tokens](generate-embed-token.md#row-level-security) for items that use OLS is the same as for RLS.

If the report you want to embed is using one of the following scenarios, you might need to take some extra steps:

* [Paginated reports](embed-paginated-reports.md)
* [SQL Server Analysis Services (SSAS)](sql-server-analysis-services-embed.md)
* Azure AD
* Single sign-on

## Considerations and limitations

* Datasets with OLS configured for one or more table or column objects aren't supported with these Power BI features:

  * Q&A visualizations
  * Quick insights visualizations
  * Smart narrative visualizations
  * Excel Data Types gallery

* Row-level security and object-level security can't be combined from different roles because it could introduce unintended access to secured data. An error is generated at query time for users who are members of such a combination of roles.

* Dynamic calculations (measures, KPIs, DetailRows) are automatically restricted if they reference a secured table or column. While you can't explicitly secure a measure, you can implicitly secure a measure by updating the expression to refer to a secured table or column.

* Relationships that reference a secured column work, as long as the column's table the column isn't secured.

## Next steps

[Object-level security in Azure Analysis Services](/analysis-services/tabular-models/object-level-security)
