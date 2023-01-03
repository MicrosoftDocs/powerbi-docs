---
title: Embed a report web part in SharePoint Online
description: With Power BI's report web part for SharePoint Online, you can easily embed interactive Power BI reports in SharePoint Online pages.
author: maggiesMSFT
ms.author: maggies
ms.reviewer: ''
featuredvideoid: ''
ms.service: powerbi
ms.subservice: pbi-collaborate-share
ms.topic: how-to
LocalizationGroup: Share your work
ms.date: 10/26/2022
---

# Embed a report web part in SharePoint Online

The Power BI report web part for SharePoint Online allows you to embed interactive Power BI reports in SharePoint Online pages.

When you use the **Embed in SharePoint Online** option, the embedded reports respect all item permissions and data security through [row-level security (RLS)](../enterprise/service-admin-rls.md), so you can easily create secure internal portals.

## Requirements

For **Embed report in SharePoint Online** reports to work:

* The Power BI web part for SharePoint Online requires [Modern Pages](https://support.office.com/article/Allow-or-prevent-creation-of-modern-site-pages-by-end-users-c41d9cc8-c5c0-46b4-8b87-ea66abc6e63b).
* To use an embedded report, users must sign in to the Power BI service to activate their Power BI license.
* A Power BI Pro or Premium Per User (PPU) license is required to embed a web part in SharePoint Online. Users with a free Power BI license can't embed reports, but they can view if the report is hosted in [Power BI Premium capacity (EM or P SKU)](../enterprise/service-premium-gen2-what-is.md). In that case, you only need a free Power BI license to view reports that are embedded in SharePoint Online. 
    > [!Note]
    > There's no free license for organizations in Power BI National clouds. In this environment, a Power BI Pro or Premium Per User (PPU) license is required to access to the embedded report in SharePoint.

## Embed your report
To embed your report into SharePoint Online, you need to get the report URL and use it with SharePoint Online's Power BI web part.

### Get a report URL

1. Open a report in the Power BI service.

2. On the **File** menu, select **Embed report** > **SharePoint Online**.

    ![Screenshot showing More options menu with SharePoint Online highlighted.](media/service-embed-report-spo/power-bi-more-options-sharepoint-online.png)

3. Copy the report URL from the dialog box.

    ![Screenshot of the Embed link dialog with the report link highlighted.](media/service-embed-report-spo/powerbi-embed-link-sharepoint.png)

### Add the Power BI report to a SharePoint Online page

1. Open the target page in SharePoint Online and select **Edit**.

    ![Screenshot of the SharePoint edits page with edit option highlighted.](media/service-embed-report-spo/powerbi-sharepoint-edit-page.png)

    Or, in SharePoint Online, select **Pages** > **+ New** > **Site Page** to create a new modern site page.

    ![Screenshot of the SharePoint window. Pages is highlighted in the navigation pane. Site page is selected.](media/service-embed-report-spo/powerbi-sharepoint-new-page.png)

2. Select the **+** in **New** dropdown menu. In the **Data analysis** section, select **Power BI** web part.

    ![Screenshot of the Data analysis section showing Power BI selected.](media/service-embed-report-spo/powerbi-sharepoint-new-web-part.png)

3. Select **Add report**.

    ![Screenshot of the SharePoint new report dialog asking to include a report on your page with add report button displayed.](media/service-embed-report-spo/add-powerbi-report.png)  

4. Paste the previously copied report URL into the **Power BI report link** field. The report loads automatically.

    ![Screenshot of the SharePoint new web part properties with Power BI report link highlighted.](media/service-embed-report-spo/powerbi-sharepoint-new-web-part-properties.png)

5. Select **Publish** to make the change visible to your SharePoint Online users.

    ![Screenshot of the Power Power BI report link showing the Publish option selected.](media/service-embed-report-spo/powerbi-sharepoint-report-loaded.png)

## Grant access to reports

Embedding a report in SharePoint Online doesn't automatically give users permission to view the report - you need to set view permissions in Power BI.

> [!IMPORTANT]
> Make sure to review who can see the report within the Power BI service, and grant access to those that aren't listed.

There are two ways to provide report access in Power BI. 

### In a Microsoft 365 Group

If you're using a Microsoft 365 Group to build your SharePoint Online team site, list the user as a member of the **workspace within the Power BI service** and the **SharePoint page**. 

### Share directly with users

Embed a report within an app, and share it directly with users:  

1. The author, who must be a Pro user, creates a report in a workspace. To share with *Power BI free users*, the author needs to set the workspace as a *Premium workspace*.

2. The author publishes the app and installs it. The author must install the app so it has access to the report URL that's used for embedding in SharePoint Online.

3. All end users need to install the app too. You can also use the **Install app automatically** feature. You can enable this feature in the [Power BI admin portal](../admin/service-admin-portal.md), so the app is pre-installed for end users.

   ![Screenshot of the Power BI admin portal with Install app automatically selected.](media/service-embed-report-spo/install-app-automatically.png)

4. The author opens the app and goes to the report.

5. The author copies the embedded report URL from the report the app installed. Don't use the original report URL from the workspace.

6. Create a new team site in SharePoint Online.

7. Add the previously copied report URL to the Power BI web part.

8. Add all end users and/or groups who are going to consume the data on the SharePoint Online page and in the Power BI app you created.

    > [!NOTE]
    > To see the report on the SharePoint page, users or groups need access to both the SharePoint Online page and the report in the Power BI app.

Now the end user can go to the team site in SharePoint Online and view the reports on the page.

## Multi-factor authentication

If your Power BI environment requires you to sign in using multi-factor authentication, you might be asked to sign in with a security device to verify your identity. This can occur if you didn't sign in to SharePoint Online using multi-factor authentication. Your Power BI environment requires a security device to validate an account.

> [!NOTE]
> Power BI doesn't support multi-factor authentication with Azure Active Directory 2.0. Users will see an error message. If the user signs in again to SharePoint Online using their security device, they may be able to view the report.

## Web part settings

Here are the settings you can adjust for the Power BI web part for SharePoint Online:  

![Screenshot of the SharePoint new web part properties dialog with the Power BI report link highlighted.](media/service-embed-report-spo/powerbi-sharepoint-web-part-properties.png)

| Property | Description |
| --- | --- |
| Page name |Sets the web part's default page. Select a value from the drop-down. If no pages are displayed, either your report has one page, or the URL you pasted contains a page name. Remove the report section from the URL to select a specific page. |
| Display |Adjusts how the report fits within the SharePoint Online page. |
| Show Nav Pane |Shows or hides the page nav pane. |
| Show Filter Pane |Shows or hides the filter pane. |

## Reports that don't load

If your report doesn't load within the Power BI web part, you might see the following message:

![Screenshot of the SharePoint page with the Power Bi report showing the content isn't available message.](media/service-embed-report-spo/powerbi-sharepoint-report-not-found.png)

There are two common reasons for this message.

1. You don't have report access.
2. The report was deleted.

Contact the SharePoint Online page owner to help resolve the issue.

## Licensing

Users viewing a report in SharePoint need either a **Power BI Pro or Premium Per User (PPU) license** or the content needs to be in a workspace that's in a **[Power BI Premium capacity (EM or P SKU)](../enterprise/service-admin-premium-purchase.md)**.

## Known issues and limitations

* Error: "An error occurred, try logging out and back in and then revisiting this page. Correlation ID: undefined, http response status: 400, server error code 10001, message: Missing refresh token"
  
  If you receive this error, try one of the following steps to troubleshoot:
  
  1. Sign out of SharePoint and sign back in. Be sure to close all browser windows before signing back in.

  2. If your user account requires multi-factor authentication (MFA), sign in to SharePoint with your MFA device (phone app, smart card, etc.).
  
  3. Azure B2B Guest users accounts aren't supported. Users see the Power BI logo that shows the part is loading, but it doesn't show the report.

* Power BI doesn't support the same localized languages that SharePoint Online does. As a result, you might not see proper localization within the embedded report.

* You might encounter issues if you use Internet Explorer 10. <!--You can look at the [browsers support for Power BI](../fundamentals/power-bi-browsers.md) and for [Microsoft 365](https://products.office.com/office-system-requirements#Browsers-section). -->

* The Power BI web part isn't available for [national clouds](https://powerbi.microsoft.com/clouds/).

* The classic SharePoint Server isn't supported with this web part.

* [URL filters](service-url-filters.md) aren't supported with the SharePoint Online web part.

## Next steps

* [Allow users to create modern pages](https://support.office.com/article/Allow-or-prevent-creation-of-modern-site-pages-by-end-users-c41d9cc8-c5c0-46b4-8b87-ea66abc6e63b)  
* [Publish an app in Power BI](service-create-distribute-apps.md)  
* [Share Power BI reports and dashboards with coworkers and others](service-share-dashboards.md)  
* [What is Power BI Premium?](../enterprise/service-premium-gen2-what-is.md)
* [Embed a report in a secure portal or website](service-embed-secure.md)

More questions? [Try asking the Power BI Community](https://community.powerbi.com/)
