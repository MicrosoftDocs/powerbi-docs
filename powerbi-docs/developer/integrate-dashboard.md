---
title: Integrate a dashboard into an app for your organization
description: Learn how to integrate, or embed, a dashboard into a web app using the Power BI APIs.
author: markingmyname
manager: kfile
ms.reviewer: ''

ms.service: powerbi
ms.component: powerbi-service
ms.topic: conceptual
ms.date: 02/13/2018
ms.author: maghan

---
# Integrate a dashboard into an app for your organization
Learn how to integrate, or embed, a dashboard into a web app using REST API calls along with the Power BI JavaScript API when embedding for your organization.

![Embedded dashboard](media/integrate-dashboard/powerbi-embed-dashboard.png)

To get started with this walkthrough, you need a **Power BI** account. If you don't have an account, you can [sign up for a free Power BI account](../service-self-service-signup-for-power-bi.md), or you can create your own [Azure Active Directory tenant](create-an-azure-active-directory-tenant.md) for testing purposes.

> [!NOTE]
> Looking to embed a dashboard for your customers, using an embedtoken, instead? See, [Integrate a dashboard, tile, or report into your application for your customers](embed-sample-for-customers.md).
> 
> 

To integrate a dashboard into a web app, you use the **Power BI** REST API, or the Power BI C# SDK, and an Azure Active Directory (AD) authorization **access token** to get a dashboard. Then, you load the dashboard using the same access token. The **Power BI** API provides programmatic access to certain **Power BI** resources. For more information, see [Overview of Power BI REST API](https://msdn.microsoft.com/library/dn877544.aspx) and the [Power BI JavaScript API](https://github.com/Microsoft/PowerBI-JavaScript).

