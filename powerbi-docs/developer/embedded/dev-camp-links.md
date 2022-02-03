---
title: Power BI Dev Camp links for developers who want to learn how to embed Power BI
description: This article provides links to the Power BI Dev Camp, a resource for developers who want to learn how to embed Power BI
author: mberdugo
ms.author: monaberdugo
ms.service: powerbi
ms.subservice: powerbi-developer
ms.topic: how-to
ms.date: 04/20/2021
---

# Power BI Dev Camp

[Power BI Dev Camp](https://www.powerbidevcamp.net/) (third-party site) is an educational resource for developers that want to learn more about Power BI as a developer platform. It covers topics such as Power BI embedding and the development of Power BI visuals and custom connectors.

This article provides links to some of the Power BI Dev Camp resources.

## Tutorials

The Power BI Dev Camp tutorials are targeted towards developers who are interested in understanding how to embed Power BI items (such as reports, dashboards and tiles).

* [App owns data embedding with .NET 5](https://github.com/PowerBiDevCamp/DOTNET5-AppOwnsData-Tutorial) - A tutorial that shows developers how to create a .NET 5 MVC web application that implements Power BI embedding using the *app owns data* embedding model. The tutorial covers advanced topics such as adding project support for TypeScript using `node.js`, and programming the Power BI REST API to generate multi-resource access tokens.

* [User owns data embedding with .NET 5](https://github.com/PowerBiDevCamp/DOTNET5-UserOwnsData-Tutorial) - A tutorial that shows developers how to create a .NET 5 MVC web application that implements Power BI embedding using the *user owns data* embedding model. The tutorial covers advanced topics such as adding project support for TypeScript using `node.js` and programming the Power BI REST API to generate multi-resource access tokens.

## Samples

The Power BI Dev Camp samples provide additional resources for developers who are looking to embed Power BI items (such as reports, dashboards and tiles).

* [App owns data hello world](https://github.com/PowerBiDevCamp/AppOwnsDataHelloWorld) - A minimal .NET 5 sample application to embed either a standard Power BI report or a paginated report. You can run and test the sample in either Visual Studio Code or Visual Studio 2019. It also includes details for using a Power BI cloud other than the public cloud, which has different URLs and different Azure ID resource IDs.

* [App owns data custom web API](https://github.com/PowerBiDevCamp/AppOwnsDataWebApi) - A .NET 5 custom web API sample, with a single page application (SPA) client created using JavaScript. The custom web API interacts with the Power BI service API as a service principal, and returns embedding data and embed tokens back to the client. This sample demonstrates collecting telemetry data from the SPA client and storing it in a custom database to monitor report loading performance.

* [App owns data and RLS](https://github.com/PowerBiDevCamp/AppOwnsDataWithRLS) - A sample web application built using .NET 5 and Power BI *app owns data* embedding. Created to demonstrate how to design a security authorization model, which leverages `EffectiveIdentity` and Row-level Security (RLS).

* [Tenant management application for Power BI](https://github.com/PowerBiDevCamp/TenantManagement) - A .NET 5 sample application that demonstrates how to manage service principals within a large-scale Power BI embedding environment with thousands of customer tenants.

* [Salesforce app owns data embedding](https://github.com/PowerBiDevCamp/SalesforceAppOwnsDataEmbedding) - A sample project that demonstrates how to implement *app owns data* embedding with Power BI reports. This project has been created using the Salesforce developer experience (SFDX) and the Salesforce command line interface (CLI). The goal of this sample project is to provide guidance and demonstrate best practices for developers who need to implement Power BI embedding in a Salesforce environment.

* [Salesforce user owns data embedding](https://github.com/PowerBiDevCamp/SalesforceUserOwnsDataEmbedding) - A sample project that includes a simple single page application (SPA) that implements *user owns data* embedding with Power BI reports. The solution is built using three essential files, which include `index.html`, `app.css` and `app.js`. This solution contains an option fourth file named `loading.gif` which is used to demonstrate a white-label loading technique in which the developer can display a custom loading image, instead of the standard Power BI branded loading image.

## Videos

To view the Power BI Dev Camp videos, go to the [video page](https://www.powerbidevcamp.net/videos/).

## Presentations

The Power BI Dev Camp presentations can be downloaded from the [Camp-Sessions](https://github.com/PowerBiDevCamp/Camp-Sessions) GitHub repository.

## Next steps

>[!div class="nextstepaction"]
>[Embed Power BI content into an application for your customers](embed-sample-for-customers.md)

>[!div class="nextstepaction"]
>[Embed Power BI content into an application for your organization](embed-sample-for-your-organization.md)

>[!div class="nextstepaction"]
>[Embed a Power BI report in an application for your organization](embed-organization-app.md)

>[!div class="nextstepaction"]
>[Power BI embedded analytics Client APIs](/javascript/api/overview/powerbi/)

>[!div class="nextstepaction"]
>[Power BI embedded analytics playground](https://go.microsoft.com/fwlink/?linkid=848279)
