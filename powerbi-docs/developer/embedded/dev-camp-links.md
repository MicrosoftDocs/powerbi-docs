---
title: Power BI Dev Camp links for developers who want to learn how to embed Power BI
description: This article provides links to the Power BI Dev Camp, a resource for developers who want to learn how to embed Power BI
author: mberdugo
ms.author: monaberdugo
ms.service: powerbi
ms.subservice: powerbi-developer
ms.topic: reference
ms.date: 10/18/2022
---

# Power BI Dev Camp

[Power BI Dev Camp](https://www.powerbidevcamp.net/) (third-party site) is an educational resource for developers who want to learn more about Power BI as a developer platform. It covers topics such as Power BI embedding and the development of Power BI visuals and custom connectors.

This article provides links to some of the Power BI Dev Camp resources.

## Tutorials

The Power BI Dev Camp tutorials are targeted towards developers who are interested in understanding how to embed Power BI items (such as reports, dashboards and tiles) and do other basic embedding tasks.

### [App owns data tutorials](#tab/app-owns-data-tutorials)

* [App owns data embedding with .NET 5](https://github.com/PowerBiDevCamp/DOTNET5-AppOwnsData-Tutorial) - A tutorial that shows developers how to create a .NET 5 MVC web application that implements Power BI embedding using the *app owns data* embedding model. The tutorial covers advanced topics such as adding project support for TypeScript using `node.js`, and programming the Power BI REST API to generate multi-resource access tokens.

### [User owns data tutorials](#tab/user-owns-data-tutorials)

* [User owns data embedding with .NET 5](https://github.com/PowerBiDevCamp/DOTNET5-UserOwnsData-Tutorial) - A tutorial that shows developers how to create a .NET 5 MVC web application that implements Power BI embedding using the *user owns data* embedding model. The tutorial covers advanced topics such as adding project support for TypeScript using `node.js` and programming the Power BI REST API to generate multi-resource access tokens.

* [NetCore user owns Data tutorial](https://github.com/PowerBiDevCamp/NetCore-UserOwnsData-Tutorial)
A tutorial for developing web applications for Power BI using .NET Core 3.1.

---

* [Tabular-Object-Model-Tutorial](https://github.com/PowerBiDevCamp/Tabular-Object-Model-Tutorial)
A tutorial and sample code programming datasets using the Tabular Object Model with Power BI Desktop and the Power BI Service via the XMLA endpoint.

* [PowerBI-PowerShell-Tutorial](https://github.com/PowerBiDevCamp/PowerBI-PowerShell-Tutorial)
Students files for the Power BI PowerShell tutorial from Power BI Dev Camp.

## Examples

The Power BI Dev Camp examples provide additional resources for developers who are looking to embed Power BI items (such as reports, dashboards and tiles).

### [App owns data examples](#tab/app-owns-data-examples)

* [App owns data hello world](https://github.com/PowerBiDevCamp/AppOwnsDataHelloWorld) - A minimal .NET 5 application example to embed either a standard Power BI report or a paginated report. You can run and test the code in either Visual Studio Code or Visual Studio 2019. It also includes details for using a Power BI cloud other than the public cloud, which has different URLs and different Azure ID resource IDs.

* [App owns data custom web API](https://github.com/PowerBiDevCamp/AppOwnsDataWebApi) - A .NET 5 custom web API example, with a single page application (SPA) client created using JavaScript. The custom web API interacts with the Power BI service API as a service principal, and returns embedding data and embed tokens back to the client. This example demonstrates collecting telemetry data from the SPA client and storing it in a custom database to monitor report loading performance.

* [App owns data and RLS](https://github.com/PowerBiDevCamp/AppOwnsDataWithRLS) - An example of a web application built using .NET 5 and Power BI *app owns data* embedding. Created to demonstrate how to design a security authorization model, which leverages `EffectiveIdentity` and Row-level Security (RLS).

* [App owns data multitenant](https://github.com/PowerBiDevCamp/AppOwnsDataMultiTenant) - An example of a developer project demonstrating how to use service principal profiles to manage a multitenant environment with Power BI and App-Owns-Data embedding.

* [Salesforce app owns data embedding](https://github.com/PowerBiDevCamp/SalesforceAppOwnsDataEmbedding) - An example of a project that demonstrates how to implement *app owns data* embedding with Power BI reports. This project has been created using the Salesforce developer experience (SFDX) and the Salesforce command line interface (CLI). The goal of this example is to provide guidance and demonstrate best practices for developers who need to implement Power BI embedding in a Salesforce environment.

### [User owns data examples](#tab/user-owns-data-examples)

* [Salesforce user owns data embedding](https://github.com/PowerBiDevCamp/SalesforceUserOwnsDataEmbedding) - An example of a project that includes a simple single page application (SPA) that implements *user owns data* embedding with Power BI reports. The solution is built using three essential files, which include `index.html`, `app.css` and `app.js`. This solution contains an option fourth file named `loading.gif` which is used to demonstrate a white-label loading technique in which the developer can display a custom loading image, instead of the standard Power BI branded loading image.

---

* [Tenant management application for Power BI](https://github.com/PowerBiDevCamp/TenantManagement) - A .NET 5 sample application that demonstrates how to manage service principals within a large-scale Power BI embedding environment with thousands of customer tenants.

## Videos

To view the Power BI Dev Camp videos, go to the [video page](https://www.powerbidevcamp.net/videos/).

## Presentations

The Power BI Dev Camp presentations can be downloaded from the [Camp-Sessions](https://github.com/PowerBiDevCamp/Camp-Sessions) GitHub repository.

## Next steps

* [Embed Power BI content into an application for your customers](embed-sample-for-customers.md)
* [Embed Power BI content into an application for your organization](embed-sample-for-your-organization.md)
* [Embed a Power BI report in an application for your organization](embed-organization-app.md)
* [Power BI embedded analytics playground](https://go.microsoft.com/fwlink/?linkid=848279)

More Questions? Try the [Power BI Community](https://community.powerbi.com/)
