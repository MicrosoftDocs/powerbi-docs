---
title: Create a report quickly from a SharePoint list in the Power BI service
description: There's a new way to create reports quickly from data in SharePoint lists. Power BI automatically generates the visuals for you.    
author: maggiesMSFT
ms.author: maggies
ms.reviewer: ''
ms.service: powerbi
ms.subservice: pbi-reports-dashboards
ms.topic: how-to
ms.date: 11/15/2021
LocalizationGroup: Reports
---
# Create a report quickly from a SharePoint list in the Power BI service

There's a new way to create reports quickly in the Power BI service from data in SharePoint lists. Power BI automatically generates the visuals for you. SharePoint list and Microsoft List users can explore their list data with just a few clicks.

:::image type="content" source="media/service-quick-create-sharepoint-list/sharepoint-quick-report.png" alt-text="Screenshot of Create a quick report from a SharePoint list.":::

New to creating in Power BI? Try reading [Reports in Power BI](../consumer/end-user-reports.md) for some quick background information.

If you use Power BI Desktop, you can also [create a report on a SharePoint List in Power BI Desktop](../connect-data/desktop-sharepoint-online-list.md).

## Video 

In this video, watch Amanda demo creating a report from a SharePoint list in the Power BI service.

> [!VIDEO https://www.microsoft.com/videoplayer/embed/RWOzjW]

## Visualize in Power BI 

1. In SharePoint, select **Integrate** > **Power BI** > **Visualize the list**.

    :::image type="content" source="media/service-quick-create-sharepoint-list/sharepoint-quick-visualize-list.png" alt-text="Screenshot of Select Power BI, Visualize in Power BI.":::

    A new browser tab opens with an automatically generated report with two measures, shown as rows in the report, and three categories, shown as bar charts in the report. Currently you can add a maximum of three measures and four categories. 

2. Changing the data you see in the report is easy. In the **Summarize** pane, add or remove fields from the report. Select and unselect fields to update what you want to measure and analyze. Power BI automatically adds or removes charts to show the new combinations.  

    :::image type="content" source="media/service-quick-create-sharepoint-list/sharepoint-quick-add-charts.png" alt-text="Screenshot of Add more charts and make other changes.":::

3. To see a field summarized in a different way, use the context menu of the field in the **Summarize** pane to switch between sum, average, maximum, minimum, and so on. 

    :::image type="content" source="media/service-quick-create-sharepoint-list/sharepoint-quick-summarize-options.png" alt-text="Screenshot of Change the summarization for the charts.":::

4. (optional) To switch to a full edit experience, select the **Edit** button in the menu bar.

    :::image type="content" source="media/service-quick-create-sharepoint-list/sharepoint-quick-edit.png" alt-text="Screenshot of Select the Edit button for the full edit experience.":::

    Be aware though, that once you save the report in the full edit experience, you can't go back to the quick edit view. Power BI reminds you of this when you select **Edit**.  

    :::image type="content" source="media/service-quick-create-sharepoint-list/sharepoint-quick-switch-to-edit-mode.png" alt-text="Screenshot of Switch to Edit mode from Quick Create mode.":::

## Publish the report

To share the insights you find with others on your team, you can publish the report back to the list using the **Publish to the list** button in the app bar.  

:::image type="content" source="media/service-quick-create-sharepoint-list/sharepoint-quick-publish-button.png" alt-text="Screenshot of Select the Publish to the list button.":::

Name your report and confirm you’re ready to publish back to the list. Once it's published, everyone who has access to the list can open the report, and see all the data in the report. Learn more about [list permissions in SharePoint Server](/sharepoint/sites/user-permissions-and-permission-levels#list-permissions).

The reports you share in this way aren't visible in the Power BI service. Instead, to make it easy for other list users to find, these published reports are on the same **Integrate** menu of the list.  

:::image type="content" source="media/service-quick-create-sharepoint-list/sharepoint-quick-view-report.png" alt-text="Screenshot of Report on the Integrate Power BI menu.":::

If you make changes to the report, use **Publish to the list** again to save your changes. Use the **Delete** button to remove the report from the list for everyone.

## Refresh visuals

The data in the report will update regularly to stay in sync with the list. After a refresh, use the **Refresh visuals** button in the ribbon to update the visuals. 

:::image type="content" source="media/service-quick-create-sharepoint-list/sharepoint-quick-refresh-visuals.png" alt-text="Screenshot of Refresh the visuals in the report.":::

## Licenses

Anyone can use the **Visualize the list** feature to explore their list data, but to enter the full edit experience, publish reports, access reports that others have published, or delete reports, you need a Power BI Pro license. If you don’t currently have a Pro license, you can [buy a Power BI Pro license or start a free trial](../fundamentals/service-self-service-signup-purchase-for-power-bi.md).  

## Known issues and limitations

- The first time you visualize a list, creating the dataset and report can take some time. We’re working to improve the end-to-end performance of this experience. 
- Currently, some complex column types in SharePoint will show up as [Record]s or [List]s within the report. We’re working on updating the experience so these column values match what you see in the list.  
- Data refresh is limited to once every 3 hours. If the list has been updated with new data or metadata, such as an updated list name, after the most recent data refresh, these changes will not be reflected in the report until the next refresh.
- This feature isn't supported for guest users in a tenant.

## Troubleshooting

If you don't see **Power BI** on the **Integrate** menu in a SharePoint or Microsoft list, your Power BI admin may have disabled it for specific groups or your entire organization. See the [Integration with SharePoint and Microsoft Lists](../admin/service-admin-portal.md#integration-with-sharepoint-and-microsoft-lists) section of the "Power BI admin portal" article for details.

## Next steps

As we continue expanding our experience to quickly explore your data, we’d love to hear your thoughts and feedback! Let us know what you’d like to see added to this experience or where’d you like to see us integrate next.

- [Create quick reports in the Power BI service](service-quick-create-report.md)
- [Create a report on a SharePoint List in Power BI Desktop](../connect-data/desktop-sharepoint-online-list.md)
- More questions? [Try the Power BI Community](https://community.powerbi.com/)
