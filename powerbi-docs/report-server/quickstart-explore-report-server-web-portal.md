---
title: 'Quickstart: Explore Power BI Report Server in a VM'
description: Create a VM with Power BI Report Server already installed, and explore the web portal.
services: powerbi
documentationcenter: ''
author: maggiesMSFT
manager: kfile
backup: ''
editor: ''
tags: ''
qualityfocus: no
qualitydate: ''
ms.component: powerbi-report-server
ms.service: powerbi
ms.devlang: NA
ms.topic: quickstart
ms.tgt_pltfrm: NA
ms.workload: powerbi
ms.date: 05/05/2018
ms.author: maggies
#intent statement: As a Power BI admin or end user, I want to see how Power BI Report Server is structured, and where I go to manage my files.
---

# Quickstart: Explore the Power BI Report Server web portal in a VM
In this quickstart, you create a virtual machine with Power BI Report Server already installed, so you can experience viewing, editing, and managing sample Power BI and paginated reports, and KPIs.

![Report Server web portal](media/quickstart-explore-report-server-web-portal/report-server-web-portal.png)

You can view the web portal in any modern browser. In the web portal, reports and KPIs are organized in folders, and you can mark them as favorites. You can also store Excel workbooks there. From the web portal, you can launch the tools you need to create reports:

* **Power BI reports** created with Power BI Desktop: View them in the web portal and the Power BI mobile apps.
* **Paginated reports** created in Report Builder: Modern-looking, fixed-layout documents optimized for printing.
* **KPIs** created right in the web portal.

In the web portal you can browse the report server folders or search for specific reports. You can view a report, its general properties and past copies of the report that are captured in report history. Depending on your permissions, you might also be able to subscribe to reports for delivery to your e-mail inbox or a shared folder on the file system.

For this quickstart, you need an Azure subscription. If you don’t have one, create a [free account](https://azure.microsoft.com/free/?WT.mc_id=A261C142F) before you begin.

## Create a Power BI Report Server VM

Luckily, The Power BI team has create a VM that comes with Power BI Report Server already installed.

1. In the Azure Marketplace, open [Power BI Report Server](https://azuremarketplace.microsoft.com/marketplace/apps/reportingservices.technical-preview?tab=Overview).  
2. Select **Get it now**.
3. If you agree to the provider's terms of use and privacy policy, select **Continue**.

    ![Create Power BI Report Server VM](media/quickstart-explore-report-server-web-portal/power-bi-report-server-virtual-machine-create.png)

4. **Step 1 Basics**, **VM Name**, call it **reportservervm**.
5. Create a user name and password.
6. For **Resource group**, keep **Create new**, and call it **reportserverresourcegroup**.
7. Keep the other defaults > **OK**.

    ![Name the VM and resource group](media/quickstart-explore-report-server-web-portal/power-bi-report-server-create-resource-group.png)

8. **Step 2 Settings**, keep the defaults > **OK**.
9. **Step 3 Summary** > **OK**.
10. **Step 4**, review the Terms of user and privacy policy > **Create**.

    **Submitting deployment for Power BI Report Server** takes a several minutes.

## Start your virtual machine

1. In the Azure left navigation pane, select **Virtual machines**. 
2. In the **Filter by name** box, type "report". 
3. Select the name **REPORTSERVERVM**.

4. Under REPORTSERVERVM Virtual machine, select **Connect**.

    ![Connect to the virtual machine](media/quickstart-explore-report-server-web-portal/power-bi-report-server-connect-to-virtual-machine.png)

   

## Tag your favorite reports and KPIs
You can tag the reports and KPIs that you want to be favorites. They're easier to find because they're all gathered in a single Favorites folder, both in the web portal and in the Power BI mobile apps. 

1. Select the ellipsis (**…**) in the upper-right corner of the KPI or report that you want to make a favorite, and select **Add to Favorites**.
   
    ![Add to Favorites](media/quickstart-explore-report-server-web-portal/report-server-web-portal-favorite-ellipsis.png)
2. Select **Favorites** on the web portal ribbon to see it along with your other favorites on the Favorites page in the web portal.
   
    ![View Favorites](media/quickstart-explore-report-server-web-portal/report-server-web-portal-favorites.png)
   
    Now in the Power BI mobile apps you see these favorites along with your favorite dashboards from the Power BI service.
   
    ![View Favorites in the mobile app](media/quickstart-explore-report-server-web-portal/power-bi-iphone-faves-report-server.png)

## Hide or view items in the web portal
You can hide items in the web portal, and you can choose to view hidden items.

### Hide an item
1. Select the ellipsis (...) in the upper-right corner of an item, then select **Manage**.
   
    ![Select manage](media/quickstart-explore-report-server-web-portal/report-server-web-portal-manage-ellipsis.png)
2. Select **Hide this item**.
   
    ![Select Hide](media/quickstart-explore-report-server-web-portal/report-server-web-portal-hide-property.png)
3. Select **Apply**.

### View hidden items
1. Select **Tiles** (or **List**) in the upper-right corner > **Show hidden items**.
   
    The items appear. They're grayed, but you can still open and edit them.
   
    ![Show hidden items](media/quickstart-explore-report-server-web-portal/report-server-web-portal-show-hidden-grayed.png)

## Search for items
You can enter a search team, and you will see everything you can access. The results are categorized into KPIs, reports, datasets, and other items. You can then interact with the results and add them to your favorites.  

![Search for items](media/quickstart-explore-report-server-web-portal/report-server-web-portal-search.png)

## Move or delete items in List view
By default, the web portal displays its contents in Tile view.

You can switch to List view, where it's easy to move or delete multiple items at a time. 

1. Select **Tiles** > **List**.
   
    ![Switch views](media/quickstart-explore-report-server-web-portal/report-server-web-portal-list-view.png)
2. Select the items, then select **Move** or **Delete**.

## Clean up resources

Now that you've finished this quickstart, delete the resource group, virtual machine, and all related resources. 

- To do so, select the resource group for the VM and select **Delete**.

## Next steps
[User handbook](user-handbook-overview.md)  
[Quickstart: Paginated reports](quickstart-create-paginated-report.md)  
[Quickstart: Power BI reports](quickstart-create-powerbi-report.md)



