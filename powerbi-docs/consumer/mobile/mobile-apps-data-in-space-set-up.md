---
title: 'Set up Data in space'
description: This article explains for admins how set up the Power BI mobile app's Data in space feature in their organization.
author: paulinbar
ms.author: painbar
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-mobile
ms.topic: how-to
ms.date: 07/04/2022
ms.custom: mode-portal
#customer intent: I want to understand how to set up the Data in space feature in my organization.
---
# Set up Data in space for your organization (preview)

Data in space is a feature of the Power BI mobile apps that enables Power BI reports to be pinned in augmented reality to real-world locations, where the people who need to access those reports on location can find them.

When Data in space is set up, specified people in the organization can pin reports to locations in the real world. Using the Power BI mobile app's camera, they scan and map a location and pin a report there. Afterwards, the people who need to access the report can scan the area with their mobile app's camera and find the pinned reports in augmented reality at the place they were pinned. They can then tap the report to open it. For more information about Data in space, see the [Data in space overview](./mobile-apps-data-in-space-overview.md).

This article explains how to set up Data in space in your organization. Data in space uses Azure Spatial Anchors for storing location-mapping data, so the article includes references and notes concerning creating and configuring the required Azure Spatial Anchors resource.

See [Next steps](#next-steps) for a general overview of the Data in space feature, or for information about pinning, finding, and accessing data in space.

## Setup overview

Setting up Data in space for your organization involves three steps:

1. [Creating an Azure Spatial Anchors resource](#create-an-azure-spatial-anchors-resource).
1. [Connecting Power BI to the Azure Spatial Anchors resource](#connect-power-bi-to-the-azure-spatial-anchors-resource).
1. [Assigning users to Spatial Anchors Account roles in the Azure Spatial Anchors resource so that they get the correct roles in the Power BI mobile apps](#assign-users-to-spatial-anchors-account-roles-in-the-azure-spatial-anchors-resource).

Step 1 must be performed first. Steps 2 and 3 can be performed in any order.

## Supported operating systems

Data in space is currently supported for iOS.

## Create an Azure Spatial Anchors resource

This step requires that you have a role that gives you `Microsoft.Authorization/roleAssignments/write` permissions, such as **User Access Administrator** or **Owner**. For more information, see [Assign Azure roles using the Azure portal](/azure/role-based-access-control/role-assignments-portal?tabs=current).

In the Azure portal, create an Azure Spatial Anchor resource for Power BI. See [Create an Azure Spatial Anchors account](/azure/spatial-anchors/how-tos/create-asa-account?tabs=azure-portal) for detail.

When configuring the resource, note the following:

* The Power BI admin who is going to connect Power BI to the resource in the Power BI admin portal must be assigned the **Owner** role in the resource.

* The person who is going to assign users and groups the Spatial Anchors Account roles must have a role in the resource that gives them `Microsoft.Authorization/roleAssignments/write` permissions, such as **User Access Administrator** or **Owner**, so that they can make these assignments. For more information, see [Assign Azure roles using the Azure portal](/azure/role-based-access-control/role-assignments-portal?tabs=current).

## Connect Power BI to the Azure Spatial Anchors resource

This step requires that you have both of the following:

* A Power BI administrator role in Power BI.

* An Owner role in the Azure Spatial Anchors resource.

Go to **Admin portal > Azure Connections > Data in space (preview)** and add the connection details.

:::image type="content" source="./media/mobile-apps-data-in-space-set-up/power-bi-mobile-app-data-in-space-azure-connection.png" alt-text="Screenshot of the Power BI Data in space admin setting where you connect to the Azure Spatial Anchors resource.":::

>[!NOTE]
> You can connect Power BI to only one Azure Spatial Anchors service.

## Assign users to Spatial Anchors Account roles in the Azure Spatial Anchors resource

This step requires that you have a role in the resource that gives you `Microsoft.Authorization/roleAssignments/write` permissions, such as **User Access Administrator** or **Owner**. For more information, see [Assign Azure roles using the Azure portal](/azure/role-based-access-control/role-assignments-portal?tabs=current).

After the Azure Spatial Anchors resource has been created, you need to assign users to Spatial Anchors Account roles in the Azure Spatial Anchors resource, based on what role you want them to have in the mobile app. The Power BI mobile app will enable Data in Space functionality for a user based on the user's role in Spatial anchors account:

* Users who are assigned to the **Spatial Anchors Account Owner** role will be allowed to create, edit, scan and delete anchors in Power BI mobile app, and will be given the **Data in Space Writer** role in the mobile app.

* Users who are assigned to the **Spatial Anchors Account Reader** role will be allowed to scan/search for anchors created by others, and will be given the **Data in Space Reader** role in the mobile app.

>[!NOTE]
> Only role-assignable groups can be assigned to Spatial Anchors Account roles. For more information about role-assignable groups, see [Create a role-assignable group in Azure Active Directory](/azure/active-directory/roles/groups-create-eligible).

## Next steps

* [Data in space overview](mobile-apps-data-in-space-overview.md)
* [Pin Power BI reports to locations in the real world](mobile-apps-data-in-space-pin-reports.md)
* [Find and access Power BI reports pinned to locations in the real world](mobile-apps-data-in-space-find-pinned-reports.md)