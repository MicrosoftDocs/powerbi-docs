---
title: Use embedded analytics to embed Power BI content in Salesforce
description: Learn how to embed Power BI content in Salesforce using embedded analytics
author: KesemSharabi
ms.author: kesharab
ms.service: powerbi
ms.subservice: powerbi-developer
ms.topic: how-to
ms.date: 05/12/2021
---

# Embed Power BI content in Salesforce

[Salesforce](https://www.salesforce.com/) is a world renowned customer relationship management (CRM) solution. Embedded analytics lets you embed Power BI content such as reports and dashboards in Salesforce.

This article links to two tutorials that show how to develop using Power BI embedded analytics in a in a Salesforce environment. In these tutorials, you'll learn how to:

>[!div class="checklist"]
>* Embed Power BI content in Salesforce, using a single page application (SPA).
>* Use client-side JavaScript to acquire access tokens from Azure AD.
>* Program against the Power BI JavaScript API.
>* Create an Apex class that runs in the Salesforce cloud and calls the Power BI service using a [service principal](embed-service-principal.md).
>* Develop lighting aura components and lightning web components, which surface embedded reports on pages in a Salesforce environment.

## Prerequisites

You need to be familiar with both Power BI and Salesforce.

* You should have experience developing with Power BI embedded analytics.

* You should be familiar with the Salesforce environment; preferably with the salesforce developer experience (SFDX).

## Embed for your customers

In the *embed for your customers* solution, also known as *app owns data*, you create an embedded application using your own Power BI account. Your customers don't need to use Power BI credentials to view and interact with the embedded content.

To embed Power BI content using the *embed for your customers* solution, follow the instructions in the [SalesforceAppOwnsDataEmbedding](https://github.com/PowerBiDevCamp/SalesforceAppOwnsDataEmbedding) GitHub repository.

## Embed for your organization

In the embed for your organization solution, also known as *user owns data*, you create an embedded application that requires your customers to sign in with their own Power BI credentials. Signed in customers can view and interact with the embedded content according to their Power BI permissions.

To embed Power BI content using the *embed for your organization* solution, follow the instructions in the [SalesforceUserOwnsDataEmbedding](https://github.com/PowerBiDevCamp/SalesforceUserOwnsDataEmbedding) GitHub repository.

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
