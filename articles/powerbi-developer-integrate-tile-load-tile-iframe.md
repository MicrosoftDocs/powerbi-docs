<properties
   pageTitle="Load a Power BI tile into an IFrame"
   description="Walkthrough to Integrate a tile into an app - Load a tile into an IFrame"
   services="powerbi"
   documentationCenter=""
   authors="guyinacube"
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
   ms.author="asaxton"/>

# Step 4: Load a tile into an IFrame

## Introduction

In **step 3** of Integrate a tile into an app, [Get a Power BI tile](powerbi-developer-integrate-tile-get-tile.md), you get a Power BI tile. In this step, you load a tile into an **IFrame**.

![](media\powerbi-developer-integrate-tile\integrate-tile-load-tile-iframe.png)

To load a tile into an **IFrame**, you set the **src** attribute of an **IFrame** to the **embedUrl** property of a **tile**, and create an **onload** handler to post a message with an **access token** to get access to the tile visual. Below is JavaScript code to load a tile into an **IFrame**.

**Load a tile into an IFrame**

```
//Configure IFrame for the tile after you have an Access Token. See Default.aspx.cs to learn how to get an Access Token
window.onload = function () {
    if ("" != document.getElementById('MainContent_accessToken').value)
    {
        var iframe = document.getElementById('iFrameEmbedTile');

        // To load a tile do the following:
        // Set the IFrame source to the EmbedUrl from the Get Tiles operation
        iframe.src = document.getElementById('MainContent_tileEmbedUrl').value;

        // Add an onload handler to submit the access token
        iframe.onload = postActionLoadTile;
    }
};

// Post the access token to the IFrame
function postActionLoadTile() {

    // Construct the push message structure
    // This is where you assign the Access Token to get access to the tile visual
    var messageStructure = {
        action: "loadTile",
        accessToken: document.getElementById('MainContent_accessToken').value,
        height: 500,
        width: 500
    };
    message = JSON.stringify(messageStructure);

    // Push the message
    document.getElementById('iFrameEmbedTile').contentWindow.postMessage(message, "*");;
}
```

If you downloaded and ran the [Integrate a tile sample](https://github.com/Microsoft/PowerBI-CSharp/tree/master/samples/webforms/integrate-tile-web-app), the sample will look similar to below.

![](media\powerbi-developer-integrate-tile\integrate-tile-sample.png)

## Conclusion
In this walkthrough you learned how to integrate a tile into an app by getting the tile in a dashboard, and then loading the tile into an **IFrame**. You can download the complete [Integrate a tile sample](https://github.com/Microsoft/PowerBI-CSharp/tree/master/samples/webforms/integrate-tile-web-app)  which shows all the parts working to embed a tile into an ASP.NET web app. You can also view the complete [Integrate a tile into an app code listing](powerbi-developer-integrate-tile-code.md).

## See also
-	[Sign up for Power BI](powerbi-admin-free-with-custom-azure-directory.md)
-	[Integrate a tile into an app walkthrough](powerbi-developer-integrate-tile.md)
-	[Integrate a tile sample](https://github.com/Microsoft/PowerBI-CSharp/tree/master/samples/webforms/integrate-tile-web-app)
-	[Configure the integrate a tile sample](powerbi-developer-integrate-tile-register.md#configure-sample)
-	[Get Dashboards operation](https://msdn.microsoft.com/library/mt465739.aspx)
-	[Get Tiles operation](https://msdn.microsoft.com/library/mt465741.aspx)
