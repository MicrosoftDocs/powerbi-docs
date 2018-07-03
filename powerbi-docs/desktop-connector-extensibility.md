# Connector Extensibility in Power BI

In Power BI, customers and developers are able to extend the number of data sources that can be connected to in a variety of ways. While we offer the ability to connect to a variety of generic data sources (ODBC, OData, Oledb, Web, CSV, XML, JSON), we also offer the ability for developers to create data extensions that we call 'Custom Connectors', as well as certify them to make them 'Certified Connectors'.

In older versions of Power BI, the ability to use these 'Custom Connectors' was enabled via a feature switch. We now have a menu to allow you to securely control what level of custom code you want to be willing to run on your system: all custom connectors, or just ones certified ones distributed by Microsoft via the "Get Data" dialogue.

## Custom Connectors

Custom Connectors can include a wide range of possibilities ranging from small APIs that are critical to your business, to largest industry specific services that we haven't implemented. Most of these connectors will be distributed by the vendor themselves, and if there's one you need, you should reach out to the vendor.

To use a Custom Connector, you need to put them in \[Documents]\\Power BI Desktop\\Custom Connectors, as well as lower the security settings as described in the section below.

You do not need to lower security settings to use Certified Connectors.

## Data Extension Security

To change data extension security settings, navigate to File > Options and Settings > Options > Security.

![Control whether you want to be able to load custom connectors or not with Data Extension Security options](media/desktop-connector-extensibility/data-extension-security-1.png)

Under the header of 'Data Extensions', there are two levels:

* (Recommended) Only allow certified extensions to load
* (Not Recommended) Allow any extension to load without warning

If you plan on using Custom Connectors, or connectors that either you or a third party have developed and distribute, you need to set it to the lower security setting. We do not recommend this security setting unless you plan on running Custom Connectors.

At the higher security setting, if there are custom connectors on your system, you will be greeted with an error describing the connectors that can't load due to security.

![A dialog will describe Custom Connectors that can't load due to security settings, in this case TripPin](media/desktop-connector-extensibility/data-extension-security-2.png)

To resolve this, you need to change your security settings to the lower setting as described above, and restart Power BI.

## Certified Connectors

A limited subset of data extensions will be considered 'Certified'. This means that it will be released in context via the Get Data dialogue, but the responsible party for maintenance and support is still the third party developer. While Microsoft distributes these, we are not responsible for their uptime or continued functionality.

If you would like a custom connector to be certified, please have your vendor reach out to Microsoft.
