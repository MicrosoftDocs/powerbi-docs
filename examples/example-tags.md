---
title: Documentation Example - Tags
metakeywords: ''
description: This is an example document
services: ''
documentationcenter: ''
solutions: ''
videoid: ''
scriptid: ''

ms.service: AzureWebSites
ms.devlang: CSharp
ms.topic: home-page
ms.tgt_pltfrm: Windows
ms.workload: "50"
ms.date: 06/12/2014
ms.author: maurok;v-nabeni@microsoft.com;lito@mail.com

---
# Example - Tags
This is a sample documentation article that is used to test and validate the publishing system for Azure.com.  

The example `<tags />` element can be found right below the `<properties />` element at the beginning of the document.

Unless otherwise specified (e.g. for ms.date), values should be restricted to alphanumeric  characters and hyphens and the length of the value should be restricted to 30 characters.

There are 7 required attributes for the tags element: 

* **ms.service**: Specifies the Azure service, tool, or feature that the article applies to.
* **ms.devlang**: Specifies the programming language that the article applies to.
* **ms.topic**: Specifies the topic type.
  
  > **Valid Values**: *article, hero-article, reference, index-page, campaign-page, video-page, infographic-page, home-page, service-home-page, dev-center-home-page, site-section-home-page*  
  > 
  > 
* **ms.tgt_pltfrm**: Specifies the target platform, for instance Windows, Linux, Windows Phone, iOS, or Android.
* **ms.workload**: Specifies a C&E workload to which the topic applies to.
* **ms.date**: Specifies the last updated date for the topic.
  
  > **Valid Values**: dates of the form mm/dd/yyyy, e.g. “04/10/2014”
  > 
  > 
* **ms.author**: Specifies the author(s) associated with the topic. To specify multiple values you should separate them with semicolons.
  
  > **Valid Values**: Microsoft aliases and complete email addresses. Length should be no longer than 200 characters.
  > 
  > 

Here's an example of a valid the tags element:

````XML
<tags ms.service="AzureWebSites" ms.devlang="CSharp" ms.topic="home-page" ms.tgt_pltfrm="Windows" ms.workload="50" ms.date="06/12/2014" ms.author="maurok;v-nabeni@microsoft.com;lito@mail.com" />
````


- - -
