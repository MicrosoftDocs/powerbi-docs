---
title: Create links in markdown articles
description: Explains how to code crosslinks in markdown.
metakeywords: ''
services: ''
solutions: ''
documentationcenter: ''
author: mblythe
videoid: ''
scriptid: ''
manager: dongill

ms.service: contributor-guide
ms.devlang: ''
ms.topic: article
ms.tgt_pltfrm: ''
ms.workload: ''
ms.date: 09/17/2019
ms.author: mblythe

---
# Linking guidance for Power BI technical content
## Guidelines for technical articles on powerbi.microsoft.com
| Link scenario | Guidance |
| --- | --- |
| Linking from a Power BI article to another Power BI article |Use relative links. Do not include the en-us language locale in your relative links. |
| Linking to an MSDN library topic, a TechNet library topic, or KB article |​Use the actual link to the article or topic, but remove the en-us language locale from the link. |
| Linking from a Power BI article to any other web page |Use the direct link |

### Markdown syntax for Power BI relative links
To create an inline link from a Power BI technical article to another Power BI technical article, use this link format.

> [!NOTE]
> Some aspects of linking are still TBD b/c we need to settle on a final structure for the github repo.
> 
> 

Article links from a subdirectory to an article in the root directory:

    [link text](../article-name.md)

Article in the root directory links to an article in a subdirectory: 

    [link text](section-folder/article-name.md)

Article in a section subdirectory links to an article that is in another section subdirectory:

    [link text](../section-folder/article-name.md)

Article in a directory links to another article in the same directory:

    [link text](article-name.md)


You do not have to create anchors - they are automatically generated at publishing time for all H2 headings. The only thing you have to do is create links to the H2 sections:

    [link](#the-text-of-the-H2-section-separated-by-hyphens)
    [Create cache](#create-cache)

To link to an anchor in another article in the same subdirectory:

    [link text](article-name.md#anchor-name)
    [Configure your profile](media-services-create-account.md#configure-your-profile)

To link to an anchor in another service subdirectory:

    [link text](section-folder/article-name.md#anchor-name)
    [Configure your profile](section-folder/media-services-create-account.md#configure-your-profile)


## Custom markdown link syntax
Since includes files are located in another directory, you will need to use relative paths as below. For a link to a single article from an includes file, use this format:

    [link text](../articles/section-folder/article-name.md)

Learn more about how to use an includes file in the [Custom markdown extensions guidelines](custom-markdown-extensions.md#includes).

If you have selectors embedded in an include, you would use this sort of linking: 

    > [AZURE.SELECTOR-LIST (Dropdown1 | Dropdown2 )]
    - [(Text1 | Example1 )](../articles/section-folder/article-name1.md)
    - [(Text1 | Example2 )](../articles/section-folder/article-name2.md)
    - [(Text2 | Example3 )](../articles/section-folder/article-name3.md)
    - [(Text2 | Example4 )](../articles/section-folder/article-name4.md)

To link to a page on Power BI (such as a pricing page, SLA page or anything else that is not a documentation article), use an absolute URL, but omit the locale. The goal here is that links work in GitHub and on the rendered site:

    [link text](http://powerbi.microsoft.com/pricing/)

To test your links, push your page to your fork and view it in the rendered view and publish to staging. The cross links on the GitHub version of the page should work as long as the targets of the URLs are present in your fork.

Our [markdown template for technical articles](../markdown templates/markdown-template-for-new-articles.md) shows an alternate way to create crosslinks in markdown so all the crosslinks are coded together at the end of the article, even while they display inline.

## Reference-style links
You can use reference style links to make your source content easier to read. The reference style links replace the inline link syntax with simplified syntax that allows you to move the long URLs to the end of the article. Here's Daring Fireball's example:

Inline text:

    I get 10 times more traffic from [Google][1] than from [Yahoo][2] or [MSN][3].

Link references at the end of the article:

    <!--Reference links in article-->
[1]: http://google.com/
[2]: http://search.yahoo.com/  
[3]: http://search.msn.com/

## FWLinks
Avoid FWLinks (our redirection system) in powerbi.microsoft.com content. They should be used only as a last resort when you need to create a link for a page whose URL you don't yet know. They are almost never actually needed. For Power BI, you define the file name, so you can know what it will be ahead of time. For a library topic that is not yet published, you can create a link that uses the topic GUID so that you don't have to use an FWLink.

If you must use an FWLink on a web page, include the P parameter to make it a permanent redirect:

    http://go.microsoft.com/fwlink/p/?LinkId=389595

When you paste the target URL into the FWLink tool, remember to remove the locale if your target link is Power BI, or the MSDN or TechNet library.

### Contributors' Guide Links
* [Overview article](../README.md)
* [Index of guidance articles](contributor-guide-index.md)

<!--image references-->
[1]: ./media/create-tables-markdown/table-markdown.png
[2]: ./media/create-tables-markdown/break-tables.png
