## FAQ
**Question:** What if I had previously created roles and rules for a dataset in the Power BI service? Will they still work if I do nothing?  
**Answer:** No. Visuals will not render properly. You will have to re-create the roles and rules within Power BI Desktop and then publish to the Power BI service.

**Question:** Can I create these roles for Analysis Services data sources?  
**Answer:** You can if you imported the data into Power BI Desktop. If you are using a live connection, you will not be able to configure RLS within the Power BI service. This is defined within the Analysis Services model on-premises.

**Question:** Can I use RLS to limit the columns or measures accessible by my users?  
**Answer:** No. If a user has access to a particular row of data, they can see all the columns of data for that row.

**Question:** Does RLS let me hide detailed data but give access to data summarized in visuals?  
**Answer:** No, you secure individual rows of data but users can always see either the details or the summarized data.

