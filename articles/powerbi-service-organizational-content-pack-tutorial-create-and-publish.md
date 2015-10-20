<properties 
   pageTitle="Tutorial: create and publish an organizational content pack"
   description="Tutorial: create and publish an organizational content pack"
   services="powerbi" 
   documentationCenter="" 
   authors="jastru" 
   manager="mblythe" 
   editor=""
   tags=""/>
 
<tags
   ms.service="powerbi"
   ms.devlang="NA"
   ms.topic="article"
   ms.tgt_pltfrm="NA"
   ms.workload="powerbi"
   ms.date="10/15/2015"
   ms.author="jastru"/>

# Tutorial: create and publish an organizational content pack  

In this tutorial we'll create a new organizational content pack, restrict access to the Product Launch group, and publish it to Power BI.

>**Note:**  
>Creating an organizational content pack requires a [Power BI Pro account](https://powerbi.microsoft.com/pricing) for you and your colleagues.

Imagine you're the Release Manager at Adventureworks and you're getting ready for a new product launch.  You've created a dashboard with reports that you'd like to share with the other employees managing the launch. You could [share your dashboard](http://support.powerbi.com/knowledgebase/articles/431008), but then your coworkers will only have read permissions.  Instead, you want your coworkers to be able to personalize your dashboard and reports. 

Want to follow along? Go to **Get Data > Samples > Opportunity Analysis Sample**. 

1.  From the top navigation bar, select the cog icon and choose **Create Content Pack**.    
    ![](media/powerbi-service-organizational-content-pack-tutorial-create-and-publish/cog_select.png)

2.  In the **Create Content Pack** window, enter the following information.  Keep in mind that a content pack library could end up with 100s of content packs published for corporate or group use. Take time to select the right audience, to give your content pack a meaningful name, and to add a good description.  Use words that will make your content pack easy to find via search.

    a.  Select **Specific Groups** and enter the full email addresses for individuals, [Office 365 group aliases](http://support.powerbi.com/knowledgebase/articles/654247), distribution group aliases, or security group aliases. For example:

	salesmgrs@contoso.com; sales@contoso.com

	For this tutorial, try using your own or your group's email address.

    b.  Name the content pack **Sales Opportunities**.

	c.  Recommended: add a description. This helps coworkers more easily find the content packs that they need. Besides a description, add keywords our coworkers might use to search for this content pack.  Finally, include contact information in case your coworkers have a question or need help.

	d.  Add a logo to make it easier for group members to find the content pack -- it's faster to scan for an image than it is to find text. Below is a screen shot of the Opportunity Count 100% column chart tile.

	e.  Select the **Opportunity Analysis Sample** dashboard to add it to the content pack.  Power BI automatically adds the associated report and dataset. 

	>**Note:**  
	>Only dashboards and reports that you can edit are listed. Thus, any that were shared with you aren't in the list.

       ![](media/powerbi-service-organizational-content-pack-tutorial-create-and-publish/cpwindow.png) 

3.  Select **Publish** to add the content pack to the group's organizational content pack library.  

	You see a success message when it publishes successfully. 

4.  When members of your group go to **Get Data > My Organization**, they tap in the search box and type "Sales Opportunities".

	![](media/powerbi-service-organizational-content-pack-tutorial-create-and-publish/cp_searchbox.png) 

5.  They see your content pack.  
	![](media/powerbi-service-organizational-content-pack-tutorial-create-and-publish/cp_contentpack.png) 

	>**Tip:**  
>The URL displayed in your browser is an unique address for this content pack.  Want to tell your coworkers about this new content pack?  Paste the URL into an email.

6.  They select **Connect**, and now they can [work with your content pack](https://support.powerbi.com/knowledgebase/articles/651727). 

## See Also  
[Introduction to organizational content packs](https://support.powerbi.com/knowledgebase/articles/651040)  
[Manage, update, and delete organizational content packs](https://support.powerbi.com/knowledgebase/articles/651631)  
[Get Started with Power BI](http://support.powerbi.com/knowledgebase/articles/430814)  
[Power BI - Basic Concepts](http://support.powerbi.com/knowledgebase/articles/487029)  
[Groups in Power BI](http://support.powerbi.com/knowledgebase/articles/654247)  