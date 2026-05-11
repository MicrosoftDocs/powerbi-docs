---
title: Licenses and Subscriptions for Business Users
description: Learn about Power BI licenses and subscriptions, find your license type, and discover the benefits of Premium capacity workspaces.
author: julcsc
ms.author: juliacawthra
ms.reviewer:  
ms.service: powerbi
ms.subservice: pbi-fundamentals
Ms.custom: 
ms.topic: how-to
ms.date: 11/25/2025
ms.custom: licensing support
LocalizationGroup: consumers
ai-usage: ai-assisted

#customer intent: As a business user, I understand the license options for Power BI service and I can look up my current license. 
---

# Licenses and subscriptions for business users

[!INCLUDE[consumer-appliesto-ynnn](../includes/consumer-appliesto-ynnn.md)]

As a [business user](../personas/business-user/end-user-consumer.md), you use the Power BI service to explore reports and dashboards so you can make data-backed business decisions. If you've used Power BI for a while, you probably notice that some features only work if you have a certain type of license, subscription, or permissions.

What you can do in the Power BI service depends on three things:

- The type of license and subscription you use
- The type of workspace that stores the content
- The roles and permissions you have in a workspace

:::image type="content" source="media/end-user-license/power-bi-questions-small.png" alt-text="Illustration that shows a person with questions about licenses and permissions surrounding them.":::

This article describes the capabilities of each license type and how the location where content is stored affects what you can do with it. You learn how to check your license and subscription information, and find where your content is stored. For more information about workspace *roles* and *permissions*, see [Collaborate in workspaces](../collaborate-share/end-user-workspaces.md).

## Licenses

Each user of the Power BI service has a *free* license, a *Pro* license, or a *Premium per-user (PPU)* license. If you're a Power BI business user, you're probably using a free license managed by your Power BI admin.

You can have more than one license at the same time. The service gives you the experience of the most permissive license you have.

> [!NOTE]
> You need a paid license, either [Power BI Pro](../enterprise/service-admin-purchasing-power-bi-pro.md) or [Premium Per User (PPU)](../enterprise/service-premium-per-user-faq.yml), to publish content to a Power BI app workspace, edit content, and share content with others.

### Understanding license capabilities

| Capability | Free license | Pro license | PPU license |
|------------|--------------|-------------|-------------|
| View shared content in Premium capacity | Yes | Yes | Yes |
| View shared content in non-Premium workspaces | No | Yes | Yes |
| Create content in My workspace | Yes | Yes | Yes |
| Publish to app workspaces | No | Yes | Yes |
| Share content with others | No | Yes | Yes |
| Use PPU-only features | No | No | Yes |

> [!TIP]
> If you have a free license and want to share reports or publish to workspaces outside your personal My workspace, you need to upgrade to Pro or PPU. You can start a trial or purchase a license from your Account manager.

For details about licenses and subscriptions, see [License types for Power BI and Fabric](service-features-license-type.md).

## Power BI Premium capacity subscription

Premium is an organizational subscription that lets you store content in a virtual container called a Power BI Premium capacity. With Premium capacity, anyone with permissions, whether they're inside or outside your organization, can use content stored in this virtual container. This use includes users with free licenses.

Premium capacity lets users with paid licenses share content widely without needing paid licenses for people who view the content. The person who creates content in Premium capacity uses a paid license to connect to data sources, model data, and create reports, dashboards, and apps that are saved to a workspace in Premium capacity. Users without a paid license can use a workspace in Power BI Premium capacity, as long as they have a [role in that workspace](../collaborate-share/end-user-workspaces.md).

> [!IMPORTANT]
> For free users to access reports, both the report and its underlying semantic model must be in Premium capacity. If the report is in Premium capacity but the semantic model is in a workspace that isn't in Premium capacity, free users will receive a prompt to upgrade their license to Pro, PPU, or a trial.

When users with a free license try to use a workspace in Premium capacity, and they aren't assigned a role in that workspace, they see a prompt to upgrade their license to Pro, PPU, or a trial.

