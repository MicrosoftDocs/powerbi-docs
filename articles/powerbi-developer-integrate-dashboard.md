<properties
   pageTitle="Integrate a Power BI dashboard into an app"
   description="Walkthrough to integrate a tile into an app, sample code"
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
   ms.topic="get-started-article"
   ms.tgt_pltfrm="NA"
   ms.workload="powerbi"
   ms.date="02/20/2017"
   ms.author="asaxton"/>

# Integrate a dashboard into an app

Learn how to integrate, or embed, a dashboard into a web app using C# and the **Power BI** API, some JavaScript code, and an IFrame.

![](media\powerbi-developer-integrate-dashboard\powerbi-embed-dashboard.png)

To get started with this walkthrough, you need a **Power BI** account. If you don't have an account, see [Sign up for Power BI]( powerbi-admin-free-with-custom-azure-directory.md).

To integrate a dashboard into a web app, you use the **Power BI** API, and an Azure Active Directory (AD) authorization **access token** to get a dashboard and tile. Then, you load the tile into an **IFrame** using the same access token. The **Power BI** API provides programmatic access to certain **Power BI** resources. See [Overview of Power BI REST API](https://msdn.microsoft.com/library/dn877544.aspx). 

## Download the sample

This article shows the code used in the [Integrate a dashboard sample](https://github.com/Microsoft/PowerBI-CSharp/tree/master/samples/webforms/embed-a-dashboard-into-an-app) on GitHub. To follow along with this walkthrough, you should download the sample.

## Step 1 - register an app in Azure AD

In order to use the Power BI API, you will have to register an app with your Azure Active Directory tenant. You need to do this first so that you have a **Client ID** and **Client Secret** that identifies your web app in Azure AD. Without a **Client ID** and **Client Secret**, Azure AD cannot authenticate your web app. If you downloaded the [Integrate a dashboard sample](https://github.com/Microsoft/PowerBI-CSharp/tree/master/samples/webforms/embed-a-dashboard-into-an-app), you use the **Client ID** and **Client Secret** you get after registration to configure the sample so that the sample can authenticate to Azure AD.

We have created a page to help you with the registration. You can browse to [dev.powerbi.com/apps](https://dev.powerbi.com/apps) to perform this step.

1. Go to [dev.powerbi.com/apps](https://dev.powerbi.com/apps).

2. Select **Sign in with your existing account**, and sign into your Power BI account.

    ![](media\powerbi-developer-integrate-dashboard\powerbi-embed-dashboard-register-app1.png)

3. Enter an **App Name**. For this walkthrough, enter **Integrate a dashboard sample**.

4. For **App Type**, select **Server-side Web app** from the dropdown.

    ![](media\powerbi-developer-integrate-dashboard\powerbi-embed-dashboard-register-app2.png)

5. Enter a **Redirect URL**. For this walkthrough, Azure AD redirects back to the default page, so enter http://localhost:13526. Azure Active Directory (AD) will redirect to this page with an **Authorization Code**. To learn how to acquire an **Access Token** to access **Power BI** dashboards using an **Authorization Code**, see [Get an authentication access token](powerbi-developer-integrate-tile-get-dashboard.md#get-token).

6. Enter a **Home Page**. For this walkthrough, enter http://localhost:13526 which is the home page for the sample.

7. For **Choose APIs to access**, select **Read All Dashboards**. For all Power BI app permissions, see [App permissions](powerbi-developer-power-bi-permissions.md).

    ![](media\powerbi-developer-integrate-dashboard\powerbi-embed-dashboard-register-app3.png)

8. Select **Register app**, and save the **Client ID** and **Client Secret** that was generated. A **Client ID** and **Client Secret** identifies the app in Azure AD.

### Configure the sample application

If you downloaded the [Integrate a dashboard sample](https://github.com/Microsoft/PowerBI-CSharp/tree/master/samples/webforms/embed-a-dashboard-into-an-app), you use the **Client ID** and **Client Secret** you get after registration so that the sample can authenticate to Azure AD. To configure the sample, change the **Client ID** and **Client Secret** in web.config.

![](media\powerbi-developer-integrate-dashboard\powerbi-embed-dashboard-register-app4.png)

## Step 2 - get a dashboard

To get a **Power BI** dashboard, you use the [Get Dashboards](https://msdn.microsoft.com/library/mt465739.aspx) operation which gets a list of **Power BI** dashboards. From the list of dashboards, you can get a dashboard id.

![](media\powerbi-developer-integrate-dashboard\powerbi-embed-dashboard-get-dashboards.png)

### Azure Active Directory access token

Before you can call the [Get Dashboards](https://msdn.microsoft.com/library/mt465739.aspx) operation, or any other **Power BI** operation, you need to get an Azure Active Directory **authentication access token** (access token). An **access token** is used to allow your app access to **Power BI** dashboards, tiles and reports. To learn more about Azure Active Directory **access token** flow, see [Azure AD Authorization Code Grant Flow](https://msdn.microsoft.com/library/azure/dn645542.aspx). The next section shows you how to get an **access token** in a web app.

#### Get an authorization code from Azure AD

The first step to get an **access token** is to get an authorization code from **Azure AD**. To do this, you construct a query string with the following properties, and redirect to **Azure AD**.

**Authorization code query string**

```
var @params = new NameValueCollection
{
    //Azure AD will return an authorization code.
    {"response_type", "code"},

    //Client ID is used by the application to identify themselves to the users that they are requesting permissions from.
    //You get the client id when you register your Azure app.
    {"client_id", Settings.Default.ClientID},

    //Resource uri to the Power BI resource to be authorized
    //The resource uri is hard-coded for sample purposes
    {"resource", "https://analysis.windows.net/powerbi/api"},

    //After app authenticates, Azure AD will redirect back to the web app. In this sample, Azure AD redirects back
    //to Default page (Default.aspx).
    { "redirect_uri", Settings.Default.RedirectUri}
};
```

After you construct a query string, you redirect to **Azure AD** to get an **authorization code**.  Below is a complete C# method to construct an **authorization code** query string, and redirect to **Azure AD**. After you have the authorization code, you get an **access token** using the **authorization code**.

**Get authorization code**

```
public void GetAuthorizationCode()
{
    //NOTE: Values are hard-coded for sample purposes.
    //Create a query string
    //Create a sign-in NameValueCollection for query string
    var @params = new NameValueCollection
    {
        //Azure AD will return an authorization code.
        {"response_type", "code"},

        //Client ID is used by the application to identify themselves to the users that they are requesting permissions from.
        //You get the client id when you register your Azure app.
        {"client_id", Settings.Default.ClientID},

        //Resource uri to the Power BI resource to be authorized
        //The resource uri is hard-coded for sample purposes
        {"resource", "https://analysis.windows.net/powerbi/api"},

        //After app authenticates, Azure AD will redirect back to the web app. In this sample, Azure AD redirects back
        //to Default page (Default.aspx).
        { "redirect_uri", Settings.Default.RedirectUri}
    };

    //Create sign-in query string
    var queryString = HttpUtility.ParseQueryString(string.Empty);
    queryString.Add(@params);

    //Redirect to Azure AD Authority
    //  Authority Uri is an Azure resource that takes a client id and client secret to get an Access token
    //  QueryString contains
    //      response_type of "code"
    //      client_id that identifies your app in Azure AD
    //      resource which is the Power BI API resource to be authorized
    //      redirect_uri which is the uri that Azure AD will redirect back to after it authenticates

    //Redirect to Azure AD to get an authorization code
    Response.Redirect(String.Format("https://login.windows.net/common/oauth2/authorize?{0}", queryString));
}
```

#### Get an access token from authorization code

You should now have an authorization code from Azure AD. Once **Azure AD** redirects back to your web app with an **authorization code**, you use the **authorization code** to get an access token. Below is a C# method to get an **access token**.

**Get access token**

```
public string GetAccessToken(string authorizationCode, string clientID, string clientSecret, string redirectUri)
{
    //Redirect uri must match the redirect_uri used when requesting Authorization code.
    //Note: If you use a redirect back to Default, as in this sample, you need to add a forward slash
    //such as http://localhost:13526/

    // Get auth token from auth code       
    TokenCache TC = new TokenCache();

    //Values are hard-coded for sample purposes
    string authority = "https://login.windows.net/common/oauth2/authorize";
    AuthenticationContext AC = new AuthenticationContext(authority, TC);
    ClientCredential cc = new ClientCredential(clientID, clientSecret);

    //Set token from authentication result
    return AC.AcquireTokenByAuthorizationCode(
        authorizationCode,
        new Uri(redirectUri), cc).AccessToken;
}
```

### Get dashboard using access token

Now that you have an **access token**, you can call the [Get Dashboards](https://msdn.microsoft.com/library/mt465739.aspx) operation. The [Get Dashboards](https://msdn.microsoft.com/library/mt465739.aspx) operation returns a list of dashboards. You can get a dashboard from the list of dashboards. Below is a complete C# method to get a dashboard.

**Get dashboard**

```
protected void GetDashboards
{
    string responseContent = string.Empty;

    //Configure dashboards request
    System.Net.WebRequest request = System.Net.WebRequest.Create(String.Format("{0}dashboards", baseUri)) as System.Net.HttpWebRequest;
    request.Method = "GET";
    request.ContentLength = 0;
    request.Headers.Add("Authorization", String.Format("Bearer {0}", authResult.AccessToken));

    //Get dashboards response from request.GetResponse()
    using (var response = request.GetResponse() as System.Net.HttpWebResponse)
    {
        //Get reader from response stream
        using (var reader = new System.IO.StreamReader(response.GetResponseStream()))
        {
            responseContent = reader.ReadToEnd();

            //Deserialize JSON string
            PBIDashboards PBIDashboards = JsonConvert.DeserializeObject<PBIDashboards>(responseContent);
            Table1.Visible = true;
            Control myControl1 = FindControl("TableDiv");
            //Get each dashboard 
            foreach (PBIDashboard dsb in PBIDashboards.value)
            {
                TableRow tRow = new TableRow();
                Table1.Rows.Add(tRow);

                TableCell idCell = new TableCell();
                idCell.Text = dsb.id;
                tRow.Cells.Add(idCell);

                TableCell nameCell = new TableCell();
                nameCell.Text = dsb.displayName;
                tRow.Cells.Add(nameCell);

                TableCell isReadOnlyCell = new TableCell();
                isReadOnlyCell.Text = dsb.isReadOnly.ToString();
                tRow.Cells.Add(isReadOnlyCell);

                TableCell embedUrlCell = new TableCell();
                embedUrlCell.Text = dsb.embedUrl;
                tRow.Cells.Add(embedUrlCell);
            }
        }
    }
}

//Power BI Dashboards used to deserialize the Get Dashboards response.
public class PBIDashboards
{
    public PBIDashboard[] value { get; set; }
}
public class PBIDashboard
{
    public string id { get; set; }
    public string displayName { get; set; }
    public string embedUrl { get; set; }
    public bool isReadOnly { get; set; }
}
```

## Step 3 - load a dashboard into an IFrame

To load a dashboard into an **IFrame**, you set the **src** attribute of an **IFrame** to the **embedUrl** property of a **dashboard**, and create an **onload** handler to post a message with an **access token** to get access to the dashboard. Below is JavaScript code to load a report into an **IFrame**.

**Load a dashboard into an IFrame**

```
//Configure IFrame for the dashboard after you have an Access Token. See Default.aspx.cs to learn how to get an Access Token
window.onload = function () {
    if ("" != document.getElementById('MainContent_accessToken').value)
    {
        var iframe = document.getElementById('iFrameEmbedDashboard');

        // To load a Report do the following:
        // Set the IFrame source to the EmbedUrl from the Get Dashboards operation
        iframe.src = document.getElementById('MainContent_DashboardEmbedUrl').value;

        // Add an onload handler to submit the access token
        iframe.onload = postActionLoadDashboard;
    }
};

// Post the access token to the IFrame
function postActionLoadDashboard() {

    // Construct the push message structure
    // this structure also supports setting the dashboardId, groupId, height, and width.
    // when using a dashboard in a group, you must provide the groupId on the iFrame SRC
    var m = {
        action: "loadDashboard",
        accessToken: document.getElementById('MainContent_accessToken').value
    };
    message = JSON.stringify(m);

    // push the message.
    iframe = document.getElementById('iFrameEmbedDashboard');
    iframe.contentWindow.postMessage(message, "*");;
}
```

If you downloaded and ran the [Integrate a dashboard sample](https://github.com/Microsoft/PowerBI-CSharp/tree/master/samples/webforms/embed-a-dashboard-into-an-app), the sample will look similar to below.

![](media\powerbi-developer-integrate-dashboard\powerbi-embed-dashboard.png)

## See also

[Sign up for Power BI](powerbi-admin-free-with-custom-azure-directory.md)  
[Integrate a dashboard sample](https://github.com/Microsoft/PowerBI-CSharp/tree/master/samples/webforms/embed-a-dashboard-into-an-app)  
[App permissions](powerbi-developer-power-bi-permissions.md)  
More questions? [Try the Power BI Community](http://community.powerbi.com/)