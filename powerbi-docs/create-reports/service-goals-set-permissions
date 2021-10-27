---
title: Protect your scorecards with Goal Level Permissions (preview)
description: Set up goal level permissions to protect who sees and updates which goals.
author: maggiesMSFT
ms.author: maggies
ms.reviewer: ''
featuredvideoid: ''
ms.service: powerbi
ms.subservice: pbi-reports-dashboards
ms.topic: how-to
ms.date: 05/03/2021
---
# Protect your scorecards with Goal Level Permissions (preview)

In many organizations, different roles should have access to view and update different goals. For example, maybe only managers should see goal related to human resources and finances, while all employees can view goals related to operations.  
 
With goal level permissions, all these scenarios are easily accomplished.  In this article, we will go over how to set up goal level permissions for your scorecard.

## Getting started 

Goal level permissions lets you set specific view and update permissions at the goal level to help achieve your business scenario.  
  
To get started setting up your permissions, 
1.	Ensure you’re in edit mode
1.	Open the settings pane 
1.	Open the new permissions tab  

    :::image type="content" source="media/service-goals-create/goals-permissions-settings-pane.png" alt-text="Open goal level permissions by accessing the scorecard settings and selecting permissions.":::

The permissions tab allows you to create roles with different permission sets and assign those roles to specific user groups.
  
We support different types of permissions at the goal level:
1.	<b>View permissions:</b> grant access for users to view specified goals within a scorecard  
1.	<b>Update permissions:</b> grant access for users to update or check-in specific aspects of a goal.  There are a few options available under update permissions, and any combination of the following can be selected   
  a.	 <b>Note</b> – grants access to add notes in a check-in  
  b.	<b>Status</b> – grants access to update status in a check-in  
  c.	<b>Current Value</b> - grants access to update the current value in a check-in  

    :::image type="content" source="media/service-goals-create/goals-permissions-create-role.png" alt-text="Open goal level permissions by accessing the scorecard settings and selecting permissions.":::

## Inheritence 

The last checkbox we have when it comes to permission settings is "apply to all.”  This checkbox supports inheritance for any and all future subgoals.  If you turn on inheritance (or apply to all)  for a specific goal, all subgoals (existing and future) will adopt the specific permissions you set for that goal.  This allows you to future proof your goal level permissions.

## Setting a default

Another aspect of goal level permissions is enabling a "default" permission model that's applied to anyone accessing the scorecard.  You can create a role with any combination of permissions you choose, and make that the default permissions, ensuring that any time anyone lands on the scorecard, they’re seeing exactly what the scorecard author selects.    

The default permissions will apply to anyone accessing the scorecard who is not a member of another role already.  If someone is a member of another role, they will assume those permissions over the default permissions. 

    :::image type="content" source="media/service-goals-create/goals-permissions-create-default.png" alt-text="Set a role to become the default role by choosing it from the overflow menu.":::

Goal level permissions roles apply to the underlying scorecard dataset we generate, with the exception of the default role. For example, if I give create a role and assign the sales team view access to 5 goals on the scorecard, those are the five goals they will see in the underlying dataset as well. 

Default permissions do NOT apply to the underlying dataset, meaning if I give view permissions to all goals as the default role, anyone who adopts those default permissions will not have access to any goals in the underlying dataset.

## Sharing the scorecard

After your roles are created and permissions are set up, the final step is to share the scorecard with users.  Share the scorecard via the 'share' button in the ribbon, same as you would share a normal report.  If you do not want to give permissions to the underlying scorecard dataset, un-select the option to give build permissions to the underlying report in the share dialog.

## Additional Information
-	The support for automatic roles based on Goal Level permissions (full RLS support) is coming, but is not yet available.
