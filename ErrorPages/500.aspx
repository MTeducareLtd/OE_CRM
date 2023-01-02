<%@ Page Language="C#" AutoEventWireup="true" CodeFile="500.aspx.cs" Inherits="ErrorPages_500" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
        
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta content="width=device-width, initial-scale=1" name="viewport" />
        <meta content="Preview page of Metronic Admin Theme #1 for 500 page option 2" name="description" />
        <meta content="" name="author" />
        <!-- BEGIN GLOBAL MANDATORY STYLES -->
        <link href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700&subset=all" rel="stylesheet" type="text/css" />
        <link href="SIPassets/global/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
        <link href="SIPassets/global/plugins/simple-line-icons/simple-line-icons.min.css" rel="stylesheet" type="text/css" />
        <link href="SIPassets/global/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <link href="SIPassets/global/plugins/bootstrap-switch/css/bootstrap-switch.min.css" rel="stylesheet" type="text/css" />
        <!-- END GLOBAL MANDATORY STYLES -->
        <!-- BEGIN THEME GLOBAL STYLES -->
        <link href="SIPassets/global/css/components.min.css" rel="stylesheet" id="style_components" type="text/css" />
        <link href="SIPassets/global/css/plugins.min.css" rel="stylesheet" type="text/css" />
        <!-- END THEME GLOBAL STYLES -->
        <!-- BEGIN PAGE LEVEL STYLES -->
        <link href="SIPassets/pages/css/error.min.css" rel="stylesheet" type="text/css" />
        <!-- END PAGE LEVEL STYLES -->
        <!-- BEGIN THEME LAYOUT STYLES -->
        <!-- END THEME LAYOUT STYLES -->
        <link rel="shortcut icon" href="favicon.ico" /> 
    <style type="text/css">
        .style1
        {
            color: black;
        }
    </style>

    <script src="SIPassets/global/plugins/jquery.min.js" type="text/javascript"></script>
        <script src="SIPassets/global/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
        <script src="SIPassets/global/plugins/js.cookie.min.js" type="text/javascript"></script>
        <script src="SIPassets/global/plugins/jquery-slimscroll/jquery.slimscroll.min.js" type="text/javascript"></script>
        <script src="SIPassets/global/plugins/jquery.blockui.min.js" type="text/javascript"></script>
        <script src="SIPassets/global/plugins/bootstrap-switch/js/bootstrap-switch.min.js" type="text/javascript"></script>
        <!-- END CORE PLUGINS -->
        <!-- BEGIN THEME GLOBAL SCRIPTS -->
        <script src="SIPassets/global/scripts/app.min.js" type="text/javascript"></script>
</head>
<%--<body>
<form runat="server">
    <div style="background-color: #A52A2A; color: Black; height: 10px;">
    </div>
    <div style="background-color: #F5F5DC; color: White; height: 170px;">
        <div style="padding: 20px;">
            <h3>
                <span class="style1">Application Error:</h3>
            <h4>
                <span class="style1">Sorry, an error occurred while processing your request.</span>
            </h4>
            <h6>
                <asp:Button ID="Button1" runat="server" Text="Back to SIP" 
                    onclick="Button1_Click" /></span></h6>
            <br />
            <br />
        </div>
    </div>
    <div style="background-color: #A52A2A; color: Black; height: 20px;">
    </div>
</form>
</body>--%>
<body class=" page-500-full-page">
        <div class="row">
            <div class="col-md-12 page-500">
                <div class=" number font-red"> 500 </div>
                <div class=" details">
                    <h3>Oops! Something went wrong.</h3>
                    <p> We are fixing it! Please come back in a while.
                        <br/> </p>
                    <p>
                        <a href="~/Dashboard.aspx" class="btn red btn-outline"> Return home </a>
                        <br> </p>
                </div>
            </div>
        </div>
</body>
</html>
