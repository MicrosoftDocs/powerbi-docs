---
title: Configuring Azure AD app permissions in the embedded analytics embed for your organization tutorial
description: Configure the Azure AP app permissions the embedded analytics embed for your organization tutorial.
services: powerbi
author: KesemSharabi
ms.author: kesharab
ms.topic: include
ms.date: 13/09/2020
ms.custom: include file
---

    >[!NOTE]
    >If you don't have a **Web** platform, select **Add a platform** and in the *Configure platforms* window, select **Web**.

6. From the *Manage* menu, select **Permissions** and verify the following:

    1. That your Azure AD app has the permissions listed below. To change your Azure AD app permissions, refer to [Change your Azure AD app's permissions](register-app.md#change-your-azure-ad-apps-permissions).

        * Read all workspaces
        * Read all reports
        * Read all dashboards

    2. That your API permissions are granted. An![Applies to.](../../media/yes.png) symbol next to each permission indicates that it's granted. If you don't see this symbol next to your permissions, select **Grant admin concent**.

    :::image type="content" source="media/embed-sample-for-your-organization/azure-ad-permissions.png" alt-text="Screenshot showing the Azure AD app API permissions.":::