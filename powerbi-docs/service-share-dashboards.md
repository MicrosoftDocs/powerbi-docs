---
title: Share your Power BI dashboards and reports with coworkers and others
description: How to share Power BI dashboards and reports with colleagues in and out of your organization, and what you need to know about sharing.
author: maggiesMSFT
manager: kfile
ms.reviewer: lukaszp
featuredvideoid: 0tUwn8DHo3s

ms.service: powerbi
ms.subservice: powerbi-service
ms.topic: conceptual
ms.date: 05/17/2019
ms.author: maggies

LocalizationGroup: Share your work
---
# Share your Power BI dashboards and reports with coworkers and others
*Sharing* is a good way to give a few people access to your dashboards and reports. Power BI also offers [several other ways to collaborate and distribute dashboards and reports](service-how-to-collaborate-distribute-dashboards-reports.md).

![Share icon in a list of favorite dashboards](media/service-share-dashboards/power-bi-share-dash-report-favorites.png)

![Share icon in a list of favorite dashboards](media/service-share-dashboards/power-bi-share-dash-report-favorites-old.png)

With sharing, whether you share content inside or outside your organization, you need a [Power BI Pro license](service-features-license-type.md). Your recipients also need Power BI Pro licenses, unless the content is in a [Premium capacity](service-premium-what-is.md). 

You can share dashboards and reports from most places in the Power BI service: Favorites, Recent, Shared with me (if the owner allows it), My Workspace, or other workspaces. When you share a dashboard or report, those you share it with can view it and interact with it, but can't edit it. They see the same data that you see in the dashboard or report, unless [row-level security (RLS)](service-admin-rls.md) is applied. The coworkers you share with can also share with their coworkers, if you allow them to. The people outside your organization can also view and interact with the dashboard or report, but can't share it. 

You can also [share a dashboard from any of the Power BI mobile apps](consumer/mobile/mobile-share-dashboard-from-the-mobile-apps.md). However, you can't share dashboards from Power BI Desktop.

## Video: Share a dashboard
Watch Amanda share her dashboard with colleagues inside and outside her company. Then follow the step-by-step instructions below the video to try it out yourself.

<iframe width="560" height="315" src="https://www.youtube.com/embed/0tUwn8DHo3s?list=PL1N57mwBHtN0JFoKSR0n-tBkUJHeMP2cP" frameborder="0" allowfullscreen></iframe>

## Share a dashboard or report

1. In a list of dashboards or reports, or in an open dashboard or report, select **Share** ![Share icon](media/service-share-dashboards/power-bi-share-icon.png).

2. In the top box, enter the full email addresses for individuals, distribution groups, or security groups. You can't share with dynamic distribution lists. 
   
   You can share with people whose addresses are outside your organization, but you'll see a warning.
   
   ![Warning about sharing externally](media/service-share-dashboards/power-bi-share-dialog-warning.png) 
 
   >[!NOTE]
   >The input box supports, at most, 100 users or groups. If you need to share with large numbers of users, you can share multiple times or share with a user group.
   > 
   > 


3. Add a message if you want. It's optional.
4. To let your coworkers share your content with others, check **Allow recipients to share your dashboard**.
   
   Allowing others to share is called *resharing*. If you let them, they can reshare from the Power BI service and the mobile apps, or forward the email invitation to others in your organization. The invitation expires after one month. People outside your organization can't reshare. As the owner of the content, you can turn off resharing, or revoke resharing on an individual basis. See [Stop sharing or stop others from sharing](#stop-sharing-or-stop-others-from-sharing).

