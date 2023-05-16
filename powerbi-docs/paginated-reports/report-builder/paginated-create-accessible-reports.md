---
title: "Create accessible Power BI paginated reports | Microsoft Docs"
description:  Learn how individuals with physical disabilities, low-vision or temporal disabilities can use Power BI Report Builder to create paginated reports.
ms.date: 05/12/2023
ms.service: powerbi
ms.subservice: report-builder
ms.topic: conceptual
author: maggiesMSFT
ms.author: maggies
ms.reviewer: cookiemccray
---
# Create accessible paginated reports (Power BI Report Builder)

[!INCLUDE [applies-yes-report-builder-no-desktop](../../includes/applies-yes-report-builder-no-desktop.md)]

You can create paginated reports with accessibility. Power BI Report Builder has accessibility features that helps you create a paginated report that's inclusive and usable by all. As a report creator, it's important to know these features and their functionalities to use them in making your paginated reports accessible to persons who are blind, have low vision, or have physical disabilities. Designing your report for accessibility doesn't just benefit users with disabilities.It benefits everyone because it improves the usability of your report.


This article provides details on the accessibility features in Power BI Report Builder for creating accessible paginated reports.

 

## Types of accessibility features 

The Power BI Report Builder has various accessibility features available to the report creator, these features are categorized into three categories as follows: 

- Built-in accessibility features (no configuration required). 
- Built-in accessibility features (requiring configuration).
- Other tips and considerations.

In the following sections we would look at these categories in detail: 

### Built-in accessibility features 

These features have been built into the Power BI Report Builder and do not require any configuration from the report author. These features include the following: 

- Keyboard navigation.
- Screen-reader compatibility.
- Accessible PDF export format.

Let's explore each of these built-in accessibility features individually. 

#### Keyboard navigation 

Power BI Report Builder is operable with the use of keyboard for navigation. As a report author you can navigate the app with keyboard navigation. Paginated report consumers can also efficiently use their keyboards to navigate through a report and interact with the various objects of a paginated report. This is in line with WCAG guidelines of operability, and it creates an accessible user experience for reporting consumers with disabilities. 

By pressing the Alt key, we can see the keyboard shortcuts for the different menus for Power BI Report Builder. Here's the [detailed list of keyboard shortcuts](/sql/reporting-services/report-builder/keyboard-shortcuts-report-builder) for Power BI Report Builder. 
 
Keyboard Shortcuts Image.

 
 
> [!NOTE]
> Keyboard navigation for accessibility is partially supported. You can't use the cancel button in the loading dialog.

#### Screen–reader compatibility 

Power BI Report Builder is screen-reader compatible, as a user navigates to any object on the app, the screen-reader converts every text into spoken words. As a report author, you can use a screen-reader to create a paginated report, when you hover over any of the app menus, the screen reader will read the property description shown. 

 

Screen-reader compatibility image 

 

#### Accessible PDF export format in the service for report consumers  

 

As a report creator, it's important to recognize that there are two PDF formats available for exporting paginated reports from the Power BI service:

- Standard PDF format.
- Accessible PDF format.
 
The Accessible PDF is a feature in the service for the report consumer. It isn't supported in Power BI Report Builder. The Accessible PDF format provides support for PDF/UA in conformance to the [ISO 14289-1(PDF/UA)](https://www.pdfa.org/publication/pdfua-in-a-nutshell/) requirements for universally accessible PDF documents.  

PDF/UA specifies the technical requirements for assistive technology such as screen-readers to fully interact with PDF documents. Adhering to these requirements will help in creating a universally accessible PDF/UA document which a person with disabilities can make use of just as effectively as any user without disabilities.  

One of the key requirements of the PDF/UA is to create documents that are tagged, and the structure tree created by the document tags must reflect the document’s logical reading order. The ordinary PDF export format of paginated report isn't tagged, so it's important that the Accessible PDF export option is selected when exporting your paginated report to PDF.  

Screen- reader preview of the Structure Tree of an Accessible PDF paginated report 

*Screen-reader preview of the Structure Tree of an Accessible PDF paginated report*


