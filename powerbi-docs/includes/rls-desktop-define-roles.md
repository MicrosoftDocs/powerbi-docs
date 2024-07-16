## Define roles and rules in Power BI Desktop

You can define roles and rules within Power BI Desktop. With this editor, you can toggle between using the default drop-down interface and a DAX interface.  When you publish to Power BI, you also publish the role definitions.

To define security roles:

1. Import data into your Power BI Desktop report, or configure a DirectQuery connection.

   > [!NOTE]
   > You can't define roles within Power BI Desktop for Analysis Services live connections. You need to do that within the Analysis Services model.

1. From the **Modeling** tab, select **Manage Roles**.

   ![Screenshot of the Modeling tab, highlighting Manage roles.](/power-bi/includes/media/rls-desktop-define-roles/powerbi-desktop-security.png)

1. From the **Manage roles** window, select **New** to create a new role.

   ![Screenshot of the Manage roles window, highlighting create new role button.](/power-bi/includes/media/rls-desktop-define-roles/powerbi-security-newrole.png)

1. Under **Roles**, provide a name for the role and select enter.

    ![Screenshot of the Manage roles window, highlighting renaming a role.](/power-bi/includes/media/rls-desktop-define-roles/powerbi-security-renamerole.png)

   > [!NOTE]
   > You can't define a role with a comma, for example `London,ParisRole`.

1. Under **Select tables**, select the table to which you want to apply a row-level security filter.

1. Under **Filter data**, use the default editor to define your roles. The expressions created return a true or false value.

    ![Screenshot of the Manage roles window default editor for defining row level security.](/power-bi/includes/media/rls-desktop-define-roles/powerbi-security-defaulteditor.png)

   > [!NOTE]
   > Not all row-level security filters supported in Power BI can be defined using the default editor. Limitations include expressions that today can only be defined using DAX including dynamic rules such as *username()* or *userprincipalname()*. To define roles using these filters switch to use the DAX editor.

1. Optionally select **Switch to DAX editor** to switch to using the DAX editor to define your role. DAX expressions return a value of true or false. For example: ```[Entity ID] = “Value”```. The DAX editor is complete with autocomplete for formulas (intellisense). You can select the checkmark above the expression box to validate the expression and the X button above the expression box to revert changes.

   ![Screenshot of the Manage roles window, highlighting an example DAX expression.](/power-bi/includes/media/rls-desktop-define-roles/powerbi-security-daxeditor.png)

   > [!NOTE]
   > You can use *username()* within this expression. Be aware that *username()* has the format of *DOMAIN\username* within Power BI Desktop. Within the Power BI service and Power BI Report Server, it's in the format of the user's User Principal Name (UPN). Alternatively, you can use *userprincipalname()*, which, for internal users, always returns the user in the format of their user principal name, *username\@contoso.com*. For guest users, *userprincipalname()*, can return a different format than the one displayed on Azure Portal, this depends on the [entity](https://learn.microsoft.com/en-us/azure/active-directory/external-identities/user-properties#identities) of the guest user.

1. You can switch back to the default editor by selecting **Switch to default editor**. All changes made in either editor interface persist when switching interfaces when possible. When defining a role using the DAX editor that can't be defined in the default editor, if you attempt to switch to the default editor you'll be prompted with a warning that switching editors may result in some information being lost. To keep this information, select **Cancel** and continue only editing this role in the DAX editor.

   ![Screenshot of the dialog confirming you would like to switch to the default editor.](/power-bi/includes/media/rls-desktop-define-roles/powerbi-security-switchtodefaulteditor.png)

   > [!NOTE]
   > In this expression box, use commas to separate DAX function arguments even if you're using a locale that normally uses semicolon separators (e.g. French or German).

1. Select **Save**.

You can't assign users to a role within Power BI Desktop. You assign them in the Power BI service. You can enable dynamic security within Power BI Desktop by making use of the *username()* or *userprincipalname()* DAX functions and having the proper relationships configured.