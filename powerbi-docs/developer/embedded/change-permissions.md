---
title: Edit your Microsoft Entra app's permission settings
description: Learn how to change the API permissions on your Microsoft Entra application.
author: mberdugo
ms.author: monaberdugo
keywords: 
ms.date: 10/21/2024
ms.topic: overview
ms.service: powerbi
ms.subservice: powerbi-developer
ms.custom: 
---

# Microsoft Entra permissions

When you [register your Microsoft Entra app](./register-app.md), you grant it permission to access various APIs. As your needs change, you might want to adjust these permissions. This article shows you how.

>[!NOTE]
>Microsoft Entra app permissions are only applicable for these scenarios:
>
>* *Embed for your organization*
>* *Embed for your customers* with the *master user* authentication method

<a name='edit-the-permission-settings-on-your-azure-active-directory-app'></a>

## Edit the permission settings on your Microsoft Entra app

Permission changes can be made programmatically, or in the Azure portal.

### [Azure portal](#tab/Azure)

In the Azure portal, you can view your app and make changes to its permissions.

1. Sign into the [Azure portal](https://portal.azure.com).

2. Select your Microsoft Entra tenant by selecting your account in the upper right corner of the page.

3. Select **App registrations**. If you can't see this option, search for it.

4. From the **Owned applications** tab, select your app. The application opens in the *Overview* tab, where you can review the *Application ID*.

5. Select the **View API permissions** tab.

    :::image type="content" source="media/change-permissions/api-permissions.png" alt-text="Screenshot of View API permissions tab.":::

6. Select **Add a permission**.

7. To add permissions, follow these steps (note that the first step is different for GCC apps):

    1. From the **Microsoft APIs** tab, select **Power BI service**.
       > [!NOTE]
       > For GCC apps, Select the **APIs my organization uses** tab, and search for either *Microsoft Power BI Government Community Cloud* OR *fc4979e5-0aa5-429f-b13a-5d1365be5566*.
       > :::image type="content" source="media/change-permissions/find-gcc-apis.png" alt-text="Screenshot of GCC permissions tab.":::

    2. Select **Delegated Permissions** and add or remove the specific permissions you need.

    3. When you're done, select **Add permissions** to save your changes.

8. To remove a permission, follow these steps:

    1. Select the ellipsis (...) to the right of the permission.

    2. Select **Remove permission**.

    3. In the *Remove permission* pop-up window, select **Yes, remove**.

### [HTTP](#tab/HTTP)

To change your Microsoft Entra app permissions programmatically, you'll need to get the existing service principals (users) within your tenant. For information on how to do that, see [servicePrincipal](/graph/api/resources/serviceprincipal).

1. To get all the service principals within your tenant, call the `Get servicePrincipal` API without `{ID}`.

2. Check for a service principal with your app's *application ID* as the `appId` property. (`displayName` is optional.)

    ```json
    Post https://graph.microsoft.com/v1.0/servicePrincipals HTTP/1.1
    Authorization: Bearer ey..qw
    Content-Type: application/json
    {
    "accountEnabled" : true,
    "appId" : "{App_Client_ID}",
    "displayName" : "{App_DisplayName}"
    }
    ```

3. Grant Power BI permissions to your app, by assigning one of these values to `consentType`:

    * `AllPrincipals` - Can only be used by a Power BI admin to grant permissions on behalf of all the users in the tenant.

    * `Principal` - Use to grant permissions on behalf of a specific user. If you're using this option, add the `principalId={User_ObjectId}` property to the request body.

     ```json
     Post https://graph.microsoft.com/v1.0/OAuth2PermissionGrants HTTP/1.1
     Authorization: Bearer ey..qw
     Content-Type: application/json
     {
     "clientId":"{Service_Plan_ID}",
     "consentType":"AllPrincipals",
     "resourceId":"a0a0a0a0-bbbb-cccc-dddd-e1e1e1e1e1e1",
     "scope":"Dataset.ReadWrite.All Dashboard.Read.All Report.Read.All Group.Read Group.Read.All Content.Create Metadata.View_Any Dataset.Read.All Data.Alter_Any",
     "expiryTime":"2018-03-29T14:35:32.4943409+03:00",
     "startTime":"2017-03-29T14:35:32.4933413+03:00"
     }
     ```

    > [!NOTE]
    >
    > * If you're using a **master user**, to avoid being prompted for consent by Microsoft Entra ID, you need to grant permissions to the master account.
    > * The `resourceId` *c78a3685-1ce7-52cd-95f7-dc5aea8ec98e* is tenant dependent and not universal. This value is the *objectId* of the *Power BI Service* application in Microsoft Entra ID. To get this value from the Azure portal, navigate to [Enterprise applications > All applications](https://portal.azure.com/#blade/Microsoft_AAD_IAM/StartboardApplicationsMenuBlade/AllApps), and search for *Power BI Service*.

4. Grant app permissions to Microsoft Entra ID, by assigning a value to `consentType`.

    ```json
    Post https://graph.microsoft.com/v1.0/OAuth2PermissionGrants HTTP/1.1
    Authorization: Bearer ey..qw
    Content-Type: application/json
    {
    "clientId":"{Service_Plan_ID}",
    "consentType":"AllPrincipals",
    "resourceId":"a0a0a0a0-bbbb-cccc-dddd-e1e1e1e1e1e1",
    "scope":"User.Read Directory.AccessAsUser.All",
    "expiryTime":"2018-03-29T14:35:32.4943409+03:00",
    "startTime":"2017-03-29T14:35:32.4933413+03:00"
    }
    ```

### [C#](#tab/CSharp)

You can also change your Microsoft Entra app permissions using C#. For more information see the [oAuth2PermissionGrant](/graph/api/oauth2permissiongrant-get) API. This method can be useful if you're considering automating some of your processes.

```csharp
var graphClient = GetGraphClient();

currentState.createdApp = await graphClient.Applications
    .Request()
    .AddAsync(application);

System.Threading.Thread.Sleep(2000);

var passwordCredential = new PasswordCredential
{
    DisplayName = "Client Secret Created in C#"
};

currentState.createdSecret = await graphClient.Applications[currentState.createdApp.Id]
    .AddPassword(passwordCredential)
    .Request()
    .PostAsync();

var servicePrincipal = new ServicePrincipal
{
    AppId = currentState.createdApp.AppId
};

currentState.createdServicePrincipal = await graphClient.ServicePrincipals
    .Request()
    .AddAsync(servicePrincipal);

GraphServiceClient graphClient = new GraphServiceClient(authProvider);

// Use oAuth2PermissionGrant to change permissions
var oAuth2PermissionGrant = await graphClient.Oauth2PermissionGrants["{id}"]
               .Request()
               .GetAsync();
```

---

## Related content

* [Considerations when generating an embed token](generate-embed-token.md)
* [Capacity and SKUs in Power BI embedded analytics](embedded-capacity.md)
