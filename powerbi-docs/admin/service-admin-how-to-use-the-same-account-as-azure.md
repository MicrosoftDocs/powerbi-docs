---
title: Using the same account for Power BI and Azure
description: How to use the same account login for Power BI and Azure
author: kfollis
ms.author: kfollis
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-admin
ms.topic: conceptual
ms.date: 5/25/2021
LocalizationGroup: Troubleshooting
---

# Using the same account for Power BI and Azure

If you are a user of both Power BI and Azure, you might want to use the same login for both services so that you don't need to type in your password twice.

Power BI signs you in with your organizational account, associated with your work or school email address.  Azure signs you in with either a Microsoft Account or your organizational account.

If you want to use the same login for both Azure and Power BI, be sure to sign in to Azure with your organizational account.

**What if I already sign in to Azure with my Microsoft Account?**

You can add your organizational account as a co-administrator in Azure by following these steps:

1. Sign in to the [Azure portal](https://portal.azure.com/). If you are a user in multiple Azure directories, select **Subscriptions** and then filter to view only the directory and subscriptions you want to edit.

1. In the nav pane, select **Access control (IAM)**, then select **Add** > **Add co-administrator**.

    :::image type="content" source="media/service-admin-how-to-use-the-same-account-as-azure/add-co-administrator-2021.png" alt-text="Screenshot of the Access control with the Add a co-administrator called out.":::

1. Enter the email address associated with your organizational account, and select **Add**.

1. Next time you sign in to the Azure portal, use your organizational email address.

More questions? [Try the Power BI Community](https://community.powerbi.com/)
