---
title: Object-level security (OLS) with Power BI
description: How to configure object-level security for imported semantic models, within the Power BI service.
author: mberdugo
ms.author: monaberdugo
ms.reviewer:
ms.service: powerbi
ms.subservice: powerbi-developer
ms.topic: how-to
ms.date: 08/01/2023
---

# Object level security (OLS)

Object-level security (OLS) enables model authors to secure specific tables or columns from report viewers. For example, a column that includes personal data can be restricted so that only certain viewers can see and interact with it. In addition, you can also restrict object names and metadata. This added layer of security prevents users without the appropriate access levels from discovering business critical or sensitive personal information like employee or financial records. For viewers that don’t have the required permission, it's as if the secured tables or columns don't exist.  

## Create a report that uses OLS

Like RLS, OLS is also defined within model roles. Currently, you can't create OLS definitions natively in Power BI Desktop.

To create roles on **Power BI Desktop** semantic models, use [external tools](../transform-model/desktop-external-tools.md) such as [Tabular Editor](https://tabulareditor.com).  

### Configure object level security using tabular editor

1. In Power BI Desktop, [create the model](service-admin-rls.md#define-roles-and-rules-in-power-bi-desktop) that will define your OLS rules.

2. On the **External Tools** ribbon, select **Tabular Editor**. If you don’t see the Tabular Editor button, install the [program](https://tabulareditor.com). When open, Tabular Editor will automatically connect to your model.
  :::image type="content" source="./media/service-admin-ols/external-tools.png" alt-text="Screenshot of External tools Menu.":::

3. In the **Model** view, select the drop-down menu under **Roles**. The roles you created in step one will appear.
  :::image type="content" source="./media/service-admin-ols/display-roles.png" alt-text="Screenshot of roles names being displayed under roles folder in model view.":::

4. Select the role you want to enable an OLS definition for, and expand the **Table Permissions**.
   :::image type="content" source="./media/service-admin-ols/open-permissions.png" alt-text="Screenshot showing where to access the table permissions for OLS.":::

5. Set the permissions for the table or column to *None* or *Read*.

   **None**: OLS is enforced and the table or column will be hidden from that role  
   **Read**: The table or column will be visible to that role

   ### [To secure the **whole table**](#tab/table)

   Set categories under *Table permissions* to *None*.
    :::image type="content" source="./media/service-admin-ols/define-rule-table.png" alt-text="Screenshot of setting OLS rule to none for the entire table.":::

   ### [To secure a **specific column**](#tab/column)

   Select the category and set the *Object Level Security* to *None*.
    :::image type="content" source="./media/service-admin-ols/define-rule-column.png" alt-text="Screenshot of setting OLS rule to none for the address column." lightbox="./media/service-admin-ols/define-rule-column.png":::
  
   ---

6. After you define object-level security for the roles, save your changes.
  :::image type="content" source="./media/service-admin-ols/save-roles.png" alt-text="Screenshot of saving role definitions.":::

7. In Power BI Desktop, publish your semantic model to the Power BI Service.

8. In the Power BI Service, navigate to the **Security** page by selecting the **more options** menu on the semantic model, and assign members or groups to their appropriate roles.

The OLS rules are now defined. Users without the required permission will receive a message that the field can't be found for all report visuals using that field.

:::image type="content" source="./media/service-admin-ols/error-message.png" alt-text="Screenshot of error message saying that column cannot be found or may not be used in this expression.":::

## Considerations and limitations

* OLS only applies to *Viewers* in a workspace. Workspace members assigned *Admin*, *Member*, or *Contributor* have edit permission for the semantic model and, therefore, OLS doesn’t apply to them. Read more about [roles in workspaces](../collaborate-share/service-roles-new-workspaces.md).

* Semantic models with OLS configured for one or more table or column objects aren't supported with these Power BI features:

  * Q&A visualizations
  * Quick insights visualizations
  * Smart narrative visualizations
  * Excel Data Types gallery

* [See other OLS restrictions](/analysis-services/tabular-models/object-level-security#restrictions)

## Related content

* [Object-level security in Azure Analysis Services](/analysis-services/tabular-models/object-level-security)
* [Power BI implementation planning: Report consumer security planning](/power-bi/guidance/powerbi-implementation-planning-security-report-consumer-planning#object-level-security)
* Questions? [Try asking the Power BI Community](https://community.powerbi.com/)
* Suggestions? [Contribute ideas to improve Power BI](https://ideas.powerbi.com/)
