---
title: Share Power BI reports and dashboards with coworkers and others
description: How to share Power BI reports and dashboards with colleagues in and out of your organization, and what you need to know about sharing.
author: maggiesMSFT
ms.author: maggies
ms.reviewer: lukaszp
ms.custom: contperf-fy20q4
ms.service: powerbi
ms.subservice: pbi-collaborate-share
ms.topic: how-to
ms.date: 04/02/2021
LocalizationGroup: Share your work
---
# Share Power BI reports and dashboards with coworkers and others
*Sharing* is the easiest way to give people access to your reports and dashboards in the Power BI service. You can share with people inside or outside your organization.

When you share a report or dashboard, the people you share it with can view it and interact with it but can't edit it. They see the same data that you see in the reports and dashboards and get access to the entire underlying dataset unless row-level security (RLS) is applied to the underlying dataset.  The coworkers you share with can also share with their coworkers if you allow them to.

![Share icon for a report](https://user-images.githubusercontent.com/47899466/114593263-be54ca80-9c40-11eb-9e40-47bfb2859b75.png)

You can share reports and dashboards from many places in the Power BI service: Favorites, Recent, My Workspace. You can share from other workspaces, too, if you have the [Admin, Member, or Contributor role](service-new-workspaces.md#roles-in-the-new-workspaces) in the workspace. And you can share reports and dashboards in Shared with me if the owner allows it. 

The Power BI service offers other ways to collaborate and distribute reports and dashboards, too. Read [Ways to collaborate and share in Power BI](service-how-to-collaborate-distribute-dashboards-reports.md) to see which way works best for your circumstances. 

With sharing, whether you share content inside or outside your organization, you need a [Power BI Pro or Premium Per User (PPU) license](../fundamentals/service-features-license-type.md). Your recipients also need Power BI Pro or Premium Per User (PPU) licenses, unless the content is in a [Premium capacity](../admin/service-premium-what-is.md). 

You can't *share* directly from Power BI Desktop. You [publish reports from Power BI Desktop](../create-reports/desktop-upload-desktop-files.md) to the Power BI service. However, you can [share a report or dashboard from the Power BI mobile apps](../consumer/mobile/mobile-share-dashboard-from-the-mobile-apps.md).  

## Share a report via link

In a list of reports, or in an open report, select **Share** :::image type="icon" source="../media/power-bi-share-icon.png" border="false":::.

Then in the **Send link** dialog, you'll see the option to copy the sharing link or share it via Outlook and Teams to **People in your organization**:

   ![Share link dialog](https://user-images.githubusercontent.com/47899466/114594921-a8e0a000-9c42-11eb-9263-1206a499e668.png)
   >[!NOTE] Your organization may not allow you to create shareable links to **People in your organization**. Learn more about this [tenant setting](https://docs.microsoft.com/power-bi/admin/service-admin-portal#allow-shareable-links-to-grant-access-to-all-people-in-your-organization) in the admin portal documentation.
   
Selecting **Copy link** will automatically generate and copy a shareable link to your clipboard:

![Copied link](https://user-images.githubusercontent.com/47899466/114596854-f827d000-9c44-11eb-8a35-4841b4525756.png)

You can also choose to directly send the link to **Specific people** or groups (distribution groups or security groups). Just enter their name or email address, optionally type a message, and click **Send**.

![Send link to specific people](https://user-images.githubusercontent.com/47899466/114597323-7b492600-9c45-11eb-83ba-22ba2c8c5002.png)

Once you’ve click **Send**, we’ll send the link via email to your recipients.

![Sent link](https://user-images.githubusercontent.com/47899466/114598729-142c7100-9c47-11eb-829c-f286e5eafea0.png)

Once your recipients receive the email, they can click **Open this report** and automatically get access to the report through the shareable link.

![Email with shared link](https://user-images.githubusercontent.com/47899466/114598834-358d5d00-9c47-11eb-9df4-6c82e9ac72c2.png)

### Link settings
You can choose who your sharing link gives access to and what they can do with the report and associated data:

![Link settings](https://user-images.githubusercontent.com/47899466/114606918-bef55d00-9c50-11eb-83c5-e697ce244796.png)


**People in your organization**

This type of link can allow people in your organization to access the report. This link will not work for external users nor guest users. Use this link when you want to share with someone in your organization and are comfortable with them passing the link around to other people inside your organization, but when you want to ensure that the link won’t work for external nor guest users.

**People with existing access**

This type of link generates a URL to the report, but it does not give any access to the report. Use this if you just want to send a link to somebody who already has access.

**Specific people**

This type of link allows specific people or groups to access the report. If you select this option, enter the names or email addresses of the people you wish to share with. With this link type you can share to guest users in your organization’s Azure Active Directory (AAD), but you cannot share to external users who are not guests in your organization.

**Settings**

Links that give access to **People in your organization** or **Specific people** will always include at least read access. However, you can also specify if you want the link to include or exclude the following permissions as well:

- Reshare permissions (included by default) – allows recipients to share the report to others
- Build permissions (excluded by default) – allows recipients to build their own reports in other workspaces based on the data associated with the report. Read more about [creating reports based on datasets from different workspaces](../connect-data/service-datasets-discover-across-workspaces.md).

Links for **People with existing access** do not have any additional settings because these links do not give any access to the report.


**Additional considerations**

- If your tenant admin has disabled shareable links to **People in your organization**, you can only copy and share links to **Specific people** or **People with existing access**.
- If you have reshare permissions to the report but, you do not have reshare permissions to the report’s underlying data, your shareable links will not give access to the underlying data.
- If you do not have reshare permissions to the report, you can only copy and share links to **People with existing access**.
- Additionally, if you do not have a Power BI Pro License, you only copy and share links to **People with existing access**.
- Currently, sharing via links doesn’t support the option to **Include my changes**; however, you can continue using direct access sharing for this scenario.

## Managing permissions to a report
To manage permission and manage links that give access to the report, select the context menu (. . .) in the upper right of the sharing dialog, and then select **Manage permissions**:

![Manage permissions](https://user-images.githubusercontent.com/47899466/114608708-cfa6d280-9c52-11eb-80bd-fa55f75f0b0e.png)

This will launch the **Manage permissions** pane where you can copy or modify existing links or grant users direct access. To modify a given link, click the context menu (. . .).

![Manage permissions pane](https://user-images.githubusercontent.com/47899466/114608629-bdc52f80-9c52-11eb-8948-7ce358d48b69.png)

To grant users direct access to the report click the plus icon (+), enter their name or email address, optionally type a message, and click **Grant access**.

![Grant access](https://user-images.githubusercontent.com/47899466/114608825-f533dc00-9c52-11eb-8288-fb61e8cf8ab1.png)

For additional access management capabilities, select the **Advanced** option in the footer of the **Manage permissions** pane. This will navigate you to the management page where you can:
- View, manage, and create **Links**
- View and manage who has **Direct access** and grant people direct access
- View and manage **Pending** access requests and invitations
- View and manage **Related content**
- Apply **Filters** or **Search** for specific links or people

![Manage permissions page](https://user-images.githubusercontent.com/47899466/114609029-30360f80-9c53-11eb-9f23-0a129f8b4a35.png)

   >[!NOTE] 
   > Each report cannot have more than 1,000 sharing links. In the unlikely case that your report hits this max limit, we recommend removing links that give **Specific people** access and instead grant those users direct access.
 
## Share a dashboard
In a list of dashboards, or in an open dashboard, select **Share** :::image type="icon" source="../media/power-bi-share-icon.png" border="false":::.

Then in the **Share dashboard** dialog, you'll see the option to grant users or groups direct access to the dashboard:

![Share dashboard](https://user-images.githubusercontent.com/47899466/114610532-e0584800-9c54-11eb-9702-947f386cd80c.PNG)

Just enter the name or email address of the user or group, optionally type a message, and click **Grant access**.

![Share dashboard to person](https://user-images.githubusercontent.com/47899466/114611793-3e395f80-9c56-11eb-97e8-99b131cd02d9.PNG)

Similar to report sharing, you can specify if you want to grant users the following permissions as well:

- Reshare permissions (included by default) – allows recipients to share the dashboard to others
- Build permissions (included by default) – allows recipients to build content with the data associated with the dashboard

You can share the dashboard with guest users whose addresses are outside your organization, but guest users cannot reshare dashboards. Read more about [sharing outside your organization](#share-a-report-or-dashboard-outside-your-organization) in this article.

   >[!NOTE] 
   > The input box supports, at most, 100 separate users or groups. See [Share with more than 100 users](#share-with-more-than-100-separate-users) in this article for ways to share with more people.
 
## Managing permissions to a dashboard
To manage permission to the dashboard, select the context menu (. . .) in the upper right of the **Share dashboard** dialog, and then select **Manage permissions**:

![manage permissions dashboard](https://user-images.githubusercontent.com/47899466/114615542-ac802100-9c5a-11eb-8789-83814c8dd23c.PNG)

This will launch the **Manage permissions** pane where can see who has direct access and click the plus icon (+) to grant more users direct access to the dashboard. 

![manage permissions pane dashboard](https://user-images.githubusercontent.com/47899466/114615946-20bac480-9c5b-11eb-91f8-13c65227c110.PNG)

For additional access management capabilities, select the **Advanced** option in the footer of the **Manage permissions** pane. This will navigate you to the management page where you can:
- View and manage who has **Direct access** and grant people direct access
- View and manage **Pending** access requests and invitations
- View and manage **Related content**
- Apply **Filters** or **Search** for specific people

![manage permissions page dashboard](https://user-images.githubusercontent.com/47899466/114616194-71322200-9c5b-11eb-9218-d4d56d2a5a05.PNG)

To remove a user's access to the dashboard, select the ellipsis (**...**) next to that user's permissions and select **Remove access**:
      
   ![Remove access dashboard](https://user-images.githubusercontent.com/47899466/114616907-4a282000-9c5c-11eb-9ffa-0c0b0042934c.PNG)

In the **Remove access** dialog, decide if you also want to remove access to related content, such as reports and datasets. It's best to also remove access to related content; otherwise, the related content may not display properly.

 ![remove access dialog](https://user-images.githubusercontent.com/47899466/114617320-d63a4780-9c5c-11eb-9ed0-f5c3ddddd41a.PNG)



## Share a report or dashboard outside your organization
When you share with people outside your organization, they receive an email with a link to the shared report or dashboard. They must sign in to Power BI to see what you shared. If they don't have a Power BI Pro or Premium Per User (PPU) license, they can sign up for a license when they click the link.

After they sign in, they see the shared report or dashboard in its own browser window, not in the usual Power BI portal. To access this report or dashboard later, they must bookmark the link.

They can't edit any content in this report or dashboard. They can interact with the charts and change filters or slicers, but can't save their changes. 

Only your direct recipients see the shared report or dashboard. For example, if you sent the email to Vicki@contoso.com, only Vicki sees the dashboard. No one else can see the dashboard, even if Vicki forwards them the link. Vicki must use the same email address to access it; if Vicki signs in with any other email address, Vicki won't have access to the dashboard.

People outside your organization don't see any data at all if role- or row-level security is implemented on on-premises Analysis Services tabular models.

Use a security group, not a distribution group, to share with a group that includes people with external email addresses. People with external emails in a distribution group can't see the content you share, unless they are Azure Active Directory (Azure AD) B2B guest users. Learn more about [Azure AD B2B guest users](../admin/service-admin-azure-ad-b2b.md).

If you send a link from a Power BI mobile app to people outside your organization, clicking the link opens the dashboard in a browser, not in the Power BI mobile app.

### Allow external users to edit content

Your Power BI admin can allow external guest users to edit and manage content in your organization. If so, your external users won't have that consumption-only experience. They can edit and manage content within your organization. Learn more about [distributing Power BI content to external guest users with Azure AD B2B](../admin/service-admin-azure-ad-b2b.md).

## Share with more than 100 separate users

At most, you can share with 100 users or groups in a single share action. However, you can give more than 500 users access to an item. Here are some suggestions:

- Share multiple times by specifying the users individually.
- Share with a user group that contains all the users. 
- Create the report or dashboard in a workspace, then create an app from the workspace. You can share the app with many more people. Read more about [publishing apps in Power BI](service-create-distribute-apps.md).


## Limitations and considerations
Things to keep in mind about sharing reports and dashboards:
* Both reports and dashboards can be shared to users through direct access; however, only reports can be shared via links that give access to the report and underlying data.
* If you have reshare permissions to the underlying dataset and you share a report or dashboard with colleagues, you are sharing the underlying dataset as well. Your colleagues get access to the entire dataset unless [row-level security (RLS)](../admin/service-admin-rls.md) limits their access. Report authors may use capabilities that  customize user experiences when viewing or interacting with reports, for example hiding columns, limiting the actions on visuals, and others. These customized user experience do not restrict what data users can access in the dataset. Use [row-level security (RLS)](../admin/service-admin-rls.md) in the dataset so that each person's credentials determine which data they can access.
* Everyone you successfully share your dashboard with can see it and interact with the related reports in [Reading view](../consumer/end-user-reading-view.md#reading-view). In general, they can't create reports or save changes to existing reports. However, if you select **Allow recipients to build content with the data associated with this dashboard**, they can create their own reports in other workspaces based on the dataset for this dashboard.
* Although no one can see or download the dataset, they can access the dataset directly by using the Analyze in Excel feature. An admin can restrict the ability to use Analyze in Excel for everyone in a group. However, the restriction is for everyone in that group and for every workspace the group belongs to.
* Everyone can manually [refresh the data](../connect-data/refresh-data.md).
* If you use Microsoft 365 for email, you can share with members of a distribution group by entering the email address associated with the distribution group.
* Coworkers who share your email domain, and coworkers whose domain is different but registered within the same tenant, can share the dashboard with others. For example, say the domains contoso.com and contoso2.com are registered in the same tenant and your email address is konrads@contoso.com. Both ravali@contoso.com and gustav@contoso2.com can share your dashboard, as long as you give them permission to share.
* If your coworkers already have access to a specific report or dashboard, you can send a direct link by copying the URL when you're on the dashboard or report. For example: `https://powerbi.com/reports/g12466b5-a452-4e55-8634-xxxxxxxxxxxx`.
* Currently, sharing reports via links doesn’t support the option to **Include my changes**; however, you can use direct access sharing for this scenario.

## Next steps

- [How should I collaborate on and share dashboards and reports?](service-how-to-collaborate-distribute-dashboards-reports.md)
- [Troubleshoot sharing dashboards and reports](service-troubleshoot-sharing.md)
- [Request or grant access to shared dashboards or reports](service-request-access.md)
- [Share a filtered Power BI report](service-share-reports.md)
- Questions? [Try the Power BI Community](https://community.powerbi.com/)
