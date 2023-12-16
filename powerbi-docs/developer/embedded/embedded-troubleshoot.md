---
title: Troubleshoot Power BI embedded analytics application
description: This article discusses some common issues you may encounter when embedding content from Power BI.
author: mberdugo
ms.author: monaberdugo
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-developer
ms.custom: has-azure-ad-ps-ref
ms.topic: troubleshooting
ms.date: 01/24/2023
---

# Troubleshoot your embedded application

This article discusses some common issues that can come up when embedding content from Power BI.

## Troubleshooting tools

### Fiddler Trace

[Fiddler](https://www.telerik.com/fiddler) is a free tool from Telerik that monitors HTTP traffic. You can see the traffic with the Power BI APIs from the client machine. This tool might show errors and other related information.

:::image type="content" source="media/embedded-troubleshoot/fiddler.png" alt-text="Screenshot of the Fiddler tool output window, which shows the Power BI API HTTP traffic.":::

### F12 in Browser for frontend debugging

The F12 key launches the developer window within your browser. This tool lets you look at network traffic and see other valuable information.

:::image type="content" source="media/embedded-troubleshoot/browser-f12.png" alt-text="Screenshot of the web browser developer window's Network tab, which shows the network traffic.":::

### Extract error details from Power BI response

This code snippet shows how to extract the error details from an HTTP exception:

```csharp
public static string GetExceptionText(this HttpOperationException exc)
{
    var errorText = string.Format("Request: {0}\r\nStatus: {1} ({2})\r\nResponse: {3}",
    exc.Request.Content, exc.Response.StatusCode, (int)exc.Response.StatusCode, exc.Response.Content);
    if (exc.Response.Headers.ContainsKey("RequestId"))
    {
        var requestId = exc.Response.Headers["RequestId"].FirstOrDefault();
        errorText += string.Format("\r\nRequestId: {0}", requestId);
    }

    return errorText;
}
```

We recommend logging the Request ID (and error details for troubleshooting). Provide the Request ID when approaching Microsoft support.

## App registration

### App registration failure

Error messages within the Azure portal or the Power BI app registration page will notify you if you don't have sufficient privileges to register your app. To register an application, you must be an admin in the Azure AD tenant, or application registrations must be enabled for non-admin users.

### Power BI service doesn't appear in the Azure portal when registering a new app

At least one user must be signed up for Power BI. If you don't see **Power BI service** listed within the API list, no user is signed up for Power BI.

### What's the difference between an application object ID and a principal object ID?

When you register an Azure AD app, there are two parameters called *object ID*. This section explains the purpose of each parameter, and how to obtain it.

:::row:::

    :::column span="":::

        #### Application object ID

        The [application object](/azure/active-directory/develop/app-objects-and-service-principals#application-object) ID, also known simply as the *object ID*, is the unique ID of your Azure AD application object.

        To get the application object ID, navigate to your Azure AD app, and copy it from the *Overview*.

        :::image type="content" source="media/embedded-troubleshoot/object-id.png" alt-text="Screenshot of the Azure portal window, which shows the object ID in the Overview blade of an Azure AD application.":::

    :::column-end:::
    :::column span="":::

        #### Principal object ID

        The principal object ID, also known simply as the *object ID*, is the unique ID of the [service principal object](/azure/active-directory/develop/app-objects-and-service-principals#service-principal-object) associated with your Azure AD application.

        To get your principal object ID, navigate to your Azure AD app, and from the *Overview*, select the app link in **Managed application in local directory**.
        
            :::image type="content" source="media/embedded-troubleshoot/azure-overview-blade.png" alt-text="Screenshot of the Azure portal window, which shows the Managed application in local directory option in the Overview blade of an Azure AD application.":::
        
        From the *Properties* section, copy the **Object ID**.
        
            :::image type="content" source="media/embedded-troubleshoot/principal-object-id.png" alt-text="Screenshot of the Azure portal window, which shows the principal object ID in the properties section in the Overview blade of an Azure AD application.":::

    :::column-end:::
:::row-end:::

## Authentication

### Authentication failed with AADSTS70002 or AADSTS50053

***(AADSTS70002: Error validating credentials. AADSTS50053: You've tried to sign in too many times with an incorrect User ID or password)***

If you're using Power BI Embedded and Azure AD Direct authentication, you might receive a message like the previous message when you try to sign in, because direct authentication isn't enabled.

You can turn direct authentication back on using an [Azure AD policy](/azure/active-directory/manage-apps/configure-authentication-for-federated-users-portal#enable-direct-authentication-for-legacy-applications) that is scoped to the organization, or a [service principal](/azure/active-directory/develop/active-directory-application-objects#service-principal-object).

We recommend you enable this policy only on a per-app basis.

To create this policy, you need to be a **Global Administrator** for the directory where you're creating the policy and assigning it. Here's a sample script for creating the policy and assigning it to the SP for this application:

1. Install the [Azure AD Preview PowerShell module](/powershell/azure/active-directory/install-adv2).

2. Run the following PowerShell commands line-by-line (making sure the variable `$sp` doesn't have more than one application as a result).

```powershell
Connect-AzureAD
```

```powershell
$sp = Get-AzureADServicePrincipal -SearchString "Name_Of_Application"
```

```powershell
$policy = New-AzureADPolicy -Definition @("{`"HomeRealmDiscoveryPolicy`":{`"AllowCloudPasswordValidation`":true}}") -DisplayName EnableDirectAuth -Type HomeRealmDiscoveryPolicy -IsOrganizationDefault $false
```

```powershell
Add-AzureADServicePrincipalPolicy -Id $sp.ObjectId -RefObjectId $policy.Id 
```

After assigning the policy, wait approximately 15-20 seconds for propagation before testing.

### Generate token fails when providing effective identity

`GenerateToken` can fail with effective identity supplied for a few different reasons:

* The semantic model doesn't support effective identity.
* Username wasn't provided.
* Role wasn't provided.
* `DatasetId` wasn't provided.
* The user doesn't have the correct permissions.

To determine the problem, try the following steps:

* Run [get dataset](/rest/api/power-bi/datasets). Is the property `IsEffectiveIdentityRequired` true?
* Username is required for any `EffectiveIdentity`.
* If `IsEffectiveIdentityRolesRequired` is true, Role is required.
* `DatasetId` is required for any `EffectiveIdentity`.
* For Analysis Services, the master user has to be a gateway admin.

### AADSTS90094: The grant requires admin permission

***Symptoms:***

When a non-admin user tries to sign in to an application for the first time while granting consent, then gets one of the following errors:

* ```output
    ConsentTest needs permission to access resources in your organization that only an admin can grant. Ask an admin to grant permission to this app before you can use it.
    ```

* ```output
    AADSTS90094: The grant requires admin permission.
    ```

    :::image type="content" source="media/embedded-troubleshoot/consent-test-01.png" alt-text="Screenshot of the Azure portal window sign in dialog, which shows the Consent Test permission error.":::

An admin user can sign in and grant consent successfully.

***Root cause:***

User consent is disabled for the tenant.

***Several fixes are possible:***

* Enable user consent for the entire tenant (all users, all applications):

1. In the Azure portal, navigate to **Azure Active Directory** > **Users and groups** > **User settings**.
2. Enable the **Users can consent to apps accessing company data on their behalf** setting and save the changes.

:::image type="content" source="media/embedded-troubleshoot/consent-test-02.png" alt-text="Screenshot of the Azure portal.":::

* An admin can grant permissions to the application - either for the entire tenant or a specific user.

### CS1061 error

Download [Microsoft.IdentityModel.Clients.ActiveDirectory](https://www.nuget.org/packages/Microsoft.IdentityModel.Clients.ActiveDirectory/2.22.302111727) if you experience the following error:

```output
'AuthenticationContext' does not contain a definition for 'AcquireToken' and no accessible 'AcquireToken' accepting a first argument of type 'AuthenticationContext' could be found (are you missing a using directive or an assembly reference?)
```

### Azure AD token for a different tenant (guest user)

When you *embed for your organization*, to allow Azure AD guest users access to your content, you need to specify the tenant ID in the `authorityUri` parameter.

* URL for authenticating in your organization's tenant:

    `https://login.microsoftonline.com/common/v2.0`

* URL for authenticating a guest Azure AD user:

    `https://login.microsoftonline.com/<tenant ID>`

To find your tenant ID, you can use the instructions in [Find the Microsoft Azure AD tenant ID and primary domain name](/partner-center/find-ids-and-domain-names#find-the-microsoft-azure-ad-tenant-id-and-primary-domain-name).

For more information, see [Making your application multi-tenant](/azure/active-directory/develop/howto-convert-app-to-be-multi-tenant).

## Data sources

### ISV wants to have different credentials for the same data source

A data source can have a single set of credentials for one master user. If you need to use different credentials, create more master users. Then, assign the different credentials to each of the master users' contexts, and embed using the Azure AD token of that user.

## Troubleshoot your embedded application with the IError object

Use the [IError object returned by the error event from the JavaScript SDK](/javascript/api/overview/powerbi/troubleshoot-and-debug) to debug your application and better understand the cause of your errors.

After acquiring the IError object, you should look at the appropriate common errors table that fits the embed type you're using. Compare the **IError properties** with the ones in the table and find the possible reason(s) for the failure.

### Typical errors when embedding for Power BI users

| Message | Detailed Message | Error Code | Possible reason(s) |
|-------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------|-----------|--------------------------------------------------------|
| TokenExpired | Access token has expired, resubmit with a new access token | 403 | Expired token  |
| PowerBIEntityNotFound | Get report failed | 404 | <li> Wrong Report ID <li> Report doesn't exist  |
| Invalid parameters | powerbiToken parameter not specified | N/A | <li> No access token provided <li> No Report ID provided |
| LoadReportFailed | Fail to initialize - Couldn't resolve cluster | 403 | <li> Bad access token <li> Embed type doesn't match token type |
| PowerBINotAuthorizedException | Get report failed | 401 | <li> Wrong group ID <li> Unauthorized group |
| TokenExpired | Access token has expired, resubmit with a new access token. Couldn't render a report visual titled: *visual title* | N/A | <li> Query data <li> Expired token |
| OpenConnectionError | Can't display the visual. Couldn't render a report visual titled: *visual title* | N/A | Capacity paused or deleted while a report related to the capacity was open in a session |
| ExplorationContainer_FailedToLoadModel_DefaultDetails | Couldn't load the model schema associated with this report. Make sure you have a connection to the server and try again. | N/A | <li> Capacity paused <li> Capacity deleted |

### Typical errors when embedding for non-Power BI users (using an Embed Token)

| Message | Detailed Message | Error Code | Reason(s) |
|-------------------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------|------------|-------------------------------------------------|
| TokenExpired | Access token has expired, resubmit with a new access token | 403 | Expired token  |
| LoadReportFailed | Get report failed | 404 | <li> Wrong Report ID <li> Report doesn't exist  |
| LoadReportFailed | Get report failed | 403 | Report ID doesn't match token |
| LoadReportFailed | Get report failed | 500 | Report provided ID isn't a GUID |
| Invalid parameters | powerbiToken parameter not specified | N/A | <li> No access token provided <li> No Report ID provided |
| LoadReportFailed | Fail to initialize - Couldn't resolve cluster | 403 | Wrong token type or bad token |
| PowerBINotAuthorizedException | Get report failed | 401 | Wrong/unauthorized group ID |
| TokenExpired | Access token has expired, resubmit with a new access token. Couldn't render a report visual titled: *visual title* | N/A | <li> Query data <li> Expired token |
| OpenConnectionError | Can't display the visual. Couldn't render a report visual titled: *visual title* | N/A | Capacity paused or deleted while a report related to the capacity was open in a session |
| ExplorationContainer_FailedToLoadModel_DefaultDetails | Couldn't load the model schema associated with this report. Make sure you have a connection to the server and try again. | N/A | <li> Capacity paused <li> Capacity deleted |

### Get report fails - error 401 - resolve themselves

In the *user owns data* scenario, sometimes users will get a 401 error that resolves itself after they access the Power BI portal. When the 401 error happens, add the [RefreshUser Permissions](/rest/api/power-bi/users/refresh-user-permissions) call in the app as explained in [Update user permissions](embed-sample-for-your-organization.md#update-user-permissions).

## Semantic models

### Manage which portion of the data your users can see

Any user with read permissions for a semantic model can see the entire schema (tables, columns and measures) and all the data. You can't control viewing permissions to raw and aggregated data separately in the same semantic model.

To manage which portion of the data your users can view, use one of the following methods:

* Row-level filtering using Power BI [row-level security (RLS)](../../enterprise/service-admin-rls.md).

* [Object level security (OLS)](/analysis-services/tabular-models/object-level-security).

* Separate the data into different semantic models. For example, you can create a semantic model that only contains aggregated data and give your users access to only that semantic model.

## Content rendering

To resolve rendering issues in embedded Power BI items (such as reports and dashboards), review this section.

### Verify that the Power BI item loads in Power BI service

To rule out issues with your application *or the embedding APIs*, verify that the item can be viewed in the Power BI service (powerbi.com).

### Verify that the Power BI item loads in the Power BI embedded analytics playground

To rule out issues with your application, verify that the Power BI item can be viewed in the [Power BI embedded analytics playground](https://aka.ms/pbieplayground).

### Verify that your access token didn't expire

For security purposes, access tokens (an Azure AD token or an embed token) have a limited lifetime. You should constantly monitor your access token and refresh it if needed. For more information, see [Refresh the access token](/javascript/api/overview/powerbi/refresh-token).

## Performance

To get the best performing embedded content, we recommend that you follow the [Power BI embedded analytics best practices](embedded-performance-best-practices.md).

## Embed setup tool

You can go through the [Embedding setup tool](https://aka.ms/embedsetup) to quickly download a sample application. Then you can compare your application to the sample.

### Prerequisites

Verify that you have all the proper prerequisites before using the Embedding setup tool. You need a **Power BI Pro** account and a **Microsoft Azure** subscription.

* If you're not signed up for **Power BI Pro**, [sign up for a free trial](https://powerbi.microsoft.com/pricing/) before you begin.
* If you don't have an Azure subscription, create a [free account](https://azure.microsoft.com/free/?WT.mc_id=A261C142F) before you begin.
* You need to have your own [Azure Active Directory tenant](create-an-azure-active-directory-tenant.md) setup.
* You need [Visual Studio](https://www.visualstudio.com/) installed (version 2013 or later).

### Common Issues

Some common issues you might encounter while testing with the Embed setup tool are:

#### Using the Embed for your customers sample application

If you're working with the **Embed for your customers** experience, save and unzip the *PowerBI-Developer-Samples.zip* file. Then open the *PowerBI-Developer-Samples-master\App Owns Data* folder and run the *PowerBIEmbedded_AppOwnsData.sln* file.

* When selecting **Grant permissions** (the Grant permissions step), you get the following error:

 ```output
 AADSTS70001: Application with identifier <client ID> wasn't found in the directory <directory ID>
 ```

 The solution is to close the popup, wait a few seconds and try again. You might need to repeat this action a few times. A time interval causes the issue from completing the application registration process to when it's available to external APIs.

* The following error message appears when running the sample app:

 ```output
 Password is empty. Please fill password of Power BI username in web.config.
 ```

 This error occurs because the only value that isn't being injected into the sample application is your user password. Open the *Web.config* file in the solution and fill the `pbiPassword` field with your user's password.

* If you get the error:

```output
AADSTS50079: The user is required to use multi-factor authentication.
```

 You need to use an Azure AD account that doesn't have MFA enabled.

#### Using the Embed for your organization sample application

If you're working with the **Embed for your organization** experience, save and unzip the *PowerBI-Developer-Samples.zip* file. Then open the *PowerBI-Developer-Samples-master\User Owns Data\integrate-report-web-app* folder and run the *pbi-saas-embed-report.sln* file.

* When you run the **Embed for your organization** sample app, you get the following error:

 ```output
 AADSTS50011: The reply URL specified in the request doesn't match the reply URLs configured for the application: <client ID>
 ```

 This error is because the redirect URL specified for the web-server application is different from the sample's URL. If you want to register the sample application, use `https://localhost:13526/` as the redirect URL.

 If you want to edit the registered application, [update the Azure AD-registered application](/azure/active-directory/develop/quickstart-v1-update-azure-ad-app), so the application can provide access to the web APIs.

 If you want to edit your Power BI user profile or data, learn how to edit your [Power BI data](../../fundamentals/service-basic-concepts.md).

* If you get the error:

```output
AADSTS50079: The user is required to use multi-factor authentication.
```

 You need to use an Azure AD account that doesn't have MFA enabled.

For more information, please see [Power BI Embedded FAQ](embedded-faq.yml).

For further assistance, [contact support](https://powerbi.microsoft.com/support/pro/?Type=documentation&q=power+bi+embedded) or [create a support ticket via the Azure portal](https://ms.portal.azure.com/#blade/Microsoft_Azure_Support/HelpAndSupportBlade/newsupportrequest) and provide the error messages you encounter.

## Related content

> [!div class="nextstepaction"]
>[Power BI Embedded Frequently Asked Questions](embedded-faq.yml)

More questions? [Ask the Power BI Community](https://community.powerbi.com/)
