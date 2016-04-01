<properties
   pageTitle="Integrate a Power BI tile into an app"
   description="Integrate a Power BI tile into an app"
   services="powerbi"
   documentationCenter=""
   authors="dvana"
   manager="mblythe"
   editor=""
   tags=""
   qualityFocus="yes"
   qualityDate="04/15/2016"/>
   />

<tags
   ms.service="powerbi"
   ms.devlang="NA"
   ms.topic="article"
   ms.tgt_pltfrm="NA"
   ms.workload="powerbi"
   ms.date="04/01/2016"
   ms.author="derrickv"/>

# Integrate a Power BI tile or report into an app

To get started integrating a Power BI **tile** or **report** into an app, download the [Integrate Power BI tiles sample](https://github.com/Microsoft/PowerBI-CSharp/tree/master/samples/webforms/embed-a-tile-into-an-app) or [Integrate Power BI reports sample](https://github.com/Microsoft/PowerBI-CSharp/tree/master/samples/webforms/embed-a-report-into-an-app) on GitHub.

With Power BI, you can enable application developers to integrate Power BI **tiles** and **reports** from a user's power BI account by embedding an **IFrame** into an app, such as a mobile app or web app. The PowerBI.com service allows business users to build, and personalize charts, reports, and dashboards in their own Power BI account. The embed a **tile** or **report** capability enables you to integrate those tiles or reports into an app. Here are some of the benefits of integrating Power BI tiles or reports into an app:

-	Provide user customizable data tiles or reports in an app for a small investment.
-	Users can integrate data from any data source outside the application to enhance contextual understanding.
-	Users can click an embedded Power BI tile or report to navigate to the Power BI **dashboard**.

You integrate a Power BI **tile** or **report** into an app with an **IFrame** HTML element. For example, you can create a custom mobile app to display Power BI tiles on the user’s mobile device. Once you embed an IFrame into an app, you can add a click event handler so that the user can navigate to the **dashboard**.

Here are the steps to integrate a Power BI tile or report into an app.

### Steps to create an app that integrates a Power BI tile or report

|**Step**|**See also**
|---|---
|For a tile, the Power BI user's account must have at least one **dashboard** with at least one **tile** on it.|To sign up for Power BI, see [Sign up for the Power BI service](powerbi-developer-sign-up-for-power-bi-service.md).  <br/><br/>To learn how to get a **tile** in a **dashboard** using the Power BI REST API, see [Get a Power BI tile](#gettile).
|In an app, get an Azure Active Directory (Azure AD) authentication token.|To learn how to get an Azure AD authentication token, see [Authenticate a web app](powerbi-developer-authenticate-a-web-app.md).
|For a tile, get the **dashboard** id and **tile** id to embed an **IFrame** tile into an app|To learn how to get a **dashboard** id and **tile** id, see [Get a Power BI tile](#gettile).
|For a report, get the  **report** id to embed an **IFrame** report into an app|To learn how to get a **report** id, see [Get a Power BI report](#getreport).
|In a web app, set the SRC attribute of an **IFrame** to the **embedUrl**.|To set an **IFrame** SRC attribute, see [Embed a Power BI tile](#embedTile) or [Embed a Power BI tile](#embedReport).
|For a tile, add a click event handler that navigates to the Power BI dashboard.|See [Navigate from a Power BI tile or report to a dashboard](#navigate)

**Important** To provide secure sign in and authorization for your app, you authenticate your app with **Azure Active Directory** (Azure AD). Before you get started embedding a Power BI tile or report into an app, you will need to register your app in Azure Active Directory. See [Register a web app](powerbi-developer-register-a-web-app.md). To learn how to authenticate to the Power BI service, see [Authenticate a web app](powerbi-developer-authenticate-a-web-app.md).

## Integrate a Power BI tile
There are three steps to integrate a Power BI tile into an app. The third step is optional.

1. [Get a Power BI tile](#gettile)
2. [Embed a Power BI tile into an app](#embedTile)
3. [Navigate from a Power BI tile to a dashboard (optional)](#navigate)

<a name="gettile"/>
### Get a Power BI tile

To get a Power BI **tile**, you first need the id of a user’s dashboard. You get a **dashboard** id with the [Get Dashboards](https://msdn.microsoft.com/library/mt465739.aspx) operation. Once you have a **dashboard** id, you get the **tile** with the [Get Tiles](https://msdn.microsoft.com/library/mt465741.aspx) operation. For complete source code that shows how to embed a Power BI tile, download the [Integrate a tile into an app sample](https://github.com/Microsoft/PowerBI-CSharp/tree/master/samples/webforms/embed-a-tile-into-an-app).

Here are the steps to get a Power BI **tile**:

**Step 1 – Get an Azure AD authentication token**

To get an Azure AD authentication token, see [Authenticate a web app](powerbi-developer-authenticate-a-web-app.md).

**Step 2 – Get user’s dashboards**

The [Get Dashboards](https://msdn.microsoft.com/library/mt465739.aspx) operation returns a JSON array of the user’s dashboards which contains an **id** and **displayName**. You use the **dashboard id** in the [Get Tiles](https://msdn.microsoft.com/library/mt465741.aspx) operation to get the user’s tiles. See **Step 3 – Get user’s tiles**. You get the user’s **dashboards** with a GET web request using the following REST Uri:

GET REST Uri

    https://api.powerbi.com/beta/myorg/dashboards


JSON Response


	{
    "@odata.context":"http://api.powerbi.com/beta/myorg/$metadata#dashboards","value":
    [
        {
            "id":"43127a01--e971d4cdc2fb",
            "displayName":"My Dashboard"
   		 }
    ]
    }

**Note** For a complete example of how to get dashboards, see **getDashboardsButton_Click** within the [Integrate a tile into an app sample](https://github.com/Microsoft/PowerBI-CSharp/tree/master/samples/webforms/embed-a-tile-into-an-app).

**Step 3 – Get user’s tile information**

You get the user’s **tiles** with a GET web request using the  REST Uri below. You use the dashboard **id** you got in **Step 2 – Get user’s dashboards** in the **tiles** url (see below). The [Get Tiles](https://msdn.microsoft.com/library/mt465741.aspx) operation returns a JSON array of the user’s tiles in a dashboard which contains an id, title, and **embedUrl**. You use the **embedUrl** to set the **IFrame** source url. See **Step 4 – Set IFrame source url**. The operation is as follows:

GET REST Uri

     GET https://api.powerbi.com/beta/myorg/dashboards/{dashboard_id}/tiles

JSON Response

	{
        "@odata.context":"api.powerbi.com/beta/myorg/$metadata#tiles","value":
        [
    		{
                "id":"f16dc78a--8970-afe1098a100d",
                "title":"ProductID",
                "embedUrl":"https://app.powerbi.com/embed
                ?dashboardId=43127a01--e971d4cdc2fb
                &tileId=f16dc78a-6897-afe1098a100d"
            },
            {
                "id":"9ab3925d--4d6c896df0c9",
                "title":"Count of CountryRegionCode",
                "embedUrl":"https://app.powerbi.com/embed
                ?dashboardId=43127a01--e971d4cdc2fb
                &tileId=9ab3925d--4d6c896df0c9"
            }
 		]
    }

**Note** For a complete example of how to get tiles, see **getTilesButton_Click** within the [Integrate a tile into an app sample](https://github.com/Microsoft/PowerBI-CSharp/tree/master/samples/webforms/embed-a-tile-into-an-app).

**Step 4 – Set IFrame source url**

Once you have an **embedUrl** for a **tile**, you set the **SRC** attribute of an **IFrame** to the **embedUrl**. The next section, [Embed a Power BI tile into an app](#embed), describes how to embed a tile using an IFrame.


<a name="embedTile"/>
### Embed a Power BI tile into an app
You embed a Power BI **tile** into an app with an **IFrame** HTML element. Here are the steps to embed a **tile** using an IFrame.

**Step 1** - Set an IFrame src element to the **embedUrl** that you get from the **Get Tile** REST operation. To learn how to get **embedUrl**, see [Get a Power BI tile](#gettile).

  var iframe = document.getElementById('iFrameEmbedTile');
  iframe.src =  embedTileUrl + "&width=" + width + "&height=" + height;
  iframe.onload = postActionLoadTile;

**Embed Tile URL Parameters**

|**Name**|**Description**|**REST operation**
|---|---|---
|dashboardId|The id of the user's **dashboard**.|[Get Dashboards](https://msdn.microsoft.com/library/mt465739.aspx)
|tileId|The id of the **tile** to embed. You get an array of **tiles** from a **dashboard** id.|[Get Tiles](https://msdn.microsoft.com/library/mt465741.aspx)

**Step 2 -** - Add an onload event handler to submit an Azure authentication token. To learn how to get an Azure authentication token for a web app, see [Authenticate a web app]( powerbi-developer-authenticate-a-web-app.md).

    iframe.onload = postActionLoadTile;

**Step 3 -** Create a **loadTile** action event handler to post a message back to the Power BI REST API. Upon successful authentication, the user can view the Power BI **tile**.

The **loadTile** message is a JSON structure with the following format:

    var m = { action: "loadTile", accessToken: accessToken, height: h, width: w};

**postActionLoadTile() event handler**

        // Post the authentication token to the IFrame.
        function postActionLoadTile() {
            // get the access token.
            accessToken = document.getElementById('MainContent_accessTokenTextbox').value;

            // return if no a
            if ("" === accessToken)
                return;

            var h = height;
            var w = width;

            // construct the post message structure
            var m = { action: "loadTile", accessToken: accessToken, height: h, width: w};
            message = JSON.stringify(m);

            // push the message.
            iframe = document.getElementById('iFrameEmbedTile');
            iframe.contentWindow.postMessage(message, "*");;
          }

Once the user can view a Power BI tile, they can click the tile to navigate to the Power BI dashboard which contains the tile.

<a name="navigate"/>
### Navigate from a Power BI tile to a dashboard

To allow the user to click to navigate to the Power BI **dashboard**, you listen and handle the **tile** or **report** post message for click to parent window. Here are the steps to do this.  For a complete code sample that shows how to navigate from a Power BI **tile** or **report** to a dashboard, see the [Integrate a tile into an app sample](https://github.com/Microsoft/PowerBI-CSharp/tree/master/samples/webforms/embed-a-tile-into-an-app).

**Step 1 – Add an event listener**

In the window.onload event handler, add (or attach) and event listener that handles the **tile** post message for click to parent window.

    window.onload = function () {

    ...

    // listen for message to receive tile click messages.
    if (window.addEventListener) {
        window.addEventListener("message", receiveMessage, false);
        } else {
        window.attachEvent("onmessage", receiveMessage);
        }
    ...
	}

**Step 2 – In a function, get message data and open dashboard window**

In a **receiveMessage(event)** function, get message data by parsing the JSON in event.data (see sample below).  To navigate to the dashboard containing the tile, you need to construct a url that includes the **dashboard** id. The receiveMessage function below shows how you can construct a dashboard url from the IFrame source. The **dashboard** url is as follows:

    https://app.powerbi.com/dashboards/61b7e871--6572c921e271

**Sample receiveMessage(event) function**

    function receiveMessage(event)
    {
        if (event.data) {
        try {
            messageData = JSON.parse(event.data);
            if (messageData.event === "tileClicked")
            {
                //Get IFrame source and construct dashboard url
                iFrameSrc = document.getElementById(event.srcElement.iframe.id).src;

                //Split IFrame source to get dashboard id
                var dashboardId = iFrameSrc.split("dashboardId=")[1].split("&")[0];

                //Get PowerBI service url
                urlVal = iFrameSrc.split("/embed")[0] + "/dashboards/{0}";
                urlVal = urlVal.replace("{0}", dashboardId);

                window.open(urlVal);
            }
        }
        catch (e) {
            // In a production app, handle exception
        }
    }
    }


## Integrate a Power BI report

There are two steps to integrate a Power BI report into an app.

- [Get a Power BI report](#getreport)
- [Embed a Power BI report into an app](#embedReport)

<a name="getreport"/>
### Get a Power BI report

To get a Power BI **report**, you need the embedUrl of a user’s report. You get a **report** embedUrl with the [Get Reports](https://msdn.microsoft.com/library/mt634543.aspx) operation. For complete source code that shows how to embed a Power BI report, download the [Integrate a report into an app sample](https://github.com/Microsoft/PowerBI-CSharp/tree/master/samples/webforms/embed-a-report-into-an-app).

Here are the steps to get a Power BI **report**:

**Step 1 – Get an Azure AD authentication token**

To get an Azure AD authentication token, see [Authenticate a web app](powerbi-developer-authenticate-a-web-app.md) or [Authenticate a client app](powerbi-developer-authenticate-a-client-app.md).

**Step 2 – Get user’s reports**

You get the user’s **reports** with a GET web request using the following REST Uri. The [Get Reports](https://msdn.microsoft.com/library/mt634543.aspx) operation returns a JSON array of the user’s reports which contains an **id**, **name**, and **embedUrl**.. The operation is as follows:

GET REST Uri

    https://api.powerbi.com/beta/myorg/reports


JSON Response


    {
      "@odata.context":"https://api.powerbi.com/beta/myorg/$metadata#reports","value":[
      {
          "id":"84dbd390--5eb9fe91cdba",
          "name":"AdventureWorks",
          "webUrl":"https://app.powerbi.com/reports/84dbd390---5eb9fe91cdba",
          "embedUrl":"https://app.powerbi.com/embedReport?reportId=84dbd390--5eb9fe91cdba"
        }
      ]
    }

**Note** For a complete example of how to get reports, see **getReportsButton_Click** within the [Integrate a report into an app sample](https://github.com/Microsoft/PowerBI-CSharp/tree/master/samples/webforms/embed-a-report-into-an-app).

**Step 4 – Set IFrame source url**

Once you have an **embedUrl** for a **report**, you set the **SRC** attribute of an **IFrame** to the **embedUrl**. The next section, [Embed a Power BI report ](#embed), describes how to embed a report using an IFrame.

<a name="embedReport"/>
### Embed a Power BI report into an app
You embed a Power BI **report** into an app with an **IFrame** HTML element. Here are the steps to embed a **report** using an IFrame.

**Step 1** - Set an IFrame src element to the **embedUrl** that you get from the **Get Report** REST operation. To learn how to get **embedUrl**, see [Get a Power BI report](#getreport).

    var iframe = document.getElementById('iFrameEmbedReport');
    iframe.src = embedUrl;
    iframe.onload = postActionLoadReport;

**Embed Report URL Parameters**

|**Name**|**Description**|**REST operation**
|---|---|---
|reportId|The id of the user’s **report**.|[Get Reports](https://msdn.microsoft.com/library/mt634543.aspx)

**Step 2 -** Add an onload event handler to submit an Azure authentication token. To learn how to get an Azure authentication token for a web app, see [Authenticate a web app]( powerbi-developer-authenticate-a-web-app.md).

    iframe.onload = postActionLoadReport;

**Step 3 -** Create a **loadReport** action event handler to post a message back to the Power BI REST API. Upon successful authentication, the user can view the Power BI **report**.

The **loadReport** message is a JSON structure with the following format:

    var m = { action: "loadReport", accessToken: accessToken};

**postActionLoadReport() event handler**

        function postActionLoadReport() {

            // get the access token.
            accessToken = document.getElementById('MainContent_accessTokenTextbox').value;

            // return if no a
            if ("" === accessToken)
                return;

            // construct the push message structure
            // this structure also supports setting the reportId, groupId, height, and width.
            // when using a report in a group, you must provide the groupId on the iFrame SRC
            var m = { action: "loadReport", accessToken: accessToken};
            message = JSON.stringify(m);

            // push the message.
            iframe = document.getElementById('iFrameEmbedReport');
            iframe.contentWindow.postMessage(message, "*");;
        }


## Conclusion

The steps in this article generally describe how to use an **IFrame** to embed a Power BI **tile** or **report** into an app. The [Integrate a tile into an app sample](https://github.com/Microsoft/PowerBI-CSharp/tree/master/samples/webforms/embed-a-tile-into-an-app) and [Integrate a report into an app sample](https://github.com/Microsoft/PowerBI-CSharp/tree/master/samples/webforms/embed-a-report-into-an-app) shows all the code you need to embed a Power BI tile or report into a web app. The sample also shows how to add a **tile** or **report** click event so that the user can navigate to their Power BI **dashboard** from the **tile** or **report**.

## See also
-	[Authenticate a web app](powerbi-developer-authenticate-a-web-app.md)
-	[Register a web app](powerbi-developer-register-a-web-app.md)
-	[Azure Active Directory Authentication Libraries](https://azure.microsoft.com/documentation/articles/active-directory-authentication-libraries/).
-	[Get started creating a Power BI app](powerbi-developer-steps-to-create-a-power-bi-app.md)
-	Power BI REST [Get Dashboards](https://msdnstage.redmond.corp.microsoft.com/library/mt465739.aspx), [Get Tiles](https://msdn.microsoft.com/library/mt465741.aspx) and [Get Reports](https://msdn.microsoft.com/library/mt634543.aspx) operations
