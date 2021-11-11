<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="reward.aspx.cs" Inherits="Pretty_Gaming.Menu_LuckyDraw.reward" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="" set-lan="text:Lucky Draw"></a></li>
            <li class="breadcrumb-item active txtMem" set-lan="text:Reward"></li>
        </ol>
    </nav>
    <div class="row">
        <div class="col-md-8">
            <h1 set-lan="text:Reward"></h1>
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
                    <th style="width: 10%;" set-lan="text:Reward"></th>
                    <th style='width: 8%; text-align: right; padding-right: 5px;' set-lan='text:Value'></th>
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
                        <div class="col-7">
                            <input type="text" class="form-control" id="ID" autocomplete="off" />
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="username" class="col-5 col-form-label" style="text-align: right;" set-lan="text:Reward_"></label>
                        <div class="col-7">
                            <input type="text" id="Reward" class="form-control" autocomplete="off" disabled />
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="username" class="col-5 col-form-label" style="text-align: right;" set-lan="html:Value-"></label>
                        <div class="col-7">
                            <input type="text" id="Count" class="form-control" autocomplete="off" onkeyup="javascript:this.value=Comma(this.value);" oninput="this.value=this.value.replace(/[^0-9]/g, '').replace(/(\..*)\./g, '$1');" />
                            <small class="text-muted form-text" set-lan="text:numberonly"></small>
                        </div>
                    </div>
                </div>
                <div class="modal-footer d-flex justify-content-center">
                    <button class="btn btn-yellow font-weight-bold" type="button" id="Add" onclick="btnSave('Add');" set-lan="text:Add Reward"></button>
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
        var Status_Lotto = localStorage.getItem("Status_Lotto");

        $(document).ready(function () {
            $("#menuLucky , #menuLucky > a").addClass("active");
            $("#menuLucky > div").css("display", "block");

            if (Status_Lotto != "EDIT") {
                $('.edit , .colEdit').css('display', 'none');
            }
            else {
                $('.edit , .colEdit').css('display', 'table-cell');
            }

            $('#creditHelper').html('<span set-lan="html:Min"></span>' + ' 0, <span set-lan="html:Max"></span> 100');

            getData();
            $("#myModalLoad").modal();
            SetLan(localStorage.getItem("Language"));
        });

        function btnSave(status) {
            var Count = $('#Count').val();

            if (Count == "" || Count == null) {
                document.getElementById("lbAlert").setAttribute("set-lan", "text:missing 'Value' field");
                SetLan(localStorage.getItem("Language"));
                $('#modalAlert').modal('show');
                $("#myModalLoad").modal('hide');
            }
            else if (Count == 0) {
                document.getElementById("lbAlert").setAttribute("set-lan", "text:Must be value greater than 0");
                SetLan(localStorage.getItem("Language"));
                $('#modalAlert').modal('show');
                $("#myModalLoad").modal('hide');
            }
            else {
                if (status == "Save") {
                    postEdit();
                }
            }
        }

        function btnEdit(ID, text, val) {
            document.getElementById("Add").style.display = "none";
            document.getElementById("Save").style.display = "block";
            document.getElementById("txtHead").setAttribute("set-lan", "text:Edit Reward");

            if (text == "firstPrize") {
                document.getElementById("Reward").setAttribute("set-lan", "value:First Prize");
            }
            else if (text == "firstThreeDigits") {
                document.getElementById("Reward").setAttribute("set-lan", "value:3 first numbers match");
            }
            else if (text == "lastThreeDigits") {
                document.getElementById("Reward").setAttribute("set-lan", "value:3 last numbers match");
            }
            else if (text == "lastTwoDigits") {
                document.getElementById("Reward").setAttribute("set-lan", "value:2 last numbers match");
            }

            $('#ID').val(ID);
            $('#Count').val(val);

            SetLan(localStorage.getItem("Language"));
            $("#modalTier").modal();
        }

        function btnDel(ID) {
            ID_DEL = ID;
            $("#modalDelete").modal();
        }

        const getData = async () => {
            const requestAwait = await fetchDataSite(`${apiURL}/v1/lotto/get/rewardConfig`, 'GET', "include", {})
            const response = await requestAwait.json()
            if (response.messageCode == 0000 || response.messageCode == null) {
                $("#tbData > tbody").html("");
                var htmlData = "";
                var no = 1;

                if (response.data != null) {
                    for (var i = 0; i < response.data.length; i++) {
                        var obj = response.data[i];
                        var rewardLotto = obj.rewardLotto.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1,");

                        htmlData += "<tr>";
                        htmlData += "<td style='width: 1%;' class='aligncenter'>" + no + "</td>";

                        var text = obj.typeReward;
                        if (text == "firstPrize") {
                            htmlData += "<td set-lan='text:First Prize'></td>";
                        }
                        else if (text == "firstThreeDigits") {
                            htmlData += "<td set-lan='text:3 first numbers match'></td>";
                        }
                        else if (text == "lastThreeDigits") {
                            htmlData += "<td set-lan='text:3 last numbers match'></td>";
                        }
                        else if (text == "lastTwoDigits") {
                            htmlData += "<td set-lan='text:2 last numbers match'></td>";
                        }

                        htmlData += "<td class='alignright'>" + rewardLotto + "</td>";
                        htmlData += "<td style='width: 1%;' class='aligncenter colEdit zonenone'><a class='link' onclick='btnEdit(`" + obj.id + "`,`" + obj.typeReward + "`,`" + rewardLotto + "`)'><i class='fas fa-pencil-alt'></i></a></td>";
                        htmlData += "</tr>";
                        no++;
                    }
                    $("#tbData > tbody").append(htmlData);
                }
                else {
                    $("#tbData > tbody").append("<tr><td colspan='5' style='text-align: center;' set-lan='text:No data.'></td></tr>");
                }

                if (Status_Lotto != "EDIT") {
                    $('.edit , .colEdit').css('display', 'none');
                }
                else {
                    $('.edit , .colEdit').css('display', 'table-cell');
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

        const postEdit = async () => {
            var Count = $('#Count').val();
            Count = Count.replaceAll(",", "");

            const parameter = {
                id: $('#ID').val(),
                rewardLotto: parseFloat(Count),
            }
            const requestAwait = await fetchDataSite(`${apiURL}/v1/lotto/set/rewardConfig`, 'POST', "include", parameter)
            const response = await requestAwait.json()

            if (response.messageCode == 0000 || response.messageCode == null) {
                document.getElementById("lbAlertSuccess").setAttribute("set-lan", "text:Edit reward success");
                SetLan(localStorage.getItem("Language"));
                $("#myModalLoad").modal('hide');
                $("#modalTier").modal('hide');
                $('#modalAlertSuccess').modal();
                setTimeout(function () {
                    window.location.href = "/Menu_LuckyDraw/reward.aspx";
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
