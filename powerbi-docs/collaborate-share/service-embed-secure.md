---
title: Embed a report in a secure portal or website
description: The Power BI embed feature provides a way to easily and securely embed reports in internal web portals.
author: maggiesMSFT
ms.author: maggies
ms.reviewer: lukaszp
ms.service: powerbi
ms.subservice: pbi-collaborate-share
ms.topic: how-to
ms.date: 04/04/2024
LocalizationGroup: Share your work
---

# Embed a report in a secure portal or website

With the **Embed** option for Power BI reports, you can easily and securely embed reports in internal web portals. These portals can be **cloud-based** or **hosted on-premises**, such as SharePoint 2019. Embedded reports respect all item permissions and data security through [row-level security (RLS)](/fabric/security/service-admin-row-level-security) and Analysis Services tabular model [object-level security (OLS)](/analysis-services/tabular-models/object-level-security). They provide no-code embedding into any portal that accepts a URL or iframe. 

The **Embed** option supports [URL filters](service-url-filters.md) and URL settings. It allows you to integrate with portals by using a low-code approach that requires only basic HTML and JavaScript knowledge.

## How to embed Power BI reports into portals

1. Open a report in the Power BI service.

2. On the **File** menu, select **Embed report** >  **Website or portal**.

    :::image type="content" source="media/service-embed-secure/power-bi-more-options-website.png" alt-text="Screenshot of Embed report selected from File menu with website or portal option highlighted.":::

3. In the **Secure embed code** dialog, select the value under **Here's a link you can use to embed this content**. Or if you'd like to use an iframe in a blog or website, select the value under **HTML you can paste into a website**.

    :::image type="content" source="../collaborate-share/media/service-embed-secure/securely-embed-report-in-website-or-portal.png" alt-text="Screenshot of Embed option dialogue box":::

4. Whether a user opens a report URL directly, or one that's embedded in a web portal, report access requires authentication. The following screen appears if a user hasn't signed in to Power BI in their browser session. When they select **Sign-In**, a new browser window or tab should open. Have them check for pop-up blockers if they don't get prompted to sign in.

    :::image type="content" source="./media/service-embed-secure/sign-in-power-bi-report.png" alt-text="Screenshot of Power BI Sign-in page displaying sign-in to view this report dialogue.":::

5. After the user has signed in, the report opens, showing the data and allowing page navigation and filter setting. Only users with view permission can see the report in Power BI. All [row-level security (RLS)](/fabric/security/service-admin-row-level-security) rules are also applied. The users need to be correctly licensed. They need a Power BI Pro or Premium Per User (PPU) license, or the content needs to be in a workspace that's in a Power BI Premium capacity. Users need to sign in each time they open a new browser window. However, after they're signed in, other reports load automatically.

    :::image type="content" source="./media/service-embed-secure/sales-and-marketing-sample-1.png" alt-text="Screenshot of Sales and Marketing sample report.":::

6. When you use an iframe, you might need to edit the **height**, and **width** values to have it fit in your portal's web page.

    :::image type="content" source="media/service-embed-secure/secure-embed-size.png" alt-text="Screenshot of se height and width dialogue box":::

## Grant report access

The **Embed** option doesn't automatically permit users to view the report. View permissions are set in the Power BI service.

In the Power BI service, you can share embedded reports with users who require access. If you use a Microsoft 365 Group, you can list the user as a workspace member.

## Licensing

To view the embedded report, you need  either a Power BI Pro or Premium Per User (PPU) license. Or, the content needs to be in a workspace that's in a [Power BI Premium capacity (EM or P SKU)](../enterprise/service-premium-what-is.md#capacities-and-skus).

## Customize your embed experience by using URL settings

You can customize the user experience by using the embed URL's input settings. In the provided iframe, you can update the URL's  **src** settings.

| Property  | Description  |
|-----------|--------------|
| pageName  | You can use the **pageName** query string parameter to set which report page to open. You can find this value at the report URL's end when you view a report in the Power BI service, as shown later in this article. |
| URL Filters  | You can use [URL Filters](service-url-filters.md) in the embed URL that you received from the Power BI UI to filter the embed content. This way you can build low-code integrations with only basic HTML and JavaScript experience.  |

## Set which page opens for an embedded report 

You can find the **pageName** value at the end of report's URL when you view a report in the Power BI service.

