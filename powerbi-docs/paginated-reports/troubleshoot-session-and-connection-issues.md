---
title: Troubleshoot Paginated Report Session and Connection Issues
description: In this article, diagnose and fix session creation and connection issues with paginated reports.
author: JulCsc
ms.author: juliacawthra
ms.reviewer: rpatkar
ms.service: powerbi
ms.subservice: report-builder
ms.topic: troubleshooting
ms.date: 12/01/2025
ai-usage: ai-assisted
---
# Troubleshoot paginated report session and connection issues

Before the report processor can retrieve the report data a session must be created. Then connections to underlying data sources must be created.

Use this topic to help troubleshoot issues specific to report specific connection issues.

## Why do I get a "Your session has expired" message?

When you're viewing paginated reports in the Power BI service, sessions might time out, presenting you with a "Your session has expired" notification.

The session times out after 10 minutes of inactivity, or earlier when the device is locked or inactive.

## Why do I get an "Error communicating with Analysis Service" message?

Paginated reports time out after 600 seconds when using a Power BI DirectQuery semantic model as a source. After 600 seconds, you receive this error: 
          
"There was an error communicating with Analysis Services. Please verify that the data source is available and your credentials are correct. The connection either timed out or was lost." 
          
For paginated reports running longer than 10 minutes, use  the XMLA endpoint to connect to the Power BI semantic model.

## Why do I get a "There was an error when attempting to create a new session" message?

If the error message indicates a network connectivity issue, verify your network configuration—including VPN settings, network policies, and firewall rules—to ensure nothing is blocking your browser from connecting to the Power BI service.

If you are using Chrome 142 and encounter this issue you can work around it by using Microsoft Edge browser or an earlier version of Google Chrome. Alternatively, you can disable the Local Network Access Check flag in Chrome by navigating to: `chrome://flags/#local-network-access-check` in the Chrome browser.
