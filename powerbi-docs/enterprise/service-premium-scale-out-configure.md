---
title: Configure Power BI semantic model scale-out
description: Learn how configure Power BI semantic model scale-out by using the Power BI REST API
author: KesemSharabi
ms.author: kesharab
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-premium
ms.topic: conceptual
ms.date: 11/21/2023
LocalizationGroup: Premium
---

# Configure semantic model scale-out

You can enable scale-out in Power BI service, or using the Power BI Datasets REST APIs. Before configuring semantic model, read the [Power BI semantic model scale-out](service-premium-scale-out.md) overview.

## Enable scale-out in Power BI service

To enable scale-out for your semantic model in Power BI service, follow these steps:

1. In Power BI service, open the workspace with the semantic model you want to enable scale-out for.

2. Select the semantic model's *more options* (**...**).

3. From the menu, select **Settings**.

4. In the setting's page, enable the [Large semantic model storage format](service-premium-large-models.md) if it's not enabled.

5. Enable *Query scale-out* and select *Apply*.

    :::image type="content" source="media/service-premium-scale-out-configure/scale-out.png" alt-text="A screenshot showing how to enable scale out in Power BI service.":::

## Enable scale-out using the Datasets REST APIs

This section describes using the [Power BI Datasets REST APIs](/rest/api/power-bi/datasets/update-dataset-in-group) to configure semantic model scale-out.

### Get datasetId

To get the datasetId, use [Get-PowerBIDataset](/powershell/module/microsoftpowerbimgmt.data/get-powerbidataset?view=powerbi-ps&preserve-view=true). You must specify a workspaceId and semantic model name.

```powershell
Login-PowerBI | Out-Null

$workspaceId = '<enter workspaceId>'

$datasetId = Get-PowerBIDataset -WorkspaceId $workspaceId `
    | Where{$_.Name -match "<enter semantic model name>"} `
    | Select-Object -ExpandProperty Id -First 1 `
    | ForEach-Object {$_.Guid}

Write-Host
Write-Host "Workspace Id: $workspaceId"
Write-Host "Dataset Id: $datasetId"
```

### Get current scale-out configuration

Before configuring semantic model scale-out, determine the current configuration.

```powershell
###
# Get current scale-out configuration
###
Login-PowerBI | Out-Null

$workspaceId = '<enter workspaceId>'

$datasetId = Get-PowerBIDataset -WorkspaceId $workspaceId `
    | Where{$_.Name -match "<enter semantic model name>"} `
    | Select-Object -ExpandProperty Id -First 1 `
    | ForEach-Object {$_.Guid}

$response = Invoke-PowerBIRestMethod -Url "groups/$workspaceId/datasets/$datasetId" -Method Get | ConvertFrom-Json

$response.queryScaleOutSettings | Format-List

if ($response.queryScaleOutSettings.maxReadOnlyReplicas -eq -1 `
    -or $response.queryScaleOutSettings.maxReadOnlyReplicas -gt 0)
{
    Write-Host "Semantic model scale-out is enabled."
}
else
{
    Write-Host "Semantic model scale-out is disabled."
}
```

### Enable semantic model scale-out

To enable semantic model scale-out, set `maxReadOnlyReplicas` to `-1`, or any non-0 value. A value of `-1` allows Power BI to create as many read-only replicas as your Power BI capacity supports. You can also explicitly set the replica count to a value lower than that of the capacity maximum. Setting `maxReadOnlyReplicas` to `-1` is recommended.

```powershell
###
# Enable scale-out
###
Login-PowerBI | Out-Null

$workspaceId = '<enter workspaceId>'

$datasetId = Get-PowerBIDataset -WorkspaceId $workspaceId `
    | Where{$_.Name -match "<enter semantic model name>"} `
    | Select-Object -ExpandProperty Id -First 1 `
    | ForEach-Object {$_.Guid}

Invoke-PowerBIRestMethod -Url "groups/$workspaceId/datasets/$datasetId" `
    -Method Patch -Body '{ "queryScaleOutSettings": { "maxReadOnlyReplicas": -1 }}'

Invoke-PowerBIRestMethod -Url "groups/$workspaceId/datasets/$datasetId" -Method Get `
    | ConvertFrom-Json | Select-Object -ExpandProperty queryScaleOutSettings `
    | ForEach { 
        if($_.maxReadOnlyReplicas -eq -1)
        { 
            Write-Host "Success! Semantic model scale-out has been enabled."
        } else
        {
            Write-Host "Something went wrong! Semantic model scale-out is still disabled." -ForegroundColor Red
        }
     }
```

### Disable semantic model scale-out

To disable semantic model scale-out, set `maxReadOnlyReplicas` to `0`.

```powershell
###
# Disable scale-out
###
Login-PowerBI | Out-Null

$workspaceId = '<enter workspaceId>'

$datasetId = Get-PowerBIDataset -WorkspaceId $workspaceId `
    | Where{$_.Name -match "<enter semantic model name>"} `
    | Select-Object -ExpandProperty Id -First 1 `
    | ForEach-Object {$_.Guid}

Invoke-PowerBIRestMethod -Url "groups/$workspaceId/datasets/$datasetId" `
    -Method Patch -Body '{ "queryScaleOutSettings": { "maxReadOnlyReplicas": 0 }}'

Invoke-PowerBIRestMethod -Url "groups/$workspaceId/datasets/$datasetId" -Method Get `
    | ConvertFrom-Json | Select-Object -ExpandProperty queryScaleOutSettings `
    | ForEach { 
        if($_.maxReadOnlyReplicas -eq 0)
        { 
            Write-Host "Success! Semantic model scale-out has been disabled."
        } else
        {
            Write-Host "Something went wrong! Semantic model scale-out is still enabled." -ForegroundColor Red
        }
     }
```

## Related content

* [Power BI semantic model scale-out](service-premium-scale-out.md)

* [Tutorial: Test semantic model scale-out](service-premium-scale-out-test.md)

* [Synchronize scale-out replicas](service-premium-scale-out-sync-replica.md)

* [Compare semantic model scale-out replicas](service-premium-scale-out-app.md)
