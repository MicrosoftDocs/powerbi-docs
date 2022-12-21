---
title: "Tutorial: Shape and combine data in Power BI Desktop"
description: In this tutorial, you learn how to shape and combine data in Power BI Desktop
author: davidiseminger
ms.author: davidi
ms.reviewer: ''
ms.service: powerbi
ms.subservice: pbi-data-sources
ms.topic: tutorial
ms.date: 12/9/2022
LocalizationGroup: Transform and shape data
#Customer intent: As a data analyst or report creator, I want to connect to more than one data source, so that I can use those data sources to create data models and build reports.
---
# Tutorial: Shape and combine data in Power BI Desktop

With Power BI Desktop, you can connect to many different types of data sources, then shape the data to meet your needs, enabling you to create visual reports to share with others. *Shaping* data means transforming the data: renaming columns or tables, changing text to numbers, removing rows, setting the first row as headers, and so on. *Combining* data means connecting to two or more data sources, shaping them as needed, then consolidating them into a single query.

In this tutorial, you'll learn how to:

* Shape data by using Power Query Editor.
* Connect to different data sources.
* Combine those data sources, and create a data model to use in reports.

This tutorial demonstrates how to shape a query by using Power BI Desktop, highlighting the most common tasks. The query used here is described in more detail, including how to create the query from scratch, in [Getting Started with Power BI Desktop](../fundamentals/desktop-getting-started.md).

Power Query Editor in Power BI Desktop uses the right-click menus, and the **Transform** ribbon. Most of what you can select in the ribbon is also available by right-clicking an item, such as a column, and choosing from the menu that appears.

## Shape data

To shape data in Power Query Editor, you provide step-by-step instructions for Power Query Editor to adjust the data as it loads and presents the data. The original data source isn't affected; only this particular view of the data is adjusted, or *shaped*.

The steps you specify (such as rename a table, transform a data type, or delete a column) are recorded by Power Query Editor. Each time this query connects to the data source, Power Query Editor carries out those steps so that the data is always shaped the way you specify. This process occurs whenever you use Power Query Editor, or for anyone who uses your shared query, such as on the Power BI service. Those steps are captured, sequentially, in the **Query Settings** pane, under **APPLIED STEPS**. We’ll go through each of those steps in the next few paragraphs.

:::image type="content" source="media/desktop-shape-and-combine-data/query-settings-applied-steps.png" alt-text="Screenshot showing the Query Settings pane with Applied steps":::

