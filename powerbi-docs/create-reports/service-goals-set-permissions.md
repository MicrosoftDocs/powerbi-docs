---
title: Protect your scorecards with metric-level permissions
description: Set up metric-level permissions.
author: maggiesMSFT
ms.author: maggies
ms.reviewer: 'cnews'
featuredvideoid: ''
ms.service: powerbi
ms.subservice: pbi-reports-dashboards
ms.topic: how-to
ms.date: 06/29/2022
---
# Protect your scorecards with metric-level permissions

[!INCLUDE [applies-no-desktop-yes-service](../includes/applies-no-desktop-yes-service.md)]

In many organizations, different roles should have access to view and update different metrics. For example, maybe only managers should see metrics related to human resources and finances, while all employees can view metrics related to operations.  
 
With metric-level permissions, these scenarios are easily accomplished.  In this article, we go over how to set up metric-level permissions for your scorecard.

## Get started 

Metric-level permissions let you set specific view and update permissions at the metric level to help achieve your business scenario.  
  
Follow these steps to get started setting up your permissions.

1.	On the **Metrics** hub page, select the scorecard you want to update.
2.	Select the **Edit** pencil.
3.	Select the **Settings** cog to open the **Scorecard settings** pane. 
4.	Select the new **Permissions** tab. 
5.	Select **Add role** or select **More options (...)** for an existing role to open the  **Role settings** page.

    :::image type="content" source="media/service-goals-set-permissions/goals-permissions-settings-pane.png" alt-text="Screenshot of opening metric-level permissions by accessing the scorecard settings and selecting permissions.":::

On the **Role settings** page, you  can create roles with different permission sets and assign those roles to specific user groups. We support different types of permissions at the metric level:

- **View permissions**: Grant access for users to view specified metrics within a scorecard.
- **Update permissions**: Grant access for users to update or check in specific aspects of a metric. There are a few options available under update permissions. You can select any combination of the following options:

    - **Note**: Grants access to add notes in a check-in.
    - **Status**: Grants access to update status in a check-in.
    - **Current**: Grants access to update the current value in a check-in.

:::image type="content" source="media/service-goals-set-permissions/goals-permissions-create-role.png" alt-text="Screenshot of the metric-level permission settings open and editable.":::

### Inheritance 

The last checkbox for permission settings is **Set for all**.  This checkbox supports inheritance for all future submetrics.  If you select **Set for all**  for a specific metric, all submetrics (existing and future) will adopt the specific permissions you set for that metric.  This option allows you to future proof your metric-level permissions.

## Set a default

Another aspect of metric-level permissions is enabling a *default* permission model that's applied to anyone accessing the scorecard.  You can create a role with any combination of permissions you choose. If you make that the default permissions, then any time anyone lands on the scorecard, they see exactly what the scorecard author selects.    

The default permissions apply to anyone accessing the scorecard who is not a member of another role already.  If someone is a member of another role, they assume those permissions over the default permissions. 

- Select **More options (...)** in the role card and then select **Set as default**.

    :::image type="content" source="media/service-goals-set-permissions/goals-permissions-create-default.png" alt-text="Screenshot of setting a role to become the default role from the More options menu.":::

Metric-level permissions roles apply to the underlying scorecard semantic model we generate, with the exception of the default role. For example, say you create a role and assign the sales team view access to five metrics on the scorecard. Those five metrics are the ones they'll see in the underlying semantic model as well. 

Default permissions do *not* apply to the underlying semantic model. If I give view permissions to all metrics as the default role, anyone who adopts those default permissions will not have access to any metrics in the underlying semantic model.

## Share the scorecard

After you've created roles and set up permissions, the final step is to share the scorecard with users.  

- Select the **Share** button in the ribbon, same as you would share a normal report.  

    If you don't want to give permissions to the underlying scorecard semantic model, in the Share dialog clear the option **Allow recipients to build content with the data associated with this report** to give build permissions to the underlying report.

### Workspace roles and scorecard roles

Workspace roles are separate from metric level permissions roles.  While workspace permissions give view or build access to the workspace, with metric-level permissions you can restrict access so that certain people can only see certain metrics and perform check-ins within a scorecard. Metric-level permissions are different from workspace edit permissions. To give full edit access to the scorecard, assign someone a contributor or member role on the workspace. See [Roles in workspaces](../collaborate-share/service-roles-new-workspaces.md) for details about workspace roles.

## More information

The support for automatic roles based on metric-level permissions (full row-level security (RLS) support) is coming, but isn't yet available.

## Related content

- [Get started with metrics in Power BI](service-goals-introduction.md)
