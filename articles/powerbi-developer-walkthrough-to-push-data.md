<properties
   pageTitle="Walkthrough to push data into a Power BI dashboard"
   description="Walkthrough to push data into a Power BI dashboard"
   services="powerbi"
   documentationCenter=""
   authors="dvana"
   manager="mblythe"
   editor=""
   tags=""/>

<tags
   ms.service="powerbi"
   ms.devlang="NA"
   ms.topic="article"
   ms.tgt_pltfrm="NA"
   ms.workload="powerbi"
   ms.date="02/16/2016"
   ms.author="derrickv"/>

# Walkthrough to push data into a Power BI dashboard
With the Power BI REST API, you can push data into a Power BI dashboard. For example, you want to extend an existing business workflow to push key data into your dashboard. In this case, you want to push a Sales Marketing dataset which has a Product table.

Before you get started, make sure to [setup your app environment in Azure Active Directory (Azure AD)](data-catalog-what-you-need-to-create-an-app). Power BI apps are integrated with **Azure AD** to provide secure sign in and authorization for your app. After you register an app in **Azure AD**, the application outsources authentication to Azure AD, and grants your app access to the Power BI REST API.

Here's how to use the Power BI API to push data into a dashboard. In this example, you push a Sales Marketing dataset with a Product table into your dashboard.

<a name="push_step1"/>
**Step 1** – Register the app with Azure AD. You need to do this first so that you have a Client ID that identifies your app in Azure AD. Here are the steps:
1. Go to dev.powerbi.com/apps.
2. Click **Sign in with your existing account**, and sign into your Power BI account.
3. Enter an **App Name** such as "Sample push data client app".
4. For **App Type**, choose **Native app**.
5. Enter a **Redirect URL**. For a **Native client app**, a redirect uri gives **Azure AD** more details on the specific application that it will authenticate. Any valid Uri will work such as https://login.live.com/oauth20_desktop.srf.
6. For **Choose APIs to access**, choose **Read All Datasets**. For all Power BI app permissions, see [App permissions](powerbi-developer-app-permissions.md).
7. Click **Register app**, and save the **Client ID** that was generated. A **Client ID** identifies the app in Azure AD.

<a name="push_step2"/>
**Step 2** – In Visual Studio, create a **Console Application** project, and follow these steps:

1. Paste the code below into Program.cs replacing void Main(string[] args).
2. Replace "{ClientID}", with the **Client ID** you got when you registered the app. See [Step 1 – Register a Native client app](#register_1).
3. Install the [Azure AD Authentication Library for .NET NuGet package](https://www.nuget.org/packages/Microsoft.IdentityModel.Clients.ActiveDirectory/). To get an authentication security token in a .NET app, you use this package. Here's how to install the package:

a.	In Visual Studio 2015, choose **Tools** > **NuGet Package Manager** > **Package Manager Console**.

b.	In **Package Manager Console**, enter Install-Package Microsoft.IdentityModel.Clients.ActiveDirectory -Version 2.21.301221612.

4. After the package is installed, add **using Microsoft.IdentityModel.Clients.ActiveDirectory**,  **using System.Net**, and **using System.IO** to Program.cs.
5. Run the Console App, and login to your Power BI account. You should see **Dataset Created** in the Console Window.

**Sample get authentication security token**
using Microsoft.IdentityModel.Clients.ActiveDirectory;
using System.IO;
using System.Net;
    	…

    	static void Main(string[] args)
        {
            //The client id that Azure AD creates when you register your client app.
            string clientID = "{ ClientID}";

            //RedirectUri you used when you register your app.
            //For a client app, a redirect uri gives Azure AD more details on the application that it will authenticate.
            // You can use this redirect uri for your client app
            string redirectUri = "https://login.live.com/oauth20_desktop.srf";

            //Resource Uri for Power BI API
            string resourceUri = "https://analysis.windows.net/powerbi/api";

            //OAuth2 authority Uri
            string authorityUri = "https://login.windows.net/common/oauth2/authorize";

            string powerBIApiUrl = "https://api.powerbi.com/v1.0/myorg";

            //Get access token:
            // To call a Power BI REST operation, create an instance of AuthenticationContext and call AcquireToken
            // AuthenticationContext is part of the Active Directory Authentication Library NuGet package
            // To install the Active Directory Authentication Library NuGet package in Visual Studio,
            //  run " Install-Package Microsoft.IdentityModel.Clients.ActiveDirectory -Version 2.21.301221612" from the nuget Package Manager Console.

            // AcquireToken will acquire an Azure access token
            // Call AcquireToken to get an Azure token from Azure Active Directory token issuance endpoint
            AuthenticationContext authContext = new AuthenticationContext(authorityUri);
            string token = authContext.AcquireToken(resourceUri, clientID, new Uri(redirectUri)).AccessToken;

            //*** Add code to Push data into a Power BI dashboard ***
            //POST web request to create a dataset.
            //To create a Dataset in a group, use the Groups uri: https://api.PowerBI.com/v1.0/myorg/groups/{group_id}/datasets
            HttpWebRequest request = System.Net.WebRequest.Create(string.Format("{0}/datasets", powerBIApiUrl)) as System.Net.HttpWebRequest;
            request.KeepAlive = true;
            request.Method = "POST";
            request.ContentLength = 0;
            request.ContentType = "application/json";
            request.Headers.Add("Authorization", String.Format("Bearer {0}", token));

            //Create dataset JSON for POST request
            string json = "{\"name\": \"SalesMarketing\", \"tables\": " +
                "[{\"name\": \"Product\", \"columns\": " +
                "[{ \"name\": \"ProductID\", \"dataType\": \"Int64\"}, " +
                "{ \"name\": \"Name\", \"dataType\": \"string\"}, " +
                "{ \"name\": \"Category\", \"dataType\": \"string\"}," +
                "{ \"name\": \"IsCompete\", \"dataType\": \"bool\"}," +
                "{ \"name\": \"ManufacturedOn\", \"dataType\": \"DateTime\"}" +
                "]}]}";

            //POST web request
            byte[] byteArray = System.Text.Encoding.UTF8.GetBytes(json);
            request.ContentLength = byteArray.Length;

            //Write JSON byte[] into a Stream
            using (Stream writer = request.GetRequestStream())
            {
                writer.Write(byteArray, 0, byteArray.Length);

                var response = (HttpWebResponse)request.GetResponse();

                Console.WriteLine(string.Format("Dataset {0}", response.StatusCode.ToString()));

                Console.ReadLine();
            }
        }

## See also
- [What you need to create an app](powerbi-developer-what-you-need-to-create-an-app.md)
