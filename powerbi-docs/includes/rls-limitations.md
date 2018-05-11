## Limitations
Following is a list of the current limitations for row-level security on cloud models.

* If you previously had roles and rules defined within the Power BI service, you will need to recreate them within Power BI Desktop.
* You can define RLS only on the datasets created using Power BI Desktop client. If you want to enable RLS for datasets created with Excel, you will need to convert your files into PBIX files first. [Learn more](../desktop-import-excel-workbooks.md)
* Only ETL and DirectQuery connections are supported. Live connections to Analysis Services are handled in the on-premises model.
* Q&A and Cortana is not supported with RLS at this time. You will not see the Q&A input box for dashboards if all models have RLS configured. This is on the roadmap, but a timeline is not available.
* External sharing is not currently supported with datasets that use RLS.
* For any given model, the maximum number of Azure AD principals (that is, individual users or security groups) that can be assigned to security roles is 1,000. To assign large numbers of users to roles, be sure to assign security groups, rather than individual users.

## Known issues
There is a known issue where an error message results when trying to publish from Power BI Desktop if it was previously published. The scenario is as follows.

1. Anna has a dataset that is publised to the Power BI service and has configured RLS.
2. Anna updates the report in Power BI Desktop and re-publishes.
3. Anna receives an error.

**Workaround:** Re-publish the Power BI Desktop file from the Power BI service until this issue is resolved. You can do that by selecting **Get Data** > **Files**. 

