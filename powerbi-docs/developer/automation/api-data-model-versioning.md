---
title: Power BI data model versioning
description: Data Model exposed by an OData Service.
author: KesemSharabi
ms.author: kesharab
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-developer
ms.topic: conceptual
ms.date: 06/08/2018
---

# Data Model versioning

The Data Model exposed by an OData Service, such as the Power BI data model, defines a contract between the OData service and its clients. Services are allowed to extend their model only to the degree that it does not break existing clients. Breaking changes, such as removing properties or changing the type of existing properties, require that a new service version is provided at a different service root URL for the new model.  
  
The following Data Model additions are considered safe and do not require services to version their entry point.  
  
* Adding a property that is nullable or has a default value; if it has the same name as an existing dynamic property, it must have the same type (or base type) as the existing dynamic property  
* Adding a navigation property that is nullable or collection-valued; if it has the same name as an existing dynamic navigation property, it must have the same type (or base type) as the existing dynamic navigation property  
* Adding a new entity type to the model  
* Adding a new complex type to the model  
* Adding a new entity set  
* Adding a new singleton  
* Adding an action, a function, an action import, or function import
* Adding an action parameter that is nullable  
* Adding a type definition or enumeration  
* Adding any annotation to a model element that does not need to be understood by the client to interact with the service correctly  
  
Clients ***SHOULD*** be prepared for services to make such incremental changes to their model. In particular, clients should be prepared to receive properties and derived types not previously defined by the service.  
  
Services ***SHOULD NOT*** change their data model depending on the authenticated user. If the data model is user or user group dependent, all changes MUST be safe changes as defined in this section when comparing the full model to the model visible to users with limited authorizations.  
  
For more about OData Data Model standards, see [OData Version 4.0 Part 1: Protocol Plus Errata 02](https://docs.oasis-open.org/odata/odata/v4.0/odata-v4.0-part1-protocol.html).  
  
## See also
[Overview of Power BI REST API](/rest/api/power-bi/)