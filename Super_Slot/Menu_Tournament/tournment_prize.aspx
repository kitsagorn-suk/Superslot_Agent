<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="tournment_prize.aspx.cs" Inherits="Pretty_Gaming.Menu_Tournament.tournment_prize" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .modalScroll {
            overflow-y: auto !important;
        }
    </style>
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="" set-lan="text:Tournament"></a></li>
            <li class="breadcrumb-item active txtMem" set-lan="text:Tournament Prize"></li>
        </ol>
    </nav>
    <div class="row">
        <div class="col-md-8">
            <h1 set-lan="text:Tournament Prize"></h1>
        </div>
        <%--<div class="col-md-4" style="text-align: right;">
            <button id="btnAddPrize" type="button" class="btn btn-yellow font-weight-bold" onclick="newAdd('Add Tournament Prize')" set-lan="html:Add Tournament Prize_"></button>
        </div>--%>
    </div>
    <div class="table-wrapper" style="margin-top: 10px; margin-bottom: 10px;">
        <section style="float: right; margin-top: -2.2rem;">
            <div class="data-container"></div>
            <div id="pagination-demo2"></div>
        </section>
        <table class="table table-border" id="tbData">
            <thead class="rgba-green-slight">
                <tr>
                    <th style="width: 1%;" set-lan="text:No"></th>
                    <th style='width: 5%;' set-lan='text:Prize Type'></th>
                    <th style='width: 5%; text-align: right; padding-right: 5px;' set-lan='text:Limit'></th>
                    <th style="width: 3%;" set-lan="text:Status"></th>
                    <th style="width: 1%;" class="edit" set-lan="text:Action"></th>
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
                    <td class="edit"></td>
                </tr>
            </tfoot>
        </table>
    </div>

    <%--modal--%>
    <div class="modal fade" id="modalForm" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header text-center">
                    <h4 class="modal-title w-100 font-weight-bold" id="txtHead"></h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body mx-3">
                    <div class="row">
                        <div class="form-group row" style="display: none;">
                            <label for="ID" class="col-3 col-form-label" style="text-align: right;">ID :</label>
                            <div class="col-9">
                                <input type="text" class="form-control" id="ID" autocomplete="off" />
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12">
                            <div class="form-group row" id="zoneStatus">
                                <label for="Status" class="col-3 col-form-label" style="text-align: right;" set-lan="text:Status_"></label>
                                <div class="col-4">
                                    <input type="text" id="status" class="form-control" autocomplete="off" disabled="disabled" set-lan="value:Active">
                                </div>
                                <div class="col-4">
                                    <button type="button" class="btn btn-yellow font-weight-bold waves-effect waves-light" onclick="editStatus();" set-lan="text:Edit Status">Edit Status</button>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="MissionTemplate" class="col-3 col-form-label" style="text-align: right;" set-lan="text:Prize Type-"></label>
                                <div class="col-4">
                                    <input type="text" class="form-control" id="prizeType" autocomplete="off" disabled />
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="MissionTemplate" class="col-3 col-form-label" style="text-align: right;" set-lan="html:Limit_"></label>
                                <div class="col-4">
                                    <input type="text" class="form-control" id="Limit" onkeyup="javascript:this.value=Comma(this.value);" oninput="this.value=this.value.replace(/[^0-9]/g, '').replace(/(\..*)\./g, '$1');" autocomplete="off" />
                                    <small class="text-muted form-text" set-lan="text:numberonly"></small>
                                </div>
                            </div>
                        </div>
                    </div>
                    <br />
                </div>
                <div class="modal-footer d-flex justify-content-center">
                    <button class="btn btn-yellow font-weight-bold" type="button" id="Add" onclick="btnForm('ADD');" set-lan="text:Add Tournament Prize"></button>
                    <button class="btn btn-yellow font-weight-bold" type="button" id="Save" onclick="btnForm('SAVE');" set-lan="text:Save"></button>
                    <button type="button" class="btn btn-yellow font-weight-bold" data-dismiss="modal" aria-label="Close" set-lan="text:Cancel"></button>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade modalScroll" id="modalTier" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header text-center">
                    <h4 class="modal-title w-100 font-weight-bold" set-lan="text:Tier"></h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body mx-3">
                    <div class="row">
                        <div class="form-group row" style="display: none;">
                            <label for="ID" class="col-3 col-form-label" style="text-align: right;">ID :</label>
                            <div class="col-9">
                                <input type="text" class="form-control" id="ID_Tier" autocomplete="off" />
                            </div>
                        </div>
                    </div>
                    <div class="row" id="klon1">
                        <div class="col-4">
                            <div class="form-group row">
                                <label for="RandStart" class="col-5 col-form-label" style="text-align: right;" set-lan="text:Rank start-"></label>
                                <div class="col-7">
                                    <input type="text" class="form-control" id="RankStart_1" onkeyup="javascript:this.value=SetComma(this);" oninput="this.value=SetNumber(this.value);" autocomplete="off" />
                                    <small class="text-muted form-text" set-lan="text:numberonly"></small>
                                </div>
                            </div>
                        </div>
                        <div class="col-4">
                            <div class="form-group row">
                                <label for="RankEnd" class="col-5 col-form-label" style="text-align: right;" set-lan="text:Rank end-"></label>
                                <div class="col-7">
                                    <input type="text" class="form-control" id="RankEnd_1" onkeyup="javascript:this.value=SetComma(this);" oninput="this.value=SetNumber(this.value);" autocomplete="off" />
                                    <small class="text-muted form-text" set-lan="text:numberonly"></small>
                                </div>
                            </div>
                        </div>
                        <div class="col-4">
                            <div class="form-group row">
                                <label for="Prize" class="col-5 col-form-label" style="text-align: right;" set-lan="text:Prize-"></label>
                                <div class="col-7">
                                    <input type="text" class="form-control" id="Prize_1" onkeyup="javascript:this.value=SetComma(this);" oninput="this.value=SetNumber(this.value);" autocomplete="off" />
                                    <small class="text-muted form-text" set-lan="text:numberonly"></small>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="col-md-8"></div>
                        <div class="col-md-3" style="text-align: center;">
                            <button class="btn btn-yellow font-weight-bold" type="button" id="cloneDiv" onclick="cloneDivTier()" style="padding: .2rem .5rem;" set-lan="html:+add"></button>
                            <button class="btn btn-yellow font-weight-bold" type="button" id="removeDiv" onclick="removeDivTier()" style="padding: .2rem .5rem; display: none; margin-left: 0.5rem;" set-lan="html:-delete"></button>
                        </div>
                    </div>
                    <br />
                </div>
                <div class="modal-footer d-flex justify-content-center">
                    <button class="btn btn-yellow font-weight-bold" type="button" id="Save_Tier" onclick="btnTierSave('SAVE');" set-lan="text:Save"></button>
                    <button type="button" class="btn btn-yellow font-weight-bold" data-dismiss="modal" aria-label="Close" set-lan="text:Cancel"></button>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="modalStatus" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header text-center">
                    <h4 class="modal-title w-100 font-weight-bold" set-lan="text:Status"></h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body mx-3">
                    <div class="form-group row mr-4" style="margin-bottom: 0px !important;">
                        <label for="email" class="col-4 col-form-label alignright" set-lan="text:Status_"></label>
                        <div class="switch col-8">
                            <label style="margin-top: 10px;">
                                <input type="checkbox" id="chkSuspend" onclick="chgSuspend(this)">
                                <span class="lever ml-0"></span>
                                <span class="blue-text text-13" id="txtSuspend"></span>
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
    <script src="../js/pagination.js"></script>
    <script>
        var Status_Tournament = localStorage.getItem("Status_Tournament");

        $(document).ready(function () {
            $("#menuTournament , #menuTournament > a").addClass("active");
            $("#menuTournament > div").css("display", "block");

            //if (Status_Tournament == "VIEW") {
            //    document.getElementById("btnAddPrize").style.display = "none";
            //}

            GetData();
            SetLan(localStorage.getItem("Language"));
        });

        function SetComma(ele) {
            var send, ID;
            ID = "#" + ele.id;
            send = $(ID).val();
            send = send.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,');
            return send;
        }

        function SetNumber(ele) {
            var Am = ele;
            var A = Am.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');
            return A;
        }

        function capitalizeFirstLetter(string) {
            return string.charAt(0).toUpperCase() + string.slice(1);
        }

        function cloneDivTier() {
            var htmlData = '';
            var $div = $('div[id^="klon"]:last');
            var num = parseInt($div.prop("id").match(/\d+/g), 10) + 1;
            var $klon = $div.clone().prop('id', 'klon' + num);

            htmlData += '<div class="col-4">';
            htmlData += '<div class="form-group row">';
            htmlData += '<label for="RandStart" class="col-5 col-form-label" style="text-align: right;" set-lan="text:Rank start-"></label>';
            htmlData += '<div class="col-7">';
            htmlData += '<input type="text" class="form-control" id="RankStart_' + num + '" onkeyup="javascript:this.value=SetComma(this);" oninput="this.value=SetNumber(this.value);" autocomplete="off" />';
            htmlData += '<small class="text-muted form-text" set-lan="text:numberonly"></small>';
            htmlData += '</div></div></div>';

            htmlData += '<div class="col-4">';
            htmlData += '<div class="form-group row">';
            htmlData += '<label for="RankEnd" class="col-5 col-form-label" style="text-align: right;" set-lan="text:Rank end-"></label>';
            htmlData += '<div class="col-7">';
            htmlData += '<input type="text" class="form-control" id="RankEnd_' + num + '" onkeyup="javascript:this.value=SetComma(this);" oninput="this.value=SetNumber(this.value);" autocomplete="off" />';
            htmlData += '<small class="text-muted form-text" set-lan="text:numberonly"></small>';
            htmlData += '</div></div></div>';

            htmlData += '<div class="col-4">';
            htmlData += '<div class="form-group row">';
            htmlData += '<label for="Prize" class="col-5 col-form-label" style="text-align: right;" set-lan="text:Prize-"></label>';
            htmlData += '<div class="col-7">';
            htmlData += '<input type="text" class="form-control" id="Prize_' + num + '" onkeyup="javascript:this.value=SetComma(this);" oninput="this.value=SetNumber(this.value);" autocomplete="off" />';
            htmlData += '<small class="text-muted form-text" set-lan="text:numberonly"></small>';
            htmlData += '</div></div></div>';

            $div.after($klon.html(htmlData));
            document.getElementById("removeDiv").style.display = "unset";
            SetLan(localStorage.getItem("Language"));
        }

        function removeDivTier() {
            var $div = $('div[id^="klon"]:last');
            var num = parseInt($div.prop("id").match(/\d+/g), 10);
            if (num == 2) {
                document.getElementById("removeDiv").style.display = "none";
            }
            removeElement("klon" + num);
        }

        function removeElement(elementId) {
            var element = document.getElementById(elementId);
            element.parentNode.removeChild(element);
        }

        function editStatus() {
            var Sus = $('#status').val();
            if (Sus == "Active" || Sus == "ใช้งาน" || Sus == "活性") {
                document.getElementById("chkSuspend").checked = true;
            } else {
                document.getElementById("chkSuspend").checked = false;
            }

            $('#modalStatus').modal('show');
        }

        function saveEditStatus() {
            $("#myModalLoad").modal();
            var statussuspend = false;

            if (document.getElementById('chkSuspend').checked) {
                statussuspend = true;
            } else {
                statussuspend = false;
            }

            postEditStatus(statussuspend);
        }

        function btnEdit(ID, status, limit, prizeType) {
            document.getElementById("Add").style.display = "none";
            document.getElementById("Save").style.display = "block";
            document.getElementById("zoneStatus").style.display = "flex";

            document.getElementById("txtHead").setAttribute("set-lan", "text:Edit Tournament Prize");
            $('#ID').val(ID);
            $('#Limit').val(limit);
            document.getElementById("prizeType").setAttribute("set-lan", "value:" + prizeType + "");
            document.getElementById("status").setAttribute("set-lan", "value:" + status + "");
            document.getElementById("txtSuspend").setAttribute("set-lan", "text:" + status + "");

            SetLan(localStorage.getItem("Language"));
            $("#modalForm").modal();
        }

        function btnForm(status) {
            var Limit = $('#Limit').val();

            if (Limit == "" || Limit == null) {
                document.getElementById("lbAlert").setAttribute("set-lan", "text:missing 'Limit' field");
                SetLan(localStorage.getItem("Language"));
                $('#modalAlert').modal('show');
                $("#myModalLoad").modal('hide');
            }
            else {
                if (status == "ADD") {
                    postAdd();
                }
                else if (status == "SAVE") {
                    postSave();
                }
            }
        }

        function btnTier(ID) {
            var $div = $('div[id^="klon"]:last');
            var num = parseInt($div.prop("id").match(/\d+/g), 10);

            if (num > 1) {
                for (i = 0; i < num; i++) {
                    var SetID = i + 1;
                    if (SetID != 1) {
                        removeElement("klon" + SetID);
                    }
                }
            }

            postPrize_Tier(ID);
        }

        function btnTierSave(status) {
            if (status == "SAVE") {
                var $div = $('div[id^="klon"]:last');
                var num = parseInt($div.prop("id").match(/\d+/g), 10);

                var ID_RankStart, ID_RankEnd, ID_Prize, Val_RankStart, Val_RankEnd, Val_Prize;
                var arrTier = new Array();

                for (var i = 1; i <= num; i++) {
                    ID_RankStart = "#RankStart_" + i;
                    ID_RankEnd = "#RankEnd_" + i;
                    ID_Prize = "#Prize_" + i;

                    Val_RankStart = $(ID_RankStart).val();
                    Val_RankEnd = $(ID_RankEnd).val();
                    Val_Prize = $(ID_Prize).val();

                    if (Val_RankStart == "" || Val_RankStart == null) {
                        Val_RankStart = 0;
                    } else {
                        Val_RankStart = Val_RankStart.replaceAll(",", "");
                    }

                    if (Val_RankEnd == "" || Val_RankEnd == null) {
                        Val_RankEnd = 0;
                    } else {
                        Val_RankEnd = Val_RankEnd.replaceAll(",", "");
                    }

                    if (Val_Prize == "" || Val_Prize == null) {
                        Val_Prize = 0;
                    } else {
                        Val_Prize = Val_Prize.replaceAll(",", "");
                    }

                    arrTier.push({ "rankStart": parseInt(Val_RankStart), "rankEnd": parseInt(Val_RankEnd), "prize": parseInt(Val_Prize) });
                }

                postEditTier(arrTier);
            }
        }

        var NumPage = 0;
        var TotalData;
        function GetData() {
            $("#myModalLoad").modal();
            postData(NumPage);
        }

        function GetNumPage(num) {
            $(function () {
                (function (name) {
                    var container = $('#pagination-' + name);
                    container.pagination({
                        totalNumber: TotalData,
                        pageNumber: num,
                        pageSize: 100,
                        dataSource: '/json/DataSource.json',
                        locator: 'items',
                        callback: function (response, pagination) {
                            num = container.pagination('getSelectedPageNum');
                            if (NumPage != 0) {
                                postPage(num);
                            }
                            NumPage = num;
                        }
                    });
                })('demo2');
            });
        }

        const postData = async (num) => {
            if (num == 0) {
                num = num + 1;
            }

            const parameter = {
                page: num,
                size: 100
            }
            const requestAwait = await fetchDataSite(`${apiURL}/v1/tournament/prize/get`, 'POST', "include", parameter)
            const response = await requestAwait.json()

            if (response.messageCode == 0000 || response.messageCode == null) {
                TotalData = response.total;
                GetNumPage(num);

                if (NumPage == 0) {
                    $("#tbData > tbody").html("");
                    var htmlData = "";
                    if (response.total != 0) {
                        var no = 1;
                        for (var i = 0; i < response.data.length; i++) {
                            var obj = response.data[i];
                            var prizeType = capitalizeFirstLetter(obj.prizeType);
                            var limit = parseFloat(obj.limit).toFixed(2);
                            limit = limit.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1,");

                            htmlData += "<tr>";
                            htmlData += "<td class='aligncenter'>" + (((num - 1) * 100) + no) + "</td>";
                            htmlData += "<td class='aligncenter' set-lan='text:" + prizeType + "'></td>";
                            htmlData += "<td class='alignright'>" + limit + "</td>";

                            var Status = obj.status;
                            if (Status == "ACTIVE") {
                                htmlData += "<td class='aligncenter' set-lan='text:Active'></td>";
                                Status = "Active";
                            }
                            else if (Status == "INACTIVE") {
                                htmlData += "<td class='aligncenter' set-lan='text:Inactive'></td>";
                                Status = "Inactive";
                            }

                            htmlData += "<td class='aligncenter colEdit zonenone'>" +
                                "<a class='link' onclick='btnEdit(`" + obj.id + "`,`" + Status + "`,`" + obj.limit + "`,`" + prizeType + "`)'><i class='fas fa-pencil-alt'></i></a>" +
                                "<a class='link' style='margin-left: 1rem;' onclick='btnTier(`" + obj.id + "`);'><i class='fas fa-file-alt'></i></a>"
                            "</td>";
                            htmlData += "</tr>";
                            no++;
                        }

                        $("#tbData > tbody").append(htmlData);
                    }
                    else {
                        $("#tbData > tbody").append("<tr><td colspan='5' style='text-align: center;' set-lan='text:No data.'></td></tr>");
                    }

                    if (Status_Tournament == "VIEW") {
                        $('.edit , .colEdit').css('display', 'none');
                    }
                    else {
                        $('.edit , .colEdit').css('display', 'table-cell');
                    }

                    SetLan(localStorage.getItem("Language"));
                    $("#myModalLoad").modal('hide');
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

        const postPage = async (num) => {
            $("#tbData > tbody").html("");

            const parameter = {
                page: num,
                size: 100
            }
            const requestAwait = await fetchDataSite(`${apiURL}/v1/tournament/rule/get`, 'POST', "include", parameter)
            const response = await requestAwait.json()

            if (response.messageCode == 0000 || response.messageCode == null) {
                var htmlData = "";
                if (response.total != 0) {
                    var no = 1;
                    for (var i = 0; i < response.data.length; i++) {
                        var obj = response.data[i];
                        var prizeType = capitalizeFirstLetter(obj.prizeType);
                        var limit = parseFloat(obj.limit).toFixed(2);
                        limit = limit.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1,");

                        htmlData += "<tr>";
                        htmlData += "<td class='aligncenter'>" + (((num - 1) * 100) + no) + "</td>";
                        htmlData += "<td class='aligncenter' set-lan='text:" + prizeType + "'></td>";
                        htmlData += "<td class='alignright'>" + limit + "</td>";

                        var Status = obj.status;
                        if (Status == "ACTIVE") {
                            htmlData += "<td class='aligncenter' set-lan='text:Active'></td>";
                            Status = "Active";
                        }
                        else if (Status == "INACTIVE") {
                            htmlData += "<td class='aligncenter' set-lan='text:Inactive'></td>";
                            Status = "Inactive";
                        }

                        htmlData += "<td class='aligncenter colEdit zonenone'>" +
                            "<a class='link' onclick='btnEdit(`" + obj.id + "`,`" + Status + "`,`" + obj.limit + "`,`" + prizeType + "`)'><i class='fas fa-pencil-alt'></i></a>" +
                            "<a class='link' style='margin-left: 1rem;' onclick='btnTier(`" + obj.id + "`);'><i class='fas fa-file-alt'></i></a>"
                        "</td>";
                        htmlData += "</tr>";
                        no++;
                    }

                    $("#tbData > tbody").append(htmlData);
                }
                else {
                    $("#tbData > tbody").append("<tr><td colspan='5' style='text-align: center;' set-lan='text:No data.'></td></tr>");
                }

                if (Status_Tournament == "VIEW") {
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

        const postEditStatus = async (status) => {
            const parameter = {
                id: $('#ID').val(),
                active: status
            }

            const requestAwait = await fetchDataSite(`${apiURL}/v1/tournament/prize/updateStatus`, 'POST', "include", parameter)
            const response = await requestAwait.json()
            if (response.messageCode == 0000 || response.messageCode == null) {
                document.getElementById("lbAlertSuccess").setAttribute("set-lan", "text:Edit status success");
                SetLan(localStorage.getItem("Language"));
                $("#myModalLoad").modal('hide');
                $('#modalStatus').modal('hide');
                $("#modalForm").modal('hide');
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

        const postSave = async () => {
            var Limit = $('#Limit').val();
            Limit = Limit.replaceAll(",", "");

            const parameter = {
                id: $('#ID').val(),
                limit: parseInt(Limit)
            }
            const requestAwait = await fetchDataSite(`${apiURL}/v1/tournament/prize/edit`, 'POST', "include", parameter)
            const response = await requestAwait.json()

            if (response.messageCode == 0000 || response.messageCode == null) {
                document.getElementById("lbAlertSuccess").setAttribute("set-lan", "text:Edit tournament prize success");
                SetLan(localStorage.getItem("Language"));
                $("#myModalLoad").modal('hide');
                $("#modalForm").modal('hide');
                $('#modalAlertSuccess').modal();
                setTimeout(function () {
                    window.location.href = "/Menu_Tournament/tournment_prize.aspx";
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

        const postPrize_Tier = async (ID) => {
            const parameter = {
                id: ID
            }
            const requestAwait = await fetchDataSite(`${apiURL}/v1/tournament/prize/tier/get`, 'POST', "include", parameter)
            const response = await requestAwait.json()

            if (response.messageCode == 0000 || response.messageCode == null) {
                $('#ID_Tier').val(response.data.id);

                if (response.data.tiers != "" || response.data.tiers != null) {
                    var Tier_length = response.data.tiers.length - 1;

                    for (var i = 0; i < Tier_length; i++) {
                        var htmlData = '';
                        var $div = $('div[id^="klon"]:last');
                        var num = parseInt($div.prop("id").match(/\d+/g), 10) + 1;
                        var $klon = $div.clone().prop('id', 'klon' + num);

                        htmlData += '<div class="col-4">';
                        htmlData += '<div class="form-group row">';
                        htmlData += '<label for="RandStart" class="col-5 col-form-label" style="text-align: right;" set-lan="text:Rank start-"></label>';
                        htmlData += '<div class="col-7">';
                        htmlData += '<input type="text" class="form-control" id="RankStart_' + num + '" onkeyup="javascript:this.value=SetComma(this);" oninput="this.value=SetNumber(this.value);" autocomplete="off" />';
                        htmlData += '<small class="text-muted form-text" set-lan="text:numberonly"></small>';
                        htmlData += '</div></div></div>';

                        htmlData += '<div class="col-4">';
                        htmlData += '<div class="form-group row">';
                        htmlData += '<label for="RankEnd" class="col-5 col-form-label" style="text-align: right;" set-lan="text:Rank end-"></label>';
                        htmlData += '<div class="col-7">';
                        htmlData += '<input type="text" class="form-control" id="RankEnd_' + num + '" onkeyup="javascript:this.value=SetComma(this);" oninput="this.value=SetNumber(this.value);" autocomplete="off" />';
                        htmlData += '<small class="text-muted form-text" set-lan="text:numberonly"></small>';
                        htmlData += '</div></div></div>';

                        htmlData += '<div class="col-4">';
                        htmlData += '<div class="form-group row">';
                        htmlData += '<label for="Prize" class="col-5 col-form-label" style="text-align: right;" set-lan="text:Prize-"></label>';
                        htmlData += '<div class="col-7">';
                        htmlData += '<input type="text" class="form-control" id="Prize_' + num + '" onkeyup="javascript:this.value=SetComma(this);" oninput="this.value=SetNumber(this.value);" autocomplete="off" />';
                        htmlData += '<small class="text-muted form-text" set-lan="text:numberonly"></small>';
                        htmlData += '</div></div></div>';

                        $div.after($klon.html(htmlData));
                        document.getElementById("removeDiv").style.display = "unset";
                    }

                    for (var i = 0; i < response.data.tiers.length; i++) {
                        var obj = response.data.tiers[i];
                        var SetID = i + 1;
                        var ID_RankStart = "#RankStart_" + SetID;
                        var ID_RankEnd = "#RankEnd_" + SetID;
                        var ID_Prize = "#Prize_" + SetID;
                        var Start = obj.rankStart;
                        var End = obj.rankEnd;
                        var Prize = obj.prize;

                        $(ID_RankStart).val(Start.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,'));
                        $(ID_RankEnd).val(End.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,'));
                        $(ID_Prize).val(Prize.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,'));
                    }
                }
                SetLan(localStorage.getItem("Language"));
                $("#modalTier").modal();
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

        const postEditTier = async (txt) => {
            const parameter = {
                id: $('#ID_Tier').val(),
                tiers: txt
            }
            const requestAwait = await fetchDataSite(`${apiURL}/v1/tournament/prize/tier/edit`, 'POST', "include", parameter)
            const response = await requestAwait.json()

            if (response.messageCode == 0000 || response.messageCode == null) {
                document.getElementById("lbAlertSuccess").setAttribute("set-lan", "text:Edit tier success");
                SetLan(localStorage.getItem("Language"));
                $("#myModalLoad").modal('hide');
                $("#modalTier").modal('hide');
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
