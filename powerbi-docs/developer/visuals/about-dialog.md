---
title: Power BI visuals permission settings
description: Learn what each of the permission settings for Power BI visuals does.
author: mberdugo
ms.author: monaberdugo
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-admin
ms.custom:
ms.topic: conceptual
ms.date: 02/14/2024
---

# About Power BI visuals

Every visual has an *About* dialog that gives you information about the visual, including the version number, who created it, and what permission it requests. To open the About dialog, right-click the visual and select **About**.

:::image type="content" source="./media/about-dialog/open-about-dialog.png" alt-text="Screenshot showing how to open the About dialog.":::

The About dialog for custom visuals shows the following information:

:::image type="content" source="./media/about-dialog/about-dialog.png" alt-text="Screenshot of the About dialog.":::

* [About](#about)
* [Certification](#certification)
* [Privileges](#privileges)

Out of the box visuals have only the *About* section.

## About

The *About* section shows the following information:

* **Name**: The name of the visual.
* **Publisher**: The name of the publisher of the visual.
* **ID**: The ID of the visual.
* **Version**: The version of the visual.
* **Source**: The source of the visual, if available.
* **Support**: Link to support information, if available.

## Certification

This section tells you if a visual is certified by Microsoft. Certification means that the visual meets certain specified code requirements and testing by the Power BI team.
For more information about certified visuals, see [Certified Power BI visuals](./power-bi-custom-visuals-certified.md).

## Privileges

Power BI visuals sometimes require access to data or other resources in your organization. This section describes what permissions a visual might need in order to work properly.
It's important to note that the admin can choose to block a visual from requesting a certain permission. If a visual requests a permission that the admin blocked, the visual can't use that permission.

:::image type="content" source="./media/about-dialog/about-dialog.png" alt-text="Screenshot of list of privileges in the About dialog.":::

The following are the permissions a visual might request:

* [Call Power BI Download APIs](#call-power-bi-download-apis)
* [Make calls on behalf of signed in users](#make-calls-on-behalf-of-signed-in-users)
* [Access URLs](#access-urls)
* [Call Power BI local storage APIs](#call-power-bi-local-storage-apis)

Visuals can request permission for any or the following privileges:

### Call Power BI Download APIs

The visual might request to download data from Power BI to a file. The admin can choose to block this permission in which case the visual can't download data from Power BI.

To learn more, see []().

### Make calls on behalf of signed in users

The visual might need to obtain a Microsoft Entra ID (formerly known as Azure AD) access tokens for signed-in users, facilitating single sign-on authentication. The admin can choose to block this permission in which case the visual can't obtain the access token.

To learn more, see [Obtain Microsoft Entra access token](/fbric/admin/organizational-visuals#obtain-microsoft-entra-access-token).

### Access URLs

The visual can send HTTP requests to specific URLs that the visual builder declared.

To learn more, see []().

### Call Power BI local storage APIs

The visual might need to store data locally on the user's device. The admin can choose to block this permission in which case the visual can't store data locally.

To learn more, see [Obtain Microsoft Entra access token](/fbric/admin/organizational-visuals#obtain-microsoft-entra-access-token).

## Related content

* [About tenant settings](fabric/admin/tenant-settings-index)
* [Manage Power BI visuals admin settings](/fabric/admin/organizational-visuals).
