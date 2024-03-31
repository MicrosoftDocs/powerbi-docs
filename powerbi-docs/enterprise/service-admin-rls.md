---
title: Row-level security (RLS) with Power BI
description: How to configure row-level security for imported semantic models, and DirectQuery, within the Power BI service.
author: mberdugo
ms.author: monaberdugo
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-admin
ms.topic: how-to
ms.date: 09/12/2022
ms.custom: ''
LocalizationGroup: Administration
no-loc: [Copilot]
---

# Row-level security (RLS) with Power BI

Row-level security (RLS) with Power BI can be used to restrict data access for given users. Filters restrict data access at the row level, and you can define filters within roles. In the Power BI service, users with access to a workspace have access to semantic models in that workspace. RLS only restricts data access for users with **Viewer** permissions. It doesn't apply to Admins, Members, or Contributors.

You can configure RLS for data models imported into Power BI with Power BI. You can also configure RLS on semantic models that are using DirectQuery, such as SQL Server. For Analysis Services or Azure Analysis Services lives connections, you configure Row-level security in the model, not in Power BI. The security option doesn't show up for live connection semantic models.

[!INCLUDE [include-short-name](../includes/rls-desktop-define-roles.md)]

By default, row-level security filtering uses single-directional filters, whether the relationships are set to single direction or bi-directional. You can manually enable bi-directional cross-filtering with row-level security by selecting the relationship and checking the **Apply security filter in both directions** checkbox. Note that if a table takes part in multiple bi-directional relationships you can only select this option for one of those relationships. Select this option when you've also implemented dynamic row-level security at the server level, where row-level security is based on username or login ID.

