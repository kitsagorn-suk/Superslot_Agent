<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="logs.aspx.cs" Inherits="Pretty_Gaming.Menu_LuckyDraw.logs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .modalScroll {
            overflow-y: auto !important;
        }

        .table thead th {
            border-bottom: 1px solid #dee2e6 !important;
        }
    </style>
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="" set-lan="text:Lucky Draw"></a></li>
            <li class="breadcrumb-item active txtMem" set-lan="text:Lucky Draw Logs"></li>
        </ol>
    </nav>
    <div class="row">
        <div class="col-md-8">
            <h1 set-lan="text:Lucky Draw Logs"></h1>
        </div>
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
                    <th style='width: 10%;' set-lan='text:Information'></th>
                    <th style="width: 3%;" set-lan="text:Total Prize"></th>
                    <th style="width: 2%;" set-lan="text:Total Winner"></th>
                    <th style="width: 2%;" set-lan="text:Detail"></th>
                </tr>
            </thead>
            <tbody></tbody>
            <tfoot class="rgba-yellow-slight">
                <tr class="total">
                    <td></td>
                    <td set-lan="text:Total"></td>
                    <td id="totalPrizeMain">-</td>
                    <td id="totalPlayer">-</td>
                    <td></td>
                </tr>
            </tfoot>
        </table>
    </div>

    <%--modal--%>
    <div class="modal fade modalScroll" id="modalGetDetail" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header text-center">
                    <h4 class="modal-title w-100 font-weight-bold" set-lan="text:Detail"></h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body mx-3">
                    <section style="float: right; margin-bottom: 0.375rem;">
                        <div class="data-container"></div>
                        <div id="pagination-demo3"></div>
                    </section>
                    <table class="table table-border" id="tbData2">
                        <thead class="rgba-green-slight">
                            <tr>
                                <th set-lan="text:No"></th>
                                <th style="width: 30%;" set-lan="text:User"></th>
                                <th style="width: 20%;" set-lan="text:Ticket ID"></th>
                                <th style="width: 30%;" set-lan="text:Reward"></th>
                                <th style="text-align: right; padding-right: 5px;" set-lan="text:Value"></th>
                            </tr>
                        </thead>
                        <tbody></tbody>
                        <tfoot class="rgba-yellow-slight">
                            <tr class="total">
                                <td></td>
                                <td></td>
                                <td></td>
                                <td set-lan="text:Total"></td>
                                <td id="totalPrize">-</td>
                            </tr>
                        </tfoot>
                    </table>
                </div>
                <div class="modal-footer d-flex justify-content-center">
                    <button type="button" class="btn btn-yellow font-weight-bold waves-effect waves-light" data-dismiss="modal" aria-label="Close" set-lan="text:Close"></button>
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
        $(document).ready(function () {
            $("#menuLucky , #menuLucky > a").addClass("active");
            $("#menuLucky > div").css("display", "block");

            GetData();
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

        function template(data, Page) {
            var html = "";
            var no = 1;
            if (data == "" || data == null) {
                html = "<tr><td colspan='5' style='text-align: center;' set-lan='text:No data.'></td></tr>";
            }
            else {
                for (var i = 0; i < data.length; i++) {
                    var obj = data[i];

                    html += "<tr>";
                    html += "<td class='aligncenter'>" + (((Page - 1) * 50) + no) + "</td>";
                    html += "<td>" + obj.username + "</td>";
                    html += "<td>" + obj.ticketNumber + "</td>";

                    var text = obj.typeReward;
                    if (text == "firstPrize") {
                        html += "<td set-lan='text:First Prize'></td>";
                    }
                    else if (text == "firstThreeDigits") {
                        html += "<td set-lan='text:3 first numbers match'></td>";
                    }
                    else if (text == "lastThreeDigits") {
                        html += "<td set-lan='text:3 last numbers match'></td>";
                    }
                    else if (text == "lastTwoDigits") {
                        html += "<td set-lan='text:2 last numbers match'></td>";
                    } else {
                        html += "<td>-</td>";
                    }

                    var prize = parseFloat(obj.sumPrize).toFixed(2);
                    prize = prize.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1,");
                    html += "<td class='alignright'>" + prize + "</td>";
                    html += "</tr>";
                    no++;
                }
            }

            return html;
        }

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

        var NumPage = 0;
        var TotalData;
        function GetData() {
            $("#myModalLoad").modal();
            postData(NumPage);
        }

        var NumPageDetail = 0;
        var TotalDataDetail;
        function GetDataDetail(txtDate, Sum) {
            $("#myModalLoad").modal();
            postDetail(NumPageDetail, txtDate, Sum);
        }

        function GetNumPage(num) {
            $(function () {
                (function (name) {
                    var container = $('#pagination-' + name);
                    container.pagination({
                        totalNumber: TotalData,
                        pageNumber: num,
                        pageSize: 20,
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

        function GetNumPage3(num, txtDate, Sum) {
            $(function () {
                (function (name) {
                    var container = $('#pagination-' + name);
                    container.pagination({
                        totalNumber: TotalDataDetail,
                        pageNumber: num,
                        pageSize: 50,
                        dataSource: '/json/DataSource.json',
                        locator: 'items',
                        callback: function (response, pagination) {
                            num = container.pagination('getSelectedPageNum');
                            if (NumPageDetail != 0) {
                                postPageDetail(num, txtDate, Sum);
                            }
                            NumPageDetail = num;
                        }
                    });
                })('demo3');
            });
        }

        const postData = async (num) => {
            $("#myModalLoad").modal();

            if (num == 0) {
                num = num + 1;
            }

            const parameter = {
                page: num,
                size: 20
            }
            const requestAwait = await fetchDataSite(`${apiURL}/v1/lotto/logs/get`, 'POST', "include", parameter)
            const response = await requestAwait.json()

            if (response.messageCode == 0000 || response.messageCode == null) {
                TotalData = response.total;
                GetNumPage(num);

                if (NumPage == 0) {
                    $("#tbData > tbody").html("");
                    var htmlData = "";
                    if (response.total != 0) {
                        var no = 1;
                        for (var i = 0; i < response.data.detail.length; i++) {
                            var obj = response.data.detail[i];

                            htmlData += "<tr>";
                            htmlData += "<td class='aligncenter'>" + (((num - 1) * 20) + no) + "</td>";

                            var date = new Date(obj.periodTime);
                            var prizeStartAt;
                            if (obj.periodTime == "" || obj.periodTime == null) {
                                prizeStartAt = "-";
                            } else {
                                prizeStartAt = ("0" + date.getDate()).slice(-2) + "/" + ("0" + (date.getMonth() + 1)).slice(-2) + "/" + date.getFullYear() + " " + ("0" + date.getHours()).slice(-2) + ":" + ("0" + date.getMinutes()).slice(-2) + ":" + ("0" + date.getSeconds()).slice(-2);
                            }

                            var date2 = new Date(obj.createTime);
                            var prizeAt;
                            if (obj.createTime == "" || obj.createTime == null) {
                                prizeAt = "-";
                            } else {
                                prizeAt = ("0" + date2.getDate()).slice(-2) + "/" + ("0" + (date2.getMonth() + 1)).slice(-2) + "/" + date2.getFullYear() + " " + ("0" + date2.getHours()).slice(-2) + ":" + ("0" + date2.getMinutes()).slice(-2) + ":" + ("0" + date2.getSeconds()).slice(-2);
                            }

                            var date3 = new Date(obj.endTime);
                            var prizeEndAt;
                            if (obj.endTime == "" || obj.endTime == null) {
                                prizeEndAt = "-";
                            } else {
                                prizeEndAt = ("0" + date3.getDate()).slice(-2) + "/" + ("0" + (date3.getMonth() + 1)).slice(-2) + "/" + date3.getFullYear() + " " + ("0" + date3.getHours()).slice(-2) + ":" + ("0" + date3.getMinutes()).slice(-2) + ":" + ("0" + date3.getSeconds()).slice(-2);
                            }
                            htmlData += "<td><b set-lan='text:Start date_'></b> " + prizeStartAt + "<br><b set-lan='text:To date_'></b> " + prizeEndAt + "<br><b set-lan='text:Time of award'></b>: " + prizeAt + "<br><b set-lan='text:Lucky draw results'></b>: <b>" + obj.ticketNumber + "</b></td>";

                            var TotalPrize = parseFloat(obj.totalPrize).toFixed(2);
                            TotalPrize = TotalPrize.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1,");
                            htmlData += "<td class='alignright'>" + TotalPrize + "</td>";

                            var totalAmount = obj.totalAmount;
                            totalAmount = totalAmount.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1,");
                            htmlData += "<td class='alignright'>" + totalAmount + "</td>";

                            htmlData += "<td class='aligncenter'><button type='button' class='btn btn-yellow font-weight-bold m-0 px-3 py-2 z-depth-0 waves-effect btnMenu' onclick='GetDataDetail(`" + obj.periodTime + "`,`" + TotalPrize + "`);' style='line-height: 0rem !important;' set-lan='text:Detail'></button></td>";
                            htmlData += "</tr>";
                            no++;
                        }

                        var totalPrizeMain = parseFloat(response.data.summary.prize).toFixed(2);
                        $("#totalPrizeMain").text(totalPrizeMain.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,'));
                        var totalPlayer = response.data.summary.player;
                        $("#totalPlayer").text(totalPlayer.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,'));

                        $("#tbData > tbody").append(htmlData);
                    }
                    else {
                        $("#tbData > tbody").append("<tr><td colspan='9' style='text-align: center;' set-lan='text:No data.'></td></tr>");
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
            $("#myModalLoad").modal();
            $("#tbData > tbody").html("");

            const parameter = {
                page: num,
                size: 20
            }
            const requestAwait = await fetchDataSite(`${apiURL}/v1/lotto/logs/get`, 'POST', "include", parameter)
            const response = await requestAwait.json()

            if (response.messageCode == 0000 || response.messageCode == null) {
                var htmlData = "";
                if (response.total != 0) {
                    var no = 1;
                    for (var i = 0; i < response.data.detail.length; i++) {
                        var obj = response.data.detail[i];

                        htmlData += "<tr>";
                        htmlData += "<td class='aligncenter'>" + (((num - 1) * 20) + no) + "</td>";

                        var date = new Date(obj.periodTime);
                        var prizeStartAt;
                        if (obj.periodTime == "" || obj.periodTime == null) {
                            prizeStartAt = "-";
                        } else {
                            prizeStartAt = ("0" + date.getDate()).slice(-2) + "/" + ("0" + (date.getMonth() + 1)).slice(-2) + "/" + date.getFullYear() + " " + ("0" + date.getHours()).slice(-2) + ":" + ("0" + date.getMinutes()).slice(-2) + ":" + ("0" + date.getSeconds()).slice(-2);
                        }

                        var date2 = new Date(obj.createTime);
                        var prizeAt;
                        if (obj.createTime == "" || obj.createTime == null) {
                            prizeAt = "-";
                        } else {
                            prizeAt = ("0" + date2.getDate()).slice(-2) + "/" + ("0" + (date2.getMonth() + 1)).slice(-2) + "/" + date2.getFullYear() + " " + ("0" + date2.getHours()).slice(-2) + ":" + ("0" + date2.getMinutes()).slice(-2) + ":" + ("0" + date2.getSeconds()).slice(-2);
                        }

                        var date3 = new Date(obj.endTime);
                        var prizeEndAt;
                        if (obj.endTime == "" || obj.endTime == null) {
                            prizeEndAt = "-";
                        } else {
                            prizeEndAt = ("0" + date3.getDate()).slice(-2) + "/" + ("0" + (date3.getMonth() + 1)).slice(-2) + "/" + date3.getFullYear() + " " + ("0" + date3.getHours()).slice(-2) + ":" + ("0" + date3.getMinutes()).slice(-2) + ":" + ("0" + date3.getSeconds()).slice(-2);
                        }
                        htmlData += "<td><b set-lan='text:Start date_'></b> " + prizeStartAt + "<br><b set-lan='text:To date_'></b> " + prizeEndAt + "<br><b set-lan='text:Time of award'></b>: " + prizeAt + "<br><b set-lan='text:Lucky draw results'></b>: <b>" + obj.ticketNumber + "</b></td>";

                        var TotalPrize = parseFloat(obj.totalPrize).toFixed(2);
                        TotalPrize = TotalPrize.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1,");
                        htmlData += "<td class='alignright'>" + TotalPrize + "</td>";

                        var totalAmount = obj.totalAmount;
                        totalAmount = totalAmount.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1,");
                        htmlData += "<td class='alignright'>" + totalAmount + "</td>";

                        htmlData += "<td class='aligncenter'><button type='button' class='btn btn-yellow font-weight-bold m-0 px-3 py-2 z-depth-0 waves-effect btnMenu' onclick='GetDataDetail(`" + obj.periodTime + "`,`" + TotalPrize + "`);' style='line-height: 0rem !important;' set-lan='text:Detail'></button></td>";
                        htmlData += "</tr>";
                        no++;
                    }

                    var totalPrizeMain = parseFloat(response.data.summary.prize).toFixed(2);
                    $("#totalPrizeMain").text(totalPrizeMain.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,'));
                    var totalPlayer = response.data.summary.player;
                    $("#totalPlayer").text(totalPlayer.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,'));

                    $("#tbData > tbody").append(htmlData);
                }
                else {
                    $("#tbData > tbody").append("<tr><td colspan='9' style='text-align: center;' set-lan='text:No data.'></td></tr>");
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

        const postDetail = async (num, txtDate, Sum) => {
            $("#myModalLoad").modal();

            if (num == 0) {
                num = num + 1;
            }

            const parameter = {
                page: num,
                size: 50,
                periodTime: txtDate
            }
            const requestAwait = await fetchDataSite(`${apiURL}/v1/lotto/logs/getList`, 'POST', "include", parameter)
            const response = await requestAwait.json()

            if (response.messageCode == 0000 || response.messageCode == null) {
                TotalDataDetail = response.total;
                GetNumPage3(num, txtDate, Sum);

                if (NumPageDetail == 0) {
                    $("#tbData2 > tbody").html("");
                    var htmlData = "";
                    if (response.total != 0) {
                        var no = 1;
                        for (var i = 0; i < response.data.length; i++) {
                            var obj = response.data[i];

                            htmlData += "<tr>";
                            htmlData += "<td class='aligncenter'>" + (((num - 1) * 50) + no) + "</td>";
                            htmlData += "<td>" + obj.username + "</td>";
                            htmlData += "<td>" + obj.ticketNumber + "</td>";

                            var text = obj.typeReward;
                            if (text != "") {
                                var txt = "";
                                var array = text.split('_');
                                for (var j = 0; j < array.length; j++) {
                                    if (array[j] == "firstPrize") {
                                        if (txt == "") {
                                            txt += "<span set-lan='text:First Prize'></span>";
                                        }
                                        else {
                                            txt += ",<br><span set-lan='text:First Prize'></span>";
                                        }
                                    }
                                    else if (array[j] == "firstThreeDigits") {
                                        if (txt == "") {
                                            txt += "<span set-lan='text:3 first numbers match'></span>";
                                        }
                                        else {
                                            txt += ",<br><span set-lan='text:3 first numbers match'></span>";
                                        }
                                    }
                                    else if (array[j] == "lastThreeDigits") {
                                        if (txt == "") {
                                            txt += "<span set-lan='text:3 last numbers match'></span>";
                                        }
                                        else {
                                            txt += ",<br><span set-lan='text:3 last numbers match'></span>";
                                        }
                                    }
                                    else if (array[j] == "lastTwoDigits") {
                                        if (txt == "") {
                                            txt += "<span set-lan='text:2 last numbers match'></span>";
                                        }
                                        else {
                                            txt += ",<br><span set-lan='text:2 last numbers match'></span>";
                                        }
                                    }
                                }
                                htmlData += "<td>" + txt + "</td>";
                            }
                            else {
                                htmlData += "<td>-</td>";
                            }

                            var prize = parseFloat(obj.sumPrize).toFixed(2);
                            prize = prize.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1,");
                            htmlData += "<td class='alignright'>" + prize + "</td>";
                            htmlData += "</tr>";
                            no++;
                        }

                        $("#tbData2 > tbody").append(htmlData);
                    }
                    else {
                        $("#tbData2 > tbody").append("<tr><td colspan='5' style='text-align: center;' set-lan='text:No data.'></td></tr>");
                    }

                    $("#totalPrize").text(Sum);
                    SetLan(localStorage.getItem("Language"));
                    $("#myModalLoad").modal('hide');
                    $("#modalGetDetail").modal();
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

        const postPageDetail = async (num, txtDate, Sum) => {
            $("#myModalLoad").modal();
            $("#tbData2 > tbody").html("");

            const parameter = {
                page: num,
                size: 50,
                periodTime: txtDate
            }
            const requestAwait = await fetchDataSite(`${apiURL}/v1/lotto/logs/getList`, 'POST', "include", parameter)
            const response = await requestAwait.json()

            if (response.messageCode == 0000 || response.messageCode == null) {
                $("#tbData2 > tbody").html("");
                var htmlData = "";
                if (response.total != 0) {
                    var no = 1;
                    for (var i = 0; i < response.data.length; i++) {
                        var obj = response.data[i];

                        htmlData += "<tr>";
                        htmlData += "<td class='aligncenter'>" + (((num - 1) * 50) + no) + "</td>";
                        htmlData += "<td>" + obj.username + "</td>";
                        htmlData += "<td>" + obj.ticketNumber + "</td>";

                        var text = obj.typeReward;
                        if (text != "") {
                            var txt = "";
                            var array = text.split('_');
                            for (var j = 0; j < array.length; j++) {
                                if (array[j] == "firstPrize") {
                                    if (txt == "") {
                                        txt += "<span set-lan='text:First Prize'></span>";
                                    }
                                    else {
                                        txt += ",<br><span set-lan='text:First Prize'></span>";
                                    }
                                }
                                else if (array[j] == "firstThreeDigits") {
                                    if (txt == "") {
                                        txt += "<span set-lan='text:3 first numbers match'></span>";
                                    }
                                    else {
                                        txt += ",<br><span set-lan='text:3 first numbers match'></span>";
                                    }
                                }
                                else if (array[j] == "lastThreeDigits") {
                                    if (txt == "") {
                                        txt += "<span set-lan='text:3 last numbers match'></span>";
                                    }
                                    else {
                                        txt += ",<br><span set-lan='text:3 last numbers match'></span>";
                                    }
                                }
                                else if (array[j] == "lastTwoDigits") {
                                    if (txt == "") {
                                        txt += "<span set-lan='text:2 last numbers match'></span>";
                                    }
                                    else {
                                        txt += ",<br><span set-lan='text:2 last numbers match'></span>";
                                    }
                                }
                            }
                            htmlData += "<td>" + txt + "</td>";
                        }
                        else {
                            htmlData += "<td>-</td>";
                        }

                        var prize = parseFloat(obj.sumPrize).toFixed(2);
                        prize = prize.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1,");
                        htmlData += "<td class='alignright'>" + prize + "</td>";
                        htmlData += "</tr>";
                        no++;
                    }

                    $("#tbData2 > tbody").append(htmlData);
                }
                else {
                    $("#tbData2 > tbody").append("<tr><td colspan='5' style='text-align: center;' set-lan='text:No data.'></td></tr>");
                }

                $("#totalPrize").text(Sum);
                SetLan(localStorage.getItem("Language"));
                $("#myModalLoad").modal('hide');
                $("#modalGetDetail").modal();
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
