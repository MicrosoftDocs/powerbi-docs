<properties 
   pageTitle="Work with organizational content packs"
   description="Read about creating copies of and troubleshooting access to organizational content packs in Power BI"
   services="powerbi" 
   documentationCenter="" 
   authors="ajayan" 
   manager="erikre" 
   backup="maggiesMSFT"
   editor=""
   tags=""
   qualityFocus="no"
   qualityDate=""/>
 
<tags
   ms.service="powerbi"
   ms.devlang="NA"
   ms.topic="article"
   ms.tgt_pltfrm="NA"
   ms.workload="powerbi"
   ms.date="01/06/2017"
   ms.author="ajayan"/>
# Work with organizational content packs in Power BI

When an organizational content pack is published, all recipients see the same dashboard, reports, Excel workbooks, datasets, and data (unless it's a SQL Server Analysis Services (SSAS) data source).  [Only the content pack creator can edit and republish](powerbi-service-organizational-content-packs-manage-update-delete.md) the content pack.  However, all recipients can save a copy of the content pack that can live alongside the original.

## Create a copy of an organizational content pack

Create your own copy of the content pack, not visible to others.

1.  Select the ellipsis (...) next to the content pack dashboard > Make a copy.

     ![](media/powerbi-service-organizational-content-packs-use-and-work-with/power-bi-create-copy-organizational-content-pack.png)

2.  Select **Save**.  

Now you have a copy that you can change. Nobody else will see changes you make.

## Help!  I can no longer access the content pack

This can happen for several reasons:

-   **Membership changes**:  Content packs are published to email distribution groups, security groups, and [Power BI groups based on Office 365](https://support.office.com/article/Create-a-group-in-Office-365-7124dc4c-1de9-40d4-b096-e8add19209e9).  If you are removed from the group, you will no longer have access to the content pack.

-   **Distribution changes**: The content pack creator changes the distribution. For example, if the content pack was originally published to the entire organization but the creator republished it to a smaller audience, you may no longer be included.

-   **Security settings changes**: If the dashboard and reports connect to on-premises SSAS data sources and changes are made to the security settings, your permissions to that server may be revoked.

## How are organizational content packs refreshed?

When the content pack is created, the refresh settings are inherited with the dataset.  When you create a copy of the content pack, the new version retains its link to the original dataset and its refresh schedule. 

See [Manage, update, and delete organizational content packs](powerbi-service-organizational-content-packs-manage-update-delete.md).

## See also
-  [Introduction to organizational content packs](powerbi-service-organizational-content-packs-introduction.md)
-  [Create a group in Power BI](powerbi-service-create-a-group-in-power-bi.md)
- More questions? [Try the Power BI Community](http://community.powerbi.com/)

