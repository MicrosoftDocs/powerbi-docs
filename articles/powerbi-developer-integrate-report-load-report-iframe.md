<properties
   pageTitle="Load a Power BI report into an IFrame"
   description="Walkthrough to Integrate a report into an app - Load a report into an IFrame"
   services="powerbi"
   documentationCenter=""
   authors="dvana"
   manager="mblythe"
   editor=""
   tags=""/>

<tags
   ms.service="powerbi"
   ms.devlang="NA"
   ms.topic="get-started-article"
   ms.tgt_pltfrm="NA"
   ms.workload="powerbi"
   ms.date="05/24/2016"
   ms.author="derrickv"/>

# Step 3: Load a report into an IFrame

## Introduction

In **step 2** of Integrate a report into an app, [Get a Power BI report](powerbi-developer-integrate-report-get-report.md), you get a Power BI report. In this step, you load a report into an **IFrame**.

![](media\powerbi-developer-integrate-report\integrate-report-load-report-iframe.png)

To load a report into an **IFrame**, you set the **src** attribute of an **IFrame** to the **embedUrl** property of a **report**, and create an **onload** handler to post a message with an **access token** to get access to the report visual. Below is JavaScript code to load a report into an **IFrame**.

**Load a report into an IFrame**

```
//Configure IFrame for the report after you have an Access Token. See Default.aspx.cs to learn how to get an Access Token
window.onload = function () {
    if ("" != document.getElementById('MainContent_accessToken').value)
    {
        var iframe = document.getElementById('iFrameEmbedReport');

        // To load a Report do the following:
        // Set the IFrame source to the EmbedUrl from the Get Reports operation
        iframe.src = document.getElementById('MainContent_ReportEmbedUrl').value;

        // Add an onload handler to submit the access token
        iframe.onload = postActionLoadReport;
    }
};

// Post the access token to the IFrame
function postActionLoadReport() {

    // Construct the push message structure
    // this structure also supports setting the reportId, groupId, height, and width.
    // when using a report in a group, you must provide the groupId on the iFrame SRC
    var m = {
        action: "loadReport",
        accessToken: document.getElementById('MainContent_accessToken').value
    };
    message = JSON.stringify(m);

    // push the message.
    iframe = document.getElementById('iFrameEmbedReport');
    iframe.contentWindow.postMessage(message, "*");;
}
```

If you downloaded and ran the [Integrate a report sample](https://github.com/Microsoft/PowerBI-CSharp/tree/master/samples/webforms/integrate-report-web-app), the sample will look similar to below.

![](media\powerbi-developer-integrate-report\integrate-report-sample.png)

## Conclusion
In this walkthrough you learned how to integrate a report into an app by getting a report, and then loading the report into an **IFrame**. You can download the complete [Integrate a report sample](https://github.com/Microsoft/PowerBI-CSharp/tree/master/samples/webforms/integrate-report-web-app)  which shows all the parts working to embed a report into an ASP.NET web app. You can also view the complete [Integrate a report into an app code listing](powerbi-developer-integrate-report-code.md).

## See also
-	[Sign up for Power BI](powerbi-admin-free-with-custom-azure-directory.md)
-	[Integrate a report into an app walkthrough](powerbi-developer-integrate-report.md)
-	[Integrate a report sample](https://github.com/Microsoft/PowerBI-CSharp/tree/master/samples/webforms/integrate-report-web-app)
-	[Configure the integrate a report sample](powerbi-developer-integrate-report-register.md#configure-sample)
-	[Get Reports operation](https://msdn.microsoft.com/library/mt634543.aspx)
