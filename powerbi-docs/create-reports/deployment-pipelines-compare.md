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
  - There's a difference in the number of items between the stages.

When two sequential stages are different, a **Compare** link appears underneath the orange comparison icon. Select **Compare** to open the content item list in both stages. This *Compare view* helps you track changes or differences between items in each pipeline stage.

:::image type="content" source="media/deployment-pipelines-compare/compare.png" alt-text="A screenshot showing the compare option, which expands the compare view and allows comparing items between deployment pipeline stages." lightbox="media/deployment-pipelines-compare/compare.png":::

In the comparison display, items are arranged alphabetically by item type. Paired items are shown next to each other, even if they have different names.

Items that aren't paired or that were changed get one of the following labels:

- **New** – A new item in the source stage. This item doesn't exist in the target stage. After deployment, this item will be cloned to the target stage.

- **Different** – An item that exists both in the source and the target stage, where one of the versions was changed after the last deployment. After deployment, the item in the source stage will overwrite the item in the target stage, regardless of where the change was made.

    Datasets with configured deployment rules that haven't been deployed, are also marked as *different*, since deployment rules aren't applied until the datasets are deployed from the source stage to the target stage.

- **Missing from** – This item appears in the target stage, but not in the source stage.

    >[!NOTE]
    >Deployment will not impact *missing from* items.

## Review changes to paired items

If a text item, like a dataset, is different, hover over it to see the **Change review** button.

:::image type="content" source="./media/deployment-pipelines-compare/granular-change-button.png" alt-text="Screenshot showing the change review button next to an item.":::

If there's [nothing to compare](#considerations-and-limitations), the button is disabled. If there are changes to the schema, you can select the button to see a detailed, line by line comparison of the two items.

When you select the **Change review** button, a pop-up window opens with a line by line comparison of the item's content as it [currently looks in the two stages being compared](#file-modifications-before-comparison).

On top of the screen, you'll see:

1. The workspace name followed by name of the item as it appears in the source (*to be deployed*) stage.
1. The total number of changes made to the file in the "to be modified" stage (green) and the "to be deployed" stage (red).
1. Up and down arrows that take you to the previous or next difference in the file.
1. A navigation bar on the right side with red or green bars highlighting where the changes are in the file.
1. Buttons that toggle between a side by side view and an inline view of the changes.
1. The change comparison area with a line by line comparison of the items.

### [Side by side view](#tab/browser)

:::image type="content" source="./media/deployment-pipelines-compare/changes-side-by-side-numbered.png" alt-text="Screenshot showing a side by side view of the changes made to the file.":::

### [Inline view](#tab/visual-studio)

:::image type="content" source="./media/deployment-pipelines-compare/changes-inline-numbered.png" alt-text="Screenshot showing an inline view of the changes made to the file.":::

---

### Compare changes 

When the item's content is displayed *side by side*, the code area is split in two:

- On the **left** is the item's content in the *target* stage of the deployment. This is the stage that will be modified at the next deployment. Its content will be overridden.
- On the **right** is the item's content in the *source* stage of the deployment. This is the stage that will be deployed. Its content will be applied.
- The lines on each side appear in the same order, so each line is shown against its equivalent in the compared stage.

The *inline* comparison view, as opposed to the side by side view, shows each line in the *target* (to be modified) stage underneath its equivalent in the *source* (To be deployed) stage.

When the item's content is displayed for comparison, whether inline or side by side, the differences are highlighted as follows:

- The file content lines are numbered and those lines that were changed are marked as follows:

  - Changes shown in the *To be modified* stage will be removed or overwritten during the next deployment. They're highlighted in **red** with a '-' sign next to the number.
  - Changes shown in the *To be deployed* stage are the new values that will be applied during the next deployment. They're highlighted in **green** with a '+' sign next to the number.
  
- In the modified lines, the specific characters that were added or deleted are highlighted in a darker shade.

### File modifications before comparison

The two versions of the content shown in the file comparison area are modified in the following ways to make the comparison easier:

- Datasource and parameter rules are applied to the source item so that the datasource you see is the one that will be deployed.
- Some fields that don't indicate differences (for example, timestamps and role membership) are removed from both items.
- System managed tables, like auto aggregate, are removed.
- Items are sorted so that fields and tables appear in the same order.

Close the window when you finish examining the differences and deploy to the next stage when you're ready.

## Considerations and limitations

- Change review is supported for the following items:

  - Datasets, excluding data modeling format v1, and dataflows.
  - Items with changes to the schema content.

- Changes to item names is supported. Other settings changes, like sensitivity labels, aren't supported.

- This content in the line by line comparison may look a bit different than the original version since it was [modified a bit before running the comparison](#file-modifications-before-comparison).

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
