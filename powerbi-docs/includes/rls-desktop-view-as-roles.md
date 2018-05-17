## Validating the role within Power BI Desktop
After you have created your role, you can test the results of the role within Power BI Desktop. To do this, select **View As Roles**.

![](./media/rls-desktop-view-as-roles/powerbi-desktop-rls-view-as-roles.png)

The **View as roles** dialog lets you change the view of what you're seeing for that specific user or role. You can see the roles you've created.

![](./media/rls-desktop-view-as-roles/powerbi-desktop-rls-view-as-roles-dialog.png)

Select the role you created and then select **OK** to apply that role to what you're viewing. The reports only render the data relevant for that role.

You can also select **Other user** and supply a given user. It is best to supply the User Principal Name (UPN) as that is what the Power BI service uses. Select **OK** and the reports render based on what that user can see. 

![](./media/rls-desktop-view-as-roles/powerbi-desktop-rls-other-user.png)

> [!NOTE]
> Within Power BI Desktop, this only displays different results if you are using dynamic security based on your DAX expressions.
> 
> 

