---
title: Set or remove sensitivity labels programmatically with admin APIs
description: See an example of how to use Power BI REST admin APIs to set or remove sensitivity labels on Power BI artifacts.
author: paulinbar
ms.author: painbar
manager: kfollis
ms.service: powerbi
ms.subservice: powerbi-eim
ms.topic: how-to
ms.custom:
ms.date: 07/27/2021
LocalizationGroup: Data from files
---
# Set or remove sensitivity labels using Power BI REST admin APIs

To meet compliance requirements, organizations are often required to classify and label all sensitive data in Power BI. This task can be challenging for tenants that have large volumes of data in Power BI. To make the task easier and more effective, the Power BI [setLabels](/rest/api/power-bi/admin/information-protection-set-labels-as-admin) and [removeLabels](/rest/api/power-bi/admin/information-protection-remove-labels-as-admin) admin REST APIs can be used to set and remove sensitivity labels on large numbers of Power BI artifacts programatically.

The APIs set or remove labels from artifacts by artifact ID.

## Requirements and considerations

* The user must have administrator rights (such as Office 365 Global Administrator or Power BI Service Administrator) to call these APIs.
* The admin user (and the delegated user, if provided) must have sufficient [usage rights](/azure/information-protection/configure-usage-rights) to set or remove labels.
* To set a sensitivity label using the setLabels API, the admin user (or the delegated user, if provided) must have the label included in their label policy.
* The APIs allow a maximum of 25 requests per hour. Each request can update up to 2000 artifacts.
* **Required scope**: Tenant.ReadWrite.All

## API documentation

* [setLabels](/rest/api/power-bi/admin/information-protection-set-labels-as-admin)
* [removeLabels](/rest/api/power-bi/admin/information-protection-remove-labels-as-admin)

## Sample

The following sample demonstrates how to set and remove sensitivity labels on Power BI dashboards. Similar code can be used to set and remove labels on datasets, reports, and dataflows.

```rest
            const string adminBearerToken = "<adminBearerToken>";
            const string ApiUrl = "<api url>";
            var persistedDashboardId = Guid.Parse("<dashboard object Id>");
            var credentials = new TokenCredentials(adminBearerToken, "Bearer");

            var artifacts = new InformationProtectionArtifactsChangeLabel();
            artifacts.Dashboards = new List<ArtifactId> { new ArtifactId(id: persistedDashboardId) };

            using (PowerBIClient client = new PowerBIClient(credentials))
            {
                client.BaseUri = new Uri(ApiUrl);

                // Delete labels

               var removeResponse = client.InformationProtection.RemoveLabelsAsAdmin(artifacts);

                foreach (var updateLabelResult in removeResponse.Dashboards)
                {
                    if (updateLabelResult.Status == Status.Succeeded)
                    {
                        Console.WriteLine($"label has been deleted from artifact {updateLabelResult.Id}");
                    }
                    else
                    {
                        Console.WriteLine($"label has not been deleted from artifact {updateLabelResult.Id}");
                    }
                }

                // Set labels

                var setLabelRequest = new InformationProtectionChangeLabelDetails();
                setLabelRequest.Artifacts = artifacts;
                setLabelRequest.LabelId = Guid.Parse("<label Id>");

                // assignmentMethod (optional)
                setLabelRequest.AssignmentMethod = AssignmentMethod.Priviledged;

                // delegetedUser (optional)
                var delegatedUser = new DelegatedUser();
                delegatedUser.EmailAddress = "<delegated user email address>";

                setLabelRequest.DelegatedUser = delegatedUser;

                var setResponse = client.InformationProtection.SetLabelsAsAdmin(setLabelRequest);
                foreach (var updateLabelResult in setResponse.Dashboards)
                {
                    if (updateLabelResult.Status == Status.Succeeded)
                    {
                        Console.WriteLine($"label has been upsert on artifact {updateLabelResult.Id}");
                    }
                    else
                    {
                        Console.WriteLine($"label has not been upsert on artifact {updateLabelResult.Id}");
                    }
                }

            }

        }
```


## Next steps
* [setLabels API](/rest/api/power-bi/admin/information-protection-set-labels-as-admin)
* [removeLabels API](/rest/api/power-bi/admin/information-protection-remove-labels-as-admin)
* [Sensitivity label overview](service-security-sensitivity-label-overview.md)