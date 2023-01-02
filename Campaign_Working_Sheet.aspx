<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Campaign_Working_Sheet.aspx.cs"
    Inherits="Campaign_Working_Sheet" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta name="viewport" content="initial-scale=1, maximum-scale=1, minimum-scale=1, user-scalable=no">
    <!-- BEGIN GLOBAL MANDATORY STYLES -->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700&subset=all"
        rel="stylesheet" type="text/css" />
    <link href="assets/plugins/font-awesome/css/font-awesome.min.css?v=<%=Version%>"
        rel="stylesheet" type="text/css" />
    <link href="assets/plugins/bootstrap/css/bootstrap.min.css?v=<%=Version%>" rel="stylesheet"
        type="text/css" />
    <link href="assets/plugins/uniform/css/uniform.default.css?v=<%=Version%>" rel="stylesheet"
        type="text/css" />
    <!-- END GLOBAL MANDATORY STYLES -->
    <!-- BEGIN THEME STYLES -->
    <link rel="stylesheet" type="text/css" href="APPJS/SIPExternal.css?v=<%=Version%>" />
    <link href="assets/css/style-m.css?v=<%=Version%>" rel="stylesheet" type="text/css" />
    <link href="assets/css/style.css?v=<%=Version%>" rel="stylesheet" type="text/css" />
    <link href="assets/css/components.css?v=<%=Version%>" id="style_components" rel="stylesheet"
        type="text/css" />
    <link href="assets/css/style-responsive.css?v=<%=Version%>" rel="stylesheet" type="text/css" />
    <link href="assets/css/plugins.css?v=<%=Version%>" rel="stylesheet" type="text/css" />
    <link href="assets/css/themes/default.css?v=<%=Version%>" rel="stylesheet" type="text/css"
        id="style_color" />
    <link href="assets/css/custom.css?v=<%=Version%>" rel="stylesheet" type="text/css" />
    <link href="assets/css/icon.css?v=<%=Version%>" rel="stylesheet" type="text/css" />
    <link href="assets/css/customized.css?v=<%=Version%>" rel="stylesheet" type="text/css" />
    <link href="assets/css/slick.css?v=<%=Version%>" rel="stylesheet" type="text/css" />
    <link href="assets/css/slick-theme.css?v=<%=Version%>" rel="stylesheet" type="text/css" />
    <link href="assets/css/scroll/scrolltabs.css?v=<%=Version%>" type="text/css" rel="stylesheet" />
    <link href="assets/plugins/bootstrap/css/bootstrap.min.css?v=<%=Version%>" rel="stylesheet"
        type="text/css" />
    <!-- END THEME STYLES -->
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.16/css/jquery.dataTables.min.css" />
    <link rel="stylesheet" type="text/css" href="assets/Multiselect/select2.css" />
    <link href="assets/css/button.datatables.min.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" type="text/css" href="SIPassets/global/plugins/bootstrap-select/css/bootstrap-select.min.css?v=<%=Version%>" />
    <link rel="stylesheet" type="text/css" href="AppJS/CRMExternal.css?v=<%=Version%>" />
    <link rel="stylesheet" href="assets/css/jquery.gritter.css" />
    <script type="text/javascript" src="CustomJS/waitingfor.js?v=<%=Version%>"></script>
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="CallingSystem/jssip.js" type="text/javascript"></script>
    <script src="CallingSystem/sipfunction.js" type="text/javascript"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/buttons/1.5.1/js/dataTables.buttons.min.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/buttons/1.5.1/js/buttons.colVis.min.js"></script>
    <script src="SIPassets/global/plugins/bootstrap/js/bootstrap.min.js?v=<%=Version%>"
        type="text/javascript"></script>
    <script type="text/javascript" src="assets/Multiselect/select2.js"></script>
    <script type="text/javascript" src="assets/js/jquery.gritter.min.js"></script>
    <script src="CustomJS/JsCampaign_WS.js?v=<%=Version%>" type="text/javascript"></script>
    <script type="text/javascript" src="SIPassets/pages/scripts/components-bootstrap-select.min.js?v=<%=Version%>"></script>
    <script type="text/javascript" src="SIPassets/global/plugins/bootstrap-select/js/bootstrap-select.min.js?v=<%=Version%>"></script>
    <script type="text/javascript" src="SIPassets/global/plugins/bootstrap-toastr/toastr.min.js?v=<%=Version%>"></script>
    <link href="SIPassets/global/plugins/bootstrap-toastr/toastr.min.css" rel="stylesheet"
        type="text/css" />
    <script src="SIPassets/global/plugins/bootstrap-toastr/toastr.min.js" type="text/javascript"></script>
    <link href="SIPassets/global/plugins/bootstrap-sweetalert/sweetalert.css" rel="stylesheet"
        type="text/css" />
    <script type="text/javascript" src="SIPassets/global/plugins/bootstrap-sweetalert/sweetalert.min.js"></script>
    <script type="text/javascript" src="SIPassets/pages/scripts/ui-sweetalert.min.js"></script>
    <script src="SIPassets/global/plugins/bootstrap-datepicker/js/bootstrap-datepicker.min.js?v=<%=Version%>"
        type="text/javascript"></script>
    <link href="https://code.jquery.com/ui/1.9.1/themes/base/jquery-ui.css" rel="stylesheet">
    <script type="text/javascript" src="https://code.jquery.com/ui/1.9.1/jquery-ui.js"></script>
    <link rel="shortcut icon" href="favicon.ico" />
    <script type="text/javascript">
        function ReadConfigSettings() {
            var conn = '<%= System.Configuration.ConfigurationManager.AppSettings["Version"].ToString() %>';
            document.getElementById("lblCampaignDetailcode").value = conn;
        }
    </script>
    <style type="text/css">
        tfoot input
        {
            width: 100%;
            padding: 3px;
            box-sizing: border-box;
        }
        
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
        /* unvisited link */
        a:link
        {
            color: green;
        }
        
        .dt-button.active
        {
            color: green;
            background-color: Red;
        }
        
        .dt-button
        {
            color: red;
        }
        
        .selectRow
        {
            display: block;
            padding: 20px;
        }
        .select2-container
        {
            width: 90%;
        }
    </style>
