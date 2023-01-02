jQuery(window).load(function () {
    var Chk = getParameterByName('Type');

    if (Chk == 'M') {

        Android.onPageLoadComplete(false);
    }


});

function loaderStop() {
    Android.onPageLoadComplete(false);

};


function pageLogout() {
    Android.onPageLogout();

};


function CHKType() {

    var Type = getParameterByName('typevalue');

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


