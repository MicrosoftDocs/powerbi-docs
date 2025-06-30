## Using the username() or userprincipalname() DAX function
You can take advantage of the DAX functions *username()* or *userprincipalname()* within your dataset. You can use them within expressions in Power BI Desktop. When you publish your model, it will be used within the Power BI service.

Within Power BI Desktop, *username()* will return a user in the format of *DOMAIN\User* and *userprincipalname()* will return a user in the format of <em>user@contoso.com</em>.

Within the Power BI service, *username()* and *userprincipalname()* will both return the user's User Principal Name (UPN). This looks similar to an email address.

