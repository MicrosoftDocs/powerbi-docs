---
title: Create a Power Automate visual for Power BI 

description: You can create a Power Automate visual so your end-users can run an automated flow all within a Power BI report.
author: maggiesMSFT
ms.author: maggies
ms.reviewer: sunaraya
ms.service: powerbi
ms.subservice: pbi-reports-dashboards
ms.topic: how-to
ms.date: 09/08/2022
LocalizationGroup: Create reports
---
# Create a Power Automate visual for Power BI 

[!INCLUDE [applies-yes-desktop-yes-service](../includes/applies-yes-desktop-yes-service.md)]

When you create a Power Automate visual in a Power BI report, your end-users can run an automated flow, just by clicking a button in your report. Furthermore, the flow can be data contextual, meaning that the flow inputs can be dynamic, based on the filters the end-users set.

:::image type="content" source="media/power-bi-automate-visual/power-automate-visual-resized-repositioned-report.png" alt-text="Flow button resized and repositioned on the report.":::

## Add the Power Automate visual

# [Power BI Desktop](#tab/powerbi-desktop)

1. Select the Power Automate icon from the **Visualizations** pane.

    ![Screenshot of selecting the Power Automate icon from the Visualizations pane.](media/power-bi-automate-visual/power-automate-icon-in-visualization-pane.png)

    In **Power BI Desktop**, you can also add the visual from the ribbon. On the **Insert** tab, select **Power Automate** in the **Power Platform** section.

    ![image](https://github.com/MicrosoftDocs/powerbi-docs/assets/79485235/0f5c51e9-f84d-43c0-b258-e585e27c6e07)
   
    Once you select the visual, it automatically gets added to your current report page, with getting started instructions.

# [Power BI service](#tab/powerbi-service)

1. Select the Power Automate icon from the **Visualizations** pane.

    ![Screenshot of selecting the Power Automate icon from the Visualizations pane.](media/power-bi-automate-visual/power-automate-icon-in-visualization-pane.png)

    Once you select the visual, it automatically gets added to your current report page, with getting started instructions.

---

2. Scroll, resize the visual, or select the **Focus mode** icon to see all the instructions.

    ![image](https://github.com/MicrosoftDocs/powerbi-docs/assets/79485235/7886eb16-d331-485b-b07c-f8d088e497b9)

3. After you’ve reviewed the instructions, resize the button and place it where you’d like on the report.

## Change the environment in which your flow is created
To select your preferred environment for creating your flow, use the environment picker in the Power Automate portal. This includes environments where you have any built-in security role, as well as any environments where you are a co-owner of one or more flows. If you cannot find your preferred environment, [click here](https://learn.microsoft.com/en-us/power-platform/admin/troubleshoot-missing-environments) to learn more about the requirements for accessing environments in product experiences.

![image](https://github.com/MicrosoftDocs/powerbi-docs/assets/79485235/0fa315dd-9fa5-4d02-ba05-f102f870948a)

## Edit the flow

1. With the flow selected, add any data fields to the **Power Automate Data** region, to be used as dynamic inputs to the flow.

    :::image type="content" source="media/power-bi-automate-visual/add-data-field-visual-desktop.png" alt-text="Screenshot shows control to add any fields you want as dynamic inputs.":::

# [Power BI Desktop](#tab/powerbi-desktop)

2. Select **More options (...)** > **Edit** to configure the button:

    :::image type="content" source="media/power-bi-automate-visual/automate-edit-visual.png" alt-text="Select Edit to edit the flow.":::

# [Power BI service](#tab/powerbi-service)

2. Select **More options (...)** > **Edit** to configure the button:

    :::image type="content" source="media/power-bi-automate-visual/automate-edit-visual-service.png" alt-text="Screenshot shows Edit selected in the Power Automate visual.":::

---

3. In the edit mode of the visual, you either select an existing flow to apply to the button, or create a new flow to be applied to the button.

    :::image type="content" source="media/power-bi-automate-visual/apply-power-automate-flow.png" alt-text="Create a flow for a SharePoint list in Power B I.":::

4. You can start from scratch or start with one of the built-in templates as an example. To start from scratch, select **New** > **Instant cloud flow**: 

    :::image type="content" source="media/power-bi-automate-visual/automate-instant-cloud-flow.png" alt-text="New Instant cloud flow."::: 

5. Select **New step**.

    :::image type="content" source="media/power-bi-automate-visual/create-flow-from-scratch.png" alt-text="Start creating a flow from scratch."::: 

6. Here, you can choose a subsequent action or specify a Control if you want to specify additional logic to determine the subsequent action.

    :::image type="content" source="media/power-bi-automate-visual/choose-actions-for-flow.png" alt-text="Choose actions for the flow.":::

7. Optionally, you can reference the data field(s) as dynamic content if you want the flow to be data contextual. This example uses the Region data field to create an item in a SharePoint list. Based on the end-user’s selection, Region could have multiple values or just one.

    :::image type="content" source="media/power-bi-automate-visual/include-dynamic-content-for-flow-inputs.png" alt-text="Add dynamic content for the flow.":::

8. After you’ve configured your flow logic, you can name the flow and select **Save**. 

    :::image type="content" source="media/power-bi-automate-visual/save-flow.png" alt-text="Save the flow."::: 

9. Select the arrow button to go to the Details page of the flow you just created:

    :::image type="content" source="media/power-bi-automate-visual/navigate-details-page-for-saved-flow.png" alt-text="Navigate to the Details page for the flow.":::

    Here's the Details page for a saved flow: 

    :::image type="content" source="media/power-bi-automate-visual/details-page-saved-flow.png" alt-text="The Details page for a saved flow.":::

10. Select the **Apply** button :::image type="icon" source="media/power-bi-automate-visual/apply-icon.png" border="false"::: to attach the flow you’ve created to your button.

### Format the flow

Optionally, you can change the button text, font color, font size, or fill color of the button. These options along with other settings are available in the **Format** pane:

:::image type="content" source="media/power-bi-automate-visual/power-bi-flow-format.png" alt-text="Format the flow.":::

## Test the flow

After you've applied a flow to the button, we recommend testing it before you share the flow with others. These Power BI flows can only run in the context of a Power BI report. You can't run these flows in a Power Automate web app or elsewhere.

If your flow is data contextual, you'll want to test how the filter selections in the report impact the flow outcome.

1. To test the flow in edit mode of the report, select **Back to report**, then press Ctrl while you select the button to run the flow.

    :::image type="content" source="media/power-bi-automate-visual/run-flow-button.png" alt-text="Select the Run flow button.":::

    The button text indicates that the flow has been triggered.

1. To check if the flow has run successfully, select the **More commands (...)** menu > **Details** in the flow that has been triggered:

    :::image type="content" source="media/power-bi-automate-visual/entry-point-flow-details-page.png" alt-text="Select Details on the More options menu.":::

1. On the **Details** page, you can see the **run history** and **status** for the flow:

    :::image type="content" source="media/power-bi-automate-visual/details-page-executed-flow.png" alt-text="See the run history on the Details page.":::

## Share the flow

When the flow is running successfully, you can share it with your report readers.

1. Select **Edit** in the **Run only users** section:

    :::image type="content" source="media/power-bi-automate-visual/share-run-access-other-users.png" alt-text="Run only users.":::

1. Specify which users or groups you want to give run access to:

    :::image type="content" source="media/power-bi-automate-visual/manage-run-only-flow-permissions.png" alt-text="Manage run-only permissions.":::

### Give users edit access

Alternatively, you can give any users edit access to the flow, not just run permissions.

- Select **Share** :::image type="icon" source="media/power-bi-automate-visual/share-icon.png" border="false":::, and specify the users or groups that you want to add as an owner:

    :::image type="content" source="media/power-bi-automate-visual/share-flow-ownership.png" alt-text="Share flow ownership with others.":::

## Considerations and limitations

- Additional manual inputs to the button aren't supported.  
- Currently, we only have a few built-in templates; we plan to add more based on user feedback.
- The visual will only display flows within your default environment. We plan to add support for an environment selector by the general availability release.
- The visual isn't supported for [embedded analytics](./../developer/embedded/embedded-analytics-power-bi.md).
- The visual doesn't work in Publish to Web (public) scenarios, because unauthenticated scenarios aren't supported by Power Automate.
- The visual doesn't support export scenarios.


## Related content

For more information about Power Automate, take a look at the following articles:

- [Integrate Power BI data alerts with Power Automate](../collaborate-share/service-flow-integration.md)
- [Export and email a Power BI report with Power Automate](../collaborate-share/service-automate-power-bi-report-export.md)
- [Get started with Power Automate](/power-automate/getting-started/)
- More questions? [Try the Power BI Community](https://community.powerbi.com/)
