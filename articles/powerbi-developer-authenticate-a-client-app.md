<properties
   pageTitle="Authenticate a client app"
   description="Authenticate a client app"
   services="powerbi"
   documentationCenter=""
   authors="guyinacube"
   manager="erikre"
   backup=""
   editor=""
   tags=""
   qualityFocus="no"
   qualityDate=""/>

<tags
   ms.service="powerbi"
   ms.devlang="NA"
   ms.topic="article"
   ms.tgt_pltfrm="NA"
   ms.workload="powerbi"
   ms.date="12/07/2016"
   ms.author="asaxton"/>

# Authenticate a client app

[Download the .NET client app sample](http://go.microsoft.com/fwlink/?LinkId=619280) | [View the code on GitHub](http://go.microsoft.com/fwlink/?LinkId=619429)

This article shows you how to authenticate a Power BI client app. It includes examples in C#; however, the authentication process is the same for other programming languages.

For a complete C# sample that shows how to authenticate a Power BI client app, see [Client app sample](https://msdn.microsoft.com/library/mt186159.aspx).

Power BI client apps use **Azure Active Directory** (AAD) to authenticate users and protect applications. Authentication is the process of identifying an app or user. To identify your client app in AAD, you register your app with AAD. When you register a client app in AAD, you give your app access to the Power BI APIs. To learn how to register your Power BI client app, see [Register a client app](powerbi-developer-register-a-client-app.md).

Power BI REST API calls are made on behalf of an authenticated user by passing a token in the "Authorization" header of the request. The token is acquired through Azure Active Directory.

**Note** For Power BI Private Preview, apps are created as multi-tenant apps using the Azure Management Portal.

<a name="What"></a>
## What you need to authenticate a Power BI client app
To authenticate a Power BI client app and perform a REST web request, you need to:

1. **Register your client app** - To register a Power BI client app, see [Register a client app](powerbi-developer-register-a-client-app.md).	When you register a client app in **Azure Active Directory**, you give your app access to the Power BI APIs.
2. **Assign the client id for your app** - To get the client id for your app, see [How to get a client app id](powerbi-developer-register-a-client-app.md#clientID). The Client ID is used by the application to identify themselves to the users that they are requesting permissions from.
	- In your client app code, assign the **clientID** variable to the client id of your Azure application.
3. **Assign the redirect Uri** - For a client app, a redirect uri gives AAD more details about the specific application it will authenticate. A uniform resource identifier (URI) is a value to identify a name of a resource.
	- In your client app code, assign the **redirectUri** to "https://login.live.com/oauth20_desktop.srf". Since a client app does not have an external service to redirect to, this URI is the standard placeholder for client apps.

4. **Assign the resource Uri for Power BI API** - The resource Uri identifies the Power BI API resource.
	- In your client app code, assign the **resourceUri** to "https://analysis.windows.net/powerbi/api".
5. **Assign the OAuth2 authority uri** - The authority Uri identifies the OAuth2 authority resource.
	- In your client app code, assign an authority Uri to "https://login.windows.net/common/oauth2/authorize".
6. **Assign the dataset Uri for the Power BI API datasets**	- The datasets Uri identifies the Power BI API datasets resource.
	- In your client app code, assign the **datasetsUri** to "https://api.powerbi.com/v1.0/myorg/datasets".

To make a data request to the Power BI REST service, you need to supply an access token. In a .NET client app, you use the [Azure AD Authentication Library for .NET nuget package](https://www.nuget.org/packages/Microsoft.IdentityModel.Clients.ActiveDirectory/) to get an access token. Here’s the process. Below is an example **AccessToken()** method.

If you do not have Windows Azure Authentication Library (ADAL), see [How to add Azure Active Directory Authentication Library](#Library).

**Important** To authenticate a client app, you must add a reference to **Microsoft.IdentityModel.Clients.ActiveDirectory** which is included in the Windows Azure Authentication Library (ADAL).

## Steps to get an access token
1. **Create an instance of AuthenticationContext** - AuthenticationContext is the main class representing the token issuing authority for Azure AD resources. The constructor takes:
	- An OAuth2 authorityUri

	```
            //OAuth2 authority Uri
            string authorityUri = "https://login.windows.net/common/oauth2/authorize";
	AuthenticationContext  authContext = new AuthenticationContext(authorityUri);
	```
2. **Call AuthenticationContext.AcquireToken() to get a token** -  The method takes:
	- Power BI API resourceUri
	- Your Power BI app clientID
	- Your Power BI app redirectUri

	```
	string token = authContext.AcquireToken(resourceUri, clientId, new Uri(redirectUri), PromptBehavior.RefreshSession).AccessToken;
	```

For more information about what AuthenticationContext does to get a token, see [Azure Authentication Context Flow](#Flow).

## C# example - Get access token

In a .NET client app, you use **AuthenticationContext** to get an access token.

```
      static string AccessToken()
      {
            //Get access token:
            // To call a Power BI REST operation, create an instance of AuthenticationContext and call AcquireToken
            // AuthenticationContext is part of the Active Directory Authentication Library NuGet package
            // To install the Active Directory Authentication Library NuGet package in Visual Studio,
            //  run "Install-Package Microsoft.IdentityModel.Clients.ActiveDirectory" from the nuget Package Manager Console.

            //Resource Uri for Power BI API
            string resourceUri = "https://analysis.windows.net/powerbi/api";

            string clientId = {clientIDFromAzureAppRegistration};

            //A redirect uri gives AAD more details about the specific application that it will authenticate.
            //Since a client app does not have an external service to redirect to, this Uri is the standard placeholder for a client app.
            string redirectUri = "https://login.live.com/oauth20_desktop.srf";

            // Create an instance of AuthenticationContext to acquire an Azure access token
            // OAuth2 authority Uri
            string authorityUri = "https://login.windows.net/common/oauth2/authorize";
            AuthenticationContext authContext = new AuthenticationContext(authorityUri);

            // Call AcquireToken to get an Azure token from Azure Active Directory token issuance endpoint
            //  AcquireToken takes a Client Id that Azure AD creates when you register your client app.
            //  To learn how to register a client app and get a Client ID, see https://msdn.microsoft.com/library/dn877542(Azure.100).aspx   
            string token = authContext.AcquireToken(resourceUri, clientID, new Uri(redirectUri)).AccessToken;

            return token;
      }
```
<a name="Datarequest"></a>
## Make a data request to Power BI REST API using a token

After you get an access token from Active Directory (AAD), you use the token to make a web request to the Power BI REST API. To create a Power BI REST web request, you add an access token to the request header as:


```
request.Headers.Add("Authorization", String.Format("Bearer {0}", AccessToken()));
```


## C# example - Power BI REST API data request using a token

For a complete C# sample that shows how to authenticate a Power BI client app and call all Power BI REST operations, see [Client app sample](https://msdn.microsoft.com/library/mt186159.aspx) or [view the code on GitHub](http://go.microsoft.com/fwlink/?LinkId=619429).

```
        static dataset[] GetDatasets()
        {
            //This is sample code to illustrate a Power BI operation.
            //In a production application, refactor code into specific methods and use appropriate exception handling.

            //Power BI Datasets Url
            string powerBIApiUrl = "https://api.powerbi.com/v1.0/myorg/datasets";

            //Get Azure AD access token (see above)
            string token = AccessToken();

            //GET web request to list all datasets.
            //To get a datasets in a group, use the Groups uri: https://api.PowerBI.com/v1.0/myorg/groups/{group_id}/datasets
            HttpWebRequest request = System.Net.WebRequest.Create(powerBIApiUrl) as System.Net.HttpWebRequest;
            request.KeepAlive = true;
            request.Method = "GET";
            request.ContentLength = 0;
            request.ContentType = "application/json";

            //Add access token to Request header
            request.Headers.Add("Authorization", String.Format("Bearer {0}", token));

            //Get HttpWebResponse from GET request
            using (HttpWebResponse httpResponse = request.GetResponse() as System.Net.HttpWebResponse)
            {
                //Get StreamReader that holds the response stream
                using (StreamReader reader = new System.IO.StreamReader(httpResponse.GetResponseStream()))
                {
                    string responseContent = reader.ReadToEnd();

                    JavaScriptSerializer jsonSerializer = new JavaScriptSerializer();
                    Datasets datasets = (Datasets)jsonSerializer.Deserialize(responseContent, typeof(Datasets));

                    return datasets.value;
                }
            }
        }

public class Datasets
{
	public dataset[] value { get; set; }
}

public class dataset
{
	public string Id { get; set; }
	public string Name { get; set; }
}

```
<a name="Flow"></a>
## Azure Authentication Context Flow
In a .NET client app, you use **AuthenticationContext** to acquire an Azure access token. **AuthenticationContext** is the main class representing the token issuing authority for Azure AD resources. **AuthenticationContext** does the following:

1. AuthenticationContext starts the flow by redirecting the user agent to the Azure Active Directory authorization endpoint. The user authenticates and consents, if consent is required.

2. The Azure Active Directory authorization endpoint redirects the user agent back to the AuthenticationContext with an authorization code. The user agent returns an authorization code to the client application’s redirect URI.

3. The AuthenticationContext requests an access token from the Azure Active Directory token issuance endpoint. It presents the authorization code to prove that the user has consented.

4. The Azure Active Directory token issuance endpoint returns an access token.

5. The client application uses the access token to authenticate to the Web API.

6. After authenticating the client application, the Power BI REST API returns the requested data.


To learn more about Azure Active Directory (Azure AD) authorization flow, see [Authorization Code Grant Flow](https://msdn.microsoft.com/library/azure/dn645542.aspx).

<a name="Library"></a>
## How to add Azure Active Directory Authentication Library

In a .NET client app, you use **AuthenticationContext** in the **Active Directory Authentication Library** to acquire an Azure access token. You can install the **Active Directory Authentication Library** NuGet package from Visual Studio. When you install a NuGet package, Visual Studio creates a reference to the required assemblies.

1. Right click a solution.

2. Choose **Manage NuGet Packages**.

3. Search for **Active Directory Authentication Library**.

4. Choose **Active Directory Authentication Library** in the list of packages, and click **Install**.

## See also

[Azure AD Authentication Library for .NET nuget package](https://www.nuget.org/packages/Microsoft.IdentityModel.Clients.ActiveDirectory/)  
[Active Directory Authentication Library (ADAL) v1 for .NET](http://www.cloudidentity.com/blog/2013/09/12/active-directory-authentication-library-adal-v1-for-net-general-availability/)  
[OAuth 2.0 in Azure AD](https://msdn.microsoft.com/library/azure/dn645545.aspx)  
[Authorization Code Grant Flow](https://msdn.microsoft.com/library/azure/dn645542.aspx)  
[Authentication Scenarios for Azure AD](https://azure.microsoft.com/en-us/documentation/articles/active-directory-authentication-scenarios/)  
More questions? [Try the Power BI Community](http://community.powerbi.com/)