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

function onlyAlphabets() {
    var charCode = event.keyCode;
    if ((charCode > 64 && charCode < 91) || (charCode > 96 && charCode < 123) || AsciiValue == 45)
        return true;
    else
        return false;
}

function validateEmail(email) {
    var re = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    return re.test(email);
}

var ConId;
var MobileNo;
var FirstName;

$(document).ready(function () {
    toastr.options = {
        "closeButton": true
    };

    var Chk = getCookie('typevalue');
    if (Chk == 'M') {
        Android.isBackClicked(true, "http://oe.mteducare.com/oe_crm/Dashboard.aspx");
    }
   
    window.scrollTo(0, 0); // to set focus to top of the page
    $('#ddlContactSource').on('change', function () {
        var Contactsource = document.getElementById("ddlContactSource").value;
        if (Contactsource == "0") {
            document.getElementById('lblcontactSource').innerHTML = "Select Contact Source";
            $('[data-id="ddlContactSource"]').addClass('errorClass');
        }
        else {
            document.getElementById('lblcontactSource').innerHTML = "";
            $('[data-id="ddlContactSource"]').addClass('sucessClass');
        }
    });

    $('#txtFirstname').keyup(function () {
        var FirstName = document.getElementById("txtFirstname").value;
        if (FirstName == "") {
            document.getElementById('lblFirstname').innerHTML = "Enter First Name";
            $("#txtFirstname").addClass('errorClass');
        }
        else {

            document.getElementById('lblFirstname').innerHTML = "";
            $("#txtFirstname").addClass('sucessClass');
        }
    });

    $('#txtMiddleName').keyup(function () {
        var MiddleName = document.getElementById("txtMiddleName").value;
        if (MiddleName == "") {
            document.getElementById('lblMiddleName').innerHTML = "Enter Middle Name";
            $("#txtMiddleName").addClass('errorClass');
        }
        else {
            document.getElementById('lblMiddleName').innerHTML = "";
            $("#txtMiddleName").addClass('sucessClass');
        }
    });

    $('#txtLastName').keyup(function () {
        var MiddleName = document.getElementById("txtLastName").value;
        if (MiddleName == "") {
            document.getElementById('lblLastName').innerHTML = "Enter Last Name";
            $("#txtLastName").addClass('errorClass');
        }
        else {
            document.getElementById('lblLastName').innerHTML = "";
            $("#txtLastName").addClass('sucessClass');
        }
    });

    $('#ddlGender').on('change', function () {
        var Gender = document.getElementById("ddlGender").value;
        if (Gender == "Select") {
            document.getElementById('lblGender').innerHTML = "Select Gender";
            $('[data-id="ddlGender"]').addClass('errorClass');
        }
        else {
            document.getElementById('lblGender').innerHTML = "";
            $('[data-id="ddlGender"]').addClass('sucessClass');
        }
    });

    $("#txtMonthYear").change(function () {
        var DOB = document.getElementById("txtMonthYear").value;
        if (DOB == "") {
            document.getElementById('lblDOB').innerHTML = "Enter Date Of Birth";
            $("#txtDOB").addClass('errorClass');
            return false;
        }
        var today = new Date();
        var nowyear = today.getFullYear();
        var nowmonth = today.getMonth();
        var nowday = today.getDate();
        DOB = new Date(DOB.split("/").reverse().join("-"));

        var birth = new Date(DOB);

        var birthyear = birth.getFullYear();
        var birthmonth = birth.getMonth();
        var birthday = birth.getDate();

        var age = nowyear - birthyear;
        var age_month = nowmonth - birthmonth;
        var age_day = nowday - birthday;

        if ((age == 10 && age_month <= 0 && age_day <= 0) || age < 10) {
            document.getElementById('lblDOB').innerHTML = "Age should be more than 10 years";
            $("#txtDOB").addClass('errorClass');
        }
        else {
            document.getElementById('lblDOB').innerHTML = "";
            $("#txtDOB").addClass('sucessClass');
        }
    });
    $('#txtEmailId').keyup(function () {
        var EmailId = document.getElementById("txtEmailId").value;
        if (EmailId == "") {
            document.getElementById('lblEmail').innerHTML = "Enter Email Id";
            $("#txtEmailId").addClass('errorClass');
            return false;
        }
        else if (validateEmail(EmailId)) {
            document.getElementById('lblEmail').innerHTML = "";
            $("#txtEmailId").addClass('sucessClass');
        }
        else if (!validateEmail(EmailId)) {
            document.getElementById('lblEmail').innerHTML = "Please Enter Valid EmailId";
            $("#txtEmailId").addClass('errorClass');
        }
        else {
            document.getElementById('lblEmail').innerHTML = "";
            $("#txtEmailId").addClass('sucessClass');
        }
    });

    $('#txtHandPhone1').keyup(function () {
        var handphone = document.getElementById("txtHandPhone1").value;
        if (handphone == "") {
            document.getElementById('lblhandphone').innerHTML = "Enter Mobile No.";
            $("#txtHandPhone1").addClass('errorClass');
            return false;
        }
        else if (handphone.length != 10) {
            document.getElementById('lblhandphone').innerHTML = "The Mobile No. is the wrong length. \nPlease enter 10 digit mobile no.";
            $("#txtHandPhone1").addClass('errorClass');
            return false;
        }
        else {
            document.getElementById('lblhandphone').innerHTML = "";
            $("#txtHandPhone1").addClass('sucessClass');
        }
    });

    $('#ddlcampaign').on('change', function () {
        var PopupCampaign = document.getElementById("ddlcampaign").value;
        if (PopupCampaign == "0") {
            document.getElementById('lblpopupcampaign').innerHTML = "Select Campaign";
            $("#ddlcampaign").addClass('errorClass');
        }
        else {
            document.getElementById('lblpopupcampaign').innerHTML = "";
            $("#ddlcampaign").addClass('sucessClass');
        }
    });

    $("#lblPKey").css('display', 'none');
    $("#lblconId").css('display', 'none');
    CampaignFill();
    ContactSourceFill();
    controlVisiblity('Search');
    var count;
    $('[data-toggle="tooltip"]').tooltip();

    $('#btnEnterContactSearch').click(function () {
        EnterContactData();
    });

    $('#btnAdd').click(function () {
        document.getElementById('divheader').innerHTML = "Add Contact";
        waitingDialog.show('Please wait...', { dialogSize: 'sm', progressType: 'warning' });
        controlVisiblity('Add');
        ClearAddPanel();
        document.getElementById("txtFirstname").value = document.getElementById("txtUserName").value;
        document.getElementById("txtHandPhone1").value = document.getElementById("txtMobileNo").value;
        waitingDialog.hide();
    });

    $('#btnBack').click(function () {
        waitingDialog.show('Please wait...', { dialogSize: 'sm', progressType: 'warning' });
        controlVisiblity('Back');
        waitingDialog.hide();
    });

    $('#btnSave').click(function () {
        if (document.getElementById("lblPKey").value == "") {
            SaveEnterContactData();
        }
        else {
            UpdateEnterContactData();
        }
    });

    $("#btnEnterContactHome").click(function () {
        waitingDialog.show('Please wait...', { dialogSize: 'sm', progressType: 'warning' });
        window.location.assign("Dashboard.aspx");
        waitingDialog.hide();
    });

    $("#btnEnterContactHome1").click(function () {
        waitingDialog.show('Please wait...', { dialogSize: 'sm', progressType: 'warning' });
        window.location.assign("Dashboard.aspx");
        waitingDialog.hide();
    });

    $("#btnEnterContactHome2").click(function () {
        waitingDialog.show('Please wait...', { dialogSize: 'sm', progressType: 'warning' });
        ClearAddPanel();
        controlVisiblity('Search');
        waitingDialog.hide();
    });

    $("#CampaignPopupSave").click(function () {
        CampaignSave();
    });

});

