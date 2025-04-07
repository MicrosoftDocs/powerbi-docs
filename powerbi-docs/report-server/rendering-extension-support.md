---
title: PDF Rendering Extension conformance to ISO 14289-1 - paginated reports
description: This document describes paginated report PDF Rendering Extension conformance to ISO 14289-1 (PDF/UA) specifications for paginated reports in the Power BI service, Power BI Report Server, and SQL Server Reporting Services.
author: kfollis
ms.author: kfollis
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-report-server
ms.topic: conceptual
ms.date: 06/24/2021
---
# PDF Rendering Extension conformance to ISO 14289-1 - paginated reports

[!INCLUDE [applies-to](../includes/applies-to.md)] [!INCLUDE [yes-report-server](../includes/yes-report-server.md)] [!INCLUDE [yes-reporting-services](../includes/yes-reporting-services.md)] [!INCLUDE [yes-paginated](../includes/yes-paginated.md)]

This document describes paginated report PDF Rendering Extension conformance to [ISO 14289-1 (PDF/UA)](https://www.pdfa.org/publication/pdfua-in-a-nutshell/) specifications for paginated reports in the Power BI service, Power BI Report Server, and SQL Server Reporting Services.

> [!NOTE]
> You can save or print this whitepaper by selecting  **Print**  from your browser, then selecting  **Save as PDF**.

## Prerequisites 

- For Power BI paginated reports in the Power BI service, you need a [Power BI Pro](../fundamentals/service-self-service-signup-for-power-bi.md) license, or [Premium Per User (PPU)](../enterprise/service-premium-per-user-faq.yml) license, and write access to a workspace in a Power BI Premium capacity.

## 1.  Scope

Not applicable

## 2.  Normative references

Not applicable

## 3.  Terms and definitions

Not applicable

## 4.  Notation

Not applicable

## 5. Version Identification

The PDF Rendering Extension provides support for PDF/UA as described in this document. In some instances, noted below, it's incumbent on the user to take steps to ensure that a PDF is in full compliance with PDF/UA.  We expect that the user adds the appropriate PDF/UA version and conformance identifiers as the last step in this process, indicating that the necessary work is done to make the PDF entirely PDF/UA compliant.

Everything listed in this document is based on rendering a PDF document with the device info setting AccessiblePdf set to `true`. In some cases, compliance limitations are due to limitations in the Report Definition Language (RDL).

## 6.  Conformance requirements

|     Criteria     |     Supporting Feature     |     Remarks      |
|----|--------|--------|
|    6.1 General    |                 Supported    |    PDF Rendering Extension creates PDF   version 1.7.    |
|    6.2 Conforming files    |                 Supported with Exceptions    |    See remarks in section 7 – File format requirements.    |
|    6.3 Conforming reader    |     Not Applicable     |         |
|    6.4 Conforming assistive technology    |     Not Applicable     |         |

## 7.  File format requirements

|     Criteria     |     Supporting Feature     |     Remarks      |
|-----|-------|------------------------|
|    7.1 General    |                 Supported with Exceptions    |    All real content shall be tagged as   defined in ISO 32000-1:2008, 14.8. Items (ISO 32000-1:2008, 14.8.2.2.2)   shall not be tagged in the structure tree. <li> PDF Rendering Extension doesn't offer the flexibility   to explicitly mark individual items, so it will instead group everything that maps to the criteria in ISO 32000-1:2008, 14.8.2.2.2.<br>Content shall be marked in the structure   tree with semantically appropriate tags in a logical reading order. <br> **Note** 4   WCAG 2.0, Guideline 1.4 explains issues regarding contrast,   color, and other formatting for accessibility. <br><li> The user would need to   ensure that their document isn't subject to these issues. <br>Standard tags   defined in ISO 32000-1:2008, 14.8.4, shall not be remapped. <li> PDF   Rendering Extension doesn't remap   the standard tags. Documents begin with the Document root element. <br>Files claiming conformance with this   International Standard shall have a Suspects value   of false (ISO   32000-1:2008, Table 321). <li> PDF Rendering Extension doesn't have   the Suspects entry. This property is optional.    |
|    7.2 Text    |                 Supported with Exceptions    |    Content shall be tagged in logical   reading order. The most semantically appropriate tag shall be used for each   logical element in the document content. <br><li> PDF Rendering Extension tags   content in logical reading order as much as is feasible.<br>Character codes   shall map to Unicode as described in ISO 32000-1:2008, 14.8.2.4.2. Characters   not included in the Unicode specification may use the Unicode private use   area or declare another character encoding. <br>Natural language shall be   declared as discussed in ISO 32000-1:2008, 14.9.2 and/or as described in ISO   32000-1:2008, 7.9.2. Changes in natural language shall be declared. Changes   in natural language inside text strings (for example, inside alternate descriptions)   shall be declared using a language identifier as described in ISO 32000-1:2008,   14.9.2.2. <br><li> PDF Rendering extension only   declares natural language at the document level    |
|    7.3 Graphics    |                 Supported with Exceptions    |    Graphics objects, other than text   objects, shall be tagged with a Figure tag   as described in ISO 32000-1:2008, 14.8.4.5, Table 340. If any of the   following exceptions are true, then the graphic shall be tagged as an   artifact: <br><li> the graphic doesn't represent meaningful content, or <li>  the graphic appears as a background to a   link annotation, in which case, the alternative text on the link shall   describe both the graphic and the link. <li> PDF Rendering Extension tags graphics objects with the   Figure tag. <br>A caption   accompanying a figure shall be tagged with a Caption   tag. <li> PDF Rendering Extension does   not currently tag captions on figures with a Caption tag. <br>Figure tags shall include an alternative   representation or replacement text that represents the contents marked with   the Figure tag as noted in ISO 32000-1:2008, 14.7.2, Table 323. <br>**Note** 1 See   also WCAG 2.0, Guideline 1.1. <br>If text represented in a graphic is   not text in a natural language that's meant to be read by a human reader,   alternative text describing the nature or purpose of the graphic shall be   provided. <br>**Note** 2 Text that's a type sample or a sample of the writing   system used by a language are examples of text that isn't in a natural   language.   PDF Rendering   Extension supports alt text on   figures, though it's up to the user to add the alt text. <br>Additional note regarding the BBox   attribute: <br><li> PDF Rendering Extension doesn't currently write the BBox   attribute. <li> A workaround is to manually retag illustrations as new Figures   or as Artifacts.    |
|    7.4 Headings    |                 Not Applicable    |    RDL doesn't support mark up of   headings in any way. It's up to the user to tag them as appropriate.    |
|    7.5 Tables    |                 Supported with Exceptions    |    Tables should include headers. Table   headers shall be tagged according to ISO 32000-1:2008, Table 337 and Table   349. <br>**Note** 1 Tables can contain column headers, row headers or both. <br>**Note**   2 As much information as possible about the structure of tables needs to be   available when assistive technology is relied upon. Headers play a key role   in providing structural information. <br><li> It's up to the user to include headers in their tables. RDL and   the PDF Rendering Extension provide support for row headers. <br>  Structure elements of type TH shall   have a Scope attribute.   <li> PDF Rendering Extension does include a Scope   attribute on TH elements for Column and Row Members, but not for Corner cells.<br>Table tagging structures shall only be   used to tag content presented within logical row and/or column relationships.   <li> This is dependent upon   how the user has chosen to use tables in their RDL.    |
|    7.6 Lists    |                 Not Applicable    |    RDL does   not support mark up of lists. In RDL, they are structurally a table with a   single table cell. <br>It's up to the user to retag them as appropriate.    |
|    7.7 Mathematical expressions    |                 Supported with Exceptions    |    All mathematical expressions shall be   enclosed within a Formula tag   as detailed in ISO 32000-1:2008, 14.8.4.5 and shall have an Alt   attribute. <br><li> PDF   Rendering Extension doesn't currently enclose   math expressions within a Formula tag. <br>The requirements regarding mapping of characters   to Unicode shall apply to mathematical expressions as set forth in ISO   32000-1:2008, 9.10.2 and 14.8.2.4. <br><li> This is supported by PDF Rendering Extension.    |
|    7.8 Page headers and footers    |                 Supported    |    Running headers and footers shall   be identified as Pagination artifacts   and shall be classified as either Header   or Footer subtypes as per ISO   32000-1:2008, 14.8.2.2.2, Table 330. <br><li> Headers or Footers are treated and tagged as artifacts.    |
|    7.9 Notes and references    |                 Not Applicable    |    PDF   Rendering Extension doesn't support mark up of notes and references. <br>It's   up to the user to tag them as appropriate.    |
|    7.10 Optional content    |                 Not Applicable    |         |
|    7.11 Embedded files    |                 Not Applicable    |         |
|    7.12 Article threads    |                 Not Applicable    |         |
|    7.13 Digital signatures    |                 Not Applicable    |         |
|    7.14 Non-interactive forms    |                 Not Applicable    |         |
|    7.15 XFA    |                 Not Applicable    |         |
|    7.16 Security    |                 Not Applicable    |         |
|    7.17 Navigation    |                 Supported    |    A document should include a   document outline that matches the reading order and level of navigational   targets (ISO 32000-1:2008, 12.3.3). <br><li> RDL supports bookmarks for a report item, but the user must select this option. Those bookmarks are then rendered   as a document outline by the PDF Rendering Extension. <br>If present, the entries in the PageLabels number tree (ISO 32000-1:2008, 7.7.2,   Table 28) should be semantically appropriate. <br><li> The PDF Rendering Extension does   not include a PageLabels number tree.    |
|    7.18 Annotations    |                 Not Applicable    |    RDL doesn't support annotations    |
|    7.21 Fonts    |                 Supported    |         |
|    7.21.1 General    |                 Supported    |         |
|    7.21.2 Font types    |                 Supported    |         |
|    7.21.3 Composite fonts    |                 Supported    |         |
|    7.21.3.1 General    |                 Supported    |         |
|    7.21 3.2 CIDFonts    |                 Supported    |         |
|    7.21.3.3 CMaps    |                 Supported    |         |
|    7.21.4 Embedding    |                 Supported    |         |
|    7.21.4.1 General    |                 Supported    |         |
|    7.21.4.2 Subset embedding    |                 Supported    |         |
|    7.21.5 Font goals    |                 Supported    |         |
|    7.21.6 Character encodings    |                 Supported    |         |
|    7.21.7 Unicode character maps    |                 Supported    |         |
|    7.21.8 Use of .notdef glyph    |                 Supported    |         |

## 8.  Conforming reader requirements

Not applicable

## 9.  AT requirements

Not applicable

## Disclaimer

© 2017 Microsoft Corporation. All rights reserved. The names of actual companies and products mentioned herein may be the trademarks of their respective owners. The information contained in this document represents the current view of Microsoft Corporation on the issues discussed as of the date of publication. Microsoft cannot guarantee the accuracy of any information presented after the date of publication. Microsoft regularly updates its websites with new information about the accessibility of products as that information becomes available.

Customization of the product voids this conformance statement from Microsoft. Please consult with Assistive Technology (AT) vendors for compatibility specifications of specific AT products.

This document is for informational purposes only. MICROSOFT MAKES NO WARRANTIES, EXPRESS OR IMPLIED, IN THIS DOCUMENT.

## Related content

- [Administrator overview](admin-handbook-overview.md)  

More questions? [Try asking the Power BI Community](https://community.powerbi.com/)

