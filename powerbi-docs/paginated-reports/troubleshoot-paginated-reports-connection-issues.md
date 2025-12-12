---
title: "Troubleshoot paginated report session issues"
description: In this article, diagnose and fix connection issues with paginated reports.
author: JulCsc
ms.author: juliacawthra
ms.reviewer: rpatkar
ms.service: powerbi
ms.subservice: report-builder
ms.topic: troubleshooting
ms.date: 12/12/2025
ai-usage: ai-assisted
---
# Troubleshoot paginated report connection issues

Before the report processor can retrieve the report data a session must be created. Then connection to underlying data sources must be created.

Use this topic to help troubleshoot issues specific to report specific connection issues.

## Why do I get a "Your session has expired" message?

When you're viewing paginated reports in the Power BI service, sessions may time out, presenting you with a "Your session has expired" notification.

The session times out after 10 minutes of inactivity, or earlier when the device is locked or inactive.

## Why do I get an "Error communicating with Analysis Service" message?

Paginated reports time out after 600 seconds when using a Power BI DirectQuery dataset as a source. After 600 seconds, you receive this error: 
          
"There was an error communicating with Analysis Services. Please verify that the data source is available and your credentials are correct. The connection either timed out or was lost." 
          
For paginated reports running longer than 10 minutes, we recommend using  the XMLA endpoint to connect to the Power BI semantic model.

## Why do I get a "There was an error when attempting to create a new session" message?

This error occurs when something unexpected occurs when conecting to the service during the rendering of a report. Please check your network connection, VPN settings, network policies and firewall rules to ensure there is nothing that would block traffic back to the Power BI service.

When using Chrome 142 to render paginated reports session creation may occur. To work around this issue use Microsoft Edge browser or older Google Chrome. Alternatively disable the 'local network access check' option (by accessing `chrome://flags/#local-network-access-check`) in Chrome.
