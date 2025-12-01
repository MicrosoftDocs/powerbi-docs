---
title: Power BI Self-Service Licensing and Trial FAQ
description: Resolve blocked self-service sign-up, trial, or purchase attempts to quickly get the right Power BI or Fabric license. Get answers fast.
author: julcsc
ms.author: juliacawthra
services: powerbi
ms.topic: concept-article
ms.service: powerbi
ms.custom:
ms.subservice: pbi-fundamentals
ms.date: 09/29/2025
ai-usage: ai-assisted
---
# Power BI self-service licensing and trial FAQ

This FAQ helps you quickly diagnose and resolve problems when trying to sign yourself up for the Power BI service, start (or extend) a trial, or purchase/upgrade an individual per-user license (Fabric [Free], Power BI Pro, or Power BI Premium Per User [PPU]). It focuses on the most common blockers in self-service flows: organizational policies that disable trials or purchases, email/tenant validation behaviors, license capability differences, Premium (capacity) versus PPU workspace access, and trial lifecycle changes.

## Sign-up and account access

### What do I do if I see a message that self-service is disabled?

When you attempt a self-service sign-up, trial, or purchase for a Power BI license, it fails with a message that self-service is disabled. Some organizations block self-service sign-up, trials, and purchases so IT can centrally manage all licenses, including free ones. To finish your purchase, contact your IT department or help desk and ask them to [follow these instructions to provide you with a license.](/microsoft-365/commerce/subscriptions/manage-self-service-purchases-admins)

### What do I do if my license-request process looks different than the documentation?

Some organizations set up their own process for requesting trials, upgrades, and licenses. Follow the steps your organization suggests when requesting a license.

### How do I use self-service if I'm the administrator of a tenant?

If you used self-service purchase or signed up for a Fabric capacity trial, you receive limited Microsoft 365 admin center access. Use it to view and manage self-service licenses, trials, and purchases. See [Manage self-service purchases and trials (for users)](/microsoft-365/commerce/subscriptions/manage-self-service-purchases-users).

### Why can't I use a personal email (Gmail, Hotmail, Outlook.com) to sign up?

Self-service sign-up requires a work or school account. Consumer email domains aren't accepted for Power BI service sign-up.

### Why did a link start sign-up or redirect me to create a new tenant?

Selecting a shared dashboard, report, or app link for the first time can trigger license assignment if self-service is enabled. If your organization hasn’t purchased Power BI and your domain isn’t already enabled, the email validation flow may route you to an alternate sign-up that provisions an account (and sometimes a new tenant).

### Why am I asked for a credit card when signing up another way?

Signing up through a Microsoft 365 (Office 365 E5) trial to obtain an *onmicrosoft* account and tenant requires a credit card. Cancel before the trial ends if you don't intend to purchase.

## License discovery and basics

### How do I find out which license I already have?

Open the Power BI service (app.powerbi.com) and select your profile picture (account manager). For more detail select **View account** > **Subscriptions.**

### Can I have more than one license at the same time?

Yes. The service provides capabilities equal to the most permissive applicable license you have.

### What does a Fabric (Free) license allow me to do?

You can create and view content for yourself in **My workspace** and consume content shared from a workspace in Premium (Fabric F64 or greater) capacity. You can't share your own content or collaborate in non-Premium workspaces.

### Why does my Fabric capacity trial show but my license still says Fabric (Free)?

A Fabric capacity trial grants elevated capabilities similar to PPU while active; your underlying per-user license can still display as Fabric (Free).

### Why doesn't my free license expire?

Fabric (Free) licenses obtained through self-service remain available unless canceled or removed by an administrator.

### Why don't I see Buy now in my account manager?

Your organization might have disabled self-service purchase or you already have an equal or higher paid license, removing the need for that option.

## Trials and upgrades

### Why don’t I see a trial or upgrade prompt (but others do)?

Your organization may have disabled self-service trials or purchases, or you already hold an active paid or trial license. Trial eligibility and prompts also depend on your existing license state and admin settings.

### Can I extend my trial (and what if I can’t)?

Some trials can't be extended. When a nonextendable trial ends, you must purchase or be assigned a paid license to continue paid features.

### What happens when my trial ends?

Your license reverts to the previous state (for example, back to Fabric (Free) or Pro) and you lose access to features that require the higher-tier license unless you purchase or are assigned one.

### Why did starting a trial change what I can see in workspaces?

Trials (for paid per-user or Fabric capacity) unlock features such as sharing, collaboration, and Premium capabilities previously unavailable under Fabric (Free).

### Why did I lose access to editing or sharing features?

Your trial or paid license may have expired or been removed, reverting you to Fabric (Free). You need a Pro or PPU license (or an active Fabric capacity trial) to regain those capabilities.

### How can I get Premium Per User–like capabilities without immediately purchasing PPU?

Start a Fabric capacity trial. The trial capacity includes a license with capabilities similar to a Premium Per User license during the trial period.

## Sharing and collaboration

### Why do I still see upgrade prompts or can’t share/publish content?

You are using features that require a paid (Pro or PPU) license while signed in with only a Fabric (Free) license, or you lack the necessary license for the capability. Sharing and publishing to app or shared workspaces require a paid license unless you are only consuming content in Premium capacity.

### How do I enable colleagues with free licenses to view my content?

Store content in a workspace assigned to Premium (Fabric F64 or greater) capacity and grant them a workspace role or app access. Free users prompted to upgrade are either accessing non-Premium content or lack permissions.

## Premium, PPU, and workspace access

### How do I know if a workspace is in Premium capacity?

In the **Workspaces** list a diamond icon marks a workspace (and associated apps) in Premium (Fabric F64 or greater) capacity.

### Why am I blocked or seeing upgrade prompts in a PPU workspace when I have Pro?

PPU workspaces require all participants to have PPU licenses (unless the workspace is moved to Premium capacity). A Pro license alone doesn't grant access to PPU-only features, and lacking a required workspace role can also block access.

## Ending or canceling

### How do I end, cancel, or close my account or trial?

Follow the documented close, cancel, or end procedures referenced from related sign-up and purchase articles to terminate a trial or subscription.

## Related content

- [Power BI features by license type](service-features-license-type.md)
- [Self-service for Power BI](service-self-service-signup-purchase-for-power-bi.md)
