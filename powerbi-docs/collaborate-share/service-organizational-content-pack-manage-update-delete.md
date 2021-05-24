---
title: 'Organizational content packs: Manage and update'
description: Read about managing, updating, and deleting organizational content packs in Power BI.
author: maggiesMSFT
ms.author: maggies
ms.reviewer: lukaszp
ms.service: powerbi
ms.subservice: pbi-collaborate-share
ms.topic: how-to
ms.date: 05/18/2021
LocalizationGroup: Share your work
---
# Manage, update, and delete organizational content packs

> [!NOTE]
> Organizational content packs are being deprecated. Now is a good time to upgrade your content packs to apps, if you haven't started yet. See [Upgrade classic workspaces to the new workspaces in Power BI](service-upgrade-workspaces.md) for details.
> 

You can package up and share your dashboards, reports, Excel workbooks, and datasets with your colleagues as [organizational content packs](service-organizational-content-pack-introduction.md). Your colleagues can use them as-is, or they can create their own copies.

Creating content packs is different from sharing dashboards or collaborating on them in a group. Read [How should I collaborate on and share dashboards and reports?](service-how-to-collaborate-distribute-dashboards-reports.md) to decide on the best option for your situation.

You can only do some organizational content pack tasks if you're the content pack creator:

* Republish.
* Restrict or expand access to the content pack.
* Set and change scheduled refresh.
* Delete the content pack.

## Modify and re-publish an organizational content pack
If you make changes to the original content pack dashboard, report, or Excel workbook, Power BI prompts you to republish. Additionally, as the content pack creator, you can update any of the options you selected in the Create Content Pack window when you were creating the original content pack. 

## Republish with new content
When you make and save a change to the dashboard that you included in a content pack, Power BI reminds you to update it so others can see the changes. For example, if you pin a new tile or just change the name of the dashboard.

1. Select **View Content Packs** in the message.
   
   ![Screenshot of a message dialog to select View Content Packs.](media/service-organizational-content-pack-manage-update-delete/pbi_contpkchangesmessage.png)
2. Or select the cog icon in the upper-right corner ![Screenshot of cog icon.](media/service-organizational-content-pack-manage-update-delete/cog.png) and select **View Content Pack**.
   
   ![Screenshot of cog icon in the upper-right corner.](media/service-organizational-content-pack-manage-update-delete/pbi_contpkview.png)
   
   Notice the warning icon ![Screenshot of warning icon.](media/service-organizational-content-pack-manage-update-delete/pbi_contpkwarningicon.png).  This lets you know that you've modified the content pack in some way and it no longer matches what you published.
3. Select **Edit**.  
4. Make any necessary changes in the **Update Content Pack** window and select **Update**. A **Success** message appears.
   
   * For group members who haven't customized the content pack, the update is automatically applied.
   * Group members who have customized the content pack receive a notification that there is a new version.  They can go to AppSource and get the updated content pack without losing their personalized version.  They'll now have 2 versions: the personalized version and the updated content pack.  In the personalized version, all tiles from the original content pack will be gone.  But tiles pinned from other reports will still render. However, if the content pack owner deletes the dataset the content pack is based on, then the whole report will be gone.  

## Update the audience: expand or restrict access
Another modification available to content pack creators is expanding and restricting access to the content pack.  Perhaps you published a content pack to a broad audience and you've decided to restrict access to a smaller group.  

1. Select the cog icon ![Screenshot of cog icon.](media/service-organizational-content-pack-manage-update-delete/cog.png) and choose **View Content Packs**.
2. Select **Edit**. 
3. Make any necessary changes in the **Update Content Pack** window and select **Update**. For example, delete the original distribution group in the **Specific Groups** field and replace it with a different distribution group (that has fewer members).
   
   A Success message appears.
   
   For any coworker who isn't part of the new alias:
   
   * For group members who haven't customized the content pack, the dashboard and reports associated with that content pack are no longer available and the content pack doesn't appear in the nav pane.
   * For group members who have customized the content pack, the next time they open the customized dashboard, all tiles from the original content pack will be gone.  But tiles pinned from other reports will still render. The original content pack reports and dataset are no longer available, and the content pack doesn't appear in the nav pane.   

## Refresh an organizational content pack
As the content pack creator, you can [schedule refresh of the datasets](../connect-data/refresh-data.md).  When you create and upload the content pack, that refresh schedule is uploaded with the datasets. If you change the refresh schedule, you need to re-publish the content pack (see above).

## Delete an organizational content pack from AppSource
You can only delete a content pack from AppSource if you created it. If you've created an organizational content pack in a workspace, and then decide to delete that workspace, be sure to delete the content pack first. If you delete the workspace without deleting the content pack first, you lose all access to those content packs and will have to contact Microsoft Support for help. 

> [!TIP]
> You can [delete your connection to a content pack](service-organizational-content-pack-disconnect.md) you didn't create. That doesn't delete the content pack from AppSource.
> 
> 

1. To delete a content pack from AppSource, go to the workspace where you created the content pack, select the cog icon ![Screenshot of cog icon.](media/service-organizational-content-pack-manage-update-delete/cog.png) and choose **View Content Packs**.
2. Select **Delete \> Delete**. 
   
   * For group members who haven't customized the content pack, the dashboard and reports associated with that content pack are automatically removed. They're no longer available, and the content pack doesn't appear in the nav pane.
   * For group members who have customized the content pack, the next time they open the customized dashboard, all tiles from the original content pack will be gone.  But tiles pinned from other reports will still render. The original content pack reports and dataset are no longer available, and the content pack doesn't appear in the nav pane.   

## Next steps
* [Introduction to organizational content packs](service-organizational-content-pack-introduction.md)
* [Create and distribute an app in Power BI](service-create-distribute-apps.md) 
* More questions? [Try the Power BI Community](https://community.powerbi.com/)