1. Import the data from a web source, in this case a local file. Copy the following HTML code, paste it into a new file, and save the new file on your computer as `RetirementDataTable.html`. You can use Notepad or any other text editor.

    ```html
    <!DOCTYPE html>
    <!-- saved from url=https://bankrate.infogram.com/best-and-worst-states-for-retirees-ranking-table-1hd12yxwn0rlw6k -->
    <html lang="en">
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        </head>
    
        <body>
    
          <table>
            <tr>
              <th>State</th>
              <th>Overall rank</th>
              <th>Overall score</th>
              <th>Affordability</th>
              <th>Well-being</th>
              <th>Culture & diversity</th>
              <th>Weather</th>
              <th>Crime</th>
            </tr>
    
            <tr>
              <td>Florida</td><td>1</td><td>32.04</td><td>18</td><td>20</td><td>1</td><td>5</td><td>27</td></tr><tr>
              <td>Georgia</td><td>2</td><td>30.37</td><td>7</td><td>35</td><td>37</td><td>4</td><td>29</td></tr><tr>
              <td>Michigan</td><td>3</td><td>30.19</td><td>1</td><td>39</td><td>30</td><td>36</td><td>26</td></tr><tr>
              <td>Ohio</td><td>4</td><td>29.79</td><td>11</td><td>32</td><td>34</td><td>21</td><td>20</td></tr><tr>
              <td>Missouri</td><td>5</td><td>29.78</td><td>3</td><td>36</td><td>32</td><td>19</td><td>42</td></tr><tr>
              <td>Kentucky</td><td>6</td><td>29.25</td><td>5</td><td>47</td><td>50</td><td>3</td><td>11</td></tr><tr>
              <td>Texas</td><td>7</td><td>29.07</td><td>9</td><td>27</td><td>48</td><td>10</td><td>38</td></tr><tr>
              <td>Tennessee</td><td>8</td><td>28.85</td><td>2</td><td>42</td><td>33</td><td>13</td><td>45</td></tr><tr>
              <td>Pennsylvania</td><td>9</td><td>28.10</td><td>27</td><td>18</td><td>15</td><td>33</td><td>12</td></tr><tr>
              <td>South Dakota</td><td>10</td><td>28.06</td><td>15</td><td>33</td><td>16</td><td>41</td><td>22</td></tr><tr>
              <td>West Virginia</td><td>11</td><td>28.04</td><td>14</td><td>48</td><td>16</td><td>8</td><td>16</td></tr><tr>
              <td>Mississippi</td><td>12</td><td>27.82</td><td>4</td><td>50</td><td>49</td><td>11</td><td>22</td></tr><tr>
              <td>Arizona</td><td>13</td><td>27.54</td><td>24</td><td>25</td><td>20</td><td>1</td><td>41</td></tr><tr>
              <td>Iowa</td><td>14</td><td>27.28</td><td>19</td><td>30</td><td>27</td><td>31</td><td>12</td></tr><tr>
              <td>North Carolina</td><td>15</td><td>27.17</td><td>16</td><td>38</td><td>29</td><td>17</td><td>32</td></tr><tr>
              <td>Illinois</td><td>16</td><td>26.45</td><td>28</td><td>13</td><td>31</td><td>30</td><td>25</td></tr><tr>
              <td>Wisconsin</td><td>17</td><td>26.42</td><td>26</td><td>24</td><td>22</td><td>38</td><td>12</td></tr><tr>
              <td>Indiana</td><td>18</td><td>26.25</td><td>12</td><td>41</td><td>43</td><td>24</td><td>22</td></tr><tr>
              <td>Oklahoma</td><td>19</td><td>26.13</td><td>6</td><td>43</td><td>46</td><td>14</td><td>42</td></tr><tr>
              <td>New York</td><td>20</td><td>26.08</td><td>42</td><td>5</td><td>5</td><td>34</td><td>15</td></tr><tr>
              <td>Virginia</td><td>21</td><td>26.05</td><td>34</td><td>12</td><td>40</td><td>23</td><td>9</td></tr><tr>
              <td>Wyoming</td><td>22</td><td>25.83</td><td>23</td><td>29</td><td>19</td><td>49</td><td>7</td></tr><tr>
              <td>New Hampshire</td><td>23</td><td>25.79</td><td>37</td><td>21</td><td>7</td><td>45</td><td>1</td></tr><tr>
              <td>North Dakota</td><td>24</td><td>25.63</td><td>25</td><td>16</td><td>39</td><td>46</td><td>18</td></tr><tr>
              <td>South Carolina</td><td>25</td><td>25.49</td><td>17</td><td>40</td><td>25</td><td>16</td><td>46</td></tr><tr>
              <td>New Jersey</td><td>26</td><td>25.30</td><td>46</td><td>3</td><td>21</td><td>26</td><td>3</td></tr><tr>
              <td>Nevada</td><td>27</td><td>25.28</td><td>32</td><td>17</td><td>11</td><td>20</td><td>40</td></tr><tr>
              <td>Colorado</td><td>28</td><td>25.23</td><td>30</td><td>7</td><td>24</td><td>44</td><td>37</td></tr><tr>
              <td>Arkansas</td><td>29</td><td>25.04</td><td>8</td><td>49</td><td>41</td><td>8</td><td>46</td></tr><tr>
              <td>Nebraska</td><td>30</td><td>24.96</td><td>28</td><td>19</td><td>35</td><td>37</td><td>21</td></tr><tr>
              <td>Utah</td><td>31</td><td>24.81</td><td>35</td><td>10</td><td>47</td><td>25</td><td>18</td></tr><tr>
              <td>Massachusetts</td><td>32</td><td>24.78</td><td>47</td><td>1</td><td>13</td><td>35</td><td>10</td></tr><tr>
              <td>Idaho</td><td>33</td><td>24.71</td><td>21</td><td>34</td><td>36</td><td>43</td><td>6</td></tr><tr>
              <td>Rhode Island</td><td>34</td><td>24.70</td><td>44</td><td>11</td><td>9</td><td>28</td><td>7</td></tr><tr>
              <td>Minnesota</td><td>35</td><td>24.64</td><td>33</td><td>15</td><td>23</td><td>42</td><td>17</td></tr><tr>
              <td>Alabama</td><td>36</td><td>24.59</td><td>10</td><td>46</td><td>42</td><td>15</td><td>44</td></tr><tr>
              <td>Kansas</td><td>37</td><td>24.41</td><td>20</td><td>26</td><td>45</td><td>27</td><td>35</td></tr><tr>
              <td>Oregon</td><td>38</td><td>24.33</td><td>40</td><td>14</td><td>6</td><td>29</td><td>28</td></tr><tr>
              <td>Louisiana</td><td>39</td><td>24.30</td><td>13</td><td>44</td><td>44</td><td>6</td><td>48</td></tr><tr>
              <td>Delaware</td><td>40</td><td>23.76</td><td>39</td><td>22</td><td>2</td><td>18</td><td>36</td></tr><tr>
              <td>Washington</td><td>41</td><td>23.49</td><td>38</td><td>9</td><td>28</td><td>32</td><td>34</td></tr><tr>
              <td>Hawaii</td><td>42</td><td>23.31</td><td>50</td><td>2</td><td>8</td><td>2</td><td>32</td></tr><tr>
              <td>Connecticut</td><td>43</td><td>23.10</td><td>48</td><td>8</td><td>14</td><td>39</td><td>4</td></tr><tr>
              <td>Maryland</td><td>44</td><td>22.23</td><td>43</td><td>4</td><td>38</td><td>22</td><td>29</td></tr><tr>
              <td>Vermont</td><td>45</td><td>22.22</td><td>45</td><td>23</td><td>3</td><td>40</td><td>4</td></tr><tr>
              <td>Montana</td><td>46</td><td>21.96</td><td>31</td><td>31</td><td>10</td><td>47</td><td>29</td></tr><tr>
              <td>New Mexico</td><td>47</td><td>21.70</td><td>22</td><td>45</td><td>18</td><td>12</td><td>50</td></tr><tr>
              <td>California</td><td>48</td><td>21.61</td><td>49</td><td>6</td><td>12</td><td>7</td><td>38</td></tr><tr>
              <td>Maine</td><td>49</td><td>19.48</td><td>41</td><td>37</td><td>4</td><td>50</td><td>2</td></tr><tr>
              <td>Alaska</td><td>50</td><td>17.31</td><td>36</td><td>28</td><td>26</td><td>48</td><td>49</td></tr>
          </table>
        </body>
      </html>
    ```
    