5. Select **Share.**
   
   ![Select the Share button](media/service-share-dashboards/power-bi-share-dialog-share.png)  
   
   Power BI sends an email invitation to the individuals, but not to groups, with a link to the shared content. You see a **Success** notification. 
   
   When recipients in your organization click the link, Power BI adds the dashboard or report to their **Shared with me** list page. They can select your name to see all the content you've shared with them. 
   
   ![Shared with me list page](media/service-share-dashboards/power-bi-shared-with-me-dashboards-reports.png)
   
   When recipients outside your organization click the link, they see the dashboard or report, but not in the usual Power BI portal. For more information, see [Share a dashboard or report with people outside your organization](#share-a-dashboard-or-report-with-people-outside-your-organization).

## Who has access to a dashboard or report you shared?
Sometimes you need to see the people you've shared with, and see who they've shared it with:

1. In the list of dashboards and reports, or in the dashboard or report itself, select **Share** ![Share icon](media/service-share-dashboards/power-bi-share-icon.png). 
2. In the **Share dashboard** dialog box, select **Access**.
   
    ![Share dashboard dialog box, Access tab](media/service-share-dashboards/power-bi-share-dialog-access.png)

    People outside your organization are listed as **Guest**.

## Stop sharing or stop others from sharing
Only the dashboard or report owner can turn resharing on and off.

### If you haven't sent the sharing invitation yet
* Clear the **Allow recipients to share your dashboard** check box at the bottom of the invitation before you send it.

### If you've already shared the dashboard or report
1. In the list of dashboards and reports, or in the dashboard or report itself, select **Share** ![Share icon](media/service-share-dashboards/power-bi-share-icon.png). 
2. In the **Share dashboard** dialog box, select **Access**.
   
    ![Share dashboard dialog box, Access tab](media/service-share-dashboards/power-bi-share-dialog-access.png)
3. Select the ellipsis (**...**) next to **Read and reshare** and select:
   
   ![Read and reshare ellipsis](media/service-share-dashboards/power-bi-change-access.png)
   
   * **Read** to keep that person from sharing with anyone else.
   * **Remove access** to keep that person from seeing the shared content at all.

4. In the **Remove access** dialog box, decide if you also want to remove access to related content, such as reports and datasets. If you remove items with a warning icon ![Power BI warning icon](media/service-share-dashboards/power-bi-warning-icon.png), it's best to also remove related content because it won't display properly.

    ![Power BI sharing warning dialog box](media/service-share-dashboards/power-bi-sharing-warning-dialog.png)

## Share a dashboard or report with people outside your organization
When you share with people outside your organization, they receive an email with a link to the shared dashboard or report, which they must sign in to Power BI to see. If they don't have a Power BI Pro license, they can sign up for a license after clicking the link.

After they sign in, they see the shared dashboard or report in its own browser window, not in their usual Power BI portal. To later access this dashboard or report, they must bookmark the link.

They can't edit any content in this dashboard or report. Although they can interact with the charts and change filters or slicers, they can't save their changes. 

Only your direct recipients can see the shared dashboard or report. For example, if you sent the email to Vicki@contoso.com, only Vicki can see the dashboard. No one else can see the dashboard, even if they have the link. Vicki must use the same email address to access it; if she signs up with any other email address, she won't have access to the dashboard.

People outside your organization can't see any data if role- or row-level security is implemented on on-premises Analysis Services tabular models.

If you send a link from a Power BI mobile app to people outside your organization, clicking the link opens the dashboard in a browser, not in the Power BI mobile app.

If you [allow external guest users to edit and manage content in the organization](service-admin-portal.md#export-and-sharing-settings), the default consumption-only experience doesn't apply to them. [Learn more](service-admin-azure-ad-b2b.md)

## Limitations and considerations
Things to keep in mind about sharing dashboards and reports:

* In general, you and your colleagues see the same data in the dashboard or report. Thus, if you have permissions to see more data than they do, they'll be able to see all your data in the dashboard or report. However, if [row-level security (RLS)](service-admin-rls.md) is applied to the dataset underlying a dashboard or report, then the credentials of every person are used to determine which data they can access.
* Everyone you share your dashboard with can see it and interact with the related reports in [Reading view](consumer/end-user-reading-view.md). They can't create reports or save changes to existing reports.
* Although no one can see or download the dataset, they can access the dataset directly by using the Analyze in Excel feature. An admin can restrict the ability to use Analyze in Excel for everyone in a group. However, the restriction is for everyone in that group for every workspace the group belongs to.
* Everyone can manually [refresh the data](refresh-data.md).
* If you use Office 365 for email, you can share with members of a distribution group by entering the email address associated with the distribution group.
* Coworkers who share your email domain, and coworkers whose domain is different but registered within the same tenant, can share the dashboard with others. For example, if the domains contoso.com and contoso2.com are registered in the same tenant and your email address is konrads@contoso.com, then both ravali@contoso.com and gustav@contoso2.com can share, as long as you gave them permission to share.
* If your coworkers already have access to a specific dashboard or report, you can send a direct link by copying the URL when you're on the dashboard or report. For example: `https://powerbi.com/dashboards/g12466b5-a452-4e55-8634-xxxxxxxxxxxx`
* Likewise, if your coworkers already have access to a specific dashboard, you can [send a direct link to the underlying report](service-share-reports.md). 
* You can share with, at most, 100 users or groups in a single share action. However, you can give more than 500 users access to an item. To do so, either share multiple times by specifying the users individually, or share with a user group that contains all the users.

## Troubleshoot sharing

### My dashboard recipients see a lock icon in a tile or a "Permission required" message

The people you share with may see a locked tile in a dashboard, or a "Permission required" message when they try to view a report.

![Power BI locked tile](media/service-share-dashboards/power-bi-locked_tile_small.png)

If so, you need to grant them permission to the underlying dataset:

1. Go to the **Datasets** tab in your content list.

1. Select the ellipsis (**...**) next to the dataset, then select **Manage permissions**.

    ![Manage permissions](media/service-share-dashboards/power-bi-sharing-manage-permissions.png)

1. Select **Add user**.

    ![Select Add user](media/service-share-dashboards/power-bi-share-dataset-add-user.png)

1. Enter the full email addresses for individuals, distribution groups, or security groups. You can't share with dynamic distribution lists.

    ![Add email addresses](media/service-share-dashboards/power-bi-add-user-dataset.png)


1. Select **Add**.

### I can't share a dashboard or report

To share a dashboard or report, you need permission to reshare the underlying content; that is, any related reports and datasets. If you see a message saying you can't share, ask the report author to give you reshare permission for those reports and datasets.

!["Unable to share" message](media/service-share-dashboards/power-bi-sharing-unable-to-share.png)


## Next steps
* Have feedback? Go to the [Power BI community site](https://community.powerbi.com/) with your suggestions.
* [How should I collaborate on and share dashboards and reports?](service-how-to-collaborate-distribute-dashboards-reports.md)
* [Share a filtered Power BI report](service-share-reports.md).
* Questions? [Try the Power BI community](http://community.powerbi.com/).

