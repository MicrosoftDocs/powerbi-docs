<properties
   pageTitle="Get a Power BI tile"
   description="Walkthrough - Integrate a tile into an app - Register a web app with Azure AD"
   services="powerbi"
   documentationCenter=""
   authors="mgblythe"
   manager="mblythe"
   backup=""
   editor=""
   tags=""
   qualityFocus="monitoring"
   qualityDate=""/>

<tags
   ms.service="powerbi"
   ms.devlang="NA"
   ms.topic="get-started-article"
   ms.tgt_pltfrm="NA"
   ms.workload="powerbi"
   ms.date="08/23/2016"
   ms.author="mblythe"/>

# Step 3: Get a tile

## Introduction

In **step 2** of Integrate a tile into an app, [Get a Power BI dashboard](powerbi-developer-integrate-tile-get-dashboard.md), you get a Power BI dashboard. In this step, you get a **Power BI** tile from a dashboard.

![](media\powerbi-developer-integrate-tile\integrate-tile-get-tile.png)

To get a **Power BI** tile you need an authentication **access token**. To learn how to get an **access token**, see [Get an authentication access token]((powerbi-developer-integrate-tile-get-dashboard.md#get-token) in Step 2: Get a Power BI dashboard. You use an **access token** to authenticate to **Azure AD** to gain access to **Power BI** tiles.

Here are the steps to get a Power BI tile.

- **Step 1:** Get an authorization code from Azure AD. See [Get an authorization code from Azure AD](powerbi-developer-integrate-tile-get-dashboard.md#auth-code) in Step 2: Get a Power BI dashboard.
- **Step 2:** Get an access token. See [Get an access token from authorization code](powerbi-developer-integrate-tile-get-dashboard.md#access-token) Step 2: Get a Power BI dashboard.
- **Step 3:** [Get a Power BI tile](#get-tile)

<a name="get-tile"/>
## Get a Power BI tile using access token

In step 2 of the [Integrate a tile into an app walkthrough](powerbi-developer-integrate-tile.md), you get an **access token** to get a dashboard. You can use this **access token** to also get a tile. You get a tile with the [Get Tiles](https://msdn.microsoft.com/library/mt465741.aspx)  operation which returns a list of tiles in a **dashboard**. Below is a C# method to get a tile. Once you have a **tile**, you can load the tile into an **IFrame**. See [Load a Power BI tile into an IFrame](powerbi-developer-integrate-tile-load-tile-iframe.md).

**Get tile**

```
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

## Next step

To integrate a tile into an app, you load a tile into an IFrame. In the next step, you learn how to [Load a tile into an IFrame](powerbi-developer-integrate-tile-load-tile-iframe.md).

[Next Step >](powerbi-developer-integrate-tile-load-tile-iframe.md)

## See also
-	[Sign up for Power BI](powerbi-admin-free-with-custom-azure-directory.md)
-	[Integrate a tile into an app walkthrough](powerbi-developer-integrate-tile.md)
-	[Integrate a tile sample](https://github.com/Microsoft/PowerBI-CSharp/tree/master/samples/webforms/integrate-tile-web-app)
-	[Configure the integrate a tile sample](powerbi-developer-integrate-tile-register.md#configure-sample)
-	[Get Dashboards operation](https://msdn.microsoft.com/library/mt465739.aspx)
-	[Get Tiles operation](https://msdn.microsoft.com/library/mt465741.aspx)
-	[Step 4: Load a Power BI tile into an IFrame](powerbi-developer-integrate-tile-load-tile-iframe.md)
