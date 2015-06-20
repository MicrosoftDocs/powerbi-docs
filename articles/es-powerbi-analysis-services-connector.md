<properties 
   pageTitle="Configurar un conector de servicios de análisis de BI de energía" 
   description="Configurar un conector de servicios de análisis de BI de energía" 
   services="powerbi" 
   documentationCenter="" 
   authors="v-anpasi" 
   manager="mblythe" 
   editor=""
   tags=""/>
 
<tags
   ms.service="powerbi"
   ms.devlang="NA"
   ms.topic="article"
   ms.tgt_pltfrm="NA"
   ms.workload="powerbi"
   ms.date="06/19/2015"
   ms.author="v-anpasi"/>

#Configurar un conector de servicios de análisis de BI de energía

[Datos de gran tamaño ← y mucho más](https://support.powerbi.com/media/knowledgebase/topics/88773-big-data-and-more)

##[**Descargue ahora la versión preliminar conector de Analysis Services**](http://www.microsoft.com/en-us/download/details.aspx?id=45333)  

Antes de que los usuarios pueden conectarse a un modelo tabular de SQL Server Analysis Services, un conector de alimentación BI Analysis Services debe estar configurado para el servidor. Si tiene más de un servidor de Analysis Services, necesitará configurar un conector por servidor. Para ello, un administrador del servidor. Para obtener más información acerca de cómo funciona el conector, asegúrese de ver [Power BI Analysis Services conector detallada](http://support.powerbi.com/media/knowledgebase/articles/546004-power-bi-analysis-services-connector-in-depth).

Una vez configurado el conector, bases de datos de modelo tabular en la instancia del servidor de Analysis Services aparecerá en la página de SQL Server Analysis Services en Power BI. Crear la conexión requiere una cuenta de Windows y una contraseña con permisos de administrador del servidor para la instancia de servidor que se va a conectar. Una vez configurado, los usuarios deberán tener al menos permisos de lectura para las bases de datos de modelo tabular que va a conectar.

El conector puede ejecutarse en cualquier equipo del dominio. No tiene que ser el equipo local o el servidor de Analysis Services, tal y como sólo actúa como un proxy entre Analysis Services y Power BI. El conector realiza la conexión a Analysis Services y pasa las credenciales del usuario que tiene acceso a lo largo de Power BI a él. El equipo donde está instalado tiene permanezca encendida, conectado a la red y el servidor de Analysis Services puede acceder en todo momento.

![](media/powerbi-analysis-services-connector/importantIcon.png) **Importante:**

-   Solo los modelos tabulares de servicios de análisis de SQL Server son compatibles con Power BI
-   El conector tiene que seguir ejecutándose y ha permanecido en el equipo donde está instalado.

**Requisitos previos**

-   .NET framework 4.5.1 o posterior debe estar instalado en el equipo.
-   No se admite instalar el conector de alimentación BI Analysis Services y la puerta de enlace de administración de datos en el mismo equipo. Si ya tiene instalado Data Management Gateway, desinstálela antes de instalar el conector de alimentación BI Analysis Services o instale el conector en otro equipo.
-   El servidor de Analysis Services está unido al dominio.
-   El conector de Analysis Services y el servidor de Analysis Services están instalados en equipos en el mismo dominio.
-   Si utiliza un. onmicrosoft.com dirección de correo electrónico, tendrá que sincronizar Active Directory con Azure Active Directory mediante la sincronización de Azure Active Directory \(DirSync\). Para obtener más información. consulte [Power BI Analysis Services conector detallada](http://support.powerbi.com/media/knowledgebase/articles/546004-power-bi-analysis-services-connector-in-depth).

##Para instalar y configurar un conector de servicios de análisis de BI de alimentación

1.  En Power BI, haga clic en el icono de configuración ![](data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABQAAAAUCAYAAACNiR0NAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAFKSURBVDhP5VQ9boYwDHU7Iq4AI3fhCFyAa3AKFi7AwIgEOzMjAwMsMMDGgMRK80zyEf5aVfrUpU+y/JPYcZynfBDRKuRt+JT6bfi7gmEYUtM01HWdjBAFQcDxn4AZXqQoilXB932OjePIflVVl/2a7I7jOGscx2yXZcnJCsuySOsXBc9FnqAOfZDNQHd6FwAOQBzrruuuYqYcxz4x23WaJr2Qkt1BEjYBT9dCIR3ioQ7rh1fO85zmeWY7SRLWoksSeZRlGftpmrIG+r6nYRikt+FVEJQQ3ZFlWTJyhGma0trQti3Ztk1RFMnIDm4Vg9ahX1nRBqKuDAqp+Z5kM5CEzfqMwEWVBI1DdKCoytfkErgknqHYgANv8i+BFz2AM5UUB5+4+O3ngMEbhsGvr1DXNWvP81jf4fYk8QkcSA1+YhSwz3t1+XcfLNEXtXPv0IvqeuUAAAAASUVORK5CYII=) \> **vista previa de conector de Analysis Services**.

    ![](media/powerbi-analysis-services-connector/ASConnector_Download.png) **Nota**: también puede [Descargar la versión preliminar conector de Analysis Services desde Microsoft Download Center](http://www.microsoft.com/en-us/download/details.aspx?id=45333).
2.  Haga clic en **ejecutar**.

    ![](media/powerbi-analysis-services-connector/ASConnector_Run.png)
    
3.  Revise los términos, haga clic en **instalar**. Puede hacer clic en **opciones** para cambiar la ubicación predeterminada donde se instalará el conector.

    ![](media/powerbi-analysis-services-connector/ASConnector_Terms.png) **Nota**: para desinstalar un conector de servicios de análisis de BI de alimentación, utilice desinstalación en el Panel de Control.
4.  Después de instalar, haga clic en **iniciar** para abrir el Asistente para conector de Power BI Analysis Services. El asistente le guiará a través de la configuración de un conector a la instancia del servidor.

    ![](media/powerbi-analysis-services-connector/ASConnector_Launch.png)
    
5.  En el asistente, haga clic en **siguiente**.

     ![](media/powerbi-analysis-services-connector/ASConnector_Next.png)
    
6.  Inicie sesión en su cuenta de Power BI.

     ![](media/powerbi-analysis-services-connector/ASConnector_SignIn.png)
    
7.  En la página Conectar a SQL Server Analysis Services, especifique el Nombredeservidor\\nombredeinstancia, nombre de usuario de Windows y contraseña.

    **Nota**: cuenta de Windows que especifique debe tener permisos de administrador del servidor para la instancia que se va a conectar. La cuenta también debe tener una contraseña que no caduca, de lo contrario, los usuarios podrían obtener un error de conexión.

    ![](media/powerbi-analysis-services-connector/ASConnector_Connect.png)
8.  Escriba un nombre descriptivo, la descripción y el mensaje de error descriptivo para la conexión. Los usuarios de BI de energía identificará la conexión por este nombre y descripción.

    ![](media/powerbi-analysis-services-connector/ASConnector_FriendlyName.png) 
9.  Compruebe la configuración de los conectores. Si todo es correcto, haga clic en **Cerrar**.

    ![](media/powerbi-analysis-services-connector/ASConnector_SuccessClose.png)

Cuando los asistentes se completa, las bases de datos de modelo tabular a la instancia del servidor que configuró aparecerá cuando los usuarios seleccionan **obtener datos**\> **SQL Server Analysis Services** \> **Conectar**.

![](media/powerbi-analysis-services-connector/ConnectToAS_Server.png)

Cuando un usuario selecciona la nueva conexión, todos los modelos tabulares disponibles en la instancia de SQL Server Analysis Services aparecen como orígenes de datos.

![](media/powerbi-analysis-services-connector/ConnectToAS_Models.png)
 
##Para quitar un conector de la lista de obtener datos

Desinstalar el conector con quitar programas en el Panel de Control.

##Solución de problemas

Consulte [conector de solución de problemas de servicios de análisis](http://support.powerbi.com/media/knowledgebase/articles/505324-troubleshooting-analysis-service-connector)para obtener sugerencias sobre cómo solucionar problemas es posible que tenga.

