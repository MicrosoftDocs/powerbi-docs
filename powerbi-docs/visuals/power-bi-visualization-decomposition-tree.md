# Use the decomposition tree visual in Power BI
[!INCLUDE [power-bi-visuals-desktop-banner](../includes/power-bi-visuals-desktop-banner.md)]

The decomposition tree visual in Power BI makes it very easy to visualize data across multiple dimensions. It automatically aggregates data and enables drilling down into your dimensions in any order. It is also an AI visualization meaning you can ask Power BI to find the next dimension to drill down into based on certain criteria. This makes it a valuable tool for ad hoc exploration and conducting root cause analysis.

![Decomposition tree](media/power-bi-visualization-decomposition-tree/tree-full.png)

In this tutorial we will be using two examples:

A supply chain scenario. We are going to analyze what % of products a company has on backorder (out of stock).  
A sales scenario. We are going to breakdown video game sales by numerous factors like game genre and publisher.


## Getting Started
You can author a decomposition tree by selecting the following icon in the visualizations pane:
![Decomposition tree watermark](media/power-bi-visualization-decomposition-tree/tree-watermark.png)

The visualization requires two types of inputs in the fieldwell:

**Analyze** – the metric you would like to analyze. This has to be a measure or an aggregate.  
**Explain By** – one ore more dimensions you would like to drill down into.

Once you drag your measure into the fieldwell the visual updates showcasing the aggregated measure. In the example below we are visualizing the average % of products on backorder (5.07%)
![Decomposition tree root node](media/power-bi-visualization-decomposition-tree/tree-root.png)

The next step is to bring in one or more dimensions you would like to drill down into. Once you bring in fields into Explain By a plus appears next to your root node. Selecting the + lets you choose which field you would like to drill into (you can drill into fields in any order that you want).
![Decomposition tree menu](media/power-bi-visualization-decomposition-tree/tree-menu.png)

Selecting Forecast Bias results in the tree expanding and breaking down the measure by the values in the column. This process can be repeated by choosing another node to drill into.
![Decomposition tree expansion](media/power-bi-visualization-decomposition-tree/tree-expansion.png)

Selecting a node from the last level cross-filters the data whereas selecting a node from an earlier level changes the path.

![Decomposition tree menu](media/power-bi-visualization-decomposition-tree/tree-interaction.gif)

Interacting with other visuals cross-filters the decomposition tree. The order of the nodes within levels could change as a result.
In the example below we cross-filter the tree by Ubisoft. The path updates and Xbox sales move from first to second place, surpassed by PlayStation. 

We then cross-filter the tree by Nintendo. In this case Xbox sales are blank as there are no Nintendo games developed for Xbox. Xbox along with its subsequent path gets filtered out of the view.

Despite the path disappearing, the existing levels (in this case Game Genre) remain pinned on the tree. Clicking the Nintendo node therefore automatically expands the tree to Game Genre.

![Decomposition tree menu](media/power-bi-visualization-decomposition-tree/tree-interaction-2.gif)


## AI Splits

You can use “AI Splits” to figure out where you should look next in the data. These splits appear at the top of the list and are marked with a lightbulb. The splits are aimed to help find high and low values in the data automatically.

The analysis can work in two ways depending on your preferences. The default behavior is as follows:

**High Value**: Considers all available fields and determines which one to drill into to get the highest value of the measure being analyzed.  
**Low Value**: Considers all available fields and determines which one to drill into to get the lowest value of the measure being analyzed.  

Selecting ‘High Value’ in the backorders example, results in the following:
![Decomposition tree AI split](media/power-bi-visualization-decomposition-tree/tree-ai-split.png)

A lightbulb appears next to Product Type indicating this was an ‘AI split’. The tree also provides a dotted line recommending the ‘Patient Monitoring’ node as that results in the highest value of backorders (9.2%). 

Hovering over the lightbulb tells me that “% on backorder is highest when Product Type is Patient Monitoring”.

You can configure the visual to find **Relative** AI splits as opposed to **Absolute** ones. 

