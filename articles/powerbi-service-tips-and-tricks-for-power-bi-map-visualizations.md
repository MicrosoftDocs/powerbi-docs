<properties
   pageTitle="Tips and Tricks for Power BI Map visualizations"
   description="Tips and Tricks for Power BI Map visualizations"
   services="powerbi"
   documentationCenter=""
   authors="mihart"
   manager="mblythe"
   backup=""
   editor=""
   tags=""
   featuredVideoId="ajTPGNpthcg"
   qualityFocus="monitoring"
   qualityDate=""/>

<tags
   ms.service="powerbi"
   ms.devlang="NA"
   ms.topic="article"
   ms.tgt_pltfrm="NA"
   ms.workload="powerbi"
   ms.date="01/30/2017"
   ms.author="mihart"/>

# Tips and Tricks for Power BI Map visualizations

Power BI integrates with Bing to provide default map coordinates (a process called geo-coding) so it's easier for you to create maps. Bing uses some algorithms and hints to try to get the right location, but it's a best guess. To increase the likelihood of correct geo-coding, use the following tips. The first set of tips are for you to use if you have access to the dataset itself. And the second set of tips are things you can do in Power BI.

##  In the dataset: tips to improve the underlying dataset

If you have access to the dataset that is being used to create the map visualization, there are a few things you can do to increase the likelihood of correct geo-coding.

**1. Use Geo Location Terms**

When columns in the dataset are named based on the geographic designation, it helps Bing guess what you want to display. For example, if you have a field of US state names such as *California* and *Washington*, if the column is not named based on the geographic designation (state, in this case), Bing might return the location of *Washington, DC* instead of Washington state for the word *Washington*. Naming that column *State* will improve the geocoding. The same is true for columns named *Country*, *State*, *Province*, and *City*.

> [AZURE.NOTE] When working with countries or regions, use the three-letter abbreviation to ensure that geocoding works properly in map visualizations. Do *not* use two-letter abbreviations, as some countries or regions may not be properly recognized.

> If you only have two-letter abbreviations, check out [this external blog post](https://blog.ailon.org/how-to-display-2-letter-country-data-on-a-power-bi-map-85fc738497d6#.yudauacxp) for steps on how to associate your two-letter country/region abbreviations with three-letter country/region abbreviations.

**2. Categorize geographic fields in Power BI Desktop**

In Power BI Desktop, you can ensure fields are correctly geocoded by setting the *Data Category* on the data fields. Select the desired table, go to the **Advanced** ribbon and then set the **Data Category** to **Address**, **City**, **Continent**, **Country/Region**, **Country**, **Postal Code**, **State** or **Province**. These data categories help Bing correctly encode the date. To learn more, see [Data categorization in Power BI Desktop](powerbi-desktop-data-categorization.md).

**3.  Use Power BI Query Editor to create more-specific locations**

Sometimes, even setting the data categories for mapping isn't enough for Bing to correctly guess your intent. Some designations are ambiguous because the location exists in multiple countries or regions. For example, there's a ***Southampton*** in England, Pennsylvania, and New York. Use Power BI Desktop Query Editor to build a more-specific location like a street address.  Use the **Add Column** feature to build a custom column, then build the desired location as follows: 


    = [Field1] & " " & [Field2]

Then use the resulting field in Power BI to create the map visualizations. This approach is very useful for building Street addresses from Shipping Address fields, which are common in data sets. Note that concatenation only works with text fields. If necessary, convert the street number to a *text* data type before using it to build an address.  

**4. Use a comma to add more context to the geo field**

Similar to #3 above, but using DAX in Excel or Excel Power Pivot. You can increase the accuracy of geo-coding by building columns that concatenate multiple fields together and use those for plotting data locations. For example, if you have a column for "state" and another for "countryregion", create a concatenated column for "city-countryregion". This way, Instead of passing only *Southampton*, you can pass *Southampton, England* to get a more accurate geo-coding result. 


    = CONCATENATE('Products'[city],'Products'[state])

For more information, including a video, see [Maps in Power View](https://support.office.com/article/Maps-in-Power-View-8A9B2AF3-A055-4131-A327-85CC835271F7) and scroll down to the section "**make Map data unambiguous**".

**5. Use specific Latitude and Longitude**

Add latitude and longitude values to your dataset. This removes any ambiguity. Latitude and Longitude fields must be in *Decimal Number* format, which you can set in the data model.

<iframe width="560" height="315" src="https://www.youtube.com/embed/ajTPGNpthcg" frameborder="0" allowfullscreen></iframe>

##  In Power BI: tips to get better results when using map visualizations

**1.    Use latitude and longitude fields (if they exist)**

In Power BI, if the dataset you are using has fields for longitude and latitude -- use them!  Power BI has special fields to help make the map data unambiguous. Just drag the field that contains your latitude data into the **Visualizations > Latitude** area.  And do the same for your longitude data. When you do this, you also need to fill the *Location* field when creating your visualizations. Otherwise, the data is aggregated by default, so for example, the latitude and longitude would be paired at the state level, not the city level.

![](media/powerbi-service-tutorial-filled-maps-choropleths/PBI_Latitude.png) 



## See also

[Power Bi visualizations](powerbi-service-visualizations-for-reports.md)

More questions? [Try the Power BI Community](http://community.powerbi.com/)
