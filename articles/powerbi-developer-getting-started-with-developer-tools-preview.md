<properties 
   pageTitle="Getting Started with Developer Tools (Preview)"
   description="Getting Started with Developer Tools (Preview)"
   services="powerbi" 
   documentationCenter="" 
   authors="pcw3187" 
   manager="mblythe" 
   editor=""
   tags=""/>
 
<tags
   ms.service="powerbi"
   ms.devlang="NA"
   ms.topic="article"
   ms.tgt_pltfrm="NA"
   ms.workload="powerbi"
   ms.date="10/14/2015"
   ms.author="v-pawrig"/>
# Getting Started with Developer Tools (Preview)

[← Knowledge Base](https://support.powerbi.com/knowledgebase)

We’re excited to share the first preview of Developer Tools available in Power BI. Developer Tools will allow you to build and test custom visuals for use in Power BI. This article provides steps for enabling the preview developer tools, provides usage instructions, and identifies currently supported scenarios.


**Building your first custom visual for Power BI**

As a first step, make sure you've familiarized yourself with how to build a custom visual using our IVisual interface. You can find resource and examples on how to do this in our open source repo [Microsoft/PowerBI-visuals](http://www.github.com/Microsoft/PowerBI-visuals) on GitHub. The easiest way to get started is to fork the GitHub repo, follow the instructions in [Readme.md](https://github.com/Microsoft/PowerBI-visuals/blob/master/README.md) to build it, and follow the documentation in the [Wiki](https://github.com/Microsoft/PowerBI-visuals/wiki)to build your first visual.  Once you have the visual working in your copy of the GitHub report, you’re ready to try it in the Developer Tools. 

**Using the Developer Tools (preview)**

Before using the Developer Tools for the first time, please read these instructions carefully since, given these are in an early preview form, there are some caveats you should be aware of, these are listed at the end of this document.  

**Step 1: Enable the developer tools**

When you initially login to Power BI, the developer tools are hidden. To enable them add the following to the end of your address bar, and refresh the page:

?devToolsEnabled=true

Here’s an example:

![insert image]()

**Step 2: Open the developer tools**

Under the settings icon, you will find a new entry “Dev Tools”.  Click it.

Note: if you do not see the option, repeat step 1.

****

**![insert image]()**

A new tab will open that represents the dev tools.  It looks like the below:

**![image]()**

** Step 4: Create your custom visual**

The diagram below shows the major parts of using the developer tools.  You will need to write your type script code and provide the CSS styles in the areas noted above.  Then you should press “Compile + Run” to see a preview of your visual.  If your visual is not shown you may see errors highlighted in red in the code window. 

**![image]()**

The developer tools allow you to specify an Icon, work with multiple visuals and delete visuals you wish no longer to use.  The Data Preview option allows you to select from sample data views to test your visual’s behaviors.  To test with additional data, please see Testing your custom visual in Reports and Dashboards, below.

**Step 5: Debugging your custom visual**

To debug your custom visual you will need to use your web browser’s debugger.  For most browsers, you can press the F12 key to launch the browser’s debugger.

**Note:** The code you provide is TypeScript.  TypeScript is ‘typed’ JavaScript.  Before debugging, your TypeScript code is compiled into JavaScript.  You will be debugging using the resulting JavaScript code in your browser.  You will see some minor changes in formatting in your code due to compilation.  To make fixes you’ll need to make them in your TypeScript and then press Compile + Run again.

 

**Locating your code in the Browser Debugger**

The code you write will be located under Dynamic Scripts under the File drop down in IE’s debugger.  It will be located under (no domain) within Sources in Chrome’s debugger.

**Internet Explorer**

**![image]()**

** Chrome**

**![]()

**How to set a break point**

To set a break point, you will open your browser’s debugger (typically press the F12 key), find the JavaScript code line, and set a break point there.  You cannot set a breakpoint directly within Power BI’s developer tools.

 

**Step 6: Testing your custom visual in Reports and Dashboards**

After you test your visual and get it working in the Preview in the Developer Tools, you will want to test it is working in Reports and Dashboards in Power BI.  To do this:

**Step 7: Iterating on your custom visual code**

You can work in two browser windows or two tabs one with the Developer Tools open to edit your visual code and a second open with the report or dashboard you are testing with.  As you make changes in the Developer Tools and press Compile + Run, you will need to remember to refresh the tab in which you have your report or dashboard for testing.  To refresh the tab, press CTRL + F5 in most browsers.

Note: When testing your custom visual in a Report or Dashboard, press CTRL+F5 to ensure the latest version of your custom visual code is being used.  Repeat this each time you press Compile + Run in the Developer Tools. Otherwise, you may be using an older version of your code.  

 **Notes and Caveats

**

 The Developer Tools are in an early preview, as such there are some caveats to be aware of at the current time.  As we bring Developer Tools into broader previews, we will remove these limitations. 

-   You can test your custom visual in IE, Edge, Chrome, and Firefox. You will need to re-load your custom visual code for each browser you wish to test on. To re-load your custom visual just follows steps 1 through 5 above in each browser. 

-   There may be times when due to a service change, your code will no longer work.  We will try to minimize this as much as possible.

-   Ensure you keep a copy of your code in your own source control to ensure you do not lose it in such cases. 

-   The custom visual you test using the Developer tools is only visible to you in the browser you loaded it into. 

-   The custom visual will only load when “?devToolsEnabled=true” is specified in the address bar.

-   If you save a dashboard or report with a custom visual, the custom visual will not work for other users viewing the report or dashboard.  For example if you share your dashboard with another person, the custom visual will not work for them.

 