Relative mode looks for high values that stand out (compared to the rest of the data in the column). To illustrate this let’s take a look at an example:
![Decomposition tree absolute split](media/power-bi-visualization-decomposition-tree/tree-ai-absolute.png)

In the screenshot above, we are looking at North America Sales of video games. We first split the tree by Publisher Name and then drill into Nintendo. Selecting ‘High Value’ results in the expansion of Platform is Nintendo. Since Nintendo (the publisher) only develops for Nintendo consoles, there is only one value present and so that is unsurprisingly the highest value.

Nevertheless, a more interesting split would be to look at which high value stands out relative to other values in the same column. If we change the Analysis type from Absolute to Relative we get the following result for Nintendo:
![Decomposition tree relative split](media/power-bi-visualization-decomposition-tree/tree-ai-relative.png)

This time, the recommended value is Platform within Game Genre.  Platform doesn’t yield a higher absolute value than Nintendo ($19,950,000 vs. $46,950,000). Nevertheless it’s a value that stands out.

More precisely, since there are 10 Game Genre values, the expected value for Platform would be $4.6M if they were to be split evenly. Since Platform has a value of almost $20M that is an interesting result as it is 4x higher than the expected result.

The calculation is as follows:

North America Sales for Platform/ Abs(Avg(North America Sales for Game Genre))  
vs.  
North America Sales for Nintendo / Abs(Avg(North America Sales for Platform))  

Which translates to:

19,550,000 / (19,550,000 + 11,140,000 + ... + 470,000 + 60,000 /10) = 4.25x  
vs.  
46,950,000/ (46,950,000/1) = 1x  

If you prefer not to use any AI splits in the tree you also have the option of turning them off under the Analysis formatting options:  

![Decomposition tree disable AI split](media/power-bi-visualization-decomposition-tree/tree-ai-disable.png)

## Tree Interactions with AI Splits

You can have multiple subsequent AI levels. You can also mix up different kinds of AI levels (go from High Value to Low Value and back to High Value):
![Decomposition tree multiple AI paths](media/power-bi-visualization-decomposition-tree/tree-multi-ai-path.png)

If you select a different node in the tree, the AI Splits recalculate from scratch. In the example below the we changed the selected node in the Forecast Bias level. The subsequent levels change to yield the correct High and Low Values
![Decomposition tree AI interactions](media/power-bi-visualization-decomposition-tree/tree-ai-interactions.png)

AI levels are also recalculated when you cross-filters the decomposition tree from another visual. In the example below we can see that our backorder % is highest for Plant #0477.

![Decomposition tree crossfiltering](media/power-bi-visualization-decomposition-tree/tree-ai-crossfilter1.png)

When I select April in the bar chart, the highest changes to ‘Product Type is Advanced Surgical’. In this case it’s not just the nodes that got re-ordered but a completely different column was chosen. 

![Decomposition tree crossfiltering](media/power-bi-visualization-decomposition-tree/tree-ai-crossfilter2.png)

If we want AI levels to behave like non-AI levels we can simply click on the lightbulb to revert the behavior to normal. 

Whilst multiple AI levels can be chained together, a non-AI level cannot follow an AI level. If we do a manual split following an AI split, the lightbulb from the AI level disappears and the level transforms into a normal level. 

## Locking

A content creator can lock levels for their end users. When a level is locked it cannot be removed or changed. An end user can explore different paths within the locked level but they cannot change the level itself. As a creator you can hover over existing level to see the lock icon. You can lock as many levels as you want (but you cannot have unlocked levels preceding locked levels).

In the example below I have locked the first 2 levels. This means that end users can change level 3 and 4 and even add new levels afterwards. The first 2 levels however are not mutable:

![Decomposition tree locking](media/power-bi-visualization-decomposition-tree/tree-locking.png)

## Known Limitations

The decomposition tree is not supported in the following scenarios:  
-	On prem Analysis Services

AI Splits are not supported in the following scenarios:  
-	Azure Analysis Services
-	Direct Query
-	Report Server
-	Publish to Web
-	Complex measures 

Other preview limitations:
- Power BI mobile  
- Pinning to dashboard
- Show Data functionality
- Support inside Q&A
