<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="password_change.aspx.cs" Inherits="Super_Slot.password_change" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="" set-lan="text:Account"></a></li>
            <li class="breadcrumb-item active" set-lan="text:Password"></li>
        </ol>
    </nav>
    <h1 set-lan="text:Change Password"></h1>
    <div class="section-group mb-4 col-6">
        <div class="form-row">
            <div class="form-group col-12">
                <div class="form-group row">
                    <label for="username" class="col-3 col-form-label" set-lan="text:Username"></label>
                    <div class="col-9">
                        <input type="text" class="form-control" id="username" disabled="disabled" autocomplete="off">
                    </div>
                </div>
                <div class="form-group row">
                    <label for="oldpassword" class="col-3 col-form-label" set-lan="html:Old Password"></label>
                    <div class="col-9">
                        <input type="text" class="form-control" id="oldpassword" autocomplete="off" maxlength="24">
                    </div>
                </div>
                <div class="form-group row">
                    <label for="newpassword" class="col-3 col-form-label" set-lan="html:New Password"></label>
                    <div class="col-9">
                        <input type="text" class="form-control" id="newpassword" autocomplete="off" maxlength="24">
                    </div>
                </div>
                <div class="form-group row">
                    <label for="confirmpassword" class="col-3 col-form-label" set-lan="html:Confirm Password"></label>
                    <div class="col-9">
                        <input type="text" class="form-control" id="confirmpassword" autocomplete="off" maxlength="24">
                    </div>
                </div>
            </div>
        </div>
        <div class="form-row">
            <div class="col-12" style="text-align: center;">
                <button class="btn btn-yellow font-weight-bold" onclick="savePassword()" type="button" set-lan="text:Save New Password"></button>
            </div>
        </div>
    </div>
    <div class="modal fade" id="modalAlertSuccess" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
        aria-hidden="true" style="z-index: 9999;">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header text-center">
                    <h4 class="modal-title w-100 font-weight-bold" set-lan="text:Success"></h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body mx-3 text-center">
                    <label set-lan="text:Change new password success"></label>
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
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainScript" runat="server">
    <script>
        var token = "";
        $(document).ready(function () {
            getProfile();

            if (localStorage.getItem("Position") != "SUPPORT") {
                $("#menuAccount , #menuAccount > a").addClass("active");
                $("#menuAccount > div").css("display", "block");
            } else {
                $("#menuAccountSup , #menuAccountSup > a").addClass("active");
                $("#menuAccountSup > div").css("display", "block");
            }

            $("#myModalLoad").modal();
        });

        const fetchDataProfile = (url = "", method = "GET", credentials = "include", body = {}) => {
            if (method == "GET") {
                return fetch(url, {
                    method,
                    headers: { 'Content-Type': 'application/json' },
                    credentials,
                })
            }
            return fetch(url, {
                method,
                headers: { 'Content-Type': 'application/json' },
                credentials,
                body: JSON.stringify(body) // body data type must match "Content-Type" header
            })
        }

        const getProfile = async () => {
            const requestAwait = await fetchDataProfile(`${apiURL}/v1/user/profile`, 'GET', "include", {})
            const response = await requestAwait.json()
            if (response.messageCode == 0000 || response.messageCode == null) {
                $('#username').val(response.data.username);
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

        const postChangePass = async () => {
            const parameterPass = {
                oldPassword: $('#oldpassword').val(),
                newPassword: $('#newpassword').val()
            }
            const requestAwait = await fetchDataProfile(`${apiURL}/v1/user/changepassword`, 'POST', "include", parameterPass)
            const response = await requestAwait.json()
            if (response.messageCode == 0000 || response.messageCode == null) {
                SetLan(localStorage.getItem("Language"));
                $("#myModalLoad").modal('hide');
                $('#modalAlertSuccess').modal();
                setTimeout(function () {
                    window.location.href = "/Menu_Account/password_change.aspx";
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

        function savePassword() {
            $("#myModalLoad").modal();
            if ($('#oldpassword').val() == "") {
                document.getElementById("lbAlert").setAttribute("set-lan", "text:missing 'Old Password' field");
                SetLan(localStorage.getItem("Language"));
                $('#modalAlert').modal('show');
                $("#myModalLoad").modal('hide');
            }
            else if ($('#newpassword').val() == "") {
                document.getElementById("lbAlert").setAttribute("set-lan", "text:missing 'New Password' field");
                SetLan(localStorage.getItem("Language"));
                $('#modalAlert').modal('show');
                $("#myModalLoad").modal('hide');
            }
            else if ($('#confirmpassword').val() == "") {
                document.getElementById("lbAlert").setAttribute("set-lan", "text:missing 'Confirm Password' field");
                SetLan(localStorage.getItem("Language"));
                $('#modalAlert').modal('show');
                $("#myModalLoad").modal('hide');
            }
            else if ($('#newpassword').val() != $('#confirmpassword').val()) {
                document.getElementById("lbAlert").setAttribute("set-lan", "text:New password doesn't match confirm password");
                SetLan(localStorage.getItem("Language"));
                $('#modalAlert').modal('show');
                $("#myModalLoad").modal('hide');
            }
            else if ($('#oldpassword').val() == "") {
                document.getElementById("lbAlert").setAttribute("set-lan", "text:missing 'Old Password' field");
                SetLan(localStorage.getItem("Language"));
                $('#modalAlert').modal('show');
                $("#myModalLoad").modal('hide');
            }
            else {
                postChangePass();
            }
        }


    </script>
</asp:Content>
