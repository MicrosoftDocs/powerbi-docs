---
title: Embed with report web part in SharePoint Online
description: With Power BI's new report web part for SharePoint Online, you can easily embed interactive Power BI reports in SharePoint Online pages.
author: markingmyname
ms.author: maghan
manager: kfile
ms.reviewer: ''
featuredvideoid: ''
ms.service: powerbi
ms.component: powerbi-service
ms.topic: conceptual
LocalizationGroup: Share your work
ms.date: 10/01/2018
---

# Embed with report web part in SharePoint Online

With Power BI's new report web part for SharePoint Online, you can easily embed interactive Power BI reports in SharePoint Online pages.

When using the new **Embed in SharePoint Online** option, the embedded reports are fully secure so you can easily create secure internal portals.

## Requirements

There are a few requirements in order for **Embed in SharePoint Online** reports to work.

* You need a Power BI Pro license or a [Power BI Premium capacity (EM or P SKU)](service-premium.md#premium-capacity-nodes) with a Power BI license.
* The Power BI web part for SharePoint Online requires [Modern Pages](https://support.office.com/article/Allow-or-prevent-creation-of-modern-site-pages-by-end-users-c41d9cc8-c5c0-46b4-8b87-ea66abc6e63b).

## Embed your report

In order to embed your report into SharePoint Online, you first need to get the URL for the report and then use that URL with the new Power BI web part within SharePoint Online.

### Get a URL to your report

1. View the report within the Power BI service.

2. Select the **File** menu item.

3. Select **Embed in SharePoint Online**.
   
    ![](media/service-embed-report-spo/powerbi-file-menu.png)

4. Copy URL from dialog.

    ![](media/service-embed-report-spo/powerbi-embed-link-sharepoint.png)

   > [!NOTE]
   > You can also use the URL that is displayed in your web browser's address bar when viewing a report. That URL contains the report page you are currently viewing. You need to remove the report section, from the URL, if you want to use a different page.

### Add the Power BI report to a SharePoint Online page

1. Open the desired page in SharePoint Online and select **Edit**.

    ![](media/service-embed-report-spo/powerbi-sharepoint-edit-page.png)

    Or, create a new modern site page by selecting **+ New** within SharePoint Online.

    ![](media/service-embed-report-spo/powerbi-sharepoint-new-page.png)

2. Select **+** and select the **Power BI** web part.

    ![](media/service-embed-report-spo/powerbi-sharepoint-new-web-part.png)

3. Select **Add report**.

    ![](media/service-embed-report-spo/powerbi-sharepoint-new-report.png)

4. Past the report URL into the property pane. This is the URL you copied from the steps above. The report loads automatically.

    ![](media/service-embed-report-spo/powerbi-sharepoint-new-web-part-properties.png)

5. Select **Publish** to make the change visible to your SharePoint Online users.

    ![](media/service-embed-report-spo/powerbi-sharepoint-report-loaded.png)

## Granting access to reports

Embedding a report in SharePoint Online does not automatically give users permission to view the report. The permissions to view the report are set within the Power BI service.

> [!IMPORTANT]
> Make sure to review who can see the report within the Power BI service and grant access to those not listed.

There are two ways to provide access to the report within the Power BI service. If you are using an Office 365 Group to build your SharePoint Online team site, you list the user as a member of the **app workspace within the Power BI service** and the **SharePoint page**. This makes sure that users can view the contents of that group. For more information, see [Create and distribute an app in Power BI](service-create-distribute-apps.md).

Alternatively, you can grant users access to your report by doing the following.

1. Add a tile from the report to a dashboard.

2. Share the dashboard with the users that need access to the report. For more information, see [Share a dashboard with colleagues and others](service-share-dashboards.md).

## Web part settings

Below is a description of the settings that can be adjusted for the Power BI web part for SharePoint Online.

![](media/service-embed-report-spo/powerbi-sharepoint-web-part-properties.png)

| Property | Description |
| --- | --- |
| Page name |Sets the default page that is shown by the web part. Select a value from the drop-down. If no pages are displayed, either your report has one page, or the URL you pasted contains a page name. Remove the report section from the URL to select a specific page. |
| Display |Option to adjust how the report is fit within the SharePoint Online page. |
| Show Navigation Pane |Shows or hides the page navigation pane. |
| Show Filter Pane |Shows or hides the filter pane. |

## Multi-factor authentication

If your Power BI environment requires you to sign in using multi-factor authentication, you may be asked to sign-in with a security device to verify your identity. This occurs if you did not sign in to SharePoint Online using multi-factor authentication but your Power BI environment requires an account validated by a security device.

> [!NOTE]
> Multi-factor authentication is not yet supported with Azure Active Directory 2.0. Users receive a message saying *error*. If the user signs in again to SharePoint Online using their security device, they may be able to view the report.

## Reports that do not load

Your report may not load within the Power BI web part and may show the following message.

*This content isn't available.*

![](media/service-embed-report-spo/powerbi-sharepoint-report-not-found.png)

There are two common reasons for this message.

1. You do not have access to the report.
2. The report was deleted.

You should contact the owner of the SharePoint Online page to help you resolve the issue.

## Known issues and limitations

* Error: "An error occurred, please try logging out and back in and then revisiting this page. Correlation id: undefined, http response status: 400, server error code 10001, message: Missing refresh token"
  
  If you receive this error, please try one of the following.
  
  1. Sign-out of SharePoint and sign back in. Be sure to close all browser windows before signing back in.

  2. If your user account requires multi-factor authentication (MFA), ensure you sign in to SharePoint using your multi-factor authentication device (phone app, smart card, etc.)
  
  3. Azure B2B Guest users accounts are not supported. Users see the Power BI logo that shows the part is loading, but it doesn't show the report.

* Power BI does not support the same localized languages that SharePoint Online does. As a result, you may not see proper localization within the embedded report.

* You may encounter issues if using Internet Explorer 10. You can look at the [browsers support for Power BI](consumer/end-user-browsers.md) and for [Office 365](https://products.office.com/office-system-requirements#Browsers-section).

* The Power BI web part is not available for [sovereign clouds](https://powerbi.microsoft.com/en-us/clouds/).

* The classic SharePoint Server is not supported with this web part.

* [URL filters](service-url-filters.md) are not supported with the SPO web part.

## Next steps

[Allow or prevent creation of modern site pages by end users](https://support.office.com/article/Allow-or-prevent-creation-of-modern-site-pages-by-end-users-c41d9cc8-c5c0-46b4-8b87-ea66abc6e63b)  
[Create and distribute an app in Power BI](service-create-distribute-apps.md)  
[Share a dashboard with colleagues and others](service-share-dashboards.md)  
[Power BI Premium - what is it?](service-premium.md)  

More questions? [Try asking the Power BI Community](http://community.powerbi.com/)