---
title: Create a Power Automate visual for Power BI 
description: You can create a Power Automate visual so your end-users can run an automated flow, all within a Power BI report.
author: julcsc
ms.author: juliacawthra
ms.reviewer: sunaraya
ms.service: powerbi
ms.subservice: pbi-reports-dashboards
ms.topic: how-to
ms.date: 05/05/2025
LocalizationGroup: Create reports
# Customer intent: As a Power Bi user I want to create a Power Automate visual.
---
# Create a Power Automate visual for Power BI

[!INCLUDE [applies-yes-desktop-yes-service](../includes/applies-yes-desktop-yes-service.md)]

When you create a Power Automate visual in a Power BI report, your end-users can run an automated flow, just by clicking a button in your report. Furthermore, the flow can be data contextual, meaning that the flow inputs can be dynamic, based on the filters the end-users set.

:::image type="content" source="media/power-bi-automate-visual/power-automate-visual-resized-repositioned-report.png" alt-text="Screenshot shows Flow button resized and repositioned on the report.":::

## Add the Power Automate visual

Use the following procedure to add the Power Automate visual:

### Power BI Desktop

* Select the Power Automate icon from the **Visualizations** pane.

    :::image type="content" source="media/power-bi-automate-visual/power-automate-icon-in-visualization-pane.png" alt-text="Screenshot of selecting the Power Automate icon from the Visualizations pane":::

    In **Power BI Desktop**, you can also add the visual from the ribbon. On the **Insert** tab, select **Power Automate** in the **Power Platform** section.

    :::image type="content" source="media/power-bi-automate-visual/create-power-automate-button.png" alt-text="Screenshot of selecting the Power Automate icon from the Insert ribbon.":::

    Once you select the visual, it automatically gets added to your current report page, with getting started instructions.

### Power BI service

1. Select the Power Automate icon from the **Visualizations** pane.

    :::image type="content" source="media/power-bi-automate-visual/power-automate-icon-in-visualization-pane.png" alt-text="Screenshot of selecting the Power Automate icon from the Visualizations pane.":::

1. Once you select the visual, it automatically gets added to your current report page, with getting started instructions.

1. Scroll, resize the visual, or select the **Focus mode** icon to see all the instructions.

   :::image type="content" source="media/power-bi-automate-visual/power-automate-steps.png" alt-text="Screenshot showing Flow button resized and repositioned on the report.":::

1. After you review the instructions, resize the button and place it where you’d like on the report.

## Change the environment in which your flow is created

To select your preferred environment for creating your flow, use the environment picker in the Power Automate visual. The environment picker includes environments where you have any built-in security role, and any environments where you're an owner of one or more flows. If you can't find your preferred environment, see the article [Troubleshoot missing environments](/power-platform/admin/troubleshoot-missing-environments) to learn more about the requirements.

:::image type="content" source="media/power-bi-automate-visual/image-2.png" alt-text="Screenshot showing selecting a different environment.":::

## Edit the flow

Use the following procedure to edit the flow:

### Edit the flow for Power BI Desktop

1. With the flow selected, add any data fields to the **Power Automate Data** region, to be used as dynamic inputs to the flow.

    :::image type="content" source="media/power-bi-automate-visual/add-data-field-visual-desktop.png" alt-text="Screenshot shows control to add any fields you want as dynamic inputs.":::

1. Select **More options (...)** > **Edit** to configure the button.

    :::image type="content" source="media/power-bi-automate-visual/automate-edit-visual.png" alt-text="Screenshot shows select Edit to edit the flow.":::

### Edit the flow for Power BI service

1. With the flow selected, add any data fields to the **Power Automate Data** region, to be used as dynamic inputs to the flow.

    :::image type="content" source="media/power-bi-automate-visual/add-data-field-visual-desktop.png" alt-text="Screenshot shows control to add any fields you want as dynamic inputs.":::

1. Select **More options (...)** > **Edit** to configure the button.

    :::image type="content" source="media/power-bi-automate-visual/automate-edit-visual-service.png" alt-text="Screenshot shows Edit selected in the Power Automate visual.":::

1. In edit mode of the visual, either select an existing flow to apply to the button, or create a new flow to be applied to the button.

   :::image type="content" source="media/power-bi-automate-visual/apply-power-automate-flow.png" alt-text="Screenshot shows Create a flow for a SharePoint list in Power B I.":::

1. You can start from scratch or start with one of the built-in templates as an example. To start from scratch, select **New** > **Instant cloud flow**.

   :::image type="content" source="media/power-bi-automate-visual/automate-instant-cloud-flow.png" alt-text="Screenshot shows New Instant cloud flow.":::

1. Select **New step**.

   :::image type="content" source="media/power-bi-automate-visual/create-flow-from-scratch.png" alt-text="Screenshot shows start creating a flow from scratch.":::

1. Here, you can choose a subsequent action or specify a Control if you want to specify more logic to determine the subsequent action.

   :::image type="content" source="media/power-bi-automate-visual/choose-actions-for-flow.png" alt-text="Screenshot shows choose actions for the flow.":::

