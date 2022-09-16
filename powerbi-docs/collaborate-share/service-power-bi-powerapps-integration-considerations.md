---
title: Considerations working with the Power BI/Power Apps solutions integration
description: Learn about considerations to take into account when working with the Power BI/Power Apps solutions integration.
author: paulinbar
ms.author: painbar
ms.reviewer: ''
featuredvideoid: ''
ms.service: powerbi
ms.subservice: pbi-collaborate-share
ms.topic: how-to
LocalizationGroup: Share your work
ms.date: 09/16/2022
---

# Considerations working with the Power BI/Power Apps solutions integration (preview)

The integration between Power Apps solutions and Power BI involves behavior in some scenarios that may impact your work. This article describes some of these behaviors.

## Sensitivity labels 

Sensitivity labels are fully supported in Power BI, but are not yet fully integrated across the services. Therefore, Power BI will not assign labels to artifacts exported to Dataverse or to content stored in Dataverse. However, any labels applied to artifacts in Power BI are preserved during all Power Apps operations.

Since actions such as exporting a solution or adding a solution involve removing the sensitivity label (if any), these actions will only succeed if the interactive user or the API caller has sufficient usage rights to remove the label as defined by the IT administrators.

## Cross-geo operations 

The Power Platform/Power BI integration entails operations between the Power Apps environment and the Power BI workspaces participating in the operations. For a solution operation to succeed, **all the elements participating in the operation must be in the same geography**.

If one of the participating workspaces or environments is not in the same geography, the operation will fail with an error. For example, adding a Power BI report "From Power BI" to Dataverse requires that the source Power BI workspace, the Power Apps environment, and the destination Power BI workspace all reside in the same geography. Otherwise the operation will not succeed.

Be sure to create your Power Apps environment in the same geography as all the relevant Power BI workspaces. This will make it possible to import Power Apps solutions without crossing geos. See [Create and manage environments in the Power Platform admin center](/power-platform/admin/create-environment) for more information.

### How do I find which geography my Power BI elements are in?

First find which region your Power BI elements are located in. A Power BI workspace is located in the region of the capacity it is assigned to. If the workspace hasn't been assigned to a capacity, its region is the default region of the Power BI tenant. To find the default region of your Power BI tenant, see [Find the default region for your organization](../admin/service-admin-where-is-my-tenant-located.md).

Once you know the region your Power BI element is located in, see the table at [Geographic availability for Power Platform](https://dynamics.microsoft.com/availability-reports/georeport/) to see which geography the region is associated with.

### How do I know what geography my Power Apps environment is in? 

For Power Apps, the geography of an environment is the geography with the region the environment is located in. See [Geographic availability for Power Platform](https://dynamics.microsoft.com/availability-reports/georeport/) for detail. 

## Authentication

When Power Platform makers perform any operation related to Power BI, their identities are authorized by policy settings on both the Power Platform and Power BI sides. However, only Azure Active Directory Conditional Access policies related to Power Platform are enforced. This is because maker operations, such as import, export, or adding Power BI components to Power Platform solutions, are  implemented through so-called service-to-service communication between Power Platform and Power BI. For solution consumers, conditional access policies are validated for both Power Platform and Power BI as usual.

## Private links

When a tenant enables [Private Links](../enterprise/service-security-private-links.md) with Public Access disabled, any operation originating from Power Platform (for example, maker operations, export, import) will be blocked. Consumption operations will adhere to Private link policies as regular operations.

## Sovereign clouds 

Sovereign clouds are not supported.

## Power BI workspace permissions 

When a solution that includes Power BI components is first created or imported in a Power Apps environment, a Power BI workspace dedicated to that environment is created. If you are the one who created or imported the solution, you become an Admin in that dedicated Power BI workspace. You can remove that role for yourself or others in Power BI and only work through the predefined security roles in the Power Apps environment (provided that [permissions sync](/power-apps/maker/model-driven-apps/customize-manage-powerbi-components#permission-sync-between-power-apps-environment-and-power-bi-workspace) is on), but note the following caveats:

* In case of sync problems you will lose access. Not having permissions on the workspace will cause solution import/export/add operations to fail.
* If you delete the Power Apps environment, you will lose access to the Power BI workspace and the workspace will become orphaned.

## Environment life cycle operations 

Environment life cycle operations are not supported:

* Environment life-cycle operations, such as copying or deleting the Power Apps environment, are likely to corrupt the connection to the Power BI workspace and are not supported. If you perform an environment life-cycle operation, you will probably have to redo any work that involves Power BI components.

* Before deleting the Power Apps environment, make sure to do one of the following to prevent creating an orphaned Power BI workspace:

    * In Power BI, assign yourself workspace permissions on the dedicated environment workspace.

    * Delete the dedicated environment workspace in Power BI before deleting the Power Apps environment.

## Next Steps

* [About Power BI in Power Apps Solutions](./service-power-bi-powerapps-integration-about.md)
* [Enable the Power BI/Power Apps Solutions integration](./service-power-bi-powerapps-integration-about.md)
* [Using the Power BI/Power Apps solutions integration](./service-power-bi-powerapps-integration-about.md)
* [Power BI content management in Power Apps solutions](/power-apps/maker/model-driven-apps/power-bi-content-management-power-apps-solutions)
* More questions? [Try asking the Power BI Community](https://community.powerbi.com/)