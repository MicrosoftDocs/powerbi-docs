---
title: Planning Power BI visual offer
description: Learn what you need to do before you submit your custom visual offer to the Commercial Marketplace.
author: KesemSharabi
ms.author: kesharab
ms.reviewer: ""
ms.service: powerbi
ms.subservice: powerbi-custom-visuals
ms.topic: how-to
ms.date: 08/14/2021
---

# Plan a Power BI visual offer

This article highlights the content and requirements you need to have ready or completed to publish a Power BI visual to Microsoft [AppSource](https://appsource.microsoft.com). Power BI visuals are packages that help visualize the data served to them. Anyone can create a custom visual and package it as a single .pbiviz file, that can be imported into a Power BI report.

Before you start, [create a commercial marketplace account in Partner Center](/azure/marketplace/create-account) and ensure your account is enrolled in the commercial marketplace program. Also, review the [publishing process and guidelines](/office/dev/store/submit-to-appsource-via-partner-center).

## Publishing benefits

Benefits of publishing to the commercial marketplace:

* Promote your company by using the Microsoft brand.
* Potentially reach more than 100 million Microsoft 365 and Dynamics 365 users on AppSource and more than 200,000 organizations through Azure Marketplace.
* Receive high-quality leads from these marketplaces.
* Have your services promoted by the Microsoft field and telesales teams.

## Overview

Read the following to ensure you're properly prepared before starting the offer creation process.

These are the key publishing steps covered in the next several topics:

1. Create your visual in Power BI. You'll receive a package install link, which is the main technical asset for the offer. 
2. Send the test package to pre-production before creating the offer in Partner Center. For details, see What are Power BI apps?
Add the marketing materials, such as official name, description, and logos.
3. Include the offer's legal and support documents, such as terms of use, privacy policy, support policy, and user help.
4. Create the offer – Use Partner Center to edit the details, including the offer description, marketing materials, legal information, support information, and asset specifications.
Submit it for publishing.
5. Monitor the process in Partner Center, where the AppSource onboarding team tests, validates, and certifies your app.
After it's certified, review the app in its test environment and release it. This will list it on AppSource (it "goes live").
6. In Power BI, send the package into production. For details, see Manage the Power BI app release.
Requirements
7. To be published in the commercial marketplace, your Power BI app offer must meet the following technical and business requirements.

## Technical requirements

Before submitting a Power BI visual to AppSource, make sure you've read the Power BI visuals guidelines and tested your custom visual.

When you are ready to submit your Power BI visual, create the following files.

* *Pbivix* package
    Pack your Power BI visual into a [Pbiviz package](custom-visual-develop-tutorial-format-options.md#packaging-the-custom-visual) containing all the required metadata including:
  * Visual name
  * Display name
  * GUID
  * Version
  * Description
  * Author name and email

* Sample *.pbix* report file
    To showcase your visual, you should help users to get familiar with the visual. Highlight the value that the visual brings to the user and give examples of usage and formatting options. You can also add a "hints" page at the end with some tips and tricks and things to avoid.
    The sample *.pbix* report file must work offline, without any external connections.

## Legal requirements

You must provide an **End-User License Agreement (EULA)** file for your Power BI visual. This file describes the terms and conditions customers must accept before they can try your offer You can use the [standard contract](https://go.microsoft.com/fwlink/?linkid=2041178), [Power BI visuals contract](https://visuals.azureedge.net/app-store/Power%20BI%20-%20Default%20Custom%20Visual%20EULA.pdf), or your own EULA.

## Offer listing details

>[!NOTE]
>Offer listing content is not required to be in English if the offer description begins with the phrase "This application is available only in [non-English language]".

To help create your offer more easily, prepare the following details ahead of time. All are required except where noted.

### Name

The name will appear as the title of your offer listing in the commercial marketplace. The name may be trademarked. It cannot contain emojis (unless they are the trademark and copyright symbols) and is limited to 50 characters.

### Summary

The purpose or function of your offer as a single sentence with no line breaks in 100 characters or less. This is used in the commercial marketplace listing(s) search results.

### Description

This description displays in the commercial marketplace listings overview. Consider including a value proposition, key benefits, intended user base, any category or industry associations, in-app purchase opportunities, any required disclosures, and a link to learn more. This text box has rich text editor controls to make your description more engaging. Optionally, use HTML tags for formatting.

### Help/Privacy policy links

The URL for your company’s help and privacy policy. You are responsible for ensuring your app complies with privacy laws and regulations.

## Media requirements

### Logo

Provide the custom visual icon that will appear in the Microsoft AppSource main page and search results page. The format can be PNG, JPG, .JPEG, or GIF. It must be exactly 300 px (width) x 300 px (height).

>[!Important]
> Please review the [AppSource store images guide](/office/dev/store/craft-effective-appsource-store-images) carefully, before submitting the icon.

### Screenshots

Provide at least one screenshot. The format can be PNG, JPG, .JPEG, or GIF. The dimensions must be exactly 1366 px (width) by 768 px (height). The size of the file can't be larger than 1024 kb.
    For greater usage, add text bubbles to articulate the value proposition of key features shown in each screenshot.

### Videos

To increase the interest of users for your custom visual, provide  a **YouTube** or **Vimeo** link to a video about your visual. The format of your URL should include https:// or https://.

>[!NOTE]
>Your offer must meet the general [commercial marketplace certification policies](/legal/marketplace/certification-policies#100-general) to be published to the commercial marketplace.

## Next steps

Create a Power BI visual offer
