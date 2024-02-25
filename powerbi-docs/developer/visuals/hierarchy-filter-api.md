---
title: The hierarchical identity Filters API for better embedded BI insights
description: This article discusses how Power BI visuals can filter visuals based on several attributes.
author: mberdugo
ms.author: monaberdugo
ms.reviewer: sranins
ms.service: powerbi
ms.subservice: powerbi-custom-visuals
ms.topic: reference
ms.date: 06/19/2022
---

# The hierarchical identity filters API in Power BI visuals

The **Hierarchy Identity filter API** enables visuals that use [Matrix DataView Mapping](./dataview-mappings.md#matrix-data-mapping) to filter data on multiple fields at a time based on data points that use a [hierarchy structure].

This filter is similar to the [tuple filter](./filter-api.md#the-tuple-filter-api-multi-column-filter), but more efficient, but supports group on keys.

Hover over filter and see what it's set to filter

This API is useful in the following scenarios:

* Filtering hierarchies based on data points
* Custom visuals that use semantic models with [group on keys]

> [!NOTE]
>
> * The Hierarchy Identity filter API is available from API version 5.9.0
> * To use this filter, the visual should contain only one *grouping* [data role](./capabilities.md#datarole-properties).

The filter interface is shown in the following code:

```javascript
interface IQueryNameTarget {
    queryName: string;
}
```

* *queryName*: query name of the source column in the query. It comes from the `DataViewMetadataColumn`

```javascript
type IHierarchyIdentityFilterTarget = IQueryNameTarget[]

interface IHierarchyIdentityFilterNode<IdentityType> {
    identity: IdentityType;
    children?: IHierarchyIdentityFilterNode<IdentityType>[];
    operator: HierarchyFilterNodeOperators;
}
```

* *identity*: The Node identity in `DataView`. The `IdentityType` Should be `CustomVisualOpaqueIdentity`

* *children*: List of node children relevant to the current selection

* *operator*: The operator for single objects in the tree. The operator can be one of the following:

  * *Selected*: value is explicitly selected.

  * *NotSelected*: value is explicitly not selected.

  * *Inherited*: value selection is according to the parent value in the hierarchy, or default if it's the root value.

  ```javascript
  type HierarchyFilterNodeOperators = "Selected" | "NotSelected" | "Inherited";
  ```

```javascript
interface IHierarchyIdentityFilter<IdentityType> extends IFilter {
    target: IHierarchyIdentityFilterTarget;
    hierarchyData: IHierarchyIdentityFilterNode<IdentityType>[];
}
```

*$schema*: https://powerbi.com/product/schema#hierarchyIdentity

*filterType*: FilterType.HierarchyIdentity

*target*: Array of relevant columns in the query. Currently only a single role is supported; therefore, the target is not required and should be empty.

*hierarchyData*: the selected and unselected items in a hierarchy tree where each `IHierarchyIdentityFilterNode<IdentityType>` represents a single value selection.

Keep the following rules in mind when defining your hierarchy identity filter:

* Take the identities from the *DataView*.
* Each *identity* path should be a valid path in the *DataView*.
* Every leaf should have an operator of *Selected* or *NotSelected*.
* To compare identities, use the `ICustomVisualsOpaqueUtils.compareCustomVisualOpaqueIdentities` function.
* The identities might change following fields changes (e.g. addition/removal fields). PowerBI will assign the updated identities to the existing filter.hierarchyData.

## How to use the Hierarchy identity filter API

The following is an example of :

```javascript
const filter = {
    $schema: "https://powerbi.com/product/schema#hierarchyIdentity",
    filterType: FilterType.HierarchyIdentity,
    target: [],
    hierarchyData: [
        {
            identity: {...},
            operator: "Selected",
            children: [
                {
                    identity: {...},
                    operator: "NotSelected"
                }
            ]
        },
        {
            identity: {...},
            operator: "Inherited",
            children: [
                {
                      identity: {...},
                      operator: "Selected"
                }
            ]
        }
    ]
}
```

To apply the filter:

```javascript
"applyJsonFilter":
this.host.applyJsonFilter(filter, "general", "filter", action);
```

To restore the active JSON filter from the "VisualUpdateOptions":

```java
export interface VisualUpdateOptions extends extensibility.VisualUpdateOptions {
//...
jsonFilters?: IFilter[];
}
```

## Hierarchy related fields validation (optional)

The `HierarchyIdnetity` filter is supported only for hierarchically related fields. By default, PowerBI doesn't validate if the fields are hierarchically related.

To activate hierarchically related validation, add the 'areHierarchicallyRelated' property to the relevant role condition in the capabilities.json file:

```json
"dataViewMappings": [
    {
         "conditions": [
             {
                  "Rows": {
                      "min": 1,
                      "areHierarchicallyRelated": true <------ NEW ------>
                  },
                  "Value": {
                  "min": 0
                  }
            }
        ],
        ...
    }
]
```

Fields are hierarchically related if the following conditions are met:

* No included relationship edge is many to many cardinality, nor `ConceptualNavigationBehavior.Weak`.

* All fields in the filter exist in the path.

* Every relationship in the path has the same direction or bidirectional.

* The relationship direction matches the cardinality for one to many. Basically, it should be either from one to many or bidirectional.

## Example of hierarchy relationships

For example, given the following entity relationship:

[A] 1 <--> 1 [B] 1 ---> * [C] * <--- 1 [D]

│                         │

└─ 1 ---> * [E] 1 ---> * ─┘

A, B are hierarchically related: true

B, C are hierarchically related: true

A, B, C are hierarchically related: true

A, C, E are hierarchically related: true (A --> E --> C)

A, B, E are hierarchically related: true (B --> A --> E)

A, B, C, E are hierarchically related: true (B --> A --> E --> C)

A, B, C, D are hierarchically related: false (violated rule #3)

C, D are hierarchically related: true

B, C, D are hierarchically related: false (violated rule #3)

A, C, D, E are hierarchically related: false (violated rule #3)

Note:

* When these validations are enabled, and the fields are not hierarchically related, the visual won't render, and an error message will be displayed:

    :::image type="content" source="./media/hierarchy-filter-api/validated-unsupported-relationships.png" alt-text="{alt-text}":::

    :::image type="content" source="./media/hierarchy-filter-api/cant-display-visual.png" alt-text="{alt-text}":::

* When these validations are disabled, and the filter visual applies a filter that contains nodes related to non-hierarchically related fields, other visuals might not render properly when measures are in use:

    :::image type="content" source="./media/hierarchy-filter-api/no-validation-unsupported.png" alt-text="{alt-text}":::

    :::image type="content" source="./media/hierarchy-filter-api/no-validation-cant-load.png" alt-text="{alt-text}":::

## Code example for updating the hierarchy data tree after new selection

The following code shows how to update the `hierarchyData` tree after new a selection:

```javascript
type CompareIdentitiesFunc = (id1: CustomVisualOpaqueIdentity, id2: CustomVisualOpaqueIdentity) => boolean;
/**
* Updates the filter tree following a new node selection.
* Prunes irrelevant branches after node insertion/removal if necessary.
* @param path Identities path to the selected node.
* @param treeNodes Array of IHierarchyIdentityFilterNode representing a valid filter tree.
* @param compareIdentities Compare function for CustomVisualOpaqueIdentity to determine equality. Pass the ICustomVisualsOpaqueUtils.compareCustomVisualOpaqueIdentities function.
* @returns A valid filter tree after the update
*/

function updateFilterTreeOnNodeSelection(
   path: CustomVisualOpaqueIdentity[],
   treeNodes: IHierarchyIdentityFilterNode<CustomVisualOpaqueIdentity>[],
   compareIdentities: CompareIdentitiesFunc
): IHierarchyIdentityFilterNode<CustomVisualOpaqueIdentity>[] {
    if (!path) return treeNodes;
    const root: IHierarchyIdentityFilterNode<CustomVisualOpaqueIdentity> = {
        identity: null,
        children: treeNodes || [],
        operator: 'Inherited',
    };
    let currentNodesLevel = root.children;
    let isClosestSelectedParentSelected = root.operator === 'Selected';
    let parents: { node: IHierarchyIdentityFilterNode<CustomVisualOpaqueIdentity>, index: number }[] = [{ node: root, index: -1 }];
    let shouldFixTree = false;
    path.forEach((identity, level) => {
        const index = currentNodesLevel.findIndex((node) => compareIdentities(node.identity, identity));
        const isLastNodeInPath = level === path.length - 1
        if (index === -1) {
           const newNode: IHierarchyIdentityFilterNode<CustomVisualOpaqueIdentity> = {
               identity,
               children: [],
               operator: isLastNodeInPath ? (isClosestSelectedParentSelected ? 'NotSelected' : 'Selected') : 'Inherited',
           };
           currentNodesLevel.push(newNode);
           currentNodesLevel = newNode.children;
           if (newNode.operator !== 'Inherited') {
              isClosestSelectedParentSelected = newNode.operator === 'Selected';
           }
        } else {
            const currentNode = currentNodesLevel[index];
            if (isLastNodeInPath) {
               const partial = currentNode.children && currentNode.children.length;
               if (partial) {
                  /**
                   * The selected node has subtree.
                   * Therefore, selecting this node should lead to one of the following scenarios:
                   * 1. The node should have Selected operator and its subtree should be pruned.
                   * 2. The node and its subtree should be pruned form the tree and the tree should be fixed.
                   */
                   // The subtree should be always pruned.
                   currentNode.children = [];
                   if (currentNode.operator === 'NotSelected' || (currentNode.operator === 'Inherited' && isClosestSelectedParentSelected )) {
                      /**
                       * 1. The selected node has NotSelected operator.
                       * 2. The selected node has Inherited operator, and its parent has Slected operator.
                       * In both cases the node should be pruned from the tree and the tree shoud be fixed.
                       */
                      currentNode.operator = 'Inherited'; // to ensure it will be pruned
                      parents.push({ node: currentNode, index });
                      shouldFixTree = true;
                  } else {
                     /**
                      * 1. The selected node has Selected operator.
                      * 2. The selected node has Inherited operator, but its parent doesn't have Selected operator.
                      * In both cases the node should stay with Selected operator pruned from the tree and the tree should be fixed.
                      * Note that, node with Selected oprator and parent with Selector operator is not valid state.
                      */
                      currentNode.operator = 'Selected';
                  }
              } else {
                  // Leaf node. The node should be pruned from the tree and the tree should be fixed.
                  currentNode.operator = 'Inherited'; // to ensure it will be pruned
                  parents.push({ node: currentNode, index });
                  shouldFixTree = true;
                 }
             } else {
                 // If it's not the last noded in path we just continue traversing the tree
                 currentNode.children = currentNode.children || [];
                 currentNodesLevel = currentNode.children
                 if (currentNode.operator !== 'Inherited') {
                     isClosestSelectedParentSelected = currentNode.operator === 'Selected';
                     // We only care about the closet parent with Selected/NotSelected operator and its children
                     parents = [];
                  }
                  parents.push({ node: currentNode, index });
                }
           }
    });
    // Prune brnaches with Inherited leaf
    if (shouldFixTree) {
       for (let i = parents.length - 1; i >= 1; i--) {
           // Normalize to empty array
           parents[i].node.children = parents[i].node.children || [];
           if (!parents[i].node.children.length && (parents[i].node.operator === 'Inherited')) {
              // Remove the node from its parent children array
              removeElement(parents[i - 1].node.children, parents[i].index);
           } else {
               // Node has children or Selected/NotSelected operator
               break;
         }
      }
   }
   return root.children;
}
/**
* Removes an element from the array without preserving order.
* @param arr - The array from which to remove the element.
* @param index - The index of the element to be removed.
*/
function removeElement(arr: any[], index: number): void {
    if (!arr || !arr.length || index < 0 || index >= arr.length) return;
    arr[index] = arr[arr.length - 1];
    arr.pop();
}

## Related content