1. Open `RetirementDataTable.html` in a web browser and copy its URL from the browser's address bar.

    :::image type="content" source="media/desktop-shape-and-combine-data/local-table-url.png" alt-text="Screenshot showing the URL for the local file RetirementDataTable.html":::

1. Select the **Get data** dropdown, then choose **Web**.

    :::image type="content" source="media/desktop-shape-and-combine-data/get-data-web.png" alt-text="Screenshot showing the Get data menu with the Web source selected":::

1. Paste the copied URL into the **From Web** dialog and select **OK**.
 
    :::image type="content" source="media/desktop-shape-and-combine-data/from-web-dialog-with-url.png" alt-text="Screenshot showing the From Web dialog with the source file's URL":::

1. In the **Navigator** dialog, select `Table 1`, then choose **Transform Data**.

    :::image type="content" source="media/desktop-shape-and-combine-data/get-data-web-navigator-dialog-transform-data.png" alt-text="Screenshot showing the Navigator dialog with an HTML table selected and the Transform Data button":::

1. The Power Query Editor window opens. You can see the default steps applied so far, in the **Query Settings** pane under **APPLIED STEPS**. 

     - **Source**: Connecting to the website.
     - **Extracted Table from Html**: Selecting the table. 
     - **Promoted Headers**: Changing the top row of data (`<th>` lines in the source HTML) into column headers.
     - **Changed Type**: Changing the column types, which are imported as text, to their inferred types. 

    :::image type="content" source="media/desktop-shape-and-combine-data/power-query-editor-query-settings-dialog.png" alt-text="Screenshot showing how to Power Query window with Query Settings highlighted":::