function EditData(objthis) {
    document.getElementById('divheader').innerHTML = "Edit Contact";
    ClearAddPanel();
    var Contactid = $(objthis).attr('data');
    EditEnterContactData(Contactid);
}

function AddToCampaign(objthis) {
    var ContactId = $(objthis).attr('data');
    ViewContactData(ContactId);
    document.getElementById("lblconId").value = ContactId;
}

function controlVisiblity(mode) {
    if (mode == 'Result') {
        $("#divEnterContactSearch").css('display', 'block');
        $("#divSearchedData").css('display', 'block');
        $("#divAddEnterContact").css('display', 'none');
        $("#divEnterContactData").css('display', 'block');
        $("#Msg_Error").css('display', 'none');
        $("#Msg_Success").css('display', 'none');
    }
    else if (mode == 'Add') {
        $("#divEnterContactSearch").css('display', 'none');
        $("#divAddEnterContact").css('display', 'block');
        $("#divEnterContactData").css('display', 'none');
        $("#Msg_Error").css('display', 'none');
        $("#Msg_Success").css('display', 'none');
        document.getElementById("lblPKey").value = "";
    }
    else if (mode == 'View') {
        $("#divEnterContactSearch").css('display', 'none');
        $("#divAddEnterContact").css('display', 'block');
        $("#divEnterContactData").css('display', 'none');
        $("#Msg_Error").css('display', 'none');
        $("#Msg_Success").css('display', 'none');
    }
    else if (mode == 'Search') {
        $("#divEnterContactSearch").css('display', 'block');
        $("#divAddEnterContact").css('display', 'none');
        $("#divEnterContactData").css('display', 'none');
        $("#Msg_Error").css('display', 'none');
        $("#Msg_Success").css('display', 'none');
        $("#divSearchedData").css('display', 'none');
    }
    else if (mode == 'Back') {
        $("#divEnterContactSearch").css('display', 'block');
        $("#divAddEnterContact").css('display', 'none');
        $("#divEnterContactData").css('display', 'none');
    }
    else if (mode == 'Close') {
        $("#divEnterContactSearch").css('display', 'none');
        $("#divAddEnterContact").css('display', 'none');
        $("#divEnterContactData").css('display', 'block');
        $("#Msg_Error").css('display', 'none');
        $("#Msg_Success").css('display', 'none');
    }
    else if (mode == 'save') {
        $("#divEnterContactSearch").css('display', 'none');
        $("#divAddEnterContact").css('display', 'none');
        $("#divEnterContactData").css('display', 'block');
        $("#Msg_Error").css('display', 'none');
        $("#Msg_Success").css('display', 'block');
    }
}

