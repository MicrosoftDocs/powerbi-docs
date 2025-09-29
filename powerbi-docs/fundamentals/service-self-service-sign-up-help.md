---
title: Power BI Self-Service Licensing and Trial FAQ
description: Resolve blocked self-service sign-up, trial, or purchase attempts to quickly get the right Power BI or Fabric license. Get answers fast.
author: julcsc
ms.author: juliacawthra
services: powerbi
ms.topic: conceptual
ms.service: powerbi
ms.custom:
ms.subservice: pbi-fundamentals
ms.date: 09/29/2025
ai-usage: ai-assisted
---
# Power BI self-service licensing and trial FAQ

This FAQ helps you quickly diagnose and resolve problems when trying to sign yourself up for the Power BI service, start (or extend) a trial, or purchase/upgrade an individual per-user license (Fabric (Free), Power BI Pro, or Power BI Premium Per User). It focuses on the most common blockers in self-service flows: organizational policies that disable trials or purchases, email/tenant validation behaviors, license capability differences, Premium (capacity) versus PPU workspace access, and trial lifecycle changes.

## What do I do if I see a message that self-service is disabled?

When you attempt a self-service sign-up, trial, or purchase for a Power BI license, it fails with a message that self-service is disabled. Some organizations block self-service sign-up, trials, and purchases so IT can centrally manage all licenses, including free ones.

:::image type="content" source="media/service-self-service-purchase-help/power-bi-self-service-disabled-message.png" alt-text="Screenshot of the getting started dialog showing the message that the organization doesn't allow users to purchase Power BI Pro.":::

To finish your purchase, contact your IT department or help desk and ask them to [follow these instructions to provide you with a license.](/microsoft-365/commerce/subscriptions/manage-self-service-purchases-admins)

## What do I do if my license-request process looks different than what is suggested in this documentation?

Some organizations set up their own process for requesting trials, upgrades, and licenses. Follow the steps your organization suggests to request a license.

## How do I use self-service if I'm the administrator of a tenant?

There are scenarios where you yourself used self-service purchase or signed up for a trial of a Fabric capacity. These self-service actions give you limited access to the Microsoft 365 admin center. Use the admin center to add and manage your users' self-service licenses, trials, and purchases. Follow the instructions in [Manage self-service purchases and trials (for users)](/microsoft-365/commerce/subscriptions/manage-self-service-purchases-users) to learn how to view and manage licenses for your tenant.

## Why can't I extend my trial?

Power BI and Fabric offer several different trials. Some trials can't be extended and the only option available is to make a purchase. 

## How do I find out which license I already have?

Open the Power BI service (app.powerbi.com) and select your profile picture (account manager) in the upper-right corner to view your current license type. For more details select **View account** > **Subscriptions.**

## Why don’t I see an option to start a trial or upgrade?

Your organization might have disabled self-service trials or purchases, or you already hold an active paid or trial license. When self-service is disabled only an administrator can assign or purchase licenses for you.

## Why can’t I use a personal email (gmail, hotmail, outlook.com) to sign up?

Self-service sign-up requires a work or school account. Consumer email domains aren't accepted for Power BI service sign-up.

## Why did clicking a shared Power BI link start my sign-up?

Selecting a shared dashboard, report, or app link for the first time initiates license assignment if self-service is enabled. The service evaluates your email and assigns an appropriate license based on your organization’s settings.

## Why was I redirected to create a new tenant during sign-up?

If your organization hasn’t purchased Power BI and you enter a work or school email not already enabled for Power BI, the email validation process can route you to an alternate sign-up flow that provisions an account (and sometimes a new tenant).

## What does a Fabric (Free) license allow me to do?

You can create and view content for yourself in **My workspace** and consume content shared from a workspace in Premium (Fabric F64 or greater) capacity. You can’t share your own content or collaborate in non-Premium workspaces.

## Why can’t I share my report or publish to another workspace?

Sharing and publishing to app or shared workspaces require a paid (Pro or PPU) license unless you are only consuming content in a Premium capacity workspace created and shared by someone with a paid license.

## Why do I still see Upgrade prompts after signing in?

You’re attempting a feature that requires a paid license (Pro or PPU) while signed in with only a Fabric (Free) license or a license without that capability.

## What happens when my trial ends?

Your license reverts to the previous state (for example, back to Fabric (Free) or Pro). You lose access to features that require the higher-tier license unless you purchase or are assigned one.

## Can I extend a trial?

Some trials can’t be extended. When a non-extendable trial expires you must purchase or be assigned a paid license to continue using paid features.

## How can I get Premium Per User–like capabilities without immediately purchasing PPU?

Start a Fabric capacity trial. The trial capacity includes a license with capabilities similar to a Premium Per User license during the trial period.

## Why am I asked for a credit card when trying another path to sign up?

Signing up through a Microsoft 365 (Office 365 E5) trial to obtain an *onmicrosoft* account and tenant requires a credit card. Cancel before the trial ends if you don’t intend to purchase.

## How do I know if a workspace is in Premium capacity?

In the **Workspaces** list, a diamond icon marks a workspace (and associated apps) in Premium (Fabric F64 or greater) capacity.

## Why are free users still prompted to upgrade when viewing shared content?

Either the content isn’t stored in a Premium (Fabric F64 or greater) capacity workspace or they haven’t been granted a workspace role or app access. Assign the workspace to Premium capacity and grant appropriate permissions.

## Can I have more than one license at the same time?

Yes. It’s possible to hold multiple license types. The service provides capabilities equal to the most permissive applicable license you have.

## Why does my Fabric capacity trial show but my license still says Fabric (Free)?

A Fabric capacity trial grants elevated capabilities similar to PPU while active; your underlying per-user license can still display as Fabric (Free).

## Why did I lose access to editing or sharing features?

Your trial or paid license may have expired or been removed, causing a reversion to Fabric (Free). You need a Pro or PPU license (or an active Fabric capacity trial) to regain those capabilities.

## How can I let colleagues with free licenses view my app or reports?

Store and share the content in a workspace assigned to Premium (Fabric F64 or greater) capacity and grant them access (workspace role or app audience). Free users can then consume the content.

## Why don’t I see Buy now in my account manager?

Your organization might have disabled self-service purchase or you already have an equal or higher paid license, removing the need for that option.

## How do I end, cancel, or close my account or trial?

Follow the documented close, cancel, or end procedures referenced from related sign-up and purchase articles to terminate a trial or subscription.

## Why did starting a trial change what I can see in workspaces?

Trials (for paid per-user or Fabric capacity) unlock features such as sharing, collaboration, and Premium capabilities previously unavailable under Fabric (Free).

## Why am I still blocked in a workspace after getting a Pro license?

If the workspace is PPU, you need a PPU license (unless the workspace is in Premium capacity). You might also lack a required workspace role—request appropriate access.

## Why did I receive an upgrade message when accessing a PPU workspace even though I have Pro?

PPU workspaces require all participants (except when moved to Premium capacity) to have PPU licenses. A Pro license alone doesn’t grant access to PPU-only features.

## Why doesn’t my free license expire?

Fabric (Free) licenses obtained through self-service remain available unless canceled or removed by an administrator.

## Why did a colleague get a paid trial prompt but I didn’t?

Trial eligibility and prompts depend on your existing license state and whether administrators enabled self-service trials for your account.

## Related content

- [Power BI features by license type](service-features-license-type.md)
- [Self-service for Power BI](service-self-service-signup-purchase-for-power-bi.md)
