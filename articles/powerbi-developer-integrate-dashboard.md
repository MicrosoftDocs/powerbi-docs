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
   ms.date="06/12/2017"
   ms.author="asaxton"/>

# Integrate a dashboard into an app

Learn how to integrate, or embed, a dashboard into a web app using C# and the **Power BI** API along with some JavaScript code.

![](media\powerbi-developer-integrate-dashboard\powerbi-embed-dashboard.png)

<iframe width="640" height="360" src="https://www.youtube.com/embed/XSAHwE21Buk?showinfo=0" frameborder="0" allowfullscreen></iframe>

To get started with this walkthrough, you need a **Power BI** account. If you don't have an account, you can [sign up for a free Power BI account](powerbi-service-self-service-signup-for-power-bi.md), or you can create your own [Azure Active Directory tenant ](powerbi-developer-create-an-azure-active-directory-tenant.md)for testing purposes.

To integrate a dashboard into a web app, you use the **Power BI** API, and an Azure Active Directory (AD) authorization **access token** to get a dashboard. Then, you load the dashboard into a **div** element using the same access token. The **Power BI** API provides programmatic access to certain **Power BI** resources. For more information, see [Overview of Power BI REST API](https://msdn.microsoft.com/library/dn877544.aspx) and the [Power BI JavaScript API](https://github.com/Microsoft/PowerBI-JavaScript)

## Download the sample

This article shows the code used in the [Integrate a dashboard sample](https://github.com/Microsoft/PowerBI-Developer-Samples/tree/master/PowerBI.com%20Integrate/integrate-dashboard-web-app) on GitHub. To follow along with this walkthrough, you should download the sample.

If you are looking for a sample that involves embedding items for non-Power BI users, you can see [Embedding for non-Power BI users](https://github.com/Microsoft/PowerBI-Developer-Samples/tree/master/App%20Owns%20Data).

## Step 1 - register an app in Azure AD

In order to use the Power BI API, you will have to register an app with your Azure Active Directory tenant. You need to do this first so that you have a **Client ID** and **Client Secret** that identifies your web app in Azure AD. Without a **Client ID** and **Client Secret**, Azure AD cannot authenticate your web app. If you downloaded the [Integrate a dashboard sample](https://github.com/Microsoft/PowerBI-Developer-Samples/tree/master/PowerBI.com%20Integrate/integrate-dashboard-web-app), you use the **Client ID** and **Client Secret** you get after registration to configure the sample so that the sample can authenticate to Azure AD.

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

If you downloaded the [Integrate a dashboard sample](https://github.com/Microsoft/PowerBI-Developer-Samples/tree/master/PowerBI.com%20Integrate/integrate-dashboard-web-app), you use the **Client ID** and **Client Secret** you get after registration so that the sample can authenticate to Azure AD. To configure the sample, change the **Client ID** and **Client Secret** in web.config.

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
        {"resource", Properties.Settings.Default.PowerBiAPI},

        //After user authenticates, Azure AD will redirect back to the web app
        {"redirect_uri", "http://localhost:13526/Redirect"}
    };

    //Create sign-in query string
    var queryString = HttpUtility.ParseQueryString(string.Empty);
    queryString.Add(@params);

    //Redirect authority
    //Authority Uri is an Azure resource that takes a client id to get an Access token
    string authorityUri = Properties.Settings.Default.AADAuthorityUri;
    var authUri = String.Format("{0}?{1}", authorityUri, queryString);
    Response.Redirect(authUri);
}
```

#### Get an access token from authorization code

You should now have an authorization code from Azure AD. Once **Azure AD** redirects back to your web app with an **authorization code**, you use the **authorization code** to get an access token. Below is a C# sample that you could use in your Page_Load event.

```
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


### Get dashboard using access token

Now that you have an **access token**, you can call the [Get Dashboards](https://msdn.microsoft.com/library/mt465739.aspx) operation. The [Get Dashboards](https://msdn.microsoft.com/library/mt465739.aspx) operation returns a list of dashboards. You can get a dashboard from the list of dashboards. Below is a complete C# method to get a dashboard. For examples on how to use the Power BI REST API, see [Power BI REST API on APIARY](http://docs.powerbi.apiary.io/).

**Get dashboard**

```
protected void getDashboardsButton_Click(object sender, EventArgs e)
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

            if (PBIDashboards != null)
            {
                var gridViewDashboards = PBIDashboards.value.Select(dashboard => new {
                    Id = dashboard.id,
                    DisplayName = dashboard.displayName,
                    EmbedUrl = dashboard.embedUrl
                });

                this.GridView1.DataSource = gridViewDashboards;
                this.GridView1.DataBind();
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

## Step 3 - load a dashboard using JavaScript

You can use JavaScript to load a dashboard into a div element on your web page.

```
<input type="text" id="tb_EmbedURL" style="width: 1024px;" />
<input type="button" id="bEmbedDashboardAction" value="Embed Dashboard" />
<div id="dashboardContainer"></div>


window.onload = function () {
    // client side click to embed a selected dashboard.
    var el = document.getElementById("bEmbedDashboardAction");
    if (el.addEventListener) {
        el.addEventListener("click", updateEmbedDashboard, false);
    } else {
        el.attachEvent('onclick', updateEmbedDashboard);
    }

    // handle server side post backs, optimize for reload scenarios
    // show embedded dashboard if all fields were filled in.
    var accessTokenElement = document.getElementById('MainContent_accessTokenTextbox');
    if (accessTokenElement !== null) {
        var accessToken = accessTokenElement.value;
        if (accessToken !== "")
            updateEmbedDashboard();
    }
};

// update embed dashboard
function updateEmbedDashboard() {

    // check if the embed url was selected
    var embedUrl = document.getElementById('tb_EmbedURL').value;
    if (embedUrl === "")
        return;

    // get the access token.
    accessToken = document.getElementById('MainContent_accessTokenTextbox').value;

    // Embed configuration used to describe the what and how to embed.
    // This object is used when calling powerbi.embed.
    // You can find more information at https://github.com/Microsoft/PowerBI-JavaScript/wiki/Embed-Configuration-Details.
    var config = {
        type: 'dashboard',
        accessToken: accessToken,
        embedUrl: embedUrl
    };

    // Grab the reference to the div HTML element that will host the dashboard.
    var dashboardContainer = document.getElementById('dashboardContainer');

    // Embed the dashboard and display it within the div container.
    var dashboard = powerbi.embed(dashboardContainer, config);

    // dashboard.on will add an event handler which prints to Log window.
    dashboard.on("tileClicked", function (event) {
        var logView = document.getElementById('logView');
        logView.innerHTML = logView.innerHTML + "Tile Clicked<br/>";
        logView.innerHTML = logView.innerHTML + JSON.stringify(event.detail, null, "  ") + "<br/>";
        logView.innerHTML = logView.innerHTML + "---------<br/>";
    });

    // dashboard.on will add an event handler which prints to Log window.
    dashboard.on("error", function (event) {
        var logView = document.getElementById('logView');
        logView.innerHTML = logView.innerHTML + "Error<br/>";
        logView.innerHTML = logView.innerHTML + JSON.stringify(event.detail, null, "  ") + "<br/>";
        logView.innerHTML = logView.innerHTML + "---------<br/>";
    });
}
```

If you downloaded and ran the [Integrate a dashboard sample](https://github.com/Microsoft/PowerBI-Developer-Samples/tree/master/PowerBI.com%20Integrate/integrate-dashboard-web-app), the sample will look similar to below.

![](media\powerbi-developer-integrate-dashboard\powerbi-embed-dashboard.png)

## Tile clicked events

In the sample above, you may have noticed that you can handle events when the tile is clicked on the dashboard. For more information about events, see [Handling Events within the JavaScript API](https://github.com/Microsoft/PowerBI-JavaScript/wiki/Handling-Events).

```
// dashboard.on will add an event handler which prints to Log window.
dashboard.on("tileClicked", function (event) {
    var logView = document.getElementById('logView');
    logView.innerHTML = logView.innerHTML + "Tile Clicked<br/>";
    logView.innerHTML = logView.innerHTML + JSON.stringify(event.detail, null, "  ") + "<br/>";
    logView.innerHTML = logView.innerHTML + "---------<br/>";
});

// dashboard.on will add an event handler which prints to Log window.
dashboard.on("error", function (event) {
    var logView = document.getElementById('logView');
    logView.innerHTML = logView.innerHTML + "Error<br/>";
    logView.innerHTML = logView.innerHTML + JSON.stringify(event.detail, null, "  ") + "<br/>";
    logView.innerHTML = logView.innerHTML + "---------<br/>";
});
```

If you downloaded and ran the [Integrate a dashboard sample](https://github.com/Microsoft/PowerBI-Developer-Samples/tree/master/PowerBI.com%20Integrate/integrate-dashboard-web-app), clicking on a tile will output text below the dashboard. The text will look similar to the following. This would allow you to log that a tile was clicked, and then navigate the user to the 

```
Tile Clicked
{ "event": "TileClick", "reportEmbedUrl": "", "navigationUrl": "https://app.powerbi.com/dashboards/fcff76f9-15ff-4a8e-8242-275ac9c25b90/qna?q=count%20of%20new%20hires%20from%20July%202014%20to%20December%202014", "tileId": "0e99b45c-9b53-4920-b239-cee7d37d2369" }
---------
Tile Clicked
{ "event": "TileClick", "reportEmbedUrl": "https://app.powerbi.com/reportEmbed?reportId=ab199308-80b1-4626-9823-43a84623bd9c", "navigationUrl": "https://app.powerbi.com/reports/ab199308-80b1-4626-9823-43a84623bd9c/ReportSection1", "tileId": "ffc30447-674a-4511-944f-79e182d719de", "pageName": "ReportSection1" }
---------
```

## Working with groups

For embedding a dashboard from a group, you will want to get the list of all available dashboards within a group using the following REST API call. To find more information about this REST API call, see [Get Dashboards](https://msdn.microsoft.com/library/mt465739.aspx).

```
https://api.powerbi.com/v1.0/myorg/groups/{groupId}/dashboards
```

The above API returns the list of the available dashboards. Each dashboard has an EmbedUrl property which is already constructed to support group embedding.

```
https://app.powerbi.com/dashboardEmbed?dashboardId={dashboardId}&groupId={groupId}
```

## Limitations

- The end users who access the embedded dashboards must have Power BI accounts and the dashboards should be shared with them.

- Currently Q&A is not supported in embedded dashboards.

- As a temporary limitation, when sharing a dashboard with security groups, user have to first access the dashboards in PowerBI.com before they can see it embedded.

## See also

[Integrate a dashboard sample](https://github.com/Microsoft/PowerBI-Developer-Samples/tree/master/PowerBI.com%20Integrate/integrate-dashboard-web-app)  
[Embed sample for non-Power BI users](https://github.com/Microsoft/PowerBI-Developer-Samples/tree/master/App%20Owns%20Data)  
[App permissions](powerbi-developer-power-bi-permissions.md)  
[Power BI JavaScript API](https://github.com/Microsoft/PowerBI-JavaScript)  
[Power BI REST API on APIARY](http://docs.powerbi.apiary.io/)  

More questions? [Try asking the Power BI Community](http://community.powerbi.com/)