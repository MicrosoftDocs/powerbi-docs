## Using the username() or userprincipalname() DAX function

You can take advantage of the DAX functions *username()* and *userprincipalname()* within your dataset. You can use it within expressions in Power BI Desktop. When you publish your model, it will be used within the Power BI service.

Within Power BI Desktop, *username()* will return a user in the format of *DOMAIN\User*. It is recommended to use *userprincipalname()* instead, as the value will be in the same format.

Within the Power BI service, both *username()* and *userprincipalname()* will return the user's User Principal Name (UPN). This looks similar to an email address.