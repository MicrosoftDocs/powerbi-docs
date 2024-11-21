## FAQ

**Question:** What if I have previously created roles and rules for a dataset in the Power BI service? Do they still work if I do nothing?  
**Answer:** No, visuals won't render properly. You have to re-create the roles and rules within Power BI Desktop and then publish to the Power BI service.

**Question:** Can I create these roles for Analysis Services data sources?  
**Answer:** Yes, if you imported the data into Power BI Desktop. If you're using a live connection, you can't configure RLS within the Power BI service. You define RLS in the Analysis Services model on-premises.

**Question:** Can I use RLS to limit the columns or measures accessible by my users?  
**Answer:** No, if a user has access to a particular row of data, they can see all the columns of data for that row. To restrict access to columns and column metadata, consider using [object-level security](/fabric/security/service-admin-object-level-security).

**Question:** Does RLS let me hide detailed data but give access to data summarized in visuals?  
**Answer:** No, you secure individual rows of data, but users can always see either the details or the summarized data.

**Question:** My data source already has security roles defined (for example SQL Server roles or SAP BW roles). What's the relationship between these roles and RLS?  
**Answer:** The answer depends on whether you're importing data or using DirectQuery. If you're importing data into your Power BI dataset, the security roles in your data source aren't used. In this case, you should define RLS to enforce security rules for users who connect in Power BI. If you're using DirectQuery, the security roles in your data source are used. When a user opens a report, Power BI sends a query to the underlying data source, which applies security rules to the data based on the user's credentials.

**Question:** Can a user belong to more than one role?  
**Answer:** A user can belong to multiple roles, and the roles are additive. For example, if a user belongs to both the "Sales" and "Marketing" roles, they can see data for both these roles.
