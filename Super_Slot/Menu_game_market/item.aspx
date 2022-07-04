<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="item.aspx.cs" Inherits="Pretty_Gaming.Menu_game_market.item" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="" set-lan="text:Game Market"></a></li>
            <li class="breadcrumb-item active txtMem" set-lan="text:Item"></li>
        </ol>
    </nav>
    <div class="row">
        <div class="col-md-8">
            <h1 set-lan="text:Item"></h1>
        </div>
    </div>
    <div class="btn-toolbar section-group" role="toolbar" style="padding-bottom: 0px !important;">
        <div class="row col-md-12">
            <div class="form-group row" style="padding-left: 1rem;">
                <label for="email" class="col-form-label" set-lan="text:Provider_"></label>
                <div style="padding-left: 1rem;">
                    <div class="select-outline">
                        <select id="selProvider" class="mdb-select" name="LselPro">
                            <option value="0" set-lan="text:Select"></option>
                        </select>
                    </div>
                </div>
            </div>

            <%--Don't Delete!--%>
            <div class="row" style="padding-left: 2.5rem; display: none;">
                <label for="DontDelete" class="col-form-label alignright">Don't Delete!</label>
                <div style="padding-left: 1rem;" class="select-outline">
                    <select class="mdb-select" id="DontDelete">
                        <option value="0" disabled selected></option>
                    </select>
                </div>
            </div>

            <div class="form-group row" style="padding-left: 2rem;">
                <button class="btn btn-yellow font-weight-bold m-0 px-3 py-2 z-depth-0 waves-effect btnMenu" type="button" set-lan="text:Search" onclick="Search_Click()"></button>
            </div>
            <div class="form-group row" style="padding-left: 2rem;">
                <button class="btn btn-yellow font-weight-bold m-0 px-3 py-2 z-depth-0 waves-effect btnMenu" type="button" set-lan="html:Sync Item-" onclick="SyncItem()"></button>
            </div>
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
                    <th style="width: 2%;" set-lan="text:No"></th>
                    <th style="width: 10%;" set-lan="text:Item"></th>
                    <th style='width: 8%; text-align: right; padding-right: 5px;' set-lan='text:Value'></th>
                    <th style="width: 10%;" set-lan="text:Percent"></th>
                    <th style='width: 8%; text-align: right; padding-right: 5px;'><span set-lan='text:Count'></span>(<span set-lan="text:per week"></span>)</th>
                    <th style="width: 10%;" set-lan="text:Image"></th>
                    <th style="width: 5%;" set-lan="text:Status"></th>
                    <th style="width: 1%;" class="edit" set-lan="text:Action"></th>
                </tr>
            </thead>
            <tbody></tbody>
            <tfoot class="rgba-yellow-slight">
                <tr class="total">
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
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
                        <label for="username" class="col-5 col-form-label" style="text-align: right;" set-lan="text:Item_"></label>
                        <div class="col-7">
                            <input type="text" id="txtItem" class="form-control" autocomplete="off" disabled />
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="username" class="col-5 col-form-label" style="text-align: right;" set-lan="text:Value_"></label>
                        <div class="col-4">
                            <input type="text" id="txtValue" class="form-control" autocomplete="off" disabled />
                        </div>
                        <label for="username" class="col-3 col-form-label" style="text-align: left;" set-lan="text:Point"></label>
                    </div>
                    <div class="form-group row">
                        <label for="username" class="col-5 col-form-label" style="text-align: right;" set-lan="html:Percent-"></label>
                        <div class="col-4">
                            <input type="text" id="Percent1" class="form-control" autocomplete="off" oninput="this.value=this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" />
                            <small class="text-muted form-text" set-lan="text:numberonly"></small>
                        </div>
                        <label for="username" class="col-1 col-form-label" style="text-align: left;">%</label>
                    </div>
                    <div class="form-group row">
                        <label for="username" class="col-5 col-form-label" style="text-align: right;" set-lan="html:Count-"></label>
                        <div class="col-4">
                            <input type="text" id="Count" class="form-control" autocomplete="off" onkeyup="javascript:this.value=Comma(this.value);" oninput="this.value=this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" />
                            <small class="text-muted form-text" set-lan="text:numberonly"></small>
                        </div>
                        <label for="username" class="col-3 col-form-label" style="text-align: left;" set-lan="text:per week"></label>
                    </div>
                    <div class="form-group row">
                        <label for="username" class="col-5 col-form-label" style="text-align: right;" set-lan="html:Status_"></label>
                        <div class="col-7">
                            <div class="select-outline">
                                <select class="mdb-select" id="selStatus" name="LselStatus">
                                    <option value="true" set-lan="text:Active"></option>
                                    <option value="false" set-lan="text:Inactive"></option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <%--Don't Delete!--%>
                    <div class="row" style="padding-left: 2.5rem; display: none;">
                        <label for="DontDelete" class="col-form-label alignright">Don't Delete!</label>
                        <div style="padding-left: 1rem;" class="select-outline">
                            <select class="mdb-select" id="DontDelete">
                                <option value="0" disabled selected></option>
                            </select>
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
        var Status_GameMarket = localStorage.getItem("Status_GameMarket");

        $(document).ready(function () {
            getProvider();

            $("#menuGame , #menuGame > a").addClass("active");
            $("#menuGame > div").css("display", "block");

            if (Status_GameMarket != "EDIT") {
                $('.edit , .colEdit').css('display', 'none');
            }
            else {
                $('.edit , .colEdit').css('display', 'table-cell');
            }

            $('#creditHelper').html('<span set-lan="html:Min"></span>' + ' 0, <span set-lan="html:Max"></span> 100');

            $('body').on('keyup', function (evt) {
                if (evt.keyCode == 13) {
                    if (Check_Enter == "Enter") {
                        Check_Enter = "";
                    }
                    else {
                        evt.preventDefault()
                        Search_Click();
                    }
                }
            });

            getData();
            SetLan(localStorage.getItem("Language"));
        });

        function Search_Click() {
            getData();
        }

        function SyncItem() {
            postSyncItem();
        }

        function btnSave(status) {
            var Percent1 = $('#Percent1').val();
            var Count = $('#Count').val();


            if (Percent1 == "" || Percent1 == null) {
                document.getElementById("lbAlert").setAttribute("set-lan", "text:missing 'Percent' field");
                SetLan(localStorage.getItem("Language"));
                $('#modalAlert').modal('show');
                $("#myModalLoad").modal('hide');
            }
            else if (Count == "" || Count == null) {
                document.getElementById("lbAlert").setAttribute("set-lan", "text:missing 'Count' field");
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

        function btnEdit(ID, itemName, value, percent, count, status) {
            document.getElementById("Add").style.display = "none";
            document.getElementById("Save").style.display = "block";
            document.getElementById("txtHead").setAttribute("set-lan", "text:Edit Item");

            $('#ID').val(ID);
            $('#txtItem').val(itemName);
            $('#txtValue').val(value);
            $('#Percent1').val(percent);
            $('#Count').val(count);

            $("#selStatus").removeAttr("disabled");
            $('#selStatus option').removeAttr('selected');
            $("#selStatus option[value='" + status + "']").attr("selected", "selected");

            SetLan(localStorage.getItem("Language"));
            $("#modalTier").modal();
        }

        function btnDel(ID) {
            ID_DEL = ID;
            $("#modalDelete").modal();
        }

        const getData = async () => {
            var Provider = $('#selProvider').val();
            const parameter = {
                gameID: parseInt(Provider)
            }

            const requestAwait = await fetchDataSite(`${apiURL}/v1/gameMarket/item/inquiry`, 'POST', "include", parameter)
            const response = await requestAwait.json()
            if (response.messageCode == 0000 || response.messageCode == null) {
                $("#tbData > tbody").html("");
                var htmlData = "";
                var no = 1;

                if (response.data.length > 0) {
                    for (var i = 0; i < response.data.length; i++) {
                        var obj = response.data[i];

                        htmlData += "<tr>";
                        htmlData += "<td style='width: 1%;' class='aligncenter'>" + no + "</td>";
                        htmlData += "<td>" + obj.itemNameEN + "</td>";

                        var value = obj.value.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1,");
                        htmlData += "<td class='alignright'>" + value + " <span set-lan='text:Point'></span></td>";

                        var percent = obj.percent.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1,");
                        htmlData += "<td class='alignright'>" + percent + "%</td>";

                        var perWeek = obj.perWeek.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1,");
                        htmlData += "<td class='alignright'>" + perWeek + "</td>";

                        htmlData += "<td style='text-align: center;'><img src='" + obj.pic + "' style='height: 100px;'></td>";

                        var status = obj.active;
                        if (status == true) {
                            htmlData += "<td class='aligncenter' set-lan='text:Active' style='color:green;'></td>";
                        }
                        else {
                            htmlData += "<td class='aligncenter' set-lan='text:Inactive' style='color:red;'></td>";
                        }

                        htmlData += "<td style='width: 1%;' class='aligncenter colEdit zonenone'><a class='link' onclick='btnEdit(`" + obj.id + "`,`" + obj.itemNameEN + "`,`" + value + "`,`" + percent + "`,`" + perWeek + "`,`" + status + "`)'><i class='fas fa-pencil-alt'></i></a></td>";
                        htmlData += "</tr>";
                        no++;
                    }
                    $("#tbData > tbody").append(htmlData);
                }
                else {
                    $("#tbData > tbody").append("<tr><td colspan='7' style='text-align: center;' set-lan='text:No data.'></td></tr>");
                }

                $("#selProvider").removeAttr("disabled");
                $('#selProvider option').removeAttr('selected');
                $("#selProvider option[value='" + Provider + "']").attr("selected", "selected");

                if (Status_GameMarket != "EDIT") {
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
            var isTrueSet = ($('#selStatus').val() === 'true');
            var Count = $('#Count').val();
            Count = Count.replaceAll(",", "");

            const parameter = {
                id: $('#ID').val(),
                percent: parseFloat($('#Percent1').val()),
                perWeek: parseFloat(Count),
                active: isTrueSet
            }
            const requestAwait = await fetchDataSite(`${apiURL}/v1/gameMarket/item/update`, 'POST', "include", parameter)
            const response = await requestAwait.json()

            if (response.messageCode == 0000 || response.messageCode == null) {
                document.getElementById("lbAlertSuccess").setAttribute("set-lan", "text:Edit item success");
                SetLan(localStorage.getItem("Language"));
                $("#myModalLoad").modal('hide');
                $("#modalTier").modal('hide');
                $('#modalAlertSuccess').modal();
                setTimeout(function () {
                    window.location.href = "/Menu_game_market/item.aspx";
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

        const postSyncItem = async () => {
            var Provider = $('#selProvider').val();
            if (Provider == "") {
                document.getElementById("lbAlert").setAttribute("set-lan", "text:missing 'Provider' field");
                SetLan(localStorage.getItem("Language"));
                $('#modalAlert').modal('show');
                $("#myModalLoad").modal('hide');
            }
            else {
                const parameter = {
                    providerCode: Provider
                }

                const requestAwait = await fetchDataSite(`${apiURL}/v1/gameMarket/item/sync`, 'POST', "include", parameter)
                const response = await requestAwait.json()
                if (response.messageCode == 0000 || response.messageCode == null) {
                    document.getElementById("lbAlert").setAttribute("set-lan", "text:Sync item success");
                    $('#modalAlert').modal('show');
                    $("#myModalLoad").modal('hide');
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
        }

        const getProvider = async () => {
            const requestAwait = await fetchDataSite(`${apiURL}/v1/gameMarket/game/get`, 'GET', "include", {})
            const response = await requestAwait.json()
            if (response.messageCode == 0000 || response.messageCode == null) {
                if (response.data.length != 0) {
                    var select = document.getElementById('selProvider');
                    for (var i = 0; i < response.data.length; i++) {
                        var opt = document.createElement('option');
                        opt.value = response.data[i].id;
                        opt.innerHTML = response.data[i].name;
                        select.appendChild(opt);
                    }
                }
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
