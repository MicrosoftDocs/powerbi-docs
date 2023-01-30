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

Before you deploy content to a different stage, it can be helpful to see the differences between the two stages. The **Compare ???** icon displays the content of each pipeline and shows you exactly which items are different and where those differences are.

## See which items are being deployed

To 
Select compare:
Items that are paired are shown next to each other. Even if they have different names.
Paired items Same or different. Different can be either settings change or schema change (or both) works only for setting change.
If different - Hover for change review icon. If only difference is settings changes - icon is disabled.

## See the differences between paired items

When you select the Compare??? icon, the content of that item is shown as it currently in the source stage and in the target stage.

> [!NOTE]
> The content that's currently is in the target stage will be overwritten by the content in the source stage.


* The up and down arrows jump to the previous or next different line
* Select the icon to toggle between side by side and inline views

## Considerations and limitations

* You can only compare the content of *text* item types (datasets, dataflows, and pagenated reports)
* You can only compare changes to the schema content. Settings changes, like file names or sensitivity labels aren't shown.

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
