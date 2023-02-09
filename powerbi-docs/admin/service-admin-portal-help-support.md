---
title: Help and support admin settings
description: Learn how to configure Power BI help and support admin settings.
author: paulinbar
ms.author: painbar
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-admin
ms.custom: tenant-setting
ms.topic: how-to
ms.date: 03/10/2022
LocalizationGroup: Administration
---

# Help and support tenant settings

These settings are configured in the tenant settings section of the Admin portal. For information about how to get to and use tenant settings, see [About tenant settings](../admin/service-admin-portal-about-tenant-settings.md).

## Publish "Get Help" information

  :::image type="content" source="media/service-admin-portal-help-support/publish-get-help.png" alt-text="Screen capture showing interface for Publish get help information.":::

Admins can specify internal URLs to override the destination of links on the Power BI help menu and for license upgrades. If custom URLs are set, users in the organization go to internal help and support resources instead of the default destinations. The following resource destinations can be customized:

* **Learn**. By default, this help menu link targets a [list of all our Power BI learning paths and modules](/training/browse/?products=power-bi). To direct this link to internal training resources instead, set a custom URL for **Training documentation**.

* **Community**. To take users to an internal forum from the help menu, instead of to the [Power BI Community](https://community.powerbi.com/), set a custom URL for **Discussion forum**.

* **Licensing upgrades**. Users with a Power BI (free) license or a Power BI Pro license may be presented with the opportunity to upgrade their account to a Power BI Premium Per User license. If you specify an internal URL for **Licensing requests**, you redirect users to an internal request and purchase flow and prevent self-service purchase. If you want to prevent users from buying licenses, but are okay with letting users start a Power BI Premium Per User trial, see [Allow users to try Power BI paid features](service-admin-portal-help-support.md#allow-users-to-try-power-bi-paid-features) to separate the buy and try experiences.

* **Get help**. To take users to an internal help desk from the help menu, instead of to [Power BI Support](https://powerbi.microsoft.com/support/), set a custom URL for **Help Desk**.

## Receive email notifications for service outages or incidents

Mail-enabled security groups will receive email notifications if this tenant is impacted by a service outage or incident. Learn more about [Service interruption notifications](service-interruption-notifications.md).

## Allow users to try Power BI paid features

   :::image type="content" source="media/service-admin-portal-help-support/power-bi-settings-paid-features.png" alt-text="Screen capture showing Allow users to try Power BI paid features interface.":::

The setting to **Allow users to try Power BI paid features** is enabled by default. This setting increases your control over how users get license upgrades. In scenarios where you have [blocked self-service purchase](../enterprise/service-admin-disable-self-service.md), this setting lets users use more features free for 60 days. Users who have a Power BI (free) license or a Power BI Pro license can start a Power BI Premium Per User trial. Changing **Allow users to try Power BI paid features** from **enabled** to **disabled** blocks self-service purchase of new licenses. It does not impact purchases that were already made.

The user's license upgrade experience depends on how you combine license settings. The table below shows how the upgrade experience is affected by different setting combinations:

| Self-service purchase setting | Allow user to try Power BI paid features | End-user experience |
| ------ | ------ | ----- |
| Enabled | Disabled | User can buy an upgraded license, but can't start a trial |
| Enabled | Enabled | User can start a free trial and can upgrade to a paid license |
| Disabled | Disabled | User sees a message to contact the IT admin to request a license |
| Disabled | Enabled | User can start a trial, but must contact the IT admin to get a paid license |



> [!NOTE]
> You can add an internal URL for licensing requests in [Help and support settings](service-admin-portal-help-support.md). If you set the URL, it overrides the default self-service purchase experience. It doesn't redirect signup for a trial license. Users who can buy a license in the scenarios described in the table above are redirected to your internal URL.

To learn more, see [Enable or disable self-service sign-up and purchasing](../enterprise/service-admin-disable-self-service.md).

## Show a custom message before publishing reports  

Admins can provide a custom message that appears before a user publishes a report from Power BI Desktop. After you enable the setting, you need to provide a **Custom message**. The Custom message can be plain text or follow Markdown syntax, as in the following example message:

```markdown
### Important Disclaimer 

Before publishing the report to a workspace, be sure to validate that the appropriate users or groups have access to the destination workspace. If some users or groups should *not* have access to the content and underlying artifacts, remove or modify their access to the workspace, or publish the report to a different workspace. Learn about [giving access to workspaces](../collaborate-share/give-access-new-workspaces.md). 
```

The **Custom message** text area does support scrolling, so you can provide a message up to 5,000 characters.

:::image type="content" source="media/service-admin-portal-help-support/admin-show-custom-message.png" alt-text="Screenshot of the custom message box.":::

When your users publish reports to workspaces in Power BI, they see the message you've written.

:::image type="content" source="media/service-admin-portal-help-support/admin-user-show-custom-message.png" alt-text="The dialog box your users see when publishing reports to a workspace.":::

As with other tenant settings, you can choose who the **Custom message** applies to:

- **The entire organization**.
- **Specific security groups**.
- Or **Except specific security groups**.

## Next steps

* [About tenant settings](../admin/service-admin-portal-about-tenant-settings.md)
