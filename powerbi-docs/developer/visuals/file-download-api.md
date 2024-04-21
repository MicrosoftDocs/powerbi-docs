---
title:  Power BI custom visual file download API
description: This article describes the API used to allow a Power BI custom visual to export data to a text, PDF, excel, or other file.
author: mberdugo
ms.author: monaberdugo
ms.reviewer: 
ms.service: powerbi
ms.subservice: powerbi-custom-visuals
ms.topic: reference
ms.date: 10/10/2023
---

# File download API

The **file download API** lets users download data from a custom visual into a file on their storage device. Downloading a visual requires user consent and admin permission provided in the admin global switch. This setting is separate from and not affected by download restrictions applied in your organization's [export and sharing](/power-bi/admin/service-admin-portal-export-sharing) tenant settings.

:::image type="content" source="./media/file-download-api/custom-visuals-download-admin-setting.png" alt-text="Screenshot of admin setting enabling custom visual downloads.":::

>[!NOTE]
>The **file download API** has two methods:
>
> * [`exportVisualsContent`](#the-exportvisualscontent-method) is available from API version 4.5
> * [`exportVisualsContentExtended`](#the-exportvisualscontentextended-method) is available from API version 5.3.
> * To find out which version you’re using, check the `apiVersion` in the *pbiviz.json* file.

Use the **file download API** to export to files of the following types:

* .txt
* .csv
* .json
* .tmplt
* .xml
* .pdf
* .xlsx

Before the download begins, a window appears asking to confirm that the visual is from a trusted source.

:::image type="content" source="./media/file-download-api/custom-visual-download-confirm.png" alt-text="Screenshot asking to confirm download only if it is from a trusted source.":::

## How to use the file download API

To use the file download API, add a declaration to the [privileges array in visual capabilities.](./capabilities.md#define-privileges)

The **file download API** has two methods:

* [`exportVisualsContent`](#the-exportvisualscontent-method): available from API version 4.5
* [`exportVisualsContentExtended`](#the-exportvisualscontentextended-method): available from API version 5.3.

The difference between the two methods is the return value.

### The `exportVisualsContent` method

The `exportVisualsContent` method has four parameters:

* content: string
* filename: string
* fileType: string - When exporting to a *.pdf* or *.xlsx* file, the `fileType` parameter should be `base64`
* fileDescription: string

This method returns a promise that will be resolved for a Boolean value.

### The `exportVisualsContentExtended` method

The `exportVisualsContentExtended` method also has four parameters:

* content: string
* filename: string
* fileType: string - When exporting to a *.pdf* or *.xlsx* file, the `fileType` parameter should be `base64`
* fileDescription: string

This method returns a promise, which will be resolved with a result of type `ExportContentResultInfo` that contains the following parameters:

* downloadCompleted – if the download completed successfully.
* filename – the exported file name.

## Example: file download API

Here's an example of how to download the content of a custom visual into an excel file and a text file.

```typescript
import IDownloadService = powerbi.extensibility.IDownloadService;
...

export class Visual implements IVisual {
    ...
    private downloadService: IDownloadService;
    ...

    constructor(options: VisualConstructorOptions) {
        this.downloadService = options.host.downloadService;
         ...

        const downloadBtn: HTMLElement = document.createElement("button");
        downloadBtn.onclick = () => {
            let contentXlsx: string = ...;//content in base64
            let contentTxt: string = ...;
            this.downloadService.exportVisualsContent(contentTxt, "mytxt.txt", "txt", "txt file").then((result) => {
                if (result) {
                    //do something
                }
            }).catch(() => {
                //handle error
            });

            this.downloadService.exportVisualsContent(contentXlsx, "myfile.xlsx", "base64", "xlsx file").then((result) => {
                if (result) {
                    //do something
                }
            }).catch(() => {
                //handle error
            });

            this.downloadService.exportVisualsContentExtended(contentXlsx, "myfile.xlsx", "base64", "xlsx file").then((result) => {
                if (result.downloadCompleted) {
                    //do something
                    console.log(result.fileName);
                }
            }).catch(() => {
                //handle error
            });
        };
    }
}
```

## Considerations and limitations

* The API is supported only in the Power BI service and Power BI desktop
* The size limit for a downloaded file is 30 MB.
* This API is a [privileged API](./capabilities.md#privileges-define-the-special-permissions-that-your-visual-requires).

## Related content

* [Learn about the Visual API](visual-api.md)

* [Get a Power BI visual certified](power-bi-custom-visuals-certified.md)