Within workspaces in Premium capacity, creators assign roles, like **Viewer**, **Contributor**, **Member**, and **Administrator**. The roles creators assign to their colleagues, and the licenses the colleagues have, determine how those colleagues can interact with the content. For more information, see [workspace permissions and roles](../collaborate-share/end-user-workspaces.md#permissions-in-the-workspaces).

When a creator makes and publishes an app, they give access to individuals or entire organizations. How you interact with the app's content depends on the specific access permissions you have. For example, you might be able to view the app, connect to the underlying semantic models, make copies of reports, or share the content.

For more info about Premium capacity, see [What is Microsoft Power BI Premium?](../enterprise/service-premium-what-is.md).

## Find out which licenses you have

To see your account information, sign in to Power BI in your browser (app.powerbi.com). Select your profile picture in the upper right corner. In the following screenshots, the sample users illustrate how different license types appear. Other types of licenses are Pro and Premium per-user. To see more details about your account, select **View account** > **Subscriptions.**

:::image type="content" source="media/end-user-license/power-bi-account-manager.png" alt-text="Screenshot of the menu that appears when you select your profile picture.":::

The first user, Pradtanna, has Office 365 E5, which includes a Power BI Pro license.

:::image type="content" source="media/end-user-license/power-bi-license-office.png" alt-text="Screenshot of Office portal subscriptions tab showing Office 365 E5 subscription.":::

The second screenshot shows a user with a free license. The license name is Fabric (Free).

:::image type="content" source="media/end-user-license/power-bi-license-free.png" alt-text="Screenshot of Office portal subscriptions tab for a free license.":::

### Microsoft Power BI and Microsoft Fabric

Power BI is one of the experiences available in Microsoft Fabric. Power BI is also available as a standalone service. You might use only the Power BI experience, or you might use more than one Fabric experience.

For more information, see [What is Microsoft Fabric.](/fabric/get-started/microsoft-fabric-overview)

## Find out if you have access to Premium capacity

Check if you can use content in Premium capacity. Both Pro and free users can belong to an organization with Premium capacity.

Select **Workspaces** and scroll through the list of workspaces shared with you. Workspaces in Premium capacity are marked with a diamond icon. To open a Premium workspace, select it.

:::image type="content" source="media/end-user-license/power-bi-premium-diamond.png" alt-text="Screenshot of workspaces with diamond icons that show Premium capacity.":::

Apps and app workspaces saved in Premium capacity also have a diamond icon.

In the following image, two apps are stored in Premium capacity.

:::image type="content" source="media/end-user-license/power-bi-premium.png" alt-text="Screenshot of the diamond icon that represents content stored in Premium capacity.":::

If you don't see any diamond icons, it can mean that no colleague has shared content with you from Premium capacity.

## Put it all together

Organizations set up Power BI subscriptions and licenses in different ways. From a business user's perspective, a common scenario gives you a free license. Your organization buys a Premium subscription, the admin assigns Pro licenses to a small group of users, and all the other users have free licenses. Typically, the admin assigns a Pro license to employees who create and share content. Pro users create [workspaces](../collaborate-share/end-user-workspaces.md) and add dashboards, reports, semantic models, apps, and other content to those workspaces. To let free users collaborate in those workspaces, the admin or Pro user assigns the workspaces to Premium capacity and gives free users permissions (roles) to that workspace.

|License type  |Not in Premium capacity | Premium capacity  |
|---------|---------|---------|
|**Free**     |  Use as a personal sandbox to create content for yourself and interact with that content. A free license is a great way to try out the Power BI service. You can't consume content from anyone else or share your content with others.     |   Interact with content assigned to Premium capacity and shared with you. Free, Premium per-user, and Pro users can collaborate without requiring the free user to have a paid license.      |
|**Pro**     |  Collaborate with Premium per-user and Pro users by creating and sharing content.        |  Collaborate with free, Premium per-user, and Pro users by creating and sharing content.       |

In the following diagram, the left side shows Pro users who create and share content in app workspaces.

- **Workspace A** isn't in Premium capacity.
- **Workspace B** is created and saved in Premium capacity. This workspace has a diamond icon.  

    :::image type="content" source="media/end-user-license/power-bi-dedicated.jpg" alt-text="Screenshot of Premium and shared capacity workspaces, and the users that can interact with each.":::

Power BI Pro creators share and collaborate with other Pro users in either workspace. Power BI Pro users can only share and collaborate with free users by using Workspace B, which is in Premium capacity. The creator assigns roles to collaborators within the workspace. Your role determines what actions you can take. Power BI business users usually get the Viewer role. For more information, see [Permissions in the workspaces](../collaborate-share/end-user-workspaces.md#permissions-in-the-workspaces).

## Considerations and limitations

- You can have more than one Power BI license. The Power BI service always gives you the experience that matches your best license. For example, if you have both a Pro and a free license, the Power BI service uses the Pro license.
- Only SKUs (Stock Keeping Units) equivalent to or higher than a **F64 SKU** let free Power BI users use Power BI apps and shared content in Premium capacity in the Power BI service. Smaller **F SKU**s need a paid license to access shared content.
- If you want to create and share content, or open content that someone else shared with you, and that content isn't in Premium capacity, you need a paid license. Buy a license or sign up for a trial if one is available. One option is the [free trial of Power BI paid features](service-self-service-signup-for-power-bi.md). If your organization lets self-service trials, select the upgrade dialog that shows in the Power BI service when you try to use a Pro feature.

    :::image type="content" source="media/end-user-license/power-bi-ppu-trial.png" alt-text="Screenshot showing the dialog for a Power BI Pro free trial.":::

  When the trial ends, your license goes back to the previous version, either free or Pro. You can't use features that need a paid license. If you want to keep a paid license, contact your admin or IT Help Desk to buy an upgrade. If you don't have an admin or IT Help Desk, go to the [Power BI pricing page](https://www.microsoft.com/power-platform/products/power-bi/pricing).

  > [!TIP]
  > To compare Power BI license options and see current pricing, visit the [Power BI pricing page](https://www.microsoft.com/power-platform/products/power-bi/pricing).

- If you sign up for a free license by selecting a **Try it free** button, it doesn't expire unless you cancel it. If your trial upgrade ends or your organization removes your Pro or Premium license, your free license is still available.

- A free user license for the Power BI service is great for exploring or using it for personal data analysis and visualizations in **My workspace**. A free standalone user doesn't use Power BI to work with colleagues. Standalone users with free licenses can't view content shared by others or share their own content with other Power BI users.

## Related content

- [Am I a Power BI business user?](../personas/business-user/end-user-consumer.md)  
- [Purchase Power BI](https://www.microsoft.com/power-platform/products/power-bi/pricing)  
- [Features for free users](../fundamentals/end-user-features.md)