//Coding For Search button click Start
function EnterContactData() {  //To fill grid on search button click
    $("#txtMobileNo").removeClass('errorClass');
    $("#txtUserName").removeClass('errorClass');
    var mobileno = document.getElementById("txtMobileNo").value;
    var Name = document.getElementById("txtUserName").value;
    if (mobileno == "" && Name == "") {
        controlVisiblity('Search');
        toastr.error('Please Enter Name Or Mobile No');      
        $("#txtMobileNo").addClass('errorClass');
        $("#txtUserName").addClass('errorClass');      
    }
    else {
        waitingDialog.show('Please wait while the data is getting populated', { dialogSize: 'sm', progressType: 'warning' });
        $.ajax({
            type: 'POST',
            url: "./WebMethods/Contacts.asmx/ContactDetail",
            contentType: "application/json; charset=utf-8",
            data: '{"UserName1":"' + Name + '","MobileNo": "' + mobileno + '"}',
            dataType: "json",
            async: false,
            success: (function (data) {
                $('#TEnterContact').html('');
                $(data.d).each(function (index, obj) {
                    $('#TEnterContact').append('<tr><td style="width:25%;">' + obj.Student_Name + '</td><td style="width:50%;"><b>Source-</b> ' + obj.contact_Source + '</br><b>Gender-</b> ' + obj.Gender + '</br><b>Handphone1-</b>' + obj.Handphone1 + '</br><b>EmailId-</b>' + obj.Emailid + '</br></td><td style="width:25%;"><a id="btnEdit" onclick="EditData(this);" data="' + obj.Con_Id + '" class="btn blue"><i class="glyphicon glyphicon-pencil"  data-toggle="tooltip"  data-placement="bottom" title="Edit"></i></a><a id="btnAssigntoCampaign" onclick="AddToCampaign(this);" data="' + obj.Con_Id + '" class="btn purple" data-toggle="tooltip"  data-placement="bottom" title="Add To Campaign"><i class="glyphicon glyphicon-edit"></i></a></td></tr>');
                    ConId = obj.Con_Id;
                    MobileNo = obj.Handphone1;
                    FirstName = obj.FirstName;
                    count = obj.rowcount;
                    controlVisiblity('Result');
                })
                if (data.d == '') {
                    controlVisiblity('Add');
                    document.getElementById('divheader').innerHTML = "Add Contact";
                    document.getElementById("txtHandPhone1").value = document.getElementById("txtMobileNo").value;
                    document.getElementById("txtFirstname").value = document.getElementById("txtUserName").value;
                    waitingDialog.hide();
                }
                else {
                    waitingDialog.hide();
                }
            }),
            error: (function () {
            })
        });
    }
};
//Coding For Search button click End

