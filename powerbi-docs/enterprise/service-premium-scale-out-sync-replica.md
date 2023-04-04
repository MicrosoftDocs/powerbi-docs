---
title: Sync a read-only dataset scale-out replica
description: Learn how to sync a Power BI read only dataset when using the Power BI Dataset Scale-Out feature
author: KesemSharabi
ms.author: kesharab
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-premium
ms.topic: conceptual
ms.date: 04/04/2023
LocalizationGroup: Premium
---

# Sync a read-only dataset scale-out replica

This article explains how to sync a *read-only* dataset replica after enabling [Power BI Dataset Scale-Out](service-premium-auto-scale.md).

When you're working against the *read/write* dataset, and your customers are using the *read-only* replica, you can perform dataset metadata updates and refreshes without affecting them. However, changes to the dataset model and refreshes take place in the original dataset. To copy these changes to the *read-only* dataset, you'll need to sync it with the *read/write* dataset. To check the sync status of your dataset copies, use the `SyncStatus` REST API. This article describes the PowerShell commands for using this API.

## Sync dataset replicas using PowerShell

Follow these steps to sync the replicas in Windows PowerShell:

1. Open PowerShell and log into Power BI by running this command:

    ```powershell
    Login-PowerBI
    ```

2. Get your workspace IDs by running the command below. Replace `<WorkspaceName>` with the name of your workspace.

    ```powershell
    Get-PowerBIWorkspace -Name "<WorkspaceName>"  # Replace <WorkspaceName> with the name of your workspace
    ```

3. Get the dataset ID by running the command below. Replace `<WorkspaceId>` with the ID of your workspace.

    ```powershell
    Get-PowerBIDataset -WorkspaceId "<WorkspaceId>"  # Replace <WorkspaceId> with the ID of your workspace
    ```

4. Check the sync status of your dataset using the command below. Replace the values of `<WorkspaceId>` and `<DatasetId>` appropriately.

    ```powershell
    Invoke-PowerBIRestMethod -Url 'groups/<WorkspaceId>/datasets/<DatasetId>/syncStatus' -Method Get | ConvertFrom-Json | Format-List  # Replace <WorkspaceId> with the ID of your workspace and <DatasetId> with the ID of your dataset
    ```

    In the output, the `minActiveReadVersion` and `minActiveReadTimestamp` values refer to the *read-only* dataset copy. The `commitVersion` and `commitTimestamp` values, refer to the *read/write* dataset copy. A difference between them, indicates that the *read-only* replica represents an older version of the dataset.

5. Sync the *read/write* and *read-only* dataset copies using the command below. Replace the values of `<WorkspaceId>` and `<DatasetId>` appropriately.

    ```powershell
    Invoke-PowerBIRestMethod -Url 'groups/<WorkspaceId>/datasets/<DatasetId>/sync' -Method Post -Body "" | ConvertFrom-Json | Format-List  # Replace <WorkspaceId> with the ID of your workspace and <DatasetId> with the ID of your dataset
    ```

    The sync status information in the output indicates that the *read/write* and *read-only* replicas are out of sync, which is expected because you just triggered the sync.  

6. To verify that the sync is complete, run the `syncStatus` command in *step 4* again. You might need to run the command a few times, depending on the length of the time that's required to sync the dataset copies. When the sync is complete, check the values of `syncStartTime` and `syncEndTime ` to see how long the sync took.  

## Next steps

> [!div class="nextstepaction"]
> [Power BI Dataset Scale-Out](service-premium-scale-out.md)

> [!div class="nextstepaction"]
> [Tutorial: Test Power BI Dataset Scale-Out](service-premium-scale-out-test.md)

> [!div class="nextstepaction"]
> [Compare scale-out dataset copies](service-premium-scale-out-app.md)
