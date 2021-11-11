<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="notification.aspx.cs" Inherits="Pretty_Gaming.Menu_Notification.notification" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .overflow {
            width: 8.5em !important;
        }
    </style>
    <div class="row">
        <div class="col-md-8">
            <h1 set-lan="text:Notification"></h1>
        </div>
        <div class="col-md-4" style="text-align: right;" id="ZoneBtnAdd">
            <button id="btnAddMission" type="button" class="btn btn-yellow font-weight-bold" onclick="getModal()" set-lan="html:Notification_"></button>
        </div>
    </div>
    <div class="table-wrapper" style="margin-top: 10px; margin-bottom: 10px;">
        <section style="float: right; margin-bottom: 0.5rem;">
            <div class="data-container"></div>
            <div id="pagination-demo2"></div>
        </section>
        <table class="table table-border" id="tbData">
            <thead class="rgba-green-slight">
                <tr>
                    <th style="width: 1%;" set-lan="text:No"></th>
                    <th style='width: 2%;' set-lan='text:Create date'></th>
                    <th style="width: 10%; text-align: left; padding-left: 5px;" set-lan="text:Information"></th>
                    <th style='width: 10%; text-align: left; padding-left: 5px;' set-lan='text:Detail'></th>
                </tr>
            </thead>
            <tbody>
            </tbody>
            <tfoot class="rgba-yellow-slight">
                <tr class="total">
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
            </tfoot>
        </table>
    </div>

    <div class="modal fade" id="modalGet" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header text-center">
                    <h4 class="modal-title w-100 font-weight-bold" set-lan="text:Notification"></h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body mx-3">
                    <div class="form-group row mr-4">
                        <label for="email" class="col-4 col-form-label alignright" set-lan="html:Title-"></label>
                        <div class="col-8">
                            <input type="text" class="form-control" id="Title" autocomplete="off" />
                        </div>
                    </div>
                    <div class="form-group row mr-4">
                        <label for="email" class="col-4 col-form-label alignright" set-lan="html:Description-"></label>
                        <div class="col-8">
                            <textarea id="Description" rows="5" class="form-control" autocomplete="off"></textarea>
                        </div>
                    </div>
                </div>
                <div class="modal-footer d-flex justify-content-center">
                    <button class="btn btn-yellow font-weight-bold" onclick="btnOK()" type="button" set-lan="text:OK"></button>
                    <button type="button" class="btn btn-yellow font-weight-bold" data-dismiss="modal" aria-label="Close" set-lan="text:Close"></button>
                </div>
            </div>
        </div>
    </div>
    <%--modal--%>
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
    <script src="../js/pagination.js"></script>
    <script type="text/javascript">
        var Status_Notification = localStorage.getItem("Status_Notification");

        $(document).ready(function () {
            $("#menuNotification , #menuNotification > a").addClass("active");
            $("#menuNotification > div").css("display", "block");

            console.log(Status_Notification);
            if (Status_Notification != "EDIT") {
                document.getElementById("ZoneBtnAdd").style.display = "none";
            }

            getData();
            SetLan(localStorage.getItem("Language"));
        });

        function NewLine(str, maxLength) {
            var buff = "";
            var numOfLines = Math.floor(str.length / maxLength);
            for (var i = 0; i < numOfLines + 1; i++) {
                buff += str.substr(i * maxLength, maxLength); if (i !== numOfLines) { buff += "\n"; }
            }
            return buff;
        }

        function getModal() {
            $("#Title").val("");
            $("#Description").val("");
            $('#modalGet').modal('show');
        }

        function btnOK() {
            var Title = $('#Title').val();
            var Description = $('#Description').val();
            if (Title == "" || Title == null) {
                document.getElementById("lbAlert").setAttribute("set-lan", "text:missing 'Title' field");
                SetLan(localStorage.getItem("Language"));
                $('#modalAlert').modal('show');
                $("#myModalLoad").modal('hide');
            }
            else if (Description == "" || Description == null) {
                document.getElementById("lbAlert").setAttribute("set-lan", "text:missing 'Description' field");
                SetLan(localStorage.getItem("Language"));
                $('#modalAlert').modal('show');
                $("#myModalLoad").modal('hide');
            }
            else {
                postNotification();
            }
        }

        const getData = async () => {
            const requestAwait = await fetchDataSite(`${apiURL}/v1/notification/logs`, 'GET', "include", {})
            const response = await requestAwait.json()

            if (response.messageCode == 0000 || response.messageCode == null) {
                $("#tbData > tbody").html("");
                var htmlData = "";
                var no = 1;

                if (response.data.length != 0) {
                    for (var i = 0; i < response.data.length; i++) {
                        var obj = response.data[i];
                        var date = new Date(obj.createTime);
                        var dateSet = ("0" + date.getDate()).slice(-2) + "/" + ("0" + (date.getMonth() + 1)).slice(-2) + "/" + date.getFullYear() + " " + ("0" + date.getHours()).slice(-2) + ":" + ("0" + date.getMinutes()).slice(-2) + ":" + ("0" + date.getSeconds()).slice(-2);
                        var nLine = NewLine(obj.body, 80);

                        htmlData += "<tr>";
                        htmlData += "<td style='width: 1%;' class='aligncenter'>" + no + "</td>";
                        htmlData += "<td class='aligncenter'>" + dateSet + "</td>";
                        htmlData += "<td><b set-lan='text:Title'></b>:" + obj.title + "<br /><b set-lan='text:Description'></b>:" + nLine + "</td>";
                        htmlData += "<td><b set-lan='text:Success'></b>:" + obj.success.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "<br /><b set-lan='text:FAILED'></b>:" + obj.failure.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "<br /><b set-lan='text:Total-'></b>:" + obj.total.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                        no++;
                    }
                }
                else {
                    htmlData += "<tr><td colspan='4' style='text-align: center;' set-lan='text:No data.'></td></tr>";
                }
                $("#tbData > tbody").append(htmlData);
                SetLan(localStorage.getItem("Language"));
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

        const postNotification = async () => {
            const parameter = {
                title: $('#Title').val(),
                description: $('#Description').val()
            }
            const requestAwait = await fetchDataSite(`${apiURL}/v1/notification/broadcast`, 'POST', "include", parameter)
            const response = await requestAwait.json()
            if (response.messageCode == 0000 || response.messageCode == null) {
                document.getElementById("lbAlertSuccess").setAttribute("set-lan", "text:Notification success");
                SetLan(localStorage.getItem("Language"));
                $("#myModalLoad").modal('hide');
                $("#modalGet").modal('hide');
                $('#modalAlertSuccess').modal();
                setTimeout(function () {
                    window.location.href = "/Menu_Notification/notification.aspx";
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
