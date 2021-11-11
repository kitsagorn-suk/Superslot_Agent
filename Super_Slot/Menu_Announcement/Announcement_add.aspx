<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Announcement_add.aspx.cs" Inherits="Pretty_Gaming.Menu_Announcement.Announcement_add" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="" set-lan="text:Management"></a></li>
            <li class="breadcrumb-item"><a href="/Menu_MemberManagement/sub_accounts.aspx" set-lan="text:Sub User List"></a></li>
            <li class="breadcrumb-item active" id="headPage" set-lan="text:Add Sub User"></li>
        </ol>
    </nav>
    <h1 id="headTopic" set-lan="text:Add Sub User"></h1>
    <div class="section-group mb-4">
        <h4 set-lan="text:Basic Info"></h4>
        <div class="form-row">
            <div class="form-group col-6">
                <div class="form-group row inputform">
                    <label for="username" class="col-4 col-form-label" set-lan="html:Username-"></label>
                    <label for="username" class="col-3 col-form-label" id="mainUser"></label>
                    <div class="col-5">
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
                <div class="form-group col-6">
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
        <h4 set-lan="text:Permissions"></h4>
        <div class="form-row">
            <div class="form-group col-5">
                <div class="form-group">
                    <div class="row mb-1 inputform">
                        <label class="col-5 col-form-label input-text-label" set-lan="text:Dashboard"></label>
                        <div class="col-7">
                            <div class="form-check form-check-inline">
                                <input type="radio" class="form-check-input" id="DashboardRadio_off" name="DashboardRadio" value="OFF">
                                <label class="form-check-label red-text" for="DashboardRadio_off" set-lan="text:Off">Off</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input type="radio" checked="" class="form-check-input" id="DashboardRadio_view" name="DashboardRadio" value="VIEW">
                                <label class="form-check-label orange-text" for="DashboardRadio_view" set-lan="text:View">View</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input type="radio" class="form-check-input" id="DashboardRadio_edit" name="DashboardRadio" value="EDIT">
                                <label class="form-check-label green-text" for="DashboardRadio_edit" set-lan="text:Edit">Edit</label>
                            </div>
                        </div>
                    </div>
                    <div class="row mb-1 inputform">
                        <label class="col-5 col-form-label input-text-label" set-lan="text:Account"></label>
                        <div class="col-7">
                            <div class="form-check form-check-inline">
                                <input type="radio" class="form-check-input" id="AccountRadio_off" name="AccountRadio" value="OFF">
                                <label class="form-check-label red-text" for="AccountRadio_off" set-lan="text:Off">Off</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input type="radio" checked="" class="form-check-input" id="AccountRadio_view" name="AccountRadio" value="VIEW">
                                <label class="form-check-label orange-text" for="AccountRadio_view" set-lan="text:View">View</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input type="radio" class="form-check-input" id="AccountRadio_edit" name="AccountRadio" value="EDIT">
                                <label class="form-check-label green-text" for="AccountRadio_edit" set-lan="text:Edit">Edit</label>
                            </div>
                        </div>
                    </div>
                    <div class="row mb-1 inputform">
                        <label class="col-5 col-form-label input-text-label" set-lan="text:Management"></label>
                        <div class="col-7">
                            <div class="form-check form-check-inline">
                                <input type="radio" class="form-check-input" id="MemberManagementRadio_off" name="MemberManagementRadio" value="OFF">
                                <label class="form-check-label red-text" for="MemberManagementRadio_off" set-lan="text:Off">Off</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input type="radio" checked="" class="form-check-input" id="MemberManagementRadio_view" name="MemberManagementRadio" value="VIEW">
                                <label class="form-check-label orange-text" for="MemberManagementRadio_view" set-lan="text:View">View</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input type="radio" class="form-check-input" id="MemberManagementRadio_edit" name="MemberManagementRadio" value="EDIT">
                                <label class="form-check-label green-text" for="MemberManagementRadio_edit" set-lan="text:Edit">Edit</label>
                            </div>
                        </div>
                    </div>
                    <div class="row mb-1 inputform">
                        <label class="col-5 col-form-label input-text-label" set-lan="text:Report"></label>
                        <div class="col-7">
                            <div class="form-check form-check-inline">
                                <input type="radio" class="form-check-input" id="ReportRadio_off" name="ReportRadio" value="OFF">
                                <label class="form-check-label red-text" for="ReportRadio_off" set-lan="text:Off">Off</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input type="radio" checked="" class="form-check-input" id="ReportRadio_view" name="ReportRadio" value="VIEW">
                                <label class="form-check-label orange-text" for="ReportRadio_view" set-lan="text:View">View</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input type="radio" class="form-check-input" id="ReportRadio_edit" name="ReportRadio" value="EDIT">
                                <label class="form-check-label green-text" for="ReportRadio_edit" set-lan="text:Edit">Edit</label>
                            </div>
                        </div>
                    </div>
                    <div class="row mb-1 inputform">
                        <label class="col-5 col-form-label input-text-label" set-lan="text:Payment"></label>
                        <div class="col-7">
                            <div class="form-check form-check-inline">
                                <input type="radio" class="form-check-input" id="PaymentRadio_off" name="PaymentRadio" value="OFF">
                                <label class="form-check-label red-text" for="PaymentRadio_off" set-lan="text:Off">Off</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input type="radio" checked="" class="form-check-input" id="PaymentRadio_view" name="PaymentRadio" value="VIEW">
                                <label class="form-check-label orange-text" for="PaymentRadio_view" set-lan="text:View">View</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input type="radio" class="form-check-input" id="PaymentRadio_edit" name="PaymentRadio" value="EDIT">
                                <label class="form-check-label green-text" for="PaymentRadio_edit" set-lan="text:Edit">Edit</label>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="form-row">
            <div class="col-12" style="text-align: center; margin-top: 1rem;">
                <button class="btn btn-yellow font-weight-bold" id="btnADD" onclick="AddSubUser()" type="button" set-lan="text:Add Sub User"></button>
                <button class="btn btn-yellow font-weight-bold" id="btnSAVE" onclick="SaveSubUser()" type="button" set-lan="text:Save Sub User"></button>
            </div>
        </div>
    </div>

    <!-- Modal -->
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
                    <button type="button" class="btn btn-yellow font-weight-bold" data-dismiss="modal" aria-label="Close" set-lan="text:Close"></button>
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

            $("#mainUser").text(localStorage.getItem("Username") + "@");

            var uname = getUrlParameter('uname');
            if (uname == "") {
                document.getElementById("btnSAVE").style.display = "none";
                document.getElementById("ZonePass2").style.display = "none";
                document.getElementById("ZoneStatus").style.display = "none";
                document.getElementById("headPage").setAttribute("set-lan", "text:Add Sub Userr");
                document.getElementById("headTopic").setAttribute("set-lan", "text:Add Sub User");
                getProfile();
            }
            else {
                document.getElementById("mainUser").style.display = "none";
                document.getElementById("btnADD").style.display = "none";
                document.getElementById("ZonePass1").style.display = "none";
                document.getElementById("headPage").setAttribute("set-lan", "text:Edit Sub User");
                document.getElementById("headTopic").setAttribute("set-lan", "text:Edit Sub User");
                $('#username').prop("disabled", true);
                postUser(uname);
            }
        });

        function editStatus() {
            var Lock = $('#lock').val();
            if (Lock == "Lock" || Lock == "ล็อค" || Lock == "锁") {
                document.getElementById("chkLock").checked = true;
            }
            else {
                document.getElementById("chkLock").checked = false;
            }

            $('#modalStatus').modal('show');
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

        function saveEditStatus() {
            $("#myModalLoad").modal();
            var statuslock = false;

            if (document.getElementById('chkLock').checked) {
                statuslock = true;
            } else {
                statuslock = false;
            }

            postEditStatus(statuslock);
        }

        function editPass() {
            $('#modalPassword').modal('show');
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

        function SaveSubUser() {
            $("#myModalLoad").modal();
            postEditSub();
        }

        function AddSubUser() {
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
            else {
                postAddSub();
            }
        }

        const postAddSub = async () => {
            const parameterAddSub = {
                username: $('#username').val(),
                password: $('#password').val(),
                nickName: $('#nickname').val(),
                phone: $('#phonenumber').val(),
                permissions: {
                    dashboard: $("input[name='DashboardRadio']:checked").val(),
                    account: $("input[name='AccountRadio']:checked").val(),
                    member: $("input[name='MemberManagementRadio']:checked").val(),
                    report: $("input[name='ReportRadio']:checked").val(),
                    payment: $("input[name='PaymentRadio']:checked").val()
                }
            }

            const requestAwait = await fetchDataSite(`${apiURL}/v1/subuser/create`, 'POST', "include", parameterAddSub)
            const response = await requestAwait.json()
            console.log(response);
            if (response.messageCode == 0000 || response.messageCode == null) {
                document.getElementById("lbAlertSuccess").setAttribute("set-lan", "text:Add sub user success");
                SetLan(localStorage.getItem("Language"));
                $("#myModalLoad").modal('hide');
                $('#modalAlertSuccess').modal();
                setTimeout(function () {
                    window.location.href = "/Menu_MemberManagement/sub_accounts.aspx";
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

        const postEditSub = async () => {
            const parameterAddSub = {
                username: $('#username').val(),
                nickName: $('#nickname').val(),
                phone: $('#phonenumber').val(),
                permissions: {
                    dashboard: $("input[name='DashboardRadio']:checked").val(),
                    account: $("input[name='AccountRadio']:checked").val(),
                    member: $("input[name='MemberManagementRadio']:checked").val(),
                    report: $("input[name='ReportRadio']:checked").val(),
                    payment: $("input[name='PaymentRadio']:checked").val()
                }
            }
            console.log(parameterAddSub);

            const requestAwait = await fetchDataSite(`${apiURL}/v1/subuser/update`, 'POST', "include", parameterAddSub)
            const response = await requestAwait.json()
            console.log(response);
            if (response.messageCode == 0000 || response.messageCode == null) {
                document.getElementById("lbAlertSuccess").setAttribute("set-lan", "text:Edit sub user success");
                SetLan(localStorage.getItem("Language"));
                $("#myModalLoad").modal('hide');
                $('#modalAlertSuccess').modal();
                setTimeout(function () {
                    window.location.href = "/Menu_MemberManagement/sub_accounts.aspx";
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

        const postUser = async (username) => {
            const parameterSub = {
                page: 1,
                size: 20
            }

            const requestAwait = await fetchDataSite(`${apiURL}/v1/subuser/inquiry`, 'POST', "include", parameterSub)
            const response = await requestAwait.json()
            console.log(response);
            if (response.messageCode == 0000 || response.messageCode == null) {
                for (var i = 0; i < response.data.length; i++) {
                    if (response.data[i].id == username) {
                        $('#username').val(response.data[i].username);
                        $('#nickname').val(response.data[i].nickName);
                        $('#phonenumber').val(response.data[i].phone);

                        var Lock = response.data[i].isLock;
                        var txtDash = response.data[i].permissions.dashboard;
                        var txtAccount = response.data[i].permissions.account;
                        var txtMember = response.data[i].permissions.member;
                        var txtReport = response.data[i].permissions.report;
                        var txtPayment = response.data[i].permissions.payment;

                        if (Lock == false) {
                            Lock = "Unlock";
                        }
                        else {
                            Lock = "Lock";
                        }
                        document.getElementById("lock").setAttribute("set-lan", "value:" + Lock + "");
                        document.getElementById("txtLock").setAttribute("set-lan", "text:" + Lock + "");

                        if (txtDash == "OFF") {
                            document.getElementById("DashboardRadio_off").checked = true;
                        }
                        else if (txtDash == "VIEW") {
                            document.getElementById("DashboardRadio_view").checked = true;
                        }
                        else if (txtDash == "EDIT") {
                            document.getElementById("DashboardRadio_edit").checked = true;
                        }

                        if (txtAccount == "OFF") {
                            document.getElementById("AccountRadio_off").checked = true;
                        }
                        else if (txtAccount == "VIEW") {
                            document.getElementById("AccountRadio_view").checked = true;
                        }
                        else if (txtAccount == "EDIT") {
                            document.getElementById("AccountRadio_edit").checked = true;
                        }

                        if (txtMember == "OFF") {
                            document.getElementById("MemberManagementRadio_off").checked = true;
                        }
                        else if (txtMember == "VIEW") {
                            document.getElementById("MemberManagementRadio_view").checked = true;
                        }
                        else if (txtMember == "EDIT") {
                            document.getElementById("MemberManagementRadio_edit").checked = true;
                        }

                        if (txtReport == "OFF") {
                            document.getElementById("ReportRadio_off").checked = true;
                        }
                        else if (txtReport == "VIEW") {
                            document.getElementById("ReportRadio_view").checked = true;
                        }
                        else if (txtReport == "EDIT") {
                            document.getElementById("ReportRadio_edit").checked = true;
                        }

                        if (txtPayment == "OFF") {
                            document.getElementById("PaymentRadio_off").checked = true;
                        }
                        else if (txtPayment == "VIEW") {
                            document.getElementById("PaymentRadio_view").checked = true;
                        }
                        else if (txtPayment == "EDIT") {
                            document.getElementById("PaymentRadio_edit").checked = true;
                        }

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

        const postNewPass = async () => {
            const parameterCom = {
                username: $('#username').val(),
                newPassword: $('#password_new').val()
            }
            const requestAwait = await fetchDataSite(`${apiURL}/v1/subuser/update_password`, 'POST', "include", parameterCom)
            const response = await requestAwait.json()
            console.log(response);
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

        const postEditStatus = async (lock) => {
            const parameterCom = {
                username: $('#username').val(),
                isLock: lock
            }

            const requestAwait = await fetchDataSite(`${apiURL}/v1/user/update_status`, 'POST', "include", parameterCom)
            const response = await requestAwait.json()
            console.log(response);
            if (response.messageCode == 0000 || response.messageCode == null) {
                document.getElementById("lbAlertSuccess").setAttribute("set-lan", "text:Edit status lock success");
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
    </script>
</asp:Content>
