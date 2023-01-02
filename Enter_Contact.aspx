<%@ Page Title="" Language="C#" MasterPageFile="~/OE_CRM.master" AutoEventWireup="true"
    CodeFile="Enter_Contact.aspx.cs" Inherits="Enter_Contact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link rel="stylesheet" type="text/css" href="SIPassets/global/plugins/bootstrap-select/css/bootstrap-select.min.css?v=<%=Version%>" />
    <script type="text/javascript" src="CustomJS/EnterContact.js?v=<%=Version%>"></script>
    <script type="text/javascript" src="SIPassets/global/plugins/bootstrap-select/js/bootstrap-select.min.js?v=<%=Version%>"></script>
    <script type="text/javascript" src="SIPassets/pages/scripts/components-bootstrap-select.min.js?v=<%=Version%>"></script>
    <script src="SIPassets/global/plugins/bootstrap-toastr/toastr.min.js?v=<%=Version%>" type="text/javascript"></script>
    <style type="text/css">
        .errorClass
        {
            border: 1px solid red !important;
        }
        
        .sucessClass
        {
            border-color: green !important;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <input type="hidden" id="Type" />
    <div class="page-content-wrapper">
        <div class="page-content">
            <!-- BEGIN SAMPLE TABLE PORTLET-->
            <%--<div class="alert-success alert-link" id="Msg_Success">
                <p>
                    <strong><i class="icon-ok"></i></strong>
                    <label id="lblSuccess" class="alert-link" style="color: Green" font-bold="true">
                    </label>
                </p>
            </div>--%>
            <%--<div class="alert-danger alert-link" id="Msg_Error">
                <p>
                    <strong><i class="icon-remove"></i></strong>
                    <label id="lblerror" class="alert-link" style="color: White" font-bold="true">
                    </label>
                </p>
            </div>--%>
            <div id="divEnterContactSearch">
                <!-- BEGIN PORTLET-->
                <div class="portlet box blue-steel">
                    <div class="portlet-title">
                        <div class="caption">
                            <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">
                                <span id="btnEnterContactHome"><i style="font-size: 24px; cursor: pointer;" data-toggle="tooltip"
                                    data-placement="bottom" title="Back" class="fa fa-arrow-left"></i></span>
                            </div>
                            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                                Contact</div>
                        </div>
                        <div class="actions">
                            <span id="btnAdd"><i style="font-size: 24px; cursor: pointer;" data-toggle="tooltip"
                                data-placement="bottom" title="Add" class="fa fa-plus"></i></span>
                        </div>
                    </div>
                    <div class="portlet-body form">
                        <div id="divEnterContactSearch1">
                            <!-- BEGIN FORM-->
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
                                                        <input type="text" class="form-control" required="required" placeholder="Name" id="txtUserName"
                                                            onkeypress="return onlyAlphabets(event);" onkeydown="if (event.keyCode == 13){document.getElementById('btnEnterContactSearch').click(); return false;}" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th>
                                                        Mobile No.
                                                    </th>
                                                    <td>
                                                        <input type="text" class="form-control" required="required" placeholder="Mobile No"
                                                            id="txtMobileNo" onkeypress="return  NumberOnly(event);" onkeydown="if (event.keyCode == 13){document.getElementById('btnEnterContactSearch').click(); return false;}"/>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="2">
                                                        <div class="col-lg-7 col-md-6 col-sm-4 col-xs-12" style="text-align: center;">
                                                            <a id="btnEnterContactSearch" class="btn red">Search</a>
                                                        </div>
                                                    </td>
                                                </tr>
                                            </table>
                                            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                                            </div>
                                        </div>
                                        <br />
                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        </div>
                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        </div>
                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        </div>
                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        </div>
                                        <div class="portlet-body form">
                                            <div id="divSearchedData">
                                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                    <table class="table table-fixedheader table-hover">
                                                        <thead>
                                                            <tr style="border: ridge;">
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
                                                        </thead>
                                                        <tbody id="TEnterContact">
                                                        </tbody>
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
            <div id="divAddEnterContact">
                <!-- BEGIN PORTLET-->
                <div class="portlet box blue-steel">
                    <div class="portlet-title">
                        <div class="caption">
                            <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">
                                <span id="btnEnterContactHome2"><i style="font-size: 24px; cursor: pointer;" data-toggle="tooltip"
                                    data-placement="bottom" title="Back" class="fa fa-arrow-left"></i></span>
                            </div>
                            <div id="divheader" class="col-lg-10 col-md-10 col-sm-10 col-xs-10">
                            </div>
                        </div>
                    </div>
                    <div class="portlet-body form">
                        <div id="divAddEnterContact1">
                            <!-- BEGIN FORM-->
                            <form class="form-horizontal form-validate-jquery" action="#" id="frmContact">
                            <div class="form-body">
                                <%-- <div class="form-group">--%>
                                <div class="row">
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        <table class="table table-bordered table-striped table-hover">
                                            <tr>
                                                <th>
                                                    Contact Source<span class="text-danger">*</span>
                                                </th>
                                                <td>
                                                       <div id="divContactSource">
                                                    <select class="bs-select form-control" data-live-search="true" data-size="8" required="required"
                                                        id="ddlContactSource">
                                                        <option value="0">Select</option>
                                                    </select>
                                                    </div>
                                                     <br />
                                                    <label id="lblcontactSource" style="color: Red; display: block;">
                                                    </label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th>
                                                    First Name<span class="text-danger">*</span>
                                                </th>
                                                <td>
                                                    <input type="text" class="form-control" required="required" id="txtFirstname" placeholder="First Name"
                                                        onkeypress="return onlyAlphabets(event);" />
                                                    <label id="lblFirstname" style="color: Red; display: block;">
                                                    </label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th>
                                                    Middle Name<span class="text-danger">*</span>
                                                </th>
                                                <td>
                                                    <input type="text" class="form-control" required="required" placeholder="Middle Name"
                                                        id="txtMiddleName" onkeypress="return onlyAlphabets(event);" />
                                                    <label id="lblMiddleName" style="color: Red; display: block;">
                                                    </label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th>
                                                    Last Name <span class="text-danger">*</span>
                                                </th>
                                                <td>
                                                    <input type="text" class="form-control" required="required" id="txtLastName" placeholder="Last Name"
                                                        onkeypress="return onlyAlphabets(event);" />
                                                    <label id="lblLastName" style="color: Red;">
                                                    </label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th>
                                                    Gender <span class="text-danger">*</span>
                                                </th>
                                                <td>
                                                      <div id="divGender">
                                                    <select class="bs-select form-control" data-live-search="true" required="required"
                                                        id="ddlGender">
                                                        <option value="Select">Select</option>
                                                        <option value="Male">Male</option>
                                                        <option value="Female">Female</option>
                                                    </select>
                                                    </div>
                                                    <br />
                                                    <label id="lblGender" style="color: Red;">
                                                    </label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th>
                                                    DOB <span class="text-danger">*</span>
                                                </th>
                                                <td>
                                                    <div id="txtDOB" class="input-group input-medium date date-picker" data-date="01/2016"
                                                        data-date-format="dd/mm/yyyy" data-date-viewmode="years" data-date-minviewmode="months"
                                                        data-date-end-date="+0d">
                                                        <span class="input-group-btn">
                                                            <button class="btn default" type="button" style="height: 34px;">
                                                                <i style="font-size: 14px;" class="fa fa-calendar"></i>
                                                            </button>
                                                        </span>
                                                        <input type="text" class="form-control" readonly="readonly" id="txtMonthYear" onkeyup="SetButtonStatus()"
                                                            class="form-control" required="required" placeholder="Date of Birth" />
                                                    </div>
                                                    <label id="lblDOB" style="color: Red;">
                                                    </label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th>
                                                    Email Id <span class="text-danger">*</span>
                                                </th>
                                                <td>
                                                    <input type="text" class="form-control" required="required" placeholder="Email Id"
                                                        id="txtEmailId" />
                                                    <label id="lblEmail" style="color: Red;">
                                                    </label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th>
                                                    Mobile No. <span class="text-danger">*</span>
                                                </th>
                                                <td>
                                                    <input type="text" class="form-control" required="required" placeholder="Mobile No"
                                                        id="txtHandPhone1" onkeypress="return  NumberOnly(event); " />
                                                    <label id="lblhandphone" style="color: Red;">
                                                    </label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th>
                                                    Address1
                                                </th>
                                                <td>
                                                    <input type="text" class="form-control" required="required" placeholder="Address1"
                                                        id="txtAddress1" />
                                                    <label id="lblAddress1" style="color: Red;">
                                                    </label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th>
                                                    Address2
                                                </th>
                                                <td>
                                                    <input type="text" class="form-control" required="required" placeholder="Address2"
                                                        id="txtAddress2" />
                                                    <label id="lblAddress2" style="color: Red;">
                                                    </label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th>
                                                    Street
                                                </th>
                                                <td>
                                                    <input type="text" class="form-control" required="required" placeholder="Street"
                                                        id="txtStreet" />
                                                    <label id="lblStreet" style="color: Red;">
                                                    </label>
                                                </td>
                                            </tr>
                                        </table>
                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-center">
                                            <input type="text" id="lblPKey" />
                                            <input type="text" id="lblconId" />
                                            <a id="btnSave" class="btn red" type="submit">Save</a>
                                        </div>
                                    </div>
                                </div>
                                <%--</div>--%>
                            </div>
                            </form>
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
                                Assign To campaign</h4>
                        </div>
                        <div class="modal-body" style="height: auto; overflow-y: scroll;">
                            <form action="#" class="form-horizontal" role="form">
                            <div class="form-group">
                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                    <table class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        <tr>
                                            <td colspan="2">
                                                <label class="control-label col-md-12" id="lblCampaign">
                                                </label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <label id="lblStudentName" style="color: Red;">
                                                    Student Name</label>
                                            </td>
                                            <td>
                                                <label id="lblStudentName1" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <label id="lblEmailId" style="color: Red;">
                                                    Email Id</label>
                                            </td>
                                            <td>
                                                <label id="lblEmailId1" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <label id="lblMobileNo" style="color: Red;">
                                                    Mobile No.</label>
                                            </td>
                                            <td>
                                                <label id="lblMobileNo1" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <label id="lblPopupCampaign" style="color: Red;">
                                                    Campaign Name</label>
                                            </td>
                                            <td>
                                                <select class="form-control " data-live-search="true" data-size="8" required="required"
                                                    id="ddlcampaign">
                                                    <option value="0">Select</option>
                                                </select>
                                                <br />
                                                 <label id="lblpopupcampaign" style="color: Red;" />
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
                                    aria-hidden="true">Close</a> <a id="CampaignPopupSave" type="submit" class="btn green pull-right"
                                        style="width: 62px; margin-left: 5px;">Save</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
