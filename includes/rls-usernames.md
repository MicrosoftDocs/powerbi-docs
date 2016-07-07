## Using the username() DAX function

You can take advantage of the DAX function *username()* within your dataset. You can use it within expressions in Power BI Desktop. When you publish your model, it will be used within the Power BI service.

Within Power BI Desktop, *username()* will return a user in the format of *DOMAIN\User*.

Within the Power BI service, *username()* will return the user's User Principal Name (UPN). This looks similar to an email address.