1. Open the report from the Power BI service in your web browser, and then copy the address bar URL.

    :::image type="content" source="media/service-embed-secure/secure-embed-report-section.png"alt-text="Screenshot of report section.":::

2. Append the **pageName** property and its value to the end of the URL.

    :::image type="content" source="media/service-embed-secure/secure-embed-append-page-name.png"alt-text="Screenshot of Appending the pageName setting to the URL with pageName=ReportSection 2 highlighted.":::

## Filter report content by using URL filters 

You can use [URL Filters](service-url-filters.md) to provide different report views. For example, the following URL filters the report to show data for the energy industry.

Using the combination of **pageName** and [URL Filters](service-url-filters.md) can be powerful. You can build experiences using basic HTML and JavaScript.

For example, here's a button you can add to an HTML page:

```html
<button class="textLarge" onclick='show("ReportSection", "Energy");' style="display: inline-block;">Show Energy</button>
```

When selected, the button calls a function to update the iframe with an updated URL, which includes the Energy industry filter.

```javascript
function show(pageName, filterValue)

{

var newUrl = baseUrl + "&pageName=" + pageName;

if(null != filterValue && "" != filterValue)

{

newUrl += "&$filter=Industries/Industry eq '" + filterValue + "'";

}

//Assumes there's an iFrame on the page with id="iFrame"

var report = document.getElementById("iFrame")

report.src = newUrl;

}
```

:::image type="content" source="media/service-embed-secure/secure-embed-filter.png"alt-text="Screenshot of Filter with $ filter equals industries slash industry e q Energy highlighted.":::

You can add as many buttons as you'd like to create a low-code custom experience. 

## Considerations and limitations

* Paginated reports are supported with secure embed scenarios, and paginated reports with URL parameters are also supported. For more information, see [Pass a report parameter in a URL for a paginated report in Power BI](../paginated-reports/parameters/pass-report-parameter-url.md).

* The secure embed option works for reports that are published to the Power BI service.

* To host securely embedded content, users must use HTTPS for their top-level page. Using an unsecured host page to access securely embedded content isn't supported.

* The user needs to sign in to view the report whenever they open a new browser window.

* For authentication, users need to have popup windows enabled.

* If users have successfully accessed reports in the past but are now encountering issues, they should clear their browser cache.

* Some browsers require you to refresh the page after sign-in, especially when you use InPrivate or Incognito modes.

* You might encounter issues if you use unsupported browser versions. For a list of browsers that Power BI supports, see [Supported browsers for Power BI](../fundamentals/power-bi-browsers.md).

* If your website sets the Cross-Origin-Opener-Policy (COOP) header to “same-origin,” you can't log in to view your embedded content because MSAL doesn't support this header. Instead, choose either "restrict-properties" (for Chromium-based browsers) or "same-origin-allow-popups." Alternatively, if you can't change the Cross-Origin-Opener-Policy, link to the embedded URL directly instead of embedding it in an iframe.

* The classic SharePoint Server isn't supported, because it requires Internet Explorer versions earlier than 11, or enabling the compatibility view mode.

* To achieve a single sign-on experience, use the [Embed in SharePoint Online option](service-embed-report-spo.md), or build a custom integration by using the [user-owns-data](../developer/embedded/embed-sample-for-your-organization.md) embedding method. 

* The automatic authentication capabilities provided with the **Embed** option don't work with the Power BI JavaScript API. They are blocked in PBI embedded client SDK starting with the version 2.10.4. For the Power BI JavaScript API, use the [user-owns-data](../developer/embedded/embed-sample-for-your-organization.md) embedding method.

* The automatic authentication capabilities don't work when they're embedded in applications, including in mobile and desktop applications.

* The authentication token lifetime is controlled based on your Microsoft Entra settings. When the authentication token expires, the user will need to sign in again to get an updated authentication token. The default lifetime is one hour, but it might be shorter or longer in your organization. You can't automatically refresh the token in this scenario.

## Related content

* [Ways to share your work in Power BI](service-how-to-collaborate-distribute-dashboards-reports.md)
* [Filter a report using query string parameters in the URL](service-url-filters.md)
* [Embed with report web part in SharePoint Online](service-embed-report-spo.md)
* [Publish to web from Power BI](service-publish-to-web.md)
