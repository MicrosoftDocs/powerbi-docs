## Validate the roles within Power BI Desktop

After you've created your roles, test the results of the roles within Power BI Desktop.

1. From the **Modeling** tab, select **View as**.

    ![Screenshot of the Modeling tab, highlighting View as.](/power-bi/includes/media/rls-desktop-view-as-roles/powerbi-desktop-rls-view-as-roles.png)

    The **View as roles** window appears, where you see the roles you've created.

    ![Screenshot of the View as roles window with None selected.](/power-bi/includes/media/rls-desktop-view-as-roles/powerbi-desktop-rls-view-as-roles-dialog.png)

1. Select a role you created. Then choose **OK** to apply that role.

   The report renders the data relevant for that role.

1. You can also select **Other user** and supply a given user.

    ![Screenshot of the View as roles window with an example user entered.](/power-bi/includes/media/rls-desktop-view-as-roles/powerbi-desktop-rls-other-user.png)

   It's best to supply the User Principal Name (UPN) because that's what the Power BI service and Power BI Report Server use.

   Within Power BI Desktop, **Other user** displays different results only if you're using dynamic security based on your DAX expressions. In this case, you need to include the username as well as the role.

1. Select **OK**.

   The report renders based on what the RLS filters allow the user to see.

   > [!NOTE]
   > The **View as roles** feature doesn't work for DirectQuery models with Single Sign-On (SSO) enabled.
