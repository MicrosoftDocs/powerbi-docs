## How the gateway works
![On-prem-data-gateway-how-it-works](./media/gateway-onprem-how-it-works-include/on-prem-data-gateway-how-it-works.png)

Let’s first look at what happens when a user interacts with an element connected to an on-premises data source. 

> [!NOTE]
> For Power BI, you will need to configure a data source for the gateway.

1. A query will be created by the cloud service, along with the encrypted credentials for the on-premises data source, and sent to the queue for the gateway to process.
2. The gateway cloud service will analyze the query and will push the request to the [Azure Service Bus](/azure/service-bus-messaging/service-bus-messaging-overview/).
3. The On-premises data gateway polls the Azure Service Bus for pending requests.
4. The gateway gets the query, decrypts the credentials and connects to the data source(s) with those credentials.
5. The gateway sends the query to the data source for execution.
6. The results are sent from the data source, back to the gateway, and then onto the cloud service. The service then uses the results.

