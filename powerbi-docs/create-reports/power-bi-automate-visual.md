---
title: Create a Power Automate visual for Power BI (preview)
description: You can create a Power Automate visual so your end-users can run an automated flow all within a Power BI report.
author: maggiesMSFT
ms.author: maggies
ms.reviewer: sunaraya
ms.service: powerbi
ms.subservice: pbi-reports-dashboards
ms.topic: how-to
ms.date: 06/17/2021
LocalizationGroup: Create reports
---
# Create a Power Automate visual for Power BI (preview)

When you create a Power Automate visual in a Power BI report, your end-users can run an automated flow, just by clicking a button in your report. Furthermore, the flow can be data contextual, meaning that the flow inputs can be dynamic, based on the filters the end-user set. 

## Get started

## Add the Power Automate visual

1. To get started, you download the visual from AppSource and import it to your Power BI report. In the **Visualizations** pane select **More options (...)** > **Get more visuals**.

    automate-get-more-visuals.png

2. In AppSource, search for **Power Automate** > **Add**.

    When it’s successfully imported, you see the **Power Automate** icon in the Visualization pane. 

3. Select this new visual. It automatically gets added to your current report page, with getting started instructions. Scroll, resize the visual, or select the **Focus mode** icon to see all the instructions.
 
4. After you’ve reviewed the instructions, resize the button and place it where you’d like on the report. 

## Edit the flow

1. With the flow selected, add any data fields to be used as dynamic inputs to the flow.
 
1. In **More options (...)** select the Edit option   to configure the button:
 
In the edit mode of the visual, you will need to select an existing flow to apply to the button or create a new flow to be applied to the button. 
 To create a new flow, you can start from scratch   or start with one of the built-in templates as an example. We plan on adding more templates to future releases, so we really appreciate if you can include which templates or connectors interest you in our feedback form.  
Here’s an example for creating a flow from scratch: 
 
After you select + New step, you can choose a subsequent action or specify a Control if you want to specify additional logic to determine the subsequent action.  
Optionally, you can reference the data field(s) as dynamic content if you want the flow to be data contextual. In this example I’m using the Region data field to create an item in a SharePoint list. Based on the end-user’s selection Region could have multiple values or just one.
 
After you’ve configured your flow logic, you can name the flow and select Save. 
 
Then you can select the arrow button to go to the Details page of the flow you just created:
 
Details page: 
 
Next select the **Apply** button    to attach the flow you’ve created to your button. 

## Test the flow

After you have applied a flow to the button, we recommend testing the flow first before you share the flow with others. Note that you can only run these Power BI flows in the context of a Power BI report. You cannot run these flows in Power Automate web app or elsewhere.
If your flow is data contextual, you will want to test how the filters selections in the report impact the flow outcome.
To test the flow in edit mode of the report, select Back to report, and then press Ctrl + select on the button to run the flow in the context of the report. 
 
The button text will indicate that the flow has been triggered. However, to check if the flow has run successfully, you will need to enter the edit mode of the visual and select Details within the More commands menu (. . .) of the flow that has been triggered:
 
On the Details page, you will be able to see the run history and status for the flow: 
 
If the flow is running successfully, you can then share the flow with your report readers. Select Edit in the Run only users section:
  
And then specify which users or groups you want to give run access to: 
 

Alternatively, if you want to give any users edit access to the flow (not just run permissions), you can select Share and specify the users or groups that you want to add as an owner:
 

Optionally, if you want to change the button text, font color, font size, or fill color of the button, you can find these options along with other settings in the Format pane: 
 
 Limitations and considerations
•	Additional manual inputs to the button are not supported at this time. We plan to add support for this by our General Availability release.
•	Currently, we only have a few built-in templates; however, we will be adding more based on user feedback.
•	The visual is not supported for PaaS embedded scenarios nor in Sovereign Cloud scenarios. 


## Next steps
For more information about features that are similar or interact with buttons, take a look at the following articles:

* [Use drillthrough in Power BI reports](desktop-drillthrough.md)
* [Use bookmarks to share insights and build stories in Power BI](desktop-bookmarks.md)
* [Create a drillthrough button](desktop-drill-through-buttons.md)

