<properties
   pageTitle="Create Calculated Measures"
   description="Learn to create defined calculations, or measures, and use them to evaluate time-based functions"
   services="powerbi"
   documentationCenter=""
   authors="davidiseminger"
   manager="mblythe"
   editor=""
   tags=""
   featuredVideoId="yn2bXVQJLx8"
   featuredVideoThumb=""
   courseDuration=""/>

<tags
   ms.service="powerbi"
   ms.devlang="NA"
   ms.topic="article"
   ms.tgt_pltfrm="NA"
   ms.workload="powerbi"
   ms.date="02/18/2016"
   ms.author="v-jescoo"/>

# Create Calculated Measures

*See how to create a measure and easily work with time-based calculations*

One of the great things about DAX, the data expression language within Power BI, is that it has lots of useful functions, particularly around time-based calculations such as "Year to Date" or "Year Over Year". With DAX you can define a measure of time once, and then slice it by as many different fields as you want from your data model.

In Power BI, a defined calculation is called a "measure". To create one, select **New Measure** in the Home tab. This will open the Expression Editor, which looks similar to the calculated column formula bar. As with the formula bar, Power BI will suggest relevant DAX functions and data fields as you enter your calculation, and you'll also get a tooltip explaining some of the syntax and function parameters.

If your calculation is particularly long, you can add extra line breaks in the Expression Editor by typing **ALT-Enter**.

Once you've created a new measure, it will appear in the **Fields** pane on the right side of the screen. Power BI will insert the new measure into whichever table you have currently selected, and while it doesn't matter exactly where the measure is in your data, you can easily move it by selecting the measure and using the **Home Table** drop-down menu.

You can use a measure like any other table column: just drag and drop it onto the report canvas or visualization fields. Measures also integrate seamlessly with slicers, segmenting your data on the fly.
