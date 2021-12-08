<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="tournment_rules.aspx.cs" Inherits="Pretty_Gaming.Menu_Tournament.tournment_rules" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .modalScroll {
            overflow-y: auto !important;
        }
    </style>

    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="" set-lan="text:Tournament"></a></li>
            <li class="breadcrumb-item active txtMem" set-lan="text:Tournament Rules"></li>
        </ol>
    </nav>
    <div class="row">
        <div class="col-md-8">
            <h1 set-lan="text:Tournament Rules"></h1>
        </div>
        <div class="col-md-4" style="text-align: right;">
            <button id="btnAddRules" type="button" class="btn btn-yellow font-weight-bold" onclick="newAdd('Add Tournament Rules')" set-lan="html:Add Tournament Rules_"></button>
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
                    <th style='width: 2%;' set-lan='text:Order'></th>
                    <th style='width: 10%; text-align: left; padding-left: 5px;' set-lan='text:Title'></th>
                    <th style="width: 20%; text-align: left; padding-left: 5px;" set-lan="text:Detail"></th>
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
                    <td></td>
                    <td class="edit"></td>
                </tr>
            </tfoot>
        </table>
    </div>

    <%--modal--%>
    <div class="modal fade modalScroll" id="modalForm" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-xl" role="document">
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
                                <div class="col-3">
                                    <input type="text" id="status" class="form-control" autocomplete="off" disabled="disabled" set-lan="value:Active">
                                </div>
                                <div class="col-3">
                                    <button type="button" class="btn btn-yellow font-weight-bold waves-effect waves-light" onclick="editStatus();" set-lan="text:Edit Status">Edit Status</button>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="MissionTemplate" class="col-3 col-form-label" style="text-align: right;" set-lan="html:Order_"></label>
                                <div class="col-3">
                                    <input type="text" class="form-control" id="Order" oninput="this.value=this.value.replace(/[^0-9]/g, '').replace(/(\..*)\./g, '$1');" autocomplete="off" />
                                    <small class="text-muted form-text" set-lan="text:numberonly"></small>
                                </div>
                            </div>
                        </div>
                    </div>
                    <br />
                    <div class="row">
                        <div class="col-4">
                            <label class="col-12 col-form-label" style="text-align: left; margin-left: 2rem;" set-lan="text:Language Thai"></label>
                            <div class="form-group row">
                                <label for="TitleTH" class="col-3 col-form-label" style="text-align: right; padding-left: 0px; padding-right: 0px;" set-lan="html:Title-"></label>
                                <div class="col-8">
                                    <input type="text" class="form-control" id="TitleTH" autocomplete="off" />
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="DetailTH" class="col-3 col-form-label" style="text-align: right; padding-left: 0px; padding-right: 0px;" set-lan="html:Detail-"></label>
                                <div class="col-8">
                                    <textarea id="DetailTH" rows="5" class="form-control" autocomplete="off"></textarea>
                                </div>
                            </div>
                        </div>
                        <div class="col-4">
                            <label class="col-12 col-form-label" style="text-align: left; margin-left: 2rem;" set-lan="text:Language English"></label>
                            <div class="form-group row">
                                <label for="TitleEN" class="col-3 col-form-label" style="text-align: right; padding-left: 0px; padding-right: 0px;" set-lan="html:Title-"></label>
                                <div class="col-8">
                                    <input type="text" class="form-control" id="TitleEN" autocomplete="off" />
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="DetailEN" class="col-3 col-form-label" style="text-align: right; padding-left: 0px; padding-right: 0px;" set-lan="html:Detail-"></label>
                                <div class="col-8">
                                    <textarea id="DetailEN" rows="5" class="form-control" autocomplete="off"></textarea>
                                </div>
                            </div>
                        </div>
                        <div class="col-4">
                            <label class="col-12 col-form-label" style="text-align: left; margin-left: 2rem;" set-lan="text:Language Chinese"></label>
                            <div class="form-group row">
                                <label for="TitleCH" class="col-3 col-form-label" style="text-align: right; padding-left: 0px; padding-right: 0px;" set-lan="html:Title-"></label>
                                <div class="col-8">
                                    <input type="text" class="form-control" id="TitleCH" autocomplete="off" />
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="DetailCH" class="col-3 col-form-label" style="text-align: right; padding-left: 0px; padding-right: 0px;" set-lan="html:Detail-"></label>
                                <div class="col-8">
                                    <textarea id="DetailCH" rows="5" class="form-control" autocomplete="off"></textarea>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer d-flex justify-content-center">
                    <button class="btn btn-yellow font-weight-bold" type="button" id="Add" onclick="btnForm('ADD');" set-lan="text:Add Tournament Rules"></button>
                    <button class="btn btn-yellow font-weight-bold" type="button" id="Save" onclick="btnForm('SAVE');" set-lan="text:Save"></button>
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
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainScript" runat="server">
    <script src="../js/pagination.js"></script>
    <script type="text/javascript">
        var Status_Tournament = localStorage.getItem("Status_Tournament");

        $(document).ready(function () {
            $("#menuTournament , #menuTournament > a").addClass("active");
            $("#menuTournament > div").css("display", "block");

            if (Status_Tournament == "VIEW") {
                document.getElementById("btnAddRules").style.display = "none";
            }

            $("#myModalLoad").modal();
            GetDataTR();
            SetLan(localStorage.getItem("Language"));
        });

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

        function newAdd(type) {
            document.getElementById("Add").style.display = "block";
            document.getElementById("Save").style.display = "none";
            document.getElementById("zoneStatus").style.display = "none";
            document.getElementById("txtHead").setAttribute("set-lan", "text:" + type);

            $('#ID').val("");
            $('#Order').val("");
            $('#TitleTH').val("");
            $('#TitleEN').val("");
            $('#TitleCH').val("");
            $('#DetailTH').val("");
            $('#DetailEN').val("");
            $('#DetailCH').val("");
            SetLan(localStorage.getItem("Language"));
            $("#modalForm").modal();
        }

        function btnForm(status) {
            var order = $('#Order').val();
            var TitleTH = $('#TitleTH').val();
            var TitleEN = $('#TitleEN').val();
            var TitleCH = $('#TitleCH').val();
            var DetailTH = $('#DetailTH').val();
            var DetailEN = $('#DetailEN').val();
            var DetailCH = $('#DetailCH').val();

            if (order == "" || order == null) {
                document.getElementById("lbAlert").setAttribute("set-lan", "text:missing 'Order' field");
                SetLan(localStorage.getItem("Language"));
                $('#modalAlert').modal('show');
                $("#myModalLoad").modal('hide');
            }
            else if (TitleTH == "" || TitleEN == "" || TitleCH == "") {
                document.getElementById("lbAlert").setAttribute("set-lan", "text:missing 'Title' field");
                SetLan(localStorage.getItem("Language"));
                $('#modalAlert').modal('show');
                $("#myModalLoad").modal('hide');
            }
            else if (DetailTH == "" || DetailEN == "" || DetailCH == "") {
                document.getElementById("lbAlert").setAttribute("set-lan", "text:missing 'Detail' field");
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

        function btnEdit(ID, order, status, title, detail) {
            document.getElementById("Add").style.display = "none";
            document.getElementById("Save").style.display = "block";
            document.getElementById("zoneStatus").style.display = "flex";

            document.getElementById("txtHead").setAttribute("set-lan", "text:Edit Tournament Rules");
            $('#ID').val(ID);
            $('#Order').val(order);
            document.getElementById("status").setAttribute("set-lan", "value:" + status + "");
            document.getElementById("txtSuspend").setAttribute("set-lan", "text:" + status + "");

            var DetailArr = detail.split('|');
            var TitleArr = title.split('|');
            for (var i = 0; i < DetailArr.length; i++) {
                if (i == 0) {
                    $('#TitleTH').val(TitleArr[i]);
                    $('#DetailTH').val(DetailArr[i]);
                }
                else if (i == 1) {
                    $('#TitleEN').val(TitleArr[i]);
                    $('#DetailEN').val(DetailArr[i]);
                }
                else if (i == 2) {
                    $('#TitleCH').val(TitleArr[i]);
                    $('#DetailCH').val(DetailArr[i]);
                }
            }

            SetLan(localStorage.getItem("Language"));
            $("#modalForm").modal();
        }

        function chgSuspend(ele) {
            if (ele.checked) {
                document.getElementById("txtSuspend").setAttribute("set-lan", "text:Active");
                SetLan(localStorage.getItem("Language"));
            } else {
                document.getElementById("txtSuspend").setAttribute("set-lan", "text:Inactive");
                SetLan(localStorage.getItem("Language"));
            }
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

        function NewLine(str, maxLength) {
            var buff = "";
            var numOfLines = Math.floor(str.length / maxLength);
            for (var i = 0; i < numOfLines + 1; i++) {
                buff += str.substr(i * maxLength, maxLength); if (i !== numOfLines) { buff += "\n"; }
            }
            return buff;
        }

        var NumPage = 0;
        var TotalData;
        function GetDataTR() {
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
            const requestAwait = await fetchDataSite(`${apiURL}/v1/tournament/rule/get`, 'POST', "include", parameter)
            const response = await requestAwait.json()

            if (response.messageCode == 0000 || response.messageCode == null) {
                TotalData = response.total;
                GetNumPage(num);

                if (NumPage == 0) {
                    var Lan = localStorage.getItem("Language");
                    $("#tbData > tbody").html("");
                    var htmlData = "";
                    if (response.total != 0) {
                        var no = 1;
                        for (var i = 0; i < response.data.length; i++) {
                            var obj = response.data[i];
                            var Title = [];
                            var Detail = [];
                            Title.push(obj.title.th + "|" + obj.title.en + "|" + obj.title.ch);
                            Detail.push(obj.detail.th + "|" + obj.detail.en + "|" + obj.detail.ch);

                            htmlData += "<tr>";
                            htmlData += "<td class='aligncenter'>" + (((num - 1) * 100) + no) + "</td>";
                            htmlData += "<td class='aligncenter'>" + obj.order + "</td>";

                            if (Lan == "Thai") {
                                var nLineDetail = NewLine(obj.detail.th, 80);
                                var nLineTitle = NewLine(obj.title.th, 40);
                                htmlData += "<td>" + nLineTitle + "</td>";
                                htmlData += "<td>" + nLineDetail + "</td>";
                            }
                            else if (Lan == "English") {
                                var nLineDetail = NewLine(obj.detail.en, 80);
                                var nLineTitle = NewLine(obj.title.en, 40);
                                htmlData += "<td>" + nLineTitle + "</td>";
                                htmlData += "<td>" + nLineDetail + "</td>";
                            }
                            else if (Lan == "Chinese") {
                                var nLineDetail = NewLine(obj.detail.ch, 80);
                                var nLineTitle = NewLine(obj.title.ch, 40);
                                htmlData += "<td>" + nLineTitle + "</td>";
                                htmlData += "<td>" + nLineDetail + "</td>";
                            }

                            var Status = obj.status;
                            if (Status == "ACTIVE") {
                                htmlData += "<td class='aligncenter' set-lan='text:Active'></td>";
                                Status = "Active";
                            }
                            else if (Status == "INACTIVE") {
                                htmlData += "<td class='aligncenter' set-lan='text:Inactive'></td>";
                                Status = "Inactive";
                            }

                            htmlData += "<td class='aligncenter colEdit zonenone'><a class='link' onclick='postModal(`" + obj.id + "`,`" + num + "`)'><i class='fas fa-pencil-alt'></i></a></td>";
                            htmlData += "</tr>";
                            no++;
                        }

                        $("#tbData > tbody").append(htmlData);
                    }
                    else {
                        $("#tbData > tbody").append("<tr><td colspan='6' style='text-align: center;' set-lan='text:No data.'></td></tr>");
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
            var Lan = localStorage.getItem("Language");
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
                        var Title = [];
                        var Detail = [];
                        Title.push(obj.title.th + "|" + obj.title.en + "|" + obj.title.ch);
                        Detail.push(obj.detail.th + "|" + obj.detail.en + "|" + obj.detail.ch);

                        htmlData += "<tr>";
                        htmlData += "<td class='aligncenter'>" + (((num - 1) * 100) + no) + "</td>";
                        htmlData += "<td class='aligncenter'>" + obj.order + "</td>";

                        if (Lan == "Thai") {
                            var nLineDetail = NewLine(obj.detail.th, 80);
                            var nLineTitle = NewLine(obj.title.th, 50);
                            htmlData += "<td>" + nLineTitle + "</td>";
                            htmlData += "<td>" + nLineDetail + "</td>";
                        }
                        else if (Lan == "English") {
                            var nLineDetail = NewLine(obj.detail.en, 80);
                            var nLineTitle = NewLine(obj.title.en, 50);
                            htmlData += "<td>" + nLineTitle + "</td>";
                            htmlData += "<td>" + nLineDetail + "</td>";
                        }
                        else if (Lan == "Chinese") {
                            var nLineDetail = NewLine(obj.detail.ch, 80);
                            var nLineTitle = NewLine(obj.title.ch, 50);
                            htmlData += "<td>" + nLineTitle + "</td>";
                            htmlData += "<td>" + nLineDetail + "</td>";
                        }

                        var Status = obj.status;
                        if (Status == "ACTIVE") {
                            htmlData += "<td class='aligncenter' set-lan='text:Active'></td>";
                            Status = "Active";
                        }
                        else if (Status == "INACTIVE") {
                            htmlData += "<td class='aligncenter' set-lan='text:Inactive'></td>";
                            Status = "Inactive";
                        }

                        htmlData += "<td class='aligncenter colEdit zonenone'><a class='link' onclick='postModal(`" + obj.id + "`,`" + num + "`)'><i class='fas fa-pencil-alt'></i></a></td>";
                        //htmlData += "<td class='aligncenter colEdit zonenone'><a class='link' onclick='btnEdit(`" + obj.id + "`,`" + obj.order + "`,`" + Status + "`,`" + Title + "`,`" + Detail + "`)'><i class='fas fa-pencil-alt'></i></a></td>";
                        htmlData += "</tr>";
                        no++;
                    }

                    $("#tbData > tbody").append(htmlData);
                }
                else {
                    $("#tbData > tbody").append("<tr><td colspan='6' style='text-align: center;' set-lan='text:No data.'></td></tr>");
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

        const postAdd = async () => {
            const parameter = {
                title: {
                    th: $('#TitleTH').val(),
                    en: $('#TitleEN').val(),
                    ch: $('#TitleCH').val()
                },
                detail: {
                    th: $('#DetailTH').val(),
                    en: $('#DetailEN').val(),
                    ch: $('#DetailCH').val()
                },
                order: parseInt($('#Order').val())
            }
            const requestAwait = await fetchDataSite(`${apiURL}/v1/tournament/rule/add`, 'POST', "include", parameter)
            const response = await requestAwait.json()

            if (response.messageCode == 0000 || response.messageCode == null) {
                document.getElementById("lbAlertSuccess").setAttribute("set-lan", "text:Add tournament rules success");
                SetLan(localStorage.getItem("Language"));
                $("#myModalLoad").modal('hide');
                $("#modalForm").modal('hide');
                $('#modalAlertSuccess').modal();
                setTimeout(function () {
                    window.location.href = "/Menu_Tournament/tournment_rules.aspx";
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
            const parameter = {
                id: $('#ID').val(),
                title: {
                    th: $('#TitleTH').val(),
                    en: $('#TitleEN').val(),
                    ch: $('#TitleCH').val()
                },
                detail: {
                    th: $('#DetailTH').val(),
                    en: $('#DetailEN').val(),
                    ch: $('#DetailCH').val()
                },
                order: parseInt($('#Order').val())
            }
            const requestAwait = await fetchDataSite(`${apiURL}/v1/tournament/rule/edit`, 'POST', "include", parameter)
            const response = await requestAwait.json()

            if (response.messageCode == 0000 || response.messageCode == null) {
                document.getElementById("lbAlertSuccess").setAttribute("set-lan", "text:Edit tournament rules success");
                SetLan(localStorage.getItem("Language"));
                $("#myModalLoad").modal('hide');
                $("#modalForm").modal('hide');
                $('#modalAlertSuccess').modal();
                setTimeout(function () {
                    window.location.href = "/Menu_Tournament/tournment_rules.aspx";
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

        const postEditStatus = async (status) => {
            const parameter = {
                id: $('#ID').val(),
                active: status
            }

            const requestAwait = await fetchDataSite(`${apiURL}/v1/tournament/rule/updateStatus`, 'POST', "include", parameter)
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

        const postModal = async (ID, number) => {
            $("#myModalLoad").modal();

            const parameter = {
                page: parseInt(number),
                size: 100
            }
            const requestAwait = await fetchDataSite(`${apiURL}/v1/tournament/rule/get`, 'POST', "include", parameter)
            const response = await requestAwait.json()

            if (response.messageCode == 0000 || response.messageCode == null) {
                if (response.total != 0) {
                    for (var i = 0; i < response.data.length; i++) {
                        var obj = response.data[i];
                        if (obj.id == ID) {
                            var Status = obj.status;
                            if (Status == "ACTIVE") {
                                Status = "Active";
                            }
                            else if (Status == "INACTIVE") {
                                Status = "Inactive";
                            }

                            document.getElementById("Add").style.display = "none";
                            document.getElementById("Save").style.display = "block";
                            document.getElementById("zoneStatus").style.display = "flex";
                            document.getElementById("txtHead").setAttribute("set-lan", "text:Edit Tournament Rules");

                            $('#ID').val(obj.id);
                            $('#Order').val(obj.order);
                            document.getElementById("status").setAttribute("set-lan", "value:" + Status + "");
                            document.getElementById("txtSuspend").setAttribute("set-lan", "text:" + Status + "");

                            $('#TitleTH').val(obj.title.th);
                            $('#DetailTH').val(obj.detail.th);

                            $('#TitleEN').val(obj.title.en);
                            $('#DetailEN').val(obj.detail.en);

                            $('#TitleCH').val(obj.title.ch);
                            $('#DetailCH').val(obj.detail.ch);

                            SetLan(localStorage.getItem("Language"));
                            $("#modalForm").modal();
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
    </script>
</asp:Content>