1. Change the table name from the default `Table 1` to `Retirement Data`, then press **Enter**.

    :::image type="content" source="media/desktop-shape-and-combine-data/query-settings-change-table-name.png" alt-text="Screenshot showing how to edit a table name in Query Settings":::

1. The existing data is ordered by a weighted score, as described [here](https://infogram.com/best-and-worst-states-for-retirees-ranking-table-1hd12yxwn0rlw6k). Let's add a custom column to calculate a different score, based on all data being equal factors. We'll then sort the table on this column to compare the custom score's ranking to the existing **Rank**.

1. From the **Add Column** ribbon, select **Custom Column**.

    :::image type="content" source="media/desktop-shape-and-combine-data/add-column-custom-column.png" alt-text="Screenshot showing the Add Column ribbon with the Custom Column button":::

1. In the **Custom Column** dialog, in **New column name**, enter *New score*. For the **Custom column formula**, enter the following data:

    ```
    ([Affordability] + [#"Well-being"] + [#"Culture & diversity"] + [Weather] + [Crime]) / 5    
    ```
 
1. Make sure the status message is *No syntax errors have been detected*, and select **OK**.

    :::image type="content" source="media/desktop-shape-and-combine-data/custom-column-dialog.png" alt-text="Screenshot showing the Custom Column dialog with the column name, column formula, and no syntax errors":::

1. In **Query Settings**, the **APPLIED STEPS** list now shows the new **Added Custom** step we just defined. 

      :::image type="content" source="media/desktop-shape-and-combine-data/query-settings-applied-steps-custom-column.png" alt-text="Screenshot of Query Editor showing the Applied Steps list":::

## Adjust the data

Before we work with this query, let's make a few changes to adjust its data:

   - Adjust the rankings by removing a column.

      For example, assume **Affordability** isn't a factor in our results. Removing this column from the query doesn't affect the other data. 

   - Fix any errors.

       Because we removed a column, we need to adjust our calculations in the **New score** column by changing its formula.

   - Sort the data.

       Sort the data based on the **New score** column, then create an associated **New rank** column to compare to the existing **Rank** column.
 
   - Replace the data.

       We'll highlight how to replace a specific value and how to insert an applied step.

These changes are described in the following steps. 

1. To remove the **Affordability** column, select the column, choose the **Home** tab from the ribbon, and then choose **Remove Columns**.

    :::image type="content" source="media/desktop-shape-and-combine-data/remove-columns-button.png" alt-text="Screentshot showing the Remove Columns button":::

   Note the **New score** values haven't changed, due to the ordering of the steps. Power Query Editor records the steps sequentially, yet independently, of each other. To apply actions in a different sequence, you can move each applied step up or down. 

1. Right-click a step to see its context menu.

   :::image type="content" source="media/desktop-shape-and-combine-data/applied-steps-context-menu.png" alt-text="Screenshot showing the Applied Steps context menu":::

1. Move up the last step, **Removed Columns**, to just above the **Added Custom** step.

   :::image type="content" source="media/desktop-shape-and-combine-data/applied-steps-moved-step-up.png" alt-text="Screenshot showing the Applied Steps list with the Removed Columns step now above the Custom Column step":::

1. Select the **Added Custom** step. 

   Notice the **New score** column now shows *Error* rather than the calculated value.

   :::image type="content" source="media/desktop-shape-and-combine-data/custom-column-new-score-showing-errors.png" alt-text="Screenshot showing the New score column with Error values":::

   There are several ways to get more information about each error. If you select the cell without clicking on the word *Error*, Power Query Editor displays the error information.

   :::image type="content" source="media/desktop-shape-and-combine-data/new-score-column-error-details.png" alt-text="Screenshot showing the New score column with Error details":::

   If you select the word *Error* directly, Power Query Editor creates an **Applied Step** in the **Query Settings** pane and displays information about the error. Because we don't need to display error information anywhere else, select **Cancel**.

1. To fix the errors, there are two changes needed, removing the *Affordability* column name and changing the divisor from 5 to 4. You can make these changes in two ways:

    1. Right-click the **Custom Column** step and select **Edit Settings**. This brings up the **Custom Column** dialog you used to create the **New score** column. Edit the formula as described previously, until it looks like this:

       :::image type="content" source="media/desktop-shape-and-combine-data/custom-column-dialog-with-errors-fixed.png" alt-text="Screenshot showing the Custom Column dialog with formula errors fixed":::
    
    1. Select the **New score** column, then display the column's data formula by enabling the **Formula Bar** checkbox from the **View** tab. 

       :::image type="content" source="media/desktop-shape-and-combine-data/new-score-column-show-formula-bar.png" alt-text="Screenshot showing the New score column and its data formula":::
        
       Edit the formula as described previously, until it looks like this, then press **Enter**.

          ```
          = Table.AddColumn(#"Removed Columns", "New score", each ([#"Well-being"] + [#"Culture & diversity"] + [Weather] + [Crime]) / 4)
          ```
          
   Power Query Editor replaces the data with the revised values and the **Added Custom** step completes with no errors.

   > [!NOTE]
   > You can also select **Remove Errors**, by using the ribbon or the right-click menu, which removes any rows that have errors. However, in this tutorial we want to preserve all the data in the table.

1. Sort the data based on the **New score** column. First, select the last applied step, **Added Custom** to display the most recent data. Then, select the drop-down located next to the **New score** column header and choose **Sort Descending**.

   :::image type="content" source="media/desktop-shape-and-combine-data/shapecombine_sort.png" alt-text="Sort data in New score column":::

   The data is now sorted according to **New score**. However, if you look at the **Rank** column, you'll notice the data isn't sorted properly in cases where the **New score** value is a tie. 

1. To fix the data sorting issue, select the **New score** column and change the formula in the **Formula Bar** to the following formula:

   ```
    = Table.Sort(#"Changed Type1",{{"New score", Order.Ascending},{"Rank", Order.Ascending}})
   ```

1. Select the green checkmark to the left of the formula box, or press **Enter**. 

   The rows are now ordered in accordance with both **New score** and **Rank**. In addition, you can select an **Applied Step** anywhere in the list, and continue shaping the data at that point in the sequence. Power Query Editor automatically inserts a new step directly after the currently selected **Applied Step**. 

1. In **Applied Step**, select the step preceding the custom column, which is the **Removed Columns** step. Here we'll replace the value of the **Weather** ranking in Arizona. Right-click the appropriate cell that contains Arizona's **Weather** ranking, and then select **Replace Values**. Note which **Applied Step** is currently selected.

   :::image type="content" source="media/desktop-shape-and-combine-data/shapecombine_replacevalues2.png" alt-text="Select Replace Values for column":::

1. Select **Insert**.

    Because we're inserting a step, Power Query Editor reminds us that subsequent steps could cause the query to break. 

    :::image type="content" source="media/desktop-shape-and-combine-data/shapecombine_insertstep.png" alt-text="Insert Step verification":::

1. Change the data value to _51_. 

   Power Query Editor replaces the data for Arizona. When you create a new applied step, Power Query Editor names it based on the action, in this case, **Replaced Value**. If you have more than one step with the same name in your query, Power Query Editor appends an increasing number to each subsequent applied step's name.

1. Select the last **Applied Step**, **Sorted Rows**. 

   Notice the data has changed regarding Arizona's new ranking. This change occurs because we inserted the **Replaced Value** step in the correct location, before the **Added Custom** step.

   We’ve now shaped our data to the extent we need to. Next let’s connect to another data source, and combine data.

## Combine data

The data about various states is interesting, and will be useful for building further analysis efforts and queries. However, most data about states uses a two-letter abbreviation for state codes, not the full name of the state. We need a way to associate state names with their abbreviations.

There's another public data source that does provides that association, but it needs a fair amount of shaping before we can connect it to our retirement table. To shape the data, follow these steps:

1. From the **Home** ribbon in Power Query Editor, select **New Source \> Web**. 

2. Enter the address of the website for state abbreviations, *https://en.wikipedia.org/wiki/List_of_U.S._state_abbreviations*, and then select **Connect**.

   The Navigator displays the content of the website.

    :::image type="content" source="media/desktop-shape-and-combine-data/designer_gsg_usstateabbreviationsnavigator2.png" alt-text="Navigator page":::

1. Select **Codes and abbreviations**. 

   > [!TIP]
   > It will take quite a bit of shaping to pare this table’s data down to what we want. Is there a faster or easier way to accomplish the following steps? Yes, we could create a *relationship* between the two tables, and shape the data based on that relationship. The following example steps are helpful to learn for working with tables. However, relationships can help you quickly use data from multiple tables.

To get the data into shape, follow these steps:

1. Remove the top row. Because it's a result of the way that the web page’s table was created, we don’t need it. From the **Home** ribbon, select **Remove Rows \> Remove Top Rows**.

    :::image type="content" source="media/desktop-shape-and-combine-data/shapecombine_removetoprows.png" alt-text="Select Remove Top Rows":::

    The **Remove Top Rows** window appears, letting you specify how many rows you want to remove.

    > [!NOTE]
    > If Power BI accidentally imports the table headers as a row in your data table, you can select **Use First Row As Headers** from the **Home** tab, or from the **Transform** tab in the ribbon, to fix your table.

1. Remove the bottom 26 rows. These rows are U.S. territories, which we don’t need to include. From the **Home** ribbon, select **Remove Rows \> Remove Bottom Rows**.

    :::image type="content" source="media/desktop-shape-and-combine-data/shapecombine_removebottomrows.png" alt-text="Select Remove Bottom Rows":::

1. Because the RetirementStats table doesn't have information for Washington DC, we need to filter it from our list. Select the **Region Status** drop-down, then clear the checkbox beside **Federal district**.

    :::image type="content" source="media/desktop-shape-and-combine-data/shapecombine_filterdc.png" alt-text="Clear Federal district check box":::

1. Remove a few unneeded columns. Because we need only the mapping of each state to its official two-letter abbreviation, we can remove several columns. First select a column, then hold down the **CTRL** key and select each of the other columns to be removed. From the **Home** tab on the ribbon, select **Remove Columns \> Remove Columns**.

   :::image type="content" source="media/desktop-shape-and-combine-data/shapecombine_removecolumns.png" alt-text="Remove column":::

   > [!NOTE]
   > The *sequence* of applied steps in Power Query Editor is important, and affects how the data is shaped. It’s also important to consider how one step may impact another subsequent step. For example, if you remove a step from the applied steps, subsequent steps may not behave as originally intended.

   > [!NOTE]
   > When you resize the Power Query Editor window to make the width smaller, some ribbon items are condensed to make the best use of visible space. When you increase the width of the Power Query Editor window, the ribbon items expand to make the most use of the increased ribbon area.

1. Rename the columns and the table. There are a few ways to rename a column: First select the column, then either select **Rename** from the **Transform** tab on the ribbon, or right-click and select **Rename**. The following image shows both options, but you only need to choose one.

   :::image type="content" source="media/desktop-shape-and-combine-data/shapecombine_rename.png" alt-text="Rename column in Power Query Editor":::

1. Rename the columns to *State Name* and *State Code*. To rename the table, enter the **Name** *StateCodes* in the **Query Settings** pane. 

## Combine queries

Now that we’ve shaped the StateCodes table the way we want, let’s combine these two tables, or queries, into one. Because the tables we now have are a result of the queries we applied to the data, they’re often referred to as *queries*.

There are two primary ways of combining queries: *merging* and *appending*.

- When you've one or more *columns* that you’d like to add to another query, you *merge* the queries. 
- When you have more *rows* of data that you’d like to add to an existing query, you *append* the query.

In this case, we want to merge the queries:
 
1. From the left pane of Power Query Editor, select the query *into which* you want the other query to merge. In this case, it's **RetirementStats**. 

1. Select **Merge Queries \> Merge Queries** from the **Home** tab on the ribbon.

   :::image type="content" source="media/desktop-shape-and-combine-data/shapecombine_mergequeries.png" alt-text="Select Merge Queries":::

   You may be prompted to set the privacy levels, to ensure the data is combined without including or transferring data you don't want transferred.

   The **Merge** window appears. It prompts you to select which table you'd like merged into the selected table, and the matching columns to use for the merge. 

1. Select **State** from the RetirementStats table, then select the **StateCodes** query. 

   When you select the correct matching columns, the **OK** button is enabled.

   :::image type="content" source="media/desktop-shape-and-combine-data/shapecombine_merge2.png" alt-text="Merge window":::

1. Select **OK**.

   Power Query Editor creates a new column at the end of the query, which contains the contents of the table (query) that was merged with the existing query. All columns from the merged query are condensed into the column, but you can **Expand** the table and include whichever columns you want.

   :::image type="content" source="media/desktop-shape-and-combine-data/shapecombine_mergenewcolumn.png" alt-text="NewColumn column":::

1. To expand the merged table, and select which columns to include, select the expand icon (:::image type="content" source="media/desktop-shape-and-combine-data/icon.png" alt-text="Expand icon":::. 

   The **Expand** window appears.

   :::image type="content" source="media/desktop-shape-and-combine-data/shapecombine_mergeexpand.png" alt-text="NewColumn in query":::

1. In this case, we want only the **State Code** column. Select that column, clear **Use original column name as prefix**, and then select **OK**.

   If we had left the checkbox selected for **Use original column name as prefix**, the merged column would be named **NewColumn.State Code**.

   > [!NOTE]
   > If you want to explore how to bring in the NewColumn table, you can experiment a bit. If you don’t like the results, just delete that step from the **APPLIED STEPS** list in the **Query Settings** pane, and your query returns to the state prior to applying that **Expand** step. You can do this as many times as you like until the expand process looks the way you want it.

   We now have a single query (table) that combines two data sources, each of which has been shaped to meet our needs. This query can be a basis for interesting data connections, such as housing cost statistics, demographics, or job opportunities in any state.

1. To apply your changes and close Power Query Editor, select **Close & Apply** from the **Home** ribbon tab. 

   The transformed dataset appears in Power BI Desktop, ready to be used for creating reports.

   :::image type="content" source="media/desktop-shape-and-combine-data/shapecombine_closeandapply.png" alt-text="Select Close & Apply":::

## Next steps
For more information on Power BI Desktop and its capabilities, see the following resources:

* [What is Power BI Desktop?](../fundamentals/desktop-what-is-desktop.md)
* [Query overview in Power BI Desktop](../transform-model/desktop-query-overview.md)
* [Data sources in Power BI Desktop](desktop-data-sources.md)
* [Connect to data in Power BI Desktop](desktop-connect-to-data.md)
* [Common query tasks in Power BI Desktop](../transform-model/desktop-common-query-tasks.md)   
