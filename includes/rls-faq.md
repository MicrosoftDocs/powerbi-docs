## FAQ

**Question:** What if I had previously created roles/rules for a dataset in the Power BI service? Will they still work if I do nothing?
**Answer:** No. Visuals will not render properly. You will have to re-create the roles/rules within Power BI Desktop and then published to the Power BI service.

**Question:** What is the difference between using *userprincipalname()* versus *username()*?
**Answer:** The difference is really on the Power BI Desktop side. From your workstation, username() will return in a *DOMAIN\User* format whereas *userprincipalname()* will return something that looks like an email address. *Userprincipalname()* is good to use if you want to test what the results will look like for a given Power BI login.

**Question:** Can I creates these roles for Analysis Services data sources?
**Answer:** You can if you imported the data into Power BI Desktop. If you are using a live connection, you will not be able to configure RLS within the Power BI service. This is defined within the Analysis Services model on-premises.
