<properties
   pageTitle="Share (and unshare) a dashboard from Power BI"
   description="Share (and unshare) a dashboard from Power BI"
   services="powerbi"
   documentationCenter=""
   authors="mihart"
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
   ms.author="mihart"/>

# Share (and unshare) a dashboard from Power BI

You can share your dashboards with people in your organization. If they haven't signed up for [Power BI](http://powerbi.com), they'll need to do so to see your dashboard.

**NOTE**: Dashboards (and their associated reports) that are shared with you are read-only and cannot be saved-as (personalized).  [Organizational content packs](powerbi-service-organizational-content-packs-introduction.md), on the other hand, do allow you to personalize the dashboard and reports. Read [How should I share my dashboard](powerbi-service-how-should-I-share-my-dashboard.md)? to decide which is best for your situation. 

1.   Open the dashboard to share and select **Share Dashboard**.

    ![](media/powerbi-service-share-unshare-dashboard/sharedash.png)

2.  To share with colleagues, select **In﻿vite** and type the colleagues' email addresses in the top box and, optionally, modify the message.

    ![](media/powerbi-service-share-unshare-dashboard/PBI_ShareInvite.png)  

3.  To allow your colleagues to reshare your dashboard with others, check **Allow recipients to share your dashboard** (the checkbox is in the lower-right corner).

4.  Select **Share.**

	Your colleagues will receive an email invitation with a link to the shared dashboard. Clicking the link adds the dashboard to their Power BI. If they haven't yet signed up for Power BI, they will be redirected to instructions to do so.

5.  To see who the dashboard is shared with, select **Shared With**.

    ![](media/powerbi-service-share-unshare-dashboard/PBI_ShareDash1.png)

## Notes about sharing

When you share with your colleagues:

-   They can see your dashboard and interact with your reports in [Reading View](powerbi-service-open-a-report-in-reading-view.md). They can't create new reports or save changes to existing reports.

-   They can even see the changes you make (after you save those changes).

-   They can't see or download the dataset or use any of the data refresh operations.

-   They see this icon ![](media/powerbi-service-share-unshare-dashboard/PBI_SharedWithYouIcon.png) next to the shared dashboard, indicating the dashboard is shared with them.

-   If you use Office 365 for email, you can share with members of a distribution group by entering in the email address associated with the distribution group in the top box.  Note that distribution groups with more than 500 members are not supported.

You can share with colleagues who have the same email domain as you, and with colleagues whose domain is different but registered within the tenant. For example, say the domains contoso.com and contoso2.com are registered in the tenant. If your email address is konrads@contoso.com, you can share with ravali@contoso.com, and also with gustav@contoso2.com.

**TIP:** If your colleagues already have access to a specific dashboard, you can send a direct link to that dashboard just by copying the URL when you're on the dashboard. For example:

-   https://powerbi.com/dashboards/g12466b5-a452-4e55-8634-xxxxxxxxxxxx

## Resharing

Resharing allows your colleagues to forward the email invitation to others in your organization (the invitation expires after one month). Colleagues can also reshare through the web and mobile apps. As the owner of the dashboard, you can turn off resharing and you can also revoke resharing on an individual basis (see below).# Unshare a dashboard

## Unshare a dashboard

1.  Open the dashboard to share and click **Share Dashboard**.

    ![](media/powerbi-service-share-unshare-dashboard/sharedash.png)

2.  Click **Shared With** to see the complete list of people.

    ![](media/powerbi-service-share-unshare-dashboard/PBI_SharedWith.png)

3.  Click the ellipsis (**...**) next to **Can view** and select:

    **Stop sharing** with that person or

    **Disable reshares** to keep that person from sharing with anyone else.

    Or if the person hasn't yet accepted your share invitation, **Cancel Invite**.

## Turn off resharing

Only the dashboard owner can turn resharing on and off.

-   If you haven't sent the sharing invitation yet, uncheck **Allow recipients to share your dashboard** in the lower-right corner of the invitation.

    ![](media/powerbi-service-share-unshare-dashboard/PBI_ShareInviteAllowReshare.png)


-   If some colleagues haven't accepted your sharing invitation yet, you can cancel the invitation and invite them again without selecting **Allow recipients to share your dashboard**.

-   If they have accepted your sharing invitation, click **Shared With**, click the ellipsis (**...**) next to **Can view** and click **Stop sharing**.

    ![](media/powerbi-service-share-unshare-dashboard/PBI_SharedWith.png)


## See Also:

[Dashboards in Power BI](powerbi-service-dashboards.md)

[Get Started with Power BI](powerbi-service-get-started.md)

[Power BI - Basic Concepts](powerbi-service-basic-concepts.md)
