---
title: Get an authentication access token
description: Walkthrough to push data - Get an authentication access token
author: markingmyname
ms.author: maghan
manager: kfile
ms.reviewer: madia
ms.service: powerbi
ms.subservice: powerbi-developer
ms.topic: conceptual
ms.date: 02/05/2019
---

# Step 2: Get an authentication access token

This article is part of a step-by-step walkthrough to [push data into a dataset](walkthrough-push-data.md).

In **step 1** of Push data into a dataset, [Register the app with Azure AD](walkthrough-push-data-register-app-with-azure-ad.md), you registered a client app in Azure AD. In this step, you get an authentication access token. Power BI apps are integrated with **Azure AD** to provide secure sign in and authorization for your app. You use a token to authenticate to **Azure AD** and gain access to Power BI resources.

Here's how to get an authentication access token.

## Get an authentication access token

> **NOTE**: Before you get started, make sure you have followed the previous steps in the [push data into a dataset](walkthrough-push-data.md) walkthrough.
> 
> 

1. In Visual Studio 2015, create a **Console Application** project.
2. Install the [Azure AD Authentication Library for .NET NuGet package](https://www.nuget.org/packages/Microsoft.IdentityModel.Clients.ActiveDirectory/). To get an authentication security token in a .NET app, you use this package. Here's how to install the package:

     a. In Visual Studio 2015, choose **Tools** > **NuGet Package Manager** > **Package Manager Console**.

     b. In **Package Manager Console**, enter Install-Package Microsoft.IdentityModel.Clients.ActiveDirectory -Version 2.21.301221612.
3. Add the code below into class Program {...}.
4. Replace "{ClientID}", with the **Client ID** you got when you registered the app. See [Register the app with Azure AD](walkthrough-push-data-register-app-with-azure-ad.md).
5. After installing the Microsoft.IdentityModel.Clients.ActiveDirectory package, add **using Microsoft.IdentityModel.Clients.ActiveDirectory;** to Program.cs.
6. Run the Console App, and login to your Power BI account. You should see a token string in the Console Window.

**Sample code to get authentication security token**

Add this code to Program {...}.

* A token variable to call operations:
  
  ```
  private static string token = string.Empty;
  
  static void Main(string[] args)
  {
  }
  ```
* In static void Main(string[] args):
  
  ```
  static void Main(string[] args)
  {
    //Get an authentication access token
    token = GetToken();
  }
  ```
* Add a GetToken() method:

```
       #region Get an authentication access token
       private static string GetToken()
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
           string authorityUri = "https://login.microsoftonline.net/common/";

           //Get access token:
           // To call a Power BI REST operation, create an instance of AuthenticationContext and call AcquireToken
           // AuthenticationContext is part of the Active Directory Authentication Library NuGet package
           // To install the Active Directory Authentication Library NuGet package in Visual Studio,
           //  run "Install-Package Microsoft.IdentityModel.Clients.ActiveDirectory" from the nuget Package Manager Console.

           // AcquireToken will acquire an Azure access token
           // Call AcquireToken to get an Azure token from Azure Active Directory token issuance endpoint
           AuthenticationContext authContext = new AuthenticationContext(authorityUri);
           string token = authContext.AcquireToken(resourceUri, clientID, new Uri(redirectUri)).AccessToken;

           Console.WriteLine(token);
           Console.ReadLine();

           return token;
       }

       #endregion
```

After you get an authentication token, you can call any Power BI operation. The next step shows you how to call the [PostDataset](https://docs.microsoft.com/rest/api/power-bi/pushdatasets) operation to create a dataset to push data into a dashboard.

The next step shows you how to [create a dataset in Power BI](walkthrough-push-data-create-dataset.md).

Below is the [complete code listing](#code).

<a name="code"/>

## Complete code listing

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
            private static string GetToken()
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
                string authorityUri = "https://login.microsoftonline.net/common/";

                //Get access token:
                // To call a Power BI REST operation, create an instance of AuthenticationContext and call AcquireToken
                // AuthenticationContext is part of the Active Directory Authentication Library NuGet package
                // To install the Active Directory Authentication Library NuGet package in Visual Studio,
                //  run "Install-Package Microsoft.IdentityModel.Clients.ActiveDirectory" from the nuget Package Manager Console.

                // AcquireToken will acquire an Azure access token
                // Call AcquireToken to get an Azure token from Azure Active Directory token issuance endpoint
                AuthenticationContext authContext = new AuthenticationContext(authorityUri);
                string token = authContext.AcquireToken(resourceUri, clientID, new Uri(redirectUri)).AccessToken;

                Console.WriteLine(token);
                Console.ReadLine();

                return token;
            }

            #endregion

        }
    }

[Next Step >](walkthrough-push-data-create-dataset.md)

## Next steps

[Create a dataset in Power BI](walkthrough-push-data-create-dataset.md)  
[Register an app with Azure AD](walkthrough-push-data-register-app-with-azure-ad.md)  
[Azure AD Authentication Library for .NET NuGet package](https://www.nuget.org/packages/Microsoft.IdentityModel.Clients.ActiveDirectory/)  
[Push data into a Power BI dataset](walkthrough-push-data.md)  
[Overview of Power BI REST API](overview-of-power-bi-rest-api.md)  
[Power BI REST API reference](https://docs.microsoft.com/rest/api/power-bi/)  
More questions? [Try the Power BI Community](http://community.powerbi.com/)