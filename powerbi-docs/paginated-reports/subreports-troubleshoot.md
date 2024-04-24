---
title: "Troubleshoot subreports in Power BI paginated reports"
description: Learn about solutions for common issues when using subreports, which are report items inside a Power BI paginated report.
author: maggiesMSFT
ms.author: maggies
ms.reviewer: ''
ms.service: powerbi
ms.subservice: report-builder
ms.topic: troubleshooting
ms.date: 02/08/2023
---

# Troubleshoot subreports in Power BI paginated reports

[!INCLUDE [applies-yes-report-builder-no-desktop](../includes/applies-yes-report-builder-no-desktop.md)] 

When you use subreports in Power BI paginated reports, you might get an unexpected result, or sometimes the feature doesn't work as you expected. This article provides solutions for common issues when using subreports. A *subreport* is a report item that displays another report inside the body of a main paginated report. For more information, see [Subreports in Power BI paginated reports](subreports.md).

Possible issues:
- [Subreport can't be found](#subreport-cant-be-found)
- [Subreport renders with unexpected content](#subreport-renders-with-unexpected-content)
- [Data retrieval fails](#data-retrieval-fails)
- [Rendering fails: Unspecified parameters](#rendering-fails-unspecified-parameters)
- [Rendering fails: Recursion limit](#rendering-fails-recursion-limit)
- [Other errors](#other-errors)

## Subreport can't be found

**Description:** The subreport doesn't render. Instead, an error message appears.

### Message

"The subreport 'Subreport1' could not be found at the specified location 'CustomerDetails'. Verify that the subreport has been published and that the name is correct."

### Possible reasons

- A subreport with the specified name doesn't exist in the same workspace or app as the main report.
- The user doesn't have access to the subreport.
- The number of subreports in the main report has reached the subreport limit (50 subreports).

### Troubleshooting

**In a workspace:**

- Verify that the report with the name in the error message exists. The name is case insensitive.

**In an app:**

- Verify that the report with the name in the error message exists in the app. Contact the author of the app for further assistance.

**If the report is shared:**

1. Verify that the report with the name in the error message is shared with you.
2. If the report exists, verify that the owner name is the same for the main report and the subreport. Then contact the owner of the main report with that information.

## Subreport renders with unexpected content

### Possible reason

Power BI allows users to have multiple reports with the same name in the same workspace.

### Troubleshooting

1. Open the main report in Power BI Report Builder and identify the name of the subreport.
2. Look for reports with the same name in the workspace.
3. Locate the expected report and rename the rest.

**For non-authors:** Contact the author.

## Data retrieval fails

**Description:** Data retrieval fails while rendering the subreport. Subreport doesn't render. Instead an error message appears.

### Message

"Data retrieval failed for the subreport, 'Subreport1', located at: 'InvoiceDetails'. Check the log files for more information."

### Troubleshooting

Same as the general troubleshooting steps for reports with data access issues. See [Troubleshoot data retrieval issues](/sql/reporting-services/troubleshooting/troubleshoot-data-retrieval-issues-with-reporting-services-reports) in the Reporting Services documentation.

## Rendering fails: Unspecified parameters

**Description:** Subreport rendering fails because of unspecified parameters. The subreport has mandatory parameters but the main report doesn't set all of them.

### Message 
"One or more parameters were not specified for the subreport, 'Subreport1', located at: 'SubreportAWithDS'."

### Troubleshooting

1. Open the main report in Power BI Report Builder.
2. Open the subreport in Power BI Report Builder.
3. Verify that the set of parameters passed inside the subreport report item in the main report matches the set of parameters in the subreport.

**For non-authors:** Contact the author.

## Rendering fails: Recursion limit

**Description:** Subreport rendering fails because of the recursion limit. Subreports can't be nested deeper than 20 levels.

### Message

"The report or subreport has a recursive subreport, 'Subreport1', that exceeded the maximum recursion limit allowed."

### Troubleshooting

- Reduce nesting.
- Redesign the report structure.

**For non-authors:** Contact the author.

## Other errors

**Description:** Errors that don't fall into any of the previous categories.

### Message

"Error: Subreport could not be shown."

### Possible reasons

- Multiple errors during subreport rendering, for example, parameter mismatch with data retrieval issues.
- Unexpected errors.

### Troubleshooting

1. Verify that the subreport can render directly.
2. If the subreport can render, check the parameters for both the subreport and main report.
3. Make sure the main report doesn't have more than 50 unique subreports, and the subreport isn't nested deeper than 20 levels.
4. If you can't resolve the issue, contact Power BI support.

**For non-authors:** Contact the author.

## Related content

- [Subreports in Power BI paginated reports](subreports.md).

- [View a paginated report in the Power BI service](../consumer/paginated-reports-view-power-bi-service.md).

- More questions? [Ask the Power BI Community](https://community.powerbi.com/).
