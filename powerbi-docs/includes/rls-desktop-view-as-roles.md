## Validate the role within Power BI Desktop
After you've created your role, test the results of the role within Power BI Desktop.

1. Select **View As Roles**. 

    ![](./media/rls-desktop-view-as-roles/powerbi-desktop-rls-view-as-roles.png)

    In **View as roles**, you see the roles you've created.

    ![](./media/rls-desktop-view-as-roles/powerbi-desktop-rls-view-as-roles-dialog.png)

3. Select the role you created > **OK** to apply that role. The report renders the data relevant for that role. 

4. You can also select **Other user** and supply a given user. It's best to supply the User Principal Name (UPN) as that's what the Power BI service and Power BI Report Server use.

    ![](./media/rls-desktop-view-as-roles/powerbi-desktop-rls-other-user.png)

1. Select **OK** and the report renders based on what that user can see. 

Within Power BI Desktop, **Other user** only displays different results if you're using dynamic security based on your DAX expressions. 

