<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta charset="utf-8" />
    <title>CRM | Login</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />
    <meta http-equiv="Content-type" content="text/html; charset=utf-8">
    <meta content="" name="description" />
    <meta content="" name="author" />

    <link rel="stylesheet" type="text/css" href="assets/css/loginNew.css" />
    <link rel="stylesheet" type="text/css" href="APPJS/SIPExternal.css" />
    <link rel="stylesheet" type="text/css" href="assets/css/customized.css" />
    <!-- BEGIN CORE PLUGINS -->
    <link href="assets/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <link href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700&subset=all" rel="stylesheet" type="text/css" />
    <link href="assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <script src="assets/plugins/jquery-1.10.2.min.js" type="text/javascript"></script>
    <script src="assets/plugins/jquery-migrate-1.2.1.min.js" type="text/javascript"></script>

    <script src="assets/plugins/jquery-ui/jquery-ui-1.10.3.custom.min.js" type="text/javascript"></script>
    <script src="assets/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="assets/plugins/jquery-slimscroll/jquery.slimscroll.min.js" type="text/javascript"></script>
    <script src="assets/plugins/jquery.blockui.min.js" type="text/javascript"></script>
    <script src="assets/plugins/jquery.cokie.min.js" type="text/javascript"></script>
    <script src="assets/plugins/uniform/jquery.uniform.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="assets/scripts/core/app.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js" type="text/javascript"></script>
    <script src="assets/js/jquery.scrolltabs.js" type="text/javascript"></script>
    <script src="assets/js/jquery.mousewheel.js" type="text/javascript"></script>
    <script src="assets/js/slick.js" type="text/javascript" charset="utf-8"></script>
   
    <script src="SIPassets/global/plugins/jquery.min.js" type="text/javascript"></script>
    <script src="SIPassets/global/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="SIPassets/global/plugins/js.cookie.min.js" type="text/javascript"></script>

    <script src="SIPassets/global/plugins/jquery-slimscroll/jquery.slimscroll.min.js" type="text/javascript"></script>
    <script src="SIPassets/global/plugins/jquery.blockui.min.js" type="text/javascript"></script>
    <script src="SIPassets/global/plugins/bootstrap-switch/js/bootstrap-switch.min.js" type="text/javascript"></script>
    <script src="SIPassets/global/plugins/moment.min.js" type="text/javascript"></script>
    <script src="SIPassets/global/scripts/app.min.js" type="text/javascript"></script>

    <script src="SIPassets/layouts/layout/scripts/layout.min.js" type="text/javascript"></script>
    <script src="SIPassets/layouts/layout/scripts/demo.min.js" type="text/javascript"></script>

    <link rel="shortcut icon" href="favicon.ico" />
    <link href="assets/css/icon.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="CustomJS/Login.js"></script>
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

</head>
<body id="a">
 <input type="hidden" id="lbluserid" />
    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
        <div class="col-lg-4 col-md-4 col-sm-4 col-xs-0">
        </div>
        <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
            <div class="content" style="height: auto">
                <!-- BEGIN LOGIN FORM -->
                <form id="Form1" runat="server">
                <%--<div class="robololo">
                    <img src="assets/img/logo/robomateplus_logo.png" height="58" />
                </div>--%>
                <div class="rblogin" id="divLogIn" runat="server" style="">
                    <asp:HiddenField ID="type" runat="server" />
                <div class="diverror">
                    <div class="alert alert-danger" id="diverror">
                            <strong style="color: Red;"><i class="icon-remove"></i>Error!</strong>
                            <label id="lblerrormsg"  Text="Label" ForeColor="Red"></label>
                    </div>
                </div>
                   <%-- <div class="form-group">--%>
                        <div class="input-icon">
                            <input class="form-control placeholder-no-fix" type="text" runat="server" autocomplete="off"
                                placeholder="Username" id="username" name="username" />
                        </div>
                    <%--</div>--%>
                   <%-- <div class="form-group">--%>
                        <div class="input-icon">
                            <input class="form-control placeholder-no-fix" type="password" runat="server" autocomplete="off"
                                placeholder="password" id="password1" name="password1" required onkeydown="if (event.keyCode == 13){document.getElementById('btnlogin').click(); return false;}" />
                        </div>
                    <%--</div>--%>
                    <div>
                        <input type="button" id="btnlogin" value="Login" />
             
                        <%--<input type="button" id="forgotpassword" value="Forgot Password?" runat="server" onserverclick="btnForgetPassword_ServerClick"  />--%>
                    </div>
                </div>
                <div class="rblogin" runat="server" id="divForgetPassword" visible="false">
                    <div class="form-group">
                        <input class="form-control placeholder-no-fix" type="text" autocomplete="off" placeholder="Registered Username"
                            runat="server" id="txtUserName" name="Username" />
                        <br />
                        <p style="color: White;">
                            Or</p>
                        <input class="form-control placeholder-no-fix" type="text" autocomplete="off" placeholder="UserID"
                            name="UserID" runat="server" id="txtUserID" />
                    </div>
                    <div class="form-actions">
                          
                        <input type="button" id="btnForgotPasswordSubmit"  value="Submit" runat="server" />
                        <input type="button" id="btnBack"  value="Back" runat="server" OnClick="btnBack_Click"  />  

                        <%--<asp:Button class="btn green btn-outline" ID="btnBack"  Text="Back"
                             />
                        <asp:Button class="btn green uppercase pull-right" ID="btnForgotPasswordSubmit" 
                            Text="Submit"  />--%>
                    </div>
                </div>
                <div class="alert alert-danger" id="divPasswordSendMessage" visible="false" runat="server">
                    <button type="button" class="close" data-dismiss="alert">
                        <i class="icon-remove"></i>
                    </button>
                    <p>
                        <asp:Label ID="Label1" runat="server" Text="Label" ForeColor="Green">
                                Login credentials has been sent to your Registered Mobile number and Email.
                        </asp:Label>
                    </p>
                </div>
                </form>
            </div>
        </div>
        <div class="col-lg-4 col-md-4 col-sm-4 col-xs-0">
        </div>
    </div>
</body>
</html>
