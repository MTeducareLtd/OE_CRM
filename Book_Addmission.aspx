<%@ Page Title="" Language="C#" MasterPageFile="~/OE_CRM.master" AutoEventWireup="true"
    CodeFile="Book_Addmission.aspx.cs" Inherits="Book_Addmission" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript" src="APPJS/SIPJS.js"></script>
    <link href="APPJS/SIPExternal.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">

        window.load = function () {

            Android.onPageLoadStart();
        }

        window.onload = function () {

            Android.onPageLoadComplete();
        }

        function bindStart() {
            Android.onPageLoadStart();
        }


        function bindComplt() {
            Android.onPageLoadComplete();
        }
    </script>
    <script type="text/javascript">

        $(document).ready(function () {

            $("#btnBookAdmissionHome").click(function () {

                window.location.assign("Dashboard.aspx");
                Android.onPageLoadComplete(false);
            });

            $("#btnBookAdmissionHome1").click(function () {

                window.location.assign("Dashboard.aspx");
                Android.onPageLoadComplete(false);
            });

            $("#btnBookAdmissionHome2").click(function () {

                window.location.assign("Dashboard.aspx");
                Android.onPageLoadComplete(false);
            });

            $("#btnBookAdmissionHome3").click(function () {

                window.location.assign("Dashboard.aspx");
                Android.onPageLoadComplete(false);
            });

            $("#btnBookAdmissionHome4").click(function () {

                window.location.assign("Dashboard.aspx");
                Android.onPageLoadComplete(false);
            });

            $("#btnBookAdmissionHome5").click(function () {

                window.location.assign("Dashboard.aspx");
                Android.onPageLoadComplete(false);
            });

            $("#btnBookAdmissionHome6").click(function () {

                window.location.assign("Dashboard.aspx");
                Android.onPageLoadComplete(false);
            });

        });
    </script>
    <script type="text/javascript">
        function NumberOnly() {
            var AsciiValue = event.keyCode
            if ((AsciiValue >= 48 && AsciiValue <= 57) || (AsciiValue == 8 || AsciiValue == 127))
                event.returnValue = true;
            else
                event.returnValue = false;
        }


        function onlyAlphabets() {

            var charCode = event.keyCode;

            if ((charCode > 64 && charCode < 91) || (charCode > 96 && charCode < 123) || AsciiValue == 45)
                return true;
            else
                return false;
        }
           
    </script>
    <script type="text/javascript">
        $(document).ready(function () {
            $('[data-toggle="tooltip"]').tooltip();
        });


     

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <input type="hidden" id="Type" />
    <asp:HiddenField ID="FileLink" runat="server" />
    <div class="page-content-wrapper">
        <div class="page-content">
            <!-- BEGIN SAMPLE TABLE PORTLET-->
            <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>
            <asp:UpdatePanel ID="UpdatePanelMsgBox" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <div class="alert alert-block alert-success" id="Msg_Success" visible="false" runat="server">
                        <button type="button" class="close" data-dismiss="alert">
                            <i class="icon-remove"></i>
                        </button>
                        <p>
                            <strong><i class="icon-ok"></i></strong>
                            <asp:Label ID="lblSuccess" runat="server" Text="Label" ForeColor="Green" Font-Bold="true"></asp:Label>
                        </p>
                    </div>
                    <div class="alert alert-block alert-error" id="Msg_Error" visible="false" runat="server">
                        <button type="button" class="close" data-dismiss="alert">
                            <i class="icon-remove"></i>
                        </button>
                        <p>
                            <strong style="color: Red"><i class="icon-remove"></i>Error!</strong>
                            <asp:Label ID="lblerror" runat="server" Text="Label" ForeColor="red" Font-Bold="true"></asp:Label>
                        </p>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
          
                    <div id="divBookAdmissionSearch" runat="server" style="width: 100%;">
                        <!-- BEGIN PORTLET-->
                        <div class="portlet box green">
                            <div class="portlet-title">
                                <div class="caption">
                                    <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">
                                        <span id="btnBookAdmissionHome"><i style="font-size: 40px; cursor: pointer;" data-toggle="tooltip"
                                            data-placement="bottom" title="Back" class="fa fa-angle-left"></i></span>
                                    </div>
                                    <div class="col-lg-10 col-md-10 col-sm-10 col-xs-10">
                                        Book Admission</div>
                                </div>
                            </div>
                            <div class="portlet-body form">
                                <div id="divConvertToOpportunitySearch1" runat="server">
                                    <!-- BEGIN FORM-->
                                    <form action="#" class="form-horizontal form-bordered">
                                    <div class="form-body">
                                        <div class="form-group">
                                            <div class="row">
                                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" style="padding-right: 0px; padding-left: 0px;">
                                                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12" style="padding-right: 0px; padding-left: 0px;">
                                                        <div class="col-lg-2 col-md-2 col-sm-2 col-xs-3" style="padding-right: 0px;">
                                                            Name
                                                        </div>
                                                        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-9" style="padding-right: 0px; padding-left: 0px;">
                                                            <asp:TextBox runat="server" ID="txtUserName" ToolTip="User Name" type="text" Width="205px"
                                                                onkeypress="return onlyAlphabets(event);" ValidationGroup="UcValidate" />
                                                        </div>
                                                        <div class="row">
                                                        </div>
                                                        <br />
                                                        <div class="col-lg-2 col-md-2 col-sm-2 col-xs-3" style="padding-right: 0px;">
                                                            Mobile No.
                                                        </div>
                                                        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-9" style="padding-right: 0px; padding-left: 0px;">
                                                            <asp:TextBox runat="server" ID="txtMobileNo" ToolTip="Mobile No" type="text" Width="205px"
                                                                onkeypress="return  NumberOnly(event);" />
                                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtMobileNo"
                                                                CssClass="red" ErrorMessage="Invalid Mobile Number" ValidationGroup="UcValidate"
                                                                Text="" SetFocusOnError="true" ValidationExpression="^[0-9]{10,12}$" />
                                                        </div>
                                                        <div class="row">
                                                        </div>
                                                        <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12" style="text-align: center; padding-top: 16px;">
                                                            <button id="btnBookAdmissionSearch" type="submit" class="btn red" runat="server"
                                                                onserverclick="btnBookAdmissionSearch_Click">
                                                                Search</button>
                                                            <button id="btnBookAdmissionClear" type="submit" class="btn red" runat="server" onserverclick="btnBookAdmissionClear_Click">
                                                                Clear</button>
                                                        </div>
                                                    </div>
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
                    <div id="divBookAdmissionData" visible="false" runat="server">
                        <!-- BEGIN PORTLET-->
                        <div class="portlet box green">
                            <%--<div class="portlet-title">
                        <div class="caption">
                            <i class="fa fa-gift"></i>Book Admission
                        </div>
                        <div class="actions">
                            <div class="actions">
                                <a id="btnBookAdmissionHome1" class="btn yellow" title="Home" style="width: 40px;
                                    text-align: center;"><i class="fa fa-home"></i></a>
                                <button id="btnBookAdmissionBack" type="button" class="btn blue" title="Back" runat="server"
                                    style="width: 40px;" onserverclick="btnBookAdmissionBack_Click">
                                    <i class="fa fa-reply"></i>
                                </button>
                            </div>
                        </div>
                    </div>--%>
                            <div class="portlet-title">
                                <div class="caption">
                                    <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">
                                        <span id="btnBookAdmissionHome1"><i style="font-size: 40px; cursor: pointer;" data-toggle="tooltip"
                                            data-placement="bottom" title="Back" class="fa fa-angle-left"></i></span>
                                    </div>
                                    <div class="col-lg-10 col-md-10 col-sm-10 col-xs-10">
                                        Book Admission</div>
                                </div>
                            </div>
                            <div class="portlet-body form">
                                <div id="divBookAdmissionData1" runat="server">
                                    <asp:DataList ID="dlBookAdmission" CssClass="table table-hover" runat="server" Width="100%"
                                        Height="100%" OnItemCommand="dlBookAdmission_ItemCommand">
                                        <HeaderTemplate>
                                            <th>
                                                Student Name
                                            </th>
                                            <th >
                                                Student Details
                                            </th>
                                            <th >
                                                Action
                                            </th>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <td style="padding-top: 20px;">
                                                <asp:Label ID="lblStudentName" runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"Student_Name")%>' />
                                            </td>
                                            <td style="padding-top: 20px;">
                                                <b>Contact Source:</b>
                                                <asp:Label ID="lblContactSource" runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"contact_Source")%>' />
                                                <br />
                                                <b>Gender:</b>
                                                <asp:Label ID="lblGender" runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"Gender")%>' />
                                                <br />
                                                <b>Handphone1:</b>
                                                <asp:Label ID="lblHandphone1" runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"Handphone1")%>' />
                                                <br />
                                                <b>Email:</b>
                                                <asp:Label ID="lblEmail" runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"Emailid")%>' />
                                            </td>
                                            <td style="padding-top: 20px;">
                                                <asp:LinkButton ID="lnkEditInfo" ToolTip="Book Admission" CommandName="BookAdmission"
                                                    CommandArgument='<%#DataBinder.Eval(Container.DataItem,"Con_Id")%>' runat="server">Book Admission</asp:LinkButton>
                                            </td>
                                        </ItemTemplate>
                                    </asp:DataList>
                                </div>
                            </div>
                        </div>
                        <!-- END PORTLET-->
                    </div>
                    <div id="divContactDetails" visible="false" runat="server">
                        <div class="portlet box green">
                            <div class="portlet-title">
                                <div class="caption">
                                    <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">
                                        <span id="btnBookAdmissionHome2"><i style="font-size: 40px; cursor: pointer;" data-toggle="tooltip"
                                            data-placement="bottom" title="Back" class="fa fa-angle-left"></i></span>
                                    </div>
                                    <div class="col-lg-10 col-md-10 col-sm-10 col-xs-10">
                                        Contact Details
                                        <asp:Label runat="server" ID="lblPkey" Visible="false"></asp:Label>
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
                                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" style="padding-right: 0px; padding-left: 0px;">
                                                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12" style="padding-right: 0px; padding-left: 0px;">
                                                        <div class="col-lg-2 col-md-2 col-sm-2 col-xs-3" style="padding-right: 0px;">
                                                            Contact Name
                                                        </div>
                                                        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-9" style="padding-right: 0px; padding-left: 0px;">
                                                            <asp:Label ID="lblContactName" runat="server" Text="Anjali" Width="205px" ReadOnly="True"></asp:Label>
                                                        </div>
                                                        <div class="row">
                                                        </div>
                                                        <br />
                                                        <div class="col-lg-2 col-md-2 col-sm-2 col-xs-3" style="padding-right: 0px;">
                                                            Handphone1
                                                        </div>
                                                        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-9" style="padding-right: 0px; padding-left: 0px;">
                                                            <asp:Label ID="lblHandphone1" runat="server" Text="9867923320" Width="205px" ReadOnly="True"></asp:Label>
                                                        </div>
                                                        <div class="row">
                                                        </div>
                                                        <br />
                                                        <div class="col-lg-2 col-md-2 col-sm-2 col-xs-3" style="padding-right: 0px;">
                                                            Gender
                                                        </div>
                                                        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-9" style="padding-right: 0px; padding-left: 0px;">
                                                            <asp:Label ID="lblGender" runat="server" Text="Female" Width="205px" ReadOnly="True"></asp:Label>
                                                        </div>
                                                        <div class="row">
                                                        </div>
                                                        <br />
                                                        <div class="col-lg-2 col-md-2 col-sm-2 col-xs-3" style="padding-right: 0px;">
                                                            Email Id
                                                        </div>
                                                        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-9" style="padding-right: 0px; padding-left: 0px;">
                                                            <asp:Label ID="lblEmail" runat="server" Text="Anjalisalvi@gmail.com" Width="205px"
                                                                ReadOnly="True"></asp:Label>
                                                        </div>
                                                        <div class="row">
                                                        </div>
                                                        <br />
                                                    </div>
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
                    <div id="divLeadDetails" visible="false" runat="server">
                        <div class="portlet box green">
                            <div class="portlet-title">
                                <div class="caption">
                                    <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">
                                        <span id="btnBookAdmissionHome3"><i style="font-size: 40px; cursor: pointer;" data-toggle="tooltip"
                                            data-placement="bottom" title="Back" class="fa fa-angle-left"></i></span>
                                    </div>
                                    <div class="col-lg-10 col-md-10 col-sm-10 col-xs-10">
                                        Lead Details</div>
                                </div>
                            </div>
                            <div class="portlet-body form">
                                <!-- BEGIN FORM-->
                                <div class="form-horizontal form-bordered">
                                    <form action="#" class="form-horizontal form-bordered">
                                    <div class="form-body">
                                        <div class="form-group">
                                            <div class="row">
                                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" style="padding-right: 0px; padding-left: 0px;">
                                                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12" style="padding-right: 0px; padding-left: 0px;">
                                                        <div class="col-lg-2 col-md-2 col-sm-2 col-xs-3" style="padding-right: 0px;">
                                                            Expected Joining Acad Year
                                                        </div>
                                                        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-9" style="padding-right: 0px; padding-left: 0px;">
                                                            <asp:DropDownList runat="server" ID="ddlAcadYear" Width="205px" CssClass="form-control select2">
                                                            </asp:DropDownList>
                                                        </div>
                                                        <div class="row">
                                                        </div>
                                                        <br />
                                                        <div class="col-lg-2 col-md-2 col-sm-2 col-xs-3" style="padding-right: 0px;">
                                                            Division
                                                        </div>
                                                        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-9" style="padding-right: 0px; padding-left: 0px;">
                                                            <asp:DropDownList runat="server" ID="ddlDivision" Width="205px" CssClass="form-control select2"
                                                                AutoPostBack="true" OnSelectedIndexChanged="ddlDivision_SelectedIndexChanged">
                                                            </asp:DropDownList>
                                                        </div>
                                                        <div class="row">
                                                        </div>
                                                        <br />
                                                        <div class="col-lg-2 col-md-2 col-sm-2 col-xs-3" style="padding-right: 0px;">
                                                            Center
                                                        </div>
                                                        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-9" style="padding-right: 0px; padding-left: 0px;">
                                                            <asp:DropDownList runat="server" ID="ddlCenter" Width="205px" CssClass="form-control select2"
                                                                AutoPostBack="true" OnSelectedIndexChanged="ddlCenter_SelectedIndexChanged">
                                                            </asp:DropDownList>
                                                        </div>
                                                        <div class="row">
                                                        </div>
                                                        <br />
                                                        <div class="col-lg-2 col-md-2 col-sm-2 col-xs-3" style="padding-right: 0px;">
                                                            Expected Date Of Joining
                                                        </div>
                                                        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-9" style="padding-right: 0px; padding-left: 0px;">
                                                            <asp:Label ID="lblDOJ" runat="server" Text="25 Nov 2016" Width="205px" ReadOnly="True"></asp:Label>
                                                        </div>
                                                        <div class="row">
                                                        </div>
                                                        <br />
                                                    </div>
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
                    <div id="divOpportunityDetails" visible="false" runat="server">
                        <div class="portlet box green">
                            <div class="portlet-title">
                                <div class="caption">
                                    <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">
                                        <span id="btnBookAdmissionHome4"><i style="font-size: 40px; cursor: pointer;" data-toggle="tooltip"
                                            data-placement="bottom" title="Back" class="fa fa-angle-left"></i></span>
                                    </div>
                                    <div class="col-lg-10 col-md-10 col-sm-10 col-xs-10">
                                        Opportunity Details
                                        <asp:Label runat="server" ID="Label4" Visible="false"></asp:Label>
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
                                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" style="padding-right: 0px; padding-left: 0px;">
                                                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12" style="padding-right: 0px; padding-left: 0px;">
                                                        <div class="col-lg-2 col-md-2 col-sm-2 col-xs-3" style="padding-right: 0px;">
                                                            Sales Stage
                                                        </div>
                                                        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-9" style="padding-right: 0px; padding-left: 0px;">
                                                            <asp:DropDownList runat="server" ID="ddlSalesStage" Width="205px" CssClass="form-control select2"
                                                                ReadOnly="True">
                                                                <asp:ListItem Value="0">Select</asp:ListItem>
                                                                <asp:ListItem Value="1">Stage1</asp:ListItem>
                                                                <asp:ListItem Value="2">Stage2</asp:ListItem>
                                                                <asp:ListItem Value="2">Stage3</asp:ListItem>
                                                            </asp:DropDownList>
                                                        </div>
                                                        <div class="row">
                                                        </div>
                                                        <br />
                                                        <div class="col-lg-2 col-md-2 col-sm-2 col-xs-3" style="padding-right: 0px;">
                                                            Expected Closure Date
                                                        </div>
                                                        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-9" style="padding-right: 0px; padding-left: 0px;">
                                                            <input readonly="readonly" class="span7 date-picker" id="txtClosureDate" runat="server"
                                                                type="text" data-date-format="dd M yyyy" style="width: 205px" />
                                                        </div>
                                                        <div class="row">
                                                        </div>
                                                        <br />
                                                        <div class="col-lg-2 col-md-2 col-sm-2 col-xs-3" style="padding-right: 0px;">
                                                            Probability %
                                                        </div>
                                                        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-9" style="padding-right: 0px; padding-left: 0px;">
                                                            <asp:TextBox runat="server" ID="txtProbability" type="text" Width="205px" ReadOnly="True" />
                                                        </div>
                                                        <div class="row">
                                                        </div>
                                                        <br />
                                                    </div>
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
                    <div id="divAdmissionDetails" visible="false" runat="server">
                        <div class="portlet box green">
                            <div class="portlet-title">
                                <div class="caption">
                                    <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">
                                          <span id="btnBookAdmissionHome5"><i style="font-size: 40px; cursor: pointer;" data-toggle="tooltip"
                                            data-placement="bottom" title="Back" class="fa fa-angle-left"></i></span>
                                    </div>
                                    <div class="col-lg-10 col-md-10 col-sm-10 col-xs-10">
                                        Admission Details</div>
                                </div>
                            </div>
                            <div class="portlet-body form">
                                <!-- BEGIN FORM-->
                                <div class="form-horizontal form-bordered">
                                    <form action="#" class="form-horizontal form-bordered">
                                    <div class="form-body">
                                        <div class="form-group">
                                            <div class="row">
                                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" style="padding-right: 0px; padding-left: 0px;">
                                                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12" style="padding-right: 0px; padding-left: 0px;">
                                                        <div class="col-lg-2 col-md-2 col-sm-2 col-xs-3" style="padding-right: 0px;">
                                                            Product
                                                        </div>
                                                        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-9" style="padding-right: 0px; padding-left: 0px;">
                                                            <asp:DropDownList runat="server" ID="ddlProduct" Width="205px" CssClass="form-control select2"
                                                                OnSelectedIndexChanged="ddlProduct_SelectedIndexChanged" AutoPostBack="true">
                                                                <asp:ListItem>Select</asp:ListItem>
                                                            </asp:DropDownList>
                                                        </div>
                                                        <div class="row">
                                                        </div>
                                                        <br />
                                                        <div class="col-lg-2 col-md-2 col-sm-2 col-xs-3" style="padding-right: 0px;">
                                                            Pay Plan
                                                        </div>
                                                        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-9" style="padding-right: 0px; padding-left: 0px;">
                                                            <asp:DropDownList runat="server" ID="ddlPayPlan" Width="205px" CssClass="form-control select2">
                                                            </asp:DropDownList>
                                                        </div>
                                                        <div class="row">
                                                        </div>
                                                        <br />
                                                        <div class="col-lg-2 col-md-2 col-sm-2 col-xs-3" style="padding-right: 0px;">
                                                            Product / Items Group Selection
                                                        </div>
                                                        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-9" style="padding-right: 0px; padding-left: 0px;">
                                                            <asp:DataList ID="dlGroupSelection" CssClass="table table-hover" runat="server" Width="100%"
                                                                Height="20px">
                                                                <HeaderTemplate>
                                                                    <th width="20%">
                                                                        Select
                                                                    </th>
                                                                    <th width="80%">
                                                                        Items
                                                                    </th>
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <td>
                                                                        <asp:CheckBox ID="chkStudent" runat="server" />
                                                                        <span class="lbl"></span>
                                                                    </td>
                                                                    <td>
                                                                        <asp:Label ID="lblSubgrpDesc" Text='<%#DataBinder.Eval(Container.DataItem, "SGR_DESC")%>'
                                                                            runat="server"></asp:Label>
                                                                    </td>
                                                                </ItemTemplate>
                                                            </asp:DataList>
                                                        </div>
                                                        <div class="row">
                                                        </div>
                                                        <br />
                                                        <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12" style="text-align: center; padding-top: 16px;">
                                                            <button id="btnbookAdmissionProceed" type="submit" class="btn red" runat="server"
                                                                onserverclick="btnbookAdmissionProceed_Click">
                                                                Proceed</button>
                                                        </div>
                                                    </div>
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
                    <div id="divAddmissionConfirmed" runat="server" visible="false">
                        <div class="portlet box green">
                            <div class="portlet-title">
                                <div class="caption">
                                    <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">
                                        <span id="btnBookAdmissionHome6"><i style="font-size: 40px; cursor: pointer;" data-toggle="tooltip"
                                            data-placement="bottom" title="Back" class="fa fa-angle-left"></i></span>
                                    </div>
                                    <div class="col-lg-10 col-md-10 col-sm-10 col-xs-10">
                                        Confirmed Admission Details
                                        <asp:Label runat="server" ID="Label1" Visible="false"></asp:Label>
                                    </div>
                                </div>
                            </div>
                            <div class="portlet-body form">
                                <div id="divAddmissionConfirmed1" runat="server">
                                    <!-- BEGIN FORM-->
                                    <form action="#" class="form-horizontal form-bordered">
                                    <div class="form-body">
                                        <div class="form-group">
                                            <div class="row">
                                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" style="padding-right: 0px; padding-left: 0px;">
                                                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12" style="padding-right: 0px; padding-left: 0px;">
                                                        <div class="col-lg-2 col-md-2 col-sm-2 col-xs-3" style="padding-right: 0px;">
                                                            Product
                                                        </div>
                                                        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-9" style="padding-right: 0px; padding-left: 0px;">
                                                            <asp:DropDownList runat="server" ID="ddlProduct1" Width="205px" CssClass="form-control select2"
                                                                ReadOnly="True">
                                                            </asp:DropDownList>
                                                        </div>
                                                        <div class="row">
                                                        </div>
                                                        <br />
                                                        <div class="col-lg-2 col-md-2 col-sm-2 col-xs-3" style="padding-right: 0px;">
                                                            Pay Plan
                                                        </div>
                                                        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-9" style="padding-right: 0px; padding-left: 0px;">
                                                            <asp:DropDownList runat="server" ID="ddlPayPlan1" Width="205px" CssClass="form-control select2"
                                                                ReadOnly="True">
                                                            </asp:DropDownList>
                                                        </div>
                                                        <div class="row">
                                                        </div>
                                                        <br />
                                                        <div class="col-lg-2 col-md-2 col-sm-2 col-xs-3" style="padding-right: 0px;">
                                                            Product / Items Group Selection
                                                        </div>
                                                        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-9" style="padding-right: 0px; padding-left: 0px;">
                                                            <asp:DataList ID="dlGroupSelectionConfirmed" CssClass="table table-hover" runat="server"
                                                                Width="100%" Height="20px">
                                                                <HeaderTemplate>
                                                                    <th>
                                                                        Items
                                                                    </th>
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <td>
                                                                        <asp:Label ID="lblvoucherDesc" runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"SGR_DESC")%>' />
                                                                    </td>
                                                                </ItemTemplate>
                                                            </asp:DataList>
                                                        </div>
                                                        <div class="row">
                                                        </div>
                                                        <br />
                                                        <div class="col-lg-2 col-md-2 col-sm-2 col-xs-3" style="padding-right: 0px;">
                                                            Fee Structure
                                                        </div>
                                                        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-9" style="padding-right: 0px; padding-left: 0px;">
                                                            <asp:DataList ID="dlFeeStucture" CssClass="table table-hover" runat="server" Width="100%"
                                                                Height="20px">
                                                                <HeaderTemplate>
                                                                    <th width="20%">
                                                                        Voucher Description
                                                                    </th>
                                                                    <th width="80%">
                                                                        Amount
                                                                    </th>
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <td>
                                                                        <asp:Label ID="lblVoucherDesc" runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"Voucher_Description")%>' />
                                                                    </td>
                                                                    <td>
                                                                        <asp:Label ID="lblVoucheramt" runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"Final_Voucher_Amount")%>' />
                                                                    </td>
                                                                </ItemTemplate>
                                                            </asp:DataList>
                                                        </div>
                                                        <div class="row">
                                                        </div>
                                                        <br />
                                                        <div class="col-lg-6 col-md-4 col-sm-4 col-xs-12" id="Div1" style="text-align: center;
                                                            padding-top: 16px;">
                                                            <button id="btnSubmit" type="submit" class="btn red" runat="server" text="Submit">
                                                                Submit</button>
                                                            <button id="btnBack" type="submit" class="btn red" runat="server" onserverclick="btnBack_Click"
                                                                text="Back">
                                                                Back</button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <%--<div class="form-group">
                            <table class="table table-striped table-bordered table-condensed">
                                <tr>
                                    <td class="col-md-3" style="text-align: left">
                                        Product
                                    </td>
                                    <td class="col-md-9" style="text-align: left">
                                        <asp:DropDownList runat="server" ID="ddlProduct1" Width="205px" CssClass="form-control select2"
                                            ReadOnly="True">
                                        </asp:DropDownList>
                                      
                                    </td>
                                </tr>
                                <tr>
                                    <td class="col-md-3" style="text-align: left">
                                        Pay Plan
                                    </td>
                                    <td class="col-md-9" style="text-align: left">
                                        <asp:DropDownList runat="server" ID="ddlPayPlan1" Width="205px" CssClass="form-control select2"
                                            ReadOnly="True">
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="col-md-3" style="text-align: left">
                                        Product / Items Group Selection
                                    </td>
                                    <td class="col-md-9" style="text-align: left">
                                        <asp:DataList ID="dlGroupSelectionConfirmed" CssClass="table table-hover" runat="server"
                                            Width="100%" Height="20px">
                                            <HeaderTemplate>
                                                <th>
                                                    Items
                                                </th>
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <td>
                                                    <asp:Label ID="lblvoucherDesc" runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"SGR_DESC")%>' />
                                                </td>
                                            </ItemTemplate>
                                        </asp:DataList>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="col-md-3" style="text-align: left">
                                        Fee Structure
                                    </td>
                                    <td class="col-md-9" style="text-align: left">
                                        <asp:DataList ID="dlFeeStucture" CssClass="table table-hover" runat="server" Width="100%"
                                            Height="20px">
                                            <HeaderTemplate>
                                                <th width="20%">
                                                    Voucher Description
                                                </th>
                                                <th width="80%">
                                                    Amount
                                                </th>
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <td>
                                                    <asp:Label ID="lblVoucherDesc" runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"Voucher_Description")%>' />
                                                </td>
                                                <td>
                                                    <asp:Label ID="lblVoucheramt" runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"Final_Voucher_Amount")%>' />
                                                </td>
                                            </ItemTemplate>
                                        </asp:DataList>
                                    </td>
                                </tr>
                            </table>
                        </div>--%>
                                    </div>
                                    </form>
                                    <!-- END FORM-->
                                </div>
                                <!-- END FORM-->
                            </div>
                        </div>
                    </div>
               
        </div>
    </div>
</asp:Content>