//Coding For Add Button Click Start
function ContactSourceFill() {
    $.ajax({
        type: 'POST',
        url: "./WebMethods/Contacts.asmx/BindContactSource",
        dataType: "json",
        contentType: "application/json; charset=utf-8",
        type: "POST",
        async: false,
        success: function (res) {
            $.each(res.d, function (name, item) {
                $("#ddlContactSource").append($("<option></option>").val(item.SourceId).html(item.Source_Name));
            })
        },
        error: function (response) {

        }
    });
}

function SaveEnterContactData() {   //For saving data   
    var ContactSource = document.getElementById("ddlContactSource").value;
    var FirstName = document.getElementById("txtFirstname").value;
    var MiddleName = document.getElementById("txtMiddleName").value;
    var LastName = document.getElementById("txtLastName").value;
    var Gender = document.getElementById("ddlGender").value;
    var DOB1 = document.getElementById("txtMonthYear").value;
    var Handphone1 = document.getElementById("txtHandPhone1").value;
    var EmailId = document.getElementById("txtEmailId").value;
    var Address1 = document.getElementById("txtAddress1").value;
    var Address2 = document.getElementById("txtAddress2").value;
    var Street = document.getElementById("txtStreet").value;
    var errormsg = "";
    var UID = ReadCookie();
    var v = "0";
    if (ContactSource == "0") {
        document.getElementById('lblpopupcampaign').innerHTML = "Select Contact Source";
        $('[data-id="ddlContactSource"]').addClass('errorClass');   
        v = "1";
    }
    else {
        document.getElementById('lblcontactSource').innerHTML = "";
        $('[data-id="ddlContactSource"]').addClass('sucessClass');    
    }

    if (FirstName == "") {
        document.getElementById('lblFirstname').innerHTML = "Enter First Name";
        $("#txtFirstname").addClass('errorClass');
        v = "1";
    }
    else {
        document.getElementById('lblFirstname').innerHTML = "";
        $("#txtFirstname").addClass('sucessClass');
    }

    if (MiddleName == "") {
        document.getElementById('lblMiddleName').innerHTML = "Select Middle Name";
        $("#txtMiddleName").addClass('errorClass');
        v = "1";
    }
    else {
        document.getElementById('lblMiddleName').innerHTML = "";
        $("#txtMiddleName").addClass('sucessClass');
    }

    if (LastName == "") {
        document.getElementById('lblLastName').innerHTML = "Select Last Name";
        $("#txtLastName").addClass('errorClass');
        v = "1";
    }
    else {
        document.getElementById('lblLastName').innerHTML = "";
        $("#txtLastName").addClass('sucessClass');
    }

    if (Gender == "Select") {
        document.getElementById('lblGender').innerHTML = "Select Gender";
        $('[data-id="ddlGender"]').addClass('errorClass');  
        v = "1";
    }
    else {
        document.getElementById('lblGender').innerHTML = "";
        $('[data-id="ddlGender"]').addClass('sucessClass');
    }

    if (DOB1 == "") {
        document.getElementById('lblDOB').innerHTML = "Enter Date Of Birth";
        $("#txtDOB").addClass('errorClass');
        v = "1";
    }
    else {
        var today = new Date();
        var nowyear = today.getFullYear();
        var nowmonth = today.getMonth();
        var nowday = today.getDate();
        DOB1 = new Date(DOB1.split("/").reverse().join("-"));
        var birth = new Date(DOB1);

        var birthyear = birth.getFullYear();
        var birthmonth = birth.getMonth();
        var birthday = birth.getDate();

        var age = nowyear - birthyear;
        var age_month = nowmonth - birthmonth;
        var age_day = nowday - birthday;

        if ((age == 10 && age_month <= 0 && age_day <= 0) || age < 10) {
            document.getElementById('lblDOB').innerHTML = "Age should be more than 10 years";
            $("#txtDOB").addClass('errorClass');
            v = "1";
        }
        else {
            document.getElementById('lblDOB').innerHTML = "";
            $("#txtDOB").addClass('sucessClass');
        }
    }

    if (EmailId == "") {
        document.getElementById('lblEmail').innerHTML = "Enter Email Id";
        $("#txtEmailId").addClass('errorClass');
        v = "1";
    }
    else if (validateEmail(EmailId)) {
        document.getElementById('lblEmail').innerHTML = "";
        $("#txtEmailId").addClass('sucessClass');
    }
    else {
        document.getElementById('lblEmail').innerHTML = "Please Enter Valid EmailId";
        $("#txtEmailId").addClass('errorClass');
        v = "1";
    }

    if (Handphone1 == "") {
        document.getElementById('lblhandphone').innerHTML = "Enter Mobile No.";
        $("#txtHandPhone1").addClass('errorClass');
        v = "1";
    }
    else if (Handphone1.length != 10) {
        document.getElementById('lblhandphone').innerHTML = "The Mobile No. is the wrong length. \nPlease enter 10 digit mobile no.";
        $("#txtHandPhone1").addClass('errorClass');
        v = "1";
    }
    else {
        document.getElementById('lblhandphone').innerHTML = "";
        $("#txtHandPhone1").addClass('sucessClass');
    }

    if (v == "1") {
        return false;
    }
    DOB1 = document.getElementById("txtMonthYear").value;
    //waitingDialog.show('Please wait...', { dialogSize: 'sm', progressType: 'warning' });
    $.ajax({
        type: 'POST',
        url: "./WebMethods/Contacts.asmx/ContactSaveDetail",
        contentType: "application/json; charset=utf-8",
        data: '{"ContactSource":"' + ContactSource + '","FirstName":"' + FirstName + '", "MiddleName":"' + MiddleName + '", "LastName":"' + LastName + '", "Gender":"' + Gender + '", "DOB":"' + DOB1 + '", "HandPhone1":"' + Handphone1 + '", "EmailId":"' + EmailId + '", "Address1":"' + Address1 + '", "Address2":"' + Address2 + '", "Street":"' + Street + '", "UserId":"' + UID + '"}',
        dataType: "json",
        async: false,
        success: (function (data) {
            $(data.d).each(function (index, obj) {
                if (obj.result == "1") {
                    controlVisiblity('Search');
                    sweetAlert('Record Saved Sucessfully', '', 'success');
                }
                else {
                    toastr.error('Duplicate Record');
                }
            });
            if (data.d == '') {
                toastr.error('Record Not Saved');
               // waitingDialog.hide();
            }
            else {
               // waitingDialog.hide();
            }
        }),
        error: (function () {
            toastr.error('Something gone Wrong....');
            //waitingDialog.hide();

        })
    });
};
//Coding For Add Button Click End

