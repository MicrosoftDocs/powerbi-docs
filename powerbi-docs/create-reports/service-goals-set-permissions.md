---
title: Protect your scorecards with goal level permissions (preview)
description: Set up goal level permissions.
author: maggiesMSFT
ms.author: maggies
ms.reviewer: 'cnews'
featuredvideoid: ''
ms.service: powerbi
ms.subservice: pbi-reports-dashboards
ms.topic: how-to
ms.date: 11/01/2021
---
# Protect your scorecards with goal level permissions (preview)

In many organizations, different roles should have access to view and update different goals. For example, maybe only managers should see goals related to human resources and finances, while all employees can view goals related to operations.  
 
With goal level permissions, these scenarios are easily accomplished.  In this article, we go over how to set up goal level permissions for your scorecard.

## Get started 

Goal level permissions lets you set specific view and update permissions at the goal level to help achieve your business scenario.  
  
Follow these steps to get started setting up your permissions.

1.	On the **Goals** hub page, select the scorecard you want to update.
2.	Select the **Edit** pencil.
3.	Select the **Settings** cog to open the **Scorecard settings** pane. 
4.	Select the new **Permissions** tab. 
5.	Select **Add role** or select **More options (...)** for an existing role to open the  **Role settings** page.

    :::image type="content" source="media/service-goals-create/goals-permissions-settings-pane.png" alt-text="Open goal level permissions by accessing the scorecard settings and selecting permissions.":::

On the **Role settings** page, you  can create roles with different permission sets and assign those roles to specific user groups. We support different types of permissions at the goal level:

- **View permissions**: Grant access for users to view specified goals within a scorecard.
- **Update permissions**: Grant access for users to update or check in specific aspects of a goal. There are a few options available under update permissions. You can select any combination of the following:

    - **Note**: Grants access to add notes in a check-in.
    - **Status**: Grants access to update status in a check-in.
    - **Current**: Grants access to update the current value in a check-in  

:::image type="content" source="media/service-goals-create/goals-permissions-create-role.png" alt-text="A snapshot of the goal level permission settings open and editable.":::

### Inheritence 

The last checkbox we have when it comes to permission settings is **Set for all**.  This checkbox supports inheritance for any and all future subgoals.  If you select **Set for all**  for a specific goal, all subgoals (existing and future) will adopt the specific permissions you set for that goal.  This allows you to future proof your goal level permissions.

## Set a default

Another aspect of goal level permissions is enabling a *default* permission model that's applied to anyone accessing the scorecard.  You can create a role with any combination of permissions you choose, and make that the default permissions, ensuring that any time anyone lands on the scorecard, they’re seeing exactly what the scorecard author selects.    

The default permissions apply to anyone accessing the scorecard who is not a member of another role already.  If someone is a member of another role, they assume those permissions over the default permissions. 

- Select **More options (...)** in the role card and select **Set as default**.

    :::image type="content" source="media/service-goals-create/goals-permissions-create-default.png" alt-text="Set a role to become the default role by choosing it from the overflow menu.":::

Goal level permissions roles apply to the underlying scorecard dataset we generate, with the exception of the default role. For example, if I create a role and assign the sales team view access to five goals on the scorecard, those are the five goals they will see in the underlying dataset as well. 

Default permissions do *not* apply to the underlying dataset. If I give view permissions to all goals as the default role, anyone who adopts those default permissions will not have access to any goals in the underlying dataset.

## Share the scorecard

After you've created roles and set up permissions, the final step is to share the scorecard with users.  

- Select the **Share** button in the ribbon, same as you would share a normal report.  

    If you don't want to give permissions to the underlying scorecard dataset, in the Share dialog clear the option **Allow recipients to build content with the data associated with this report**. to give build permissions to the underlying report.

## Additional Information
-	The support for automatic roles based on goal level permissions (full row-level security (RLS) support) is coming, but isn't yet available.
