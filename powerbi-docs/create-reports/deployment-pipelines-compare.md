---
title: Compare content in different stages before deployment
description: Learn how to compare the content of the source stage and target stage before deployment with the Power BI Application lifecycle management (ALM) tool
author: mberdugo
ms.author: monaberdugo
ms.topic: how-to
ms.service: powerbi
ms.subservice: pbi-deployment-pipeline
ms.date: 01/31/2023
---

# Compare content in different deployment stages

Before you deploy content to a different stage, it can be helpful to see the differences between the two stages. The deployment pipeline home page compares the three deployment stages and indicates if there are any differences. Use the **Compare** and **Change review** buttons to display the content of each pipeline and see exactly which items are different and where those differences are.

## Compare stages

:::image type="content" source="./media/deployment-pipelines-compare/deployment-pipelines-compare.png" alt-text="Screenshot showing three stages of deployment. There's a green check between the test and production stages and an orange X between the development and test stages.":::::

A comparison icon indicator appears between two sequential stages to give a quick visual insight into the differences between them. The comparison indicator has two states:

- **Green indicator** – The metadata for each content item in both stages, is the same.

- **Orange indicator** - Appears if one of these conditions is met:
  - Some of the content items in each stage, were changed or updated (have different metadata).
  - There is a difference in the number of items between the stages.

When two sequential stages are different, a **Compare** link appears underneath the orange comparison icon. Click **Compare** to open the content item list in both stages. This *Compare view* helps you track changes or differences between items in each pipeline stage.

:::image type="content" source="media/deployment-pipelines-compare/compare.png" alt-text="A screenshot showing the compare option which expands the compare view and allows comparing items between deployment pipeline stages." lightbox="media/deployment-pipelines-compare/compare.png":::

In the comparison display, items are arranged according to the logic listed below.

1. The source workspace items are ordered alphabetically within groups, based on their type. The groups are ordered according to the flow of data. For example, first datasets, then reports, and lastly dashboards.

2. The target workspace is ordered according to the source workspace. Paired items are always shown next to each other, even if they have different names.

3. Items that exist in the target workspace but not in the source workspace, are displayed at the bottom of their type group, in alphabetical order.

Items that aren't paired or that have been changed get one of the following labels:

- **New** – A new item in the source stage. This is an item that doesn't exist in the target stage. After deployment, this item will be cloned to the target stage.

- **Different** – An item that exists both in the source and the target stage, were one of the versions was changed after the last deployment. After deployment, the item in the source stage will overwrite the item in the target stage, regardless of where the change was made.

    Datasets with configured deployment rules that haven't been deployed, are also marked as *different*. This is because deployment rules are not applied until the datasets are deployed from the source stage to the target stage, which includes the configured rules.

- **Missing from** – This label indicates that an item appears in the target stage, but not in the source stage.

    >[!NOTE]
    >Deployment will not impact *missing from* items.

## Review differences in paired items

If a text item, like a dataset or dataflow are different, hover over it to see the **Change review** button.

:::image type="content" source="./media/deployment-pipelines-compare/granular-change-button.png" alt-text="Screenshot showing the change review button next to an item.":::

If the only difference between the two items is settings changes, like the name or sensitivity label, the button is disabled. If there are changes to the schema, you can select it.

When you select the **Change review** button, the content of that item is shown as it currently looks in the source stage and in the target stage.

On top of the screen, you'll see:

1. The full pathname of the file as it appears in the source stage.
1. The number of total changes (in black) along with the number of additions (green) and deletions (red) made to the file
1. Up and down arrows that take you to the previous or next difference in the file.
1. Buttons that toggle between a side by side view and an inline view of the changes.

### [Side by side view](#tab/browser)

:::image type="content" source="./media/deployment-pipelines-compare/changes-side-by-side-numbered.png" alt-text="Screenshot showing a side by side view of the changes made to the file.":::

### [inline view](#tab/visual-studio)

:::image type="content" source="./media/deployment-pipelines-compare/changes-inline-numbered.png" alt-text="Screenshot showing an inline view of the changes made to the file.":::

---

The two versions of the content shown are modified to make the comparison easier:

- Datasource and parameter rules are applied to the source item so that the datasource you see is the one that will be deployed.
- Some fields that don't indicate differences (for example, timestamps and role membership) are removed from both items.
- System managed tables, like auto aggregate, are removed.
- Items are sorted so that fields and tables appear in the same order.

Close the window when you finish examining the differences and deploy to the next stage when you're ready.

## Considerations and limitations

Granular compare only shows changes to the following:

- datasets and dataflows
- changes to the schema content. Settings changes, like file names or sensitivity labels, aren't shown.

## Next steps

>[!div class="nextstepaction"]
>[Introduction to deployment pipelines](deployment-pipelines-overview.md)

>[!div class="nextstepaction"]
>[Assign a workspace to a pipeline stage](deployment-pipelines-assign.md)

>[!div class="nextstepaction"]
>[Deployment history](deployment-pipelines-history.md)

>[!div class="nextstepaction"]
>[Understand the deployment pipelines process](deployment-pipelines-process.md)

>[!div class="nextstepaction"]
>[Automate your deployment pipeline using APIs and DevOps](deployment-pipelines-automation.md)

>[!div class="nextstepaction"]
>[Deployment pipelines troubleshooting](deployment-pipelines-troubleshooting.yml)

>[!div class="nextstepaction"]
>[Deployment pipelines best practices](deployment-pipelines-best-practices.md)
