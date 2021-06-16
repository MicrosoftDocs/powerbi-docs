---
title: Authenticate users and get Azure AD access token for your Power BI embedded analytics application
description: Learn how to register an application in Azure Active Directory for use with embedding Power BI content.
author: KesemSharabi
ms.author: kesharab
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-developer
ms.topic: how-to
ms.date: 06/04/2019 
---

# Get an Azure AD access token for your Power BI application

This article shows how you can authenticate users in your Power BI application and retrieve an access token to use with the [Power BI REST API](/rest/api/power-bi/).

Before your app calls the REST API, you need to get an Azure Active Directory (Azure AD) **authentication access token**. Your app uses a token to get access to Power BI dashboards, tiles, and reports. To learn more, see [Authorize access to Azure Active Directory web applications using the OAuth 2.0 code grant flow](/azure/active-directory/develop/v1-protocols-oauth-code).

Depending on how you're embedding content, the access token is retrieved differently. This article shows two different approaches.

## Access token for Power BI users (user owns data)

This example is for when your users manually sign into Azure AD with their organization sign in. This task is used when embedding content for users that have Power BI service access.

### Get an Azure AD authorization code

The first step to get an **access token** is to get an authorization code from **Azure AD**. Construct a query string with the following properties, and redirect to **Azure AD**.

#### Authorization code query string

```csharp
var @params = new NameValueCollection
{
    //Azure AD will return an authorization code. 
    //See the Redirect class to see how "code" is used to AcquireTokenByAuthorizationCode
    {"response_type", "code"},

    //Client ID is used by the application to identify themselves to the users that they are requesting permissions from.
    //You get the client id when you register your Azure app.
    {"client_id", Properties.Settings.Default.ClientID},

    //Resource uri to the Power BI resource to be authorized
    // https://analysis.windows.net/powerbi/api
    {"resource", Properties.Settings.Default.PowerBiAPI},

    //After user authenticates, Azure AD will redirect back to the web app
    {"redirect_uri", "https://localhost:13526/Redirect"}
};
```

After you construct a query string, you redirect to **Azure AD** to get an **authorization code**.  Below is a complete C# method to construct an **authorization code** query string, and redirect to **Azure AD**. You then use the **authorization code** to get an **access token**.

