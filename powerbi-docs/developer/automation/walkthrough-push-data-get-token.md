---
title: Get an authentication access token
description: Walk through to push data - Get an authentication access token. 
author: KesemSharabi
ms.author: kesharab
ms.reviewer: madia
ms.service: powerbi
ms.subservice: powerbi-developer
ms.topic: tutorial
ms.custom: has-adal-ref
ms.date: 05/29/2019
---

# Step 2: Get an authentication access token

This article is the second step in the series [Push data into a Power BI dataset](walkthrough-push-data.md).

In step 1, you [registered a client app in Azure AD](../embedded/register-app.md). In this step, you get an authentication access token. Power BI apps are integrated with Azure Active Directory to provide your app with secure sign in and authorization. Your app uses a token to authenticate to Azure AD and gain access to Power BI resources.

## Get an authentication access token

Before starting, make sure you've completed the [previous step](../embedded/register-app.md) in the [Push data into a Power BI dataset](walkthrough-push-data.md) series. 

This procedure requires Visual Studio 2015 or later.

1. In Visual Studio, create a new C# **Console Application** project.

2. Install the [Azure AD Authentication Library for .NET NuGet package](https://www.nuget.org/packages/Microsoft.IdentityModel.Clients.ActiveDirectory/2.22.302111727). Your .Net app needs this package to get an authentication security token. 

     a. Select **Tools** > **NuGet Package Manager** > **Package Manager Console**.

     b. Enter **Install-Package Microsoft.IdentityModel.Clients.ActiveDirectory -Version 2.21.301221612**

     c. In Program.cs, add `using Microsoft.IdentityModel.Clients.ActiveDirectory;`.

3. Add the sample code listed after these steps to Program.cs.

4. Replace "{ClientID}", with the **Client ID** you got in the [previous series article](../embedded/register-app.md) when you registered your app.

5. Run your console app and sign in to your Power BI account. 

   A token string should appear in the console window.

**Sample code to get authentication security token**

Add this code to Program {...}.

* A token variable to call operations: 
  
  ```csharp
  private static string token = string.Empty;
  
  static void Main(string[] args)
  {
  }
  ```
* In static void Main(string[] args):
  
  ```csharp
  static void Main(string[] args)
  {
    //Get an authentication access token
    token = GetToken();
  }
  ```
* Add a GetToken() method:

```csharp
       #region Get an authentication access token
       private static async Task<string> GetToken()
       {
           // TODO: Install-Package Microsoft.IdentityModel.Clients.ActiveDirectory -Version 2.21.301221612
           // and add using Microsoft.IdentityModel.Clients.ActiveDirectory

           //The client id that Azure AD created when you registered your client app.
           string clientID = "{Client_ID}";

           //RedirectUri you used when you register your app.
           //For a client app, a redirect uri gives Azure AD more details on the application that it will authenticate.
           // You can use this redirect uri for your client app
           string redirectUri = "https://login.live.com/oauth20_desktop.srf";

           //Resource Uri for Power BI API
           string resourceUri = "https://analysis.windows.net/powerbi/api";

           //OAuth2 authority Uri
           string authorityUri = "https://login.microsoftonline.com/common/";

           //Get access token:
           // To call a Power BI REST operation, create an instance of AuthenticationContext and call AcquireToken
           // AuthenticationContext is part of the Active Directory Authentication Library NuGet package
           // To install the Active Directory Authentication Library NuGet package in Visual Studio,
           //  run "Install-Package Microsoft.IdentityModel.Clients.ActiveDirectory" from the nuget Package Manager Console.

           // AcquireToken will acquire an Azure access token
           // Call AcquireToken to get an Azure token from Azure Active Directory token issuance endpoint
           AuthenticationContext authContext = new AuthenticationContext(authorityUri);
           var token = authContext.AcquireTokenAsync(resourceUri, clientID, new Uri(redirectUri)).Result.AccessToken;

           Console.WriteLine(token);
           Console.ReadLine();

           return token;
       }

       #endregion
```

After you get an authentication token, you can call any Power BI operation.

The next article in this series shows you how to [Create a dataset in Power BI](walkthrough-push-data-create-dataset.md).


## Complete code listing

```csharp
using System;
using Microsoft.IdentityModel.Clients.ActiveDirectory;

namespace walkthrough_push_data
{
    class Program
    {
        private static string token = string.Empty;

        static void Main(string[] args)
        {

            //Get an authentication access token
            token = GetToken();

        }

        #region Get an authentication access token
        private static async Task<string> GetToken()
        {
            // TODO: Install-Package Microsoft.IdentityModel.Clients.ActiveDirectory -Version 2.21.301221612
            // and add using Microsoft.IdentityModel.Clients.ActiveDirectory

            //The client id that Azure AD created when you registered your client app.
            string clientID = "{Client_ID}";

            //RedirectUri you used when you register your app.
            //For a client app, a redirect uri gives Azure AD more details on the application that it will authenticate.
            // You can use this redirect uri for your client app
            string redirectUri = "https://login.live.com/oauth20_desktop.srf";

            //Resource Uri for Power BI API
            string resourceUri = "https://analysis.windows.net/powerbi/api";

            //OAuth2 authority Uri
            string authorityUri = "https://login.microsoftonline.com/common/";

            //Get access token:
            // To call a Power BI REST operation, create an instance of AuthenticationContext and call AcquireToken
            // AuthenticationContext is part of the Active Directory Authentication Library NuGet package
            // To install the Active Directory Authentication Library NuGet package in Visual Studio,
            //  run "Install-Package Microsoft.IdentityModel.Clients.ActiveDirectory" from the nuget Package Manager Console.

            // AcquireToken will acquire an Azure access token
            // Call AcquireToken to get an Azure token from Azure Active Directory token issuance endpoint
            AuthenticationContext authContext = new AuthenticationContext(authorityUri);
            var token = authContext.AcquireTokenAsync(resourceUri, clientID, new Uri(redirectUri)).Result.AccessToken;

            Console.WriteLine(token);
            Console.ReadLine();

            return token;
        }

        #endregion

    }
}
```



## Next steps

* The next article in this series is [Create a dataset in Power BI](walkthrough-push-data-create-dataset.md)
* [Overview of Power BI REST API](overview-of-power-bi-rest-api.md)  
* [Power BI REST APIs](/rest/api/power-bi/)  

More questions? [Try the Power BI Community](https://community.powerbi.com/)
