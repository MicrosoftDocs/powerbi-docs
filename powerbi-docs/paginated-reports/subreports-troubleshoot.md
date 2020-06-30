---
title: "Troubleshoot subreports in Power BI paginated reports"
description: In this article, you learn about supported data sources for paginated reports in the Power BI service, and how to connect to Azure SQL Database data sources.
author: maggiesMSFT
ms.author: maggies
ms.reviewer: ''
ms.service: powerbi
ms.subservice: report-builder
ms.topic: troubleshooting
ms.date: 04/29/2020
---

# Troubleshoot subreports in Power BI paginated reports

Sometimes when using subreports in paginated reports, you may get an unexpected result, or the feature doesn't work as you expected. This article provides solutions for common issues when using subreports. A *subreport* is a report item that displays another report inside the body of a main paginated report. See [Subreports in Power BI paginated reports](subreports.md) for more background.

## Subreport couldn't be found

**Description:** Subreport doesn't render. Instead an error message appears.

### Message

"The subreport 'Subreport1' could not be found at the specified location 'CustomerDetails'. Verify that the subreport has been published and that the name is correct."

### Possible reasons

- A subreport with the specified name doesn't exist in the same workspace or app as the main report.
- The user doesn't have access to the subreport.
- The number of subreports in the main report has reached the subreport limit (50 subreports).

### Troubleshooting steps

**In a workspace**

- Verify that the report with the name in the error message exists. The name is case insensitive.

**In an app**

- Verify that the report with the name in the error message exits in the app. Contact the author of the app for further assistance.

**If the report is shared**

1. Verify that the report with the name in the error message is shared with you.
2. If the report exists, verify that the owner name is the same for the main report and the subreport. Then contact the owner of the main report with that information.

## Subreport renders with unexpected content

### Possible reason

Power BI allows users to have multiple reports with the same name in the same workspace

### Troubleshooting steps (for report authors)

1. Open the main report in Power BI Report Builder and determine the name of the subreport.
2. Look for reports with the same name in the workspace.
3. Locate the expected report and rename the rest.

**For non-authors:** Contact the author.

## Data retrieval fails

**Description:** Data retrieval fails while rendering the subreport. Subreport doesn't render. Instead an error message appears.

### Message

"Data retrieval failed for the subreport, 'Subreport1', located at: 'InvoiceDetails'. Check the log files for more information."

### Troubleshooting steps

Same as the general troubleshooting steps for reports with data access issues.

## Rendering fails: Unspecified parameters

**Description:** Subreport rendering fails because of unspecified parameters. The subreport has mandatory parameters but the main report doesn't set all of them.

### Message 
"One or more parameters were not specified for the subreport, 'Subreport1', located at: 'SubreportAWithDS'."

### Troubleshooting steps (for the report author)

1. Open the main report in Power BI Report Builder.
2. Open the subreport in Power BI Report Builder.
3. Verify that the set of parameters passed inside the subreport report item in the main report matches the set of parameters in the subreport.

**For non-authors:** Contact the author.

## Rendering fails: Recursion limit

**Description:** Subreport rendering fails because of the recursion limit. Subreports can't be nested deeper than 20 levels.

### Message

"The report or subreport has a recursive subreport, 'Subreport1', that exceeded the maximum recursion limit allowed."

### Troubleshooting steps (for report authors)

- Reduce nesting.
- Redesign the report structure.

## Other errors

**Description:** Errors that don't fall into any of the previous categories.

### Message

"Error: Subreport could not be shown."

### Possible reasons

- Multiple errors during subreport rendering, for example, parameter mismatch with data retrieval issues.
- Unexpected errors.

### Troubleshooting steps (for report authors)

1. Verify that the subreport can render directly.
2. If the subreport can render, check the parameters in both the subreport and main report.
3. Make sure the main report doesn't have more than 50 unique subreports, and the subreport isn't nested deeper than 20 levels.
4. If you can't resolve the issue, contact Power BI support.

**For non-authors:** Contact the author.

## Next steps

[Subreports in Power BI paginated reports](subreports.md)

[View a paginated report in the Power BI service](../consumer/paginated-reports-view-power-bi-service.md)

More questions? [Try the Power BI Community](https://community.powerbi.com/)
