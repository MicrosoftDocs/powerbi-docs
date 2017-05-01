<properties
   pageTitle="Embedding with Power BI"
   description="The Power BI service and Power BI Embedded in Azure are coming together to offer a single API for embedding your dashboards and reports."
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
   ms.date="05/01/2017"
   ms.author="asaxton"/>
# Embedding with Power BI

The Power BI service and Power BI Embedded in Azure are coming together to offer a single API for embedding your dashboards and reports.

This will allow you flexibility in how you embed your dashboards and reports.

## A single API

The Power BI REST APIs are being updated to allow for the use of an embed token. This will allow you to embed dashboards and reports into your customer application and give you the control of managing your users and mapping them to a Power BI service user. 

You can take full advantage of the JavaScript and REST APIs for your embedding needs.

## Embedding without an embed token

You can continue to embed content from the Power BI service into your applications using the REST API. This requires that the you sign into the Power BI service when you want to view your content in the application. For more information on how to do this, see the following.

- [Integrate a dashboard into an app](powerbi-developer-integrate-dashboard.md)
- [Integrate a tile into an app](powerbi-developer-integrate-tile.md)
- [Integrate a report into an app](powerbi-developer-integrate-report.md)

## Embedding with an embed token

You can use an embed token with the Power BI REST APIs to embed reports by using a single Power BI user. The embed token is then used with requests made by users in your application to view content within Power BI by way of a single Power BI user. The users within your application do not need to exist within your Power BI organization. The embed token is what makes it possible.

To embed dashboards, reports and tiles, you would use the same APIs that you did without an embed token. When the new embedding updates are rolled out, we will update these steps with how to use an embed token.

- [Integrate a dashboard into an app](powerbi-developer-integrate-dashboard.md)
- [Integrate a tile into an app](powerbi-developer-integrate-tile.md)
- [Integrate a report into an app](powerbi-developer-integrate-report.md)

Using an embed token allows you to use a single Power BI user with your application. The embed token is generated based on authentication of that single Power BI user and you can then use that token with multiple users within your application. Those users within your application to not need to be represented within your Power BI organization or have any licenses.

For details on how to take advantage of an embed token, see [Use an embed token when embedding dashboards and reports](powerbi-developer-using-embed-token.md).

If you were using the Power BI Embedded service within Azure, see [Migrate content from the Power BI Embedded Azure service](powerbi-developer-migrate-from-powerbi-embedded.md) for information on how to migrate your content over. If you never used Power BI Embedded, you can get started with using the embed token when it becomes available!

## Next steps

[Use an embed token when embedding](powerbi-developer-using-embed-token.md)  
[Migrate content from the Power BI Embedded Azure service](powerbi-developer-migrate-from-powerbi-embedded.md)  
[JavaScript API Git repo](https://github.com/Microsoft/PowerBI-JavaScript)  
[Power BI C# Git repo](https://github.com/Microsoft/PowerBI-CSharp)  
[JavaScript embed sample](https://microsoft.github.io/PowerBI-JavaScript/demo/)  
More questions? [Try the Power BI Community](http://community.powerbi.com/)

