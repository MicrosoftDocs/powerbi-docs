---
title: Use semantic model version history (preview)
description: Learn how to access and recover items from semantic models using semantic model version history.
author: davidiseminger
ms.author: davidi
ms.reviewer: ''
ms.service: powerbi
ms.subservice: pbi-transform-model
ms.topic: how-to
ms.date: 01/12/2025
ms.custom: 
LocalizationGroup: Transform and shape data
#customer intent: As a Power BI user I want to learn how to use semantic model version history in Power BI.
---

# Use semantic model version history (preview)

Power BI automatically configures semantic model version history for Premium semantic models [edited on the web](service-edit-data-models.md). With version history, self-service users can recover from the most critical mistakes when editing their semantic models on the web. For full source control and support of more versions, use [git integration](/fabric/cicd/git-integration/git-get-started), which can be used in combination with version history for the same semantic model.

## Open the version history pane

You can view previous versions of a semantic model using an Office-like version history pane. Opening the version history pane can be done from multiple locations and various ways, each of which has the same result:

* From the workspace content list, select **More options (...)** for the semantic model and then select **Version history**.

  :::image type="content" source="media/service-semantic-model-version-history/service-semantic-model-version-history-01.png" alt-text="Screenshot showing how to select version history from a semantic model menu.":::

* From the OneLake catalog content list, select **More options (...)** for the semantic model and then select **Version history**.

  :::image type="content" source="media/service-semantic-model-version-history/service-semantic-model-version-history-02.png" alt-text="Screenshot showing how to select version history from the OneLake catalog content list.":::  

* From the semantic model details page, select **File** and then select **Version history**.

  :::image type="content" source="media/service-semantic-model-version-history/service-semantic-model-version-history-03.png" alt-text="Screenshot showing how to select version history from the File menu.":::  

* When editing a semantic model on the web, select **File** and then select **Version history**.

  :::image type="content" source="media/service-semantic-model-version-history/service-semantic-model-version-history-04.png" alt-text="Screenshot showing how to select version history when editing a semantic model on the web.":::  

* When editing a semantic model on the web, select the title bar for the semantic model and then select **Version history**. 

  :::image type="content" source="media/service-semantic-model-version-history/service-semantic-model-version-history-05.png" alt-text="Screenshot showing how to select version history when editing a semantic model on the web from the title bar.":::  



## View the version history pane

Within the version history pane, you can see **up to five versions per semantic model**. Each of the versions within the version history pane stores the **metadata and data** of the semantic model. Each version listed in the pane displays the following information about the version:

* The timestamp of the last modification made to the semantic model that was captured within the version.
* The name of the person who made the last change to the semantic model that was captured within the version.
* A description for the version, if provided previously by a user when manually saving the version.

:::image type="content" source="media/service-semantic-model-version-history/service-semantic-model-version-history-06.png" alt-text="Screenshot showing the version history pane." lightbox="media/service-semantic-model-version-history/service-semantic-model-version-history-06.png":::  



## Save a version to version history

Versions of a semantic model begin being captured after it's opened in Editing mode on the web, or when opening a [Direct Lake model for live editing in Power BI Desktop](/fabric/get-started/direct-lake-power-bi-desktop#live-edit-a-semantic-model-in-direct-lake-mode).

Each semantic model that supports version history can have up to five versions saved. A version is saved to version history whenever one of the following actions occurs:

* When you manually save a version to version history. From editing a semantic model on the web, select **File** and then select **Save to version history**.
  :::image type="content" source="media/service-semantic-model-version-history/service-semantic-model-version-history-07.png" alt-text="Screenshot showing how to manually save version history from the File menu.":::  

  When manually saving a version, you can optionally provide a text description to help identify this version later in the version history pane.
  :::image type="content" source="media/service-semantic-model-version-history/service-semantic-model-version-history-08.png" alt-text="Screenshot showing how to manually add a description to a version.":::  

  The description appears with its corresponding version within the version history pane.
  :::image type="content" source="media/service-semantic-model-version-history/service-semantic-model-version-history-09.png" alt-text="Screenshot showing the description provided with a version.":::  

* When you publish a .pbix file from Power BI Desktop, or upload a .pbix file on the web, a version of the semantic model before the publish/upload is captured. Automatically capturing the version ensures that if you unintentionally overwrote the changes you made in the web upon publish/upload, you can restore the model to its state, or version, before that unintentional publish/upload occurred.

