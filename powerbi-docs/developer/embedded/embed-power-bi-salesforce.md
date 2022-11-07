---
title: Embed Power BI content in Salesforce
description: Learn how to embed Power BI content in Salesforce by using embedded analytics developer samples.
author: mberdugo
ms.author: monaberdugo
ms.service: powerbi
ms.subservice: powerbi-developer
ms.topic: how-to
ms.date: 05/26/2021
---

# Embed Power BI content in Salesforce

[Salesforce](https://www.salesforce.com/) is a world-renowned customer relationship management (CRM) solution. Power BI embedded analytics lets you embed Power BI content, such as reports and dashboards, in Salesforce.

This article links to two samples that show how to develop by using Power BI embedded analytics in a Salesforce environment.

## Prerequisites

You must be familiar with both Power BI and Salesforce. It's helpful to have experience developing with Power BI embedded analytics and be familiar with the Salesforce environment, preferably with the Salesforce Developer Experience (SFDX).

## Embed for your customers solution

In the *embed for your customers* solution, which is also known as an *app owns data* solution, you create an embedded application by using your own Power BI account. Your customers don't need to use Power BI credentials to view and interact with the embedded content.

### Apex class

The Salesforce *embed for your customers* solution uses a [service principal](embed-service-principal.md) and is built on top of an Apex class named `PowerBiEmbedManager`.

Here are some advantages of the `PowerBiEmbedManager` Apex class:

* The `PowerBiEmbedManager` Apex class is programmed to interact with both Azure AD and the [Power BI REST APIs](/rest/api/power-bi/).

* The `PowerBiEmbedManager` Apex class implements [Client Credentials Flow](/azure/active-directory/develop/v2-oauth2-client-creds-grant-flow) when it interacts with Azure AD to acquire an app-only access token. App-only access tokens are important because they can call the Power BI REST APIs under the identity of a service principal, instead of calling under the identity of a user.

### Lightning Aura

The Salesforce embed for your customers solution contains a Lightning Aura component named `powerBiReportAura`. When you add an instance of the `powerBiReportAura` component to a Lightning application page, you must configure it with a specific Power BI *Workspace ID* and *Report ID*. This design makes it possible to add multiple instances of the `powerBiReportAura` component, and configure each instance to embed a different Power BI report.

### Access the *embed for your customers* Salesforce developer sample

To embed Power BI content by using the embed for your customers Salesforce solution, follow the instructions in the [SalesforceAppOwnsDataEmbedding](https://github.com/PowerBiDevCamp/SalesforceAppOwnsDataEmbedding) GitHub repository.

## Embed for your organization solution

In the *embed for your organization* solution, which is also known as a *user owns data* solution, you create an embedded application that requires your customers to sign in with their own Power BI credentials. Signed in customers can view and interact with the embedded content according to their Power BI permissions.

### Single page application

The Salesforce embed for your organization Salesforce solution uses a simple single page application (SPA) that implements Power BI reports. The solution is built by using three essential files:

* *index.html*
* *app.css*
* *app.js*

### Client-side libraries

In the Salesforce embed for your organization Salesforce solution, `powerbi.js` is used to access the [Power BI embedded analytics Client APIs](/javascript/api/overview/powerbi/).

### Access the embed for your organization Salesforce developer sample

To embed Power BI content that uses the embed for your organization solution, follow the instructions in the [SalesforceUserOwnsDataEmbedding](https://github.com/PowerBiDevCamp/SalesforceUserOwnsDataEmbedding) GitHub repository.

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
