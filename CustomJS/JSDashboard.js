window.load = function () {
    Android.onPageLoadStart();
  
    
}



window.onload = function () {
    Android.onPageLoadComplete();
}

$(document).ready(function () {
    var SPID1 = ReadCookie();
    var Chk = getCookie('typevalue');
    if (Chk == 'M') {
        Android.isBackClicked(true, "Exit");
    }
    CampaignReportVisibility();
    CampaignFill();
    //CampaigncountFill();
    //CampaigncountFill_lead();
    // CampaigncountFill_opportunity();
    // alert("Hello! I am an alert box!!");
    $("#A11").click(function () {   //Redirecting To Dashboard Page In Search campaign div
        waitingDialog.show('Please wait...', { dialogSize: 'sm', progressType: 'warning' });
        var Lblleadcount = $('#Lblleadcount').text();

        if (Lblleadcount.length != 0 && Lblleadcount != '0') {
            var Chk = getCookie('typevalue');

            if (Chk == 'M') {
                loaderStart();
                //Android.onSuccessLogin(UIN, PWD);
                //                window.location.assign("Dashboard.aspx?Type=M");
                window.location.href = "Campaign_Lead1.aspx?Type=M";
                loaderStop();
            } else {
                window.location.href = "Campaign_Lead1.aspx";
               // alert("Lead_Page_Load");
            }
        }

        else {
            toastr.error('No Record Found!');
        }
        waitingDialog.hide();
    });

    $("#al2").click(function () {   //Redirecting To Dashboard Page In Search campaign div
        waitingDialog.show('Please wait...', { dialogSize: 'sm', progressType: 'warning' });
        var LBLopportunity = $('#LBLopportunity').text();

        if (LBLopportunity.length != 0 && LBLopportunity != '0') {
            if (Chk == 'M') {
                loaderStart();

                window.location.href = "Campaign_OpportunityDashBoard.aspx?Type=M";
                loaderStop();
            } else {
                window.location.href = "Campaign_OpportunityDashBoard.aspx";
            }
        }
        else {
            toastr.error('No Record Found!');
        }

        waitingDialog.hide();
    });

    $("#AA1").click(function () {   //Redirecting To Dashboard Page In Search campaign div
        waitingDialog.show('Please wait...', { dialogSize: 'sm', progressType: 'warning' });
        var LBLoverDueFllowup = $('#LBLoverDueFllowup').text();

        if (LBLoverDueFllowup.length != 0 && LBLoverDueFllowup != '0') {
            if (Chk == 'M') {
                loaderStart();

                window.location.href = "OverDue_Fallowup_DashBorad.aspx?Type=M";
                loaderStop();
            } else {
                window.location.href = "OverDue_Fallowup_DashBorad.aspx";
            }
        }
        else {
            toastr.error('No Record Found!');
        }

        waitingDialog.hide();
    });

    $("#AA2").click(function () {   //Redirecting To Dashboard Page In Search campaign div
        waitingDialog.show('Please wait...', { dialogSize: 'sm', progressType: 'warning' });
        var LBLtodaysfallowup = $('#LBLtodaysfallowup').text();

        if (LBLtodaysfallowup.length != 0 && LBLtodaysfallowup != '0') {
            if (Chk == 'M') {
                loaderStart();

                window.location.href = "Campaign_TodayFallowup.aspx?Type=M";
                loaderStop();
            } else {
                window.location.href = "Campaign_TodayFallowup.aspx";
            }
        }
        else {
            toastr.error('No Record Found!');
        }

        waitingDialog.hide();
    });


//});

//ADDED FOR 07-05-2018

$("#AA3").click(function () {   //Redirecting To Dashboard Page In Search campaign div

        waitingDialog.show('Please wait...', { dialogSize: 'sm', progressType: 'warning' });
      
            if (Chk == 'M') {
                loaderStart();

                window.location.href = "Campaign_Working_Sheet.aspx?Type=M";
                loaderStop();
            } 
            else {
                window.location.href = "Campaign_Working_Sheet.aspx";
            }
            waitingDialog.hide();
        });
// }

//       });

     


        $("#AA4").click(function () {   //Redirecting To Dashboard Page In Search campaign div
            waitingDialog.show('Please wait...', { dialogSize: 'sm', progressType: 'warning' });

            if (Chk == 'M') {
                loaderStart();

                window.location.href = "Campaign.aspx?Type=M";
                loaderStop();
            } else {
                window.location.href = "Campaign.aspx";
            }
            waitingDialog.hide();
            //        }

 });

//        });

        $("#AA5").click(function () {   //Redirecting To Dashboard Page In Search campaign div
            waitingDialog.show('Please wait...', { dialogSize: 'sm', progressType: 'warning' });

            if (Chk == 'M') {
                loaderStart();

                window.location.href = "Enter_Contact.aspx?Type=M";
                loaderStop();
            } else {
                window.location.href = "Enter_Contact.aspx";
            }
            waitingDialog.hide();
//              }
});


});