* When you open your semantic model on the web in **Editing mode** a version of the semantic model is captured, ensuring that if you make undesired changes within your web editing session, you can restore the model to its state, or version, before those changes were made.

* When you restore your semantic model to a previous version from version history, a version of the model before the restore is saved, enabling you to restore to the state prior to the restore if an undesired version was selected.


## Restore to a previous version

To restore a semantic model to a previous version, in the version history pane, select **Restore** within the context menu of the version you want to restore.

:::image type="content" source="media/service-semantic-model-version-history/service-semantic-model-version-history-10.png" alt-text="Screenshot showing how to restore a previous version of a semantic model from the version history pane.":::  

The version history pane also shows an entry for the current version of the model. You can't restore to your current version, so the context menu for your current version provides the option to open the semantic model on the web.

:::image type="content" source="media/service-semantic-model-version-history/service-semantic-model-version-history-11.png" alt-text="Screenshot showing the context menu of a current semantic model version from the version history pane.":::  



## Capacity utilization and reporting

You can monitor the effect restoring to a previous version with version history has on your Power BI Premium capacities using the [Premium metrics app](/fabric/enterprise/metrics-app). Capacity effect can be monitored using the following [operation](/fabric/enterprise/fabric-operations#background-operations).

|Operation  |Description  |Workload |Type  |
|---------|---------|---------|---------|
|Web Modeling write     |A data model write operation in the semantic model web modeling user experience         |Semantic models|Interactive         |



## Requirements and permissions

* Users must have *Write* and *Build* permission on the semantic model to view and use version history. Learn more in the [permissions article](../connect-data/service-datasets-permissions.md).
* The version history feature is unavailable for users with a free license.


## Considerations and limitations

Semantic model version history is currently in preview. Keep the following in mind:

* Up to five versions are saved per model. Saving versions once reaching the five-version limit will overwrite the oldest version in version history.
* The semantic model must be in a [Premium workspace](../enterprise/service-premium-what-is.md#workspaces). 
* Version history isn't supported for semantic models stored in *My Workspace*.
* The semantic model must first be opened on the web or opened for Direct Lake live editing in Power BI Desktop before versions begin being captured for the model. 
* You can't make changes to your semantic model when the model is being restored to a previous version. 
* You can't delete a version within a semantic model’s version history.
* Semantic model version history is subjected to the same limitations as [editing data models in the Power BI service](service-edit-data-models.md). 
* Version history won't be captured for semantic models that haven't yet upgraded to [enhanced metadata format](../connect-data/desktop-enhanced-dataset-metadata.md). Additionally, if a model with the old metadata format is published over a model in the enhanced metadata format, all previously captured semantic model versions for that model will be deleted.
* Moving a model between capacities will delete its version history.
* The data in your semantic model may become outdated after restoring to a previous version. To ensure you have the most recent data, complete a refresh after performing a restore. Refresh behavior may vary across storage modes. For example, Direct Lake models with [automatic updates](/fabric/get-started/direct-lake-overview#automatic-updates) configured will automatically update with the most recent data after a restore, without requiring you to manually initiate a refresh.
* The semantic model must have [large semantic model storage format enabled](../enterprise/service-premium-large-models.md). Semantic models are automatically converted to large semantic model storage format the first time they're opened in Editing mode in the web or when opening a [Direct Lake model for live editing in Desktop](/fabric/get-started/direct-lake-power-bi-desktop#live-edit-a-semantic-model-in-direct-lake-mode). If a semantic model with versions captured in version history has the large semantic model storage format disabled in the model settings, all version history for this model will be deleted. A warning in the semantic model settings will notify you of this impact before you make the change:
  :::image type="content" source="media/service-semantic-model-version-history/service-semantic-model-version-history-12.png" alt-text="Screenshot showing a warning about deleting version history.":::  


## Related content

This article provided information about the preview for semantic model versions. For more information on data modeling in Power BI, see the following resources:

* [Edit data models in the Power BI service (preview)](service-edit-data-models.md#capacity-utilization-and-reporting)
* [Direct Lake in Power BI Desktop (preview)](/fabric/get-started/direct-lake-power-bi-desktop)
* [Get started with Git integration in Microsoft Fabric](/fabric/cicd/git-integration/intro-to-git-integration)
* [Power BI Desktop projects Git integration](../developer/projects/projects-git.md)

