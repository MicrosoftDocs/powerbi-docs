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

The Power BI REST APIs are being updated for use with to allow for the use of an embed token. This will allow you to embed dashboards and reports into your customer application and give you the control of managing your users and mapping them to a Power BI service user. 

You can take full advantage of the JavaScript and REST APIs for your embedding needs.

## Embedding without an embed token

You can continue to embed content from the Power BI service into your applications using the REST API. This requires that the you sign into the Power BI service when you want to view your content in the application. For more information on how to do this, see the following.

- [Integrate a dashboard into an app](powerbi-developer-integrate-dashboard.md)
- [Integrate a tile into an app](powerbi-developer-integrate-tile.md)
- [Integrate a report into an app](powerbi-developer-integrate-report.md)

## Embedding with an embed token

Embedding with an embed token allows you to embed in your custom application in a similar approach to what was done with the Power BI Embedded Azure service. You control the users within your application and generated an embed token based on a single Power BI user. For more information, see [Migrate content from the Power BI Embedded Azure service](powerbi-developer-migrate-from-powerbi-embedded.md).

The following is a look at what the flow looks like to accomplish this.

![](media\powerbi-developer-migrate-from-powerbi-embedded\powerbi-embedded-flow.png)

## Next steps

[Migrate content from the Power BI Embedded Azure service](powerbi-developer-migrate-from-powerbi-embedded.md)  
[JavaScript API Git repo](https://github.com/Microsoft/PowerBI-JavaScript)  
[Power BI C# Git repo](https://github.com/Microsoft/PowerBI-CSharp)  
[JavaScript embed sample](https://microsoft.github.io/PowerBI-JavaScript/demo/)  
More questions? [Try the Power BI Community](http://community.powerbi.com/)

