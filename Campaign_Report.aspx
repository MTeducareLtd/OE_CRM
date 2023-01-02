<%@ Page Title="" Language="C#" MasterPageFile="~/OE_CRM.master" AutoEventWireup="true"
    CodeFile="Campaign_Report.aspx.cs" Inherits="Campaign_Report" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link rel="stylesheet" type="text/css" href="SIPassets/global/plugins/bootstrap-select/css/bootstrap-select.min.css?v=<%=Version%>" />
    <script src="CustomJS/JsCampaignReport.js?v=<%=Version%>" type="text/javascript"></script>
    <script type="text/javascript" src="SIPassets/pages/scripts/components-bootstrap-select.min.js?v=<%=Version%>"></script>
    <script type="text/javascript" src="SIPassets/global/plugins/bootstrap-select/js/bootstrap-select.min.js?v=<%=Version%>"></script>
    <script src="SIPassets/global/plugins/bootstrap-toastr/toastr.min.js?v=<%=Version%>" type="text/javascript"></script>
    <script type="text/javascript">
        function ReadConfigSettings() {
            var conn = '<%= System.Configuration.ConfigurationManager.AppSettings["Version"].ToString() %>';
            document.getElementById("lblCampaignDetailcode").value = conn;
        }
    </script>

    <style type="text/css">
        .errorClass
        {
            border: 1px solid red !important;
        }
        .sucessClass
        {
            border-color: green !important;
        }
        
        #tdTotalCamapignCount:hover
        {
            background-color: Silver;
        }
        #tdPendingContacts:hover
        {
            background-color: Silver;
        }
        #tdAvailableLeads:hover
        {
            background-color: Silver;
        }
        #tdAvailableOpportunity:hover
        {
            background-color: Silver;
        }
        #tdAccount:hover
        {
            background-color: Silver;
        }
        #tdLostContacts:hover
        {
            background-color: Silver;
        }
        #tdTodaysFollowup:hover
        {
            background-color: Silver;
        }
        #tdYeasterdayPendingFollowup:hover
        {
            background-color: Silver;
        }
        #tdNextsevendayfollowup:hover
        {
            background-color: Silver;
        }
        #tdprevsevendaysfollowup:hover
        {
            background-color: Silver;
        }
        #tdUnattemptedContacts:hover
        {
            background-color: Silver;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <input type="hidden" id="Type" />
    <div class="page-content-wrapper">
        <div class="page-content">
            <!-- BEGIN SAMPLE TABLE PORTLET-->
            <div id="AssignedCampaign" style="width: 100%;">
                <!-- BEGIN PORTLET-->
                <div class="portlet-body form">
                    <div id="AssignedCamapaign1">
                        <input type="text" id="lblCampaignDetailcode" style="display: none;" />
                        <table class="table table-bordered">
                            <tbody id="TCampaignAssigned">
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