Within redirect.aspx.cs, [AuthenticationContext.AcquireTokenByAuthorizationCode](/dotnet/api/microsoft.identitymodel.clients.activedirectory.authenticationcontext.acquiretokenbyauthorizationcodeasync#Microsoft_IdentityModel_Clients_ActiveDirectory_AuthenticationContext_AcquireTokenByAuthorizationCodeAsync_System_String_System_Uri_Microsoft_IdentityModel_Clients_ActiveDirectory_ClientCredential_System_String_) calls to generate the token.

#### Get authorization code

```csharp
protected void signInButton_Click(object sender, EventArgs e)
{
    //Create a query string
    //Create a sign-in NameValueCollection for query string
    var @params = new NameValueCollection
    {
        //Azure AD will return an authorization code. 
        //See the Redirect class to see how "code" is used to AcquireTokenByAuthorizationCode
        {"response_type", "code"},

        //Client ID is used by the application to identify themselves to the users that they are requesting permissions from. 
        //You get the client id when you register your Azure app.
        {"client_id", Properties.Settings.Default.ClientID},

        //Resource uri to the Power BI resource to be authorized
        // https://analysis.windows.net/powerbi/api
        {"resource", Properties.Settings.Default.PowerBiAPI},

        //After user authenticates, Azure AD will redirect back to the web app
        {"redirect_uri", "https://localhost:13526/Redirect"}
    };

    //Create sign-in query string
    var queryString = HttpUtility.ParseQueryString(string.Empty);
    queryString.Add(@params);

    //Redirect authority
    //Authority Uri is an Azure resource that takes a client id to get an Access token
    // AADAuthorityUri = https://login.microsoftonline.com/common/
    string authorityUri = Properties.Settings.Default.AADAuthorityUri;
    var authUri = String.Format("{0}?{1}", authorityUri, queryString);
    Response.Redirect(authUri);
}
```

### Get an access token from authorization code

Once **Azure AD** redirects back to your web app with an **authorization code**, you can use it to get an access token. Below is a C# sample that you can use in your redirect page and the default.aspx's `Page_Load` event.

You can retrieve the **Microsoft.IdentityModel.Clients.ActiveDirectory** namespace from the [Active Directory Authentication Library](https://www.nuget.org/packages/Microsoft.IdentityModel.Clients.ActiveDirectory/) NuGet package.

```powershell
Install-Package Microsoft.IdentityModel.Clients.ActiveDirectory
```

#### Redirect.aspx.cs

```csharp
using Microsoft.IdentityModel.Clients.ActiveDirectory;

protected void Page_Load(object sender, EventArgs e)
{
    //Redirect uri must match the redirect_uri used when requesting Authorization code.
    string redirectUri = String.Format("{0}Redirect", Properties.Settings.Default.RedirectUrl);
    string authorityUri = Properties.Settings.Default.AADAuthorityUri;

    // Get the auth code
    string code = Request.Params.GetValues(0)[0];

    // Get auth token from auth code
    TokenCache TC = new TokenCache();

    AuthenticationContext AC = new AuthenticationContext(authorityUri, TC);
    ClientCredential cc = new ClientCredential
        (Properties.Settings.Default.ClientID,
        Properties.Settings.Default.ClientSecret);

    AuthenticationResult AR = AC.AcquireTokenByAuthorizationCode(code, new Uri(redirectUri), cc);

    //Set Session "authResult" index string to the AuthenticationResult
    Session[_Default.authResultString] = AR;

    //Redirect back to Default.aspx
    Response.Redirect("/Default.aspx");
}
```

#### Default.aspx

```csharp
using Microsoft.IdentityModel.Clients.ActiveDirectory;

protected void Page_Load(object sender, EventArgs e)
{

    //Test for AuthenticationResult
    if (Session[authResultString] != null)
    {
        //Get the authentication result from the session
        authResult = (AuthenticationResult)Session[authResultString];

        //Show Power BI Panel
        signInStatus.Visible = true;
        signInButton.Visible = false;

        //Set user and token from authentication result
        userLabel.Text = authResult.UserInfo.DisplayableId;
        accessTokenTextbox.Text = authResult.AccessToken;
    }
}
```

## Access token for non-Power BI users (app owns data)

This approach is typically used for independent software vendor (ISV) type applications where the app owns access to the data. Users aren't necessarily Power BI users, and the application controls user authentication and access.

### Access token with a master account

For this approach, you use a single *master* account that is a Power BI Pro user. The account credentials are stored with the application. The application authenticates against Azure AD with these stored credentials. The example code shown below comes from the [App owns data sample](https://github.com/guyinacube/PowerBI-Developer-Samples)

### Access token with service principal

For this approach, you use a [service principal](embed-service-principal.md), that is an **app-only** token. The application authenticates against Azure AD with service principal. The example code shown below comes from the [App owns data sample](https://github.com/guyinacube/PowerBI-Developer-Samples)

#### EmbedService.cs

```csharp
var AuthorityURL  = "https://login.microsoftonline.com/<TenantId>/"
var ResourceURL  = "https://analysis.windows.net/powerbi/api"
var authenticationContext = new AuthenticationContext(AuthorityUrl);
       AuthenticationResult authenticationResult = null;
       if (AuthenticationType.Equals("MasterUser"))
       {
              // Authentication using master user credentials
              var credential = new UserPasswordCredential(Username, Password);
              authenticationResult = authenticationContext.AcquireTokenAsync(ResourceUrl, ApplicationId, credential).Result;
       }
       else
       {
             // Authentication using app credentials
             var credential = new ClientCredential(ApplicationId, ApplicationSecret);
             authenticationResult = await authenticationContext.AcquireTokenAsync(ResourceUrl, credential);
       }


m_tokenCredentials = new TokenCredentials(authenticationResult.AccessToken, "Bearer");
```

## Troubleshoot

Error message: "'AuthenticationContext' doesn't contain a definition for 'AcquireToken' and no accessible 'AcquireToken' accepting a first argument of type 'AuthenticationContext' could be found (are you missing a using directive or an assembly reference?)".

   Try downloading [Microsoft.IdentityModel.Clients.ActiveDirectory](https://www.nuget.org/packages/Microsoft.IdentityModel.Clients.ActiveDirectory/2.22.302111727) if you see this error.

## Next steps

Now that you have the access token, you can call the Power BI REST API to embed content.

More questions? [Try asking the Power BI Community](https://community.powerbi.com/)