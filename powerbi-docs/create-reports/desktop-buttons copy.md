---
title: Create a Power Automate visual for Power BI (preview)
description: You can add buttons in Power BI reports that make your reports behave like apps, and deepen engagement with users.
author: maggiesMSFT
ms.author: maggies
ms.reviewer: ''
ms.service: powerbi
ms.subservice: pbi-reports-dashboards
ms.topic: how-to
ms.date: 05/21/2020
LocalizationGroup: Create reports
---
# Create a Power Automate visual for Power BI (preview)

Power Automate visual for Power BI (preview)
Empower your end-users to go from insight to action. With the Power Automate visual, end-users can run an automated flow all within a Power BI report. Furthermore, the executed flow can be data contextual, meaning that the Flow inputs can be dynamic based on the filters set by the end-user. 

 

How does it work?
To get started, simply download the visual from AppSource and import it to your Power BI report. When it’s successfully imported, you’ll see the Power Automate icon   appear in the Visualization pane. Select this new visual and it will automatically get added to your current report page:
 

You’re notice that the initial state of the visual contains getting started instructions. Scroll down, resize the visual, or click the Focus mode icon   if you want to see all the instructions.
 
Once you’ve reviewed the instructions, you can resize the button and place it where you’d like on the report. 
Next, you will want to add any data fields to be used as dynamic inputs to the Flow:  
In the More options menu (. . .) you will need to select the Edit option   to configure the button:
 
Once in the edit mode of the visual, you will need to select an existing Flow to apply to the button or create a new Flow to be applied to the button. 
 To create a new Flow, you can start from scratch   or start with one of the built-in templates as an example. We plan on adding more templates to future releases, so we really appreciate if you can include which templates or connectors interest you in our feedback form.  
Here’s an example for creating a Flow from scratch: 
 
Once you select + New step, you can choose a subsequent action or specify a Control if you want to specify additional logic to determine the subsequent action.  
Optionally, you can reference the data field(s) as dynamic content if you want the Flow to be data contextual. In this example I’m using the Region data field to create an item in a SharePoint list. Based on the end-user’s selection Region could have multiple values or just one.
 
After you’ve configured your Flow logic, you can name the Flow and click Save. 
 
Then you can click the arrow button to go to the Details page of the Flow you just created:
 
Details page: 
 
Next simply hit Apply button    to attach the Flow you’ve created to your button. 
Once you have applied a Flow to the button, we recommend testing the Flow first before you share the Flow with others. Note that you can only run these Power BI Flows in the context of a Power BI report. You cannot run these Flows in Power Automate web app or elsewhere.
If your Flow is data contextual, you will want to test how the filters selections in the report impact the Flow outcome.
To test the Flow in edit mode of the report, select Back to report, and then hit Ctrl + click on the button to run the Flow in the context of the report. 
 
The button text will indicate once the Flow has been triggered. However, to check if the Flow has run successfully, you will need to enter the edit mode of the visual and select Details within the More commands menu (. . .) of the Flow that has been triggered:
 
Once on the Details page, you will be able to see the run history and status for the Flow: 
 
If the Flow is running successfully, you can then share the Flow with your report readers. Select Edit in the Run only users section:
  
And then specify which users or groups you want to give run access to: 
 

Alternatively, if you want to give any users edit access to the Flow (not just run permissions), you can hit the Share option   and specify the users or groups that you want to add as an owner:
 

Optionally, if you want to change the Button text, font color, font size, or fill color of the button, you can find these options along with other settings in the Format pane: 
 
 Limitations and considerations
•	Additional manual inputs to the button are not supported at this time. We plan to add support for this by our General Availability release.
•	Currently, we only have a few built-in templates; however, we will be adding more based on user feedback.
•	The visual is not supported for PaaS embedded scenarios nor in Sovereign Cloud scenarios. 


## Next steps
For more information about features that are similar or interact with buttons, take a look at the following articles:

* [Use drillthrough in Power BI reports](desktop-drillthrough.md)
* [Use bookmarks to share insights and build stories in Power BI](desktop-bookmarks.md)
* [Create a drillthrough button](desktop-drill-through-buttons.md)

