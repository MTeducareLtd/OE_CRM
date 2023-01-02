<%@ Page Title="" Language="C#" MasterPageFile="~/OE_CRM.master" AutoEventWireup="true"
    CodeFile="Campaign.aspx.cs" Inherits="Campaign" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link rel="stylesheet" type="text/css" href="SIPassets/global/plugins/bootstrap-select/css/bootstrap-select.min.css?v=<%=Version%>" />    
    <link rel="stylesheet" type="text/css" href="AppJS/CRMExternal.css?v=<%=Version%>" />  
    <script src="CustomJS/JsCampaign.js?v=<%=Version%>" type="text/javascript"></script>
    <%--<script src="CustomJS/searchPage.js?v=<%=Version%>" type="text/javascript"></script>--%>
    <script type="text/javascript" src="SIPassets/pages/scripts/components-bootstrap-select.min.js?v=<%=Version%>"></script>
    <script type="text/javascript" src="SIPassets/global/plugins/bootstrap-select/js/bootstrap-select.min.js?v=<%=Version%>"></script>
    <script src="SIPassets/global/plugins/bootstrap-toastr/toastr.min.js?v=<%=Version%>"
        type="text/javascript"></script>
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
                        <table class="table" style="margin-top: 5px; margin-bottom: 1px;">
                            <tbody id="Tbody1">
                                <tr>
                                    <td> 
                                        <div class="input-group">
                                          <span class="input-group-addon"><i class="fa fa-search"></i></span>
                                          <input type="text" class="form-control" id="txtCampName" onkeypress="return onlyAlphabets(event);"
                                                                        placeholder="Search By Campaign Name" style="width: 100%">
                                        </div>                                                                                                 
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                        <table class="table table-fixedheader1">
                            <tbody id="TCampaignAssigned">
                            </tbody>
                        </table>
                        <label id="lblCampaignCount" style="font-weight: bold; display: none" />
                    </div>
                </div>
            </div>
            <div id="AssignedCampaignDetail" style="width: 100%; display: none;">
                <!-- BEGIN PORTLET-->
                <div class="portlet box blue-steel">
                    <div class="portlet-title">
                        <div class="caption">
                            <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">
                                <span id="btnCampaignDetailHome"><i style="font-size: 25px; cursor: pointer;" data-toggle="tooltip"
                                    data-placement="bottom" title="Back" class="fa fa-arrow-left"></i></span>
                            </div>
                            <div class="col-lg-10 col-md-10 col-sm-10 col-xs-10">
                                Campaign Detail</div>
                        </div>
                    </div>
                    <div class="portlet-body form">
                        <div id="div2">
                            <!-- BEGIN FORM-->
                            <form action="#" class="form-horizontal form-bordered">
                            <div class="form-body">
                                <div class="form-group">
                                    <div class="row">
                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                            <table class="table table-striped table-bordered table-hover">
                                            </table>
                                        </div>
                                        <%--  <br />
                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        </div>
                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        </div>
                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        </div>
                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        </div>--%>
                                        <div class="portlet-body form">
                                            <div id="divCamapignDetail1">
                                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                    <input type="text" id="lblCampaignDetailcode" style="display: none;" />
                                                    <table class="table table-bordered table-striped table-hover" id="tableCamapignDetail1">
                                                        <tr>
                                                            <td style="width: 100%; text-align: center" colspan="2">
                                                                <label id="lblCamapignname" style="color: Red; font-weight: bold;" />
                                                            </td>
                                                        </tr>
                                                        <tr style="background: #b1a0c7;">
                                                            <th style="width: 50%;">
                                                                Total Campaign Contacts
                                                            </th>
                                                            <td style="width: 50%; color: Black; cursor: pointer;" id="tdTotalCamapignCount">
                                                                <label id="lblCount" style="float: right; font-weight: bold;" />
                                                            </td>
                                                        </tr>
                                                        <%--<tr>
                                                            <th style="width: 50%;">
                                                                Pending Contacts
                                                            </th>
                                                            <td style="width: 50%; color: Red; cursor: pointer;" id="tdPendingContacts">
                                                                <label id="lblPendingContacts" style="float: right;" />
                                                            </td>
                                                        </tr>--%>
                                                        <tr>
                                                            <th style="width: 50%;">
                                                                Not Called Even Once
                                                                <%--Unattempted Contacts--%>
                                                            </th>
                                                            <td style="width: 50%; color: Black; cursor: pointer;" id="tdUnattemptedContacts">
                                                                <label id="lblUnAttemptedContacts" style="float: right; font-weight: bold;" />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <th style="width: 50%;">
                                                                Called but not Converted to Lead
                                                            </th>
                                                            <td style="width: 50%; color: Black; cursor: pointer;" id="tdCalledbutnotConvertedtoLead">
                                                                <label id="lblCalledbutnotConvertedtoLead" style="float: right; font-weight: bold;" />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <th style="width: 50%;">
                                                                Available Leads
                                                            </th>
                                                            <td style="width: 50%; color: Black; cursor: pointer;" id="tdAvailableLeads">
                                                                <label id="lblAvailableLeads" style="float: right; font-weight: bold;" />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <th style="width: 50%;">
                                                                Available Opportunity
                                                            </th>
                                                            <td style="width: 50%; color: Black; cursor: pointer;" id="tdAvailableOpportunity">
                                                                <label id="lblAvailableOpportunity" style="float: right; font-weight: bold;" />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <th style="width: 50%;">
                                                                Account (Admission)
                                                            </th>
                                                            <td style="width: 50%; color: Black; cursor: pointer;" id="tdAccount">
                                                                <label id="lblAccount" style="float: right; font-weight: bold;" />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <th style="width: 50%;">
                                                                Lost Contacts
                                                            </th>
                                                            <td style="width: 50%; color: Black; cursor: pointer;" id="tdLostContacts">
                                                                <label id="lblLostCount" style="float: right; font-weight: bold;" />
                                                            </td>
                                                        </tr>
                                                    </table>
                                                    <table class="table table-bordered table-striped table-hover" id="tableCamapignDetail2">
                                                        <tr>
                                                            <td style="width: 100%; text-align: center" colspan="2">
                                                                <label id="lblCamapignname2" style="color: Red; font-weight: bold;" />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <th style="width: 50%;">
                                                                Total Followup Done till date
                                                            </th>
                                                            <td style="width: 50%; color: Black; cursor: pointer;" id="tdTotalFollowupDoneTillDate">
                                                                <label id="lblTotalFollowupDoneTillDate" style="float: right; font-weight: bold;" />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <th style="width: 50%;">
                                                                Today's Followup
                                                            </th>
                                                            <td style="width: 50%; color: Black; cursor: pointer;" id="tdTodaysFollowup">
                                                                <label id="lblTodayFollowup" style="float: right; font-weight: bold;" />
                                                            </td>
                                                        </tr>
                                                        <%--<tr>
                                                            <th>
                                                                Yesterday's Pending Followup
                                                            </th>
                                                            <td style="width: 50%; color: Red; cursor: pointer;" id="tdYeasterdayPendingFollowup">
                                                                <label id="lblYesterdayFollowup" style="float: right;" />
                                                            </td>
                                                        </tr>--%>
                                                        <tr>
                                                            <th style="width: 50%;">
                                                                Overdue follow up
                                                            </th>
                                                            <td style="width: 50%; color: Black; cursor: pointer;" id="tdOverdueFollowup">
                                                                <label id="lblOverdueFollowup" style="float: right; font-weight: bold;" />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <th style="width: 50%;">
                                                                Next 7 Days Followup
                                                            </th>
                                                            <td style="width: 50%; color: Black; cursor: pointer;" id="tdNextsevendayfollowup">
                                                                <label id="lblNext7days" style="float: right; font-weight: bold;" />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <th style="width: 50%;">
                                                                Prev 7 days Followup
                                                            </th>
                                                            <td style="width: 50%; color: Black; cursor: pointer;" id="tdprevsevendaysfollowup">
                                                                <label id="lblPrev7days" style="float: right; font-weight: bold;" />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <th style="width: 50%;">
                                                                Last 50 Followup
                                                            </th>
                                                            <td style="width: 50%; color: Black; cursor: pointer;" id="tdLast50touchfollowup">
                                                                <label id="lblLast50touchfollowup" style="float: right; font-weight: bold;" />
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            </form>
                            <!-- END FORM-->
                        </div>
                    </div>
                </div>
            </div>
            <div id="divCampaignSearch" style="display: none;">
                <div class="profile-content">
                    <div class="portlet box blue-steel">
                        <div class="portlet-title">
                            <div class="caption">
                                <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">
                                    <span id="btnCampaigncountHome"><i style="font-size: 24px; cursor: pointer;" data-toggle="tooltip"
                                        data-placement="bottom" title="Back" class="fa fa-arrow-left"></i></span>
                                </div>
                                <div class="col-lg-10 col-md-10 col-sm-10 col-xs-10">
                                    Campaign Detail</div>
                            </div>
                        </div>
                        <div class="portlet-body">                          
                            <%--<table width="100%">
                                <tr>
                                    <td>--%>
                                        <div class="panel-group accordion" id="accordion1" >
                                            <div class="panel panel-default">
                                                <div class="panel-heading">
                                                    <h4 class="panel-title" style="background-color: red;">
                                                        <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion1" href="#collapse_1">
                                                            <img src="Images/Search.png" alt="Search" width="30px" /><b>Advance Search</b>
                                                        </a>
                                                    </h4>
                                                </div>
                                                <div id="collapse_1" class="panel-collapse collapse">                                                    
                                                        <table class="table table-striped table-bordered table-hover"><%--table table-striped table-bordered table-advance table-hover--%>
                                                            <tr>
                                                                <td>
                                                                    <b>Student Name</b>
                                                                </td>
                                                                <td>
                                                                    <input type="text" class="form-control" id="txtCampStudentName" onkeypress="return onlyAlphabets(event);"
                                                                        placeholder="Student Name" onkeydown="if (event.keyCode == 13){document.getElementById('btnCampaignSearch').click(); return false;}" 
                                                                         />
                                                                    <input type="text" id="lblCamapignflag" style="display: none;" />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <b>Contact Number</b>
                                                                </td>
                                                                <td>
                                                                    <input type="text" class="form-control" id="txtContactNumber" onkeypress="return  NumberOnly(event);"
                                                                         placeholder="Contact Number" onkeydown="if (event.keyCode == 13){document.getElementById('btnCampaignSearch').click(); return false;}" />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <b>Enroll No./ UID</b>
                                                                </td>
                                                                <td>
                                                                    <input type="text" class="form-control" id="txtCampStudentUID" onkeypress="return onlyAlphabets(event);"
                                                                        placeholder="Enroll No./ UID" onkeydown="if (event.keyCode == 13){document.getElementById('btnCampaignSearch').click(); return false;}" 
                                                                         />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <b>Inhouse/ Outsider</b>
                                                                </td>
                                                                <td>
                                                                    <div id="divadvadmission">
                                                                        <select class="bs-select form-control" data-live-search="true" id="ddlMTNMT">
                                                                            <option value="Select">Select</option>
                                                                            <option value="Inhouse">Inhouse</option>
                                                                            <option value="Outsider">Outsider</option>
                                                                        </select>
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <b>Previous Center </b>
                                                                </td>
                                                                <td>
                                                                    <%--<input type="text" class="form-control" id="txtXcenter" onkeypress="return onlyAlphabets(event);" 
                                                                        placeholder="Previous Center" onkeydown="if (event.keyCode == 13){document.getElementById('btnCampaignSearch').click(); return false;}" />--%>
                                                                        <div id="divCenterSearch">
                                                                        <select class="bs-select form-control" data-live-search="true" data-size="8" required="required"
                                                                            id="ddlCenterSearch">
                                                                            <option value="0">Select</option>
                                                                        </select>
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <b>Institute Type</b>
                                                                </td>
                                                                <td>
                                                                    <div id="divInstitutionType">
                                                                        <select class="bs-select form-control" data-live-search="true" data-size="8" required="required"
                                                                            id="ddlInstitutionType">
                                                                            <option value="0">Select</option>
                                                                        </select>
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <b>Board </b>
                                                                </td>
                                                                <td>
                                                                    <div id="divBoard">
                                                                        <select class="bs-select form-control" data-live-search="true" data-size="8" required="required"
                                                                            id="ddlBoard">
                                                                            <option value="0">Select</option>
                                                                        </select>
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <b>Class/ Standard</b>
                                                                </td>
                                                                <td>
                                                                    <div id="divClassStandard">
                                                                        <select class="bs-select form-control" data-live-search="true" data-size="8" required="required"
                                                                            id="ddlClassStandard">
                                                                            <option value="0">Select</option>
                                                                        </select>
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                            <%--<tr>
                                                                <td>
                                                                    <b>Board </b>
                                                                </td>
                                                                <td>
                                                                    <input type="text" class="form-control" id="txtBoard" onkeypress="return onlyAlphabets(event);"
                                                                        placeholder="Board" onkeydown="if (event.keyCode == 13){document.getElementById('btnCampaignSearch').click(); return false;}" />
                                                                </td>
                                                            </tr>--%>
                                                            <tr>
                                                                <td>
                                                                    <b>School Name </b>
                                                                </td>
                                                                <td>
                                                                    <div id="divSchoolName">
                                                                        <select class="bs-select form-control" data-live-search="true" data-size="8" required="required"
                                                                            id="ddlSchoolName">
                                                                            <option value="0">Select</option>
                                                                        </select>
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <b>Exam</b>
                                                                </td>
                                                                <td>
                                                                    <div id="divExam">
                                                                        <select class="bs-select form-control" data-live-search="true" data-size="8" required="required"
                                                                            id="ddlExam">
                                                                            <option value="0">Select</option>
                                                                        </select>
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <b>Exam Status</b>
                                                                </td>
                                                                <td>
                                                                    <div id="divExamStatus">
                                                                        <select class="bs-select form-control" data-live-search="true" data-size="8" required="required"
                                                                            id="ddlExamStatus">
                                                                            <option value="0">Select</option>
                                                                        </select>
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <b>Exam Rank</b>
                                                                </td>
                                                                <td>
                                                                    <input type="text" id="txtFromRank" onkeypress="return  NumberOnly(event);" style="width: 80px;"
                                                                        placeholder="From" onkeydown="if (event.keyCode == 13){document.getElementById('btnCampaignSearch').click(); return false;}" />
                                                                    <input type="text" id="txtToRank" onkeypress="return  NumberOnly(event);" style="width: 80px;"
                                                                        placeholder="To" onkeydown="if (event.keyCode == 13){document.getElementById('btnCampaignSearch').click(); return false;}" />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <b>Event</b>
                                                                </td>
                                                                <td>
                                                                    <div id="divEvent">
                                                                        <select class="bs-select form-control" data-live-search="true" data-size="8" required="required"
                                                                            id="ddlEvent">
                                                                            <option value="0">Select</option>
                                                                        </select>
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <b>Event Type</b>
                                                                </td>
                                                                <td>
                                                                    <div id="divEventType">
                                                                        <select class="bs-select form-control" data-live-search="true" data-size="8" required="required"
                                                                            id="ddlEventType">
                                                                            <option value="0">Select</option>
                                                                        </select>
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                            <tr id="trAttendance">
                                                                <td>
                                                                    <b>Attendance</b>
                                                                </td>
                                                                <td>
                                                                    <div id="divAttendance">
                                                                        <select class="bs-select form-control" data-live-search="true" data-size="8" required="required"
                                                                            id="ddlAttendance">
                                                                            <option value="0">Select</option>
                                                                            <option value="P">Present</option>
                                                                            <option value="A">Absent</option>
                                                                            <option value="Both">Both</option>
                                                                        </select>
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                            <tr id="trFeedbackHeader">
                                                                <td>
                                                                    <b>Feedback Header</b>
                                                                </td>
                                                                <td>
                                                                    <div id="divFeedbackHeader">
                                                                        <select class="bs-select form-control" data-live-search="true" data-size="8" required="required"
                                                                            id="ddlFeedbackHeader">
                                                                            <option value="0">Select</option>
                                                                        </select>
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                            <tr id="trFeedbackValues">
                                                                <td>
                                                                    <b>Feedback Values</b>
                                                                </td>
                                                                <td>
                                                                    <div id="divFeedbackValues">
                                                                        <select class="bs-select form-control" data-live-search="true" data-size="8" required="required"
                                                                            id="ddlFeedbackValues">
                                                                            <option value="0">Select</option>
                                                                        </select>
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <b>Followup Status</b>
                                                                </td>
                                                                <td>
                                                                    <div id="div1">
                                                                        <select class="bs-select form-control" data-live-search="true" id="ddlstatuslead">
                                                                            <option value="0">Select</option>
                                                                            <option value="03">Hot</option>
                                                                            <option value="04">Cold</option>
                                                                            <option value="02">Open</option>
                                                                            <option value="05">Warm</option>
                                                                            <option value="01">Lost</option>
                                                                        </select>
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td colspan="2">
                                                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" style="text-align: center;">
                                                                        <input type="text" id="lblLeadflag" style="display: none;" />
                                                                        <input type="text" id="lblOpportunityflag" style="display: none;" />
                                                                        <input type="text" id="lblAdmissionflag" style="display: none;" />
                                                                        <a id="btnCampaignSearch" class="btn red">Search</a>
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                        </table>                                                    
                                                </div>
                                            </div>
                                        </div>
                                   <%-- </td>
                                </tr>
                                <tr>
                                    <td>--%>
                                        <div id="divCampaignData" >
                                            <table class="table table-fixedheader table-hover col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                <%--<thead id="tdcampaigndata">
                                                    <tr id="trCampaignheader" style="border: ridge;">
                                                        <th style="width: 25%;">
                                                            Name
                                                        </th>
                                                        <th style="width: 50%;">
                                                            Details
                                                        </th>
                                                        <th style="width: 25%;">
                                                            Action
                                                        </th>
                                                    </tr>
                                                </thead>--%>
                                                <thead id="tdcampaigndata">
                                                    <tr id="trCampaignheader" style="border: ridge;">
                                                        
                                                        <th style="width: 100%;">
                                                            Student Details
                                                        </th>
                                                    </tr>
                                                </thead>
                                                <tbody id="TCampaign">
                                                </tbody>
                                            </table>
                                        </div>
                                    <%--</td>
                                </tr>
                                <tr>
                                    <td>--%>
                                        <div class="row text-left" style="padding-left: 15px; padding-right: 15px">
                                            <input id="lblPageNo" style="display: none;" />
                                            <label id="lblShowingInfo" style="float: left;">
                                            </label>
                                            <div id="divnextButton" style="display: none;">
                                                <a id="btnNext" class="btn purple" style="float: right;">Next</a>
                                            </div>
                                            <div id="divPrevButton" style="display: none;">
                                                <a id="btnPrev" class="btn red" style="float: right; margin-right: 5px;">Prev</a>
                                            </div>
                                        </div>
                                    <%--</td>
                                </tr>
                            </table>--%>                            
                        
                        </div>
                    </div>
                </div>
            </div>
            <div id="divConvertToLead" style="width: 100%; display: none;">
                <div class="portlet box blue-steel">
                    <div class="portlet-title">
                        <div class="caption">
                            <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">
                                <span id="btnConvertToLeadHome"><i style="font-size: 25px; cursor: pointer;" data-toggle="tooltip"
                                    data-placement="bottom" title="Back" class="fa fa-arrow-left"></i></span>
                            </div>
                            <div class="col-lg-10 col-md-10 col-sm-10 col-xs-10">
                                Add Lead Details</div>
                        </div>
                    </div>
                    <div class="portlet-body form">
                        <!-- BEGIN FORM-->
                        <div class="form-horizontal form-bordered">
                            <form action="#" class="form-horizontal form-bordered">
                            <div class="form-body">
                                <div class="form-group">
                                    <div class="row">
                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                            <table class="table table-striped table-bordered table-hover">
                                                <tr>
                                                    <th>
                                                        Name
                                                    </th>
                                                    <td>
                                                        <label id="lblStudentName" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th>
                                                        Email Id
                                                    </th>
                                                    <td>
                                                        <label id="lblEmailId" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th>
                                                        Gender
                                                    </th>
                                                    <td>
                                                        <label id="lblGender" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th>
                                                        Mobile No.
                                                    </th>
                                                    <td>
                                                        <label id="lblMobileNo1" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th>
                                                        Campaign
                                                    </th>
                                                    <td>
                                                        <label id="lblCampaign" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th>
                                                        Acad Year<span class="text-danger">*</span>
                                                    </th>
                                                    <td>
                                                        <div id="divleadAcadYear">
                                                            <select class="bs-select form-control" data-live-search="true" data-size="8" required="required"
                                                                id="ddlAcadYear">
                                                                <option value="0">Select</option>
                                                            </select>
                                                        </div>
                                                        <br />
                                                        <label id="lblAcadYear" style="color: Red;">
                                                        </label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th>
                                                        Division<span class="text-danger">*</span>
                                                    </th>
                                                    <td>
                                                        <div id="divLeadDivision">
                                                            <select class="bs-select form-control" data-live-search="true" data-size="8" required="required"
                                                                id="ddlDivision">
                                                                <option value="0">Select</option>
                                                            </select>
                                                        </div>
                                                        <br />
                                                        <label id="lblDivision" style="color: Red;">
                                                        </label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th>
                                                        Center<span class="text-danger">*</span>
                                                    </th>
                                                    <td>
                                                        <div id="divLeadCenter">
                                                            <select class="bs-select form-control selectpicker" data-live-search="true" required="required"
                                                                id="ddlCenter">
                                                                <option value="0">Select</option>
                                                            </select>
                                                        </div>
                                                        <br />
                                                        <label id="lblCenter" style="color: Red;">
                                                        </label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="2">
                                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-center">
                                                            <input type="text" id="lblPKey" style="display: none;" />
                                                            <a id="btnLeadSave" class="btn red">Save</a> <a id="btnLeadClose" class="btn grey-salsa">
                                                                Close</a>
                                                        </div>
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            </form>
                            <!-- END FORM-->
                        </div>
                        <!-- END FORM-->
                    </div>
                </div>
            </div>
            <div id="divConvertToOpportunity" style="width: 100%; display: none;">
                <div class="portlet box blue-steel">
                    <div class="portlet-title">
                        <div class="caption">
                            <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">
                                <span id="btnConvertToOpportunityHome"><i style="font-size: 25px; cursor: pointer;"
                                    data-toggle="tooltip" data-placement="bottom" title="Back" class="fa fa-arrow-left">
                                </i></span>
                            </div>
                            <div class="col-lg-10 col-md-10 col-sm-10 col-xs-10">
                                Opportunity Details</div>
                        </div>
                    </div>
                    <div class="portlet-body form">
                        <!-- BEGIN FORM-->
                        <div class="form-horizontal form-bordered">
                            <form action="#" class="form-horizontal form-bordered">
                            <div class="form-body">
                                <div class="form-group">
                                    <div class="row">
                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                            <table class="table  table-striped table-bordered table-hover">
                                                <tr>
                                                    <th>
                                                        Name
                                                    </th>
                                                    <td>
                                                        <label id="lblopportunityStudentName" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th>
                                                        Email Id
                                                    </th>
                                                    <td>
                                                        <label id="lblopportunityEmail" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th>
                                                        Gender
                                                    </th>
                                                    <td>
                                                        <label id="lblopportunityGender" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th>
                                                        Mobile No.
                                                    </th>
                                                    <td>
                                                        <label id="lblopportunityMobileNo" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th>
                                                        Campaign
                                                    </th>
                                                    <td>
                                                        <label id="lblopportunityCampaign" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th>
                                                        Acad Year
                                                    </th>
                                                    <td>
                                                        <div id="divopporacadYear">
                                                            <select class="bs-select form-control" data-live-search="true" data-size="8" id="ddlOpportunityAcadYear">
                                                                <option value="0">Select</option>
                                                            </select>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th>
                                                        Division
                                                    </th>
                                                    <td>
                                                        <div id="divopporDivision">
                                                            <select class="bs-select form-control" data-live-search="true" data-size="8" id="ddlOpportunityDivision">
                                                                <option value="0">Select</option>
                                                            </select>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th>
                                                        Center
                                                    </th>
                                                    <td>
                                                        <div id="divopporCenter">
                                                            <select class="bs-select form-control" data-live-search="true" data-size="8" id="ddlOpportunityCenter">
                                                                <option value="0">Select</option>
                                                            </select>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th>
                                                        Sales Stage<span class="text-danger">*</span>
                                                    </th>
                                                    <td>
                                                        <div id="divopporSalesStage">
                                                            <select class="bs-select form-control selectpicker" data-live-search="true" data-size="8"
                                                                id="ddlSalesStage" style="border: ridge;">
                                                                <option value="0">Select</option>
                                                            </select>
                                                        </div>
                                                        <br />
                                                        <label id="lblsalesStage" style="color: Red;">
                                                        </label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th>
                                                        Product<span class="text-danger">*</span>
                                                    </th>
                                                    <td>
                                                        <div id="divopporProduct">
                                                            <select class="bs-select form-control selectpicker" data-live-search="true" required="required"
                                                                id="ddlProduct">
                                                                <option value="0">Select</option>
                                                            </select>
                                                        </div>
                                                        <br />
                                                        <label id="lblProduct" style="color: Red;">
                                                        </label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th>
                                                        Expected Closure Date <span class="text-danger">*</span>
                                                    </th>
                                                    <td>
                                                        <div id="txtClosuredate" class="input-group input-medium date date-picker" data-date="01/2016"
                                                            data-date-format="mm/dd/yyyy" data-date-viewmode="years" data-date-minviewmode="months">
                                                            <span class="input-group-btn">
                                                                <button class="btn default" type="button" style="height: 34px;">
                                                                    <i style="font-size: 14px;" class="fa fa-calendar"></i>
                                                                </button>
                                                            </span>
                                                            <input type="text" class="form-control" readonly="readonly" id="txtClosuredate1"
                                                                onkeyup="SetButtonStatus()" placeholder="Expected Closure Date" />
                                                        </div>
                                                        <label id="lblClosuredate" style="color: Red;">
                                                        </label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th>
                                                        Probability %<span class="text-danger">*</span>
                                                    </th>
                                                    <td>
                                                        <input type="text" id="txtProbability" required="required" class="form-control" placeholder="Probability" />
                                                        <label id="lblProbability" style="color: Red;">
                                                        </label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="2">
                                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-center">
                                                            <input type="text" id="lblPKey1" style="display: none;" />
                                                            <a id="btnOpportunitySave" class="btn red">Save</a> <a id="btnOpportunityClose" class="btn grey-salsa">
                                                                Close</a>
                                                        </div>
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            </form>
                            <!-- END FORM-->
                        </div>
                        <!-- END FORM-->
                    </div>
                </div>
            </div>
            <div id="divBookAdmission" style="width: 100%; display: none;">
                <div class="portlet box blue-steel">
                    <div class="portlet-title">
                        <div class="caption">
                            <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">
                                <span id="btnBookAdmissionHome"><i style="font-size: 25px; cursor: pointer;" data-toggle="tooltip"
                                    data-placement="bottom" title="Back" class="fa fa-arrow-left"></i></span>
                            </div>
                            <div class="col-lg-10 col-md-10 col-sm-10 col-xs-10">
                                Book Admission</div>
                        </div>
                    </div>
                    <div class="portlet-body form">
                        <!-- BEGIN FORM-->
                        <div class="form-horizontal form-bordered">
                            <form action="#" class="form-horizontal form-bordered">
                            <div class="form-body">
                                <div class="form-group">
                                    <div class="row">
                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                            <table class="table table-striped table-bordered table-hover">
                                                <tr>
                                                    <th>
                                                        Name
                                                    </th>
                                                    <td>
                                                        <label id="lblAdmissionStudentName" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th>
                                                        Email Id
                                                    </th>
                                                    <td>
                                                        <label id="lblAdmissionEmailId" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th>
                                                        Gender
                                                    </th>
                                                    <td>
                                                        <label id="lblAdmissionGender" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th>
                                                        Mobile No.
                                                    </th>
                                                    <td>
                                                        <label id="lblAdmissionMobileNo" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th>
                                                        Campaign
                                                    </th>
                                                    <td>
                                                        <label id="lblAdmissionCampaign" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th>
                                                        Acad Year
                                                    </th>
                                                    <td>
                                                        <div id="divadmissionacadyear">
                                                            <select class="bs-select form-control" data-live-search="true" data-size="8" id="ddlBookAdmissionAcadYear">
                                                                <option value="0">Select</option>
                                                            </select>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th>
                                                        Division
                                                    </th>
                                                    <td>
                                                        <div id="divadmissiondivision">
                                                            <select class="bs-select form-control" data-live-search="true" data-size="8" id="ddlBookAdmissionDivision">
                                                                <option value="0">Select</option>
                                                            </select>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th>
                                                        Center
                                                    </th>
                                                    <td>
                                                        <div id="divadmissionCenter">
                                                            <select class="bs-select form-control" data-live-search="true" data-size="8" id="ddlBookAdmissionCenter">
                                                                <option value="0">Select</option>
                                                            </select>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th>
                                                        Sales Stage
                                                    </th>
                                                    <td>
                                                        <div id="divadmissionsalesstage">
                                                            <select class="bs-select form-control selectpicker" data-live-search="true" data-size="8"
                                                                id="ddlBookAdmissionSalesStage">
                                                                <option value="0">Select</option>
                                                            </select>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th>
                                                        Expected Closure Date
                                                    </th>
                                                    <td>
                                                        <div id="txtBookAdmissionClosureDate" class="input-group input-medium date date-picker"
                                                            data-date="01/2016" data-date-format="mm/dd/yyyy" data-date-viewmode="years"
                                                            data-date-minviewmode="months">
                                                            <input type="text" class="form-control" readonly="readonly" id="txtBookAdmissionClosureDate1"
                                                                onkeyup="SetButtonStatus()" />
                                                            <span class="input-group-btn">
                                                                <button class="btn default" type="button" style="height: 34px;" id="BookAdmissionClosureDate2">
                                                                    <i style="font-size: 14px;" class="fa fa-calendar"></i>
                                                                </button>
                                                            </span>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th>
                                                        Probability %
                                                    </th>
                                                    <td>
                                                        <label id="lblBookAdmissionProbability" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th>
                                                        Product
                                                    </th>
                                                    <td>
                                                        <%--  <select class="bs-select form-control" data-live-search="true" data-size="8" id="ddlBookAdmissionProduct">
                                                            <option value="0">Select</option>
                                                        </select>--%>
                                                        <label id="lblBookAdmissionProduct" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th>
                                                        Pay Plan<span class="text-danger">*</span>
                                                    </th>
                                                    <td>
                                                        <div id="divadmissionPayPlan">
                                                            <select class="bs-select form-control" data-live-search="true" required="required"
                                                                id="ddlPayPlan">
                                                                <option value="0">Select</option>
                                                            </select>
                                                        </div>
                                                        <br />
                                                        <label id="lblPayplan" style="color: Red;">
                                                        </label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th>
                                                        Product / Items Group Selection<span class="text-danger">*</span>
                                                    </th>
                                                    <td>
                                                        <%-- <div class="col-md-10">--%>
                                                        <div class="col-md-8">
                                                            <table class="table table-striped table-bordered table-hover">
                                                                <thead>
                                                                    <tr>
                                                                        <th style="width: 20%;">
                                                                            Select
                                                                        </th>
                                                                        <th style="width: 80%;">
                                                                            Items
                                                                        </th>
                                                                    </tr>
                                                                </thead>
                                                                <tbody id="TSubjectbody">
                                                                </tbody>
                                                            </table>
                                                        </div>
                                                        <br />
                                                        <label id="lblSubject" style="color: Red;">
                                                        </label>
                                                        <%--</div>--%>
                                                    </td>
                                                </tr>
                                                <tr id="trProduct">
                                                    <th>
                                                        Product / Items Group Selected
                                                    </th>
                                                    <td>
                                                        <div>
                                                            <table class="table table-striped table-bordered table-hover">
                                                                <thead>
                                                                    <tr>
                                                                        <th>
                                                                            Items
                                                                        </th>
                                                                    </tr>
                                                                </thead>
                                                                <tbody id="TConfirmedSubjectbody">
                                                                </tbody>
                                                            </table>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr id="trFeeStructure">
                                                    <th>
                                                        Fee Structure
                                                    </th>
                                                    <td>
                                                        <div>
                                                            <table class="table table-striped table-bordered table-hover">
                                                                <thead>
                                                                    <tr>
                                                                        <th>
                                                                            Voucher Description
                                                                        </th>
                                                                        <th>
                                                                            Amount
                                                                        </th>
                                                                    </tr>
                                                                </thead>
                                                                <tbody id="TFeeStructurebody">
                                                                </tbody>
                                                            </table>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="2">
                                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-center">
                                                            <input type="text" id="lblOpportunityCode" style="display: none;" />
                                                            <div id="divbookAdmissionProceedButton" style="display: inline;">
                                                                <a id="btnbookAdmissionProceed" class="btn red">Proceed</a>
                                                            </div>
                                                            <div id="divbtnSubmit" style="display: inline;">
                                                                <a id="btnSubmit" class="btn red">Submit</a>
                                                            </div>
                                                            <a id="btnbookAdmissionClose" class="btn grey-salsa">Close</a>
                                                        </div>
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            </form>
                            <!-- END FORM-->
                        </div>
                        <!-- END FORM-->
                    </div>
                </div>
            </div>
            <div id="divFollowUp" style="width: 100%; display: none;">
                <div class="portlet box blue-steel">
                    <div class="portlet-title">
                        <div class="caption">
                            <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">
                                <span id="btnFollowUpHome"><i style="font-size: 25px; cursor: pointer;" data-toggle="tooltip"
                                    data-placement="bottom" title="Back" class="fa fa-arrow-left"></i></span>
                            </div>
                            <div class="col-lg-10 col-md-10 col-sm-10 col-xs-10">
                                Follow Up Details</div>
                        </div>
                    </div>
                    <div class="portlet-body form">
                        <!-- BEGIN FORM-->
                        <div class="form-horizontal form-bordered">
                            <form action="#" class="form-horizontal form-bordered">
                            <div class="form-body">
                                <div class="form-group">
                                    <div class="row">
                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                            <table class="table table-striped table-bordered table-hover">
                                                <tr>
                                                    <th>
                                                        Name
                                                    </th>
                                                    <td>
                                                        <label id="lblFollowupStudentName" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th>
                                                        Email Id
                                                    </th>
                                                    <td>
                                                        <label id="lblFollowupEmail" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th>
                                                        Gender
                                                    </th>
                                                    <td>
                                                        <label id="lblFollowupGender" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th>
                                                        Mobile No.
                                                    </th>
                                                    <td>
                                                        <label id="lblFollowupMobileNo" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th>
                                                        Campaign
                                                    </th>
                                                    <td>
                                                        <label id="lblFollowupCampaign" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th>
                                                        Interacted Rel.<span class="text-danger">*</span>
                                                    </th>
                                                    <td>
                                                        <div id="divfollowupInteractedrel">
                                                            <select class="bs-select form-control" data-live-search="true" data-size="8" required="required"
                                                                id="ddlInteractedRel">
                                                                <option value="0">Select</option>
                                                            </select>
                                                        </div>
                                                        <br />
                                                        <label id="lblInteractedrel" style="color: Red;">
                                                        </label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th>
                                                        Interacted With
                                                    </th>
                                                    <td>
                                                        <input type="text" id="txtInteractedWith" class="form-control" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th>
                                                        Followup Status<span class="text-danger">*</span>
                                                    </th>
                                                    <td>
                                                        <div id="divfollowupstatus">
                                                            <select class="bs-select form-control" data-live-search="true" required="required"
                                                                id="ddlFollowupStatus">
                                                                <option value="0">Select</option>
                                                            </select>
                                                        </div>
                                                        <br />
                                                        <label id="lblFollowupstatus" style="color: Red;">
                                                        </label>
                                                    </td>
                                                </tr>
                                                <tr id="trLostFollowupReason">
                                                    <th>
                                                        Lost Followup Reason<span class="text-danger">*</span>
                                                    </th>
                                                    <td>
                                                        <div id="divLostFollowupReason">
                                                            <select class="bs-select form-control" data-live-search="true" required="required"
                                                                id="ddlLostFollowupReason">
                                                                <option value="0">Select</option>
                                                            </select>
                                                        </div>
                                                        <br />
                                                        <label id="lblLostFollowupReason" style="color: Red;">
                                                        </label>
                                                    </td>
                                                </tr>
                                                <tr id="trRemarkClosure">
                                                    <th>
                                                        Remark Closure<span class="text-danger">*</span>
                                                    </th>
                                                    <td>
                                                        <div id="divRemarkConclusion">
                                                            <select class="bs-select form-control" data-live-search="true" required="required"
                                                                id="ddlRemarkConclusion">
                                                                <option value="0">Select</option>
                                                            </select>
                                                        </div>
                                                        <br />
                                                        <label id="lblRemarkConclusion" style="color: Red;">
                                                        </label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th>
                                                        Feedback<span class="text-danger">*</span>
                                                    </th>
                                                    <td>
                                                        <input type="text" id="txtFeedBack" required="required" class="form-control" placeholder="Feedback" />
                                                        <label id="lblFeedback" style="color: Red;">
                                                        </label>
                                                    </td>
                                                </tr>
                                                <tr id="trNextFollowupDate">
                                                    <th>
                                                        Next Followup Date<span class="text-danger">*</span>
                                                    </th>
                                                    <td>
                                                        <div id="txtFollowupDate" class="input-group input-medium date date-picker" data-date="01/2016"
                                                            data-date-format="dd/mm/yyyy" data-date-viewmode="years" data-date-minviewmode="months"
                                                            data-date-start-date="+0d">
                                                            <input type="text" class="form-control" readonly="readonly" id="txtFollowupDate1"
                                                                onkeyup="SetButtonStatus()" placeholder="Next Followup Date" />
                                                            <span class="input-group-btn">
                                                                <button class="btn default" type="button" style="height: 34px;">
                                                                    <i style="font-size: 14px;" class="fa fa-calendar"></i>
                                                                </button>
                                                            </span>
                                                        </div>
                                                        <label id="lblNextFollowupdate" style="color: Red;">
                                                        </label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th>
                                                        Handled By
                                                    </th>
                                                    <td>
                                                        <label id="lblHandledBy" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="2">
                                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-center">
                                                            <input type="text" id="lblPKey3" style="display: none;" />
                                                            <a id="btnFollowupSave" class="btn red">Save</a> <a id="btnFollowupClose" class="btn grey-salsa">
                                                                Close</a>
                                                        </div>
                                                    </td>
                                                </tr>
                                            </table>
                                            <table class="table">  <%--table table-fixedheader table-hover--%>
                                                <thead id="tdFollowupData">
                                                    <tr id="trFollowupheader" style="border: ridge;">
                                                        <th style="width: 100%;">
                                                            Last Followup Details
                                                        </th>
                                                    </tr>
                                                </thead>
                                                <tbody id="TBodyFollowupData">
                                                </tbody>
                                            </table>
                                            <table class="table">
                                                <thead id="thEventFollowupData">
                                                    <tr id="trEventFollowup" style="border: ridge;">
                                                        <th style="width: 100%;">
                                                            Event Followup Details
                                                        </th>
                                                    </tr>
                                                </thead>
                                                <tbody id="TBodyEventFollowupData">
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            </form>
                            <!-- END FORM-->
                        </div>
                        <!-- END FORM-->
                    </div>
                </div>
            </div>
            <div id="divConvertAll" style="width: 100%; display: none;">
                <div class="portlet box blue-steel">
                    <div class="portlet-title">
                        <div class="caption">
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                <label id="lblConvertHeader" />
                            </div>
                        </div>
                    </div>
                    <div class="portlet-body form">
                        <!-- BEGIN FORM-->
                        <div class="form-horizontal form-bordered">
                            <form action="#" class="form-horizontal form-bordered">
                            <div class="form-body">
                                <div class="form-group">
                                    <div class="row">
                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                            <table class="table table-striped table-bordered table-hover">
                                                <tr>
                                                    <th>
                                                        <label id="lblConvertDetail" style="font-weight: bold" />
                                                    </th>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-center">
                                                            <input type="text" id="lblCampaign_Contact_Code" style="display: none;" />
                                                            <input type="text" id="lblLead_Code" style="display: none;" />
                                                            <input type="text" id="lblOpportunity_Code" style="display: none;" />
                                                            <input type="text" id="lblAccount_Id" style="display: none;" />
                                                            <a id="btnConvertYes" class="btn red">Yes</a> <a id="btnConvertNo" class="btn grey-salsa">
                                                                No</a>
                                                        </div>
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            </form>
                            <!-- END FORM-->
                        </div>
                    </div>
                </div>
            </div>
            <div id="form_modal11" class="modal fade" role="dialog" aria-labelledby="myModalLabel10"
                aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                            </button>
                            <h4 class="modal-title">
                              <b>View More Contact Detail</b></h4>
                        </div>
                        <div class="modal-body" style="height: auto; overflow-y: scroll;">
                            <form action="#" class="form-horizontal" role="form">
                            <div class="form-group">
                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                    <table class="col-lg-12 col-md-12 col-sm-12 col-xs-12">                                        
                                        <tr>
                                            <td>
                                                    <label id="Label2">Student Name</label>
                                            </td>
                                            <td>
                                                <label id="lblStudentName1" style="font-weight: bold;"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                    <label id="Label8">Enrollment No./UID</label>
                                            </td>
                                            <td>
                                                <label id="lblStudentEnrollmentNoUID1" style="font-weight: bold;"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                    <label id="Label9">Board Name</label>
                                            </td>
                                            <td>
                                                <label id="lblBoardName1" style="font-weight: bold;"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                    <label id="Label10">Inhouse/ Outsider</label>
                                            </td>
                                            <td>
                                                <label id="lblInHouseOutsider1" style="font-weight: bold;"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                    <label id="Label11">Student Handphone 1</label>
                                            </td>
                                            <td>
                                                <label id="lblStudentHandphone1" style="font-weight: bold;"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <label id="Label5">Student Handphone 2</label>
                                            </td>
                                            <td>
                                                <label id="lblStudentHandphone2" style="font-weight: bold;"/>
                                                
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <label id="Label1">Father Name</label>
                                            </td>
                                            <td>
                                                <label id="lblFatherName1" style="font-weight: bold;"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <label id="Label6">Father Handphone 1</label>
                                            </td>
                                            <td>
                                                <label id="lblFatherHandphone1" style="font-weight: bold;"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <label id="Label7">Father Handphone 2</label>
                                            </td>
                                            <td>
                                                <label id="lblFatherHandphone2" style="font-weight: bold;"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <label id="Label3">
                                                    RCO Marks</label>
                                            </td>
                                            <td>
                                                <label id="lblRCOMarks1" style="font-weight: bold;"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <label id="Label123">
                                                    Rank</label>
                                            </td>
                                            <td>
                                                <label id="lblRank1" style="font-weight: bold;"/>
                                            </td>
                                        </tr>                                        
                                        <tr>
                                            <td>
                                                <label id="Label4">Next Followup Date</label>
                                            </td>
                                            <td>
                                                <label id="lblNextFollowupDate1" style="font-weight: bold;"/>
                                            </td>
                                        </tr>                                        
                                        <tr>
                                            <td>
                                                <label id="Label12">Current Status</label>
                                               
                                            </td>
                                            <td>
                                                <label id="lblCurrentStatus1" style="font-weight: bold; color: Red;"/>
                                                <asp:Label ID="lblcontact_ID"/>
                                                <asp:Label ID="lblCapmingID"/>
                                            </td>
                                        </tr>  
                                    </table>
                                </div>
                            </div>
                            </form>
                        </div>
                        <div class="modal-footer">
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                <a class="btn grey-salsa pull-right" data-dismiss="modal" style="width: 62px; margin-left: 5px;"
                                    aria-hidden="true">Close</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    </label>
    </label>
    
</asp:Content>
