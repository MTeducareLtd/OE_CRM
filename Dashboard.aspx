<%@ Page Title="" Language="C#" MasterPageFile="~/OE_CRM.master" AutoEventWireup="true"
    CodeFile="Dashboard.aspx.cs" Inherits="Dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript" src="CustomJS/JSDashboard.js?v=<%=Version%>"></script>
    <script type="text/javascript">

        function btnEnterContactClick() {
            Android.onPageLoadStart();
            window.location.assign("Enter_Contact.aspx");
        }

      

    </script>
    <style type="text/css">
        .style1
        {
            height: 29px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="page-content-wrapper">
        <div class="page-content">
            <!-- BEGIN SAMPLE TABLE PORTLET-->
            <div class="row">
               <%-- <a id="Entercontact" href="Enter_Contact.aspx" style="cursor: pointer">--%>
                <a id="AA5" href="#" style="cursor: pointer">
                    <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12" onclick="btnEnterContactClick(this);">
                        <div class="dashboard-stat purple" id="divdashboardstatpurple">
                            <div class="visual">
                                <i class="icon-notification"></i>
                            </div>
                            <div class="details">
                                <div class="desc">
                                    <div class="col-lg-10 col-md-10 col-sm-10 col-xs-10">
                                        Contact</div>
                                    <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">
                                        <span><i style="font-size: 15px;" class="icon-rightarrow"></i></span>
                                    </div>
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" style="text-align: right">
                                        <span id="lblCount"></span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </a>
                <%--<a  id="ConvertToLead" href="Convert_To_Lead.aspx" style="cursor: pointer" >
                <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12" onclick="btnConvertToLeadClick(this);">
                        <div class="dashboard-stat pink2">
                            <div class="visual">
                                <i class="icon-graph"></i>
                            </div>
                            <div class="details">
                                <div class="desc">
                                <div class="col-lg-10 col-md-10 col-sm-10 col-xs-10">Convert To Lead</div> 
                                <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2"><span ><i style="font-size:15px;" class="icon-rightarrow"></i></span></div>  
                                    
                                </div>
                            </div>
                            
                        </div>
                    </div></a>

                <a  id="ConvertToOpportunity"  href="Convert_To_Opportunity.aspx" style="cursor: pointer" >
                <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12" onclick="btnConvertToOpportunityClick(this);">
                        <div class="dashboard-stat gray">
                            <div class="visual">
                                <i class="icon-online"></i>
                            </div>
                            <div class="details">
                                <div class="desc">
                                <div class="col-lg-10 col-md-10 col-sm-10 col-xs-10">Convert To Opportunity</div> 
                                <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2"><span ><i style="font-size:15px;" class="icon-rightarrow"></i></span></div>  
                                      
                                </div>
                            </div>
                            
                        </div>
                    </div></a>

                <a  id="BookAdmission" href="Book_Addmission.aspx" style="cursor: pointer"  >
                <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12" onclick="btnBookAdmissionClick(this);">
                        <div class="dashboard-stat blue">
                            <div class="visual">
                                <i class="icon-assessment"></i>
                            </div>
                            <div class="details">
                                <div class="desc">
                                 <div class="col-lg-10 col-md-10 col-sm-10 col-xs-10">Book Admission</div> 
                                <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2"><span ><i style="font-size:15px;" class="icon-rightarrow"></i></span></div>  
                                    
                                </div>
                            </div>
                            
                        </div>
                    </div></a>--%>
                <%--<a id="Campaign" href="Campaign.aspx" style="cursor: pointer">--%>
                <a id="AA4" href="#" style="cursor: pointer">
                    <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                        <div class="dashboard-stat mint">
                            <div class="visual">
                                <i class="icon-groupmine_empty"></i>
                            </div>
                            <div class="details">
                                <div class="desc">
                                    <div class="col-lg-10 col-md-10 col-sm-10 col-xs-10">
                                        Campaign</div>
                                    <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">
                                        <span><i style="font-size: 15px;" class="icon-rightarrow"></i></span>
                                    </div>
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" style="text-align: right">
                                        <span id="lblCamcount"></span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </a>
                <a id="A11" href="#" style="cursor: pointer">
                    <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                        <div class="dashboard-stat pink2">
                            <div class="visual">
                                <i class="icon-groupmine_empty"></i>
                            </div>
                            <div class="details">
                                <div class="desc">
                                    <div class="col-lg-10 col-md-10 col-sm-10 col-xs-10">
                                        Total Leads</div>
                                    <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">
                                        <span><i style="font-size: 15px;" class="icon-rightarrow"></i></span>
                                    </div>
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" style="text-align: right">
                                        <span id="Lblleadcount"></span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </a>
                <a id="al2" href="#" style="cursor: pointer">
                    <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                        <div class="dashboard-stat blue">
                            <div class="visual">
                                <i class="icon-groupmine_empty"></i>
                            </div>
                            <div class="details">
                                <div class="desc">
                                    <div class="col-lg-10 col-md-10 col-sm-10 col-xs-10">
                                        Total Opportunity</div>
                                    <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">
                                        <span><i style="font-size: 15px;" class="icon-rightarrow"></i></span>
                                    </div>
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" style="text-align: right">
                                        <span id="LBLopportunity"></span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </a>
            </div>
            <div class="row">
                <a id="AA1" href="#" style="cursor: pointer;">
                    <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                        <div class="dashboard-stat blue">
                            <div class="visual">
                                <i class="icon-groupmine_empty"></i>
                            </div>
                            <div class="details">
                                <div class="desc">
                                    <div class="col-lg-10 col-md-10 col-sm-10 col-xs-10">
                                        Overdue Followup</div>
                                    <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">
                                        <span><i style="font-size: 15px;" class="icon-rightarrow"></i></span>
                                    </div>
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" style="text-align: right">
                                        <span id="LBLoverDueFllowup"></span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </a><a id="AA2" href="#" style="cursor: pointer;">
                    <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                        <div class="dashboard-stat pink2">
                            <div class="visual">
                                <i class="icon-groupmine_empty"></i>
                            </div>
                            <div class="details">
                                <div class="desc">
                                    <div class="col-lg-10 col-md-10 col-sm-10 col-xs-10">
                                        Todays Followup</div>
                                    <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">
                                        <span><i style="font-size: 15px;" class="icon-rightarrow"></i></span>
                                    </div>
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" style="text-align: right">
                                        <span id="LBLtodaysfallowup"></span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    </a><a id="AA3" href="#" style="cursor: pointer;">
                <%--</a><a id="A3" href="Campaign_Working_Sheet.aspx" style="cursor: pointer">--%>
                    <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                        <div class="dashboard-stat blue">
                            <div class="visual">
                                <i class="icon-groupmine_empty"></i>
                            </div>
                            <div class="details">
                                <div class="desc">
                                    <div class="col-lg-10 col-md-10 col-sm-10 col-xs-10">
                                        Campaign Working Sheet</div>
                                    <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">
                                        <span><i style="font-size: 15px;" class="icon-rightarrow"></i></span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </a>
                <a id="A4" href="Campaign_Report.aspx" style="cursor: pointer; display: none;">
                    <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                        <div class="dashboard-stat pink2">
                            <div class="visual">
                                <i class="icon-groupmine_empty"></i>
                            </div>
                            <div class="details">
                                <div class="desc">
                                    <div class="col-lg-10 col-md-10 col-sm-10 col-xs-10">
                                        Report</div>
                                    <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">
                                        <span><i style="font-size: 15px;" class="icon-rightarrow"></i></span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </a>
            </div>
            <%--<style>
                table
                {
                    font-family: arial, sans-serif;
                    border-collapse: collapse;
                    width: 40%;
                }
                
                td, th
                {
                    border: 1px solid #dddddd;
                    text-align: left;
                    padding: 8px;
                }
                
                tr:nth-child(even)
                {
                    background-color: #dddddd;
                }
            </style>
            <table>
              <tr>
                    <th colspan="2" style="text-align:center">
                        Total Campaign Summary
                    </th>
                  
                </tr>
                <tr>
                    <th>
                        Total Campaign Contacts</th>
                    <th>
                        Contact
                    </th>
                </tr>
                <tr>
                    <td>
                        Not called Even Once</td>
                    <td>
                        Maria Anders
                    </td>
                </tr>
                <tr>
                    <td>
                        Called but not converted to lead</td>
                    <td>
                        Maria Anders
                    </td>
                </tr>
            </table>--%>
            <!-- END PAGE CONTENT-->
        </div>
    </div>
    <!-- END CONTENT -->
</asp:Content>
