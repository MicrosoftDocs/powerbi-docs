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

Before you deploy content to a different stage, it can be helpful to see the differences between the two stages. The **Change review** icon displays the content of each pipeline and shows you exactly which items are different and where those differences are.

The deployment pipeline home page compares the three deployment stages and indicates if there are any differences. A green circle with a check indicates that the two stages are the same. An orange circle with an "X" indicates that the stages are different.

:::image type="content" source="./media/deployment-pipelines-granular-compare/deployment-pipelines-compare.png" alt-text="Screenshot showing three stages of deployment. There's a green check between the test and production stages and an orange X between the development and test stages.":::

## See the differences between paired items

If two stages are different, select **Compare** underneath to see a list of items in each stage.

:::image type="content" source="./media/deployment-pipelines-granular-compare/compare-changes-new.png" alt-text="Screenshot showing a comparison between two stages with one new item and one different item.":::

- Paired items are shown next to each other, even if they have different names.
- An item that exists in only one of the stages is indicated to be **New**.
- Paired items that aren't identical are indicated to be **Different**. Differences can be in the settings or schema (or both).

If the items are different, hover over it to see the **change review** button.

:::image type="content" source="./media/deployment-pipelines-granular-compare/granular-change-button.png" alt-text="Screenshot showing the change review button next to an item.":::

If the only difference between the two items is settings changes, like the name or sensitivity label, the button is disabled. If there are changes in the schema, you can select it.

## Examine the differences in the item

When you select the **change review** button, the content of that item is shown as it currently looks in the source stage and in the target stage.

On top of the screen, you'll see:

1. The full pathname of the file as it appears in the source stage.
1. The number of total changes (in black) along with the number of additions (green) and deletions (red) made to the file
1. Up and down arrows that take you to the previous or next difference in the file 
1. Buttons that toggle between a side by side view and an inline view of the changes.

### [Side by side view](#tab/browser)

:::image type="content" source="./media/deployment-pipelines-granular-compare/changes-side-by-side-numbered.png" alt-text="Screenshot showing a side by side view of the changes made to the file.":::

### [inline view](#tab/visual-studio)

:::image type="content" source="./media/deployment-pipelines-granular-compare/changes-inline-numbered.png" alt-text="Screenshot showing an inline view of the changes made to the file.":::

---

The two versions shown are modified to make the comparison easier:

- Datasource and parameter rules are applied to the source item so that the datasource you see is the one that will be deployed.
- Some fields that don't indicate differences (for example, timestamps and role membership) are removed from both items.
- System managed tables, like auto aggregate, are removed.
- Items are sorted so that fields and tables appear in the same order.

Close the window when you finish examining the differences and deploy to the next stage when you're ready.

## Considerations and limitations

- You can only compare the content of datasets and dataflows
- You can only compare changes to the schema content. Settings changes, like file names or sensitivity labels aren't shown.

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
