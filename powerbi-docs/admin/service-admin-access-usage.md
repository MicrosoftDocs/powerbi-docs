---
title: Find Power BI users who have signed in
description: If you're an admin, and want to see who has signed into Power BI, you can use the Azure Active Directory access and usage reports.
author: kfollis
ms.author: kfollis
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-admin
ms.topic: how-to
ms.date: 11/28/2020
LocalizationGroup: Administration
---

# Find Power BI users who have signed in

If you're an admin for your organization, and want to see who has signed in to Power BI, use the [Azure Active Directory (Azure AD) access and usage reports](/azure/active-directory/reports-monitoring/concept-sign-ins), which are also known as the sign-in logs.

> [!NOTE]
> The **Sign-in logs** report provides useful information, but it doesn't identify the type of license for each user. Use the Microsoft 365 admin center to view licenses.

## Requirements

Any user can view a report of their own sign-ins. To see a report for all users, you must be in one of the following roles: Global Administrator, Security Administrator, Security Reader, Global Reader, or Report Reader.

## Use the Azure AD admin center to view sign-ins

To view sign-in activity, follow these steps:

1. Sign in to the [Azure AD admin center](https://aad.portal.azure.com), and then select **Azure Active Directory** from the portal menu.

1. From the resource menu, select **Monitoring** > **Sign-in logs**.

    :::image type="content" source="media/service-admin-access-usage/azure-portal-sign-ins.png" alt-text="Screenshot of the Azure Active Directory admin center with Sign-in options highlighted.":::

1. By default, all sign-ins from the last 24 hours for all users and all applications are shown. To select a different time period, select **Date** in the working pane and choose from the available time intervals. Only information from the last seven days is available. To see only sign-ins to Power BI, add filters:

    a. Select **Add filter** > pick **Application** as the field to filter by, and select **Apply**.

    b. From the top of the working pane, select **Application contains**.

    - To see only sign-in activity that's related to Power BI, enter **Microsoft Power BI**
        
    - To see only sign-in activity that's specific to the on-premises data gateway, enter **Power BI Gateway**

1. Select **Apply**.

**Microsoft Power BI** filters to sign-in activity related to the service. **Power BI Gateway** filters to sign-in activity specific to the on-premises data gateway.
    :::image type="content" source="media/service-admin-access-usage/sign-in-filter.png" alt-text="Screenshot of the Sign-in filter with the Application field highlighted.":::

## Export the data

You can [download a sign-in report](/azure/active-directory/reports-monitoring/quickstart-download-sign-in-report) in either of two formats: a CSV file, or a JSON file. Use the following steps to download your report:

1. From the command bar for the **Sign-in logs** report, select **Download** and then select one of the following options:

   - **Download JSON** to download a JSON file for the currently filtered data

   - **Download CSV** to download a CSV file for the currently filtered data

2. Decide what type of sign-ins you want to export, and then select **Download**.

    :::image type="content" source="media/service-admin-access-usage/download-sign-in-data-csv.png" alt-text="Screenshot of the data export with the Download option highlighted.":::

## Data retention

Sign-in-related data is available for up to seven days, unless your organization has an Azure AD premium license. If you use Azure AD Premium P1 or Azure AD Premium P2, you can see data for the past 30 days. For more information, see [How long does Azure AD store reporting data?](/azure/active-directory/reports-monitoring/reference-reports-data-retention).

## Next steps

[Track user activities in Power BI](service-admin-auditing.md)

More questions? [Try asking the Power BI Community](https://community.powerbi.com/)
