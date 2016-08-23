<properties
   pageTitle="Integrate a Power BI report into an app code listing"
   description="Walkthrough to Integrate a report into an app - Load a report into an IFrame"
   services="powerbi"
   documentationCenter=""
   authors="dvana"
   manager="mblythe"
   backup=""
   editor=""
   tags=""
   qualityFocus="monitoring"
   qualityDate=""/>

<tags
   ms.service="powerbi"
   ms.devlang="NA"
   ms.topic="get-started-article"
   ms.tgt_pltfrm="NA"
   ms.workload="powerbi"
   ms.date="08/23/2016"
   ms.author="derrickv"/>

# Integrate a report into an app code listing

## Introduction

In the [Integrate a report into an app walkthrough](powerbi-developer-integrate-report.md) you learn how to embed a **report** using an **IFrame**. You can download the complete [Integrate a report sample](https://github.com/Microsoft/PowerBI-CSharp/tree/master/samples/webforms/integrate-report-web-app) which shows all the parts to embed a report. Alternatively, you can view the essential source code below. Please note this is only the essential source code, not an entire web project.

**Sample Source Code**

- [Sample JavaScript to load a report into an IFrame (Default.aspx)](#default-aspx)
- [Sample C# code to get access token, and get report (Default.aspx.cs)](#default-code)

<a name="default-aspx"/>
## Sample JavaScript to load a report into an IFrame (Default.aspx)
```
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <script type="text/javascript">

        //This code is for sample purposes only.

        //Configure IFrame for the Report after you have an Access Token. See Default.aspx.cs to learn how to get an Access Token
        window.onload = function () {
            if ("" != document.getElementById('MainContent_accessToken').value)
            {
                var iframe = document.getElementById('iFrameEmbedReport');

                // To load a Report do the following:
                // Set the IFrame source to the EmbedUrl from the Get Reports operation
                iframe.src = document.getElementById('MainContent_ReportEmbedUrl').value;

                // Add an onload handler to submit the access token
                iframe.onload = postActionLoadReport;
            }
        };

        // Post the access token to the IFrame
        function postActionLoadReport() {

            // Construct the push message structure
            // this structure also supports setting the reportId, groupId, height, and width.
            // when using a report in a group, you must provide the groupId on the iFrame SRC
            var m = {
                action: "loadReport",
                accessToken: document.getElementById('MainContent_accessToken').value
            };
            message = JSON.stringify(m);

            // push the message.
            iframe = document.getElementById('iFrameEmbedReport');
            iframe.contentWindow.postMessage(message, "*");;
        }

    </script>
    <asp:HiddenField ID="accessToken" runat="server" />
    <asp:Button ID="getReportButton" runat="server" OnClick="getReportButton_Click" Text="Get Report" />  

    <table>
        <tr><td>Report Embed URL</td> <td><asp:Textbox ID="ReportEmbedUrl" runat="server" Width="900px"></asp:Textbox></td></tr>

        <tr><td>Report</td><td></td></tr>
        <tr><td></td><td>
            <iframe ID="iFrameEmbedReport" height="500px" width="900px"></iframe>
        </td></tr>   
    </table>
</asp:Content>

```

<a name="default-code"/>
## Sample C# code to get access token, and get report (Default.aspx.cs)
```
public partial class _Default : Page
{
    string baseUri = "https://api.powerbi.com/beta/myorg/";

    protected void Page_Load(object sender, EventArgs e)
    {

        //Need an Authorization Code from Azure AD before you can get an access token to be able to call Power BI operations
        //You get the Authorization Code when you click Get Report (see below).
        //After you call AcquireAuthorizationCode(), Azure AD redirects back to this page with an Authorization Code.
        if (Request.Params.Get("code") != null)
        {
            //After you get an AccessToken, you can call Power BI API operations such as Get Report
            Session["AccessToken"] = GetAccessToken(
                Request.Params.GetValues("code")[0],
                Settings.Default.ClientID,
                Settings.Default.ClientSecret,
                Settings.Default.RedirectUri);

            //Redirect again to get rid of code=
            Response.Redirect("/Default.aspx");
        }

        //After the redirect above to get rid of code=, Session["authResult"] does not equal null, which means you have an
        //Access Token. With the Acccess Token, you can call the Power BI Get Reports operation. Get Reports returns information
        //about a Report, not the actual Report visual. You get the Report visual later with some JavaScript. See postActionLoadReport()
        //in Default.aspx.
        if (Session["AccessToken"] != null)            
        {
            //You need the Access Token in an HTML element so that the JavaScript can load a Report visual into an IFrame.
            //Without the Access Token, you can not access the Report visual.
            accessToken.Value = Session["AccessToken"].ToString();

            //In this sample, you get the first Report. In a production app, you would create a more robost
            //solution

            //Get first report.
            GetReport(0);
        }
    }

    protected void getReportButton_Click(object sender, EventArgs e)
    {
        //You need an Authorization Code from Azure AD so that you can get an Access Token
        //Values are hard-coded for sample purposes.
        GetAuthorizationCode();
    }


    //Get a Report. In this sample, you get the first Report.
    protected void GetReport(int index)
    {
        //Configure Reports request
        System.Net.WebRequest request = System.Net.WebRequest.Create(
            String.Format("{0}/Reports",
            baseUri)) as System.Net.HttpWebRequest;

        request.Method = "GET";
        request.ContentLength = 0;
        request.Headers.Add("Authorization", String.Format("Bearer {0}", accessToken.Value));

        //Get Reports response from request.GetResponse()
        using (var response = request.GetResponse() as System.Net.HttpWebResponse)
        {
            //Get reader from response stream
            using (var reader = new System.IO.StreamReader(response.GetResponseStream()))
            {
                //Deserialize JSON string
                PBIReports Reports = JsonConvert.DeserializeObject<PBIReports>(reader.ReadToEnd());

                //Sample assumes at least one Report.
                //You could write an app that lists all Reports
                if (Reports.value.Length > 0)
                    ReportEmbedUrl.Text = Reports.value[index].embedUrl;
            }
        }
    }

    public void GetAuthorizationCode()
    {
        //NOTE: Values are hard-coded for sample purposes.
        //Create a query string
        //Create a sign-in NameValueCollection for query string
        var @params = new NameValueCollection
        {
            //Azure AD will return an authorization code.
            {"response_type", "code"},

            //Client ID is used by the application to identify themselves to the users that they are requesting permissions from.
            //You get the client id when you register your Azure app.
            {"client_id", Settings.Default.ClientID},

            //Resource uri to the Power BI resource to be authorized
            //The resource uri is hard-coded for sample purposes
            {"resource", "https://analysis.windows.net/powerbi/api"},

            //After app authenticates, Azure AD will redirect back to the web app. In this sample, Azure AD redirects back
            //to Default page (Default.aspx).
            { "redirect_uri", Settings.Default.RedirectUri}
        };

        //Create sign-in query string
        var queryString = HttpUtility.ParseQueryString(string.Empty);
        queryString.Add(@params);

        //Redirect to Azure AD Authority
        //  Authority Uri is an Azure resource that takes a client id and client secret to get an Access token
        //  QueryString contains
        //      response_type of "code"
        //      client_id that identifies your app in Azure AD
        //      resource which is the Power BI API resource to be authorized
        //      redirect_uri which is the uri that Azure AD will redirect back to after it authenticates

        //Redirect to Azure AD to get an authorization code
        Response.Redirect(String.Format("https://login.windows.net/common/oauth2/authorize?{0}", queryString));
    }

    public string GetAccessToken(string authorizationCode, string clientID, string clientSecret, string redirectUri)
    {
        //Redirect uri must match the redirect_uri used when requesting Authorization code.
        //Note: If you use a redirect back to Default, as in this sample, you need to add a forward slash
        //such as http://localhost:13526/

        // Get auth token from auth code       
        TokenCache TC = new TokenCache();

        //Values are hard-coded for sample purposes
        string authority = "https://login.windows.net/common/oauth2/authorize";
        AuthenticationContext AC = new AuthenticationContext(authority, TC);
        ClientCredential cc = new ClientCredential(clientID, clientSecret);

        //Set token from authentication result
        return AC.AcquireTokenByAuthorizationCode(
            authorizationCode,
            new Uri(redirectUri), cc).AccessToken;
    }
}

//Power BI Reports used to deserialize the Get Reports response.
public class PBIReports
{
    public PBIReport[] value { get; set; }
}
public class PBIReport
{
    public string id { get; set; }
    public string name { get; set; }
    public string webUrl { get; set; }
    public string embedUrl { get; set; }
}
```
## See also
[Integrate a report into an app walkthrough](powerbi-developer-integrate-report.md)
