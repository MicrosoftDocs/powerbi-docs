---
title: Create a Power Automate visual for Power BI (preview)
description: You can create a Power Automate visual so your end-users can run an automated flow all within a Power BI report.
author: maggiesMSFT
ms.author: maggies
ms.reviewer: sunaraya
ms.service: powerbi
ms.subservice: pbi-reports-dashboards
ms.topic: how-to
ms.date: 06/22/2021
LocalizationGroup: Create reports
---
# Create a Power Automate visual for Power BI (preview)

When you create a Power Automate visual in a Power BI report, your end-users can run an automated flow, just by clicking a button in your report. Furthermore, the flow can be data contextual, meaning that the flow inputs can be dynamic, based on the filters the end-users set.

:::image type="content" source="media/power-bi-automate-visual/apply-power-automate-flow.png" alt-text="Create a flow for a SharePoint list in Power B I.":::

## Get started

## Add the Power Automate visual

1. To get started, you download the visual from AppSource and import it to your Power BI report. In the **Visualizations** pane select **More options (...)** > **Get more visuals**.

    :::image type="content" source="media/power-bi-automate-visual/automate-get-more-visuals.png" alt-text="Get more visuals.":::

2. In AppSource, search for **Power Automate** > **Add**.

    :::image type="content" source="media/power-bi-automate-visual/power-bi-visuals-appsource.png" alt-text="Power Automate visual in AppSource.":::

    When it’s successfully imported, you see the **Power Automate** icon in the Visualization pane. 

3. Select this new visual. 

    :::image type="content" source="media/power-bi-automate-visual/power-automate-icon.png" alt-text="Select the Power Automate icon.":::

    It automatically gets added to your current report page, with getting started instructions. 

1. Scroll, resize the visual, or select the **Focus mode** icon to see all the instructions.

    :::image type="content" source="media/power-bi-automate-visual/automate-new-visual.png" alt-text="Power Automate new visual added to the report.":::

4. After you’ve reviewed the instructions, resize the button and place it where you’d like on the report. 

    :::image type="content" source="media/power-bi-automate-visual/power-automate-visual-resized-repositioned-report.png" alt-text="Flow button resized and repositioned on the report.":::

## Edit the flow

1. With the flow selected, add any data fields to be used as dynamic inputs to the flow.

    :::image type="content" source="media/power-bi-automate-visual/add-data-field-visual.png" alt-text="Add any fields you want as dynamic inputs.":::

1. Select **More options (...)** > **Edit** to configure the button:

    :::image type="content" source="media/power-bi-automate-visual/automate-edit-visual.png" alt-text="Select Edit to edit the flow."::: 

1. In the edit mode of the visual, you will need to select an existing flow to apply to the button or create a new flow to be applied to the button. 

    :::image type="content" source="media/power-bi-automate-visual/apply-power-automate-flow.png" alt-text="Create a flow for a SharePoint list in Power B I.":::

1. To create a new flow, you can start from scratch or start with one of the built-in templates as an example. Here’s an example for creating a flow from scratch: 

    :::image type="content" source="media/power-bi-automate-visual/create-flow-from-scratch.png" alt-text="Start creating a flow from scratch."::: 

1. After you select **+ New step**, you can choose a subsequent action or specify a Control if you want to specify additional logic to determine the subsequent action.

    :::image type="content" source="media/power-bi-automate-visual/choose-actions-for-flow.png" alt-text="Choose actions for the flow.":::

1. Optionally, you can reference the data field(s) as dynamic content if you want the flow to be data contextual. In this example I’m using the Region data field to create an item in a SharePoint list. Based on the end-user’s selection Region could have multiple values or just one.

    :::image type="content" source="media/power-bi-automate-visual/include-dynamic-content-for-flow-inputs.png" alt-text="Add dynamic content for the flow.":::

1. After you’ve configured your flow logic, you can name the flow and select Save. 

    :::image type="content" source="media/power-bi-automate-visual/save-flow.png" alt-text="Save the flow."::: 

1. Then you can select the arrow button to go to the Details page of the flow you just created:

    :::image type="content" source="media/power-bi-automate-visual/navigate-details-page-for-saved-flow.png" alt-text="Navigate to the Details page for the flow.":::

    The Details page for a saved flow: 

    :::image type="content" source="media/power-bi-automate-visual/details-page-saved-flow.png" alt-text="The Details page for a saved flow.":::

1. Next select the **Apply** button :::image type="icon" source="media/power-bi-automate-visual/apply-icon.png" border="false"::: to attach the flow you’ve created to your button.

## Test the flow

After you have applied a flow to the button, we recommend testing the flow first before you share the flow with others. Note that you can only run these Power BI flows in the context of a Power BI report. You cannot run these flows in Power Automate web app or elsewhere.

If your flow is data contextual, you will want to test how the filters selections in the report impact the flow outcome.

To test the flow in edit mode of the report, select **Back to report**, and then press Ctrl + select on the button to run the flow in the context of the report. 

:::image type="content" source="media/power-bi-automate-visual/run-flow-button.png" alt-text="Select the Run flow button.":::

The button text will indicate that the flow has been triggered. However, to check if the flow has run successfully, you will need to enter the edit mode of the visual and select Details within the More commands menu (. . .) of the flow that has been triggered:

:::image type="content" source="media/power-bi-automate-visual/entry-point-flow-details-page.png" alt-text="Select Details on the More options menu.":::

On the Details page, you can see the run history and status for the flow: 

:::image type="content" source="media/power-bi-automate-visual/details-page-executed-flow.png" alt-text="See the run history on the Details page.":::

If the flow is running successfully, you can then share the flow with your report readers. Select Edit in the Run only users section:

:::image type="content" source="media/power-bi-automate-visual/share-run-access-other-users.png" alt-text="Run only users.":::
 
And then specify which users or groups you want to give run access to: 

:::image type="content" source="media/power-bi-automate-visual/manage-run-only-flow-permissions.png" alt-text="Manage run-only permissions."::: 

Alternatively, if you want to give any users edit access to the flow (not just run permissions), you can select Share and specify the users or groups that you want to add as an owner:

:::image type="content" source="media/power-bi-automate-visual/share-flow-ownership.png" alt-text="Share flow ownership with others.":::

Optionally, if you want to change the button text, font color, font size, or fill color of the button, you can find these options along with other settings in the Format pane: 

:::image type="content" source="media/power-bi-automate-visual/power-bi-flow-format.png" alt-text="Format the flow."::: 

## Limitations and considerations

- Additional manual inputs to the button are not supported at this time. We plan to add support for this by our General Availability release.
- Currently, we only have a few built-in templates; however, we will be adding more based on user feedback.
- The visual is not supported for PaaS embedded scenarios nor in Sovereign Cloud scenarios. 

## Next steps

For more information about features that are similar or interact with buttons, take a look at the following articles:

* [Use drillthrough in Power BI reports](desktop-drillthrough.md)
* [Use bookmarks to share insights and build stories in Power BI](desktop-bookmarks.md)
* [Create a drillthrough button](desktop-drill-through-buttons.md)