For more information, see [Bidirectional cross-filtering using DirectQuery in Power BI](../transform-model/desktop-bidirectional-filtering.md) and the [Securing the Tabular BI Semantic Model](https://download.microsoft.com/download/D/2/0/D20E1C5F-72EA-4505-9F26-FEF9550EFD44/Securing%20the%20Tabular%20BI%20Semantic%20Model.docx) technical article.

 :::image type="content" source="media/service-admin-rls/rls-apply-security-filter.png" alt-text="Screenshot of the apply Security Filter.":::

## Define roles and rules in Power BI using enhanced row-level security editor (Preview)

You can quickly and easily define row-level security roles and filters within Power BI using the enhanced row-level security editor. With this editor, you can toggle between using the default drop-down interface and a DAX interface. When you publish to Power BI, you also publish the role definitions.

To define security roles using the enhanced row-level security editor:

1. In Power BI Desktop, enable the preview by going to Files > Options and Settings > Options > Preview features and turn on “Enhanced row-level security editor”. Alternatively you can use this editor in the Service by [editing your data model in the Power BI service](../transform-model/service-edit-data-models.md). 

2. Import data into your Power BI semantic model, or configure a DirectQuery connection.

3. From the ribbon, select **Manage roles**.

   :::image type="content" source="media/service-admin-rls/manage-roles-ribbon-button.png" alt-text="Screenshot of the Manage roles button in the Desktop ribbon.":::

4. From the **Manage roles** window, select **New** to create a new role.

   :::image type="content" source="media/service-admin-rls/enhanced-rls-new-role.png" alt-text="Screenshot of creating a new role in the enhanced row-level security editor.":::

5. Under **Roles**, provide a name for the role and select enter.

   :::image type="content" source="media/service-admin-rls/enhanced-rls-rename-role.png" alt-text="Screenshot of renaming a role in the enhanced row-level security editor.":::

6. Under **Select tables**, select the table you want to apply a row-level security filter to.

7. Under **Filter data**, use the default editor to define your roles. The expressions created return a true or false value.

   :::image type="content" source="media/service-admin-rls/enhanced-rls-example-default-editor.png" alt-text="Screenshot of an example of using the default editor in the enhanced row-level security editor.":::

   >[!NOTE]
   > Not all row-level security filters supported in Power BI can be defined using the default editor. Limitations include expressions that today can only be defined using DAX including dynamic rules such as username() or userprincipalname(). To define roles using these filters switch to use the DAX editor.

8. Optionally select **Switch to DAX editor** to switch to use the DAX editor to define your role. You can switch back to the default editor by selecting **Switch to default editor**. All changes made in either editor interface persist when switching interfaces when possible.

   :::image type="content" source="media/service-admin-rls/enhanced-rls-example-dax-editor.png" alt-text="Screenshot of an example of using the dax editor in the enhanced row-level security editor.":::

   When defining a role using the DAX editor that can't be defined in the default editor, if you attempt to switch to the default editor you'll be prompted with a warning that switching editors may result in some information being lost. To keep this information, select **Cancel** and continue only editing this role in the DAX editor.

   :::image type="content" source="media/service-admin-rls/enhanced-rls-parse-warning-dialog.png" alt-text="Screenshot of an example error dialog when switching from the DAX to default editor in enhanced row-level security editor.":::

9. Select **Save**

[!INCLUDE [include-short-name](../includes/rls-desktop-view-as-roles.md)]

## Manage security on your model

To manage security on your semantic model, open the workspace where you saved your semantic model in the Power BI service and do the following steps:

1. In the Power BI service, select the **More options** menu for a semantic model. This menu appears when you hover on a semantic model name, whether you select it from the navigation menu or the workspace page.

    :::image type="content" source="media/service-admin-rls/dataset-leftnav-more-options.png" alt-text="Screenshot showing the more options menu in the workspace.":::

    :::image type="content" source="media/service-admin-rls/dataset-canvas-more-options.png" alt-text="Screenshot showing the more options menu in navigation menu.":::

1. Select **Security**.

    :::image type="content" source="media/service-admin-rls/dataset-more-options-menu.png" alt-text="Screenshot showing the more options menu with Security selected.":::

Security takes you to the Role-Level Security page where you add members to a role you created. Contributor (and higher workspace roles) will see **Security** and can assign users to a role.

## Working with members

### Add members

In the Power BI service, you can add a member to the role by typing in the email address or name of the user or security group. You can't add Groups created in Power BI. You can add members [external to your organization](../guidance/whitepaper-azure-b2b-power-bi.md#data-security-for-external-partners).

You can use the following groups to set up row level security.

- Distribution Group
- Mail-enabled Group
- [Microsoft Entra Security Group](/azure/active-directory/fundamentals/groups-view-azure-portal)

Note, however, that Microsoft 365 groups aren't supported and can't be added to any roles.

 :::image type="content" source="media/service-admin-rls/rls-add-member.png" alt-text="Screenshot showing how to add a member.":::

You can also see how many members are part of the role by the number in parentheses next to the role name, or next to Members.

 :::image type="content" source="media/service-admin-rls/rls-member-count.png" alt-text="Screenshot showing members in role.":::

### Remove members

You can remove members by selecting the X next to their name.

 :::image type="content" source="media/service-admin-rls/rls-remove-member.png" alt-text="Screenshot showing how to remove a member.":::

## Validating the role within the Power BI service

You can validate that the role you defined is working correctly in the Power BI service by testing the role.

1. Select **More options** (...) next to the role.
2. Select **Test as role**.

 :::image type="content" source="media/service-admin-rls/rls-test-role.png" alt-text="Screenshot of test as role option.":::

You're redirected to the report that was published from Power BI Desktop with this semantic model, if it exists. Dashboards aren't available for testing using the  **Test as role** option.

In the page header, the role being applied is shown. Test other roles, a combination of roles, or a specific person by selecting **Now viewing as**. Here you see important permissions details pertaining to the individual or role being tested. For more information about how permissions interact with RLS, see [RLS user experience](../guidance/powerbi-implementation-planning-security-report-consumer-planning.md#rls-user-experience).

 :::image type="content" source="media/service-admin-rls/rls-test-role2.png" alt-text="Screenshot of Now viewing as dropdown for a specific person.":::

Test other reports connected to the semantic model by selecting **Viewing** in the page header. You can only test reports located in the same workspace as your semantic model.

:::image type="content" source="media/service-admin-rls/rls-test-role3.png" alt-text="Screenshot of Viewing to select a different report to test.":::

To return to normal viewing, select **Back to Row-Level Security**.

> [!NOTE]
> The Test as role feature doesn't work for DirectQuery models with Single Sign-On (SSO) enabled. Additionally, not all aspects of a report can be validated in the Test as role feature including Q&A visualizations, Quick insights visualizations, and Copilot.

[!INCLUDE [include-short-name](../includes/rls-usernames.md)]

## Using RLS with workspaces in Power BI

If you publish your Power BI Desktop report to a [workspace](../collaborate-share/service-new-workspaces.md) in the Power BI service, the RLS roles are applied to members who are assigned to the **Viewer** role in the workspace. Even if  **Viewers** are given Build permissions to the semantic model, RLS still applies. For example, if Viewers with Build permissions use [Analyze in Excel](../collaborate-share/service-analyze-in-excel.md), their view of the data is restricted by RLS. Workspace members assigned **Admin**, **Member**, or **Contributor** have edit permission for the semantic model and, therefore, RLS doesn’t apply to them. If you want RLS to apply to people in a workspace, you can only assign them the **Viewer** role. Read more about [roles in workspaces](../collaborate-share/service-roles-new-workspaces.md).

[!INCLUDE [include-short-name](../includes/rls-limitations.md)]

[!INCLUDE [include-short-name](../includes/rls-faq.md)]

## Related content

- [Restrict data access with row-level security (RLS) for Power BI Desktop](../enterprise/service-admin-rls.md)
- [Row-level security (RLS) guidance in Power BI Desktop](../guidance/rls-guidance.md)
- [Power BI implementation planning: Report consumer security planning](/power-bi/guidance/powerbi-implementation-planning-security-report-consumer-planning#enforce-data-security-based-on-consumer-identity)
- [RLS for Embedded scenarios for ISVs](../developer/embedded/embedded-row-level-security.md)

Questions? [Try asking the Power BI Community](https://community.powerbi.com/)
Suggestions? [Contribute ideas to improve Power BI](https://ideas.powerbi.com/)
