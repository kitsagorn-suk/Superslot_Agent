<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="tournament_latest.aspx.cs" Inherits="Pretty_Gaming.Menu_Tournament.tournament_latest" %>

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
            <li class="breadcrumb-item"><a href="" set-lan="text:Tournament"></a></li>
            <li class="breadcrumb-item active txtMem" set-lan="text:Tournament Latest"></li>
        </ol>
    </nav>
    <div class="row">
        <div class="col-md-8">
            <h1 set-lan="text:Tournament Latest"></h1>
        </div>
    </div>
    <div class="table-wrapper" style="margin-top: 10px; margin-bottom: 10px;">
        <%--<section style="float: right; margin-top: -2.2rem;">
            <div class="data-container"></div>
            <div id="pagination-demo2"></div>
        </section>--%>
        <table class="table table-border" id="tbData">
            <thead class="rgba-green-slight">
                <tr>
                    <th style="width: 1%;" set-lan="text:No"></th>
                    <th style='width: 8%;' set-lan='text:Date'></th>
                    <th style="width: 3%;" set-lan="text:Min"></th>
                    <th style="width: 3%;" set-lan="text:Max"></th>
                    <th style="width: 3%;" set-lan="text:Total Prize"></th>
                    <th style="width: 3%;" set-lan="text:Total Player"></th>
                    <th style="width: 3%;" set-lan="text:Prize Type"></th>
                    <th style="width: 3%;" set-lan="text:Status"></th>
                    <th style="width: 3%;" set-lan="text:Detail"></th>
                </tr>
            </thead>
            <tbody></tbody>
            <tfoot class="rgba-yellow-slight">
                <tr class="total">
                    <td></td>
                    <td></td>
                    <td></td>
                    <td set-lan="text:Total"></td>
                    <td id="totalPrizeMain">-</td>
                    <td id="totalPlayer">-</td>
                    <td></td>
                    <td></td>
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
                    <table class="table table-border" id="tbData2">
                        <thead class="rgba-green-slight">
                            <tr>
                                <th style="width: 1%;" set-lan="text:No"></th>
                                <th style="width: 10%;" set-lan="text:User"></th>
                                <th style="width: 10%;" set-lan="text:Nickname"></th>
                                <th style="text-align: right; padding-right: 5px;" set-lan="text:Total Count Bet"></th>
                                <th style="text-align: right; padding-right: 5px;" set-lan="text:Total Amount"></th>
                                <th style="text-align: right; padding-right: 5px;" set-lan="text:Total Payout"></th>
                                <th style="text-align: right; padding-right: 5px;" set-lan="text:Score"></th>
                                <th style="text-align: right; padding-right: 5px;" set-lan="text:Prize"></th>
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
            $("#menuTournament , #menuTournament > a").addClass("active");
            $("#menuTournament > div").css("display", "block");

            GetData();
            SetLan(localStorage.getItem("Language"));
        });

        function getTest(AA, Total) {
            console.log(AA);
            console.log(Total);
        }

        function getModalDetail(Data, Total) {
            $("#myModalLoad").modal();
            $("#tbData2 > tbody").html("");
            var html = "";

            if (Data == null || Data == "") {
                html = "<tr><td colspan='8' style='text-align: center;' set-lan='text:No data.'></td></tr>";
            }
            else {
                var no = 1;

                for (var i = 0; i < Data.length; i++) {
                    var obj = Data[i];

                    var user = obj.username;
                    var nick = obj.nickName;
                    var score = parseFloat(obj.score).toFixed(2);
                    score = score.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1,");
                    var prize = parseFloat(obj.prize).toFixed(2);
                    prize = prize.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1,");

                    var totalCountBet = obj.totalCountBet;
                    var totalAmount = parseFloat(obj.totalAmount).toFixed(2);
                    totalAmount = totalAmount.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1,");
                    var totalPayout = parseFloat(obj.totalPayout).toFixed(2);
                    totalPayout = totalPayout.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1,");

                    html += "<tr>";
                    html += "<td class='aligncenter'>" + no + "</td>";
                    html += "<td style='width: 10%;'>" + user + "</td>";
                    html += "<td style='width: 10%;'>" + nick + "</td>";

                    //htmlData += "<td style='width: 7.5%; left: 2%;'><p class='overflow ellipsis' title='" + response.data.detail[i].nickname + "'>" + response.data.detail[i].nickname + "</p></td>";

                    html += "<td class='alignright'>" + totalCountBet + "</td>";
                    html += "<td class='alignright'>" + totalAmount + "</td>";
                    html += "<td class='alignright'>" + totalPayout + "</td>";
                    html += "<td class='alignright'>" + score + "</td>";
                    html += "<td class='alignright'>" + prize + "</td>";
                    html += "</tr>";
                    no++;
                }
            }

            Total = parseFloat(Total).toFixed(2);
            $("#totalPrize").text(Total.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,'));

            $("#tbData2 > tbody").append(html);
            SetLan(localStorage.getItem("Language"));
            $("#myModalLoad").modal('hide');
            $("#modalGetDetail").modal();
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

        function GetData() {
            $("#myModalLoad").modal();
            postData();
        }

        const postData = async () => {
            const requestAwait = await fetchDataSite(`${apiURL}/v1/tournament/latest/get`, 'GET', "include", {})
            const response = await requestAwait.json()

            if (response.messageCode == 0000 || response.messageCode == null) {
                $("#tbData > tbody").html("");
                var htmlData = "";
                if (response.total != 0) {
                    var no = 1;
                    for (var i = 0; i < response.data.detail.length; i++) {
                        var obj = response.data.detail[i];

                        var date = new Date(obj.prizeStartAt);
                        var prizeStartAt;
                        if (obj.prizeStartAt == "" || obj.prizeStartAt == null) {
                            prizeStartAt = "-";
                        } else {
                            prizeStartAt = ("0" + date.getDate()).slice(-2) + "/" + ("0" + (date.getMonth() + 1)).slice(-2) + "/" + date.getFullYear() + " " + ("0" + date.getHours()).slice(-2) + ":" + ("0" + date.getMinutes()).slice(-2) + ":" + ("0" + date.getSeconds()).slice(-2);
                        }

                        var date3 = new Date(obj.prizeEndAt);
                        var prizeEndAt;
                        if (obj.prizeEndAt == "" || obj.prizeEndAt == null) {
                            prizeEndAt = "-";
                        } else {
                            prizeEndAt = ("0" + date3.getDate()).slice(-2) + "/" + ("0" + (date3.getMonth() + 1)).slice(-2) + "/" + date3.getFullYear() + " " + ("0" + date3.getHours()).slice(-2) + ":" + ("0" + date3.getMinutes()).slice(-2)+ ":" + ("0" + date.getSeconds()).slice(-2);
                        }

                        var min = parseFloat(obj.min).toFixed(2);
                        var max = parseFloat(obj.max).toFixed(2);
                        var TotalPrize = parseFloat(obj.validTotalPrize).toFixed(2);
                        min = min.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1,");
                        max = max.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1,");
                        TotalPrize = TotalPrize.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1,");

                        var prizeType = capitalizeFirstLetter(obj.type);

                        var Status = obj.status;
                        Status = Status.toLowerCase();
                        var txt = capitalizeFirstLetter(Status);
                        Status = txt;

                        var List = JSON.stringify(obj.list);

                        htmlData += "<tr>";
                        htmlData += "<td class='aligncenter'>" + no + "</td>";
                        htmlData += "<td><b set-lan='text:Tournament start date'></b>: " + prizeStartAt + "<br><b set-lan='text:Tournament end date'></b>: " + prizeEndAt + "</td>";
                        htmlData += "<td class='alignright'>" + min + "</td>";
                        htmlData += "<td class='alignright'>" + max + "</td>";
                        htmlData += "<td class='alignright'>" + TotalPrize + "</td>";
                        htmlData += "<td class='alignright'>" + obj.totalPlayer + "</td>";
                        htmlData += "<td class='aligncenter'><span set-lan='text:" + prizeType + "'></span></td>";
                        htmlData += "<td class='aligncenter'><span set-lan='text:" + Status + "'></span></td>";
                        htmlData += "<td class='aligncenter'><button type='button' class='btn btn-yellow font-weight-bold m-0 px-3 py-2 z-depth-0 waves-effect btnMenu' onclick='getModalDetail(" + List + ",`" + obj.validTotalPrize + "`);' style='line-height: 0rem !important;' set-lan='text:Detail'></button></td>";
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
    </script>
</asp:Content>
