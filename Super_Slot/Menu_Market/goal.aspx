<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="goal.aspx.cs" Inherits="Pretty_Gaming.Menu_Market.goal" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="" set-lan="text:Market"></a></li>
            <li class="breadcrumb-item active txtMem" set-lan="text:Goal"></li>
        </ol>
    </nav>
    <div class="row">
        <div class="col-md-8">
            <h1 set-lan="text:Goal"></h1>
        </div>
        <%--<div class="col-md-4" style="text-align: right;" id="ZoneBtnAdd">
            <button id="btnAddAnnouncement" type="button" class="btn btn-yellow font-weight-bold" onclick="newData('Add Goal')" set-lan="html:Add Goal_"></button>
        </div>--%>
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
                    <th style='width: 5%; text-align: left; padding-left: 5px;' set-lan='text:Goal'></th>
                    <th style='width: 5%; text-align: right; padding-right: 5px;' set-lan='text:Turnover'></th>
                    <th style="width: 1%;" class="edit" set-lan="text:Action"></th>
                </tr>
            </thead>
            <tbody></tbody>
            <tfoot class="rgba-yellow-slight">
                <tr class="total">
                    <td></td>
                    <td></td>
                    <td></td>
                    <td class="edit"></td>
                </tr>
            </tfoot>
        </table>
    </div>

    <%--modal--%>
    <div class="modal fade" id="modalTier" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header text-center">
                    <h4 class="modal-title w-100 font-weight-bold" id="txtHead"></h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body mx-3">
                    <div class="form-group row" style="display: none;">
                        <label for="ID" class="col-4 col-form-label" style="text-align: right;">ID :</label>
                        <div class="col-8">
                            <input type="text" class="form-control" id="ID" autocomplete="off" />
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="username" class="col-4 col-form-label" style="text-align: right;" set-lan="html:Goal-"></label>
                        <div class="col-8">
                            <input type="text" id="Goal" class="form-control" autocomplete="off" oninput="this.value=this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" />
                            <small class="text-muted form-text" set-lan="text:numberonly"></small>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="username" class="col-4 col-form-label" style="text-align: right;" set-lan="html:Turnover-"></label>
                        <div class="col-8">
                            <input type="text" id="Turnover" class="form-control" autocomplete="off" onkeyup="javascript:this.value=Comma(this.value);" oninput="this.value=this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" />
                            <small class="text-muted form-text" set-lan="text:numberonly"></small>
                        </div>
                    </div>
                </div>
                <div class="modal-footer d-flex justify-content-center">
                    <button class="btn btn-yellow font-weight-bold" type="button" id="Add" onclick="btnSave('Add');" set-lan="text:Add Goal"></button>
                    <button class="btn btn-yellow font-weight-bold" type="button" id="Save" onclick="btnSave('Save');" set-lan="text:Save"></button>
                    <button type="button" class="btn btn-yellow font-weight-bold" data-dismiss="modal" aria-label="Close" set-lan="text:Cancel"></button>
                </div>
            </div>
        </div>
    </div>
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
                    <label id="lbAlertTEN"></label>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainScript" runat="server">
    <script>
        var ID_DEL = "";
        var Status_Market = localStorage.getItem("Status_Market");

        $(document).ready(function () {
            $("#menuMarket , #menuMarket > a").addClass("active");
            $("#menuMarket > div").css("display", "block");

            if (Status_Market != "EDIT") {
                //document.getElementById("ZoneBtnAdd").style.display = "none";
                $('.edit , .colEdit').css('display', 'none');
            }
            //else {
            //    $('.edit , .colEdit').css('display', 'table-cell');
            //}

            getData();
            $("#myModalLoad").modal();
            SetLan(localStorage.getItem("Language"));
        });

        function newData(type) {
            document.getElementById('Add').disabled = false;
            document.getElementById("Add").style.display = "block";
            document.getElementById("Save").style.display = "none";
            document.getElementById("txtHead").setAttribute("set-lan", "text:" + type);

            $('#ID').val("");
            $('#Goal').val("");
            $('#Turnover').val("");

            SetLan(localStorage.getItem("Language"));
            $("#modalTier").modal();
        }

        function btnSave(status) {
            var Goal = $('#Goal').val();
            var Turnover = $('#Turnover').val();

            if (Goal == "" || Goal == null) {
                document.getElementById("lbAlert").setAttribute("set-lan", "text:missing 'Goal' field");
                SetLan(localStorage.getItem("Language"));
                $('#modalAlert').modal('show');
                $("#myModalLoad").modal('hide');
            }
            else if (Turnover == "" || Turnover == null) {
                document.getElementById("lbAlert").setAttribute("set-lan", "text:missing 'Turnover' field");
                SetLan(localStorage.getItem("Language"));
                $('#modalAlert').modal('show');
                $("#myModalLoad").modal('hide');
            }
            else {
                if (status == "Add") {
                    postAdd();
                }
                else if (status == "Save") {
                    postEdit();
                }
            }
        }

        function btnEdit(ID, goal, turnover, tier) {
            document.getElementById("Add").style.display = "none";
            document.getElementById("Save").style.display = "block";
            document.getElementById("txtHead").setAttribute("set-lan", "text:Edit Goal");

            $('#ID').val(ID);
            $('#Goal').val(goal);
            $('#Turnover').val(turnover);

            SetLan(localStorage.getItem("Language"));
            $("#modalTier").modal();
        }

        function btnDel(ID) {
            ID_DEL = ID;
            $("#modalDelete").modal();
        }

        const getData = async () => {
            const requestAwait = await fetchDataSite(`${apiURL}/v1/market/get/goal`, 'GET', "include", {})
            const response = await requestAwait.json()

            if (response.messageCode == 0000 || response.messageCode == null) {
                $("#tbData > tbody").html("");
                var htmlData = "";
                var no = 1;
                if (response.data != null) {
                    for (var i = 0; i < response.data.length; i++) {
                        var obj = response.data[i];
                        var turnover = obj.turnover.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1,");

                        htmlData += "<tr>";
                        htmlData += "<td style='width: 1%;' class='aligncenter'>" + no + "</td>";
                        htmlData += "<td>" + obj.goal + "</td>";
                        htmlData += "<td class='alignright'>" + turnover + "</td>";
                        htmlData += "<td style='width: 1%;' class='aligncenter colEdit zonenone'><a class='link' onclick='btnEdit(`" + obj.id + "`,`" + obj.goal + "`,`" + turnover + "`)'><i class='fas fa-pencil-alt'></i></a></td>";
                        htmlData += "</tr>";
                        no++;
                    }
                    $("#tbData > tbody").append(htmlData);
                }
                else {
                    $("#tbData > tbody").append("<tr><td colspan='5' style='text-align: center;' set-lan='text:No data.'></td></tr>");
                }

                if (Status_Market != "EDIT") {
                    //document.getElementById("ZoneBtnAdd").style.display = "none";
                    $('.edit , .colEdit').css('display', 'none');
                }
                //else {
                //    $('.edit , .colEdit').css('display', 'table-cell');
                //}

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

        const postAdd = async () => {
            var Turnover = $('#Turnover').val();
            Turnover = Turnover.replaceAll(",", "");

            const parameter = {
                goal: parseFloat($('#Goal').val()),
                turnover: parseFloat(Turnover),
                tierID: $('#selTier').val()
            }
            const requestAwait = await fetchDataSite(`${apiURL}/v1/randomJackpot/add/goal`, 'POST', "include", parameter)
            const response = await requestAwait.json()

            if (response.messageCode == 0000 || response.messageCode == null) {
                document.getElementById("lbAlertSuccess").setAttribute("set-lan", "text:Add new goal success");
                SetLan(localStorage.getItem("Language"));
                $("#myModalLoad").modal('hide');
                $("#modalAnnouncement").modal('hide');
                $('#modalAlertSuccess').modal();
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

        const postEdit = async () => {
            var Turnover = $('#Turnover').val();
            Turnover = Turnover.replaceAll(",", "");

            const parameter = {
                id: $('#ID').val(),
                goal: parseFloat($('#Goal').val()),
                turnover: parseFloat(Turnover)
            }
            const requestAwait = await fetchDataSite(`${apiURL}/v1/market/edit/goal`, 'POST', "include", parameter)
            const response = await requestAwait.json()

            if (response.messageCode == 0000 || response.messageCode == null) {
                document.getElementById("lbAlertSuccess").setAttribute("set-lan", "text:Edit goal success");
                SetLan(localStorage.getItem("Language"));
                $("#myModalLoad").modal('hide');
                $("#modalTier").modal('hide');
                $('#modalAlertSuccess').modal();
                setTimeout(function () {
                    window.location.href = "/Menu_Market/goal.aspx";
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
