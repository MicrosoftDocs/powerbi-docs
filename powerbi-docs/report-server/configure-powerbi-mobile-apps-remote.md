---
title: Configure Power BI iOS mobile apps for report servers remotely
description: Learn how to configure the iOS mobile apps remotely for your report server.
author: maggiesMSFT
manager: kfile
ms.reviewer: ''

ms.service: powerbi
ms.component: powerbi-report-server
ms.topic: conceptual
ms.date: 05/18/2018
ms.author: maggies

---
# Configure Power BI iOS mobile apps for report servers remotely

In this article, learn how to use your organization's MDM tool to configure Power BI iOS mobile apps with Report Server details. 

Power BI mobile app users can then connect to their organization's report server more easily because the administrator is managing configuration. 

To set this up, the administrator creates an app configuration policy with the required information to be pushed to the app.  

## Create the app configuration policy in MDM tool 

As admin you need to connect your MDM tool, and create a new app configuration policy. 

Choose to which users you want to distribute this app configuration policy. 

After you give a name to the newly created app configuration policy, you need to create a key-value pairs as the following: 


|Key  |Type  |Description  |
|---------|---------|---------|
| com.microsoft.powerbi.mobile.ServerURL | String | Report Server URL </br> Should start with http/https |
| com.microsoft.powerbi.mobile.ServerUsername | String | [optional] </br> 
The username to use for connecting the server. </br> If one does not exist, the app prompts the user to type the username for the connection.| 
| com.microsoft.powerbi.mobile.ServerDisplayName | String | [optional] </br> Default value is “Report server” </br> A friendly name used in the app to represent the server | 
| com.microsoft.powerbi.mobile.OverrideServerDetails | Boolean | Default value is True </br> If set to “True” then this overrides any Report Server definition already in the mobile device (existing servers already configured will be deleted). </br> Override set to True also prevents the user from removing that configuration. </br> Set to “False” adds the pushed values, leaving any existing settings. </br> If the same server URL is already configured in the mobile app, then the app leaves that configuration as is and doesn't ask the user to re-authenticate  for the same server. |

Here's an example of the app configuration policy defined using Intune: 

 

The steps and experience of building the app configuration policy might vary between MDM tools. The explanation above describes the steps relevant for Intune only. 

Once you publish the app configuration policy, users/devices that belong to the distribution list defined for it will get the below experience once they launch their Power BI Mobile app (iOS only): 

Get a message notifying them that their mobile app was configured with Report Server  

 

Once the user chooses “sign in” he will be taken to the Report Server login page, where the report server details will be pre-populated 

ShapeShape 

When the user connects, then he will be requested to provide a password to authenticate 

Shape 


## Next steps
[Administrator handbook](admin-handbook-overview.md)  
[Install Power BI Report Server](install-report-server.md)  

More questions? [Try asking the Power BI Community](https://community.powerbi.com/)

