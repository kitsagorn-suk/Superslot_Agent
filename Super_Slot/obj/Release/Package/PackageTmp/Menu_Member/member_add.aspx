<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="member_add.aspx.cs" Inherits="Pretty_Gaming.Menu_Member.member_add" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="" set-lan="text:Management"></a></li>
            <li class="breadcrumb-item"><a href="/Menu_MemberManagement/company_list" set-lan="text:Agents & Members List"></a></li>
            <li class="breadcrumb-item active" id="headPage"></li>
        </ol>
    </nav>
    <h1 id="headTopic"></h1>
    <div class="section-group mb-4">
        <h4 set-lan="text:Basic Info"></h4>
        <div class="form-row">
            <div class="form-group col-5">
                <div class="form-group row inputform">
                    <label for="username" class="col-4 col-form-label" set-lan="html:Username-"></label>
                    <div class="col-8">
                        <input type="text" id="username" class="form-control" autocomplete="off" onkeypress="clsAlphaNoOnly(event)" maxlength="30" />
                        <small class="text-muted form-text" set-lan="text:textnumberonly"></small>
                    </div>
                </div>
                <div class="form-group row inputform">
                    <label for="username" class="col-4 col-form-label" set-lan="html:Password-"></label>
                    <div class="col-8" id="ZonePass1">
                        <input type="text" id="password" class="form-control" autocomplete="off" maxlength="24" />
                    </div>
                    <div class="col-8" id="ZonePass2">
                        <button type="button" class="btn btn-yellow font-weight-bold waves-effect waves-light" onclick="editPass();" set-lan="text:Edit Password"></button>
                    </div>
                </div>
            </div>
            <div class="col-1"></div>
            <div class="form-group col-5">
                <div class="form-group row inputform">
                    <label for="username" class="col-4 col-form-label" set-lan="text:Nickname"></label>
                    <div class="col-8">
                        <input type="text" id="nickname" class="form-control" autocomplete="off" onkeypress="clsAlphaTHNoOnly(event)" maxlength="30" />
                        <small class="text-muted form-text" set-lan="text:textTHnumberonly"></small>
                    </div>
                </div>
                <div class="form-group row inputform">
                    <label for="username" class="col-4 col-form-label" set-lan="text:Phone number"></label>
                    <div class="col-8">
                        <input type="text" id="phonenumber" class="form-control" autocomplete="off" oninput="this.value=this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" maxlength="15" />
                        <small class="text-muted form-text" set-lan="text:numberonly"></small>
                    </div>
                </div>
            </div>
        </div>
        <div id="ZoneStatus">
            <h4 set-lan="text:Status"></h4>
            <div class="form-row">
                <div class="form-group col-5">
                    <div class="form-group row inputform">
                        <label for="pt" class="col-4 col-form-label" set-lan="text:Suspend"></label>
                        <div class="col-4">
                            <input type="text" id="suspend" class="form-control" autocomplete="off" disabled="disabled" set-lan="value:NoSus">
                        </div>
                    </div>
                </div>
                <div class="col-1"></div>
                <div class="form-group col-5">
                    <div class="form-group row inputform">
                        <label for="pt" class="col-4 col-form-label" set-lan="text:Lock"></label>
                        <div class="col-4">
                            <input type="text" id="lock" class="form-control" autocomplete="off" disabled="disabled" set-lan="value:Unlock">
                        </div>
                        <div class="col-4">
                            <button type="button" class="btn btn-yellow font-weight-bold waves-effect waves-light" onclick="editStatus();" set-lan="text:Edit Status"></button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div id="ZoneModify">
            <h4 set-lan="text:Verify"></h4>
            <div class="form-row">
                <div class="form-group col-5">
                    <div class="form-group row inputform">
                        <label for="pt" class="col-4 col-form-label" set-lan="text:Verify OTP"></label>
                        <div class="col-4">
                            <input type="text" id="modify" class="form-control" autocomplete="off" disabled="disabled" set-lan="value:Unlock">
                        </div>
                        <div class="col-4">
                            <button type="button" class="btn btn-yellow font-weight-bold waves-effect waves-light" onclick="editModify();" set-lan="text:Verify OTP"></button>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <h4 set-lan="text:Credit Settings"></h4>
        <div class="form-row">
            <div class="form-group col-5">
                <div class="form-group row inputform" style="display: none;">
                    <label for="pt" class="col-4 col-form-label" set-lan="html:Our PT-"></label>
                    <div class="col-8">
                        <div class="row">
                            <div class="col-8">
                                <div class="select-outline">
                                    <select class="mdb-select" id="ddl_positiontracking" onchange="changePT('our')">
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="form-group row inputform">
                    <label for="credit" class="col-4 col-form-label" set-lan="html:Credit-"></label>
                    <div class="col-8">
                        <input type="text" id="credit" class="form-control" autocomplete="off" onkeyup="javascript:this.value=Comma(this.value);" oninput="this.value=this.value.replace(/[^0-9]/g, '').replace(/(\..*)\./g, '$1');" maxlength="30" />
                        <small id="creditHelper" class="text-muted form-text"></small>
                    </div>
                </div>
            </div>
            <div class="col-1"></div>
            <div class="form-group col-5" style="display: none;">
                <div class="form-group row inputform">
                    <label for="pt" class="col-4 col-form-label" set-lan="html:Given PT-"></label>
                    <div class="col-8">
                        <div class="row">
                            <div class="col-8">
                                <div class="select-outline">
                                    <select class="mdb-select" id="ddl_givenPT" onchange="changePT('given')">
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="form-group col-5" style="display: none;">
                <div class="form-group row inputform">
                    <label for="pt" class="col-4 col-form-label">test</label>
                    <div class="col-8">
                        <div class="row">
                            <div class="col-8">
                                <div class="select-outline">
                                    <select class="mdb-select" id="ddl_test">
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="form-row">
            <div class="col-12" style="text-align: center; margin-top: 1rem;">
                <button class="btn btn-yellow font-weight-bold" id="btnADD" onclick="AddCompany()" type="button" set-lan="text:Add Member"></button>
                <button class="btn btn-yellow font-weight-bold" id="btnSAVE" onclick="SaveCompany()" type="button" set-lan="text:Save Member"></button>
            </div>
        </div>
    </div>

    <div class="modal fade" id="modalPassword" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header text-center">
                    <h4 class="modal-title w-100 font-weight-bold" set-lan="text:Password"></h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body mx-3">
                    <div class="form-group row mr-4" style="margin-bottom: 0px !important;">
                        <label for="email" class="col-4 col-form-label alignright" set-lan="html:New Password"></label>
                        <input type="text" class="form-control col-8" autocomplete="off" id="password_new" maxlength="24" />
                        <label class="col-4 col-form-label alignright"></label>
                    </div>
                </div>
                <div class="modal-footer d-flex justify-content-center">
                    <button type="button" class="btn btn-yellow font-weight-bold" onclick="saveNewPass();" set-lan="text:Save"></button>
                    <button type="button" class="btn btn-yellow font-weight-bold" data-dismiss="modal" aria-label="Close" set-lan="text:Close"></button>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="modalStatus" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header text-center">
                    <h4 class="modal-title w-100 font-weight-bold">Status</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body mx-3">
                    <div class="form-group row mr-4" style="margin-bottom: 0px !important;">
                        <label for="email" class="col-4 col-form-label alignright" set-lan="text:Suspend-"></label>
                        <div class="switch col-8">
                            <label style="margin-top: 10px;">
                                <input type="checkbox" id="chkSuspend" onclick="chgSuspend(this)">
                                <span class="lever ml-0"></span>
                                <span class="blue-text text-13" id="txtSuspend"></span>
                            </label>
                        </div>
                    </div>
                    <div class="form-group row mr-4" style="margin-bottom: 0px !important;">
                        <label for="email" class="col-4 col-form-label alignright" set-lan="text:Lock-"></label>
                        <div class="switch col-8">
                            <label style="margin-top: 10px;">
                                <input type="checkbox" id="chkLock" onclick="chgLock(this)">
                                <span class="lever ml-0"></span>
                                <span class="blue-text text-13" id="txtLock"></span>
                            </label>
                        </div>
                    </div>
                </div>
                <div class="modal-footer d-flex justify-content-center">
                    <button type="button" class="btn btn-yellow font-weight-bold" onclick="saveEditStatus();" set-lan="text:Save"></button>
                    <button type="button" class="btn btn-yellow font-weight-bold" data-dismiss="modal" aria-label="Close" set-lan="text:Close"></button>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="modalModify" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header text-center">
                    <h4 class="modal-title w-100 font-weight-bold" set-lan="text:Verify"></h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body mx-3">
                    <div class="form-group row mr-4" style="margin-bottom: 0px !important;">
                        <label for="email" class="col-4 col-form-label alignright" set-lan="text:Verify OTP-"></label>
                        <div class="switch col-8">
                            <label style="margin-top: 10px;">
                                <span class="blue-text text-13" id="txtModify"></span>
                            </label>
                        </div>
                    </div>
                </div>
                <div class="modal-footer d-flex justify-content-center">
                    <button type="button" class="btn btn-yellow font-weight-bold" onclick="saveEditModify();" set-lan="text:Approve"></button>
                    <button type="button" class="btn btn-yellow font-weight-bold" data-dismiss="modal" aria-label="Close" set-lan="text:Close"></button>
                </div>
            </div>
        </div>
    </div>

    <!-- Modal -->
    <div class="modal fade" id="modalAlert" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header text-center">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body mx-3 text-center">
                    <label id="lbAlert"></label>
                </div>
                <div class="modal-footer d-flex justify-content-center">
                    <button type="button" class="btn btn-yellow font-weight-bold" data-dismiss="modal" aria-label="Close">Close</button>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="modalAlertSuccess" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header text-center">
                    <h4 class="modal-title w-100 font-weight-bold" set-lan="text:Success"></h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body mx-3 text-center">
                    <label id="lbAlertSuccess"></label>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainScript" runat="server">
    <script>
        $(document).ready(function () {
            $("#menuMemberManage , #menuMemberManage > a").addClass("active");
            $("#menuMemberManage > div").css("display", "block");

            $("#myModalLoad").modal();
            SetLan(localStorage.getItem("Language"));

            var uname = getUrlParameter('uname');
            if (uname == "") {
                document.getElementById("btnSAVE").style.display = "none";
                document.getElementById("ZonePass2").style.display = "none";
                document.getElementById("headPage").setAttribute("set-lan", "text:Add Member");
                document.getElementById("headTopic").setAttribute("set-lan", "text:Add Member");
                document.getElementById("ZoneStatus").style.display = "none";
                document.getElementById("ZoneModify").style.display = "none";
                getProfile();
            }
            else {
                document.getElementById("btnADD").style.display = "none";
                document.getElementById("ZonePass1").style.display = "none";
                document.getElementById("headPage").setAttribute("set-lan", "text:Edit Member");
                document.getElementById("headTopic").setAttribute("set-lan", "text:Edit Member");
                $('#username').prop("disabled", true);
                $('#credit').prop("disabled", true);
                postUser(uname);
            }

            $('#creditHelper').html('<span set-lan="html:Min"></span>' + ' 0, <span set-lan="html:Max"></span> ' + localStorage.getItem("Credit").toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,'));
        });

        function chgSuspend(ele) {
            if (ele.checked) {
                document.getElementById("txtSuspend").setAttribute("set-lan", "text:YesSus");
                SetLan(localStorage.getItem("Language"));
            } else {
                document.getElementById("txtSuspend").setAttribute("set-lan", "text:NoSus");
                SetLan(localStorage.getItem("Language"));
            }
        }

        function chgLock(ele) {
            if (ele.checked) {
                document.getElementById("txtLock").setAttribute("set-lan", "text:Lock");
                SetLan(localStorage.getItem("Language"));
            } else {
                document.getElementById("txtLock").setAttribute("set-lan", "text:Unlock");
                SetLan(localStorage.getItem("Language"));
            }
        }

        function editModify() {
            $('#modalModify').modal('show');
        }

        function editPass() {
            $('#modalPassword').modal('show');
        }

        function editStatus() {
            var Sus = $('#suspend').val();
            var Lock = $('#lock').val();
            if (Sus == "Yes" || Sus == "ใช่" || Sus == "是") {
                document.getElementById("chkSuspend").checked = true;
            } else {
                document.getElementById("chkSuspend").checked = false;
            }

            if (Lock == "Lock" || Lock == "ล็อค" || Lock == "锁") {
                document.getElementById("chkLock").checked = true;
            }
            else {
                document.getElementById("chkLock").checked = false;
            }

            $('#modalStatus').modal('show');
        }

        function changePT(type) {
            if (type == "our") {
                var txt = parseInt($("select#ddl_positiontracking").val());
                var pt = parseInt(localStorage.getItem("PositionTracking"));
                var total = 0;
                if (txt >= pt) {
                    total = txt - pt;
                }
                else if (txt <= pt) {
                    total = pt - txt;
                }
                $('#ddl_givenPT option').removeAttr('selected');
                $("#ddl_givenPT option[value='" + total + "']").attr("selected", "selected");
            }

            if (type == "given") {
                var txt = parseInt($("select#ddl_givenPT").val());
                var pt = parseInt(localStorage.getItem("PositionTracking"));
                var total = 0;
                if (txt >= pt) {
                    total = txt - pt;
                }
                else if (txt <= pt) {
                    total = pt - txt;
                }
                $('#ddl_positiontracking option').removeAttr('selected');
                $("#ddl_positiontracking option[value='" + total + "']").attr("selected", "selected");
            }
        }

        function AddCompany() {
            $("#myModalLoad").modal();

            if ($('#username').val() == "") {
                document.getElementById("lbAlert").setAttribute("set-lan", "text:missing 'Username' field");
                SetLan(localStorage.getItem("Language"));
                $('#modalAlert').modal('show');
                $("#myModalLoad").modal('hide');
            }
            else if ($('#password').val() == "") {
                document.getElementById("lbAlert").setAttribute("set-lan", "text:missing 'Password' field");
                SetLan(localStorage.getItem("Language"));
                $('#modalAlert').modal('show');
                $("#myModalLoad").modal('hide');
            }
            else if ($('#credit').val() == "") {
                document.getElementById("lbAlert").setAttribute("set-lan", "text:missing 'Credit' field");
                SetLan(localStorage.getItem("Language"));
                $('#modalAlert').modal('show');
                $("#myModalLoad").modal('hide');
            }
            //else if ($('#nickname').val() == "") {
            //    document.getElementById("lbAlert").setAttribute("set-lan", "text:missing 'nickname' field");
            //    SetLan(localStorage.getItem("Language"));
            //    $('#modalAlert').modal('show');
            //    $("#myModalLoad").modal('hide');
            //}
            //else if ($('#phonenumber').val() == "") {
            //    document.getElementById("lbAlert").setAttribute("set-lan", "text:missing 'phonenumber' field");
            //    SetLan(localStorage.getItem("Language"));
            //    $('#modalAlert').modal('show');
            //    $("#myModalLoad").modal('hide');
            //}
            else {
                postAddCompany();
            }
        }

        function SaveCompany() {
            $("#myModalLoad").modal();
            postEditCompany();
        }

        function saveEditModify() {
            $("#myModalLoad").modal();
            postSendModify();
        }

        function saveNewPass() {
            $("#myModalLoad").modal();

            if ($('#password_new').val() == "") {
                document.getElementById("lbAlert").setAttribute("set-lan", "text:missing 'New Password' field");
                SetLan(localStorage.getItem("Language"));
                $('#modalAlert').modal('show');
                $("#myModalLoad").modal('hide');
            }
            else {
                postNewPass();
            }
        }

        function saveEditStatus() {
            $("#myModalLoad").modal();
            var statussuspend = false;
            var statuslock = false;

            if (document.getElementById('chkSuspend').checked) {
                statussuspend = true;
            } else {
                statussuspend = false;
            }

            if (document.getElementById('chkLock').checked) {
                statuslock = true;
            } else {
                statuslock = false;
            }

            postEditStatus(statussuspend, statuslock);
        }

        const getProfile = async () => {
            const requestAwait = await fetchDataSite(`${apiURL}/v1/user/profile`, 'GET', "include", {})
            const response = await requestAwait.json()
            if (response.messageCode == 0000 || response.messageCode == null) {
                if (response.data.positionTracking != null || response.data.positionTracking != "") {
                    localStorage.setItem("PositionTracking", response.data.positionTracking);
                    localStorage.setItem("Credit", response.data.credit);

                    var htmlPT = "<option value='' disabled selected>Choose Position Tracking</option>";
                    var PT = response.data.positionTracking;
                    for (var i = 0; i <= PT; i++) {
                        htmlPT += "<option value=" + i + ">" + i + "%</option>";
                    }
                    document.getElementById('ddl_positiontracking').innerHTML = htmlPT;
                    document.getElementById('ddl_givenPT').innerHTML = htmlPT;
                    $("#ddl_positiontracking option[value='0']").attr("selected", "selected");
                    $("#ddl_givenPT option:last").attr("selected", "selected");
                }

                SetLan(localStorage.getItem("Language"));
                $("#myModalLoad").modal('hide');
            }
            else if (response.messageCode == 8004) {
                document.getElementById('lbAlert').innerHTML = response.messageDescription;
                $("#myModalLoad").modal('hide');
                $('#modalAlert').modal('show');
                window.location.href = "/Login.aspx";
            }
            else {
                document.getElementById('lbAlert').innerHTML = response.messageDescription;
                $("#myModalLoad").modal('hide');
                $('#modalAlert').modal('show');
            }
        }

        const postUser = async (username) => {
            const parameterCom = {
                id: username.toString(),
                page: 1,
                size: 20
            }

            const requestAwait = await fetchDataSite(`${apiURL}/v1/user/inquiry`, 'POST', "include", parameterCom)
            const response = await requestAwait.json()
            if (response.messageCode == 0000 || response.messageCode == null) {
                if (response.total != 0) {
                    for (var i = 0; i <= response.data.detail.length; i++) {
                        var Sus = response.data.detail[i].isSuspend;
                        var Lock = response.data.detail[i].isLock;
                        var Modi = response.data.detail[i].verifyOTP;

                        if (Sus == false) {
                            Sus = "No";
                        }
                        else {
                            Sus = "Yes";
                        }

                        if (Lock == false) {
                            Lock = "Unlock";
                        }
                        else {
                            Lock = "Lock";
                        }

                        if (Modi == false) {
                            Modi = "No";
                        }
                        else {
                            Modi = "Yes";
                        }

                        if (Sus == "Yes") {
                            document.getElementById("chkSuspend").checked = true;
                        }

                        if (Lock == "Lock") {
                            document.getElementById("chkLock").checked = true;
                        }

                        document.getElementById("modify").setAttribute("set-lan", "value:" + Modi + "Sus");
                        document.getElementById("txtModify").setAttribute("set-lan", "text:" + Modi + "Sus");
                        document.getElementById("suspend").setAttribute("set-lan", "value:" + Sus + "Sus");
                        document.getElementById("lock").setAttribute("set-lan", "value:" + Lock + "");
                        document.getElementById("txtSuspend").setAttribute("set-lan", "text:" + Sus + "Sus");
                        document.getElementById("txtLock").setAttribute("set-lan", "text:" + Lock + "");

                        $('#username').val(response.data.detail[i].username);
                        $('#nickname').val(response.data.detail[i].nickName);
                        $('#phonenumber').val(response.data.detail[i].phone);
                        $('#credit').val(Comma(response.data.detail[i].credit));
                        var ourPT = response.data.detail[i].ourPT;
                        var setPT = response.data.detail[i].ourPT + response.data.detail[i].givenPT;
                        localStorage.setItem("PositionTracking", setPT);

                        var htmlPT = "<option value='' disabled selected>Choose Position Tracking</option>";
                        var PT = response.data.detail[i].givenPT;
                        for (var i = 0; i <= PT; i++) {
                            htmlPT += "<option value=" + i + ">" + i + "%</option>";
                        }
                        document.getElementById('ddl_positiontracking').innerHTML = htmlPT;
                        document.getElementById('ddl_givenPT').innerHTML = htmlPT;
                        $("#ddl_positiontracking option[value='" + ourPT + "']").attr("selected", "selected");
                        $("#ddl_givenPT option:last").attr("selected", "selected");
                    }
                }
                SetLan(localStorage.getItem("Language"));
                $("#myModalLoad").modal('hide');
            }
            else if (response.messageCode == 8004) {
                document.getElementById('lbAlert').innerHTML = response.messageDescription;
                $("#myModalLoad").modal('hide');
                $('#modalAlert').modal('show');
                window.location.href = "/Login.aspx";
            }
            else {
                document.getElementById('lbAlert').innerHTML = response.messageDescription;
                $("#myModalLoad").modal('hide');
                $('#modalAlert').modal('show');
            }
        }

        const postAddCompany = async () => {
            var creditVal = $('#credit').val();
            var credit = creditVal.split(',').join("");
            const parameterAddCom = {
                username: $('#username').val(),
                password: $('#password').val(),
                nickName: $('#nickname').val(),
                phone: $('#phonenumber').val(),
                credit: parseInt(credit)
            }

            const requestAwait = await fetchDataSite(`${apiURL}/v1/member/create`, 'POST', "include", parameterAddCom)
            const response = await requestAwait.json()
            if (response.messageCode == 0000 || response.messageCode == null) {
                document.getElementById("lbAlertSuccess").setAttribute("set-lan", "text:Add member success");
                SetLan(localStorage.getItem("Language"));
                $("#myModalLoad").modal('hide');
                $('#modalAlertSuccess').modal();
                setTimeout(function () {
                    window.location.href = "/Menu_MemberManagement/company_list.aspx";
                }, 1500);
            }
            else if (response.messageCode == 8004) {
                document.getElementById('lbAlert').innerHTML = response.messageDescription;
                $("#myModalLoad").modal('hide');
                $('#modalAlert').modal('show');
                window.location.href = "/Login.aspx";
            }
            else {
                document.getElementById('lbAlert').innerHTML = response.messageDescription;
                $("#myModalLoad").modal('hide');
                $('#modalAlert').modal('show');
            }
        }

        const postNewPass = async () => {
            const parameterCom = {
                username: $('#username').val(),
                newPassword: $('#password_new').val()
            }

            const requestAwait = await fetchDataSite(`${apiURL}/v1/member/update_password`, 'POST', "include", parameterCom)
            const response = await requestAwait.json()
            if (response.messageCode == 0000 || response.messageCode == null) {
                document.getElementById("lbAlertSuccess").setAttribute("set-lan", "text:Change new password success");
                SetLan(localStorage.getItem("Language"));
                $('#modalPassword').modal('hide');
                $("#myModalLoad").modal('hide');
                $('#modalAlertSuccess').modal();
                setTimeout(function () {
                    location.reload();
                }, 1500);
            }
            else if (response.messageCode == 8004) {
                document.getElementById('lbAlert').innerHTML = response.messageDescription;
                $("#myModalLoad").modal('hide');
                $('#modalAlert').modal('show');
                window.location.href = "/Login.aspx";
            }
            else {
                document.getElementById('lbAlert').innerHTML = response.messageDescription;
                $("#myModalLoad").modal('hide');
                $('#modalAlert').modal('show');
            }
        }

        const postEditCompany = async () => {
            const parameterCom = {
                username: $('#username').val(),
                nickName: $('#nickname').val(),
                phone: $('#phonenumber').val()
            }

            const requestAwait = await fetchDataSite(`${apiURL}/v1/member/update_info`, 'POST', "include", parameterCom)
            const response = await requestAwait.json()
            if (response.messageCode == 0000 || response.messageCode == null) {
                document.getElementById("lbAlertSuccess").setAttribute("set-lan", "text:Edit member success");
                SetLan(localStorage.getItem("Language"));
                $("#myModalLoad").modal('hide');
                $('#modalAlertSuccess').modal();
                setTimeout(function () {
                    window.location.href = "/Menu_MemberManagement/company_list.aspx";
                }, 1500);
            }
            else if (response.messageCode == 8004) {
                document.getElementById('lbAlert').innerHTML = response.messageDescription;
                $("#myModalLoad").modal('hide');
                $('#modalAlert').modal('show');
                window.location.href = "/Login.aspx";
            }
            else {
                document.getElementById('lbAlert').innerHTML = response.messageDescription;
                $("#myModalLoad").modal('hide');
                $('#modalAlert').modal('show');
            }
        }

        var getUrlParameter = function getUrlParameter(sParam) {
            var sPageURL = window.location.search.substring(1),
                sURLVariables = sPageURL.split('&'),
                sParameterName,
                i;

            for (i = 0; i < sURLVariables.length; i++) {
                sParameterName = sURLVariables[i].split('=');

                if (sParameterName[0] === sParam) {
                    return sParameterName[1] === undefined ? true : decodeURIComponent(sParameterName[1]);
                }
            }
        };

        const postEditStatus = async (sus, lock) => {
            const parameterCom = {
                username: $('#username').val(),
                isLock: lock,
                isSuspend: sus
            }

            const requestAwait = await fetchDataSite(`${apiURL}/v1/member/update_status`, 'POST', "include", parameterCom)
            const response = await requestAwait.json()
            if (response.messageCode == 0000 || response.messageCode == null) {
                document.getElementById("lbAlertSuccess").setAttribute("set-lan", "text:Edit status suspend, lock success");
                SetLan(localStorage.getItem("Language"));
                $("#myModalLoad").modal('hide');
                $('#modalStatus').modal('hide');
                $('#modalAlertSuccess').modal();
                setTimeout(function () {
                    location.reload();
                }, 1500);
            }
            else if (response.messageCode == 8004) {
                document.getElementById('lbAlert').innerHTML = response.messageDescription;
                $("#myModalLoad").modal('hide');
                $('#modalAlert').modal('show');
                window.location.href = "/Login.aspx";
            }
            else {
                document.getElementById('lbAlert').innerHTML = response.messageDescription;
                $("#myModalLoad").modal('hide');
                $('#modalAlert').modal('show');
            }
        }

        const postSendModify = async () => {
            const parameter = {
                username: $('#username').val()
            }

            const requestAwait = await fetchDataSite(`${apiURL}/v1/member/update_verify_otp`, 'POST', "include", parameter)
            const response = await requestAwait.json()
            if (response.messageCode == 0000 || response.messageCode == null) {
                document.getElementById("lbAlertSuccess").setAttribute("set-lan", "text:Approve verify OTP success");
                SetLan(localStorage.getItem("Language"));
                $("#myModalLoad").modal('hide');
                $('#modalStatus').modal('hide');
                $('#modalAlertSuccess').modal();
                setTimeout(function () {
                    location.reload();
                }, 1500);
            }
            else if (response.messageCode == 8004) {
                document.getElementById('lbAlert').innerHTML = response.messageDescription;
                $("#myModalLoad").modal('hide');
                $('#modalAlert').modal('show');
                window.location.href = "/Login.aspx";
            }
            else {
                document.getElementById('lbAlert').innerHTML = response.messageDescription;
                $("#myModalLoad").modal('hide');
                $('#modalAlert').modal('show');
            }
        }

    </script>
</asp:Content>
