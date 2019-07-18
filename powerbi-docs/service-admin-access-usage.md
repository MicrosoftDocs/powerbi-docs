---
title: Find Power BI users that have signed in
description: If you're a tenant admin, and want to see who has signed into Power BI, you can use the Azure Active Directory access and usage reports to gain visibility.
author: mgblythe
manager: kfile
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-admin
ms.topic: conceptual
ms.date: 04/23/2019
ms.author: mblythe
LocalizationGroup: Administration
---

# Find Power BI users that have signed in

If you're a tenant admin, and want to see who has signed into Power BI, use the [Azure Active Directory access and usage reports](/azure/active-directory/reports-monitoring/concept-sign-ins) to gain visibility.

> [!NOTE]
> The **Sign-ins** report provides useful info, but it doesn't identify the type of license each user has. Use the Microsoft 365 admin center to view licenses.

## Requirements

Any user (including non-admins) can see a report of their own sign-ins, but you must meet the following requirements to see a report for all users.

* Your tenant must have an Azure Active Directory Premium license associated with it.

* You must be in one of the following roles: Global Admin, Security Admin, or Security Reader.

## Use the Azure portal to view sign-ins

To view sign-in activity, follow these steps.

1. In the **Azure portal**, select **Azure Active Directory**.

1. Under **Monitoring**, select **Sign-ins**.
   
    ![Screenshot of the Azure UI with the Azure Active Directory and Sign-ins options highlighted.](media/service-admin-access-usage/azure-portal-sign-ins.png)

1. Filter the application by either **Microsoft Power BI** or **Power BI Gateway**, and select **Apply**.

    **Microsoft Power BI** filters to sign-in activity related to the service, whereas **Power BI Gateway** filters to sign-in activity specific to the on-premises data gateway.
   
    ![Screenshot of the Sign-ins filter with the Applications field highlighted.](media/service-admin-access-usage/sign-in-filter.png)

## Export the data

You can [download a sign-in report](/azure/active-directory/reports-monitoring/quickstart-download-sign-in-report) in either of two formats: a CSV file, or a JSON file.

![Screenshot of the download button.](media/service-admin-access-usage/download-sign-in-data-csv.png)

At the top of the **Sign-ins** report, select **Download** and then select one of the following options:

* **CSV** to download a CSV file for the currently filtered data.

* **JSON** to download a JSON file for the currently filtered data.

## Data retention

Sign-in related data is available for up to 30 days. For more info, see [Azure Active Directory report retention policies](/azure/active-directory/reports-monitoring/reference-reports-data-retention).

## Next steps

[Using auditing within your organization](service-admin-auditing.md)

More questions? [Try asking the Power BI Community](https://community.powerbi.com/)