//Coding For Edit button click Start
function EditEnterContactData(Conid) {   //To View data on edit button click
    waitingDialog.show('Please wait while the data is getting populated', { dialogSize: 'sm', progressType: 'warning' });
    $.ajax({
        type: 'POST',
        url: "./WebMethods/Contacts.asmx/EnterContactDetail",
        contentType: "application/json; charset=utf-8",
        data: '{"ConId":"' + Conid + '"}',
        dataType: "json",
        async: false,
        success: (function (data) {
            $(data.d).each(function (index, obj) {
                controlVisiblity('View');
                $("#txtFirstname").val(obj.FirstName);
                $("#txtMiddleName").val(obj.MiddleName);
                $("#txtLastName").val(obj.LastName);
                $("#txtMonthYear").val(obj.DOB);
                $("#txtHandPhone1").val(obj.Handphone1);
                $("#txtEmailId").val(obj.Emailid);
                $("#txtAddress1").val(obj.Address1);
                $("#txtAddress2").val(obj.Address2);
                $("#txtStreet").val(obj.Street);
                $("#ddlGender").val(obj.Gender).change();
                $("#ddlContactSource").val(obj.Contact_Source_Code).change();
                $('[data-id="ddlGender"]').removeClass('sucessClass');
                $('[data-id="ddlContactSource"]').removeClass('sucessClass'); 
                document.getElementById("lblPKey").value = ConId;
            })
            if (data.d == '') {
                toastr.error('No Record Found!');
                controlVisiblity('Result');
                waitingDialog.hide();
            }
            else {
                waitingDialog.hide();
            }
        }),
        error: (function () {
            toastr.error('Something gone Wrong....');
            waitingDialog.hide();
        })
    });
};

