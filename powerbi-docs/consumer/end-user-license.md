---
title: Types of licenses for Power BI consumers
description: Learn about the different types of licenses and how to figure out which you have.
author: mihart
ms.reviewer: lukasz 
ms.custom:  
ms.service: powerbi
ms.subservice: powerbi-consumer
ms.topic: how-to
ms.date: 04/15/2020
ms.author: mihart

LocalizationGroup: consumers
---

# Using the Power BI service as a *consumer*

[!INCLUDE[consumer-appliesto-ynnn](../includes/consumer-appliesto-ynnn.md)]

As a *consumer*, you use the Power BI service to explore reports and dashboards in order to make data-backed business decisions. If you've been using Power BI for a while, or have been chatting with your *designer* colleagues, you've probably discovered that there are some features that only work if you have a certain type of license,  subscription, or permission. 

What you can do in the Power BI service depends on three things:
1.    the type of licenses that you have
2.    where content is stored
3.    the roles and permissions you're assigned


![image of pro users](media/end-user-license/power-bi-questions-small.png)

In this article we describe the capabilities of each license type and how *where content is stored* can affect *what you can do*. You'll also learn how to look up your licenses and figure out where your content is stored. For more information about roles and permissions, see [workspace roles](end-user-workspaces.md).

## Licenses

Each user of the Power BI service is using either a *free* license or a *Pro* license. If you're a Power BI *consumer*, then you're probably using a free license. 

It is possible to have more than one license at the same time.  The service always delivers you an experience equal to the best license you currently have. 

## Premium subscription

Premium is an *organizational* subscription that provides two ways to store Power BI content: in *shared storage* or in *capacity*.  When an admin or a Pro user assigns a workspace to *Premium capacity*, they can grant free users access to that workspace. Within that workspace, those free users can collaborate with Pro users. For more information, see [workspace permissions and roles.](end-user-workspaces.md) 

For more info about capacity, see [What is Microsoft Power BI Premium?](../service-premium-what-is.md).


## Find out which license and subscription you have
There are several ways to look up your Power BI license and subscription information. 

First, determine which user license you have.

- Certain versions of Microsoft Office include a Power BI Pro license.  To see if your version of Office includes Power BI, visit [your Microsoft **My account** page](https://portal.office.com/account) and select **Subscriptions**.

    This first user, Pradtanna, has Office 365 E5, which includes a Power BI Pro license.

    ![Office portal subscriptions tab](media/end-user-license/power-bi-license-office.png)

    This second user, Zalan, has a Power BI free license. 

    ![Office portal subscriptions tab](media/end-user-license/power-bi-license-free.png)

Next, check to see if you are part of an organization that has a Premium subscription. Either of the users above, Pro or free, could belong to an organization that has a Premium subscription.  Let's check for our second user, Zalan.  

We can determine whether Zalan's organization has a Premium subscription by looking up the amount of storage available. 

- In the Power BI service, select **My workspace** and then select the cog icon from the upper right corner. Choose **Manage personal storage**.

    ![Cog Settings menu displays](media/end-user-license/power-bi-license-personal.png)

    If you see more than 10 GB, then you are a member of an organizational that has a Premium license. The image below shows that Zalan's organization has up to 100 GB of storage.  

    ![Manage storage showing 100 GB](media/end-user-license/power-bi-free-capacity.png)

    As a *consumer* in an organization with a Premium subscription, as long as the *designer* places the workspace in Premium capacity, Zalan has the ability to view shared content, collaborate with colleagues, work with apps, and more. The extent of his permissions is set by his Power BI administrator and by the content designer. Notice that a Pro user has already shared a workspace with Zalan. The diamond icon indicates that this workspace is stored in Premium capacity. 

   

## Putting it all together

When an organization purchases a Premium license, the administrator typically assigns Pro licenses to the employees who will be creating and sharing content. And the administrator assigns free licenses to everyone who will be consuming that content. The Pro users create [app workspaces](end-user-workspaces.md) and add content (dashboards, reports, apps) to those workspaces. To allow free users to collaborate in those workspaces, the admin or Pro user saves the workspaces in *Premium capacity*.    
<br>

|License type  |Shared storage  |Premium capacity  |
|---------|---------|---------|
|**Free**     |  Create content for yourself. Try out the Power BI service.  <sup>1</sup>     |   Free users can view and interact with content created by Pro users. Free and Pro users can collaborate without requiring the free users to have Pro accounts.      |
|**Pro**     |  Collaborate with other Pro users by creating and sharing content.        |  Collaborate with free and Pro users by creating and sharing content.       |


<sup>1</sup> See [Considerations and troubleshooting](#considerations-and-troubleshooting). 

In the diagram below, the left side represents Pro users who create and share content in app workspaces. 

- **Workspace A** was created in an organization that doesn't have a Premium subscription. 

- **Workspace B** was created in an organization that does have a Premium subscription, though this particular workspace was saved in shard storage (not Premium capacity). The workspace does not have the diamond icon.

- **Workspace C** was created in an organization that does have a Premium subscription, and was saved in Premium capacity. This workspace has a diamond icon.  

    ![image of three workspaces](media/end-user-license/power-bi-sharing-scenarios.jpg)

The Power BI Pro *designer* can share and collaborate with other Pro users in any of the three workspaces. But, the only way the Power BI Pro user can share and collaborate with free users is by using Workspace C, which is in Premium capacity.  Within the workspace, the designer assigns roles to collaborators. Your role determines what actions you can take within the workspace. Power BI *consumers* are usually assigned the *Viewer* role. To learn more, see [Workspaces for Power BI consumers](end-user-workspaces.md).




## Considerations and troubleshooting
- It is possible to have more than one Power BI license. The Power BI service will always deliver the experience equal to the best license that you currently have. For example, if you have both a Pro and a free license, the Power BI service will use the Pro license.

- If you signed up for a free license, it never expires. So if you upgrade to a Pro trial or your organization provides you with a Pro license, and then your trial ends or your organization removes your Pro license, you'd still have the free license to fall back on. 

- <sup>1</sup> A free standalone user license is perfect for someone using the Microsoft samples to learn Power BI. Users with free standalone licenses can't view content shared by others or share their own content with other Power BI users. 

    ![image of standalone users](media/end-user-license/power-bi-free-license.jpg)

    All customers with a free standalone license can upgrade to a [free Power BI Pro license trial](../service-self-service-signup-for-power-bi.md). The trial gives you all the power and functionality of a Power BI Pro user.

    ![invitation to Pro trial](media/end-user-license/power-bi-pro-trial.png)

## Next steps
- [Am I a Power BI *consumer*?](end-user-consumer.md)    
- [Learn about workspaces](end-user-workspaces.md)    
- [View Power BI consumer features by license type](end-user-features.md)

