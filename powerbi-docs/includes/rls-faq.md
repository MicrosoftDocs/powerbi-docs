## FAQ
**Question:** What if I had previously created roles and rules for a dataset in the Power BI service? Will they still work if I do nothing?  
**Answer:** No, visuals will not render properly. You will have to re-create the roles and rules within Power BI Desktop and then publish to the Power BI service.

**Question:** Can I create these roles for Analysis Services data sources?  
**Answer:** You can if you imported the data into Power BI Desktop. If you are using a live connection, you will not be able to configure RLS within the Power BI service. This is defined within the Analysis Services model on-premises.

**Question:** Can I use RLS to limit the columns or measures accessible by my users?  
**Answer:** No, if a user has access to a particular row of data, they can see all the columns of data for that row.

**Question:** Does RLS let me hide detailed data but give access to data summarized in visuals?  
**Answer:** No, you secure individual rows of data but users can always see either the details or the summarized data.

**Question:** My data source already has security roles defined (for example SQL Server roles or SAP BW roles). What is the relationship between these and RLS?  
**Answer:** If you are importing data into your Power BI dataset you'll need to define RLS to represent the security rules that should be applied when users connect. If you are using DirectQuery the security roles in your data source are still respected; when a user opens the Power BI report a query is sent to the underlying data source which applies security rules to the data based on the user's credentials.
