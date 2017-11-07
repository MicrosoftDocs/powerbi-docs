

# Metadata for Power BI technical articles
All Power BI technical articles contain two metadata sections - a properties section and a tags section. The properties section enables some website automation and SEO stuff, while the tags section enables a lot of internal content reporting. Both sections are required.

* [Syntax]
* [Usage]
* [Attributes and values for the properties section]
* [Attributes and values for the tags section]

## Syntax
The properties section uses this syntax:

    <properties
       pageTitle="<Page title that displays in search results and the browser tab | Microsoft Power BI>"
       description="<Article description that will be displayed on landing pages and in most search results>"
       services="powerbi"
       documentationCenter="NA"
       authors="GitHub-alias-of-only-one-author"
       manager="mblythe"
       editor="NA"
       tags="NA"/>

The tags section uses this syntax:

    <tags
       ms.service="powerbi"
       ms.devlang="NA"
       ms.topic="<typically "article"; see list below>"
       ms.tgt_pltfrm="<typically "NA"; see list below>"
       ms.workload="powerbi"
       ms.date="mm/dd/yyyy"
       ms.author="Your MSFT alias or your full email address;semicolon separates two or more"/>

## Usage
* The element name and attribute names are case sensitive.
* The <properties> section must be the first line of your file.
* Leave a blank line after each metadata section and before your page title to ensure that the page title is correctly converted to HTML during the publishing process.

## Attributes and values for the properties section
![](./media/article-metadata/checkmark-small.png)**pageTitle**: Required; important to SEO. The text for this attribute appears in the browser tab and as the title in a search result. Use 55-60 characters including spaces and including the site identifier *| Microsoft Power BI* (typed as: space pipe space Microsoft Power BI).

![](./media/article-metadata/checkmark-small.png)**description**: Required; important for SEO (relevance) and site functionalities. Use at least 140 characters, but don't exceed 170 characters including spaces. Describe the  purpose of your content so customers will know whether to choose it from a list of search results. The value is usually displayed as the description or abstract paragraph in search results.

![](./media/article-metadata/checkmark-small.png)**services**: Always "powerbi" for Power BI content (Azure has multiple options).

![](./media/article-metadata/checkmark-small.png)**documentationCenter**: "NA" for Power BI content.

![](./media/article-metadata/checkmark-small.png)**authors**: Required, one value only. List the GitHub account for the primary author or article SME. This attribute drives the byline on the published article. List only one, in spite of the plural name of the attribute.

![](./media/article-metadata/checkmark-small.png)**manager**: Required if you are a Microsoft contributor. List the alias of the content publishing manager for the technology area. If you are a community contributor, include the attribute but leave it empty so we can fill it out.

![](./media/article-metadata/checkmark-small.png)**editor**: "NA" - Not used. Do not use it for other purposes.

![](./media/article-metadata/checkmark-small.png)**tags**: "NA" for Power BI content.

## Attributes and values for the tags section
![](./media/article-metadata/checkmark-small.png)**ms.service**: Always "powerbi" for Power BI content (Azure has multiple options).

![](./media/article-metadata/checkmark-small.png)**ms.devlang**: "NA" for Power BI content.

![](./media/article-metadata/checkmark-small.png)**ms.topic**: Required. Specifies the topic type. Most new pages created by contributors will be article or reference. NOTE: the list below is from Azure, and I have removed some of the options that definitely aren't valid for Power BI. We will decide how to use the remaining options as our site architecture is developed. If in doubt, use "article". 

* **article**: A conceptual topic, tutorial, feature guide, or other non-reference article
* **campaign-page**: A page that is specifically designed as a landing page for external campaigns, and is not included as part of the primary site IA.  Should not be used for documentation articles or regular doc landing pages.
* **get-started-article**: Assign to articles that are featured in the Get Started section of the left navigation for a service.
* **hero-article**: A "hero" tutorial that is designed to provide an introduction to a service or feature that gets visitors started using the service quickly and drives free-trial sign-ups and MSDN activations. Assign this value ONLY to articles that are featured at the top of the documentation landing page for your service.
* **home-page**: Top level documentation home page.
* **infographic-page**: A page that features a browsable infographic or poster.
* **reference**: An API or language reference page (including REST API).
* **video-page**: A page that features a video.

![](./media/article-metadata/checkmark-small.png)**ms.tgt_pltfrm**: Required. Specifies the target platform. This value will be **NA** for most topics. NOTE: Still detemining whether we should use this for our mobile content.

* **mobile-android**
* **mobile-html**
* **mobile-ios**
* **mobile-multiple**
* **multiple**
* **na**

![](./media/article-metadata/checkmark-small.png)**ms.workload**: Always "powerbi" for Power BI content (Azure has multiple options).

![](./media/article-metadata/checkmark-small.png) **ms.date**: Required. Specifies the date the article was last reviewed for relevance, accuracy, correct screen shots, and working links. Enter the date in mm/dd/yyyy format. This date also appears on the published article as the last updated date.

![](./media/article-metadata/checkmark-small.png) **ms.author**: Required. Specifies the author(s) associated with the topic. To specify multiple values you should separate them with semicolons. Either Microsoft aliases or complete email addresses are acceptable. The length can be no longer than 200 characters.

### Contributors' Guide Links
* [Overview article](../README.md)
* [Index of guidance articles](contributor-guide-index.md)

<!--Anchors-->
[Syntax]: #syntax
[Usage]: #usage
[Attributes and values for the properties section]: #attributes-and-values-for-the-properties-section
[Attributes and values for the tags section]: #attributes-and-values-for-the-tags-section
