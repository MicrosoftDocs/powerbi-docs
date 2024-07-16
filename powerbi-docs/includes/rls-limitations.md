---
author: davidiseminger
ms.service: powerbi
ms.topic: include
ms.date: 11/10/2023
ms.author: davidi
---

## Considerations and limitations

You can see the current limitations for row-level security on cloud models here:

* If you previously defined roles and rules in the Power BI service, you must re-create them in Power BI Desktop.
* You can define RLS only on the semantic models created with Power BI Desktop. If you want to enable RLS for semantic models created with Excel, you must convert your files into Power BI Desktop (PBIX) files first. [Learn more](/power-bi/connect-data/desktop-import-excel-workbooks).
* Service principals can't be added to an RLS role. Accordingly, RLS isn't applied for apps using a service principal as the final effective identity.
* Only Import and DirectQuery connections are supported. Live connections to Analysis Services are handled in the on-premises model.
* The Test as role/View as role feature doesn't work for DirectQuery models with single sign-on (SSO) enabled.
* The Test as role/view as role feature shows only reports from semantic models workspace.
* The Test as role/View as role feature doesn't work for paginated reports.

Keep in mind that if a Power BI report references a row with RLS configured then the same message displays as for a deleted or non-existing field. To these users, it looks like the report is broken.
