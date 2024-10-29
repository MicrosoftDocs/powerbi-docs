---
title: Synchronize a Power BI semantic model scale-out replicas
description: Learn how to sync a Power BI semantic model replicas when using the Power BI semantic model scale-out feature
author: KesemSharabi
ms.author: kesharab
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-premium
ms.topic: conceptual
ms.date: 09/22/2024
LocalizationGroup: Premium
---

# Synchronize scale-out replicas

This article describes how to synchronize a semantic model scale-out replicas by using PowerShell at the command line or by script.

When you're working against the primary read-write semantic model, and semantic model users are using the read-only replicas, you can perform semantic model metadata updates and refreshes without affecting them. However, changes to the semantic model model and refreshes take place in the primary semantic model. To copy the changes to the read-only replicas, it must be synchronized with the read-write semantic model.

By default, the `autoSyncReadOnlyReplicas` parameter is set to `true` - Power BI synchronizes the replicas automatically. You can disable auto sync by setting `autoSyncReadOnlyReplicas` to `false`. However, you can choose to sync manually by using `syncStatus` and `sync` REST APIs.

To check the sync status of your replicas, use the `SyncStatus` REST API. This article describes the PowerShell commands for using this API.

## Check replica sync status

```powershell
###
# Check the scale-out replica sync status
###
Login-PowerBI | Out-Null

$workspaceId = '<enter workspaceId>'

$datasetId = Get-PowerBIDataset -WorkspaceId $workspaceId `
    | Where{$_.Name -match "<enter semantic model name>"} `
    | Select-Object -ExpandProperty Id -First 1 `
    | ForEach-Object {$_.Guid}

$response = Invoke-PowerBIRestMethod -Url "groups/$workspaceId/datasets/$datasetId/queryScaleOut/syncStatus" -Method Get | ConvertFrom-Json 
$response | Format-List

if ($response.commitVersion -eq $response.minActiveReadVersion)
{
    Write-Host "Semantic model read-write and read-only replicas are in sync."
}
else
{
    Write-Host "Semantic model read-write and read-only replicas are not in sync." -ForegroundColor Red
}

```

If the sync status API returns an empty response or if **scaleOutStatus** is set to **“Unavailable”**, try to load the semantic model's read-write replica or perform a refresh on the model to get the latest sync status.

To learn more, see [Datasets - Get Query Scale Out Sync Status In Group](/rest/api/power-bi/datasets/get-query-scale-out-sync-status-in-group) in the Power BI REST API reference.

## Disable automatic replica synchronization

```powershell
###
# Disable automatic scale-out replica sync
###
Login-PowerBI | Out-Null

$workspaceId = '<enter workspaceId>'

$datasetId = Get-PowerBIDataset -WorkspaceId $workspaceId `
    | Where{$_.Name -match "<enter semantic model name>"} `
    | Select-Object -ExpandProperty Id -First 1 `
    | ForEach-Object {$_.Guid}

Invoke-PowerBIRestMethod -Url "groups/$workspaceId/datasets/$datasetId" `
    -Method Patch -Body '{ "queryScaleOutSettings": { "autoSyncReadOnlyReplicas": false }}'

Invoke-PowerBIRestMethod -Url "groups/$workspaceId/datasets/$datasetId" -Method Get `
    | ConvertFrom-Json | Select-Object -ExpandProperty queryScaleOutSettings `
    | ForEach { 
        if($_.autoSyncReadOnlyReplicas -eq $false)
        { 
            Write-Host "Success! Automatic replica synchronization has been disabled."
        } else
        {
            Write-Host "Something went wrong! Automatic replica synchronization is still enabled." -ForegroundColor Red
        }
     }
```

## Perform a manual replica sync (script)

```powershell
###
# Perform a manual replica sync
###
Login-PowerBI | Out-Null

$workspaceId = '<enter workspaceId>'

