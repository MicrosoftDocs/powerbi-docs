---
linkid: nested-include-in-ordered-list
urldisplayname: List with Nested Include Example
title: List with Nested Include Example
metakeywords: southworks
description: Tests for the Includes feature.
metacanonical: ''
disquscomments: "1"
umbraconavihide: "0"
writer: f2bo
services: ''
solutions: ''
documentationcenter: ''
videoid: ''
scriptid: ''

{}

---
# Ordered List with Nested Include Example
*Syntax*

**Main document**

```
1. Item ONE
    [​AZURE.INCLUDE [innerlist](includes/inner-list.md)]
2. Item FOUR
```

**Include**

```
1. Item TWO
2. Item THREE
```

<hr />

## My Items
1. Item ONE
   
    [!INCLUDE [innerlist](includes/inner-list.md)]
2. Item FOUR

