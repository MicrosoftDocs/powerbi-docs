---
title: Best design practices for reports and visuals
description: 'An article on best practices for designing reports in Power BI.'
author: mihart
manager: kvivek
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-desktop
ms.topic: conceptual
ms.date: 06/17/2019
ms.author: mihart
LocalizationGroup: Visualizations
---

# Best design practices for reports and visuals

This article provides best practices for designing reports in Power BI. It discusses principles of design that you can apply to your reports and to the pages and individual visuals that make up reports. Many of these best practices apply to dashboard design as well.

> [!NOTE]
> The recommendations made in this article are guidelines for you to apply when and where it makes sense. For every principle we describe below, there are usually valid reasons to “break the rule.”

The hope is that this article will be a jumping-off point for you, that you’ll apply what you learn to your own reports and visualizations, and that you’ll continue the conversation on [Microsoft Power BI Community](http://community.powerbi.com/). BI report design and visualization usage is a hot topic right now. There are many thought leaders, bloggers, and websites that look at BI report design in breadth and depth. We’ve listed a few at the end of the article.

> *We are overwhelmed by information, not because there is too much, but because we don't know how to tame it.*
-- Stephen Few

## A look at the landscape and terminology

In Power BI, a report can have one or more report pages. All of the pages together are collectively referred to as the report. The basic elements of the report are visuals (also known as visualizations), standalone images, and text boxes. From the individual data points, to the report elements, to the report page itself, there are innumerable formatting options.

We’ll start at the report planning stage, continue on to basic report design principles, then discuss visual design principles, and finish with a discussion of best practices for individual visual types.

In-depth guidance and instructions for creating and using Power BI reports is available at [Learn Power BI](https://powerbi.microsoft.com/learning/).

## Before you build your first visualization, focus on requirements

Creating a report starts before you build your first visual. A good report needs planning. Know what data you have to work with and write down the requirements for the report. Ask yourself these questions:

* What's the business need?

* How are the readers going to use this data?

* Who's going to use this data?

* What decisions does the reader want to make based on this report?

The answer to those questions will drive your design. Every report tells a story. Make sure the story matches the business need. It may be tempting to add visuals that show dramatic insights, but if those insights don’t match the business need, then the report won’t be useful. You might actually distract your users with those visuals. Also, you may find you can't glean the info to make that decision from this data. Can you use this report to measure what you need to measure?

You can use reports to monitor, uncover, track, predict, measure, manage, test, and more. For example, the business need is a sales report that measures performance. You might design a report that looks at current sales, compares it to previous sales, compares to competitors, and includes some KPIs that trigger alerts. Perhaps readers can drill down into the sales numbers to see store closures or supply chain issues that may be impacting sales. Another drill down might be the ability to look at sales by store, region, product, season, and more.

Know the customers for the report. Design a report that uses familiar terminology and provides data at a level of detail and complexity is comparable with the customers’ level of knowledge. Do you have more than one type of customer? One size doesn’t always fit all. Design separate report pages that are based on expertise. Be sure to label each page clearly so customers can self-identify. Another option is to use slicers so customers can tailor the page to fit them. Involve the customer in the planning stage and avoid the mistake of building what you think they need. If you make that mistake, prepare to start over and to iterate.

Once you’ve identified the business need, the customers, and the metrics you’d like to include, the next step is to pick the right visuals to tell the story. Figure out how to present those visuals in the most-effective way. Let's start with some basic principles of report design.

## Principles of report design

A report page has limited space and one of the hardest things is to fit all the elements you want into that space – and still have that info be easily understood. Also, don’t underplay the value of a visually appealing report. The key is to find the balance between a report that is appealing and one that is useful.

Let’s take a look at layout, clarity, and aesthetics.

### Layout of the report canvas

The report canvas has a finite amount of space. If you can’t fit all the elements on a single report page, break up the report into many pages. You can tailor a report page to a specific audience (for example, HR, IT, Sales, SLT). If you want, tailor it to a specific business question:

* "How are defects impacting our downtime?"

* "What is our Marketing campaign’s impact on Sentiment?"

It may be better to approach it as a progressive story. Maybe the first page in an overview or attention-grabbing “hook”, the second page continues the data story, the third page more deeply explores the story, and so on. If your entire report fits on a single page, that works too. If it doesn’t, create separate report pages that logically chunk the content. Don’t forget to give the pages meaningful and helpful names.

Think about filling an art gallery. You wouldn’t put 50 pieces of artwork into a small room, fill it with chairs, and paint each wall a different color. As the curator, you’d only choose pieces that have a common theme. You'd lay them out around the room with plenty of space for visitors to move and think. You might even place informational cards that describe what they’re looking at. There’s a reason most modern galleries have plain walls!

For this article, we’ll start with a report example that needs a lot of work. As we apply our best practices and principles of design, our report will improve.

![This ugly report page needs a lot of work](media/power-bi-visualization-best-practices/power-bi-example1newa.png)

**Figure 1: This ugly report page needs a lot of work**

The example above has many space-related (layout) design issues that we’ll discuss below:

* Alignment, order, and use of proximity

* Poor use of space and sorting

* Clutter

### Alignment, order, and proximity

The layout of your report elements impacts reader comprehension and guides them through the report page. How you place and position elements tells a story. The story might be “start here and then look here” or “these three elements are related to each other.”

* In many cultures, people scan from left-to-right and top to bottom. Position the most important element in the top-left corner of your report. Organize the rest of the visuals in a way that leads to logical navigation and comprehension of the info.

* Position elements that require the reader to make a choice to the left of the visualizations the choice will impact: slicers, for example.

* Place position-related elements close to each other. Proximity implies the relationship of the elements.

* Another way to convey relationships is to add a border or color background around related elements. Conversely, add a divider to distinguish between different sections of a report.

* Use white space to visually chunk sections of the report page.

* Fill the report page. If you have too much white space, make your visualizations larger or make the canvas smaller.

* Be intentional with sizing your report elements. Don’t let space availability dictate the size of a visualization.

* Make important elements larger than the others or add a visual element like an arrow to draw attention.

* Align the elements on the report page, either symmetrically or intentionally asymmetrically.

Let’s take a closer look at alignment.

#### Alignment

Alignment doesn’t mean that the different components need to be the same size. It doesn't mean you must have the same number of components on each row of the report. It just means that there's a structure to the page that aids in navigation and readability.

We can see in our updated report that we have aligned the report components on the left and right edges. We also aligned each report row horizontally and vertically. Our slicers are to the left of the visuals they impact.

![Our ugly report example improved with layout edits.](media/power-bi-visualization-best-practices/power-bi-example2new.png)

**Figure 2: Our ugly report example improved with layout edits**

Power BI includes tools to help you align your visuals. In Power BI Desktop, with multiple visuals selected, you can use the **Align** and **Distribute** options on the **Visual Tools** ribbon tab to match up the position of visuals.

![Align visuals in Power BI Desktop.](media/power-bi-visualization-best-practices/power-bi-visualization.png)

**Figure 3: Align visual tools in Power BI Desktop**

In the Power BI service and Power BI Desktop, you also have precise control over the size and position of visuals. You can find this control on the **General** tab on the **Format** pane for all visuals:

![Set exact position for your visual.](media/power-bi-visualization-best-practices/power-bi-align-vizs.png)

**Figure 4: Set exact position for your visual**

In our example report page (Figure 2), Power BI aligns the two cards and large border on the **X Position** at 200.

#### Fit to the space

Make the best use of the space you have. If you know how people will view and display the report, design it with that in mind. Reduce empty space to fill the canvas. Do all you can to eliminate the need for scroll bars on individual visuals. Fill the space without making the visuals seem cramped.

##### Adjust the page size

By reducing the page size, individual elements become larger relative to the overall page. Clear the selection of any visuals on the page and using the **Page Size** tab in the **Format** pane.

Here is a report page using page size **4:3** and then using **16:9**. Notice how the layout suits 16:9 so much better. There's even enough room to remove the scroll bar from the second visual.

![The report at 4:3 page size.](media/power-bi-visualization-best-practices/power-bi-page-view-before.png)

**Figure 5a: The report at 4:3 page size**

![The report at 16:9 page size ratio.](media/power-bi-visualization-best-practices/power-bi-page-view-after.png)

**Figure 5b: The report at 16:9 page size**

Will people view your report in 4:3, 16:9, or another aspect ratio? On small screens or huge screens? Will they view your report on all possible screen ratios and sizes? Design with this point in mind.

Our example report page seems a bit cramped. With no visual selected:

1. Select ![Paint roller icon for Format pane.](media/power-bi-visualization-best-practices/power-bi-paint-roller.png) to open the **Format** pane.

1. Expand **Page Size**.

1. For **Type**, select **Custom**.

1. Change **Height** to **900**.

    ![Increase page height.](media/power-bi-visualization-best-practices/power-bi-page-size.png)

**Figure 6: Increase page height**

#### Reduce clutter

A cluttered report page will be hard to understand at-a-glance and may be so overwhelming that readers won’t even try. Get rid of all report elements that aren’t necessary. Don’t add features that don’t help comprehension or navigation. Your report page needs to convey the info as clearly, quickly, and cohesively as it can.

Edward Tufte calls it “data to ink ratio” in his book *The Visual Display of Quantitative Information*. Basically, remove anything that isn’t essential.

The clutter you remove will increase the white space on your report page. It will give you more real estate for applying the best practices we learned about in the [Alignment, order, and proximity](#alignment-order-and-proximity) section.

Our example is already looking better. We’ve removed clutter and added shapes to group elements together. The background image is gone, the unnecessary arrow shape and text box are gone, we moved one visual to another page in the report, and so on. We’ve also lengthened the page size to increase white space.

![Our ugly report example de-cluttered.](media/power-bi-visualization-best-practices/power-bi-example3newer.png)

**Figure 7: Our ugly report example de-cluttered**

### Tell a story at a glance

The overall test should be that somebody without any prior knowledge can quickly understand the report without any explanation from anybody. With a quick glance, readers can see what the page is about and what each chart/table conveys.

When readers look at your report, their eyes should focus on the element you want them to look at first. Their eyes will then continue left-right and top-down. Change this behavior by adding visual cues like text box labels, shapes, borders, size, and color.

#### Text boxes

Sometimes the titles on visualizations aren’t enough to tell the story. Add text boxes to communicate with the people viewing your reports. Use text boxes to describe the report page, a grouping of visuals, or describe an individual visual. They explain results or better-define a visual, components in the visual, or relationships between visuals. You can use text boxes to draw attention based on different criteria called out in the text box.

In the Power BI service, from the top menu bar, select **Text Box**. (In Power BI Desktop, select **Text Box** from the **Insert** area of the ribbon.)

![Add a text box in the Power BI service.](media/power-bi-visualization-best-practices/power-bi-text-boxes.png)

**Figure 8: Add a text box in the Power BI service**

Enter text in the empty box. Then use the controls to set font, size, alignment, and more. Use the handles to resize the box.

![Format the text box.](media/power-bi-visualization-best-practices/power-bi-text-box-edit.png)

**Figure 9: Format the text box**

Don’t overdo it though. Too much text on a report detracts from the visuals. If you find that your report page requires excessive text to make it understandable, then start over. Can you pick a different visual that tells a better story on its own? Can you tweak the visual’s native titles to make it more intelligible?

#### Text

Create a text style guide and apply it to all pages of your report. Pick just a few fonts, text sizes, and colors. Apply this style guide to textual elements. Also apply it to the font choices you make within your visualizations. See the [Titles and labels that are part of the visualizations](#titles-and-labels-that-are-part-of-the-visualizations) section. Set rules for when you’ll use bold, italics, increased font size, specific colors, and more. Try to avoid using all capitalization or underlining.

#### Shapes

Shapes can also aid navigation and comprehension. Use shapes to group related info together, highlight important data, and use arrows to direct the eye. Shapes help readers understand where to start and how to interpret your report. In design terms, it's often referred to as *contrast*.

![Shapes in the Power BI service.](media/power-bi-visualization-best-practices/shapes.png)

**Figure 10a: Shapes in the Power BI service**

![Shapes in Power BI Desktop.](media/power-bi-visualization-best-practices/power-bi-desktop-shapes2new.png)

**Figure 10b: Shapes in Power BI Desktop**

What does our example page look like now? Figure 11 shows a cleaner, less cluttered page with a consistent use of text size, fonts, and colors. Our page title in the top-left corner tells us what the page is all about.

![Our report example with text guidelines applied and title added.](media/power-bi-visualization-best-practices/power-bi-example4new.png)

**Figure 11: Our report example with text guidelines applied and title added**

In our example, we added a report page title in the top-left corner; the first place readers look. Font size is 28 point and font is Segoe Bold to help it stand out from the rest of the page. Our text style guide calls for no backgrounds, black titles, legends, and labels. We applied that to all visuals on the page, where possible (the Combo chart axes and labels aren't editable). Additionally these elements were configured to the style guide specs:

* Cards: **Category label** set to **Off**, **Title** set to **On**, 12 point, black, and centered.

* Visual titles: If turned **On**, set to 12 point and left-aligned.

* Slicers: **Header** set to **Off**, **Title** turned **On**. Leave **Items** > **Text** grey and 10 point.

* Scatter and Column charts: black font for X- and Y-Axes and X- and Y-Axes titles, if used.

#### Color

Use color for consistency. We’ll talk more about color later in [Principles of visual design](#principles-of-visual-design). Here, we’re talking about being deliberate in your selection of color. It's so that the color doesn’t detract from your readers ability to quickly understand your report. Too many bright colors barrage the senses. This section is more what not to do with color.

#### Backgrounds

When setting backgrounds for report pages, choose colors that don’t overshadow the report, clash with other colors on the page, or generally hurt the eyes. Realize that some colors have inherent meaning. For example, in the United States, red in a report is typically interpreted as “bad”.

![Set report background.](media/power-bi-visualization-best-practices/power-bi-page-background.png)

**Figure 12: Set report background**

You’re not creating a work of art, but a functional report. Choose a color that improves the readability and prominence of the report elements. A study on the use of color and visualizations within web pages found that higher contrast between colors increases the speed of comprehension. Two with papers explore this topic:

* **The effect of text and background colour on visual search of web pages**

* **Determining Users’ Perception of Web Page Visual Complexity and Aesthetic Characteristics**

We’ve applied some color best practices to our example report (Figure 20 and 21). The most notable was that we changed the background color to black. The yellow was too bright and strained our eyes. Also, on the **Count of athlete name by year and class** chart, the yellow portion of the bars disappeared into the yellow background. Using a black (or white) background gives us maximum contrast and makes the visuals the focus of attention.

Here are the additional steps we took to improve the example report:

#### Page title

When we changed the background to black, our title disappeared because the text box field only allows black font. To fix this issue, add a text box title instead:

1. With the text box selected, erase the text.

1. On the **Visualizations** tab, select **Title** and turn it **On**.

1. Select the arrow to expand the **Title** options.

1. Enter **Summer Olympic Games** into the **Title Text** field.

1. From **Font color**, select white.

    ![Add a page title.](media/power-bi-visualization-best-practices/power-bi-text-box-title.png)

    **Figure 13: Add a page title**

#### Cards

For the card visuals:

1. Select ![Paint roller icon for Format pane.](media/power-bi-visualization-best-practices/power-bi-paint-roller.png) to open the **Format** pane.

1. Set **Background** to **On**.

1. Select white with a **Transparency** of **0%**.

    ![Card background colors.](media/power-bi-visualization-best-practices/power-bi-card-background.png)

1. Then set **Title** to **On**.

1. From **Font color**, select white and from **Background color** select black.

    ![Card title colors.](media/power-bi-visualization-best-practices/power-bi-card-title.png)

#### Slicers

Up to this point the two slicers had different formatting. That doesn't make design sense. For both slicers: 

1. Change the background color to aqua.

    ![Change slicer background color.](media/power-bi-visualization-best-practices/power-bi-slicer-background.png)

    **Figure 14: Change slicer background color**

    Aqua is a good choice because it's part of the page’s color palette – you can see it in the filled map, treemap, and column chart.

1. Add a thin white border.

    ![Add a border to the slicer.](media/power-bi-visualization-best-practices/power-bi-slicer-outline.png)

    **Figure 15: Add a border to the slicer**

1. The grey font is hard to see against the aqua, so change the **Items** color to white.

    ![Change slicer font color.](media/power-bi-visualization-best-practices/power-bi-slicer-items.png)

    **Figure 16: Change slicer font color**

1. Finally, under **Title**, change **Font color** to white and add a black **Background color**.

    ![Format slicer title.](media/power-bi-visualization-best-practices/power-bi-card-formatting.png)

    **Figure 17: Format slicer title**

#### Rectangle shape

The rectangle has also disappeared into the black background. To fix this issue:

1. Select the shape.

1. In the **Format shape** pane, slide **Background** to **On**.

    ![Format the shape](media/power-bi-visualization-best-practices/power-bi-shape-format.png)

    **Figure 18: Format the shape**

#### Column charts, bubble chart, filled map, and treemap

Add a white background to the remaining visuals on the report page. From the **Format** pane:

1. Expand the **Background** option.

1. Set the **Color** to white.

1. Set the **Transparency** to 0.

    ![Add a white background to remaining visualizations.](media/power-bi-visualization-best-practices/power-bi-background.png)

    **Figure 19: Add a white background to remaining visualizations**

This is what the report looks like after you reformat it:

![Report example with color best practices applied (black background).](media/power-bi-visualization-best-practices/power-bi-example5a.png)

**Figure 20: Report example with color best practices applied (black background)**

![Report example with color best practices applied (white background)](media/power-bi-visualization-best-practices/power-bi-example5b.png)

**Figure 21: Report example with color best practices applied (white background)**

### Aesthetics

We discussed much of what we would consider aesthetics above: alignment, color, font choices, and clutter. There are a few more best practices for report design worth discussing. They deal with the overall appearance of the report.

Remember that the function of your report is to meet a business need, not to be pretty. Some level of beauty is required, especially when it comes to first impressions. Nashville consultant Tony Bodoh explains, "Emotion fires a half-second before logic can kick in." Readers will first react at an emotional level to your report page. Then they will take more time to dig deeper. If your page looks disorganized, confusing, or unprofessional, your reader may never discover the powerful story it tells.

Blogger and TechTarget industry analyst Wayne Eckerson has a great analogy. Designing a report is like decorating a room. Over time, you buy a vase, a sofa, end table, and a painting. Separately you like all of these elements. Although each individual selection makes sense, collectively the objects clash or compete for attention.

Concentrate on these things:

* Create a common theme or look for your report, and apply it to all pages of the report.

* Use standalone images and other graphics to support and not detract from the real story.

* Apply all the best practices we discussed up to this point in the article.

## Principles of visual design

We’ve looked at the principles of report design and how to organize the report elements in a way that makes the report easy to grasp quickly. Now we’ll look at design principles for visuals themselves. In the next section, we’ll dig down into individual visuals and discuss best practices for some of the more commonly used types.

We’re going to leave our example report page alone for a while and look at other examples. After we’ve gone through the principles of visual design, we’ll return to our example report page and apply what we’ve learned. We'll provide step-by-step instructions.

### Planning – choose the right visual

Just as it’s important to plan out your report before you start building, each visual also requires planning. Ask yourself, “What story am I trying to tell with this visual,” and then figure out which visual type will tell the story best. You could show progress through a sales cycle as a bar chart, but wouldn’t a waterfall or funnel chart tell it better? For help with this process, read the last section of this article, [Visual types and best practices](#visual-types-and-best-practices). It describes best practices for some of the more-common types of visuals. Don’t be surprised if the first visual type you pick doesn’t end up being your best option. Try more than one visual type to see which one makes the point best.

Understand the difference between quantitative and categorical data, and know which visual types work best with what type of data. Quantitative data is often referred to as measures and it’s typically numeric. Categorical data is often referred to as dimensions and you can classify it. It's discussed in more depth in the [Choose the right measure](#choose-the-right-measure) section.

Avoid the temptation to use fancy or more-complex visual types just to make your report look more impressive. What you want is the most simple option for conveying your story. Horizontal Bar charts and simple Line charts convey info quickly. They're familiar and comfortable and most readers interpret them easily. An added advantage is that most of your audience reads left-to-right and top-to-bottom, so they can scan these two chart types and comprehended the info quickly.

Does your visual require scrolling to tell the story? Avoid scrolling if you can. Try applying filters and making use of hierarchies/drill-downs. If those elements don’t remove the scroll bar, consider choosing a different visual type. If you can’t eliminate scrolling, your readers will tolerate horizontal scrolling better than vertical scrolling.

Even when you choose the absolute best visual for the story, you might still need help with telling the story. That’s where labels, titles, menus, color, and size come in. We’ll discuss these design elements later in the [Design elements](#design-elements) section.

### Choose the right measure

Is the story your visual is telling compelling? Does it matter? Don’t build visuals for the sake of building visuals. Maybe you thought the data would tell an interesting story, but it doesn’t. Don’t be afraid to start over and look for a more-interesting story. Maybe the story is there but you need to measure it in a different way.

Say you want to measure the success of your sales managers. What measure would you use to do this? Would you measure that best by looking at total sales or total profit, growth over previous year or performance against a target goal? Salesperson Sally might have the largest profit. If you showed total profit by salesperson in a bar chart, compared to the other salespeople, she would look like a rock star. If Sally has a high cost of sales (travel expenses, shipping costs, manufacturing costs, and so on), simply looking at sales doesn’t tell the best story.

#### Reflect reality, don’t distort reality

It’s possible to build a visual that distorts the truth. There’s a website where data enthusiasts share what they consider to be bad visuals. The common theme in the comments is disappointment in the company that created and distributed that visual. A bad visual sends the message that the company can’t be trusted.

So create visuals that don’t intentionally distort reality and that aren’t manipulated to tell the story you want them to tell. Here is an example:

![Distorted reality chart.](media/power-bi-visualization-best-practices/corp-success-distorted.png)

**Figure 22: Distorted reality chart**

In this example, it appears as if there is a large difference between the four companies, and that CorpB is way more successful than the other three. Notice that the X-Axis doesn’t start at zero and that the differences between the companies is likely within the margin of error. Here’s the same data with an X-Axis that does start at zero.

![Realistic chart.](media/power-bi-visualization-best-practices/corp-success.png)

**Figure 23: Realistic chart**

Readers expect and often assume the X-Axis is starting at zero. If you decide not to start at zero, do so in a way that doesn’t distort the results. Consider adding a visual cue or text box to point out the deviation from the norm.

### Design elements

Once you’ve selected a type and measure and created the visual, it’s time to fine-tune the display for maximum effectiveness. This section covers:

* Layout, space, and size

* Text elements: labels, annotations, menus, titles

* Sorting

* Visual interaction

* Color

#### Tweaking visuals for best use of space

If you’re trying to fit multiple charts into a report, maximizing your data-ink ratio will help make the story in your data stand out. As mentioned above, Edward Tufte coined "data-ink ratio." The goal is to remove as many marks from a chart as possible without impairing a reader’s ability to interpret the data.

In the first set of charts below, there are redundant axis labels: **Jan 2014**, **Apr 2014**, and so on. In the titles, **by Date** is repeated. The titles for each chart also require dedicated horizontal space across each chart. By removing the chart titles and turning on individual axis labels, we remove some ink and have better use of the overall space. We can remove the axis labels for the top two charts to further reduce ink and use more of the space for data.

If there were particular time periods that you wanted to call out, you could draw lines or rectangles behind all the charts. Doing so will help draw the eye up and down to aid comparisons.

![Before.](media/power-bi-visualization-best-practices/power-bi-multiples-before.png)

**Figure 24: Before**

![After.](media/power-bi-visualization-best-practices/power-bi-multiples-after.png)

**Figure 25: After**

**To turn axis titles on and off**

1. Select the visual to make it active.

1. Select ![Paint roller icon for Format pane.](media/power-bi-visualization-best-practices/power-bi-paint-roller.png) to open the **Format** pane.

1. Expand the options for the **X-Axis** or **Y-Axis**.

1. Drag the slider for **Title** on or off.

    ![Turn axis titles on and off.](media/power-bi-visualization-best-practices/power-bi-axis-titles.png)

    **Figure 26: Turn axis titles on and off**

##### To turn axis labels on and off

1. Select the visual to make it active.

1. Select ![Paint roller icon for Format pane.](media/power-bi-visualization-best-practices/power-bi-paint-roller.png) to open the **Format** pane.

1. Next to **X-Axis** and **Y-Axis** are sliders.

1. Drag the slider to turn axis labels on or off.

    ![Turn axis labels on and off.](media/power-bi-visualization-best-practices/power-bi-axis-labels.png)

    **Figure 27: Turn axis labels on and off**

    > [!TIP]
    > One scenario where you might turn Y-Axis labels off would be if you had **Data labels** turned on.

##### To remove visual titles

1. Select the visual to make it active.

1. Select ![Paint roller icon for Format pane.](media/power-bi-visualization-best-practices/power-bi-paint-roller.png) to open the **Format** pane.

1. Set the slider for **Title** to **Off**.

    ![Remove titles from visuals.](media/power-bi-visualization-best-practices/power-bi-title-off.png)

    **Figure 28: Remove titles from visuals**

Consider how your readers will view the report. Make sure your visuals and text are large enough and dark enough so people can read them. If you have a proportionally larger visual on the page, readers may assume it’s the most important. Put enough space between the visuals that your report doesn’t look cluttered and confusing. Align your visuals to help direct the eyes of your readers.

##### To resize a visual

1. Select the visual to make it active.

1. Grab and drag one of the handles to adjust the size.

    ![Resize visual.](media/power-bi-visualization-best-practices/power-bi-drag-handles.png)

    **Figure 29: Resize visual**

##### To move a visual

1. Select the visual to make it active.

1. Select and hold the gripper bar at the top-middle of the visual

1. Drag the visual to its new location.

    ![Move a visual.](media/power-bi-visualization-best-practices/power-bi-move.png)

    **Figure 30: Move a visual**

#### Titles and labels that are part of the visualizations

Make sure titles and labels are easy to read and self-explanatory. Text in titles and labels must be an optimal size with colors that stand out. Remember our style guide (see [Text](#text) earlier in the article)? Limit the number of colors and sizes -- too many different font sizes and colors make the page look busy and confusing. Consider using the same font color and size for the title of all visuals on a report page. Also, choose the same alignment for all titles on a report page.

**The Format pane**

For each of the formatting changes listed below, select the paint roller icon ![Paint roller icon for Format pane.](media/power-bi-visualization-best-practices/power-bi-paint-roller.png) to open the **Format** pane.

![Open the Format pane.](media/power-bi-visualization-best-practices/power-bi-paintbrush.png)

**Figure 31: Open the Format pane**

Then select the visual element to adjust and make sure it's set to **On**. Examples of visual elements are: **X-Axis**, **Y-Axis**, **Title**, **Data labels**, and **Legend**. The example below shows the **Title** element.

![Format a visual title.](media/power-bi-visualization-best-practices/power-bi-title-formatting.png)

**Figure 32: Format a visual title**

##### Set the text size

You can adjust text size for titles and data labels, but not for X- or Y-Axes or legends. For data labels specifically, play with the **Display units** and number of **Decimal Places**. Eventually, you'll find the optimal level of detail for displaying info on your report.

##### Set the text alignment

You can choose a title alignment of left, right, or center. Choose one and apply that same setting to all visuals on the page.

##### Set the text position

You can adjust the text position for some Y-Axes and for the legend. Whichever you choose, do the same for the other Y-Axes and any other legend on the page.

##### Set the title and label length

Adjust the length of titles, axes titles, data labels, and legends. If you decide to display any of these elements, adjusting the length (along with text size) ensures that Power BI won't truncate the values:

* For **Title** and **Legend**, the setting is **Title Text**. Enter the actual title that will appear on the visual.

* For **X-Axis** and **Y-Axis**, the setting is **Style** and you select from a drop-down.

* For **Data labels**, the settings are **Display** and **Decimal**. Use the **Display** drop-down to select the units of measurement: **millions**, **thousands**, **none**, **auto**, and so on. Use the **Decimal** field to tell Power BI how many decimal places to display.

##### Set the text color

You can adjust the text color for titles, axes, and data labels.

#### Titles and labels that aren't part of the visualizations

Earlier in this article we discussed adding text boxes to report pages. Sometimes the titles on visualizations aren’t enough to tell the story. Add text boxes to communicate additional info to the readers of your reports.

To keep your report page from looking too confusing or too busy, be consistent in your use of text box fonts, sizes, colors, and alignment. To make a change to the text in a text box, select the text box to reveal the formatting menu.

![Format the font used in a text box.](media/power-bi-visualization-best-practices/power-bi-text-box-edit.png)

**Figure 33: Format the font used in a text box**

#### Sorting

A simple opportunity to provide faster insight is to set the sorting of visuals. For example, sorting Bar charts in descending or ascending order that is based on the value in the bars lets you quickly show significant incremental info without using more real estate.

To sort a chart:

1. Select the ellipsis in the top-right corner of the chart.

1. Select **Sort**.

1. Choose the field you want to sort by and the direction.

For more info, see [Change how a visual is sorted](../consumer/end-user-change-sort.md).

#### Chart interaction and interplay

One of the most compelling features of Power BI is the ability to edit the way charts interact with each other. By default, charts are cross-highlighted: when you select a data point, the related data of other charts light up and the unrelated data dims. You can override this behavior to use any chart as a true filter. It'll save you real estate on your page. Select **Visual Interactions** from the menu bar to make the change.

![Visual interactions.](media/power-bi-visualization-best-practices/power-bi-visual-interactions.png)

**Figure 34: Visual interactions**

Then, for each visual on the page, decide whether you want the selected visual to: filter, highlight, or do nothing. You can't highlight all visuals. For visuals you can't highlight, the highlight control won't be available. For more info, see [Visual interactions in Power BI](../consumer/end-user-interactions.md).

> [!TIP]
> For readers who’re new to Power BI, this ability to select and interact with reports may not be instantly obvious. Add text boxes to help them understand what they can select to find more insights.

#### The use of color in visuals

Earlier in this article we talked about the importance of having a plan for how you’re going to use color across a report. This section will have some overlap but primarily applies to how you use color in individual visuals. The same principles apply: use color to tie the report together, add emphasis to important data, and to improve the reader’s comprehension of the visual. Using too many different colors can be distracting. It makes it difficult for the reader to know where to look. Don’t sacrifice comprehension for beauty. Only add color if it improves comprehension.

> [!TIP]
> Know your audience and any inherent color rules. For example, in the United States, green typically means “good” and red typically means “bad”.

The following sections cover:

* Data color

* Data label color

* Color for categorical values

* Color for numerical values

##### Use colors to highlight interesting data

The simplest way to use color is by changing one or more data point’s color(s) to call attention to it. In this example, the color changes when the Olympic games moved from a 4-year cycle to a 2-year cycle of alternating Summer and Winter games.

![Use color to tell a story.](media/power-bi-visualization-best-practices/power-bi-data-color.png)

**Figure 35: Use color to tell a story**

You can change data point colors from the **Data colors** tab in the **Format** pane. To customize each data point individually, make sure **Show all** is set to **On**.

![Set data point colors.](media/power-bi-visualization-best-practices/power-bi-colors.png)

**Figure 36: Set data point colors**

> [!NOTE]
> Power BI applies a default theme to your report visuals. Designers chose the theme colors to provide variety and contrast. To divert from the default theme palette, select **Custom color**.
>
> ![Choose a custom color.](media/power-bi-visualization-best-practices/power-bi-custom-color.png)
>
> **Figure 37: Choose a custom color**

In Power BI Desktop, you can even highlight **Outliers** or a section of a line by using a second series:

![Using Desktop to plot outliers.](media/power-bi-visualization-best-practices/power-bi-outliers.png)

**Figure 38: Use Power BI Desktop to plot Outliers**

Here, values in the **Outliers** series only exist where the average August temperature drops below 60. We did this by creating a DAX calculated column using this formula:

```
Outliers = if(Editions[Temp]<60, Editions[Temp], BLANK())
```

In our example, there were three outliers: **1952**, **1956**, and **2000**.

##### Colors for labels and titles

As you explore all of the formatting options available to you, you’ll find many different places to add color to titles and legends. For example, you can change the color of data labels and axes titles. Be careful though. Generally, you want to use a single color for every visual title. As with the the other guidelines in this article, there are always situations and reasons to break the rules. If you do decide to break the rules, do it for a good reason.

##### Colors for categorical values

Charts with a series typically have a categorical value in the legend. For example, each color in the legend below represents a different category of Country/Region.

![Default colors applied.](media/power-bi-visualization-best-practices/power-bi-bubble-color.png)

**Figure 39: Default colors applied**

Designers chose the default colors Power BI uses to provide a good color separation between categorical values so they're easy to distinguish. Sometimes people change these colors to match their corporate scheme, but it can lead to problems.

![Color applied as hues of a single color.](media/power-bi-visualization-best-practices/power-bi-bubble-color2.png)

**Figure 40: Color applied as hues of a single color**

By sticking to a single hue and varying the intensity of the color, this visual has introduced a false sense of ordering between the categories. It implies the darker bubbles are higher or lower on some scale than the lighter hues. Other than alphabetical, there’s normally no inherent order in this sort of categorical value.

To change the default colors, select ![Paint roller icon for Format pane.](media/power-bi-visualization-best-practices/power-bi-paint-roller.png) to open the **Format** pane, and select **Data colors**.

##### Colors for numerical values

For fields that do have some inherent order and numerical value, you can also color data points by the value. Coloring data points by value can be helpful to show the spread of values across the data, and also allow Power BI to show two variables on a single chart. The following chart makes it clear that although China has the highest medal count, Japan and Thailand have participated in more Olympic games.

![Color data points by the value.](media/power-bi-visualization-best-practices/power-bi-saturation.png)

**Figure 41: Color data points by the value**

To create this chart:

1. Select the visual to make it active.

1. Select ![Paint roller icon for Format pane.](media/power-bi-visualization-best-practices/power-bi-paint-roller.png) to open the **Format** pane.

1. Select **Data colors** > option > **Conditional formatting**:

    ![Select Conditional formatting.](media/power-bi-visualization-best-practices/power-bi-conditional-formatting.png)

    **Figure 42: Select Conditional formatting**

1. Adjust those colors in the **Default color - *Data colors*** dialog.

    ![Adjust the colors used for saturation.](media/power-bi-visualization-best-practices/power-bi-color-controls.png)

    **Figure 43: Adjust the colors used for saturation**

You can also use color to emphasize variance around a central value. For example, coloring positive values green and negative values red. Be aware of cultural differences when assigning colors to positive or negative values. Not all cultures use red for bad and green for good.

![Color to emphasize variance around central value.](media/power-bi-visualization-best-practices/power-bi-color.png)

**Figure 44: Color to emphasize variance around central value**

### Principles of visual design – applied to example report page

Now let’s take the visual principles discussed above and apply them to our sample report.

![Our example report (before).](media/power-bi-visualization-best-practices/power-bi-example5a.png)

**Figure 45: Our example report (before)**

![Our example report (after).](media/power-bi-visualization-best-practices/power-bi-example6anew.png)

**Figure 46: Our example report (after)**

#### What did we do?

| Item | Description |
| ---- | ----------- |
| Slicer | Removed blanks from the slicers by adding a page level filter and selecting only **Gold**, **Silver**, **Bronze**. <br> Changed **Selection Controls** to **Off** for **Single Select** and **Select All**. |
| Bubble | There are so many items in the legend that they scroll off the screen. Removed the legend and turned on **Category labels** instead. Customers can hover over the bubbles to see the details.<br> Shortened the title and removed “by country region” since that seems self-evident. <br> Turned axes labels **On** for both to make the chart easier to understand. |
| Filled map | Changed the **Data colors** to make it stand out more. <br> Turned **Diverging** on and set the **Minimum** to pink and the **Maximum** to red.
| Treemap | Removed filter that was set for only USA. <br> Set the **Data labels** to one decimal place. <br> The visual was using the **Class** field that isn’t useful since it will almost always be 33% for the 3 medals: Gold, Silver, and Bronze. <br> Selected a different more-interesting field, **Gender**. Changed Aquatics to blue and Athletics to grey for design.
| Top bar chart | Shortened the title, removed data labels, turned off legend title. <br> Changed word order of title to match the chart below.
| Bottom bar chart | Sorted by year ascending to match chart above. <br> Changed colors to match class. <br> Changed title. <br> Turned off legend for more space for data. <br> Turned on data labels. They won't show up in the report because the visual is too small for the labels to be easy to read. They will show up when the reader opens the visual in **Focus** mode. Learn about [Focus mode](../consumer/end-user-focus.md). <br> Added **Count of Event (Distinct)** to **Tooltips**. Now, when you hover over a stacked column, the tooltips also tell you how many events the people competed in that year. |
| Visual Interactions | Turned off interactions for both cards since we always want them to show total games and sports. |

## Visual types and best practices

Power BI provides many native visual types. Add the list of custom visuals available from Microsoft and from the Power BI community and the total options becomes too numerous to document here. Let’s look at some of the most-used native visual types.

### Line charts

![Line chart.](media/power-bi-visualization-best-practices/power-bi-line-chartb.png)

Line charts are a powerful way to look at data over time. Looking at data in tables doesn’t really take advantage of the speed in which our eyes spot peaks, valleys, cycles, and patterns. The example below shows the trends in the number of medals awarded and the number of athletes winning those medals.

![Line charts.](media/power-bi-visualization-best-practices/power-bi-line-chart.png)

**Figure 47: Line charts**

#### Best practices

* When people look at Line charts, the first thing they see is the shape of the curve. So you need to have an x-Axis that makes the curve meaningful such as time or distribution categories. If you put categorical fields like product or geography on the x-Axis, the Line chart will not be interesting. The shape of the curve would provide no meaningful info.

* If you choose to place multiple charts above and below each other to make it easier to compare across series like this, line up the X-Axis. Use filters to make sure that Power BI shows the same range of values. If you’re looking at date ranges, ensure they're the same date ranges. For example, 1896 to 2012 on both charts.

* Make full use of the space. If it makes sense for your data, set the **Start** and **End** points for the Y-Axis to eliminate empty space at the top and bottom of your chart. It also helps the visual to focus in on the actual data points. To set the **Start** and **End** points:

  1. Select the visual to make it active.

  1. Select ![Paint roller icon for Format pane.](media/power-bi-visualization-best-practices/power-bi-paint-roller.png) to open the **Format** pane.
  
  1. Expand the **Y-Axis** area and set the **Start** and **End** points.
  
      ![Set the Start and End points.](media/power-bi-visualization-best-practices/power-bi-start-end.png)
  
      **Figure 48: Set the Start and End points**

* Another reason to explicitly set the **Start** and **End** points is if you’re comparing two or more charts on the same page using the same Y-Axis field. For example, if you’re looking at cumulative event counts, and the United Kingdom has counts that range from 1 to 70 and Australia has counts that range from 1 to 12, the two Line charts will display different Y-Axes (Figure 49). It makes it difficult to compare at a glance. Instead, set the charts to use the same Y-Axis range (Figure 50).
  
  ![Line charts with different Y-Axes.](media/power-bi-visualization-best-practices/power-bi-line-chart2.png)
  
  **Figure 49: Line charts with different Y-Axes**
  
  ![Line charts with matching Y-Axes.](media/power-bi-visualization-best-practices/power-bi-line-chart3.png)
  
  **Figure 50: Line charts with matching Y-Axes**

For more info, see:

* [Customize X-Axis and Y-Axis properties](power-bi-visualization-customize-x-axis-and-y-axis.md)

* [Line Graphs and Irregular Intervals: An Incompatible Partnership](http://www.perceptualedge.com/articles/visual_business_intelligence/line_graphs_and_irregular_intervals.pdf)

* [Data Visualization 101: Line Charts](http://www.columnfivemedia.com/data-visualization-101-line-charts)

### Bar and Column charts

![Bar and column charts.](media/power-bi-visualization-best-practices/power-bi-bar-chart.png)

If Line charts are the standard for looking at data over time, Bar charts are the standard for looking at a specific value across different categories. If you sort the bars based on the number, you'll instantly see the top values and distribution. Horizontal Bar charts work well with long labels.

![Horizontal bar chart.](media/power-bi-visualization-best-practices/power-bi-horizontal-scroll.png)

**Figure 51: Horizontal Bar chart**

#### Best practices

* Display data labels for values. It makes it easier to identify specific values. To display data labels: 

  1. Select the visual to make it active.

  1. Select ![Paint roller icon for Format pane.](media/power-bi-visualization-best-practices/power-bi-paint-roller.png) to open the **Format** pane.
  
  1. Set **Data labels** to **On**.

      ![Turn on data labels.](media/power-bi-visualization-best-practices/power-bi-data-labels.png)

      **Figure 52: Turn on data labels**

* The bar chart above is useful to compare one measure against many measures at a single point in time. While the Line chart showed us the trend over time, the bar chart shows us the trend for a single category at a specific point in time. At a glance, our bar chart shows us Spain has one of the worst unemployment rates in the world, at 24.70%.

* When an entire Bar or Column chart doesn’t fit into the allotted space, Power BI adds scroll bars. When possible, and if it makes sense, structure the visual and report to show the entire chart. Then the reader gets an overview of the entire distribution. Unfortunately, it isn't possible in our example given the significant number of countries around the world.

  One way to limit the values included is to use a filter. For example, add a **Visual level** filter that shows the country only if unemployment rate is above 20%.

* You can drill down (and back up again) on Bar and Column charts. It's a great way to pack more info into a visual without taking up more real estate. The example below has a hierarchy for Regions > Countries. Double-clicking a region bar drills down to the countries that make up that region. For more info on drill mode, see [Drill mode in a visualization in Power BI](../consumer/end-user-drill.md).
  
  ![Drill down.](media/power-bi-visualization-best-practices/power-bi-drill.png)
  
  **Figure 53: Drill down**

For more details on Bar and Column charts:

* [Data Visualization 101: Bar Charts](http://blog.newscred.com/article/data-visualization-101-bar-charts)

* [Data Visualization Catalogue: Bar Chart](http://www.datavizcatalogue.com/methods/bar_chart.html#.VYV-hY3bLJw)

* [Data Visualization Catalogue: Multi-set Bar Chart](http://www.datavizcatalogue.com/methods/multiset_barchart.html#.VYV_gI3bLJw)

### Stacked Bar and Column charts

![Stacked charts.](media/power-bi-visualization-best-practices/power-bi-stacked.png)

Add another dimension to your Bar and Column charts by stacking different categories within the bar or column. Now the chart conveys info about one overall trend (based on height and length) but also shows the influence of the categories on that trend. The following chart shows the overall growth of top soccer team revenue above 6 billion in 2014.

![Stacked column chart](media/power-bi-visualization-best-practices/power-bi-deloite.png)

**Figure 54: Stacked column chart**

This stacked column chart shows us that **Total Revenue** is growing over time and that the **Commercial** and the **Broadcasting** categories are increasing steadily over time – contributing to overall revenue increase. However, this chart doesn’t make it easy to compare the impact each of the three categories has on each other. For example, "How does the growth of Commercial compare to the growth of Broadcasting or Match Day?" A better choice for this data, or a companion visual for this data, would be a Line chart.

![Convert to a Line chart.](media/power-bi-visualization-best-practices/power-bi-deloite2.png)

**Figure 55: Convert to a Line chart**

In this Line chart, it's easier to see how commercial revenue has grown the most followed by broadcast and match day.

#### Best practices

* As with Column and Bar charts, you have the option of horizontal or vertical display. Horizontal is a better choice if you have long labels and vertical if you have time series data.

* Avoid Stacked Bar and Column charts if you want to show trends and other patterns of change over time. Other charts, like Line charts, do a much better job.

* You can also have the distribution based on total volume or as a percentage of a total.

* As Few noted:

    > *... it is difficult to compare the segments of a stacked bar. If you arranged the segments side-by-side and all grew upwards from the same baseline, it would be easy to compare their heights, but when stacked upon one another, the task becomes hard. Plus, although it’s fairly easy to see how (revenue) changed from month to month it is quite difficult to see how (revenue) in the other (categories) changed*.

* 100% Stacked charts are a good choice when using percentages that add up to 100. In the example below, we see the category distribution by team. The percentages are relative and let us see the patterns at a glance. Everton’s revenue comes primarily from Broadcasting (over 70%) while PSG only derives 20% of its revenue from Broadcasting. The choice of a horizontal display makes it easier to fit the team labels and to see the impact of revenue type.

  ![Horizontal stacked chart.](media/power-bi-visualization-best-practices/power-bi-deloite3.png)

  **Figure 56: Horizontal stacked chart**

For more info on Stacked charts:

* [Data Visualization Catalogue: Stacked Bar Graphs](http://www.datavizcatalogue.com/methods/stacked_bar_graph.html#top)

* [When are 100% stacked bar graphs useful?](http://www.perceptualedge.com/blog/?p=2239)

### Combo Bar and Column charts

![Combo charts.](media/power-bi-visualization-best-practices/power-bi-combo.png)

In Power BI, you can combine Column and Line charts into a Combo chart. The choices are: 

* Line and Stacked Column chart 

* Line and Clustered Column chart

Save valuable canvas space by combining two separate visuals into one.

The next two screenshots show a before and after.

![As two separate charts.](media/power-bi-visualization-best-practices/power-bi-spain-line.png)

 **Figure 57: As two separate charts**

The first has two separate visuals: a Column chart showing population over time and a Line chart showing GDP over time. These charts are a good candidate for a Combo chart because they have the same X-Axis (year) and values (2002 through 2012). Why not combine them to compare these two trends on a single visual? Combining these two charts lets you make a quicker comparison of the data.

![As a single combo chart.](media/power-bi-visualization-best-practices/power-bi-spain-combo.png)

 **Figure 58: As a single combo chart**

The new report page has a single visual: a Line and Stacked Column chart. We could have easily created a line and clustered column chart. It’s now easier to look for a relationship between the two trends. We can see that up until 2008, population and GDP followed a similar trend. But starting in 2009, as population growth flattened, GDP was more volatile.

#### Best practices

* Combo charts work best when both visuals have at least one axis in common.

* Watch your axes! Is your Combo chart easy to read and interpret? Does it use dissimilar ranges and values? If the scale of the column chart’s Y-Axis is much smaller than the scale of the line chart’s Y-Axis, your combo chart won’t be meaningful. Notice the third line (aqua color) way down at the bottom.

   ![An unsuccessful Line chart.](media/power-bi-visualization-best-practices/power-bi-dual-line.png)

   **Figure 59: An unsuccessful Line chart**

  Also, your combo chart won’t be meaningful if your column chart and Line chart use two different measures and you don’t create dual axes. For example, dollars versus percent. Be sure to include both axes to help the reader understand the chart and consider adding axes labels as well.

  To create dual axes:

    1. Select the visual to make it active.

    1. Select ![Paint roller icon for Format pane.](media/power-bi-visualization-best-practices/power-bi-paint-roller.png) to open the **Format** pane.

    1. Expand **Y-Axis** and set **Show Secondary** to **On**.

          ![Show secondary axis.](media/power-bi-visualization-best-practices/power-bi-show-secondary-new.png)

          **Figure 60: Show secondary axis**

    1. Set the **Y-Axis (Column)** > **Title** to **On**.

    1. Set the **Y-Axis (Line)** > **Title** to **On**.

  Here's what the chart will look like:

  ![Create a combo chart instead.](media/power-bi-visualization-best-practices/power-bi-combo-chart.png)

  **Figure 61: Create a combo chart instead**

* Take advantage of dual axes. It’s a great way to compare multiple measures with different value ranges. It helps to illustrate the correlation between two measures in one visual.

For more info:

* [Combo chart in Power BI](power-bi-visualization-combo-chart.md)

* [Dual-Scaled Axes in Graphs: Are They Ever the Best Solution? ](http://www.perceptualedge.com/articles/visual_business_intelligence/dual-scaled_axes.pdf)

### Scatter chart

![Scatter chart](media/power-bi-visualization-best-practices/power-bi-scatter.png)

Sometimes we have many variables that we want to see together, and a scatter chart can be a useful way to get an overall picture. Scatter charts display relationships between 2 (Scatter) or 3 (Bubble) quantitative measures. A scatter chart always has two value axes to show one set of numerical data along a horizontal axis and another set of numerical values along a vertical axis. The chart shows points at the intersection of an x and y numerical value, combining these values into single data points. Power BI may distribute these data points evenly or unevenly across the horizontal axis. It depends on the data.

A bubble chart replaces the data points with bubbles, with the bubble size representing an additional dimension of the data.

The bubble chart below looks at South America and compares GDP per capita (Y-Axis) sum of GDP (X-Axis) and population by South American country.

![South America GDP and population as a bubble chart.](media/power-bi-visualization-best-practices/power-bi-bubble.png)

**Figure 62: South America GDP and population as a bubble chart**

The size of the bubbles represents total population for that country. Brazil has the largest population (bubble size) and the largest share of South America’s GDP. It's farthest along on the X-Axis. But notice that GDP per capita for Uruguay, Chile, and Argentina is higher than Brazil. They're farther up on the Y-Axis.

If you add a play axis, you can pretend you're Hans Rosling and tell the story over time: [From Data to Insight & Impact: Showing Africa's Progress with Power View and PPI by Microsoft](https://www.youtube.com/watch?v=PbaDBJWCeD4). To add a play axis, drag a datetime field into the **Play Axis** well.

#### Best practices

* Scatter and Bubble charts are great storytellers. But they aren't as useful when trying to explore data. Stephen Few points that out:

    > *The strength of this approach is when it’s used to tell a story. When Rosling narrates what’s happening in the chart as the bubbles move around and change in value, pointing to what he wants us to see, the information comes alive. Animated bubble charts, however, are much less effective for exploring and making sense of data on our own. I doubt that Rosling uses this method to discover the stories, but only to tell them once they’re known. We can’t attend more than one bubble at once as they’re moving around, so we’re forced to run the animation over and over to try to get a sense of what’s going on. We can add trails to selected bubbles, which make it possible to review the full path these bubble have taken, but if you use trails for more than a few bubbles the chart will quickly become too cluttered. Essentially, what I’m pointing out is that this is not the best way to display this information for exploration and analysis.*

* Add X- and Y-Axes labels to help tell the story. Especially with Bubble charts, there are many components at play and labels help readers understand the visual.

* Add data labels to make the visual easier to interpret. Especially with Bubble charts, when you have many items in the Legend, it may be difficult to distinguish between similar colors. In the visual above, the legend colors for Suriname, Columbia, and Ecuador are similar.

* Did you create a scatter chart and see only one data point that aggregates all the values on the X- and Y-Axes? Does your chart aggregate all the values along a single horizontal or vertical line? To fix the aggregation, add a field to the **Details** area to tell Power BI how to group the values. The field must be unique for each point you want to plot. For help, refer to the [Power BI scatter and bubble chart tutorial](power-bi-visualization-scatter.md).

### Treemap charts

![Treemap charts.](media/power-bi-visualization-best-practices/power-bi-treemap.png)

Treemaps can be useful for giving a good overview of the relative size of different components that make up a whole; especially when you can group them by categories. Anytime you try to understand a new business, having a treemap of the main components can be useful in knowing the overall distribution.

In the first chart below, you can see right away that Brazil makes up approximately half of South America’s GDP. You can also see that Columbia and Chile are roughly the same size.

Let's say you want to have broader context and still have an idea of the impact of the top contributing countries. Create visual hierarchies with category members (countries) nested inside regions. Primarily, the second treemap gives us an idea of the relative size of the regions. Then, within each region, we can see which individual countries contribute the most. We see that there are three massive regions: Europe, Asia and North America. Within those regions, we can easily see the top countries/regions.

The main limitation of a treemap is that it's difficult to compare the smaller rectangles. It's a good chart for an overview, but Column and Bar charts are probably a better choice to have more precise idea of the relative size of different components.

The first treemap gives a broad indication of the order of the GDP size. However, it’s hard to identify specific differences between countries, particularly the smaller unlabeled leaves. For this data, where you compare a single grouping, a Bar or Column chart might be a better choice.

![South America GDP comparison as a treemap.](media/power-bi-visualization-best-practices/power-bi-treemap3.png)

**Figure 63: South America GDP comparison as a treemap**

Next, we’ve added Region as another level of data. We can see the overall contribution to GDP by regions. Also, we can see the relative impact within the regions. Be aware that doing this with non-summative measure (like averages), the sum of the details might not represent the actual value at the aggregate level.

![GDP by region and country as a treemap.](media/power-bi-visualization-best-practices/power-bi-treemap2.png)

**Figure 64: GDP by region and country as a treemap**

For more info on treemaps:

* [Discovering Business Intelligence Using Treemap Visualizations](http://www.perceptualedge.com/articles/b-eye/treemaps.pdf)

* [Data Visualization Catalogue: Treemap](http://www.datavizcatalogue.com/methods/treemap.html#.VYhylI3bL7Y)

### Other charts

#### Pie or Donut charts

![Pie or Donut charts](media/power-bi-visualization-best-practices/power-bi-donut.png)

In general, Bar, Column, and Line charts will serve most purposes. It’s well understood that Pie and Donut charts are difficult for humans to interpret correctly. In fact, they can often distort data. Avoid them where possible. Stephen Few has an excellent write-up on the history and dangers in [Save the Pies for Dessert](https://www.perceptualedge.com/articles/08-21-07.pdf).

He does explain the one time where Pie charts can be useful, when comparing part-to-whole relationships. It is rarely better than a 100% Stacked Bar chart.

You can find another fun article (and animation) about Pie charts on the [Darkhorse Analytics site](http://www.darkhorseanalytics.com/blog/salvaging-the-pie).

#### Radial gauges & KPIs

![Radial Gauges & KPIs.](media/power-bi-visualization-best-practices/power-bi-gauge.png)

Radial gauges seem like a good visual for indicating performance against a target, and they are popular in executive dashboards. However, they suffer in two main ways. As with Pie charts, it’s difficult to interpret the angle of the shaded area compared to the full 180-degree arc or target line. It also uses a lot of space to show a single metric.

A good alternative is a simple KPI visual:

![A simple KPI visual.](media/power-bi-visualization-best-practices/power-bi-kpi.png)

KPIs show the value, status, goal variance from the goal, and trend in the same amount of space. The green coloring turns red if the data doesn't meet the target and can be yellow if the data hits some intermediate target. It’s much simpler to read and interpret than the gauge.

For more info, see:

* [Radial Gauge charts in Power BI](power-bi-visualization-radial-gauge-charts.md)

* [KPI visuals](power-bi-visualization-kpi.md)

## Conclusion

Now it’s time for you to put these best practices to the test. Keep in touch and share your own best practices. Don’t agree with our recommendations or found a great reason to break the rules? We’d love to hear about those experiences as well.

More questions? [Try the Power BI Community](http://community.powerbi.com/)

### Book recommendations

There are many good books available today to help teams refresh their knowledge on visual design techniques. Stephen Few’s *Information Dashboard Design* is a must-read. He delves into greater detail in two other books: *Show Me the Numbers* and *Now You See It*. Few and others have drawn inspiration from Edward R. Tufte, whose book *The Visual Display of Quantitative Information* is considered a classic in the field. Tufte has also written *Visual Explanations*, *Envisioning Information*, and *Beautiful Evidence*. Andy Kirk’s new book *Data Visualization: A Handbook for Data Driven Design* is another great option. Some other recommended authors are: Lachlan James, William McKnight, and Boris Evelson (Forrester), Darkhorse Analytics.
