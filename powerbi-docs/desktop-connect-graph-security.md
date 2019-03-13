---
title: Connect to the Microsoft Graph Security API in Power BI Desktop
description: Easily connect to the Microsoft Graph Security API in Power BI Desktop
author: preetikr
manager: kfile
ms.reviewer:
ms.custom: seojan19
ms.service: powerbi
ms.subservice: powerbi-desktop
ms.topic: conceptual
ms.date: 01/29/2019
ms.author: preetikr

LocalizationGroup: Connect to data
---
# Connect to the Microsoft Graph Security API in Power BI Desktop

Use the Microsoft Graph Security connector of Power BI Desktop to connect to the [Microsoft Graph Security API](https://aka.ms/graphsecuritydocs). You can then build dashboards and reports to gain insights into your security-related [alerts](https://docs.microsoft.com/graph/api/resources/alert?view=graph-rest-1.0) and [secure scores](https://docs.microsoft.com/graph/api/resources/securescores?view=graph-rest-beta).

The Microsoft Graph Security API connects [multiple security solutions](https://aka.ms/graphsecurityalerts) from Microsoft and its ecosystem partners to make correlation of alerts easier. This combination provides access to rich contextual information and simplifies automation. It empowers organizations to quickly gain insights and act across multiple security products, while reducing cost and complexity.

## Prerequisites to use the Microsoft Graph Security connector

* To use the Microsoft Graph Security connector, you must *explicitly* get consent by the Azure Active Directory (Azure AD) tenant administrator. See 
[Microsoft Graph Security authentication requirements](https://aka.ms/graphsecurityauth).
Consent requires the connector's application ID and name, which is cited here and is available in the [Azure portal](https://portal.azure.com):

   | Property | Value |
   |----------|-------|
   | **Application name** | `MicrosoftGraphSecurityPowerBIConnector` |
   | **Application ID** | `cab163b7-247d-4cb9-be32-39b6056d4189` |
   |||

   To grant consent for the connector, your Azure AD tenant
   administrator can use either of these methods:

   * [Grant consent for Azure AD applications](https://docs.microsoft.com/azure/active-directory/develop/v2-permissions-and-consent)

   * Respond to a request that your logic app submits during its first run through the
   [application-consent experience](https://docs.microsoft.com/azure/active-directory/develop/application-consent-experience)
   
* The user account that signs in to the Microsoft Graph Security connector must be a member of the Security Reader Limited Admin role in Azure AD, either as *Security Reader* or *Security Administrator*. See [Assign Azure AD roles to users](https://docs.microsoft.com/graph/security-authorization#assign-azure-ad-roles-to-users).

## Using the Microsoft Graph Security connector

Follow these steps to use the connector:

1. Select **Get Data** -> **More** from the **Home** ribbon in Power BI Desktop.
2. Select **Online Services** from the categories list on the left side of the window.
3. Select **Microsoft Graph Security (Beta)**.

    ![Get Data dialog box](media/desktop-connect-graph-security/GetData.PNG)
    
4. In the **Microsoft Graph Security** window, select the Microsoft Graph API version to query: **v1.0** or **beta**.

    ![Select-version dialog box](media/desktop-connect-graph-security/selectVersion.PNG)
    
5. Sign in to your Azure Active Directory account when you're prompted. This account needs to have the *Security Reader* role, as mentioned in the previous section.

    ![Sign in](media/desktop-connect-graph-security/SignIn.PNG) 
    
6. If you're the tenant admin *and* you don't yet have consent to the Microsoft Graph Security Power BI connector (application), you'll see the following dialog box. Select **Consent on behalf of your organization**.

    ![Admin-consent dialog box](media/desktop-connect-graph-security/AdminConsent.PNG)
    
7. When you're signed in, you'll see the following dialog box that indicates that you've been authenticated. Select **Connect**.

    !["You are currently signed in" dialog box](media/desktop-connect-graph-security/SignedIn.PNG)
    
8. After you connect, the **Navigator** window displays the alerts, secure scores, and other entities that are available in the [Microsoft Graph Security API](https://aka.ms/graphsecuritydocs) for the version that you selected in step 4. Select one or more entities to import and use in Power BI Desktop. Then, select **Load** to get the result view that's shown after step 9.

    ![Navigator dialog box](media/desktop-connect-graph-security/NavTable.PNG)
    
9. If you want to use an advanced query with the Microsoft Graph Security API, select **Specify custom Microsoft Graph Security URL to filter results**. Use this function to issue an [OData.Feed](https://docs.microsoft.com/power-bi/desktop-connect-odata) query to the Microsoft Graph Security API with the required permissions.

   The following example uses the `https://graph.microsoft.com/v1.0/security/alerts?$filter=Severity eq 'High'` *serviceUri*. To see how to build queries to filter, order, or retrieve the most-recent results, refer to [OData system query options](https://docs.microsoft.com/graph/query-parameters).

   ![OdataFeed example](media/desktop-connect-graph-security/ODataFeed.PNG)
    
   When you select **Invoke**, the **OData.Feed** function makes a call to the API, which opens Query Editor. You filter and refine the set of data that you want to use. Then, you load that data into Power BI Desktop.

Here's the results window for the Microsoft Graph Security entities that we queried for:

   ![Results windows example](media/desktop-connect-graph-security/Result.PNG)
    

Now you’re ready to use the imported data from the Microsoft Graph Security connector in Power BI Desktop. You can create graphics or reports. Or, you can interact with other data that you import from Excel workbooks, databases, or other data sources.

## Next steps
* Check out Power BI samples and templates that use this connector at [Microsoft Graph Security GitHub Power BI samples](https://aka.ms/graphsecuritypowerbiconnectorsamples).

* For user scenarios and additional information, see [this Microsoft Graph Security Power BI connector blog post](https://aka.ms/graphsecuritypowerbiconnectorblogpost).

* You can connect to all sorts of data by using Power BI Desktop. For more information, check out the following resources:

    * [What is Power BI Desktop?](desktop-what-is-desktop.md)
    * [Data sources in Power BI Desktop](desktop-data-sources.md)
    * [Shape and combine data with Power BI Desktop](desktop-shape-and-combine-data.md)
    * [Connect to Excel workbooks in Power BI Desktop](desktop-connect-excel.md)
    * [Enter data directly into Power BI Desktop](desktop-enter-data-directly-into-desktop.md)