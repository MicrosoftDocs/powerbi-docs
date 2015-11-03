<properties linkid="nested-include-in-ordered-list" urlDisplayName="List with Nested Include Example" pageTitle="List with Nested Include Example" title="List with Nested Include Example" metaKeywords="southworks" description="Tests for the Includes feature." metaCanonical="" disqusComments="1" umbracoNaviHide="0" writer="f2bo" services="" solutions="" documentationCenter="" authors="" videoId="" scriptId="" />

# Ordered List with Nested Include Example

*Syntax*

**Main document**

```
1. Item ONE
    [​AZURE.INCLUDE [innerlist](../includes/inner-list.md)]
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

    [AZURE.INCLUDE [innerlist](../includes/inner-list.md)]

1. Item FOUR
