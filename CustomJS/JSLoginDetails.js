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
    var Type = getquerystring('Type');
    loginProcess(Type);
    alert(Type);
});


function loginProcess(Type) {

   var username = getquerystring('UIN');
    var password = getquerystring('PWD');
    $.ajax({
        type: 'POST',
        url: "./WebMethods/WM_Login.asmx/getLoginDetails",
        contentType: "application/json; charset=utf-8",
        data: '{"Username":"' + username + '", "password": "' + password + '", "Typevalue": "' + Type + '"}',
        dataType: "json",
        //async: false,
        success: (function (data) {
            $(data.d).each(function (index, obj) {

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

function getParameterByName(name) {
    var url = window.location.href;
    name = name.replace(/[\[\]]/g, "\\$&");
    var regex = new RegExp("[?&]" + name + "(=([^&#]*)|&|#|$)"),
        results = regex.exec(url);
    if (!results) return null;
    if (!results[2]) return '';
    return decodeURIComponent(results[2].replace(/\+/g, " "));
}