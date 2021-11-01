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
# Goals and Power Automate

Many organizations want to use scorecards as part of processes that help them achieve results more quickly. However, manually monitoring scorecards can be resource intensive and error prone. In this documentation, we’ll go over how this capability helps you automate business processes when important changes happen within your scorecard. It helps organization quickly respond to changing conditions by keeping everyone up to date and taking automated actions to improve outcomes. This new capability is very easy to use because you can launch Power Automate directly from your scorecard and immediately construct your automated flow.   

## Getting started

First get to the scorecard that will relate to your flow.  You can find the create a flow button in the ribbon.

    :::image type="content" source="media/service-goals-create/flow-from-ribbon.png" alt-text="Access power automate by clicking the create a flow button in the ribbon.":::

## Actions and Triggers

For now, we are offering standalone actions and triggers, so to get started click ‘create your own flow’ and search for Power BI in the connector search area and click Power BI.

    :::image type="content" source="media/service-goals-create/PBI-connector.png" alt-text="A list of actions and triggers after selecting the PBI connector.":::
    
Here, you can browse the list of actions and triggers. 

    :::image type="content" source="media/service-goals-create/goals-actions.png" alt-text="A list of the available actions in Power BI Goals.":::
    :::image type="content" source="media/service-goals-create/goals-triggers.png" alt-text="A list of the available triggers in Power BI Goals.":::

<b>Actions: </b>
-	Create a goal   
-	Create a check-in  
-	Add a note to a check in 
-	Create a scorecard 
-	Update a check-in 
-	Update a goal  
-	Get goal(s) 
-	Get goal check-in(s) 

<b>Triggers: </b>
-	When a goal changes (e.g., status, owner, etc.) 
-	When someone adds or edits a check-in 
-	When an owner is assigned to a goal  
-	When a data refresh for a goal fails 



From here, you can create and customize your flows to help automate business processes related to your scorecards. Using Power Automate with your Power BI goals helps your teams and organization respond more quickly to changing conditions, and to easily use data to take better actions. 

    :::image type="content" source="media/service-goals-create/example-goals-flow.png" alt-text="An example of a flow you can set up in Power Automate for your scorecard.":::
    
For more information on what each action and trigger does, you can see the documentation for each one by clicking the information icon to the right of each item, and seeing “more info,” or visiting this website: https://docs.microsoft.com/connectors/powerbi/#create-a-goal-(preview)

    :::image type="content" source="media/service-goals-create/more-info-goals.png" alt-text="Information icon highlighted next to each action and trigger.":::
    :::image type="content" source="media/service-goals-create/docs-for-goals.png" alt-text="A snapshot of the documentation screen for each action and trigger.":::

## Next Steps

<b>Templates</b>

Templates will allow you to choose a flow that matches closely to your more complex business scenarios, and ensure you have the building blocks you need to automate your process. This will be rolling out in the coming weeks and we will update the documentation accordingly. A sneak peak at just a few of the scenarios we'll be enabling:  
  
•	Triggering a teams notification when a status changes to “behind” or "at risk"  
•	Sending reminders to team members at a specified interval with a link to a scorecard or specific goals to review 
•	Notifying a specific team member when they are assigned to a new goal and should perform a check-in 
•	Sending a forms survey that gets added as a check-in note on a goal at a specified interval  
•	Sending a congratulations email when a team completes a goal  

<b>More info</b>
For more information on creating flows, see the Power automate documentation. https://docs.microsoft.com/power-automate/getting-started
