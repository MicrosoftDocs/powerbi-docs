Anaplan Connector Power BI Desktop
==================================

The Anaplan Connector for Power BI Desktop enables access to your Anaplan model exports. 

*   The connector runs via Anaplan public data integration APIs
*   The connector lets you load export actions saved in your Anaplan models, directly into Power BI
*   Your Anaplan models, except those you archived, display in the Power BI desktop

Anaplan connector for Power BI Desktop is in early access (EA), and is only available to participants of the EA program.

Find out more about early access or how to register your interest in our current EA programs.

You authenticate within the Anaplan connector to run and load your export.  
There are [system requirements](https://www.microsoft.com/en-us/download/details.aspx?id=58494 "System Requirements") to verify before you install the Microsoft Power BI Desktop. 

  

  

Set File Options to enable the connector
========================================

Set the PowerBI security File Options so that third party software is enabled.

Anaplan connector for Power BI Desktop is in early access (EA), and is only available to participants of the EA program.

Find out more about early access or how to register your interest in our current EA programs.

To get started, you need to have Power BI Desktop installed.  
To set the File Options:

1.  Open Power BI Desktop. 
2.  Go to the **File** drop-down menu and select **Options.** 

![Options and settings for Power BI.](https://preview-assets-us-01.kc-usercontent.com:443/cddce937-cf5a-003a-bfad-78b8fc29ea3f/38ff72e9-5801-40c6-befe-86e803cf8222/Options-and-settings.png)

The **Options** dialog displays.

![File Options enable the Connector.](https://preview-assets-us-01.kc-usercontent.com:443/cddce937-cf5a-003a-bfad-78b8fc29ea3f/dc1c7941-48c2-49e6-984a-37d76dedfe2d/File-Options-Connector-enable.png)

*   Select (**Not Recommended**) **Allow any extension to load without validation or warning**.

This enables the Anaplan Connector.  

Get data
========

Once you've authenticated with the connector, you can access your saved exports within Anaplan.    
**Note**: The Power BI data preview only displays data from your temporary export file from Anaplan. If your temporary export file is deleted, the preview is blank. You can see the data within preview screen once you run, or repeat, the export action.

Anaplan connector for Power BI Desktop is in early access (EA), and is only available to participants of the EA program.

Find out more about early access or how to register your interest in our current EA programs.

To access your saved export from the Power BI desktop, you **Get data**.

1.  Select **Get data** from the ribbon menu.  
    The **Get data** dialog displays. 

![Get data and dropdown.](https://preview-assets-us-01.kc-usercontent.com:443/cddce937-cf5a-003a-bfad-78b8fc29ea3f/a0c31347-fb4d-4df5-83a3-e8d0f3ffa144/Get-data-more.png)

1.  Click **More** from the dropdown.  
    A new window appears. 
2.  Type Anaplan into the blank field  
    The **Anaplan Connector v.1.0 (Beta)** displays.
3.  Select  **Anaplan Connector v.1.0 (Beta)**.

![Anaplan-Connector-beta.](https://preview-assets-us-01.kc-usercontent.com:443/cddce937-cf5a-003a-bfad-78b8fc29ea3f/4911c385-e11e-4afe-b3b4-71e9f18a3875/Connector-Beta.png)

1.  Click **Connect**.  
    A message displays. 

![Warning for 3rd-party Connector.](https://preview-assets-us-01.kc-usercontent.com:443/cddce937-cf5a-003a-bfad-78b8fc29ea3f/94ad562d-3e64-437c-a097-34698064466b/3rd-party-connector.PNG)

1.  Click **Continue**.  
    You should not receive this warning again until you upgrade Power BI Desktop.

  

  

Configure the Connector
=======================

Configure the connector once you've enabled it. This step allows you to connect via Anaplan APIs. 

Anaplan connector for Power BI Desktop is in early access (EA), and is only available to participants of the EA program.

Find out more about early access or how to register your interest in our current EA programs.

After you authenticate, you set how to configure your connection from your Anaplan models to Power BI.

The **Anaplan Connection Configuration** dialog displays.

![Connection Configuration.](https://preview-assets-us-01.kc-usercontent.com:443/cddce937-cf5a-003a-bfad-78b8fc29ea3f/f8db985b-d21d-4c68-bd45-3082cdf9ce12/Connection-Configuration.png)

Enter the API and Authentication URLs:

**Anaplan API URL**

https://api.anaplan.com

**Anaplan Auth URL**

https://auth.anaplan.com 

  

  

Log in to the connector
=======================

Log in to the connector to verify your access to an Anaplan workspace.

Anaplan connector for Power BI Desktop is in early access (EA), and is only available to participants of the EA program.

Find out more about early access or how to register your interest in our current EA programs.

Once you've configured the connection, you need to log in.

1.  Verify your Anaplan credentials  
    The **Anaplan Connector** login displays. 
2.  Enter your **User name**
3.  Enter your **Password**
4.  Click **Connect**

![ID and password dialog.](https://preview-assets-us-01.kc-usercontent.com:443/cddce937-cf5a-003a-bfad-78b8fc29ea3f/8d7f8f1f-3d07-4a57-aa7a-b55630e568bf/Your-id.png)

  

Run an export action
====================

Anaplan connector for Power BI leverages export actions to download data from your Anaplan model. Ensure that you have an export action set. The Navigator step is where you load and run your saved export actions. 

Anaplan connector for Power BI Desktop is in early access (EA), and is only available to participants of the EA program.

Find out more about early access or how to register your interest in our current EA programs.

When you run an export action:

*   Only exports that output .csv and .txt files are supported.
*   With every export action run, you need to wait 10 minutes to repeat the same export action. The time is calculated from one export run completion until the next export run begins. The 10 minute wait does not apply to different exports.
*   If you do not see the export action in the Power BI connector, check your Role and the export actions in your model.

To run an export action, use the **Navigator** dialog to locate your export.

![Run Export Action and Load.](https://preview-assets-us-01.kc-usercontent.com:443/cddce937-cf5a-003a-bfad-78b8fc29ea3f/fd245739-4a34-4433-8e3e-eaed27d4d4cf/Export-load.png)

1.  Search your Anaplan models to find and set your export.  
    Click the white chevron, it expands to a drop-down list.  
    You can also locate for your model name via the search field.
2.  Check the box next to **ƒx Run Export Action** to select your export.  
    **Notes**: 
    *   When you select the **ƒx Run Export Action**, this does not trigger the export run. Instead this selection downloads the last version of the exported Anaplan data for preview.
    *   A preview displays in the right panel. If the Anaplan export is set to **Admins only**, model users may see a blank preview, but the export will run as normal. 
    *   You'll see the preview the next time you set an integration with same export. 
    *   See About Default Import and Export files.
3.  Click **Load**. This triggers the export run.

  
The **Load** dialog displays. 

![Load dialog for data.](https://preview-assets-us-01.kc-usercontent.com:443/cddce937-cf5a-003a-bfad-78b8fc29ea3f/d2e8b066-6b57-4f3e-b60c-be2ac72aad9b/Data-load-dialog.png)

Your data loads.

Manage your data
================

Once your data loads into the Power BI Desktop, you can perform data visualizations.

Anaplan connector for Power BI Desktop is in early access (EA), and is only available to participants of the EA program.

Find out more about early access or how to register your interest in our current EA programs.

[_How to make the most of data visualization_](https://powerbi.microsoft.com/en-us/data-visualization/ "How to make the most of data visualization") helps you to select **Columns**, apply **Filters**, perform **Visualizations**, and **Publish**.

![Data and tables.](https://preview-assets-us-01.kc-usercontent.com:443/cddce937-cf5a-003a-bfad-78b8fc29ea3f/6ebf06a2-cdb5-4dfb-9d1b-c4f88c799776/Data-and-tables.png)

  

  

Common errors and solutions
===========================

You may get error messages. Here are some common scenarios and steps for resolution.

Anaplan connector for Power BI Desktop is in early access (EA), and is only available to participants of the EA program.

Find out more about early access or how to register your interest in our current EA programs.

If you get an error message, click the Refresh icon. This usually resolves the error.  
Common error scenarios are:

**(1)** Credential error in the Navigator

*   Clear cache within Power BI (**File**\>**options**\>**clear cache)** and restart the connector, or
*   Click **Cancel** and select **Refresh** (top right).

![Authentication error.](https://preview-assets-us-01.kc-usercontent.com:443/cddce937-cf5a-003a-bfad-78b8fc29ea3f/fa59c069-e970-4864-9e14-952a7c5e3f28/auth-cred-error.2.png)

  

If you still receive a credential error after you clear cache, also clear your recent sources. 

*   Select **Recent sources**

![Select recent sources.](https://preview-assets-us-01.kc-usercontent.com:443/cddce937-cf5a-003a-bfad-78b8fc29ea3f/e9151dbc-0dea-4d99-97ed-de04b04a5623/Recent-sources-1.png)

*   Select **Remove from list**

![Remove source from list.](https://preview-assets-us-01.kc-usercontent.com:443/cddce937-cf5a-003a-bfad-78b8fc29ea3f/ab64c9a3-1526-4b59-a897-ff617f31032e/Recent-sources-2.png)

Establish the connection to the export again, and your data refreshes.

  
**(2)** Credential error in the [Power Query Editor](https://docs.microsoft.com/en-us/power-query/power-query-quickstart-using-power-bi "Power Query"), or an error when you reopen a Power BI report or edit a prior data set

*   Click **Close & Apply** or **Refresh Preview** 

![Power query error.](https://preview-assets-us-01.kc-usercontent.com:443/cddce937-cf5a-003a-bfad-78b8fc29ea3f/5bc46bb5-843c-40bb-ae5d-f52eed51f9c4/Power-query-error.png)

Your data refreshes.

![Close & Apply and Refresh Preview icons.](https://preview-assets-us-01.kc-usercontent.com:443/cddce937-cf5a-003a-bfad-78b8fc29ea3f/153e8ab2-28ca-4021-872a-e85f1c50c1bd/Power-query-solution.png)

**  
(3)** Power Query [Expression](https://docs.microsoft.com/en-us/powerquery-m/expression-functions "Power Query Expression") error

*   Click **Refresh Preview**

![Power Query error Key and Table.](https://preview-assets-us-01.kc-usercontent.com:443/cddce937-cf5a-003a-bfad-78b8fc29ea3f/eb19585d-46a4-48dc-901d-6c7af89e5916/Expression-error.png)

The first [1,000 rows](https://community.powerbi.com/t5/Desktop/Limit-of-1000-value-reached/td-p/368850 "first 1,000 rows of data") of data display. 

![Refresh preview.](https://preview-assets-us-01.kc-usercontent.com:443/cddce937-cf5a-003a-bfad-78b8fc29ea3f/dba42050-d209-4acf-8215-0d59b44188e6/Refresh-preview.png)
