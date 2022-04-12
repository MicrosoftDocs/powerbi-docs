---
title:  Power BI custom visual file download API
description: This article describes the API used to allow a Power BI custom visual to export data to a text, PDF, excel, or other file.
author: mberdugo
ms.author: monaberdugo
ms.reviewer: 
ms.service: powerbi
ms.subservice: powerbi-custom-visuals
ms.topic: reference
ms.date: 04/12/2022
---

# File download API

The **file download API** lets users download data from a custom visual into a file on their storage device. This setting is separate from and not affected by download restrictions applied in your organization’s [**Export and sharing**](../../guidance/admin-tenant-settings.md#export-data) settings.

>[!NOTE]
>The **file download API** is available from API version 4.5

With the **file download API** a custom visual can export to files of the following types:

* .txt
* .csv
* .json
* .tmplt
* .xml
* .pdf
* .xlsx

## How to use the file download API

The `exportVisualsContent` method has four parameters:

* Content
* Filename
* fileType - When exporting to a *.pdf* or *.xlsx* file, the `fileType` parameter should be `base64`.
* XXX

## Example: file download API

Here's an example of how to downloads the content of a custom visual into an excel file and a text file.

```typescript
import IDownloadService = powerbi.extensibility.IDownloadService;
...

export class Visual implements IVisual {
       ...
       private new_em: HTMLElement;
       private static downloadService: IDownloadService;
       ...

    constructor(options: VisualConstructorOptions) {
        Visual.downloadService = options.host.downloadService;
        ...
        this.new_em.onclick = () => {
                let contentXlsx: string = ...;//content in base64
            Visual.downloadService.exportVisualsContent(contentXlsx, "myfile.xlsx", "base64","xlsx file");

            let contentTxt: string = ...;
            Visual.downloadService.exportVisualsContent(contentTxt, "mytxt.txt", "txt","txt file");
    }
}
```

## Considerations and limitations

## Next steps

> [!div class="nextstepaction"]
> [Visual API](visual-api.md)

> [!div class="nextstepaction"]
> [Get a Power BI visual certified](power-bi-custom-visuals-certified.md)