function UpdateEnterContactData() {    //For updating data
    var ContactSource = document.getElementById("ddlContactSource").value;
    var FirstName = document.getElementById("txtFirstname").value;
    var MiddleName = document.getElementById("txtMiddleName").value;
    var LastName = document.getElementById("txtLastName").value;
    var Gender = document.getElementById("ddlGender").value;
    var DOB1 = document.getElementById("txtMonthYear").value;
    var Handphone1 = document.getElementById("txtHandPhone1").value;
    var EmailId = document.getElementById("txtEmailId").value;
    var Address1 = document.getElementById("txtAddress1").value;
    var Address2 = document.getElementById("txtAddress2").value;
    var Street = document.getElementById("txtStreet").value;
    var errormsg = "";
    var UID = ReadCookie();
    ConId = document.getElementById("lblPKey").value;
    var v = "0";
    if (ContactSource == "0") {
        document.getElementById('lblcontactSource').innerHTML = "Select Contact Source";
        $('[data-id="ddlContactSource"]').addClass('errorClass');      
        v = "1";
    }
    else {
        document.getElementById('lblcontactSource').innerHTML = "";
        $('[data-id="ddlContactSource"]').addClass('sucessClass'); 
    }

    if (FirstName == "") {
        document.getElementById('lblFirstname').innerHTML = "Enter First Name";
        $("#txtFirstname").addClass('errorClass');
        v = "1";
    }
    else {
        document.getElementById('lblFirstname').innerHTML = "";
        $("#txtFirstname").addClass('sucessClass');
    }

    if (MiddleName == "") {
        document.getElementById('lblMiddleName').innerHTML = "Select Middle Name";
        $("#txtMiddleName").addClass('errorClass');
        v = "1";
    }
    else {
        document.getElementById('lblMiddleName').innerHTML = "";
        $("#txtMiddleName").addClass('sucessClass');
    }

    if (LastName == "") {
        document.getElementById('lblLastName').innerHTML = "Select Last Name";
        $("#txtLastName").addClass('errorClass');
        v = "1";
    }
    else {
        document.getElementById('lblLastName').innerHTML = "";
        $("#txtLastName").addClass('sucessClass');
    }

    if (Gender == "Select") {
        document.getElementById('lblGender').innerHTML = "Select Gender";
        $('[data-id="ddlGender"]').addClass('errorClass');     
        v = "1";
    }
    else {
        document.getElementById('lblGender').innerHTML = "";
        $('[data-id="ddlGender"]').addClass('sucessClass'); 
    }

    if (DOB1 == "") {
        document.getElementById('lblDOB').innerHTML = "Enter Date Of Birth";
        $("#txtDOB").addClass('errorClass');
        v = "1";
    }
    else {
        var today = new Date();
        var nowyear = today.getFullYear();
        var nowmonth = today.getMonth();
        var nowday = today.getDate();
        DOB1 = new Date(DOB1.split("/").reverse().join("-"));
        var birth = new Date(DOB1);

        var birthyear = birth.getFullYear();
        var birthmonth = birth.getMonth();
        var birthday = birth.getDate();

        var age = nowyear - birthyear;
        var age_month = nowmonth - birthmonth;
        var age_day = nowday - birthday;

        if ((age == 10 && age_month <= 0 && age_day <= 0) || age < 10) {
            document.getElementById('lblDOB').innerHTML = "Age should be more than 10 years";
            $("#txtDOB").addClass('errorClass');
            v = "1";
        }
        else {
            document.getElementById('lblDOB').innerHTML = "";
            $("#txtDOB").addClass('sucessClass');
        }
    }

    if (EmailId == "") {
        document.getElementById('lblEmail').innerHTML = "Enter Email Id";
        $("#txtEmailId").addClass('errorClass');
        v = "1";
    }
    else if (validateEmail(EmailId)) {
        document.getElementById('lblEmail').innerHTML = "";
        $("#txtEmailId").addClass('sucessClass');
    }
    else {
        document.getElementById('lblEmail').innerHTML = "Please Enter Valid EmailId";
        $("#txtEmailId").addClass('errorClass');
        v = "1";
    }

    if (Handphone1 == "") {
        document.getElementById('lblhandphone').innerHTML = "Enter Mobile No.";
        $("#txtHandPhone1").addClass('errorClass');
        v = "1";
    }
    else if (Handphone1.length != 10) {
        document.getElementById('lblhandphone').innerHTML = "The Mobile No. is the wrong length. \nPlease enter 10 digit mobile no.";
        $("#txtHandPhone1").addClass('errorClass');
        v = "1";
    }
    else {
        document.getElementById('lblhandphone').innerHTML = "";
        $("#txtHandPhone1").addClass('sucessClass');
    }

    if (v == "1") {
        return false;
    }

    DOB1 = document.getElementById("txtMonthYear").value;
    //waitingDialog.show('Please wait', { dialogSize: 'sm', progressType: 'warning' });
    $.ajax({
        type: 'POST',
        url: "./WebMethods/Contacts.asmx/ContactUpdateDetail",
        contentType: "application/json; charset=utf-8",
        data: '{"ConId":"' + ConId + '","ContactSource":"' + ContactSource + '","FirstName":"' + FirstName + '", "MiddleName":"' + MiddleName + '", "LastName":"' + LastName + '", "Gender":"' + Gender + '", "DOB":"' + DOB1 + '", "HandPhone1":"' + Handphone1 + '", "EmailId":"' + EmailId + '", "Address1":"' + Address1 + '", "Address2":"' + Address2 + '", "Street":"' + Street + '", "UserId":"' + UID + '"}',
        dataType: "json",
        async: false,
        success: (function (data) {
            $(data.d).each(function (index, obj) {
                if (obj.result == "1") {
                    EnterContactData();
                    controlVisiblity('Result');
                    sweetAlert('Record Updated Sucessfully', '', 'success');
                }
                else {
                    toastr.error('Duplicate Record');
                }
            });
            if (data.d == '') {
                toastr.error('Record Not Saved');
               // waitingDialog.hide();
            }
            else {
               //waitingDialog.hide();
            }
        }),
        error: (function () {
            toastr.error('Something gone Wrong....');
            //waitingDialog.hide();
        })
    });
};
//Coding For edit button click End

