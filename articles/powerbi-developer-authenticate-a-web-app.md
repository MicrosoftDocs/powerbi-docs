<properties
   pageTitle="Authenticate a web app"
   description="Authenticate a web app"
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
   ms.date="01/06/2016"
   ms.author="derrickv"/>

# Authenticate a web app

[Download the web app sample](http://go.microsoft.com/fwlink/?LinkId=619279) | View the code on GitHub: [Default.aspx.cs](https://github.com/Microsoft/PowerBI-CSharp/blob/master/samples/webforms/get-started-web-app-asp.net/PBIWebApp/Default.aspx.cs) | [Redirect.aspx.cs](https://github.com/Microsoft/PowerBI-CSharp/blob/master/samples/webforms/get-started-web-app-asp.net/PBIWebApp/redirect.aspx.cs)

This article shows you how to authenticate a Power BI web app. It includes examples in C#; however, the authentication process is the same for other web programming languages. There is a [web app sample on GitHub](http://go.microsoft.com/fwlink/?LinkId=619279). To learn how to run the sample, see [Web app sample](https://msdn.microsoft.com/library/mt186158.aspx).

Power BI web apps use Active Directory (AAD) to authenticate users and protect applications. Authentication is the process of identifying an app or user. To identify your web app in AAD, you register your app with AAD. When you register a web app in AAD, you give your app access to the Power BI REST API resources. To learn how to register your Power BI web app, see [Register a web app](powerbi-developer-register-a-web-app.md).

To learn more about Azure Active Directory (Azure AD) authorization flow, see [Authorization Code Grant Flow](https://msdn.microsoft.com/library/azure/dn645542.aspx).

**NOTE** For Power BI, apps are created as multi-tenant apps using the Azure Management Portal.

## What you need to authenticate a Power BI web app
Here are the steps to authenticate a Power BI web app and perform a REST web request. These steps apply to an ASP.NET web app; however, the steps apply to other platforms. To learn more about OAuth 2.0 in Azure AD, see [OAuth 2.0 in Azure AD](https://msdn.microsoft.com/library/azure/dn645545.aspx).
<a name="register"/>
### Step 1 - Register your web app
When you register a web app in Azure Active Directory, you give your app access to the Power BI REST API resources. To register a Power BI web app, see [Register a web app](powerbi-developer-register-a-web-app.md).
<a name="configure"/>
### Step 2 - Configure Power BI settings to authenticate with Azure AD
Here are the settings you need to authenticate a Power BI web app with Azure AD.

|Setting|Description|Value|
|:--|:--|:--|
|Client ID|Client ID is used by the application to identify themselves to the users that they are requesting permissions from.|To get a Power BI app client id, see [How to get a client app id](powerbi-developer-register-a-web-app.md#clientID).|
|Client Secret|The client secret key is sent along with a Client ID when authenticating to Azure AD to call a web API.|To get a Power BI app client secret key, see [How to get a client secret key](powerbi-developer-register-a-web-app.md#clientSecret).|
|Resource Uri|The resource Uri to the Power BI resource to be authorized. You must use this exact Uri.|https://analysis.windows.net/powerbi/api|
|Authority Uri|The authority Uri is an Azure resource that takes a client id to get an access token.|https://login.windows.net/common/oauth2/authorize|
|Redirect Url|A Redirect Url for the web app url. The Azure AD service redirects back to the web app url with an authentication code.|Example: http://localhost:13526/Redirect|

<a name="create"/>
### Step 3 - Create a query string to get authorization code from Azure AD
To authenticate a Power BI web app, you first create a url query string to redirect to the Azure AD authentication service. After providing valid credentials, Azure AD returns an authorization code. The following is an example of a fully qualified Azure AD url with query string. You use a url similar to this to get an authorization code from Azure AD. Use **Response.Redirect**() to redirect to the Azure AD service that will return an authorization code from Azure AD. You use the authorization code in step 4 to acquire an access token by authorization code.

	https://login.windows.net/common/oauth2/authorize
	  ?response_type=code
	  &client_id=1861585d...9a79c296
	  &resource= https://analysis.windows.net/powerbi/api
	  &redirect_uri= http://localhost:13526/Redirect

**Power BI authentication query string settings**

|Setting|Description|
|:--|:--|
|response_type=code|Azure AD returns an authorization code.|
|client_id=1861585d...9a79c296|Client ID is used by the application to identify themselves to the users that they are requesting permissions from. You get the client id when you register your Azure app.|
|resource= https://analysis.windows.net/powerbi/api|Resource uri to the Power BI resource to be authorized. You must use this exact Uri.|
|redirect_uri= http://localhost:13526/Redirect|After user authenticates, Azure AD will redirect back to the web app.|

Here’s a C# code sample to create an Azure AD authorization url with a query string, and redirect to the Azure AD authority service.

**Example – C# sign in**

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
                {"resource", "https://analysis.windows.net/powerbi/api"},

                //After user authenticates, Azure AD will redirect back to the web app
                {"redirect_uri", "http://localhost:13526/Redirect"}
            };

            //Create sign-in query string
            var queryString = HttpUtility.ParseQueryString(string.Empty);
            queryString.Add(@params);

            //Redirect authority
            //Authority Uri is an Azure resource that takes a client id to get an Access token
            string authorityUri = "https://login.windows.net/common/oauth2/authorize/";
            Response.Redirect(String.Format("{0}?{1}", authorityUri, queryString));       
        }
<a name="acquire"/>
### Step 4 – Acquire an Azure AD access token using authorization code

To make a data request to the Power BI REST service, you need to supply an access token. In a .NET web app, you use the [Windows Azure Authentication Library (ADAL)](https://msdn.microsoft.com/library/azure/jj573266.aspx) to get an access token. If you do not have [Windows Azure Authentication Library (ADAL)](https://msdn.microsoft.com/library/azure/jj573266.aspx), see [How to add Azure Active Directory Authentication Library](#add).

After your app redirects to the Azure AD authority Uri and acquires an authorization code, your app gets a token by authorization code. Here’s how your app can get the authorization code and get an access token:
**In a Redirect class**:

1.	Get the Azure AD auth code that is returned from Azure AD.

	```
	string code = Request.Params.GetValues(0)[0];
	```
2.	Create an **AuthenticationContext** passing the authority uri and a TokenCache.

	```
    TokenCache TC = new TokenCache();

	AuthenticationContext AC = new AuthenticationContext(authorityUri, TC);
	```

3.	Create a **ClientCredential** passing the Azure App **Client ID** and Azure App **Client Secret**.

	```
	ClientCredential cc = new ClientCredential(Properties.Settings.Default.ClientID, Properties.Settings.Default.ClientSecretKey);
	```

4.	Get a token by authorization code passing the **authentication code** returned by Azure AD and a **redirect url**.

	```
	AuthenticationResult AR = AC.AcquireTokenByAuthorizationCode(code, new Uri(redirectUri), cc);
	```

5.	Redirect back to default.aspx.

	```
	Response.Redirect("/Default.aspx");
	```

6.	Set a session "authResult" index string to the AuthenticationResult so that you can use the result in the default.aspx page.

	```
	Session["authResult"] = AR;
	```

**In a Default.aspx page**:

1.	Get an **AuthenticationResult** from the Session. In Step 4, you use the **AuthenticationResult** to get an authorization **AccessToken**.

	```
	AuthenticationResult authResult = (AuthenticationResult)Session["authResult"];
	```

Here’s the complete code to acquire an Azure access token by authorization code and redirect back to default.aspx.

**Note** The Redirect Uri must match the redirect_uri used when requesting Authorization code.

    public partial class Redirect : System.Web.UI.Page
    {
      protected void Page_Load(object sender, EventArgs e)
      {
          //Redirect uri must match the redirect_uri used when requesting Authorization code.
          string redirectUri = "http://localhost:13526/Redirect";
          string authorityUri = "https://login.windows.net/common/oauth2/authorize/";

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
          Session["authResult"] = AR;

          //Redirect back to Default.aspx
          Response.Redirect("/Default.aspx");
      }
    }

    public partial class _Default : Page
    {
      public AuthenticationResult authResult { get; set; }
      string baseUri = "https://api.powerbi.com/beta/myorg/";

      protected void Page_Load(object sender, EventArgs e)
      {

          //Test for AuthenticationResult
          if (Session["authResult"] != null)
          {
              //Get the authentication result from the session
              authResult = (AuthenticationResult)Session["authResult"];

              //Show Power BI Panel
              signInStatus.Visible = true;

              //Set user and token from authentication result
              userLabel.Text = authResult.UserInfo.DisplayableId;
              accessTokenTextbox.Text = authResult.AccessToken;
          }
      }

      ...
    }

<a name="use"/>
### Step 5 – Use Azure AD access token to call a Power BI operation

Power BI REST API calls are made on behalf of an authenticated user by passing an access token acquired through Azure Active Directory, in the “Authorization” header. After you get an access token from Active Directory (AAD), you use the token to make a web request to the Power BI REST API.

Once you set an **AuthenticationResult** by acquiring a token by authorization code (**AcquireTokenByAuthorizationCode**), you get an Azure access token by getting the **AccessToken** property of **AuthenticationResult**.
Here’s the code to get Power BI **Datasets**.  The code sample creates a **WebRequest** and deserializes the response string to a Dataset.
To access the Power BI REST API, you create a request header setting “Authorization” to "Bearer {AccessToken}":

	request.Headers.Add("Authorization", String.Format("Bearer {0}", authResult.AccessToken));

**C# sample – Get Power BI Datasets**

		protected void getDatasetsButton_Click(object sender, EventArgs e)
        {
            string responseContent = string.Empty;

            //The resource Uri to the Power BI REST API resource
            string datasetsUri = "https://api.powerbi.com/v1.0/myorg/datasets";

            //Configure datasets request
            System.Net.WebRequest request = System.Net.WebRequest.Create(datasetsUri) as System.Net.HttpWebRequest;
            request.Method = "GET";
            request.ContentLength = 0;
            request.Headers.Add("Authorization", String.Format("Bearer {0}", authResult.AccessToken));

            //Get datasets response from request.GetResponse()
            using (var response = request.GetResponse() as System.Net.HttpWebResponse)
            {
                //Get reader from response stream
                using (var reader = new System.IO.StreamReader(response.GetResponseStream()))
                {
                    responseContent = reader.ReadToEnd();

                    //Deserialize JSON string
                    //JavaScriptSerializer class is in System.Web.Script.Serialization
                    JavaScriptSerializer json = new JavaScriptSerializer();
                    Datasets datasets = (Datasets)json.Deserialize(responseContent, typeof(Datasets));

                    resultsTextbox.Text = string.Empty;
                    //Get each Dataset from
                    foreach (dataset ds in datasets.value)
                    {
                        resultsTextbox.Text += String.Format("{0}\t{1}\n", ds.Id, ds.Name);
                    }
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

<a name="add"/>
## How to add Azure Active Directory Authentication Library
In a .NET client app, you use **AuthenticationContext** in the Active Directory Authentication Library to acquire an Azure access token. You can install the Active Directory Authentication Library NuGet package from Visual Studio. When you install a NuGet package, Visual Studio creates a reference to the required assemblies.

1. Right click a solution.
2. Choose Manage NuGet Packages.
3. Search for Active Directory Authentication Library.
4. Choose Active Directory Authentication Library in the list of packages, and click Install.

## Related topics
* [Azure AD Authentication Library for .NET](https://msdn.microsoft.com/library/azure/jj573266.aspx)
* [Active Directory Authentication Library (ADAL) v1 for .NET](http://www.cloudidentity.com/blog/2013/09/12/active-directory-authentication-library-adal-v1-for-net-general-availability/)
* [OAuth 2.0 in Azure AD](https://msdn.microsoft.com/library/azure/dn645545.aspx)
* [Authorization Code Grant Flow](https://msdn.microsoft.com/library/azure/dn645542.aspx)
* [Authentication Scenarios for Azure AD](https://msdn.microsoft.com/library/azure/dn499820.aspx)
