window.load = function () {
    Android.onPageLoadStart();
}
window.onload = function () {
    Android.onPageLoadComplete();
}

function loaderStart() {
    Android.onPageLoadStart();
}

function loaderStop() {
    Android.onPageLoadComplete();
}

$(document).ready(function () {

    $('#username').keyup(function () {
        var username = document.getElementById("username").value;
        if (username == "") {
            $("#username").addClass('errorClass');
        }
        else {
            $("#username").addClass('sucessClass');
            $("#diverror").css('display', 'none');
        }
    });

    $('#password1').keyup(function () {
        var Password = document.getElementById("password1").value;
        if (Password == "") {
            $("#password1").addClass('errorClass');
        }
        else {
            $("#password1").addClass('sucessClass');
            $("#diverror").css('display', 'none');
        }
    });
    var Type = getquerystring('Type');
    if (Type == 'M') {
        Android.isBackClicked(true, "Exit");
    }

    $("#diverror").css('display', 'none');

    $('#btnlogin').click(function () {
        if ((document.getElementById('username').value == "") || (document.getElementById('password1').value == "")) 
        {
            $("#username").addClass('errorClass');
            $("#password1").addClass('errorClass');
            $("#diverror").css('display', 'block');
            document.getElementById('lblerrormsg').innerHTML = 'Enter Username and Password';

        }
        else 
        {
            loginProcess(Type);
           
            
        }
    });
});

function loginProcess(Type) {

    username = document.getElementById('username').value;
    password = document.getElementById('password1').value;
    $.ajax({
        type: 'POST',
        url: "./WebMethods/WM_Login.asmx/getLoginDetails",
        contentType: "application/json; charset=utf-8",
        data: '{"Username":"' + username + '", "password": "' + password + '", "Typevalue": "' + Type + '"}',
        dataType: "json",
        async: false,
        success: (function (data) {
            $(data.d).each(function (index, obj) {
               
              
                $('#lbluserid').val(obj.Userid);
            
               
             
                var UIN = obj.username;
                var PWD = obj.password;

                if (obj.ReturnMessage == "Success") {
                    var Chk = getCookie('typevalue');

                    if (Chk == 'M') {
                        loaderStart();
                        Android.onSuccessLogin(UIN, PWD);
                        window.location.assign("Dashboard.aspx?Type=M");
                        loaderStop();
                    }
                    else {
                        window.location.assign("Dashboard.aspx");
                    }

                }
            })
            if (data.d == '') {
                $("#diverror").css('display', 'block');
                document.getElementById('lblerrormsg').innerHTML = "Invalid Username Or Password";
            }

        }),
        error: (function () {

        })
    });

}






function getquerystring(name, url) {
    if (!url) {
        url = window.location.href;
    }
    name = name.replace(/[\[\]]/g, "\\$&");
    var regex = new RegExp("[?&]" + name + "(=([^&#]*)|&|#|$)"),
        results = regex.exec(url);
    if (!results) return null;
    if (!results[2]) return '';
    return decodeURIComponent(results[2].replace(/\+/g, " "));
}

//function getCookie(cname) {
//    var name = cname + "=";
//    var ca = document.cookie.split('&');
//    for (var i = 0; i < ca.length; i++) {
//        var c = ca[i];
//        while (c.charAt(0) == ' ') {
//            c = c.substring(1);
//        }
//        if (c.indexOf(name) == 0) {
//            return c.substring(name.length, c.length);
//        }
//    }
//    return "";
//}


//Cookie Functions Start

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

//Cookie Functions End 
