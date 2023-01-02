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
window.onerror = stoperror();

function stoperror() {
    return true;
}

$(document).ready(function () {


    $("#acontact").click(function () {
        waitingDialog.show('Please wait...', { dialogSize: 'sm', progressType: 'warning' });
        window.location.assign("Enter_Contact.aspx");
        waitingDialog.hide();

    });

    $("#acampaign").click(function () {
        waitingDialog.show('Please wait...', { dialogSize: 'sm', progressType: 'warning' });
        window.location.assign("Campaign.aspx");
        waitingDialog.hide();
    });

    $("#aHome").click(function () {
        waitingDialog.show('Please wait...', { dialogSize: 'sm', progressType: 'warning' });
        window.location.assign("Dashboard.aspx");
        waitingDialog.hide();
    });

    $("#alogout").click(function () {
        waitingDialog.show('Please wait...', { dialogSize: 'sm', progressType: 'warning' });
        window.location.assign("Login.aspx");
        Android.onPageLogout();
        waitingDialog.hide();

    });

});

function getCookie(cname) {
    var name = cname + "=";
    var ca = document.cookie.split('&');
    //  alert('ca valy'+ca);
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

