---
title: Integrate a Power BI tile into an app for your organization
description: Walkthrough to integrate a tile into an app, sample code
services: powerbi
documentationcenter: ''
author: guyinacube
manager: erikre
backup: ''
editor: ''
tags: ''
qualityfocus: no
qualitydate: ''

ms.service: powerbi
ms.devlang: NA
ms.topic: get-started-article
ms.tgt_pltfrm: NA
ms.workload: powerbi
ms.date: 10/05/2017
ms.author: asaxton

---
# Integrate a tile into an app (user owns data)
Learn how to integrate, or embed, a tile into a web app using REST API calls along with the Power BI JavaScript API when embedding for your organization.

![Embedded tile in web application](media/powerbi-developer-integrate-tile/powerbi-embedded-tile.png)

To get started with this walkthrough, you need a **Power BI** account. If you don't have an account, you can [sign up for a free Power BI account](service-self-service-signup-for-power-bi.md), or you can create your own [Azure Active Directory tenant ](developer/create-an-azure-active-directory-tenant.md) for testing purposes.

> [!NOTE]
> Looking to embed a tile for your customers, using an embedtoken, instead? See, [Integrate a dashboard, tile, or report into your application for your customers](developer/embed-sample-for-customers.md).
> 
> 

To integrate a tile into a web app, you use the **Power BI** REST API, or the Power BI C# SDK, and an Azure Active Directory (AD) authorization **access token** to get a tile. Then, you load the tile using the same access token. The **Power BI** API provides programmatic access to certain **Power BI** resources. For more information, see [Overview of Power BI REST API](https://msdn.microsoft.com/library/dn877544.aspx) and the [Power BI JavaScript API](https://github.com/Microsoft/PowerBI-JavaScript).

