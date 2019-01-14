---
title: Row-level security (RLS) in Power BI Report Server
description: Learn about using row-level security (RLS) in Power BI Report Server. 
author: maggiesMSFT
ms.author: maggies
manager: kfile
ms.reviewer: ''
ms.service: powerbi
ms.component: powerbi-report-server
ms.topic: conceptual
ms.date: 01/11/2019
---

# Row-level security (RLS) in Power BI Report Server

Setting up row-level security (RLS) with Power BI Report Server can restrict data access for given users. Filters restrict data access at the row level, and you can define filters within roles.  If you're using the default permissions in Power BI Report Server, any user with Content Manager permissions for the Power BI Report can assign members to roles for that report.    

You configure RLS for reports imported into Power BI with Power BI Desktop. You can also configure RLS on reports that use DirectQuery, such as SQL Server.  Keep in mind that RLS isn't respected if your DirectQuery connection is using passthrough authentication for users viewing the report. For Analysis Services live connections, you configure row-level security on the on-premises model. The security option doesn't show up for live connection datasets. 

## Define roles and rules within Power BI Desktop 

You define roles and rules within Power BI Desktop. When you publish to Power BI Report Server, it also publishes the role definitions. 

To define security roles, follow these steps.

1. Import data into your Power BI Desktop report, or configure a DirectQuery connection. 

    You can't define roles within Power BI Desktop for Analysis Services live connections. You do that within the Analysis Services model. 

2. On the **Modeling** tab > **Manage Roles**. 

 

3. In the **Manage roles** dialog box, select **Create**. 

 

4. Provide a name for the role. 

5. Select the table you want to apply a DAX rule. 

6. Enter the DAX expressions. This expression should return a true or false. For example: [Entity ID] = “Value”. 

    You can use username() within this expression. Be aware that username() has the format of DOMAIN\username within Power BI Desktop. We recommend you use username() for most RLS scenarios in Power BI Report Server. You can use userprincipalname() instead. It always returns the user in the format of user@contoso.com. 


7. After you've created the DAX expression, select the check mark above the expression box to validate the expression. 



8. Select Save. 

You can't assign users to a role within Power BI Desktop. You assign users in Power BI Report Server. You can enable dynamic security within Power BI Desktop by using the username()or userprincipalname() DAX functions and configuring the proper relationships. 

## Bidirectional cross-filtering

By default, row-level security filtering uses single-directional filters, regardless of whether the relationships are set to single direction or bidirectional. You can manually enable bidirectional cross-filter with row-level security.

- Select the relationship and check the **Apply security filter in both directions** checkbox. 

Check this box when implementing [dynamic row-level security](https://docs.microsoft.com/sql/analysis-services/supplemental-lesson-implement-dynamic-security-by-using-row-filters) based on user name or login ID. 

To learn more, see [Bidirectional cross-filtering using DirectQuery in Power BI Desktop](../desktop-bidirectional-filtering.md) and the [Securing the Tabular BI Semantic Model](http://download.microsoft.com/download/D/2/0/D20E1C5F-72EA-4505-9F26-FEF9550EFD44/Securing%20the%20Tabular%20BI%20Semantic%20Model.docx) technical whitepaper.

 

## Validating the role within Power BI Desktop 

After you've created your role, test the results of the role within Power BI Desktop.

1. Select **View As Roles**. 

 
    In the **View as roles** dialog box, you see the roles you've created.
 

3. Select the role you created > **OK** to apply that role. The report renders the data relevant for that role. 

4. You can also select **Other user** and supply a given user. It is best to supply the Username, as that's what Power BI Report Server uses. 
5. Select **OK** and the report renders based on what that user can see. 

 

 

Within Power BI Desktop, **Other user** only displays different results if you're using dynamic security based on your DAX expressions. 



## Add members to roles 

After you save your report in Power BI Report Server, you manage security and add or remove members on the server. Only Content Managers of the report have the row-level security option available and not greyed out. If the report doesn't have the roles it needs, you need to open it in Power BI Desktop, add or modify roles, then save it to Power BI Report Server again. 

1. In Power BI Desktop, save the report to Power BI Report Server. You need to be using the version of Power BI Desktop optimized for Power BI Report Server.
2. In Power BI Report Service, select the ellipsis (**…**) next to the report. 

3. Select **Manage**. 

4. Select **Row-level security**. 

    On the RLS page, you add members to a role you created in Power BI Desktop.

5. To add a member, select **Add Member**.
6. Enter the user or group in the text box in the Username format (DOMAIN\user) and select the roles you wish to assign to them. The member has to be within your organization.   
7. Click **OK** to apply.   

8. To remove members, check the box next to their names and select **Delete**.  You can delete multiple members at a time. 



## Using the username() or userprincipalname() DAX function 

You can take advantage of the DAX functions username() or userprincipalname() within your dataset. You can use them within expressions in Power BI Desktop. When you publish your model, Power BI Report Server uses those expressions. 

If you're using Windows Authentication in Power BI Desktop OR Power BI Report Server, username() returns a user in the format of DOMAIN\User and userprincipalname() returns a user in the format of user@contoso.com. 

If you're using custom authentication in Power BI Report Server, it returns the username format you’ve setup for users.  

## Limitations 

Following is a list of the current limitations for row-level security on Power BI models. 

You can define RLS only on the datasets created with Power BI Desktop. If you want to enable RLS for datasets created with Excel, you must convert your files into Power BI Desktop (PBIX) files first. Learn more 

Only ETL and DirectQuery connections using stored credentials are supported. Live connections to Analysis Services and DirectQuery connections using passthrough authentication are handled in the underlying data source. 

Report authors don't have access to view the report data in Power BI Report Server until they've assigned themselves roles accordingly after uploading the report. 

 

## FAQ 

Question: Can I create these roles for Analysis Services data sources? 
Answer: You can if you imported the data into Power BI Desktop. If you're using a live connection, you can't configure RLS within the Power BI service. RLS is defined within the Analysis Services model on-premises. 

Question: Can I use RLS to limit the columns or measures accessible by my users? 
Answer: No. If a user has access to a particular row of data, they can see all the columns of data for that row. 

Question: Does RLS let me hide detailed data but give access to data summarized in visuals? 
Answer: No, you secure individual rows of data but users can always see either the details or the summarized data. 

Question: Can I add new roles in Power BI Desktop if I already have existing roles defined and members assigned in Power BI Report Server? 
Answer: Yes, your current assignments aren't affected if you make additional roles and republish your report. 

 

## Next steps

[What is Power BI Report Server?](get-started.md) 
[Administrator handbook](admin-handbook-overview.md)  
[Install Power BI Report Server](install-report-server.md)  
[Download Report Builder](https://www.microsoft.com/download/details.aspx?id=53613)  
[Download SQL Server Data Tools (SSDT)](http://go.microsoft.com/fwlink/?LinkID=616714)

More questions? [Try asking the Power BI Community](https://community.powerbi.com/)