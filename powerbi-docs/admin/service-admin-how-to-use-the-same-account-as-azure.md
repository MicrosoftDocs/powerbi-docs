---
title: Using the same account for Power BI and Azure
description: Learn how to use the same sign-in credentials when you're logging into your Power BI and Azure account.
author: kfollis
ms.author: kfollis
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-admin
ms.topic: conceptual
ms.date: 12/14/2022
LocalizationGroup: Troubleshooting
---

# Using the same account for Power BI and Azure

If you're a user of both Power BI and Azure, you might want to use the same sign-in for both services so that you don't need to type in your password twice.

Power BI signs you in with your organizational account, associated with your work or school email address.  Azure signs you in with either a Microsoft Account or your organizational account.

If you want to use the same sign-in for both Azure and Power BI, be sure to sign in to Azure with your organizational account.

**What if I already sign in to Azure with my Microsoft Account?**

You can add your organizational account as a co-administrator in Azure by following these steps:

1. Sign in to the [Azure portal](https://portal.azure.com/). If you're a user in multiple Azure directories, select **Subscriptions**. Then filter to view only the directory and subscriptions you want to edit.

1. In the nav pane, select **Access control (IAM)**, then choose **Add** > **Add co-administrator**.

    :::image type="content" source="media/service-admin-how-to-use-the-same-account-as-azure/add-co-administrator-2021.png" alt-text="Screenshot of the Access control with the Add a co-administrator called out.":::

1. Enter the email address associated with your organizational account, and select **Add**.

1. Next time you sign in to the Azure portal, use your organizational email address.

More questions? [Try the Power BI Community](https://community.powerbi.com/)
