---
title: Create page and button navigators
description: Using Power BI’s built-in navigators, you can quickly build page and bookmark navigation experiences with just a few clicks.
author: Sujata994
ms.author: sunaraya
ms.reviewer: ''
ms.service: powerbi
ms.subservice: pbi-reports-dashboards
ms.topic: how-to
ms.date: 11/05/2021
LocalizationGroup: Create reports
---

# Create page and button navigators

Using Power BI’s built-in navigators, you can quickly build page and bookmark navigation experiences with just a few clicks. These navigators should save hours of effort building and managing your page or bookmark navigation experiences.
[image here] 

You can find this capability in Power BI Desktop or Power BI Service on the **Insert** tab > **Buttons** > **Navigator**:

[image here] 

## Page navigator

When you select the Page navigator option, Power BI automatically creates a page navigator for you: 
[image here] 

The page navigator is automatically in sync with your report pages, meaning:
 - Titles of the buttons match the page display names.
 - Ordering of the buttons matches the order of your report pages.
 - The selected button is the current page.
 - As you add or remove pages in your report, the navigator updates automatically.
 - As you rename pages, the titles of the buttons update automatically.

If you want to further customize the pages that show or hide in the page navigator, go to the **Format navigator** pane > **Pages** tab. There, you have the option to **Show/hide hidden pages** or **Show/hide tooltip pages**:

Note that if you’re testing out the page navigator in Power BI Desktop or in edit mode of the Power BI Service, you need to press Ctrl + click to navigate to the desired page.

## Bookmark navigator
Before you create the bookmark navigator, you need to create the bookmarks first. Additionally, create separate bookmark groups if you plan on creating different bookmark navigators within the same report. 
  
Once you’ve created your bookmarks, select the **Bookmark navigator** option. Power BI automatically creates a bookmark navigator for you: 

 
The bookmark navigator is automatically in sync with your report bookmarks, meaning:
•	Titles of the buttons match the bookmark display names.
•	Ordering of the buttons matches the order of your report bookmarks.
•	The selected button is the last selected bookmark.
•	As you add or remove bookmarks in your report, the navigator updates automatically.
•	As you rename bookmarks, the titles of the buttons update automatically.
If you want to further customize the bookmarks that show or hide in the bookmark navigator, go to the **Format navigator** pane > **Bookmarks** tab:
 
By default, **All** bookmarks are shown in the bookmark navigator; however, you can create and select a specific bookmark group to show only the bookmarks within that group.
 
You also have the option to **Allow deselection**, meaning users can unselect all the buttons in the bookmark navigator. This option is great for building a toggle-like experience or allowing for an unselected default state. To set up either of these types of experiences, you need to first bookmark the desired unselected state. Here’s an example of an unselected state: 
 
Once you have bookmarked the unselected state, turn on **Allow deselection** and select the bookmark that you want to **Launch on deselection**: 
 
If the bookmark that you’re using for deselection is within the bookmark navigator already, you can choose to **Hide the deselection bookmark** within the navigator if you don’t want to show it: 
 
## Formatting   options
Just like our other buttons, there are lots of formatting options for the navigators including: 
- Fill
- Text
- Outline
- Shape
- Shape shadow 
- Shape glow
- Rotation

The navigators also include two additional formatting options:
- Grid layout
- Selected state

### Grid layout
Grid layout tab includes options to change the Orientation of the navigator: 
- Horizontal
- Vertical
- Grid  

It also includes the option to change the **Padding** between buttons in the navigator.

### Selected state
The navigators have the option to customize the Selected state of the button. You can use this option to help the selected state of the button stand out from the default state. In this example, we’ve customized both the **Fill** and **Text** formatting for the **Selected** state: 
 

