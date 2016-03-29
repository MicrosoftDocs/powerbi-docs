<properties
   pageTitle="Get data from files"
   description="Learn how to get data from Excel, Power BI Desktop, and CSV files into Power BI"
   services="powerbi"
   documentationCenter=""
   authors="Minewiskan"
   manager="mblythe"
   editor=""
   tags=""/>

<tags
   ms.service="powerbi"
   ms.devlang="NA"
   ms.topic="article"
   ms.tgt_pltfrm="NA"
   ms.workload="powerbi"
   ms.date="03/29/2016"
   ms.author="owend"/>

# Get data from files
![](media/powerbi-service-get-data-from-files/file_icons.png)

In Power BI, you can connect to or import data and reports from three types of files.
-	Microsoft Excel (.xlsx or .xlsm)
-	Power BI Desktop (.pbix)
-	Comma Separated Value (.csv)

## What does get data from a file really mean?

In Power BI the data you explore comes from a dataset. To better understand the importance of datasets, let’s look at an automobile. Take a seat in your car and look at the dashboard. That’s just like sitting in front of your computer looking at a dashboard in Power BI. The dashboard shows you all the things the engine and your car is doing; how fast it’s revving, what gear you’re in, your speed, etc.

In Power BI, a dataset is like the engine in our car. The dataset provides the data, metrics, and information that’s displayed in our dashboard. Of course our engine, or dataset, needs fuel, and in Power BI, that fuel is data. Our car has a fuel tank that provides gas to the engine, and much the same in Power BI, we need a fuel tank that has data we can feed to our dataset. In our case, in Power BI, that fuel tank is a Power BI Desktop file, an Excel workbook file, or a .CSV file.

We can take it one step further. A fuel tank in a car has to be filled with gas. The gas for our Power BI Desktop, Excel, or .CSV file is data from another data source.  We get data from another data source and put it into a dataset. Then when we get that dataset into Power BI, we can begin exploring and our dashboard begins to show us all sorts of valuable information.

## Where your file is saved makes a difference

**Local** - If you save your file to a local drive on your computer or another location in your organization, from Power BI (service) you can import your file into Power BI. Your file will actually remain on your local drive, so the whole file isn’t really imported into Power BI. What really happens is a new dataset is created in Power BI and data and the data model from the Power BI Desktop file are loaded into the dataset. If your file has any reports, those will appear in your Power BI site under Reports. Power BI Desktop and Excel 2016 also have the Publish feature (under the File menu or in the Share group on the ribbon). Using Publish is effectively the same as using Get Data > Files > Local File from Power BI, but is often easier to update your dataset in Power BI if you’re regularly making changes to the file.

**OneDrive - Business** – If you have OneDrive for Business and you sign into it with the same account you sign into Power BI with, this is by-far the most effective way to keep your work in Power BI Desktop and your dataset, reports, and dashboards in Power BI in-sync. Because both Power BI and OneDrive are in the cloud, Power BI connects to your file on OneDrive about every hour. If any changes are found, your dataset, reports, and dashboards are automatically updated in Power BI. Just like if you saved your file to a local drive, you can also use Publish to update your dataset and reports in Power BI immediately, otherwise Power BI will automatically synchronize usually within an hour.
OneDrive - Personal – If you save your files to your own OneDrive account, you’ll get many of the same benefits as you would with OneDrive for Business. The biggest difference is when you first connect to your file (using Get Data > Files > OneDrive – Personal) you’ll need to sign in to your OneDrive with your Microsoft account, which is usually different from what you use to sign in to Power BI. When signing in with your OneDrive with your Microsoft account, be sure to select the Keep me signed in option. This way, Power BI will be able to connect to your file about every hour and make sure your dataset in Power BI is in-sync.

**SharePoint Team-Sites** – Saving your Power BI Desktop files to SharePoint – Team Sites is much the same as saving to OneDrive for Business. The biggest difference is how you connect to the file from Power BI. You can specify a URL or connect to the root folder.

## Ready to get started?
See the following articles to learn more about getting your file into Power BI.
- [Get data from Excel workbook files](articles/powerbi-service-excel-workbook-files.md)
- [Get data from Power BI Desktop files](articles/powerbi-service-powerbi-desktop-files.md)
- [Get data from Comma Separated Value files](articles/powerbi-service-comma-seperated-value-files.md)
