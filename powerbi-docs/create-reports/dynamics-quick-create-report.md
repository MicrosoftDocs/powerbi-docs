---
title: Visualize your data quickly from Power Apps and Dynamics 365 apps (preview)
description: There's a new way to create reports quickly in the Power BI service. Paste data straight into Power BI on the web, and Power BI automatically generates visuals for you.  
author: maggiesMSFT
ms.author: maggies
ms.reviewer: ''
ms.service: powerbi
ms.subservice: pbi-reports-dashboards
ms.topic: how-to
ms.date: 11/12/2021
LocalizationGroup: Reports
---
# Visualize your data quickly from Power Apps and Dynamics 365 apps (preview) 

There's a new way to visualize your model-driven Power Apps and Dynamics 365 data stored within Dataverse. With a single click, Power BI will automatically generate a set of visuals for you to explore and find insights within your data. 

:::image type="content" source="media/service-quick-create-report/quick-summary-report.png" alt-text="Screenshot of the automatically generated report.":::

## Visualize a view
1.	In your model-driven Power App or Dynamics 365 app, select the **Visualize this view** button in the app bar of any grid view. 

    :::image type="content" source="media/service-quick-create-report/visualize-view-button.png" alt-text="Screenshot of the visualize this view button."::: 

    A dialog opens with an automatically generated report with a few fields selected for you in the **Your data** pane on the right. The visuals within the report will use some or all of your selected fields and potentially other fields from the table that work well with chosen fields.
2.	Changing the data you see in the report is easy. In the **Your data** pane, add or remove fields that you’re interested in visualizing. The selected fields are then used as ‘hints’ to the algorithm generating the visuals. Power BI automatically adds or removes charts to show new visuals. 

    :::image type="content" source="media/service-quick-create-report/changing-the-report.png" alt-text="Screenshot of an updated report after selecting a field."::: 
3. To see a field summarized in a different way, use the context menu of the field in the **Your data** pane to switch between sum, average, maximum, minimum, and so on. 

    :::image type="content" source="media/service-quick-create-report/changing-aggregations.png" alt-text="Screenshot of the menu to change aggregations of a field."::: 
4. If you want to personalize a specific visual further, especially if you just want to tweak it slightly, use the **Personalize this visual** option found on the top right when hovering over a visual. Read [what report users can change](power-bi-personalize-visuals.md#what-report-users-can-change), to see the full list of customization available through this experience. 

    :::image type="content" source="media/service-quick-create-report/personalize-visual.png" alt-text="Screenshot of the personalize this visual feature."::: 
5. If you want to see all the rows of data Power BI is visualizing, select the **Show data table** button on the top left.  

    :::image type="content" source="media/service-quick-create-report/show-data-table.png" alt-text="Screenshot of the show table button in the app bar.":::  

    This shows the full table of data on the bottom of the report. Select the **Hide data table** button to hide the table again.    

    :::image type="content" source="media/service-quick-create-report/data-table-shown.png" alt-text="Screenshot of the table visual at the bottom of the report and the hide data table option in the app bar.":::   

## Filter the original view for in-depth exploration 
The data being visualized within the report is always based on the data currently in the view’s grid. This means if you've applied any filters to the grid, that filtered data will be used in the Power BI visuals. For example, if the view is filtered down to just 15 rows of data, only 15 rows will be visualized through Power BI.    

:::image type="content" source="media/service-quick-create-report/filtered-view.png" alt-text="Screenshot of a view in Dynamics 365 filtered down to 15 rows.":::       

This makes it very easy to iteratively explore your data, jumping back and forth between filtering in the grid and visualizing with Power BI, until you find the insights you’re looking for. 

## Enable this feature for your app

This feature is currently in preview, so for the Visualize the list feature to show in your apps, it needs to be enabled by admins in the Power Apps Maker portal. You’ll find the option within the **Settings** dialog under **Features**. Read about [configuring app properties](https://docs.microsoft.com/powerapps/maker/model-driven-apps/create-model-driven-app#configure-app-properties) within the Power Apps Maker portal to learn more.      

:::image type="content" source="media/service-quick-create-report/power-apps-setting.png" alt-text="Screenshot of the setting to enable this feature in the Power Apps maker portal.":::

## Known issues and limitations

- Currently, the visuals generated from this flow can only be used for personal exploration. You can't share or save them.
- Column display names aren't used within the report. You’ll see the system names in the resulting visuals.
- You may notice more columns within the report than you see in the original view. These fields could include foreign keys for the columns or hierarchy, or URL fields that are being used within the original view for purposes other than columns. 
- The report created through this feature is temporary, so the experience times out after a set amount of time. At that point you need to close and reopen the report to continue exploring your data. For now, the timeout occurs at one hour, but that will increase in future updates. 

## Next steps

* [Create quick reports in the Power BI service](service-quick-create-report.md)
* [Create a report quickly from a SharePoint list in the Power BI service](service-quick-create-sharepoint-list.md)
* More questions? [Try the Power BI Community](https://community.powerbi.com/)
