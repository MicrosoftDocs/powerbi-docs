<properties 
   pageTitle="Share (and unshare) a dashboard from Power BI" 
   description="Share (and unshare) a dashboard from Power BI" 
   services="powerbi" 
   documentationCenter="" 
   authors="v-anpasi" 
   manager="mblythe" 
   editor=""
   tags=""/>
 
<tags
   ms.service="powerbi"
   ms.devlang="NA"
   ms.topic="article"
   ms.tgt_pltfrm="NA"
   ms.workload="powerbi"
   ms.date="06/18/2015"
   ms.author="v-anpasi"/>

# Share (and unshare) a dashboard from Power BI
[← All about dashboards](https://support.powerbi.com/knowledgebase/topics/65158-all-about-dashboards)

You can share your dashboards with people in your organization. If they haven't signed up for [Power BI](http://powerbi.com/), they'll need to do so to see your dashboard.

1.   Open the dashboard to share and click **Share Dashboard**.  

    ![](media/powerbi-service-share-unshare-dashboard/PBI_ShareDash.png)
    
2.  To share with coworkers, click **In﻿vite** and type the coworkers' email addresses in the top box and, optionally, modify the message.
    
3.  To allow your coworkers to reshare your dashboard with others, check **Allow recipients to share your dashboard** (the checkbox is in the lower-right corner).  

    ![](media/powerbi-service-share-unshare-dashboard/PBI_ShareInvite.png)
    
4.  Click **Share.**
5.  To see who the dashboard is shared with, click **Shared With**.  

    ![](media/powerbi-service-share-unshare-dashboard/PBI_ShareDash1.png)

## Notes about sharing

When you share with your colleagues:
-   They can see your dashboard and interact with your reports in [Reading View](http://support.powerbi.com/knowledgebase/articles/439920-open-a-report-in-reading-view). They can't create new reports or save changes to existing reports.
-   They can even see the changes you make (after you save those changes). 
-   They can't see or download the dataset or use any of the data refresh operations.
-   They see this icon ![](media/powerbi-service-share-unshare-dashboard/PBI_SharedWithYouIcon.png) next to the shared dashboard, indicating the dashboard is shared with them.

You can share with users who have the same email domain as you, and with users whose domain is different but registered within the tenant. For example, say the domains contoso.com and contoso2.com are registered in the tenant. If your email address is konrads@contoso.com, you can share with ravali@contoso.com, and also with gustav@contoso2.com.

**TIP:** If your colleagues already have access to a specific dashboard, you can send a direct link to that dashboard just by copying the URL when you're on the dashboard. For example:

-   https://powerbi.com/dashboards/g12466b5-a452-4e55-8634-xxxxxxxxxxxx

### Resharing  
Resharing allows your coworkers to forward the email invitation to others in your organization (the invitation expires after one month). Coworkers can also reshare through the web and mobile apps. As the owner of the dashboard, you can turn off resharing and you can also revoke resharing on an individual basis (see below).

## Unshare a dashboard

1.  Open the dashboard to share and click Share Dashboard.  

    ![](media/powerbi-service-share-unshare-dashboard/PBI_ShareDash.png)
    
2.  Click **Shared With** to see the complete list of people.

    ![](media/powerbi-service-share-unshare-dashboard/PBI_SharedWith.png)
3.  Click the ellipsis (**...**) next to **Can view** and select:  
    **Stop sharing** with that person or  
    **Disable reshares** to keep that person from sharing with anyone else.  
    Or if the person hasn't yet accepted your share invitation, **Cancel Invite**.

## Turn off resharing

Only the dashboard owner can turn resharing on and off.

-   If you haven't sent the sharing invitation yet, uncheck **Allow recipients to share your dashboard** in the lower-right corner of the invitation.

    ![](media/powerbi-service-share-unshare-dashboard/PBI_ShareInviteAllowReshare.png)
    
-   If some coworkers haven't accepted your sharing invitation yet, you can cancel the invitation and invited them again without selecting **Allow recipients to share your dashboard**. 
-   If they have accepted your sharing invitation, click Shared With, click the ellipsis (...) next to Can view and click **Stop sharing**.

    ![](media/powerbi-service-share-unshare-dashboard/PBI_SharedWith.png)
    

See Also:
---------

[Dashboards in Power BI](http://support.powerbi.com/knowledgebase/articles/424868-dashboards-in-power-bi)  
[Get Started with Power BI](http://support.powerbi.com/knowledgebase/articles/430814-get-started-with-power-bi)  
[Power BI - Basic Concepts](http://support.powerbi.com/knowledgebase/articles/487029-power-bi-preview-basic-concepts)