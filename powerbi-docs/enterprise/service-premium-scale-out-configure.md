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

# Configure Power BI dataset scale-out (preview)

> [!IMPORTANT]
> Power BI dataset scale-out is currently in **PREVIEW**. This information relates to a prerelease feature that may be substantially modified before being released for General Availability (GA). Microsoft makes no warranties, expressed or implied, with respect to the information provided here.

This article describes using the Power BI REST API to configure scale-out for datasets.

Before configuring scale-out for datasets, be sure to read the [Power BI dataset scale-out](service-premium-scale-out.md) overview.

## Prerequisites

By default, Power BI dataset scale-out is enabled provided the following prerequisites are met:

* The **Scale-out queries for large datasets** setting in your tenant settings is enabled. By default, this setting is enabled.

* Your workspace resides on a Power BI Premium [capacity](service-premium-what-is.md#capacities-and-skus):
    * P SKUs
    * A SKUs for Power BI Embedded (also known as [embed for your customers](../developer/embedded/embedded-analytics-power-bi.md#embed-for-your-customers)).

* Your workspace is configured to use the [Large datasets](service-premium-large-models.md) storage format.

* To manage datasets by using the REST API, [Power BI Management cmdlets](/powershell/power-bi/overview?view=powerbi-ps). Install by opening PowerShell in Administrator mode, and running the command:

    ```powershell
    Install-Module -Name MicrosoftPowerBIMgmt
    ```

## Get dataset Id

To get the dataset Id, use Get-PowerBIDataset. You must specify a workspace Id and dataset Name.

```powershell
Login-PowerBI | Out-Null

$workspaceId = '<insert workspace Id>'

$datasetId = Get-PowerBIDataset -WorkspaceId $workspaceId `
    | Where{$_.Name -match "<insert dataset Name>"} `
    | Select-Object -ExpandProperty Id -First 1 `
    | ForEach-Object {$_.Guid}

Invoke-PowerBIRestMethod -Url "groups/$workspaceId/datasets/$datasetId" `
    -Method Patch -Body '{ "queryScaleOutSettings": { "maxReadOnlyReplicas": 0 }}'

$response = Invoke-PowerBIRestMethod -Url "groups/$workspaceId/datasets/$datasetId" -Method Get | ConvertFrom-Json

$response.queryScaleOutSettings | Format-List 

Invoke-PowerBIRestMethod -Url "groups/$workspaceId/datasets/$datasetId/queryScaleOut/syncStatus" -Method Get | ConvertFrom-Json | Format-List  
```

## Assign workspace Id and dataset Id

To configure dataset scale-out, you must assign both `workspaceId` and `datasetId` values.

```powershell
###
# Assign workspace id and dataset id values
###
$workspaceId = '<Insert workspace Id>'
$datasetId = Get-PowerBIDataset -WorkspaceId $workspaceId `
    | Where{$_.Name -match "AdventureWorks"} `
    | Select-Object -ExpandProperty Id -First 1 `
    | ForEach-Object {$_.Guid}

Write-Host
Write-Host "Workspace id: $workspaceId"
Write-Host "Dataset id: $datasetId"
```

## Get current scale-out configuration

Before configuring dataset scale-out, determine the current configuration.

```powershell
###
# Get current scale-out configuration
###
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

To enable dataset scale-out, set `maxReadOnlyReplicas` to `-1`, or any non-0 value. A value of `-1` allows Power BI to create as many read-only replicas as your Power BI capacity supports. You can also explicitly set the replica count to a value lower than that of the capacity maximum. However, during **PREVIEW** dataset scale-out is limited to a single read-only replica. Setting `maxReadOnlyReplicas` to `-1` is recommended.

```powershell
###
# Enable scale-out
###
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
> [Tutorial: Test Power BI dataset scale-out](service-premium-scale-out-test.md)

> [!div class="nextstepaction"]
> [Sync a read-only scale-out replica](service-premium-scale-out-sync-replica.md)

> [!div class="nextstepaction"]
> [Compare scale-out dataset copies](service-premium-scale-out-app.md)