</head>
<body class="page-header-fixed page-sidebar-closed">
    <form id="form1" runat="server">
    <!-- START HEADER -->
    <div class="header navbar navbar-fixed-top">
        <!-- BEGIN TOP NAVIGATION BAR -->
        <div class="header-inner">
            <div class="sidebar-toggler hidden-phone">
                <span class="icon-menu"></span>
            </div>
            <!-- BEGIN RESPONSIVE MENU TOGGLER -->
            <a href="javascript:;" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="icon-menu"></span></a>
            <!-- END RESPONSIVE MENU TOGGLER -->
            <!-- BEGIN LOGO -->
            <%-- <a class="form-horizontal form-bordered" href="#" >--%>
            <div class="crmHeader">
                <strong>C.R.M.S</strong> <span class="title pull-right" style="padding-right: 23px;">
                    <b>Hi,</b>
                    <asp:Label ID="lblUserName" runat="server" Text="Label" Font-Bold="True"></asp:Label><br />
                    <span></span></span>
            </div>
            <%--</a>--%>
        </div>
        <!-- END TOP NAVIGATION BAR -->
    </div>
    <!-- END HEADER -->
    <div class="page-container">
        <div class="page-sidebar-wrapper">
            <div class="page-sidebar navbar-collapse collapse">
                <!-- BEGIN SIDEBAR MENU -->
                <ul class="page-sidebar-menu" data-auto-scroll="true" data-slide-speed="200">
                    <li class="start"><a href="#"></li>
                    <li id="HomePage"><a id="aHome"><i id="iconHome" class="fa fa-home" style="font-size: x-large;">
                    </i><span id="Home" class="title">Home</span></a> </li>
                    <li id="EnterContact"><a id="acontact"><i id="iconContact" class="fa fa-pencil-square-o"
                        style="font-size: x-large;"></i><span id="contact" class="title">Contact </span>
                    </a></li>
                    <li id="Campaign"><a id="acampaign"><i id="iconCampaign" class="icon-filter"></i><span
                        id="campaign" class="title">Campaign </span></a></li>
                    <li id="logout">
                        <%--<a href="Login.aspx" onclick="pageLogout(this); "><span class="btn pink">Logout </span>--%>
                        <a id="alogout"><span class="btn pink" id="btnpink">Logout </span></a></li>
                </ul>
                <!-- END SIDEBAR MENU -->
            </div>
        </div>
        <input type="hidden" id="Type" />
        <div class="page-content-wrapper">
            <div class="page-content">
                <!-- BEGIN SAMPLE TABLE PORTLET-->
                <div class="alert alert-danger" id="divsipunregistered" runat="server" style="display: none">
                    <button class="close" data-close="alert">
                    </button>
                    <strong>
                        <asp:Label ID="lblsipunregistered" runat="server" Text="Check Connection. Call Cannot be made Now"></asp:Label></strong>
                </div>
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
                                    Campaign Working Sheet</div>
                            </div>
                        </div>
                        <div class="portlet-body form">
                            <div id="div2">
                                <!-- BEGIN FORM-->
                                <form action="#" class="form-horizontal form-bordered">
                                <div class="form-body" style="height: 600px; overflow-y: scroll;">
                                    <div class="form-group">
                                        <div class="row">
                                            <div class="portlet-body form">
                                                <div id="divCamapignDetail1">
                                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                        <div style="display: flex;">
                                                            <select id="ddlcampaignmultiple" multiple style="padding-left: 10px" data-placeholder="Select Campaign/s">
                                                                <option value="0">Select</option>
                                                            </select>&nbsp; <a id="btngetmorecampaign" class="btn red">Get</a>
                                                            <input type="text" id="lblCampaignDetailcode" style="display: none;" />
                                                        </div>
                                                        <div style="overflow: auto;">
                                                            <video id="remoteView" autoplay="" poster="" src="" hidden="hidden">
                                                            </video>
                                                            <br />
                                                            <table id="example" class="display table table-striped table-bordered table-hover nowrap"
                                                                cellspacing="0" width="100%">
                                                                <thead>
                                                                    <tr>
                                                                        <th>
                                                                            Campaign Id
                                                                        </th>
                                                                        <th>
                                                                            Contact ID
                                                                        </th>
                                                                        <th>
                                                                            Campaign Name
                                                                        </th>
                                                                        <th>
                                                                            Name
                                                                        </th>
                                                                        <th>
                                                                            Institution
                                                                        </th>
                                                                        <th>
                                                                            RCO Score
                                                                        </th>
                                                                        <th>
                                                                            Followup Remark
                                                                        </th>
                                                                        <th>
                                                                            Contact Status
                                                                        </th>
                                                                        <th>
                                                                            Interacted On
                                                                        </th>
                                                                        <th>
                                                                            Interacted By
                                                                        </th>
                                                                        <th>
                                                                            Event 1
                                                                        </th>
                                                                        <th>
                                                                            Attendance 1
                                                                        </th>
                                                                        <th>
                                                                            Feedback 1
                                                                        </th>
                                                                        <th>
                                                                            Event 2
                                                                        </th>
                                                                        <th>
                                                                            Attendance 2
                                                                        </th>
                                                                        <th>
                                                                            Feedback 2
                                                                        </th>
                                                                        <th>
                                                                            Event 3
                                                                        </th>
                                                                        <th>
                                                                            Attendance 3
                                                                        </th>
                                                                        <th>
                                                                            Feedback 3
                                                                        </th>
                                                                        <th>
                                                                            Event 4
                                                                        </th>
                                                                        <th>
                                                                            Attendance 4
                                                                        </th>
                                                                        <th>
                                                                            Feedback 4
                                                                        </th>
                                                                    </tr>
                                                                </thead>
                                                            </table>
                                                        </div>
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
                                <div class="panel-group accordion" id="accordion1">
                                    <div class="panel panel-default">
                                        <div class="panel-heading">
                                            <h4 class="panel-title" style="background-color: red;">
                                                <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion1" href="#collapse_1">
                                                    <img src="Images/Search.png" alt="Search" width="30px" /><b>Advance Search</b>
                                                </a>
                                            </h4>
                                        </div>
                                        <div id="collapse_1" class="panel-collapse collapse">
                                            <table class="table table-striped table-bordered table-hover">
                                                <%--table table-striped table-bordered table-advance table-hover--%>
                                                <tr>
                                                    <td>
                                                        <b>Student Name</b>
                                                    </td>
                                                    <td>
                                                        <input type="text" class="form-control" id="txtCampStudentName" onkeypress="return onlyAlphabets(event);"
                                                            placeholder="Student Name" onkeydown="if (event.keyCode == 13){document.getElementById('btnCampaignSearch').click(); return false;}" />
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
                                                            placeholder="Enroll No./ UID" onkeydown="if (event.keyCode == 13){document.getElementById('btnCampaignSearch').click(); return false;}" />
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
                                <div id="divCampaignData">
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
                                                        <td colspan="2">
                                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-center">
                                                                <input type="text" id="lblPKey3" style="display: none;" />
                                                                <a id="btnFollowupSave" class="btn red">Save</a> <a id="btnFollowupClose" class="btn grey-salsa">
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
                                                    <label id="Label2">
                                                        Student Name</label>
                                                </td>
                                                <td>
                                                    <label id="lblStudentName1" style="font-weight: bold;" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <label id="Label8">
                                                        Enrollment No./UID</label>
                                                </td>
                                                <td>
                                                    <label id="lblStudentEnrollmentNoUID1" style="font-weight: bold;" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <label id="Label9">
                                                        Board Name</label>
                                                </td>
                                                <td>
                                                    <label id="lblBoardName1" style="font-weight: bold;" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <label id="Label10">
                                                        Inhouse/ Outsider</label>
                                                </td>
                                                <td>
                                                    <label id="lblInHouseOutsider1" style="font-weight: bold;" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <label id="Label11">
                                                        Student Handphone 1</label>
                                                </td>
                                                <td>
                                                    <label id="lblStudentHandphone1" style="font-weight: bold;" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <label id="Label5">
                                                        Student Handphone 2</label>
                                                </td>
                                                <td>
                                                    <label id="lblStudentHandphone2" style="font-weight: bold;" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <label id="Label1">
                                                        Father Name</label>
                                                </td>
                                                <td>
                                                    <label id="lblFatherName1" style="font-weight: bold;" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <label id="Label6">
                                                        Father Handphone 1</label>
                                                </td>
                                                <td>
                                                    <label id="lblFatherHandphone1" style="font-weight: bold;" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <label id="Label7">
                                                        Father Handphone 2</label>
                                                </td>
                                                <td>
                                                    <label id="lblFatherHandphone2" style="font-weight: bold;" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <label id="Label3">
                                                        RCO Marks</label>
                                                </td>
                                                <td>
                                                    <label id="lblRCOMarks1" style="font-weight: bold;" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <label id="Label123">
                                                        Rank</label>
                                                </td>
                                                <td>
                                                    <label id="lblRank1" style="font-weight: bold;" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <label id="Label4">
                                                        Next Followup Date</label>
                                                </td>
                                                <td>
                                                    <label id="lblNextFollowupDate1" style="font-weight: bold;" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <label id="Label12">
                                                        Current Status</label>
                                                </td>
                                                <td>
                                                    <label id="lblCurrentStatus1" style="font-weight: bold; color: Red;" />
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
                <div class="modal fade" id="DescModal" role="dialog">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                    �</button>
                                <h3 class="modal-title">
                                    <label id="lblstudentName" class="modal-title" />
                                </h3>
                            </div>
                            <div class="modal-body">
                                <table id="Table1" class="display table table-striped table-bordered table-hover nowrap"
                                    cellspacing="0" width="100%">
                                    <thead>
                                        <tr>
                                            <th>
                                                On
                                            </th>
                                            <th>
                                                Number
                                            </th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>
                                                <h5 class="text-left">
                                                    Handphone 1</h5>
                                            </td>
                                            <td>
                                                <input type="text" id="txtCallingNumbershandphone1" disabled="disabled" />
                                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" style="padding:0px;">
                                                    <div class="col-lg-3 col-md-3 col-sm-4 col-xs-6" style="padding:10px;">
                                                        <button id="callStartBtn" type="button" class="btn btn-primary small">
                                                            Call</button>
                                                    </div>
                                                    <div class="col-lg-3 col-md-3 col-sm-4 col-xs-6" style="padding:10px;">
                                                        <button id="callEndBtn" type="button" onclick="callEnd();return false" style="display: none"
                                                            class="btn btn-danger small">
                                                            End</button>
                                                    </div>
                                                    <div class="col-lg-3 col-md-3 col-sm-4 col-xs-6" style="padding:10px;">
                                                        <button id="callhold" type="button" onclick="holdCall();return false" style="display: none"
                                                            class="btn btn-info small">
                                                            Hold</button>
                                                    </div>
                                                    <div class="col-lg-3 col-md-3 col-sm-4 col-xs-6" style="padding:10px;">
                                                        <button id="callunhold" type="button" onclick="unholdCall();return false" style="display: none"
                                                            class="btn btn-info small">
                                                            Un Hold</button>
                                                    </div>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <h5 class="text-left">
                                                    Handphone 2</h5>
                                            </td>
                                            <td>
                                                <input type="text" id="txtCallingNumbershandphone2" disabled="disabled" />
                                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" style="padding:0px;">
                                                    <div class="col-lg-3 col-md-3 col-sm-4 col-xs-6" style="padding:10px;">
                                                        <button id="callStartBtn1" type="button" class="btn btn-primary">
                                                            Call</button>
                                                    </div>
                                                    <div class="col-lg-3 col-md-3 col-sm-4 col-xs-6" style="padding:10px;">
                                                        <button id="callEndBtn1" type="button" onclick="callEnd();return false" style="display: none"
                                                            class="btn btn-danger small">
                                                            End</button>
                                                    </div>
                                                    <div class="col-lg-3 col-md-3 col-sm-4 col-xs-6" style="padding:10px;">
                                                        <button id="callhold1" type="button" onclick="holdCall();return false" style="display: none"
                                                            class="btn btn-info small">
                                                            Hold</button>
                                                    </div>
                                                    <div class="col-lg-3 col-md-3 col-sm-4 col-xs-6" style="padding:10px;">
                                                        <button id="callunhold1" type="button" onclick="unholdCall();return false" style="display: none"
                                                            class="btn btn-info small">
                                                            Un Hold</button>
                                                    </div>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <h5 class="text-left">
                                                    Landline</h5>
                                            </td>
                                            <td>
                                                <input type="text" id="txtCallingNumberlandline" disabled="disabled" />
                                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" style="padding:0px;">
                                                    <div class="col-lg-3 col-md-3 col-sm-4 col-xs-6" style="padding:10px;">
                                                        <button id="callStartBtn2" type="button" class="btn btn-primary">
                                                            Call</button>
                                                    </div>
                                                    <div class="col-lg-3 col-md-3 col-sm-4 col-xs-6" style="padding:10px;">
                                                        <button id="callEndBtn2" type="button" onclick="callEnd();return false" style="display: none"
                                                            class="btn btn-danger small">
                                                            End</button>
                                                    </div>
                                                    <div class="col-lg-3 col-md-3 col-sm-4 col-xs-6" style="padding:10px;">
                                                        <button id="callhold2" type="button" onclick="holdCall();return false" style="display: none"
                                                            class="btn btn-info small">
                                                            Hold</button>
                                                    </div>
                                                    <div class="col-lg-3 col-md-3 col-sm-4 col-xs-6" style="padding:10px;">
                                                        <button id="callunhold2" type="button" onclick="unholdCall();return false" style="display: none"
                                                            class="btn btn-info small">
                                                            Un Hold</button>
                                                    </div>
                                                </div>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                                <input type="text" style="display: none" id="txtcallingflag" />
                                <input type="text" style="display: none" id="txtagentid" />
                                <input type="text" style="display: none" id="txtuserid" />
                                <input type="text" style="display: none" id="txtconid" />
                                <input type="text" style="display: none" id="txtagentname" />
                                <input type="text" style="display: none" id="txtcampaignid" />
                                <input type="text" style="display: none" id="txtcampaignname" />
                                <input type="text" style="display: none" id="txtrecordno" />
                                <input type="text" runat="server" style="display: none" id="customerPhone" />
                                <input type="text" runat="server" style="display: none" id="customerId" />
                                <input type="text" runat="server" style="display: none" id="leadsetId" />
                                <input type="text" runat="server" style="display: none" id="leadsetName" />
                                <input type="text" runat="server" style="display: none" id="campaignId" />
                                <input type="text" runat="server" style="display: none" id="campaignName" />
                                <input type="text" runat="server" style="display: none" id="processId" />
                                <input type="text" runat="server" style="display: none" id="processName" />
                                <input type="text" runat="server" style="display: none" id="agentId" />
                                <input type="text" runat="server" style="display: none" id="crUd" />
                                <input type="text" runat="server" style="display: none" id="rfUd" />
                                <input type="text" runat="server" style="display: none" id="rfud1" />
                                <input type="text" runat="server" style="display: none" id="legType" />
                                <input type="text" runat="server" style="display: none" id="snUd" />
                                <input type="text" runat="server" style="display: none" id="otUd" />
                                <input type="text" runat="server" style="display: none" id="atEn" />
                                <input type="text" runat="server" style="display: none" id="txSt" />
                                <input type="text" runat="server" style="display: none" id="moc" />
                                <input type="text" runat="server" style="display: none" id="callstarttime" />
                                <input type="text" runat="server" style="display: none" id="callendtime" />
                            </div>
                            <div class="modal-footer" style="display: flex;">
                            
                                <button type="button" class="btn btn-default " id="btnpreviousfollowup">
                                   Previous Flwups</button>
                                <button type="button" class="btn btn-default " id="btncalldispose">
                                    DisposeCall</button>
                                <button type="button" class="btn btn-primary" data-dismiss="modal">
                                    Close</button>
                            </div>
                        </div>
                        <!-- /.modal-content -->
                    </div>
                    <!-- /.modal-dialog -->
                </div>
                <!-- /.modal -->
                <div class="modal fade" id="followupModal" role="dialog">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                    �</button>
                                <h3 class="modal-title">
                                    Follow Up Details
                                </h3>
                            </div>
                            <div class="modal-body">
                                <table id="Table2" class="display table table-striped table-bordered table-hover nowrap"
                                    cellspacing="0" width="100%">
                                    <tbody>
                                        <tr>
                                            <td>
                                                Interacted Rel.<span class="text-danger">*</span>
                                            </td>
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
                                            <td>
                                                Interacted With
                                            </td>
                                            <td>
                                                <input type="text" id="txtInteractedWith" class="form-control" style="width: 100%" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                Followup Status<span class="text-danger">*</span>
                                            </td>
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
                                            <td>
                                                Lost Followup Reason<span class="text-danger">*</span>
                                            </td>
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
                                            <td>
                                                Remark Closure<span class="text-danger">*</span>
                                            </td>
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
                                            <td>
                                                Feedback<span class="text-danger">*</span>
                                            </td>
                                            <td>
                                                <input type="text" id="txtFeedBack" required="required" class="form-control" placeholder="Feedback"
                                                    style="width: 100%" />
                                                <label id="lblFeedback" style="color: Red;">
                                                </label>
                                            </td>
                                        </tr>
                                        <tr id="trNextFollowupDate">
                                            <td>
                                                Next Followup Date<span class="text-danger">*</span>
                                            </td>
                                            <td>
                                                <input type="text" id="txtFollowupDate1" class="form-control date-picker" style="width: 100%" />
                                                <label id="lblNextFollowupdate" style="color: Red;">
                                                </label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                Handled By
                                            </td>
                                            <td>
                                                <label id="lblHandledBy" />
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default " id="btnsavefollowup">
                                    Save</button>
                                <button type="button" class="btn btn-primary" data-dismiss="modal">
                                    Close</button>
                            </div>
                        </div>
                        <!-- /.modal-content -->
                    </div>
                    <!-- /.modal-dialog -->
                </div>
                <!-- /.modal -->
                <div class="modal fade" id="previousfollowup" role="dialog">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                    �</button>
                                <h3 class="modal-title">
                                    Previous Followup
                                </h3>
                            </div>
                            <div class="modal-body">
                                <table class="table">
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
                            <div class="modal-footer">
                                <button type="button" class="btn btn-primary" data-dismiss="modal">
                                    Close</button>
                            </div>
                        </div>
                        <!-- /.modal-content -->
                    </div>
                    <!-- /.modal-dialog -->
                </div>
            </div>
        </div>
    </div>
    <div class="footer">
        <div class="footer-inner">
        </div>
        <div class="footer-tools">
            <a href="#" id="back-to-top" title="Back to top" class="go-top"><i class="icon-uparrow">
            </i></a>
        </div>
    </div>
    <script type="text/javascript">
        if ($('#back-to-top').length) {
            var scrollTrigger = 100, // px
        backToTop = function () {
            var scrollTop = $(window).scrollTop();
            if (scrollTop > scrollTrigger) {
                $('#back-to-top').addClass('show');
            } else {
                $('#back-to-top').removeClass('show');
            }
        };
            backToTop();
            $(window).on('scroll', function () {
                backToTop();
            });
            $('#back-to-top').on('click', function (e) {
                e.preventDefault();
                $('html,body').animate({
                    scrollTop: 0
                }, 700);
            });
        }
    </script>
    </form>
</body>
</html>
