---
title: Configure Power BI dataset scale-out
description: Learn how configure Power BI dataset scale-out by using the Power BI REST API
author: KesemSharabi
ms.author: kesharab
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-premium
ms.topic: conceptual
ms.date: 07/25/2023
LocalizationGroup: Premium
---

# Configure dataset scale-out

> [!IMPORTANT]
> Dataset scale-out is currently in **PREVIEW**. This information relates to a prerelease feature that may be substantially modified before being released for General Availability (GA). Microsoft makes no warranties, expressed or implied, with respect to the information provided here.

This article describes using the [Power BI Datasets REST APIs](/rest/api/power-bi/datasets/update-dataset-in-group) to configure dataset scale-out.

Before configuring dataset scale-out, be sure to read the [Power BI dataset scale-out](service-premium-scale-out.md) overview.

## Get datasetId

To get the datasetId, use [Get-PowerBIDataset](/powershell/module/microsoftpowerbimgmt.data/get-powerbidataset?view=powerbi-ps&preserve-view=true). You must specify a workspaceId and dataset name.

```powershell
Login-PowerBI | Out-Null

$workspaceId = '<enter workspaceId>'

$datasetId = Get-PowerBIDataset -WorkspaceId $workspaceId `
    | Where{$_.Name -match "<enter dataset name>"} `
    | Select-Object -ExpandProperty Id -First 1 `
    | ForEach-Object {$_.Guid}

Write-Host
Write-Host "Workspace Id: $workspaceId"
Write-Host "Dataset Id: $datasetId"
```

## Get current scale-out configuration

Before configuring dataset scale-out, determine the current configuration.

```powershell
###
# Get current scale-out configuration
###
Login-PowerBI | Out-Null

$workspaceId = '<enter workspaceId>'

$datasetId = Get-PowerBIDataset -WorkspaceId $workspaceId `
    | Where{$_.Name -match "<enter dataset name>"} `
    | Select-Object -ExpandProperty Id -First 1 `
    | ForEach-Object {$_.Guid}

$response = Invoke-PowerBIRestMethod -Url "groups/$workspaceId/datasets/$datasetId" -Method Get | ConvertFrom-Json

$response.queryScaleOutSettings | Format-List

if ($response.queryScaleOutSettings.maxReadOnlyReplicas -eq -1 `
    -or $response.queryScaleOutSettings.maxReadOnlyReplicas -gt 0)
{
    Write-Host "Dataset scale-out is enabled."
}
else
{
    Write-Host "Dataset scale-out is disabled."
}
```

## Enable dataset scale-out

To enable dataset scale-out, set `maxReadOnlyReplicas` to `-1`, or any non-0 value. A value of `-1` allows Power BI to create as many read-only replicas as your Power BI capacity supports. You can also explicitly set the replica count to a value lower than that of the capacity maximum. Setting `maxReadOnlyReplicas` to `-1` is recommended.

During **PREVIEW** dataset scale-out is limited to a single read-only replica.

```powershell
###
# Enable scale-out
###
Login-PowerBI | Out-Null

$workspaceId = '<enter workspaceId>'

$datasetId = Get-PowerBIDataset -WorkspaceId $workspaceId `
    | Where{$_.Name -match "<enter dataset name>"} `
    | Select-Object -ExpandProperty Id -First 1 `
    | ForEach-Object {$_.Guid}

Invoke-PowerBIRestMethod -Url "groups/$workspaceId/datasets/$datasetId" `
    -Method Patch -Body '{ "queryScaleOutSettings": { "maxReadOnlyReplicas": -1 }}'

Invoke-PowerBIRestMethod -Url "groups/$workspaceId/datasets/$datasetId" -Method Get `
    | ConvertFrom-Json | Select-Object -ExpandProperty queryScaleOutSettings `
    | ForEach { 
        if($_.maxReadOnlyReplicas -eq -1)
        { 
            Write-Host "Success! Dataset scale-out has been enabled."
        } else
        {
            Write-Host "Something went wrong! Dataset scale-out is still disabled." -ForegroundColor Red
        }
     }
```

## Disable dataset scale-out

To disable dataset scale-out, set `maxReadOnlyReplicas` to `0`.

```powershell
###
# Disable scale-out
###
Login-PowerBI | Out-Null

$workspaceId = '<enter workspaceId>'

$datasetId = Get-PowerBIDataset -WorkspaceId $workspaceId `
    | Where{$_.Name -match "<enter dataset name>"} `
    | Select-Object -ExpandProperty Id -First 1 `
    | ForEach-Object {$_.Guid}

Invoke-PowerBIRestMethod -Url "groups/$workspaceId/datasets/$datasetId" `
    -Method Patch -Body '{ "queryScaleOutSettings": { "maxReadOnlyReplicas": 0 }}'

Invoke-PowerBIRestMethod -Url "groups/$workspaceId/datasets/$datasetId" -Method Get `
    | ConvertFrom-Json | Select-Object -ExpandProperty queryScaleOutSettings `
    | ForEach { 
        if($_.maxReadOnlyReplicas -eq 0)
        { 
            Write-Host "Success! Dataset scale-out has been disabled."
        } else
        {
            Write-Host "Something went wrong! Dataset scale-out is still enabled." -ForegroundColor Red
        }
     }
```

## Next steps

> [!div class="nextstepaction"]
> [Power BI dataset scale-out](service-premium-scale-out.md)

> [!div class="nextstepaction"]
> [Tutorial: Test dataset scale-out](service-premium-scale-out-test.md)

> [!div class="nextstepaction"]
> [Synchronize scale-out replicas](service-premium-scale-out-sync-replica.md)

> [!div class="nextstepaction"]
> [Compare dataset scale-out replicas](service-premium-scale-out-app.md)
