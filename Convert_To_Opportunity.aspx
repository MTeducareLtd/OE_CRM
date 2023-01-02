<%@ Page Title="" Language="C#" MasterPageFile="~/OE_CRM.master" AutoEventWireup="true"
    CodeFile="Convert_To_Opportunity.aspx.cs" Inherits="Convert_To_Opportunity" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="APPJS/SIPExternal.css" rel="stylesheet" type="text/css" />
    <link href="APPJS/SIPExternal.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">

        $(document).ready(function () {

            $("#btnConvertToOpportunityHome").click(function () {

                window.location.assign("Dashboard.aspx");
                Android.onPageLoadComplete(false);
            });

            $("#btnConvertToOpportunityHome1").click(function () {

                window.location.assign("Dashboard.aspx");
                Android.onPageLoadComplete(false);
            });

            $("#btnConvertToOpportunityHome2").click(function () {

                window.location.assign("Dashboard.aspx");
                Android.onPageLoadComplete(false);
            });

            $("#btnConvertToOpportunityHome3").click(function () {

                window.location.assign("Dashboard.aspx");
                Android.onPageLoadComplete(false);
            });

            $("#btnConvertToOpportunityHome4").click(function () {

                window.location.assign("Dashboard.aspx");
                Android.onPageLoadComplete(false);
            });

            $("#btnConvertToOpportunityHome5").click(function () {

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
            <div id="divConvertToOpportunitySearch" runat="server" style="width: 100%;">
                <!-- BEGIN PORTLET-->
                <div class="portlet box green">
                    <div class="portlet-title">
                        <div class="caption">
                            <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">
                                <span id="btnConvertToOpportunityHome"><i style="font-size: 40px; cursor: pointer;"
                                    data-toggle="tooltip" data-placement="bottom" title="Back" class="fa fa-angle-left">
                                </i></span>
                            </div>
                            <div class="col-lg-10 col-md-10 col-sm-10 col-xs-10">
                                Opportunity Details</div>
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
                                                    <button id="btnConvertToOpportunitySearch" type="submit" class="btn red" runat="server"
                                                        onserverclick="btnConvertToOpportunitySearch_Click">
                                                        Search</button>
                                                    <button id="btnConvertToOpportunityClear" type="submit" class="btn red" runat="server"
                                                        onserverclick="btnConvertToOpportunityClear_Click">
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
            <div id="divConvertToOpportunityData" visible="false" runat="server">
                <!-- BEGIN PORTLET-->
                <div class="portlet box green">
                    <div class="portlet-title">
                        <div class="caption">
                            <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">
                                <span id="btnConvertToOpportunityHome1"><i style="font-size: 40px; cursor: pointer;"
                                    data-toggle="tooltip" data-placement="bottom" title="Back" class="fa fa-angle-left">
                                </i></span>
                            </div>
                            <div class="col-lg-10 col-md-10 col-sm-10 col-xs-10">
                                Opportunity Detail</div>
                        </div>
                    </div>
                    
                    <div class="portlet-body form">
                        <div id="divConvertToOpportunityData1" runat="server">
                            <asp:DataList ID="dlConvertToOpportunity" CssClass="table table-hover" runat="server"
                                Width="100%" Height="100%" OnItemCommand="dlConvertToOpportunity_ItemCommand">
                                <HeaderTemplate>
                                    <th >
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
                                        <asp:LinkButton ID="lnkEditInfo" ToolTip="Convert To Opportunity" CommandName="Opportunity"
                                            CommandArgument='<%#DataBinder.Eval(Container.DataItem,"Con_Id")%>' runat="server">Convert To Opportunity</asp:LinkButton>
                                    </td>
                                </ItemTemplate>
                            </asp:DataList>
                        </div>
                    </div>
                </div>
                <!-- END PORTLET-->
            </div>
            <div id="divAddConvertToOpportunity" visible="false" runat="server">
                <!-- BEGIN PORTLET-->
                <div id="divContactDetails" runat="server">
                    <div class="portlet box green">
                        
                        <div class="portlet-title">
                            <div class="caption">
                                <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">
                                    <span id="btnConvertToOpportunityHome2"><i style="font-size: 40px; cursor: pointer;"
                                        data-toggle="tooltip" data-placement="bottom" title="Back" class="fa fa-angle-left">
                                    </i></span>
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
                <div id="divLeadDetails" runat="server">
                    <div class="portlet box green">
                        
                        <div class="portlet-title">
                            <div class="caption">
                                <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">
                                    <span id="btnConvertToOpportunityHome3"><i style="font-size: 40px; cursor: pointer;"
                                        data-toggle="tooltip" data-placement="bottom" title="Back" class="fa fa-angle-left">
                                    </i></span>
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
                                                        <asp:DropDownList runat="server" ID="ddlAcadYear" Width="205px" CssClass="form-control select2"
                                                            >
                                                          
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
                                                             OnSelectedIndexChanged="ddlDivision_SelectedIndexChanged">
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
                <div id="divOpportunityDetails" runat="server">
                    <div class="portlet box green">
                        
                        <div class="portlet-title">
                            <div class="caption">
                                <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">
                                    <span id="btnConvertToOpportunityHome5"><i style="font-size: 40px; cursor: pointer;"
                                        data-toggle="tooltip" data-placement="bottom" title="Back" class="fa fa-angle-left">
                                    </i></span>
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
                                                    <asp:DropDownList runat="server" ID="ddlSalesStage" Width="205px" CssClass="form-control select2">
                                                    </asp:DropDownList>
                                                </div>
                                                <div class="row">
                                                </div>
                                                <br />
                                                <div class="col-lg-2 col-md-2 col-sm-2 col-xs-3" style="padding-right: 0px;">
                                                    Product
                                                </div>
                                                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-9" style="padding-right: 0px; padding-left: 0px;">
                                                    <asp:DropDownList runat="server" ID="ddlProduct" Width="205px" CssClass="form-control select2">
                                                    </asp:DropDownList>
                                                </div>
                                                <div class="row">
                                                </div>
                                                <br />
                                                <div class="col-lg-2 col-md-2 col-sm-2 col-xs-3" style="padding-right: 0px;">
                                                    Expected Closure Date
                                                </div>
                                                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-9" style="padding-right: 0px; padding-left: 0px;">
                                                  
                                                        <input readonly="readonly" class="span7 date-picker" id="txtClosureDate" runat="server" type="text"
                                                                    data-date-format="dd M yyyy" style="width: 220px" />
                                                </div>
                                                <div class="row">
                                                </div>
                                                <br />
                                                <div class="col-lg-2 col-md-2 col-sm-2 col-xs-3" style="padding-right: 0px;">
                                                    Probability %
                                                </div>
                                                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-9" style="padding-right: 0px; padding-left: 0px;">
                                                    <asp:TextBox runat="server" ID="txtProbability" type="text" Width="205px" />
                                                </div>
                                                <div class="row">
                                                </div>
                                                <br />
                                                <div class="col-lg-6 col-md-4 col-sm-4 col-xs-12" id="Div2" style="text-align: center;
                                                    padding-top: 16px;">
                                                    <button id="btnSave" type="submit" class="btn red" runat="server" text="Save">
                                                        Save</button>
                                                    <button id="btnClose" type="submit" class="btn red" runat="server" onserverclick="btnClose_Click"
                                                        text="Close">
                                                        Close</button>
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
            </div>
        </div>
    </div>
</asp:Content>