//Coding For pop Up Start
function CampaignFill() {
    var UID = ReadCookie();
    $.ajax({
        type: 'POST',
        url: "./WebMethods/Contacts.asmx/BindCampaign",
        dataType: "json",
        contentType: "application/json; charset=utf-8",
        data: '{"UserId":"' + UID + '"}',
        type: "POST",
        async: false,
        success: function (res) {
            $.each(res.d, function (name, item) {
                $("#ddlcampaign").append($("<option></option>").val(item.CampaignId).html(item.Campaign_Name));
            })
        },
        error: function (response) {
        },
        failure: function (response) {
        }
    });
}

function ViewContactData(Conid) {  //To view student Details 
    $("#ddlcampaign option").each(function () {
        if ($(this).val() == '0') {
            $(this).attr('selected', 'selected');
            var element = document.getElementById('ddlcampaign');
            element.value = "0";
        }
    })
    document.getElementById('lblpopupcampaign').innerHTML = "";
    $("#ddlcampaign").removeClass('errorClass');
    $("#ddlcampaign").removeClass('sucessClass');

    waitingDialog.show('Please wait', { dialogSize: 'sm', progressType: 'warning' });
    $.ajax({
        type: 'POST',
        url: "./WebMethods/Contacts.asmx/EnterContactDetail",
        contentType: "application/json; charset=utf-8",
        data: '{"ConId":"' + Conid + '"}',
        dataType: "json",
        async: false,
        success: (function (data) {
            $(data.d).each(function (index, obj) {
                $('#form_modal11').modal({
                    keyboard: true,
                    backdrop: "static"
                });
                document.getElementById('lblStudentName1').innerHTML = obj.StudentName;
                document.getElementById('lblMobileNo1').innerHTML = obj.Handphone1;
                document.getElementById('lblEmailId1').innerHTML = obj.Emailid;
            })
            if (data.d == '') {
                controlVisiblity('Result');
                toastr.error('No Record Found!');
                waitingDialog.hide();
            }
            else {
                waitingDialog.hide();
            }
        }),
        error: (function () {
            toastr.error('Something gone Wrong....');
            waitingDialog.hide();
        })
    });
};