## Download the sample
This article shows the code used in the [integrate-tile-web-app](https://github.com/Microsoft/PowerBI-Developer-Samples/tree/master/User%20Owns%20Data/integrate-tile-web-app) on GitHub. To follow along with this walkthrough, you can download the sample.

## Step 1 - register an app in Azure AD
You will need to register your application with Azure AD in order to make REST API calls. For more information, see [Register an Azure AD app to embed Power BI content](powerbi-developer-register-app.md).

If you downloaded the [integrate-tile-web-app](https://github.com/Microsoft/PowerBI-Developer-Samples/tree/master/User%20Owns%20Data/integrate-tile-web-app), you use the **Client ID** and **Client Secret** you get, after registration, so that the sample can authenticate to Azure AD. To configure the sample, change the **Client ID** and **Client Secret** in the *cloud.config* file.

![](media/powerbi-developer-integrate-tile/powerbi-embed-dashboard-register-app4.png)

## Step 2 - get an access token from Azure AD
Within your application, you will first need to get an **access token**, from Azure AD, before you can make calls to the Power BI REST API. For more information, see [Authenticate users and get an Azure AD access token for your Power BI app](powerbi-developer-get-azuread-access-token.md).

## Step 3 - get a tile
To get a **Power BI** tile, you use the [Get Tiles](https://msdn.microsoft.com/library/mt465741.aspx) operation which gets a list of **Power BI** tiles from a given dashboard. From the list of tiles, you can get a tile id and embed URL.

A dashboard ID will need to be retrieved first before you can get the tile. For information on how to retrieve a dashbaord, see [Integrate a dashboard into an app (user owns data)](powerbi-developer-integrate-dashboard.md).

### Get tiles using an access token
With the **access token** you retrieved in [step 2](#step-2-get-an-access-token-from-azure-ad), you can call the [Get Tiles](https://msdn.microsoft.com/library/mt465741.aspx) operation. The [Get Tiles](https://msdn.microsoft.com/library/mt465741.aspx) operation returns a list of tiles. You can get a single tile from the list of tiles. Below is a complete C# method to get a tile. For examples on how to use the Power BI REST API, see [Power BI REST API on APIARY](http://docs.powerbi.apiary.io/).

To make the REST API call, you must include an *Authorization* header in the format of *Bearer {access token}*.

#### Get tiles with the REST API
**Default.aspx.cs**

```
using Newtonsoft.Json;

//Get a tile from a dashboard. In this sample, you get the first tile.
protected void GetTile(string dashboardId, int index)
{
    //Configure tiles request
    System.Net.WebRequest request = System.Net.WebRequest.Create(
        String.Format("{0}Dashboards/{1}/Tiles",
        baseUri,
        dashboardId)) as System.Net.HttpWebRequest;

    request.Method = "GET";
    request.ContentLength = 0;
    request.Headers.Add("Authorization", String.Format("Bearer {0}", accessToken.Value));

    //Get tiles response from request.GetResponse()
    using (var response = request.GetResponse() as System.Net.HttpWebResponse)
    {
        //Get reader from response stream
        using (var reader = new System.IO.StreamReader(response.GetResponseStream()))
        {
            //Deserialize JSON string
            PBITiles tiles = JsonConvert.DeserializeObject<PBITiles>(reader.ReadToEnd());

            //Sample assumes at least one Dashboard with one Tile.
            //You could write an app that lists all tiles in a dashboard
            if (tiles.value.Length > 0)
                tileEmbedUrl.Text = tiles.value[index].embedUrl;
        }
    }
}

//Power BI Tiles used to deserialize the Get Tiles response.
public class PBITiles
{
    public PBITile[] value { get; set; }
}
public class PBITile
{
    public string id { get; set; }
    public string title { get; set; }
    public string embedUrl { get; set; }
}
```

#### Get tiles using the .NET SDK
You can use the .NET SDK to retrieve a list of dashbaords instead of calling the REST API directly.

```
using Microsoft.IdentityModel.Clients.ActiveDirectory;
using Microsoft.PowerBI.Api.V2;
using Microsoft.PowerBI.Api.V2.Models;

var tokenCredentials = new TokenCredentials(<ACCESS TOKEN>, "Bearer");

// Create a Power BI Client object. It will be used to call Power BI APIs.
using (var client = new PowerBIClient(new Uri(ApiUrl), tokenCredentials))
{
    // Get a list of dashboards your "My Workspace"
    ODataResponseListDashboard tiles = client.Dashboards.GetDashboards();

    // Get a list of dashboards from a group (app workspace)
    ODataResponseListDashboard dashboards = client.Dashboards.GetDashboardsInGroup(groupId);

    Dashboard dashboard = dashboards.Value.FirstOrDefault();

    // Get the first tile from the above dashbaord
    ODataResponseListTile tiles = client.Dashboards.GetTiles(dashboard.Id);

    Tile tile = tiles.Value.FirstOrDefault();
}
```

## Step 4 - load a tile using JavaScript
You can use JavaScript to load a tile into a div element on your web page.

**Default.aspx**

```
<!-- Embed Tile-->
<div> 
    <asp:Panel ID="PanelEmbed" runat="server" Visible="true">
        <div>
            <div><b class="step">Step 3</b>: Embed a tile</div>

            <div>Enter an embed url for a tile from Step 2 (starts with https://):</div>
            <input type="text" id="tb_EmbedURL" style="width: 1024px;" />
            <br />
            <input type="button" id="bEmbedTileAction" value="Embed Tile" />
        </div>

        <div id="tileContainer"></div>
    </asp:Panel>
</div>
```

**Site.master**

```
window.onload = function () {
    // client side click to embed a selected tile.
    var el = document.getElementById("bEmbedTileAction");
    if (el.addEventListener) {
        el.addEventListener("click", updateEmbedTile, false);
    } else {
        el.attachEvent('onclick', updateEmbedTile);
    }

    // handle server side post backs, optimize for reload scenarios
    // show embedded tile if all fields were filled in.
    var accessTokenElement = document.getElementById('MainContent_accessTokenTextbox');
    if (accessTokenElement !== null) {
        var accessToken = accessTokenElement.value;
        if (accessToken !== "")
            updateEmbedTile();
    }
};

// update embed tile
function updateEmbedTile() {

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
        type: 'tile',
        accessToken: accessToken,
        embedUrl: embedUrl
    };

    // Grab the reference to the div HTML element that will host the tile.
    var tileContainer = document.getElementById('tileContainer');

    // Embed the tile and display it within the div container.
    var tile = powerbi.embed(tileContainer, config);

    // tile.on will add an event handler which prints to Log window.
    tile.on("error", function (event) {
        var logView = document.getElementById('logView');
        logView.innerHTML = logView.innerHTML + "Error<br/>";
        logView.innerHTML = logView.innerHTML + JSON.stringify(event.detail, null, "  ") + "<br/>";
        logView.innerHTML = logView.innerHTML + "---------<br/>";
    });
}
```

If you downloaded and ran the [integrate-tile-web-app](https://github.com/Microsoft/PowerBI-Developer-Samples/tree/master/User%20Owns%20Data/integrate-tile-web-app), the sample will look similar to below.

![Embedded tile in web application](media/powerbi-developer-integrate-tile/powerbi-embedded-tile.png)

## Working with groups (app workspaces)
For embedding a tile from a group (app workspace), you will want to get the list of all available tiles within a group's dashboard using the following REST API call. To find more information about this REST API call, see [Get Tiles](https://msdn.microsoft.com/library/mt465741.aspx). You will need to have permission in the group for the request to return results.

```
https://api.powerbi.com/v1.0/myorg/groups/{groupId}/dashboards/{dashboard_id}/tiles
```

The above API returns the list of the available tiles. Each tile has an EmbedUrl property which is already constructed to support group embedding.

```
https://app.powerbi.com/embed?dashboardId={dashboard_id}&tileId={tile_id}&groupId={group_id}
```

## Next steps
A sample application is available on GitHub for you to review. For more information, see [integrate-tile-web-app](https://github.com/Microsoft/PowerBI-Developer-Samples/tree/master/User%20Owns%20Data/integrate-tile-web-app).

More information is available for the JavaScript API, see [Power BI JavaScript API](https://github.com/Microsoft/PowerBI-JavaScript).

More questions? [Try asking the Power BI Community](http://community.powerbi.com/)

