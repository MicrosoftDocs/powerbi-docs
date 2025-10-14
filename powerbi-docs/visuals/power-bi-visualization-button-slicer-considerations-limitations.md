---
title: Button Slicer Considerations and Limitations 
Learn the key considerations and limitations of the Button slicer in Power BI Desktop to avoid filter issues and design clearer reports.  
author: julcsc
ms.author: juliacawthra
ms.reviewer: miguelmyers
ms.service: powerbi
ms.subservice: pbi-visuals
ms.topic: conceptual
ms.date: 10/14/2025
LocalizationGroup: Visualizations
#customer intent: As a Power BI user, I want to know about any considerations or limitations for the Button slicer so that I'm always aware of the nuances of the Button slicer in Power BI Desktop.
---

# Button slicer considerations and limitations

[!INCLUDE [applies-yes-desktop-yes-service](../includes/applies-yes-desktop-yes-service.md)]

This article lists the key considerations and limitations of the Button slicer in Power BI Desktop so you can anticipate filtering behavior and avoid confusion.

## Paste values

- You can paste up to 2,000 values into the button slicer; any extras are ignored.
- Pasting new values removes all previous selections.
- When you paste values, the slicer applies exact-match ("IS") filtering by only selecting buttons with values that precisely correspond. If the pasted values don't match any available buttons, those values are still used as filters; so visuals might display as blank due to the absence of matching data.

## Sort buttons

- Sorting via the ellipsis menu is limited to **Value**. **Label** sorting is currently unavailable.

## Single select toggle

- The **Single select** toggle permits multiple selections only when the **Force selection** toggle is *off*. To select multiple options, hold **CTRL** and select other buttons.
- If the **Single select** and **Force selection** toggles are *on*, only one option can be selected at a time. Selecting **CTRL** + other buttons isn't allowed.

## Force selection toggle

- When the **Force selection** toggle is *on*, the button slicer ensures that one item is always selected. This requires **Single select** toggle to also be *on*.
- If a user applies another filter that hides the currently selected button, the slicer might look unselected. However, the previously selected (but now hidden) value continues to affect other visuals. Selected items are never cleared, even if they're temporarily removed from the current data due to filtering.
- Currently, the slicer doesn't automatically select the first visible option when the forced selection is *on* and the selected button is filtered out. Instead, the hidden selection remains active until the user chooses another visible option.

## Related content

- [Create a button slicer](power-bi-visualization-button-slicer-considerations-limitations.md)
- [Use conditional formatting](button-slicer-conditional-formatting.md)
- [Paste values to select](button-slicer-paste-values.md)
- [Use visual highlights](button-slicer-visual-highlights.md)
- [Button slicer considerations and limitations](power-bi-visualization-list-slicer-considerations-limitations.md)
- [Troubleshoot visualizations in Power BI](power-bi-visualization-troubleshoot.md)