$datasetId = Get-PowerBIDataset -WorkspaceId $workspaceId `
    | Where{$_.Name -match "<enter semantic model name>"} `
    | Select-Object -ExpandProperty Id -First 1 `
    | ForEach-Object {$_.Guid}

$response = Invoke-PowerBIRestMethod -Url "groups/$workspaceId/datasets/$datasetId/queryScaleOut/sync" -Method Post -Body "" | ConvertFrom-Json

Write-Host 'Synchronizing the scale-out replicas...' -NoNewLine

while ($response.commitVersion -ne $response.minActiveReadVersion)
{
    Write-Host '.' -NoNewLine
    Start-Sleep -Seconds 10

    $response = Invoke-PowerBIRestMethod -Url "groups/$workspaceId/datasets/$datasetId/queryScaleOut/syncStatus" -Method Get | ConvertFrom-Json 
}

Write-Host 'Completed'
$response

```

To learn more, see [Datasets - Trigger Query Scale Out Sync In Group](/rest/api/power-bi/datasets/trigger-query-scale-out-sync-in-group) in the Power BI REST API reference.

## Perform a manual replica sync (command line)

Follow these steps to sync the replicas by using Windows PowerShell:

1. Open PowerShell and log into Power BI by running this command:

    ```powershell
    Login-PowerBI
    ```

2. Get your workspace Ids by running the command below. Replace `<WorkspaceName>` with the name of your workspace.

    ```powershell
    Get-PowerBIWorkspace -Name "<WorkspaceName>"  # Replace <WorkspaceName> with the name of your workspace
    ```

3. Get the semantic model Id by running the command below. Replace `<WorkspaceId>` with the Id of your workspace.

    ```powershell
    Get-PowerBIDataset -WorkspaceId "<WorkspaceId>"  # Replace <WorkspaceId> with the Id of your workspace
    ```

4. Check the sync status of your semantic model by using the command below. Replace the values of `<WorkspaceId>` and `<DatasetId>` accordingly.

    ```powershell
    Invoke-PowerBIRestMethod -Url 'groups/<WorkspaceId>/datasets/<DatasetId>/queryScaleOut/syncStatus' -Method Get | ConvertFrom-Json | Format-List  # Replace <WorkspaceId> with the Id of your workspace and <DatasetId> with the Id of your semantic model
    ```

    In the output, the `minActiveReadVersion` and `minActiveReadTimestamp` values refer to the read-only replica. The `commitVersion` and `commitTimestamp` values, refer to the read-write semantic model. A difference between them, indicates  the read-only replica represents an older version of the semantic model.

5. Sync the read-write semantic model and read-only replicas by using the following command. Replace the values of `<WorkspaceId>` and `<DatasetId>` accordingly.

    ```powershell
    Invoke-PowerBIRestMethod -Url 'groups/<WorkspaceId>/datasets/<DatasetId>/queryScaleOut/sync' -Method Post -Body "" | ConvertFrom-Json | Format-List  # Replace <WorkspaceId> with the Id of your workspace and <DatasetId> with the Id of your semantic model
    ```

    The sync status information in the output indicates the read-write semantic model and the read-only replicas are out of sync, which is expected because you just triggered the sync.  

6. To verify the sync is complete, run the `syncStatus` command in *step 4* again. You might need to run the command a few times depending on the length of the time that's required to sync the semantic model copies. When the sync is complete, check the values of `syncStartTime` and `syncEndTime ` to see how long the sync took.  

To learn more, see [Datasets - Trigger Query Scale Out Sync In Group](/rest/api/power-bi/datasets/trigger-query-scale-out-sync-in-group) in the Power BI REST API reference.

## Related content

* [Power BI semantic model scale-out](service-premium-scale-out.md)

* [Configure semantic model scale-out](service-premium-scale-out-configure.md)

* [Tutorial: Test semantic model scale-out](service-premium-scale-out-test.md)

* [Compare semantic model scale-out replicas](service-premium-scale-out-app.md)
