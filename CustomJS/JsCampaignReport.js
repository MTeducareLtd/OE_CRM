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

function NumberOnly() {
    var AsciiValue = event.keyCode
    if ((AsciiValue >= 48 && AsciiValue <= 57) || (AsciiValue == 8 || AsciiValue == 127))
        event.returnValue = true;
    else
        event.returnValue = false;
}

var ConId;
var Campaign;

$(document).ready(function () {
    toastr.options = {   //for Close Button in toaster
        "closeButton": true
    };

    ReadConfigSettings();
    var key = document.getElementById("lblCampaignDetailcode").value;
    //alert('hi123-' + key);

    var Chk = getCookie('typevalue');
    if (Chk == 'M') {
        Android.isBackClicked(true, "http://oe.mteducare.com/oe_crm/Dashboard.aspx");
    }

    CampaignReportVisibility();
});

function CampaignReportVisibility() {
    waitingDialog.show('Please wait....', { dialogSize: 'sm', progressType: 'warning' });
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
                    CampaignReport();
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

//CamapignZonewisedata
function CamapignZonewisedata(objthis) {    
    var Campid = $(objthis).attr('data');
    $('#Zonewise_' + Campid).append('<tr><th style="background-color:skyblue;" colspan="2"><b>Zonewise Concise Contact Status</b></th></tr>');
    $('#Zonewise_' + Campid).append('<tr><td style="width:50%;">hi</td><td style="width:50%;">' + Campid + '</td></tr>');
}

function CampaignReport() {  //To fill grid on Campaign tile click    
    waitingDialog.show('Please wait....', { dialogSize: 'sm', progressType: 'warning' });
    var UID = ReadCookie();
    var i = 0,j=0;
    $.ajax({
        type: 'POST',
        url: "./WebMethods/WcCampaign.asmx/CampaignReport",
        contentType: "application/json; charset=utf-8",
        data: '{"UserId":"' + UID + '"}',
        dataType: "json",
        async: false,
        success: (function (data) {
            $('#TCampaignAssigned').html('');
            $(data.d).each(function (index, obj) {
                j++;
                if (i == '0') {
                    //                    $('#TCampaignAssigned').append('<tr><td style="width:100%;"><div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" style="cursor: pointer" data="' + obj.CampaignId + '"><div class="dashboard-stat blue" id="divstatblue" ><div class="visual"> <i class="icon-groupmine_empty"></i></div> <div class="details"><div class="desc"> <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">' + obj.Campaign_Name + '</div><div class="col-lg-12 col-md-12 col-sm-12 col-xs-12"></div></div></div></div></div>');
                    //                    $('#TCampaignAssigned').append('</td></tr>');
                    //$('#TCampaignAssigned').append('<tr><td style="width:100%;"><div class="panel-group accordion" id="accordion' + j + '"><div ><div class="panel-heading"><h4 class="panel-title col-lg-12 col-md-12 col-sm-12 col-xs-12"><a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion' + j + '" href="#collapse_' + j + '"><div class="dashboard-stat blue" id="divstatblue"><div class="visual"> <i class="icon-groupmine_empty"></i></div> <div class="details"><div class="desc"> <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12"><b>' + obj.Campaign_Name + '</b></div><div class="col-lg-12 col-md-12 col-sm-12 col-xs-12"></div></div></div></div></a></h4></div>');
                    //$('#TCampaignAssigned').append('<tr onclick="CamapignZonewisedata(this);" data="' + obj.CampaignId + '"><td style="width:100%;"><div class="panel-group accordion" id="accordion' + j + '"><div ><div class="panel-heading"><h4 class="panel-title col-lg-12 col-md-12 col-sm-12 col-xs-12"><a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion' + j + '" href="#collapse_' + j + '"><div class="dashboard-stat blue" style="margin-bottom: 5px;"><div class="visual" style="height:20px;"></div> <div class="details"><div class="desc"><div class="col-lg-12 col-md-12 col-sm-12 col-xs-12"><b>' + obj.Campaign_Name + '</b></div></div></div></div></a></h4></div>');
                    $('#TCampaignAssigned').append('<tr><td style="width:100%;"><div class="panel-group accordion" id="accordion' + j + '"><div ><div class="panel-heading"><h4 class="panel-title col-lg-12 col-md-12 col-sm-12 col-xs-12"><a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion' + j + '" href="#collapse_' + j + '"><div class="dashboard-stat blue" style="margin-bottom: 5px;"><div class="visual" style="height:20px;"></div> <div class="details"><div class="desc"><div class="col-lg-12 col-md-12 col-sm-12 col-xs-12"><b>' + obj.Campaign_Name + '</b></div></div></div></div></a></h4></div>');
                    //$('#TCampaignAssigned').append('<tr><td style="width:100%;"><div class="panel-group accordion" id="accordion' + j + '"><div ><div class="panel-heading"><h4 class="panel-title col-lg-12 col-md-12 col-sm-12 col-xs-12"><a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion' + j + '" href="#collapse_' + j + '"><div class="dashboard-stat blue" id="divstatblue"><b>' + obj.Campaign_Name + '</b></div></a></h4></div>');
                    //$('#TCampaignAssigned').append('<div id="collapse_' + j + '" class="panel-collapse collapse "><div id="divadvancesearchbody' + j + '" class="panel-body col-lg-12 col-md-12 col-sm-12 col-xs-12"><table class="table table-striped table-bordered table-advance table-hover"><th style="background-color:skyblue;" colspan="2"><b>Concise Contact Status</b></th><tr><td style="width: 50%;"><b>Total Contacts</b></td><td style="width: 50%;"><b>' + obj.TotalContacts + '</b></td></tr><tr><td style="width: 50%;"><b>Not Called Even Once</b></td><td style="width: 50%;"><b>' + obj.NotCalledEvenOnce + '</b></td></tr><tr><td style="width: 50%;"><b>Called but not converted to Lead</b></td><td style="width: 50%;"><b>' + obj.CalledbutnotConvertedtoLead + '</b></td></tr><tr><td style="width: 50%;"><b>Available Leads</b></td><td style="width: 50%;"><b>' + obj.AvailableLeads + '</b></td></tr><tr><td style="width: 50%;"><b>Available Opportunity</b></td><td style="width: 50%;"><b>' + obj.AvailableOpportunity + '</b></td></tr><tr><td style="width: 50%;"><b>Account</b></td><td style="width: 50%;"><b>' + obj.Account + '</b></td></tr></table><table class="table table-striped table-bordered table-advance table-hover"><th style="background-color:skyblue;" colspan="2"><b>Follow Up Status</b></th><tr><td style="width: 50%;"><b>Todays Follow up</b></td><td style="width: 50%;"><b>' + obj.TodaysFollowup + '</b></td></tr><tr><td style="width: 50%;"><b>Yesterday Pending Followup</b></td><td style="width: 50%;"><b>' + obj.YesterdaysPendingFollowup + '</b></td></tr><tr><td style="width: 50%;"><b>Next 7 Days Followup</b></td><td style="width: 50%;"><b>' + obj.Next7DaysFollowup + '</b></td></tr><tr><td style="width: 50%;"><b>Previous 7 Days Pending Followup</b></td><td style="width: 50%;"><b>' + obj.Prev7DaysFollowup + '</b></td></tr><tr><td style="width: 50%;"><b>Next 30 Days Followup</b></td><td style="width: 50%;"><b>' + obj.Next30DaysFollowup + '</b></td></tr><tr><td style="width: 50%;"><b>Previous 30 Days Pending Followup</b></td><td style="width: 50%;"><b>' + obj.Prev30DaysFollowup + '</b></td></tr></table><table class="table table-striped table-bordered table-advance table-hover"><tbody id="Zonewise_' + obj.CampaignId + '"></tbody></table></div></div>');                                        
                    $('#TCampaignAssigned').append('<div id="collapse_' + j + '" class="panel-collapse collapse "><div id="divadvancesearchbody' + j + '" class="panel-body col-lg-12 col-md-12 col-sm-12 col-xs-12"><table class="table table-striped table-bordered table-advance table-hover"><th style="background-color:skyblue;" colspan="2"><b>Concise Contact Status</b></th><tr><td style="width: 50%;"><b>Total Contacts</b></td><td style="width: 50%;"><b>' + obj.TotalContacts + '</b></td></tr><tr><td style="width: 50%;"><b>Not Called Even Once</b></td><td style="width: 50%;"><b>' + obj.NotCalledEvenOnce + '</b></td></tr><tr><td style="width: 50%;"><b>Called but not converted to Lead</b></td><td style="width: 50%;"><b>' + obj.CalledbutnotConvertedtoLead + '</b></td></tr><tr><td style="width: 50%;"><b>Available Leads</b></td><td style="width: 50%;"><b>' + obj.AvailableLeads + '</b></td></tr><tr><td style="width: 50%;"><b>Available Opportunity</b></td><td style="width: 50%;"><b>' + obj.AvailableOpportunity + '</b></td></tr><tr><td style="width: 50%;"><b>Account</b></td><td style="width: 50%;"><b>' + obj.Account + '</b></td></tr></table><table class="table table-striped table-bordered table-advance table-hover"><th style="background-color:skyblue;" colspan="2"><b>Follow Up Status</b></th><tr><td style="width: 50%;"><b>Todays Follow up</b></td><td style="width: 50%;"><b>' + obj.TodaysFollowup + '</b></td></tr><tr><td style="width: 50%;"><b>Yesterday Pending Followup</b></td><td style="width: 50%;"><b>' + obj.YesterdaysPendingFollowup + '</b></td></tr><tr><td style="width: 50%;"><b>Next 7 Days Followup</b></td><td style="width: 50%;"><b>' + obj.Next7DaysFollowup + '</b></td></tr><tr><td style="width: 50%;"><b>Previous 7 Days Pending Followup</b></td><td style="width: 50%;"><b>' + obj.Prev7DaysFollowup + '</b></td></tr><tr><td style="width: 50%;"><b>Next 30 Days Followup</b></td><td style="width: 50%;"><b>' + obj.Next30DaysFollowup + '</b></td></tr><tr><td style="width: 50%;"><b>Previous 30 Days Pending Followup</b></td><td style="width: 50%;"><b>' + obj.Prev30DaysFollowup + '</b></td></tr></table></div></div>');                                        
                    $('#TCampaignAssigned').append('</td></tr>');
                    i++;
                }
                else if (i == '1') {
                    // $('#TCampaignAssigned').append('<tr><td style="width:100%;"><div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" style="cursor: pointer" onclick="Camapigndata(this);" data="' + obj.CampaignId + '"><div class="dashboard-stat purple" id="divstatpurple" ><div class="visual"> <i class="icon-groupmine_empty"></i></div> <div class="details"><div class="desc"> <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">' + obj.Campaign_Name + '</div><div class="col-lg-12 col-md-12 col-sm-12 col-xs-12"></div></div></div></div></div> </td></tr>');
                    $('#TCampaignAssigned').append('<tr><td style="width:100%;"><div class="panel-group accordion" id="accordion' + j + '"><div ><div class="panel-heading"><h4 class="panel-title col-lg-12 col-md-12 col-sm-12 col-xs-12"><a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion' + j + '" href="#collapse_' + j + '"><div class="dashboard-stat purple" style="margin-bottom: 5px;"><div class="visual" style="height:20px;"></div> <div class="details"><div class="desc"><div class="col-lg-12 col-md-12 col-sm-12 col-xs-12"><b>' + obj.Campaign_Name + '</b></div></div></div></div></a></h4></div>');
                    //$('#TCampaignAssigned').append('<tr><td style="width:100%;"><div class="panel-group accordion" id="accordion' + j + '"><div class=""><div class="panel-heading"><h4 class="panel-title col-lg-12 col-md-12 col-sm-12 col-xs-12"><a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion' + j + '" href="#collapse_' + j + '"><div class="dashboard-stat purple" id="divstatpurple"><div class="visual"> <i class="icon-groupmine_empty"></i></div> <div class="details"><div class="desc"> <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12"><b>' + obj.Campaign_Name + '</b></div><div class="col-lg-12 col-md-12 col-sm-12 col-xs-12"></div></div></div></div></a></h4></div>');
                    $('#TCampaignAssigned').append('<div id="collapse_' + j + '" class="panel-collapse collapse "><div id="divadvancesearchbody' + j + '" class="panel-body col-lg-12 col-md-12 col-sm-12 col-xs-12"><table class="table table-striped table-bordered table-advance table-hover"><th style="background-color:skyblue;" colspan="2"><b>Concise Contact Status</b></th><tr><td style="width: 50%;"><b>Total Contacts</b></td><td style="width: 50%;"><b>' + obj.TotalContacts + '</b></td></tr><tr><td style="width: 50%;"><b>Not Called Even Once</b></td><td style="width: 50%;"><b>' + obj.NotCalledEvenOnce + '</b></td></tr><tr><td style="width: 50%;"><b>Called but not converted to Lead</b></td><td style="width: 50%;"><b>' + obj.CalledbutnotConvertedtoLead + '</b></td></tr><tr><td style="width: 50%;"><b>Available Leads</b></td><td style="width: 50%;"><b>' + obj.AvailableLeads + '</b></td></tr><tr><td style="width: 50%;"><b>Available Opportunity</b></td><td style="width: 50%;"><b>' + obj.AvailableOpportunity + '</b></td></tr><tr><td style="width: 50%;"><b>Account</b></td><td style="width: 50%;"><b>' + obj.Account + '</b></td></tr></table><table class="table table-striped table-bordered table-advance table-hover"><th style="background-color:skyblue;" colspan="2"><b>Follow Up Status</b></th><tr><td style="width: 50%;"><b>Todays Follow up</b></td><td style="width: 50%;"><b>' + obj.TodaysFollowup + '</b></td></tr><tr><td style="width: 50%;"><b>Yesterday Pending Followup</b></td><td style="width: 50%;"><b>' + obj.YesterdaysPendingFollowup + '</b></td></tr><tr><td style="width: 50%;"><b>Next 7 Days Followup</b></td><td style="width: 50%;"><b>' + obj.Next7DaysFollowup + '</b></td></tr><tr><td style="width: 50%;"><b>Previous 7 Days Pending Followup</b></td><td style="width: 50%;"><b>' + obj.Prev7DaysFollowup + '</b></td></tr><tr><td style="width: 50%;"><b>Next 30 Days Followup</b></td><td style="width: 50%;"><b>' + obj.Next30DaysFollowup + '</b></td></tr><tr><td style="width: 50%;"><b>Previous 30 Days Pending Followup</b></td><td style="width: 50%;"><b>' + obj.Prev30DaysFollowup + '</b></td></tr></table></div></div>');                                        
                    $('#TCampaignAssigned').append('</td></tr>');
                    i++;
                }
                else if (i == '2') {
                    //$('#TCampaignAssigned').append('<tr><td style="width:100%; "><div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" style="cursor: pointer" onclick="Camapigndata(this);" data="' + obj.CampaignId + '"><div class="dashboard-stat pink2" id="divstatpink2" ><div class="visual"> <i class="icon-groupmine_empty"></i></div> <div class="details"><div class="desc"> <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">' + obj.Campaign_Name + '</div><div class="col-lg-12 col-md-12 col-sm-12 col-xs-12"></div></div></div></div></div> </td></tr>');
                    $('#TCampaignAssigned').append('<tr><td style="width:100%;"><div class="panel-group accordion" id="accordion' + j + '"><div ><div class="panel-heading"><h4 class="panel-title col-lg-12 col-md-12 col-sm-12 col-xs-12"><a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion' + j + '" href="#collapse_' + j + '"><div class="dashboard-stat pink2" style="margin-bottom: 5px;"><div class="visual" style="height:20px;"></div> <div class="details"><div class="desc"><div class="col-lg-12 col-md-12 col-sm-12 col-xs-12"><b>' + obj.Campaign_Name + '</b></div></div></div></div></a></h4></div>');
                    //$('#TCampaignAssigned').append('<tr><td style="width:100%;"><div class="panel-group accordion" id="accordion' + j + '"><div class=""><div class="panel-heading"><h4 class="panel-title col-lg-12 col-md-12 col-sm-12 col-xs-12"><a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion' + j + '" href="#collapse_' + j + '"><div class="dashboard-stat pink2" id="divstatpink2"><div class="visual"> <i class="icon-groupmine_empty"></i></div> <div class="details"><div class="desc"> <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12"><b>' + obj.Campaign_Name + '</b></div><div class="col-lg-12 col-md-12 col-sm-12 col-xs-12"></div></div></div></div></a></h4></div>');
                    $('#TCampaignAssigned').append('<div id="collapse_' + j + '" class="panel-collapse collapse "><div id="divadvancesearchbody' + j + '" class="panel-body col-lg-12 col-md-12 col-sm-12 col-xs-12"><table class="table table-striped table-bordered table-advance table-hover"><th style="background-color:skyblue;" colspan="2"><b>Concise Contact Status</b></th><tr><td style="width: 50%;"><b>Total Contacts</b></td><td style="width: 50%;"><b>' + obj.TotalContacts + '</b></td></tr><tr><td style="width: 50%;"><b>Not Called Even Once</b></td><td style="width: 50%;"><b>' + obj.NotCalledEvenOnce + '</b></td></tr><tr><td style="width: 50%;"><b>Called but not converted to Lead</b></td><td style="width: 50%;"><b>' + obj.CalledbutnotConvertedtoLead + '</b></td></tr><tr><td style="width: 50%;"><b>Available Leads</b></td><td style="width: 50%;"><b>' + obj.AvailableLeads + '</b></td></tr><tr><td style="width: 50%;"><b>Available Opportunity</b></td><td style="width: 50%;"><b>' + obj.AvailableOpportunity + '</b></td></tr><tr><td style="width: 50%;"><b>Account</b></td><td style="width: 50%;"><b>' + obj.Account + '</b></td></tr></table><table class="table table-striped table-bordered table-advance table-hover"><th style="background-color:skyblue;" colspan="2"><b>Follow Up Status</b></th><tr><td style="width: 50%;"><b>Todays Follow up</b></td><td style="width: 50%;"><b>' + obj.TodaysFollowup + '</b></td></tr><tr><td style="width: 50%;"><b>Yesterday Pending Followup</b></td><td style="width: 50%;"><b>' + obj.YesterdaysPendingFollowup + '</b></td></tr><tr><td style="width: 50%;"><b>Next 7 Days Followup</b></td><td style="width: 50%;"><b>' + obj.Next7DaysFollowup + '</b></td></tr><tr><td style="width: 50%;"><b>Previous 7 Days Pending Followup</b></td><td style="width: 50%;"><b>' + obj.Prev7DaysFollowup + '</b></td></tr><tr><td style="width: 50%;"><b>Next 30 Days Followup</b></td><td style="width: 50%;"><b>' + obj.Next30DaysFollowup + '</b></td></tr><tr><td style="width: 50%;"><b>Previous 30 Days Pending Followup</b></td><td style="width: 50%;"><b>' + obj.Prev30DaysFollowup + '</b></td></tr></table></div></div>');                                        
                    $('#TCampaignAssigned').append('</td></tr>');
                    i++;
                }
                else if (i == '3') {
                    //$('#TCampaignAssigned').append('<tr><td style="width:100%; "><div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" style="cursor: pointer" onclick="Camapigndata(this);" data="' + obj.CampaignId + '"><div class="dashboard-stat mint" id="divstatmint"><div class="visual"> <i class="icon-groupmine_empty"></i></div> <div class="details"><div class="desc"> <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">' + obj.Campaign_Name + '</div><div class="col-lg-12 col-md-12 col-sm-12 col-xs-12"></div></div></div></div></div> </td></tr>');
                    $('#TCampaignAssigned').append('<tr><td style="width:100%;"><div class="panel-group accordion" id="accordion' + j + '"><div ><div class="panel-heading"><h4 class="panel-title col-lg-12 col-md-12 col-sm-12 col-xs-12"><a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion' + j + '" href="#collapse_' + j + '"><div class="dashboard-stat mint" style="margin-bottom: 5px;"><div class="visual" style="height:20px;"></div> <div class="details"><div class="desc"><div class="col-lg-12 col-md-12 col-sm-12 col-xs-12"><b>' + obj.Campaign_Name + '</b></div></div></div></div></a></h4></div>');
                    //$('#TCampaignAssigned').append('<tr><td style="width:100%;"><div class="panel-group accordion" id="accordion' + j + '"><div class=""><div class="panel-heading"><h4 class="panel-title col-lg-12 col-md-12 col-sm-12 col-xs-12"><a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion' + j + '" href="#collapse_' + j + '"><div class="dashboard-stat mint" id="divstatmint"><div class="visual"> <i class="icon-groupmine_empty"></i></div> <div class="details"><div class="desc"> <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12"><b>' + obj.Campaign_Name + '</b></div><div class="col-lg-12 col-md-12 col-sm-12 col-xs-12"></div></div></div></div></a></h4></div>');
                    $('#TCampaignAssigned').append('<div id="collapse_' + j + '" class="panel-collapse collapse "><div id="divadvancesearchbody' + j + '" class="panel-body col-lg-12 col-md-12 col-sm-12 col-xs-12"><table class="table table-striped table-bordered table-advance table-hover"><th style="background-color:skyblue;" colspan="2"><b>Concise Contact Status</b></th><tr><td style="width: 50%;"><b>Total Contacts</b></td><td style="width: 50%;"><b>' + obj.TotalContacts + '</b></td></tr><tr><td style="width: 50%;"><b>Not Called Even Once</b></td><td style="width: 50%;"><b>' + obj.NotCalledEvenOnce + '</b></td></tr><tr><td style="width: 50%;"><b>Called but not converted to Lead</b></td><td style="width: 50%;"><b>' + obj.CalledbutnotConvertedtoLead + '</b></td></tr><tr><td style="width: 50%;"><b>Available Leads</b></td><td style="width: 50%;"><b>' + obj.AvailableLeads + '</b></td></tr><tr><td style="width: 50%;"><b>Available Opportunity</b></td><td style="width: 50%;"><b>' + obj.AvailableOpportunity + '</b></td></tr><tr><td style="width: 50%;"><b>Account</b></td><td style="width: 50%;"><b>' + obj.Account + '</b></td></tr></table><table class="table table-striped table-bordered table-advance table-hover"><th style="background-color:skyblue;" colspan="2"><b>Follow Up Status</b></th><tr><td style="width: 50%;"><b>Todays Follow up</b></td><td style="width: 50%;"><b>' + obj.TodaysFollowup + '</b></td></tr><tr><td style="width: 50%;"><b>Yesterday Pending Followup</b></td><td style="width: 50%;"><b>' + obj.YesterdaysPendingFollowup + '</b></td></tr><tr><td style="width: 50%;"><b>Next 7 Days Followup</b></td><td style="width: 50%;"><b>' + obj.Next7DaysFollowup + '</b></td></tr><tr><td style="width: 50%;"><b>Previous 7 Days Pending Followup</b></td><td style="width: 50%;"><b>' + obj.Prev7DaysFollowup + '</b></td></tr><tr><td style="width: 50%;"><b>Next 30 Days Followup</b></td><td style="width: 50%;"><b>' + obj.Next30DaysFollowup + '</b></td></tr><tr><td style="width: 50%;"><b>Previous 30 Days Pending Followup</b></td><td style="width: 50%;"><b>' + obj.Prev30DaysFollowup + '</b></td></tr></table></div></div>');                                        
                    $('#TCampaignAssigned').append('</td></tr>');
                    i = 0;
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
};

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

function ReadCookieName() {
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
        if (name == 'UserName') {
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

