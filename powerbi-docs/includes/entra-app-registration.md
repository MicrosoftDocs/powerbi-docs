1. Select **+ New Registration**

   :::image type="content" source="./media/entra-app-registration/new-registration.png" alt-text="Screenshot of Microsoft Entra app new registration UI.":::

1. On the **Register an application** page, do the following:
   1. Enter your desired application name in the **Name** section.
   1. Select *Accounts in any organizational directory (Any Azure AD directory - Multitenant)* in the **Supported account types** section.
   1. Select **Register**.

   :::image type="content" source="./media/entra-app-registration/register-app.png" alt-text="Screenshot of the Register an app page of the Microsoft Entra ID registration app.":::

1. Once your application is successfully registered, select **Expose an API** on the left side menu.

    :::image type="content" source="./media/entra-app-registration/expose-api.png" alt-text="Screenshot of the Expose an API page of the Microsoft Entra ID registration app.":::

1. In the **Application ID URI** field, select *Add*.

    :::image type="content" source="./media/entra-app-registration/add-app-id-uri.png" alt-text="Screenshot of the Expose an API page with the option to add an application ID URI.":::

1. In the **Edit Application ID URI** field, enter your [verified custom domain](https://portal.azure.com/#view/Microsoft_AAD_IAM/ActiveDirectoryMenuBlade/~/Domains), beginning with **https://**, and select **Save**.

   To add a custom domain:

   1. Navigate to [Microsoft Entra ID Custom domain names](https://entra.microsoft.com/#view/Microsoft_AAD_IAM/DomainsList.ReactView).
   1. Add your custom domain.
   1. Ensure your domain name doesn't contain *onmicrosoft.com*.  

    :::image type="content" source="./media/entra-app-registration/edit-app-id-uri.png" alt-text="Screenshot of the Expose an API page with the Edit application ID URI page open." lightbox="./media/entra-id-authentication/edit-app-id-uri.png":::

1. Select **+ Add a scope**.

1. In the **Scope name** field, enter *<visual_guid>_CV_ForPBI* and add the required information. Fill in the *Admin consent* fields. Then select **Add scope** button. (There's a 40 characters scope length limitation, but you can  manually modify the scope name in the registered application manifest to manage this limitation).

    :::image type="content" source="./media/entra-app-registration/edit-scope.png" alt-text="Screenshot of the edit a scope window with fields for scope name and other information." lightbox="./media/entra-id-authentication/edit-scope.png":::

1. To pre-authorize Power BI applications:

   1. Select **+ Add a client application**.

      :::image type="content" source="./media/entra-app-registration/add-client.png" alt-text="Screenshot of the edit a scope window with fields for adding a client application." lightbox="./media/entra-id-authentication/add-client.png":::

   1. Enter the **Power BI WFE** application appId "871c010f-5e61-4fb1-83ac-98610a7e9110" in the **Client ID** field of the right-hand window.
   1. Select your desired scope.
   1. Select **Add application**.

      :::image type="content" source="./media/entra-app-registration/preauthorization.png" alt-text="Screenshot showing the UI to add a client application." lightbox="./media/entra-id-authentication/preauthorization.png":::

   1. Repeat this process with:

      * **Power BI Desktop**: "7f67af8a-fedc-4b08-8b4e-37c4d127b6cf".
      * **Power BI Mobile**: "c0d2a505-13b8-4ae0-aa9e-cddd5eab0b12".