function CampaignReportVisibility() {    
    //waitingDialog.show('Please wait....', { dialogSize: 'sm', progressType: 'warning' });
    var UID = ReadCookie();
    $.ajax({
        type: 'POST',
        url: "./WebMethods/WcCampaign.asmx/CampaignReportVisibility",
        contentType: "application/json; charset=utf-8",
        data: '{"UserId":"' + UID + '"}',
        dataType: "json",
        async: false,
        success: (function (data) {
            $(data.d).each(function (index, obj) {
                if (obj.ReportVisible == "1") {
                    $("#CampaignReport").css('display', 'block');
                }
                else {
                    $("#CampaignReport").css('display', 'none');
                }
            })
            if (data.d == '') {
                waitingDialog.hide();
            }
            else {
                waitingDialog.hide();
            }
        }),
        error: (function () {
            toastr.error('Something Gone Wrong....');
            waitingDialog.hide();
        })
    });
    waitingDialog.hide();
}

function ReadCookie() {
    var cookieValue = getCook('CRMCookiesLoginInfo');
    var allcookies = cookieValue;
    var ID = '';

    //Get all the cookies pairs in an array
    cookiearray = allcookies.split('&');

    // Now take key value pair out of this array
    for (var i = 0; i < cookiearray.length; i++) {
        name = cookiearray[i].split('=')[0];
        value = cookiearray[i].split('=')[1];
        ID = cookiearray[i].split('=')[2];
        if (name == 'UserID') {
            return value;
        }
    }
}

function getCook(cookiename) {
    // Get name followed by anything except a semicolon
    var cookiestring = RegExp("" + cookiename + "[^;]+").exec(document.cookie);
    // Return everything after the equal sign, or an empty string if the cookie name not found
    return unescape(!!cookiestring ? cookiestring.toString().replace(/^[^=]+./, "") : "");
}

function getCookie(cname) {
    var name = cname + "=";
    var ca = document.cookie.split('&');
    for (var i = 0; i < ca.length; i++) {
        var c = ca[i];
        while (c.charAt(0) == ' ') {
            c = c.substring(1);
        }
        if (c.indexOf(name) == 0) {
            return c.substring(name.length, c.length);
        }
    }
    return "";
}

//Coding For Search Div Start
function CampaignFill() {    //To Bind Campaigns in Search div
    var UID = ReadCookie();
    $.ajax({
        type: 'POST',
        url: "./WebMethods/DashBoard.asmx/BindContactCount",
        dataType: "json",
        contentType: "application/json; charset=utf-8",
        data: '{"UserId":"' + UID + '"}',
        type: "POST",
        async: false,
        success: function (res) {
            console.debug(res)
            $.each(res.d, function (name, item) {
                //alert(item.lblCount);
                $("#lblCount").text(item.lblCount);
                $("#lblCamcount").text(item.lblCamcount);
                $("#Lblleadcount").text(item.Lblleadcount);
                $("#LBLopportunity").text(item.Lblopportunity);
                $("#LBLoverDueFllowup").text(item.Lbloverdue);
                $("#LBLtodaysfallowup").text(item.Lbltodays);
               
                
            })
        },


        error: function (response) {
        },
        failure: function (response) {
        }
    });
}
//    function CampaigncountFill() {    //To Bind Campaigns in Search div
//    var UID = ReadCookie();
//    $.ajax({
//        type: 'POST',
//        url: "./WebMethods/DashBoard.asmx/BindCampaingCount",
//        dataType: "json",
//        contentType: "application/json; charset=utf-8",
//        data: '{"UserId":"' + UID + '"}',
//        type: "POST",
//        async: false,
//        success: function (res) {
//            console.debug(res)
//            $.each(res.d, function (name, item) {
//                //alert(item.lblCount);
//                $("#lblCamcount").text(item.lblCamcount);
//            })
//        },
//        error: function (response) {
//        },
//        failure: function (response) {
//        }
//    });

//}

//function CampaigncountFill_lead() {    //To Bind Campaigns in Search div
//    var UID = ReadCookie();
//    $.ajax({
//        type: 'POST',
//        url: "./WebMethods/DashBoard.asmx/BindCampaingLeadCount",
//        dataType: "json",
//        contentType: "application/json; charset=utf-8",
//        data: '{"UserId":"' + UID + '"}',
//        type: "POST",
//        async: false,
//        success: function (res) {
//            console.debug(res)
//            $.each(res.d, function (name, item) {
//                //alert(item.lblCount);
//                $("#Lblleadcount").text(item.Lblleadcount);
//            })
//        },
//        error: function (response) {
//        },
//        failure: function (response) {
//        }
//    });
//}
//    function CampaigncountFill_opportunity() {    //To Bind Campaigns in Search div
//    var UID = ReadCookie();
//    $.ajax({
//        type: 'POST',
//        url: "./WebMethods/DashBoard.asmx/BindCampaingOPPORTUNITYCount",
//        dataType: "json",
//        contentType: "application/json; charset=utf-8",
//        data: '{"UserId":"' + UID + '"}',
//        type: "POST",
//        async: false,
//        success: function (res) {
//            console.debug(res)
//            $.each(res.d, function (name, item) {
//                //alert(item.lblCount);
//                $("#LBLopportunity").text(item.Lblopportunity);
//            })
//        },
//        error: function (response) {
//        },
//        failure: function (response) {
//        }
//    });

//}