function CampaignSave() {    //for popup
    var Campaign = document.getElementById("ddlcampaign").value;
    var Concode = document.getElementById("lblconId").value;
    var UID = ReadCookie();
    var v = "0";
    if (Campaign == "0") {
        document.getElementById('lblpopupcampaign').innerHTML = "Select Campaign";
        $("#ddlcampaign").addClass('errorClass');
        v = "1";
    }
    else {
        document.getElementById('lblpopupcampaign').innerHTML = "";
        $("#ddlcampaign").addClass('sucessClass');
    }
    if (v == "1") {
        return false;
    }

    //waitingDialog.show('Please wait', { dialogSize: 'sm', progressType: 'warning' });
    $.ajax({
        type: 'POST',
        url: "./WebMethods/Contacts.asmx/SaveCampaignDetail",
        contentType: "application/json; charset=utf-8",
        data: '{"CON_ID":"' + Concode + '","Created_By":"' + UID + '", "Campaign":"' + Campaign + '"}',
        dataType: "json",
        async: false,
        success: (function (data) {
            $(data.d).each(function (index, obj) {
                if (obj.result == "1") {
                    sweetAlert('Contact Assigned To Campaign Successfully', '', 'success');
                    $('#form_modal11').modal('hide');
                    controlVisiblity('Result');
                }
                else {
                    toastr.error('Duplicate Campaign');
                }
            });
            if (data.d == '') {
                toastr.error('Campaign Not Assigned');
                //waitingDialog.hide();
            }
            else {
                //waitingDialog.hide();
            }
        }),
        error: (function () {
            toastr.error('Something gone Wrong....');
            //waitingDialog.hide();
        })
    });
};
//Coding For pop Up End

//Coding To clear add panel Satrt
function ClearAddPanel() {
    $("#ddlContactSource").val(0).change();
    $("#ddlGender").val('Select').change();
    document.getElementById("txtFirstname").value = "";
    document.getElementById("txtMiddleName").value = "";
    document.getElementById("txtLastName").value = "";  
    document.getElementById("txtMonthYear").value = "";
    document.getElementById("txtEmailId").value = "";
    document.getElementById("txtHandPhone1").value = "";
    document.getElementById("txtAddress1").value = "";
    document.getElementById("txtAddress2").value = "";
    document.getElementById("txtStreet").value = "";

    document.getElementById('lblcontactSource').innerHTML = "";
    document.getElementById("lblFirstname").innerHTML = "";
    document.getElementById("lblMiddleName").innerHTML = "";
    document.getElementById("lblLastName").innerHTML = "";
    document.getElementById("lblGender").innerHTML = "";
    document.getElementById("lblDOB").innerHTML = "";
    document.getElementById("lblEmail").innerHTML = "";
    document.getElementById("lblhandphone").innerHTML = "";

    $("#txtFirstname").removeClass('errorClass');
    $("#txtMiddleName").removeClass('errorClass');
    $("#txtLastName").removeClass('errorClass');
    $("#txtDOB").removeClass('errorClass');
    $("#txtEmailId").removeClass('errorClass');
    $("#txtHandPhone1").removeClass('errorClass');
    $('[data-id="ddlGender"]').removeClass('errorClass');
    $('[data-id="ddlContactSource"]').removeClass('errorClass');

    $("#txtFirstname").removeClass('sucessClass');
    $("#txtMiddleName").removeClass('sucessClass');
    $("#txtLastName").removeClass('sucessClass');
    $("#txtDOB").removeClass('sucessClass');
    $("#txtEmailId").removeClass('sucessClass');
    $("#txtHandPhone1").removeClass('sucessClass');
    $('[data-id="ddlGender"]').removeClass('sucessClass');
    $('[data-id="ddlContactSource"]').removeClass('sucessClass');
}
//Coding To clear add panel End

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