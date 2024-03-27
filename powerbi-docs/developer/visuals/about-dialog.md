---
title: Power BI visuals About dialog
description: Learn what each of the tabs in the Power BI visuals About dialog describes and what each permission setting does.
author: mberdugo
ms.author: monaberdugo
ms.reviewer: Ranin
ms.service: powerbi
ms.subservice: powerbi-admin
ms.custom:
ms.topic: concept-article
ms.date: 03/18/2024
---

# About Power BI visuals

Every visual has an *About* dialog that gives you information about the visual, including the version number, who created it, and what permission it requests. 

To open the *About* dialog, right-click the visual and select **About**.

:::image type="content" source="./media/about-dialog/open-about-dialog.png" alt-text="Screenshot showing how to open the About dialog.":::

The *About* dialog for custom visuals has three tabs that show the following information:

* [About](#about)
* [Certification](#certification)
* [Privileges](#privileges)

## About

The *About* tab provides the following information:

* **Name**: The name of the visual.
* **Publisher**: The name of the publisher of the visual.
* **ID**: The ID of the visual.
* **Version**: The version of the visual.
* **Source**: The source of the visual, if available.
* **Support**: Link to support information, if available.

:::image type="content" source="./media/about-dialog/about-dialog.png" alt-text="Screenshot of the About dialog.":::

## Certification

This section tells you if a visual is certified by Microsoft. Certification means that the visual meets certain specified code requirements and testing by the Power BI team.
For more information about certified visuals, see [Certified Power BI visuals](./power-bi-custom-visuals-certified.md).

## Privileges

Power BI visuals sometimes require access to data or other resources in your organization. This section describes what permissions a visual might need in order to work properly in the current version.
It's important to note that the admin can choose to block a visual from requesting a certain permission through the [Power BI visuals admin settings](/fabric/admin/organizational-visuals). If a visual requests a permission that's disables, the visual can't use that permission.

:::image type="content" source="./media/about-dialog/about-privileges.png" alt-text="Screenshot of list of privileges in the About dialog.":::

The following are the permissions a visual might request:

* [Call Power BI Download APIs](#call-power-bi-download-apis)
* [Make calls on behalf of signed in users](#make-calls-on-behalf-of-signed-in-users)
* [Access URLs](#access-urls)
* [Call Power BI local storage APIs](#call-power-bi-local-storage-apis)

Visuals can request permission for any or the following privileges:

### Call Power BI Download APIs

The [file download API](./file-download-api.md) lets users download data from a custom visual into a file on their storage device. Downloading data from a visual requires user consent and admin permission provided in the [Allow downloads from custom visuals tenant switch](/fabric/admin/organizational-visuals#export-data-to-file). If the admin doesn't enable this switch, the visual can't download data from Power BI.

If the visual has permission to call the download API, it can export files of the following types:

* .txt
* .csv
* .json
* .tmplt
* .xml
* .pdf
* .xlsx

### Make calls on behalf of signed in users

The visual might need to obtain a Microsoft Entra ID (formerly known as Azure AD) access tokens for signed-in users, to facilitate single sign-on authentication. Permission to access tokens requires user consent and admin permission provided in the [Obtain Microsoft Entra access token tenant switch](/fabric/admin/organizational-visuals#obtain-microsoft-entra-access-token). If the admin doesn't enable this switch, the visual can't access a token or make API calls on behalf of the user.

### Access URLs

This privilege allows a visual to send HTTP requests to specific URLs that the visual builder declares in advance.

There is no tenant admin switch for this permission. As long as [non-certified visuals are allowed](/fabric/admin/organizational-visuals#certified-power-bi-visuals), this privilege is granted.

### Call Power BI local storage APIs

The visual might want to [store data locally](./local-storage.md) on the user's device to help improve performance. The admin can [choose to block this permission](/fabric/admin/organizational-visuals#local-storage) in which case the visual can't store data locally.

## Related content

* [About tenant settings](/fabric/admin/tenant-settings-index)
* [Manage Power BI visuals admin settings](/fabric/admin/organizational-visuals).
