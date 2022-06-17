<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="game_market_log.aspx.cs" Inherits="Pretty_Gaming.Menu_game_market.game_market_log" %>

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
            <li class="breadcrumb-item"><a href="" set-lan="text:Game Market"></a></li>
            <li class="breadcrumb-item active txtMem" set-lan="text:Game Market Logs"></li>
        </ol>
    </nav>
    <div class="row">
        <div class="col-md-8">
            <h1 set-lan="text:Game Market Logs"></h1>
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
                    <th style='width: 10%;' set-lan='text:User'></th>
                    <th style="width: 10%;" set-lan="text:Item"></th>
                    <th style="width: 10%;" set-lan="text:Value"></th>
                    <th style="width: 10%;" set-lan="text:Provider"></th>
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
                </tr>
            </tfoot>
        </table>
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
            $("#menuGame , #menuGame > a").addClass("active");
            $("#menuGame > div").css("display", "block");

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
            $("#myModalLoad").modal();

            if (num == 0) {
                num = num + 1;
            }

            const parameter = {
                page: num,
                size: 100
            }
            const requestAwait = await fetchDataSite(`${apiURL}/v1/gameMarket/redeem/inquiry`, 'POST', "include", parameter)
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

                            htmlData += "<tr>";
                            htmlData += "<td class='aligncenter'>" + (((num - 1) * 100) + no) + "</td>";
                            htmlData += "<td>" + obj.username + "</td>";
                            htmlData += "<td>" + obj.itemName + "</td>";

                            var total_value = obj.value;
                            total_value = total_value.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1,");
                            htmlData += "<td class='alignright'>" + total_value + " <span set-lan='text:Point'></span></td>";

                            htmlData += "<td class='aligncenter'>" + obj.providerName + "</td>";
                            htmlData += "</tr>";
                            no++;
                        }

                        $("#tbData > tbody").append(htmlData);
                    }
                    else {
                        $("#tbData > tbody").append("<tr><td colspan='5' style='text-align: center;' set-lan='text:No data.'></td></tr>");
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
                size: 100
            }
            const requestAwait = await fetchDataSite(`${apiURL}/v1/gameMarket/redeem/inquiry`, 'POST', "include", parameter)
            const response = await requestAwait.json()

            if (response.messageCode == 0000 || response.messageCode == null) {
                var htmlData = "";
                if (response.total != 0) {
                    var no = 1;
                    for (var i = 0; i < response.data.length; i++) {
                        var obj = response.data[i];

                        htmlData += "<tr>";
                        htmlData += "<td class='aligncenter'>" + (((num - 1) * 100) + no) + "</td>";
                        htmlData += "<td>" + obj.username + "</td>";
                        htmlData += "<td>" + obj.itemName + "</td>";

                        var total_value = obj.value;
                        total_value = total_value.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1,");
                        htmlData += "<td class='alignright'>" + total_value + " <span set-lan='text:Point'></span></td>";

                        htmlData += "<td class='aligncenter'>" + obj.providerName + "</td>";
                        htmlData += "</tr>";
                        no++;
                    }

                    $("#tbData > tbody").append(htmlData);
                }
                else {
                    $("#tbData > tbody").append("<tr><td colspan='5' style='text-align: center;' set-lan='text:No data.'></td></tr>");
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
