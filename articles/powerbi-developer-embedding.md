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
   ms.date="06/12/2017"
   ms.author="asaxton"/>

# Embedding with Power BI

The Power BI service and Power BI Embedded in Azure are coming together to offer a single API for embedding your dashboards and reports.

This means you will have one API surface, a consistent set of capabilities and access to the latest Power BI features – such as dashboards, gateways and app workspaces – when embedding your content.

## A single API

There are two main scenarios when embedding Power BI content. Embedding with Power BI users and embedding to non-Power BI users. Previously, the Azure Power BI Embedded service was used to service non-Power BI users. This meant that the users of your application didn't need access to Power BI directly, or have any Power BI licenses assigned to them. They didn't have an account with the Power BI service. 

The Power BI REST APIs have been updated to allow for both scenarios against the Power BI service. This will allow you to embed dashboards and reports into your custom application, using the same API to either service Power BI users or non-Power BI users.

You can take full advantage of the JavaScript and REST APIs for your embedding needs.

## Embedding with Power BI users

Embedding for Power BI users is the functionality that has been available with the Power BI service. You can continue to embed content from the Power BI service into your applications using the REST API. This requires that the end user of your application sign into the Power BI service when you want to view your content in the application. Once your end user signs in, they will only have access to dashboards and reports that have been shared with them in the Power BI service. For more information on how to do this, see the following.

- [Integrate a dashboard into an app](powerbi-developer-integrate-dashboard.md)
- [Integrate a tile into an app](powerbi-developer-integrate-tile.md)
- [Integrate a report into an app](powerbi-developer-integrate-report.md)

## Embedding with non-Power BI users

Embedding for non-Power BI users provides the ability to embed dashboards and reports to users that don't have an account for Power BI. They don't need to know anything about Power BI. This is the scenario that is similar to the Azure Power BI Embedded service and what it offered. You will need at least one Power BI user with a Pro license. That account will act as a master account for your application. Think of this as a proxy account. This account allows you to generate tokens that provide access to dashboards and reports within the Power BI service.

To embed dashboards, reports and tiles, you would use the same APIs that you would use for embedding with Power BI users.

> [AZURE.IMPORTANT] While embedding has a dependency on the Power BI service, there is not a dependecy on Power BI for the users of your application when using an **embed token**. They do not need to sign up for Power BI to view the embedded content in your application.

When you are ready to move to production, your app workspace must be assigned to a Premium capacity. 

For details on how to embed with non-Power BI users, see [Embed Power BI content for non-Power BI users](powerbi-developer-using-embed-token.md).

If you were using the Power BI Embedded service within Azure, see [Migrate content from the Power BI Embedded Azure service](powerbi-developer-migrate-from-powerbi-embedded.md) for information on how to migrate your content over.

## Next steps

[Embed Power BI content for non-Power BI users](powerbi-developer-using-embed-token.md)  
[How to migrate Power BI Embedded workspace collection content to Power BI](powerbi-developer-migrate-from-powerbi-embedded.md)  
[Power BI Premium - what is it?](powerbi-premium.md)  
[JavaScript API Git repo](https://github.com/Microsoft/PowerBI-JavaScript)  
[Power BI C# Git repo](https://github.com/Microsoft/PowerBI-CSharp)  
[JavaScript embed sample](https://microsoft.github.io/PowerBI-JavaScript/demo/)  
[Power BI Premium whitepaper](https://aka.ms/pbipremiumwhitepaper)  

More questions? [Try asking the Power BI Community](http://community.powerbi.com/)