The PDF Accessibility Checker ([PAC Tool](https://pdfua.foundation/)) is a digital tool for validating that a PDF document is in full compliance with PDF/UA. After exporting your Accessible PDF report document, use this tool to make sure your PDF document is compliant with PDF/UA, and make appropriate adjustments if the tool detects errors. 

> [!NOTE]
> The Accessible PDF isn't in full conformance to ISO 14289-1(PDF/UA). For detailed documentation, see [PDF Rendering Extension conformance to ISO 14289-1: paginated reports](../../report-server/rendering-extension-support.md).
>
> When you create a well formatted Accessible PDF paginated report based on accessibility requirements, you still get an error from the PAC tool stating that the PDF/UA identifier is missing. The PDF/UA identifier isn't automatically written on the Accessible PDF, because there’s no guarantee that the report creator has taken the necessary steps to ensure that the PDF is in full compliance with PDF/UA.
>
> To correct this error, you need to add the appropriate PDF/UA identifier to your Accessible PDF to indicate that you've done the necessary work to make the PDF entirely PDF/UA compliant. You add the identifier by using Adobe Acrobat Pro, as described in the article [ACCESSIBLE PDFs: How to Add a PDF/UA Identifier](https://accessiblewebsiteservices.com/accessible-pdfs-how-to-add-a-pdf-ua-identifier/).


### Built-in accessibility features requiring configuration

In this section we will identify and discuss accessibility features that are built into Power BI Report Builder and require configuration from the report author. These features include the following:

- Alt text.
- Color contrast.

#### Alt text 

Alt text, which is short for alternative text, is used to describe every object in the paginated report. As a report author you need to provide Alt text for every object in your report, including tables, matrixes, charts, images, and text boxes. Providing Alt text for report objects helps a report consumer who's using a screen reader or other assistive technology to understand what you're trying to communicate regarding that report object, even if they can't see the object.  

To provide Alt text for an object in the Power BI Report Builder, select the object. In the Properties Pane, select the **Tooltip** property, and type in the tooltip text in the property grid.

Be sure to use descriptive Alt text for your report objects. Make sure the texts are clear, descriptive, and free of abbreviations, making it easier for the screen reader to read. Descriptive Alt text helps ensure your report is more understandable to the end user, which is in alignment with one of the WCAG principles. 

In Power BI paginated reports, data visualization components are interpreted as images. It's important to add Alt texts that describe your chart and the information you’re trying to convey. For example, here are the steps for writing Alt text for a line chart.

1. Select the line chart, and in the Properties Pane, select the **Tooltip** property.
1. Select **Expression** from the drop-down options, then write the Alt text you want to use.  

  

Image showing how to add Alt Text to a chart 

 

Image showing how to add Alt Text to a chart 

 



Image showing the Alt Text added to a charted 

 

The image above shows how the Alt text would appear in the report, the Alt text will be read out by a screen-reader providing the description of the image to persons who are blind and persons with other physical disabilities.  

 

Text Box 

 

Color contrast 

When designing your report for accessibility, pairing a light color and dark color will provide the right color contrast to make your report more accessible. They should be enough contrast between text or object and any background color according to the WCAG guidelines. The WCAG 2.1 success criterion 1.4.3 delineates that text and background color should have a contrast ratio of at least 4.5:1.  

Unlike for Power BI Reports, when you use high contrast mode in Windows, the high contrast theme will not be automatically applied to your report, so you must choose high contrast colors for your report.  

You could design your report and then check your report colors for accessibility using tools like Color Contrast Analyzer, WebAIM, and Accessible Colors. Another option is to use an Accessible color palette generator such as the Venngage Accessible Color Palette Generator to generate Accessible colors you can then choose from to use for your report. 

To apply colors to your report objects, select the object, in the Properties Pane choose the color you want for the format option such as the fonts, background and border. 

In the following image we used black for formatting the report background, while yellow was used for formatting every other object in the report.  

Report Image 

 

To achieve the black background for the body, select the body, in the Properties Pane under the formatting options click the drop down for background color and pick the black color. 

 

Steps for applying color to a report background 

 

The following image shows the result of the black background formatting. 

Result of Page background color formatting 

 

Yellow was used to format the other report objects with the same steps as above. Colors can also be applied to an object by writing the hex code of the color on the color format option on the Properties Pane. 

Steps for color formatting a Matrix  

 

The image above shows how the color yellow was applied to a Matrix, the result of the formatting can be seen in the following image. 

 

Result of applying color to a matrix as shown in previous image 

 

 

Tips and considerations 

Here are some tips and considerations that would help when creating accessible paginated reports. 

Provide table caption/summary 

Creating a table caption or summary would provide context on the information displayed in the table. This can be done using the Tooltip Property and it would provide the perfect summary of the information being conveyed by the table for screen reader users.  

Text Box 

 

Tagging elements 

You can insert HTML-formatted text from a field in your dataset into your paginated report with the use of a text box.  

An example of a supported HTML tag is an hyperlink. In the the images below we show the steps required to adding an hyperlink of a company website to the report. The screen-reader will read it out letting the user know it’s a link that can take them to a website that provides more information on the company. 

Steps for HTML tagging 
 

Steps for HTML tagging 

 

To achieve this, right-click the textbox you will like to write the placeholder, select the Placeholder Properties option. In the Placeholder Properties dialog box go to General tab, provide the placeholder in the label, in the value properties provide the field from the dataset which contains HTML tags, and in the tooltip, write your Alt text. 

The following image shows how the hyperlink appears in the report. 

Result of hyperlink HTML tag 

  

For detailed documentation on this, see Importing HTML into a paginated report (Report Builder) 
 

 

Add descriptive header to Table 

Using descriptive table headers will help the data on the table become easily understandable, these headers become readable by the screen-reader used by the report consumer. The headers are tagged in the PDF. The following image shows what a table looks like in the tree structure. The following image shows the logical structure of a table in the PAC tool. The table structure contains Table Row (TR) and Table Data Cell (TD) structures in proper reading order and hierarchy. 

Logical structure image of a table in PAC tool 

 

Text Box 

 

 

Add descriptive header to Matrix 

When creating your matrix object for displaying data summaries, it's important to use descriptive headers in order to make the information being conveyed by the matrix more understandable. This way the screen-reader can describe the columns and rows in an understandable way. The following image shows the logical structure of a matrix in the PAC tool. The matrix structure contains the Table Header (TH), Table Row (TR) and Table Data Cell (TD) structures in proper reading order and hierarchy. 

 

 

Logical structure image of a matrix in PAC tool 

 

Text Box 

Use consistent formatting 

You can achieve consistent report formatting. To provide consistent formatting across different report objects, hold down the CTRL key and then select the report objects you would like to have consistent formatting across, in the Properties Pane select each format options and select the format you would like to apply. Whatever format you choose will apply to all selected objects, giving it a consistent formatting. 

 

## Next steps

- [Accessibility in Power BI paginated reports (Power BI Report Builder)](paginated-accessibility-overview.md)
