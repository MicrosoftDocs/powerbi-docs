---
title: Compare Power BI semantic model scale-out replicas
description: Learn how to compare Power BI semantic model replicas when using the Power BI semantic model scale-out feature
author: KesemSharabi
ms.author: kesharab
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-premium
ms.topic: how-to
ms.date: 11/21/2023
LocalizationGroup: Premium
---

# Compare semantic model scale-out replicas

This article provides a few Visual Studio app examples for comparing semantic model properties when Power BI semantic model scale-out is enabled.

The `syncStatus` REST API shows if the read-write semantic model and read-only replicas are in sync. You can also use the Tabular Object Model (TOM) to build a custom application that connects to both semantic models and compares timestamps, metadata, and query results between them.

## App 1 - Check the database object properties

Use the code below to build an app that checks the [LastUpdate](/analysis-services/assl/properties/lastupdate-element-assl), [LastProcessed](/analysis-services/assl/properties/lastprocessed-element-assl) and [LastSchemaUpdate](/analysis-services/assl/properties/lastschemaupdate-element-assl) properties of your semantic models. Before the app performs the checks, it needs to call the `Refresh()` method, to get the replica's metadata.

Replace `<WorkspaceUrl>` with your workspace's URL, and `<Semantic modelName>` with your semantic model's name.

```typescript
string workspaceUrl = "<WorkspaceUrl>";  // Replace <WorkspaceUrl> with the URL of your workspace
string datasetName = "<Semantic modelName>";  // Replace <Semantic modelName> with the name of your semantic model 
using (var workspace_readwrite = new Microsoft.AnalysisServices.Tabular.Server()) 
using (var workspace_readonly = new Microsoft.AnalysisServices.Tabular.Server()) 
{
    workspace_readwrite.Connect(workspaceUrl + "?readwrite"); 
    workspace_readonly.Connect(workspaceUrl + "?readonly"); 
    var datasetRW = workspace_readwrite.Databases.FindByName(semantic modelName); 
    var datasetRO = workspace_readonly.Databases.FindByName(semantic modelName); 

    if (datasetRW == null || datasetRO == null) 
    { 
        throw new ApplicationException("Database cannot be found!"); 
    }
    datasetRW.Refresh(); 
    datasetRO.Refresh(); 
    Console.WriteLine($"LastUpdated: {datasetRW.LastUpdate} (readwrite) {datasetRO.LastUpdate} (readonly)"); 
    Console.WriteLine($"LastProcessed: {datasetRW.LastProcessed} (readwrite) {datasetRO.LastProcessed} (readonly)"); 
    Console.WriteLine($"LastSchemaUpdate: {datasetRW.LastSchemaUpdate} (readwrite) {datasetRO.LastSchemaUpdate} (readonly)\n"); 
} 
Console.WriteLine("Test completed. Press any key to exit."); 
Console.Read(); 
```

## App 2 - Compare the semantic model's metadata

Use the code below to compare the metadata of the primary read-write semantic model with the metadata of a read-only replica. Replace `<WorkspaceUrl>` with your workspace's URL, and `<DatasetName>` with your semantic model's name.

```typescript
string workspaceUrl = "<WorkspaceUrl>";  // Replace <WorkspaceUrl> with the URL of your workspace 
string datasetName = "<DatasetName>";  // Replace <DatasetName> with the name of your semantic model 
using (var workspace_readwrite = new Microsoft.AnalysisServices.Tabular.Server()) 
using (var workspace_readonly = new Microsoft.AnalysisServices.Tabular.Server()) 
{ 
    workspace_readwrite.Connect(workspaceUrl + "?readwrite"); 
    workspace_readonly.Connect(workspaceUrl + "?readonly"); 
    var datasetRW = workspace_readwrite.Databases.FindByName(datasetName); 
    var datasetRO = workspace_readonly.Databases.FindByName(datasetName); 

    if (datasetRW == null || datasetRO == null) 
    { 
        throw new ApplicationException("Database cannot be found!"); 
    } 

    string tmslRW = Microsoft.AnalysisServices.Tabular.JsonSerializer.SerializeDatabase(datasetRW); 
    string tmslRO = Microsoft.AnalysisServices.Tabular.JsonSerializer.SerializeDatabase(datasetRO); 

    if (tmslRW != tmslRO) 
    { 
        Console.WriteLine("The replicas are out of sync.\n"); 
    } 
    else 
    { 
        Console.WriteLine("The replicas are in sync.\n"); 
    } 
} 
Console.WriteLine("Test completed. Press any key to exit."); 
Console.Read(); 
```

## App 3 - Query the semantic model data

Use `ADOMD.NET` to query the data in the replicas. Replace `<WorkspaceUrl>` with your workspace's URL, and `<DatasetName>` with your semantic model's name.

```typescript
string workspaceUrl = "<WorkspaceUrl>";  // Replace WorkspaceUrl with the URL of your workspace 
string datasetName = "<DatasetName>";  // Replace DatasetName with the name of your semantic model 
string daxQuery = "Evaluate SUMMARIZECOLUMNS(RefreshTimeTable[Time])"; 
using (var connectionRW = new Microsoft.AnalysisServices.AdomdClient.AdomdConnection()) 
using (var connectionRO = new Microsoft.AnalysisServices.AdomdClient.AdomdConnection()) 
{ 
    connectionRW.ConnectionString = $"Data Source={workspaceUrl}?readwrite;Catalog={datasetName}"; 
    connectionRO.ConnectionString = $"Data Source={workspaceUrl}?readonly;Catalog={datasetName}"; 
    connectionRW.Open(); 
    connectionRO.Open(); 
    var cmd = new Microsoft.AnalysisServices.AdomdClient.AdomdCommand(daxQuery); 
    string resultRW = string.Empty; 
    string resultRO = string.Empty; 
    cmd.Connection = connectionRW; 
    using (var reader = cmd.ExecuteReader()) 
    { 
        while (reader.Read()) 
        { 
            resultRW = reader.GetString(0); 
        } 
    } 

    cmd.Connection = connectionRO; 
    using (var reader = cmd.ExecuteReader()) 
    { 
        while (reader.Read()) 
        { 
            resultRO = reader.GetString(0); 
        } 
    } 

    if (resultRW != resultRO) 
    { 
        Console.WriteLine("The replicas are out of sync.\n"); 
    } 
    else 
    { 
        Console.WriteLine("The replicas are in sync.\n"); 
    } 
} 
Console.WriteLine("Test completed. Press any key to exit."); 
Console.Read(); 
```

## Related content

* [Power BI semantic model scale-out](service-premium-scale-out.md)

* [Configure semantic model scale-out](service-premium-scale-out-configure.md)

* [Tutorial: Test semantic model scale-out](service-premium-scale-out-test.md)

* [Synchronize scale-out replicas](service-premium-scale-out-sync-replica.md)
