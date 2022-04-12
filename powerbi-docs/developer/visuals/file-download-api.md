---
title: Download Power BI custom visual API
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

The **Download to file API** lets users download data from a custom visual into a file on their storage device. This setting is separate from and not affected by download restrictions applied in your organization’s [**Export and sharing**](../../guidance/admin-tenant-settings.md#export-data) settings.

With the **Download to file API** a custom visual can export to files of the following types:

* .txt
* .csv
* .json
* .tmplt
* .xml
* .pdf
* .xlsx

API 4.5

## How to use the download to file API

The download to file API consists of the exportVisualsContent(contentXlsx, "myfile.xlsx", "base64","xlsx file")

To call the rendering methods, you have to first import them from the *IVisualEventService*.

1. In your `visual.ts` file, include the line:

    ```typescript
     import IDownloadService = powerbi.extensibility.IDownloadService;
    ```

2. In the `IVisual` class include the line:

    ```typescript
     private new_em: HTMLElement;
     private static downloadService: IDownloadService;
    ```

3. In the `constructor` method of the `IVisual` class

    ```typescript
    this.events = options.host.eventService;
    ```

You can now call the methods
`this.events.renderingStarted(options);`,
`this.events.renderingFinished(options);`, and
`this.events.renderingFailed(options);` where appropriate in your *update* method.

## Example: Download to file API

Here's an example of a simple visual that uses the *render events* API.

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

## Next steps

> [!div class="nextstepaction"]
> [Visual API](visual-api.md)

> [!div class="nextstepaction"]
> [Get a Power BI visual certified](power-bi-custom-visuals-certified.md)
