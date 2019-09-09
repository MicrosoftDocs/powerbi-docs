---
title: Data lineage (Preview)
description: 
author: maggiesMSFT
manager: kfile
ms.reviewer: 

ms.service: powerbi
ms.topic: conceptual
ms.date: 08/29/2019
ms.author: maggies

LocalizationGroup: 
---
# Data lineage (Preview)
In modern BI projects, understanding the flow of data from the data source to its destination is a key challenge for many customers.
This challenge becomes even bigger if you have built advanced analytical projects spanning multiple data sources, artifacts, and dependencies.  Questions like "What happens if I change this data?" or "Why isn’t this report up to date?" are difficult to answer, and sometimes requires a team of experts or deep investigation to understand.
[update image]
 
In Power BI, there are multiple artifact types: dashboards, reports, datasets and dataflows, Those are connected to external data sources, like SQL server for example.
Datasets can be sourced from within the workspace or from another workspace, same applies for dataflows. in that case of external dependency it is very common that the IT or analyst that owns the dataset is not the same person as the analyst who creates the reports on top of it.
Power BI allows multiple users and multiple artifacts projects that spans across workspaces. For this complex projects and also for more simpler ones we introduce the lineage view. 
Lineage view provides you a view of all the workspace artifacts including its external dependencies. This is taking the Dataflows diagram view a step forward as it is not limited to only dataflows but shows all the workspace artifacts including the connections to the dataflows, both upstream and downstream.
Note: Diagram view (add link to doc) will be no longer exists starting on Nov 1st.

Get started
The lineage view works out of the box for any workspace that is different than my-workspace. To access the lineage view open one of your workspaces and use the menu on the upper right header to switch from list view to lineage view.
[update image]
 

What you see now is all of the workspace artifacts and how they are connected one to each other.
[Add image of lineage view]
You can also see the datasources from which datasets and dataflows get the data. On the datasources nodes you can see some more information that can assist you to identify the source. For example, for Azure SQL server you will see the also the database name.
 
If a datasource is connected via on-prem gateway you will see the gateway name if you have permissions as either Gateway Admin or a datasource user.
 
On datasets you can see the last refresh time, if a dataset is certified or promoted.
 
If you have in the workspace a report that is built on top of a dataset that is originated in another workspace, then you will see the source workspace name on the dataset card. Click on the workspace name will navigate to the external workspace.
 
Datasets, dataflows and soon reports and dashboards have the options menu available so you can do all the actions available for you on the list view.
  
To see more metadata on datasets you can click on the dataset node. Additional information on the dataset will be displayed on the side pane.
 

Highlight 
When you want to focus on a specific artifact and see only its lineage you can use the highlight action on the artifact card’s action panel. This way you will make the view clean and only the selected artifact connections will be displayed. 
 

Navigation and full screen
The lineage view is displayed on an interactive canvas. You can use the mouse and touchpad to navigate in the canvas in the zoom-in and out. 
To scroll up and down you can use the mouse scroll wheel or touchpad. 
To zoom in and out you can either use the menu on the bottom right or mouse/touchpad.
To get more real estate for the graph itself, you can use the full screen option on the bottom right menu.
 

Permissions
•	The lineage view is available only to users with access to the workspace.
•	Users are required to have at least write permissions to the workspace. Users with read only access will not be able to switch to the lineage view

Considerations and limitations
•	The lineage view is not available on Internet Explorer. See here the Power BI support matrix.
Note to content writer: the browsers support page should also be updated.
<snip>
Power BI runs in these browsers:
·         Microsoft Edge
·         Internet Explorer 11 
·         Chrome desktop latest version
·         Safari Mac latest version
·         Firefox desktop latest version - Firefox may change the fonts used in Power BI reports.
These browsers are supported on all platforms where they're available.
Some advanced features, such as lineage view, are not supported on Internet Explorer
 
</snip>

What’s coming next
•	Impact analysis on datasets. [add link to the release notes]
•	@Adi Regev , , do we want to tell here also about datasources impact analysis or is it too early?