## Download the sample
This article shows the code used in the [integrate-dashboard-web-app](https://github.com/Microsoft/PowerBI-Developer-Samples/tree/master/User%20Owns%20Data/integrate-dashboard-web-app) on GitHub. To follow along with this walkthrough, you can download the sample.

## Step 1 - register an app in Azure AD
You will need to register your application with Azure AD in order to make REST API calls. For more information, see [Register an Azure AD app to embed Power BI content](register-app.md).

If you downloaded the [Integrate a dashboard sample](https://github.com/Microsoft/PowerBI-Developer-Samples/tree/master/User%20Owns%20Data/integrate-dashboard-web-app), you use the **Client ID** and **Client Secret** you get, after registration, so that the sample can authenticate to Azure AD. To configure the sample, change the **Client ID** and **Client Secret** in the *cloud.config* file.

![](media/integrate-dashboard/powerbi-embed-dashboard-register-app4.png)

## Step 2 - get an access token from Azure AD
Within your application, you will first need to get an **access token**, from Azure AD, before you can make calls to the Power BI REST API. For more information, see [Authenticate users and get an Azure AD access token for your Power BI app](get-azuread-access-token.md).

## Step 3 - get a dashboard
To get a **Power BI** dashboard, you use the [Get Dashboards](https://msdn.microsoft.com/library/mt465739.aspx) operation which gets a list of **Power BI** dashboards. From the list of dashboards, you can get a dashboard id.

![](media/integrate-dashboard/powerbi-embed-dashboard-get-dashboards.png)

### Get dashboards using an access token
With the **access token** you retrieved in [step 2](#step-2-get-an-access-token-from-azure-ad), you can call the [Get Dashboards](https://msdn.microsoft.com/library/mt465739.aspx) operation. The [Get Dashboards](https://msdn.microsoft.com/library/mt465739.aspx) operation returns a list of dashboards. You can get a single dashboard from the list of dashboards. Below is a complete C# method to get a dashboard. 

To make the REST API call, you must include an *Authorization* header in the format of *Bearer {access token}*.

#### Get dashboards with the REST API
**Default.aspx.cs**

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

#### Get dashboards using the .NET SDK
You can use the .NET SDK to retrieve a list of dashboards instead of calling the REST API directly.

```
using Microsoft.IdentityModel.Clients.ActiveDirectory;
using Microsoft.PowerBI.Api.V2;
using Microsoft.PowerBI.Api.V2.Models;

var tokenCredentials = new TokenCredentials(<ACCESS TOKEN>, "Bearer");

// Create a Power BI Client object. It will be used to call Power BI APIs.
using (var client = new PowerBIClient(new Uri(ApiUrl), tokenCredentials))
{
    // Get a list of dashboards your "My Workspace"
    ODataResponseListDashboard dashboards = client.Dashboards.GetDashboards();

    // Get a list of dashboards from a group (app workspace)
    ODataResponseListDashboard dashboards = client.Dashboards.GetDashboardsInGroup(groupId);

    Dashboard dashboard = dashboards.Value.FirstOrDefault();

    var embedUrl = dashboard.EmbedUrl
}
```

## Step 4 - load a dashboard using JavaScript
You can use JavaScript to load a dashboard into a div element on your web page.

**Default.aspx**

```
<!-- Embed Dashboard-->
<div> 
    <asp:Panel ID="PanelEmbed" runat="server" Visible="true">
        <div>
            <div><b class="step">Step 3</b>: Embed a dashboard</div>

            <div>Enter an embed url for a dashboard from Step 2 (starts with https://):</div>
            <input type="text" id="tb_EmbedURL" style="width: 1024px;" />
            <br />
            <input type="button" id="bEmbedDashboardAction" value="Embed Dashboard" />
        </div>

        <div id="dashboardContainer"></div>
    </asp:Panel>
</div>
```

**Site.master**

```
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

If you downloaded and ran the [Integrate a dashboard sample](https://github.com/Microsoft/PowerBI-Developer-Samples/tree/master/User%20Owns%20Data/integrate-dashboard-web-app), the sample will look similar to below.

![](media/integrate-dashboard/powerbi-embed-dashboard.png)

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

If you downloaded and ran the [Integrate a dashboard sample](https://github.com/Microsoft/PowerBI-Developer-Samples/tree/master/PowerBI.com%20Integrate/integrate-dashboard-web-app), clicking on a tile will output text below the dashboard. The text will look similar to the following. This would allow you to log that a tile was clicked, and then navigate the user to the appropriate location.

```
Tile Clicked
{ "event": "TileClick", "reportEmbedUrl": "", "navigationUrl": "https://app.powerbi.com/dashboards/fcff76f9-15ff-4a8e-8242-275ac9c25b90/qna?q=count%20of%20new%20hires%20from%20July%202014%20to%20December%202014", "tileId": "0e99b45c-9b53-4920-b239-cee7d37d2369" }
---------
Tile Clicked
{ "event": "TileClick", "reportEmbedUrl": "https://app.powerbi.com/reportEmbed?reportId=ab199308-80b1-4626-9823-43a84623bd9c", "navigationUrl": "https://app.powerbi.com/reports/ab199308-80b1-4626-9823-43a84623bd9c/ReportSection1", "tileId": "ffc30447-674a-4511-944f-79e182d719de", "pageName": "ReportSection1" }
---------
```

## Working with groups (app workspaces)
For embedding a dashboard from a group (app workspace), you will want to get the list of all available dashboards within a group using the following REST API call. To find more information about this REST API call, see [Get Dashboards](https://msdn.microsoft.com/library/mt465739.aspx). You will need to have permission in the group for the request to return results.

```
https://api.powerbi.com/v1.0/myorg/groups/{groupId}/dashboards
```

The above API returns the list of the available dashboards. Each dashboard has an EmbedUrl property which is already constructed to support group embedding.

```
https://app.powerbi.com/dashboardEmbed?dashboardId={dashboardId}&groupId={groupId}
```

## Limitations
* The end users who access the embedded dashboards must have a Power BI account and have access to the dashboard. Either they own the dashboard or the dashboard was shared with the user.
* Currently Q&A is not supported in embedded dashboards.
* As a temporary limitation, when sharing a dashboard with security groups, user have to first access the dashboards in PowerBI.com before they can see it embedded.

## Next steps
A sample application is available on GitHub for you to review. The above examples are based on that sample. For more information, see [integrate-dashboard-web-app](https://github.com/Microsoft/PowerBI-Developer-Samples/tree/master/User%20Owns%20Data/integrate-dashboard-web-app).

More information is available for the JavaScript API, see [Power BI JavaScript API](https://github.com/Microsoft/PowerBI-JavaScript).

More questions? [Try asking the Power BI Community](http://community.powerbi.com/)

