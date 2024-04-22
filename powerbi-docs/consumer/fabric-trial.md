---
title: Fabric trial
description: Understand how the Fabric trial works.
author: mihart
ms.author: mihirwagle
ms.topic: conceptual
ms.custom:
  - build-2023
  - ignite-2023
ms.date: 03/29/2024
---

# Microsoft Fabric trial

Microsoft Fabric is provided free of charge when you sign up for the Fabric trial. Your use of the Microsoft Fabric trial includes access to the Fabric product experiences and the resources to create and host Fabric items. The Fabric trial lasts for 60 days, but Microsoft can extend it, at our discretion.

With a Fabric trial, you get the following features:

* Full access to all of the Fabric experiences and features.

* OneLake storage up to 1 TB.

* Up to five Fabric trial capacities per tenant.

* The ability for users to create Fabric items and collaborate with others in the Fabric trial capacity. 

Creating and collaborating in Fabric includes:
  * Creating [Workspaces](workspaces.md) (folders) for projects that support Fabric capabilities.
  * Sharing Fabric items, such as semantic models, warehouses, and notebooks, and collaborating on them with other Fabric users.
  * Creating analytics solutions using Fabric items.

When you start a Fabric trial, your trial [capacity](../enterprise/licenses.md#capacity) has 64 capacity units (CU). You don't have access to your capacity until you put something into it. To begin using your Fabric trial, add items to **My workspace** or create a new workspace. Assign that workspace to your trial capacity using the *Trial* license mode, and then all the items in that workspace are saved and executed in that capacity.

Your license is upgraded to [Premium Per User (PPU)](/power-bi/enterprise/service-premium-per-user-faq) during the trial. Your Account manager still displays your nontrial license. But in order to make full use of Fabric, your trial includes the equivalent of a PPU license. There are a few key PPU features that aren't available on trial capacities. These include [Co-Pilot](/fabric/get-started/copilot-faq-fabric), Trusted Workspace Identity, and VNet. 

## Existing Power BI users

If you're an existing Power BI user, you can skip to [Start the Fabric trial](#start-the-fabric-trial). During the trial if you have a free or Pro license, it's upgraded to PPU. 

## Users who are new to Power BI

The Fabric trial requires a Power BI license. Navigate to https://app.fabric.microsoft.com to sign up for a Power BI *free* license. Once you have a Power BI license, you can start the Fabric trial. For the duration of the trial, that license is upgraded to PPU.

You may already have a license and not realize it. For example, some versions of Microsoft 365 include a Fabric free or Power BI Pro license.

## Start the Fabric trial

Follow these steps to start your Fabric trial.

1. Open the [Fabric homepage](https://app.fabric.microsoft.com/home) and select the Account manager.

    :::image type="content" source="media/fabric-trial/fabric-home-page.png" alt-text="Screenshot of the Microsoft Fabric homepage with the Account manager outlined in red.":::

2. In the Account manager, select **Start trial**. If you don't see the *Start trial* button, trials might be disabled for your tenant.

    :::image type="content" source="media/fabric-trial/me-control.png" alt-text="Screenshot of the Microsoft Fabric Account manager.":::

3. If prompted, agree to the terms and then select **Start trial**.

4. Once your trial capacity is ready, you receive a confirmation message. Select **Got it** to begin working in Fabric.

5. Open your Account manager again. Notice that you now have a heading for **Trial status**. Your Account manager keeps track of the number of days remaining in your trial. You also see the countdown in your Fabric menu bar when you work in a product experience.

    :::image type="content" source="media/fabric-trial/trial-status-me-control.png" alt-text="Screenshot of the Microsoft Fabric trial status.":::

Congratulations. You now have a Fabric trial that includes a Power BI individual trial (if you didn't already have a Power BI *paid* license) and a Fabric trial capacity.

## Other ways to start a Microsoft Fabric trial

In some situations, your Fabric administrator has [enabled Microsoft Fabric for the tenant](../admin/fabric-switch.md#enable-for-your-tenant) but you don't have access to a capacity that has Fabric enabled. You have another option for enabling a Fabric trial. When you try to create a Fabric item in a workspace that you own (such as **My Workspace**) and that workspace doesn't support Fabric items, you're prompted to start a Fabric trial. If you agree, your Fabric trial starts and your workspace is upgraded to a trial capacity workspace.

## End a Fabric trial

:::image type="content" source="media/fabric-trial/cancel-trial.png" alt-text="Screenshot of the Cancel trial button in Account manager.":::

You can cancel your trial from the Account manager. When you cancel your free Fabric trial, the trial capacity, with all of its workspaces and their contents, is deleted. Your license returns to the original version. In addition, you can't:

- Create workspaces that support Fabric capabilities.

- Share Fabric items, such as machine learning models, warehouses, and notebooks, and collaborate on them with other Fabric users.

- Create analytics solutions using these Fabric items.

Additionally, if you cancel your trial, you might not be able to start another trial. If you want to retain your data and continue to use Microsoft Fabric, you can [purchase a capacity](../enterprise/buy-subscription.md) and migrate your workspaces to that capacity. To learn more about workspaces and license mode settings, see [Workspaces](workspaces.md).

## Considerations and limitations

**I am unable to start a trial**

If you don't see the **Start trial** button in your Account manager:

- Your Fabric administrator might disable access, and you can't start a Fabric trial. To request access, contact your Fabric administrator. You can also start a trial using your own tenant. For more information, see [Sign up for Power BI with a new Microsoft 365 account](/power-bi/enterprise/service-admin-signing-up-for-power-bi-with-a-new-office-365-trial).

- You're an existing Power BI trial user, and you don't see **Start trial** in your Account manager. You can start a Fabric trial by attempting to [create a Fabric item](#other-ways-to-start-a-microsoft-fabric-trial). When you attempt to create a Fabric item, you're prompted to start a Fabric trial. If you don't see this prompt, it's possible that this action is deactivated by your Fabric administrator.

If you do see the **Start trial** button in your Account manager:

- You might not be able to start a trial if your tenant exhausted its limit of trial capacities. If that is the case, you have the following options:

  - [Purchase a Fabric capacity from Azure](https://portal.azure.com/) by performing a search for *Microsoft Fabric*.

  - Request another trial capacity user to share their trial capacity workspace with you. [Give users access to workspaces](give-access-workspaces.md)

  - To increase tenant trial capacity limits, reach out to your Fabric administrator to create a Microsoft support ticket.

**In Workplace settings, I can't assign a workspace to the trial capacity**

This known bug occurs when the Fabric administrator turns off trials after you start a trial. To add your workspace to the trial capacity, open the Admin portal by selecting it from the gear icon in the top menu bar. Then, select **Trial > Capacity settings** and choose the name of the capacity. If you don't see your workspace assigned, add it here.

:::image type="content" source="media/fabric-trial/capacity-wk-assignment.png" alt-text="Screenshot of the Capacities page in the Admin portal.":::

**What is the region for my Fabric trial capacity?**

If you start the trial using the Account manager, your trial capacity is located in the home region for your tenant. See [Find your Fabric home region](../admin/find-fabric-home-region.md) for information about how to find your home region, where your data is stored.

**What impact does region have on my Fabric trial?**

Not all regions are available for the Fabric trial. Start by [looking up your home region](../admin/find-fabric-home-region.md) and then check to [see if your region is supported for the Fabric trial](../admin/region-availability.md). If your home region doesn't have Fabric enabled, don't use the Account manager to start a trial. To start a trial in a region that isn't your home region, follow the steps in [Other ways to start a Fabric trial](#other-ways-to-start-a-microsoft-fabric-trial). If you already started a trial from Account manager, cancel that trial and follow the steps in [Other ways to start a Fabric trial](#other-ways-to-start-a-microsoft-fabric-trial) instead.

**Can I move my tenant to another region?**

You can't move your organization's tenant between regions by yourself. If you need to change your organization's default data location from the current region to another region, you must contact support to manage the migration for you. For more information, see [Move between regions](/power-bi/support/service-admin-region-move).

**What happens at the end of the Fabric trial?**

If you don't upgrade to a paid Fabric capacity at the end of the trial period, non-Power BI Fabric items are removed according to the [retention policy upon removal](../admin/portal-workspaces.md#workspace-states).

**How is the Fabric trial different from an individual trial of Power BI paid?**

A per-user trial of Power BI paid allows access to the Fabric landing page. Once you sign up for the Fabric trial, you can use the trial capacity for storing Fabric workspaces and items and for running Fabric experiences. All rules guiding [Power BI licenses](/power-bi/fundamentals/service-features-license-type) and what you can do in the Power BI experience remain the same. The key difference is that a Fabric capacity is required to access non-Power BI experiences and items.

**Autoscale**

The Fabric trial capacity doesn't support autoscale. If you need more compute capacity, you can purchase a Fabric capacity in Azure.

**For existing Synapse users**

- The Fabric trial is different from a Proof of Concept (POC). A Proof of Concept (POC) is standard enterprise vetting that requires financial investment and months' worth of work customizing the platform and using fed data. The Fabric trial is free for users and doesn't require customization. Users can sign up for a free trial and start running product experiences immediately, within the confines of available capacity units.

- You don't need an Azure subscription to start a Fabric trial. If you have an existing Azure subscription, you can purchase a (paid) Fabric capacity.

**For existing Power BI users**

You can migrate your existing workspaces into a trial capacity using workspace settings and choosing "Trial" as the license mode. To learn how to migrate workspaces, see [create workspaces](create-workspaces.md).

:::image type="content" source="media/fabric-trial/migrate-to-trial.png" alt-text="Screenshot of the trial workspace settings.":::

## Related content

- Learn about [licenses](../enterprise/licenses.md)

- Review Fabric [terminology](fabric-terminology.md)
