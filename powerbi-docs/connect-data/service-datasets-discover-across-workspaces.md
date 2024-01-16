---
title: Create reports based on semantic models from different workspaces - Power BI
description: Learn how you can share a semantic model with users across the organization. Then they can build reports based on your semantic model in their own workspaces.
author: paulinbar
ms.author: painbar
ms.reviewer: kayu
ms.service: powerbi
ms.subservice: pbi-data-sources
ms.topic: how-to
ms.date: 01/11/2023
LocalizationGroup: Share your work
---
# Create reports based on semantic models from different workspaces

Learn how you can create reports in your own workspaces based on semantic models in other workspaces. To build a report on top of an existing semantic model, you can start from Power BI Desktop or from the Power BI service, in your **My workspace** or in [another workspace](../collaborate-share/service-create-the-new-workspaces.md).

- In the Power BI service: **Create** > **Report** > **Pick a published semantic model**.
- In Power BI Desktop: from the **Home** ribbon, select **Get data** > **Power BI semantic models**.

  ![Screenshot shows how to connect to an existing semantic model in the Power BI service and Power BI Desktop.](media/service-semantic models-across-workspaces/power-bi-connect-semantic model-pk.png)

In both cases, the semantic model discovery experience starts in the **Data hub**. You see all the semantic models that you have access to, regardless of where they are:

:::image type="content" source="media/service-datasets-across-workspaces/power-bi-select-dataset.png" alt-text="Screenshot shows an option to select a semantic model." lightbox="media/service-datasets-across-workspaces/power-bi-select-dataset.png":::

One of the semantic models is labeled **Promoted**. Learn about that label in [Find an endorsed semantic model](#find-an-endorsed-semantic model), later in this article.

The semantic models in this list meet at least one of the following conditions:

- The semantic model is in a workspace that you're a member of. See [Considerations and limitations](service-semantic models-across-workspaces.md#considerations-and-limitations).
- You have Build permission for the semantic model.
- The semantic model is in your **My workspace**.

> [!NOTE]
> If you're a free user, you see only datasets in your **My workspace**, or datasets for which you have Build permission that are in Premium or Fabric capacity workspaces.

When you select **Create**, you create a live connection to the semantic model. The report creation experience opens with the full semantic model available. You haven't made a copy of the semantic model. The semantic model still resides in its original location. You can use all tables and measures in the semantic model to build your own reports. Row-level security (RLS) restrictions on the semantic model are in effect, so you only see data you have permissions to see based on your RLS role.

You can save the report to the current workspace in the Power BI service, or publish the report to a workspace from Power BI Desktop. Power BI automatically creates an entry in the list of semantic models if the report is based on a semantic model outside of the workspace.

The entry shows information about the semantic model, and a few select actions.

:::image type="content" source="media/service-datasets-across-workspaces/power-bi-dataset-actions.png" alt-text="Screenshot shows actions for selected semantic model." lightbox="media/service-datasets-across-workspaces/power-bi-dataset-actions.png":::

## Find an endorsed semantic model

There are two different kinds of endorsed semantic models. Semantic model owners can *promote* a semantic model that they recommend to you. Also, the Power BI admin can designate experts in your organization who can *certify* semantic models for everyone to use. Promoted and certified semantic models both display *badges* that you see both when looking for a semantic model, and in the list of semantic models in a workspace. The name of the person who certified a semantic model is displayed in a tooltip during the semantic model discovery experience. Hover over the **Certified** label and you see it.

- In the Power BI service: **OneLake data hub**.
- In Power BI Desktop: **Get data** > **Power BI semantic models**.

  In **OneLake data hub**, select **Endorsed in your org**.

  :::image type="content" source="media/service-datasets-across-workspaces/power-bi-dataset-promoted.png" alt-text="Screenshot shows a semantic model with Promoted and Certified labels." lightbox="media/service-datasets-across-workspaces/power-bi-dataset-promoted.png":::

## Related content

- [Use semantic models across workspaces](service-datasets-across-workspaces.md)
- Questions? [Try asking the Power BI Community](https://community.powerbi.com/)