1. Optionally, you can reference the data field(s) as dynamic content if you want the flow to be data contextual. This example uses the Region data field to create an item in a SharePoint list. Based on the end-user’s selection, Region could have multiple values or just one.

   :::image type="content" source="media/power-bi-automate-visual/include-dynamic-content-for-flow-inputs.png" alt-text="Screenshot shows Add dynamic content for the flow.":::

1. After you configure your flow logic, name the flow, and select **Save**.

   :::image type="content" source="media/power-bi-automate-visual/save-flow.png" alt-text="Screenshot shows Save the flow.":::

1. Select the arrow button to go to the Details page of the flow you created.

   :::image type="content" source="media/power-bi-automate-visual/navigate-details-page-for-saved-flow.png" alt-text="Screenshot shows Navigate to the Details page for the flow.":::

    Here's the Details page for a saved flow.

   :::image type="content" source="media/power-bi-automate-visual/details-page-saved-flow.png" alt-text="Screenshot shows the Details page for a saved flow.":::

1. Select the **Apply** button :::image type="icon" source="media/power-bi-automate-visual/apply-icon.png" border="false"::: to attach the flow you created to your button.

### Format the flow

Optionally, you can change the button text, font color, font size, or fill color of the button. These options along with other settings are available in the **Format** pane:

:::image type="content" source="media/power-bi-automate-visual/power-bi-flow-format.png" alt-text="Screenshot shows Format the flow.":::

## Test the flow

After you apply a flow to the button, we recommend testing it before you share the flow with others. These Power BI flows can only run in the context of a Power BI report. You can't run these flows in a Power Automate web app or elsewhere.

If your flow is data contextual, make sure you test how the filter selections in the report affect the flow outcome.

1. To test the flow in edit mode of the report, select **Back to report**, then press Ctrl while you select the button to run the flow.

   :::image type="content" source="media/power-bi-automate-visual/run-flow-button.png" alt-text="Screenshot shows Select the Run flow button.":::

    The button text indicates that the flow is triggered.

1. To check if the flow ran successfully, select the **More commands (...)** menu > **Details** in the triggered flow:

   :::image type="content" source="media/power-bi-automate-visual/entry-point-flow-details-page.png" alt-text="Screenshot shows Select Details on the More options menu.":::

1. On the **Details** page, you can see the **run history** and **status** for the flow:

   :::image type="content" source="media/power-bi-automate-visual/details-page-executed-flow.png" alt-text="Screenshot shows See the run history on the Details page.":::

> [!IMPORTANT]
> You can only run these Power BI flows within the context of a Power BI report. You can't start flows from the Power Automate portal.
To test the flow in edit mode of the report, select Back to report, and then press Ctrl + select on the button to run the flow in the context of the report. You can also navigate to edit mode or to Power Automate to view the run history of the flow and ensure it's running successfully.

## Share the flow

When the flow is running successfully, you can share it with your report readers.

1. Select **Edit** in the **Run only users** section:

    :::image type="content" source="media/power-bi-automate-visual/share-run-access-other-users.png" alt-text="Screenshot shows Run only users.":::

1. Specify which users or groups you want to give run access to:

    :::image type="content" source="media/power-bi-automate-visual/manage-run-only-flow-permissions.png" alt-text="Screenshot shows Manage run-only permissions.":::

### Give users edit access

Alternatively, you can give any users edit access to the flow, not just run permissions.

- Select **Share** :::image type="icon" source="media/power-bi-automate-visual/share-icon.png" border="false":::, and specify the users or groups that you want to add as an owner:

    :::image type="content" source="media/power-bi-automate-visual/share-flow-ownership.png" alt-text="Screenshot shows Share flow ownership with others.":::

## Considerations and limitations

- Other manual inputs to the button aren't supported.  
- The visual isn't supported for [embedded analytics](./../developer/embedded/embedded-analytics-power-bi.md).
- The visual doesn't work in Publish to Web (public) scenarios, because Power Automate doesn't support unauthenticated scenarios.
- The visual doesn't support export scenarios.
- The Power Automate visual is limited to process a maximum of 1,000 records.
- The user running the flow within the Power BI report needs to have permissions to run the flow. Grant these permissions through direct sharing by the user or by sharing to a Microsoft Entra group.
- Create flows that you'll **use** with the Power BI button trigger **directly within the Power BI report**. **Avoid** going directly to Power Automate to create these flows, as the trigger has no access to the data fields necessary for creating the flow.
- Power BI data is sent to, and processed in, a geography where the flow is deployed.

## Related content

For more information about Power Automate, take a look at the following articles:

- [Integrate Power BI data alerts with Power Automate](../collaborate-share/service-flow-integration.md)
- [Export and email a Power BI report with Power Automate](../collaborate-share/service-automate-power-bi-report-export.md)
- [Get started with Power Automate](/power-automate/getting-started/)
- More questions? [Try the Power BI Community](https://community.powerbi.com/)
