<properties pageTitle="Documentation Example - Images" metaKeywords="" description="This is an example document" services="" documentationCenter="" title="Documentation Example - Images" solutions="" authors="" videoId="" scriptId="" />

# Example - Images #

This is a sample documentation article that is used to test and validate the publishing system for WindowsAzure.com.  

The content between the lines below demonstrates the different supported image syntaxes.  


---
## Image Inline Syntax ##

Using this syntax, an exclamation mark must be placed at the beginning. Then, between square brackets, an identifier for the image. After that, between parenthesis, the relative path to the image within the folder structure.

**Image syntax:**  `![windows-azure-logo](./media/example-images/windows-azure.png) `

**Resulting image:** 

![windows-azure-logo](./media/example-images/windows-azure.png)

---

## Referenced Images Syntax ##

This syntax is similar to the previous one, but works with references for the image path within the article. It uses an exclamation mark at the beginning, and a pair of square brackets that contain the reference id for the image in the article. The image reference must then contain the relative path for to the image within the folder structure.

**Image syntax:** 
`![][windows-azure-logo]`

**Image reference:** `[windows-azure-logo]: ./media/example-images/windows-azure.png `

**Resulting image:** 

![][windows-azure-logo]

[windows-azure-logo]: ./media/example-images/windows-azure.png


Another way to reference images:

`![windows-azure-logo][] `

![windows-azure-logo][]

`![windows-azure-logo][windows-azure-logo] `

![windows-azure-logo][windows-azure-logo]
