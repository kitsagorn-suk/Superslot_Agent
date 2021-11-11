<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="sub_accounts.aspx.cs" Inherits="Super_Slot.Menu_MemberManagement.sub_accounts" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .FloatR {
            float: right;
        }
    </style>
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="" set-lan="text:Management"></a></li>
            <li class="breadcrumb-item active txtMem" set-lan="text:Sub User List"></li>
        </ol>
    </nav>
    <div class="row">
        <div class="col-md-8">
            <h1 set-lan="text:Sub User List"></h1>
        </div>
    </div>
    <div class="table-wrapper" style="margin-bottom: 10px;">
        <section style="float: right; margin-top: -2.2rem;">
            <div class="data-container"></div>
            <div id="pagination-demo2"></div>
        </section>
        <table class="table table-border" id="tbData">
            <thead class="rgba-green-slight">
                <tr>
                    <th class="align-middle" style="width: 2%;" set-lan="text:No"></th>
                    <th class="align-middle" style="width: 7%; text-align: left; padding-left: 5px;" set-lan="text:Username"></th>
                    <th class="align-middle" style="width: 7%; text-align: left; padding-left: 5px;" set-lan="text:Nickname"></th>
                    <th class="align-middle" style="width: 2%; text-align: left; padding-left: 5px;" set-lan="text:Phone"></th>
                    <th class="align-middle" style="width: 3%;" class="edit" set-lan="text:Edit"></th>
                    <th class="thLock align-middle" style="width: 5%;" set-lan="text:Lock"></th>
                    <th style="width: 10%;" set-lan="text:Permission"></th>
                    <th class="align-middle" style="width: 4%; text-align: left; padding-left: 5px;" set-lan="text:Last login IP"></th>
                    <th class="align-middle" style="width: 8%;" set-lan="text:Last login date"></th>
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
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
            </tfoot>
        </table>
    </div>

    <!-- Modal -->
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
                    <label set-lan="text:Edit sub account success"></label>
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
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainScript" runat="server">
    <script src="../js/pagination.js"></script>
    <script type="text/javascript">
        var Position = localStorage.getItem("Position");
        var ValScroll = 0;

        $(document).ready(function () {
            $("#menuMemberManage , #menuMemberManage > a").addClass("active");
            $("#menuMemberManage > div").css("display", "block");

            GetData();
            SetLan(localStorage.getItem("Language"));
            $("#myModalLoad").modal();
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

        function GetScroll() {
            var scrollTop = window.pageYOffset || document.documentElement.scrollTop;
            ValScroll = scrollTop;
        }

        function SetScroll() {
            var scroll = getUrlParameter('s');
            if (scroll != "" || scroll != null) {
                document.documentElement.scrollTop = document.body.scrollTop = scroll;
            }
        }

        function viewEdit(val) {
            $("#myModalLoad").modal();
            GetScroll();
            window.location.href = "/Menu_MemberManagement/sub_user_add.aspx?uname=" + val + "&s=" + ValScroll;
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
                        dataSource: 'https://api.flickr.com/services/feeds/photos_public.gne?tags=cat&tagmode=any&format=json&jsoncallback=?',
                        locator: 'items',
                        callback: function (response, pagination) {
                            num = container.pagination('getSelectedPageNum');
                            if (NumPage != 0) {
                                postSubData(num);
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
            const requestAwait = await fetchDataSite(`${apiURL}/v1/subuser/inquiry`, 'POST', "include", parameter)
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
                            var Lock = obj.isLock;

                            if (Lock == true) {
                                htmlData += "<tr style='background-color: #e9ecef;'>";
                            }
                            else {
                                htmlData += "<tr>";
                            }
                            htmlData += "<td class='aligncenter'>" + (((num - 1) * 20) + no) + "</td>";
                            htmlData += "<td>" + response.data[i].username + "</td>";

                            if (response.data[i].nickName == null || response.data[i].nickName == "") {
                                htmlData += "<td>-</td>";
                            } else {
                                htmlData += "<td>" + obj.nickName + "</td>";
                            }

                            if (obj.phone == "" || obj.phone == null) {
                                htmlData += "<td class='colTel'>-</td>";
                            } else {
                                htmlData += "<td class='colTel'>" + obj.phone + "</td>";
                            }
                            htmlData += "<td class='aligncenter colEdit zonenone'><a class='link' onclick='viewEdit(\"" + obj.id + "\");'><i class='fas fa-pencil-alt'></i></a></td>";

                            if (Lock == false) {
                                Lock = "Unlock";
                            }
                            else {
                                Lock = "Lock";
                            }
                            htmlData += "<td class='colLock aligncenter' set-lan='text:" + Lock + "'></td>";

                            var dashboard = obj.permissions.dashboard;
                            var account = obj.permissions.account;
                            var member = obj.permissions.member;
                            var report = obj.permissions.report;
                            var payment = obj.permissions.payment;
                            var announcement = obj.permissions.announcement;
                            var mission = obj.permissions.mission;
                            var stockManagement = obj.permissions.stockManagement;
                            var userOnline = obj.permissions.userOnline;
                            var feedback = obj.permissions.feedback;
                            var randomJackpot = obj.permissions.randomJackpot;
                            var market = obj.permissions.market;
                            var notification = obj.permissions.notification;
                            var tournament = obj.permissions.tournament;
                            var dailyReward = obj.permissions.dailyReward;
                            var marketingTools = obj.permissions.marketingTools;
                            var lotto = obj.permissions.lotto;

                            if (dashboard == "" || dashboard == null) {
                                dashboard = "<span class='FloatR'>-</span>";
                            } else {
                                if (dashboard == "OFF") {
                                    dashboard = "<span class='FloatR red-text' set-lan='text:" + dashboard + "'></span>";
                                } else if (dashboard == "VIEW") {
                                    dashboard = "<span class='FloatR orange-text' set-lan='text:" + dashboard + "'></span>";
                                } else if (dashboard == "EDIT") {
                                    dashboard = "<span class='FloatR green-text' set-lan='text:" + dashboard + "'></span>";
                                }
                            }

                            if (account == "" || account == null) {
                                account = "<span class='FloatR'>-</span>";
                            } else {
                                if (account == "OFF") {
                                    account = "<span class='FloatR red-text' set-lan='text:" + account + "'></span>";
                                } else if (account == "VIEW") {
                                    account = "<span class='FloatR orange-text' set-lan='text:" + account + "'></span>";
                                } else if (account == "EDIT") {
                                    account = "<span class='FloatR green-text' set-lan='text:" + account + "'></span>";
                                }
                            }

                            if (member == "" || member == null) {
                                member = "<span class='FloatR'>-</span>";
                            } else {
                                if (member == "OFF") {
                                    member = "<span class='FloatR red-text' set-lan='text:" + member + "'></span>";
                                } else if (member == "VIEW") {
                                    member = "<span class='FloatR orange-text' set-lan='text:" + member + "'></span>";
                                } else if (member == "EDIT") {
                                    member = "<span class='FloatR green-text' set-lan='text:" + member + "'></span>";
                                }
                            }

                            if (report == "" || report == null) {
                                report = "<span class='FloatR'>-</span>";
                            } else {
                                if (report == "OFF") {
                                    report = "<span class='FloatR red-text' set-lan='text:" + report + "'></span>";
                                } else if (report == "VIEW") {
                                    report = "<span class='FloatR orange-text' set-lan='text:" + report + "'></span>";
                                } else if (report == "EDIT") {
                                    report = "<span class='FloatR green-text' set-lan='text:" + report + "'></span>";
                                }
                            }

                            if (payment == "" || payment == null) {
                                payment = "<span class='FloatR'>-</span>";
                            } else {
                                if (payment == "OFF") {
                                    payment = "<span class='FloatR red-text' set-lan='text:" + payment + "'></span>";
                                } else if (payment == "VIEW") {
                                    payment = "<span class='FloatR orange-text' set-lan='text:" + payment + "'></span>";
                                } else if (payment == "EDIT") {
                                    payment = "<span class='FloatR green-text' set-lan='text:" + payment + "'></span>";
                                }
                            }

                            if (announcement == "" || announcement == null) {
                                announcement = "<span class='FloatR'>-</span>";
                            } else {
                                if (announcement == "OFF") {
                                    announcement = "<span class='FloatR red-text' set-lan='text:" + announcement + "'></span>";
                                } else if (announcement == "VIEW") {
                                    announcement = "<span class='FloatR orange-text' set-lan='text:" + announcement + "'></span>";
                                } else if (announcement == "EDIT") {
                                    announcement = "<span class='FloatR green-text' set-lan='text:" + announcement + "'></span>";
                                }
                            }

                            if (mission == "" || mission == null) {
                                mission = "<span class='FloatR'>-</span>";
                            } else {
                                if (mission == "OFF") {
                                    mission = "<span class='FloatR red-text' set-lan='text:" + mission + "'></span>";
                                } else if (mission == "VIEW") {
                                    mission = "<span class='FloatR orange-text' set-lan='text:" + mission + "'></span>";
                                } else if (mission == "EDIT") {
                                    mission = "<span class='FloatR green-text' set-lan='text:" + mission + "'></span>";
                                }
                            }

                            if (stockManagement == "" || stockManagement == null) {
                                stockManagement = "<span class='FloatR'>-</span>";
                            } else {
                                if (stockManagement == "OFF") {
                                    stockManagement = "<span class='FloatR red-text' set-lan='text:" + stockManagement + "'></span>";
                                } else if (stockManagement == "VIEW") {
                                    stockManagement = "<span class='FloatR orange-text' set-lan='text:" + stockManagement + "'></span>";
                                } else if (stockManagement == "EDIT") {
                                    stockManagement = "<span class='FloatR green-text' set-lan='text:" + stockManagement + "'></span>";
                                }
                            }

                            if (userOnline == "" || userOnline == null) {
                                userOnline = "<span class='FloatR'>-</span>";
                            } else {
                                if (userOnline == "OFF") {
                                    userOnline = "<span class='FloatR red-text' set-lan='text:" + userOnline + "'></span>";
                                } else if (userOnline == "VIEW") {
                                    userOnline = "<span class='FloatR orange-text' set-lan='text:" + userOnline + "'></span>";
                                } else if (userOnline == "EDIT") {
                                    userOnline = "<span class='FloatR green-text' set-lan='text:" + userOnline + "'></span>";
                                }
                            }

                            if (feedback == "" || feedback == null) {
                                feedback = "<span class='FloatR'>-</span>";
                            } else {
                                if (feedback == "OFF") {
                                    feedback = "<span class='FloatR red-text' set-lan='text:" + feedback + "'></span>";
                                } else if (feedback == "VIEW") {
                                    feedback = "<span class='FloatR orange-text' set-lan='text:" + feedback + "'></span>";
                                } else if (feedback == "EDIT") {
                                    feedback = "<span class='FloatR green-text' set-lan='text:" + feedback + "'></span>";
                                }
                            }

                            if (randomJackpot == "" || randomJackpot == null) {
                                randomJackpot = "<span class='FloatR'>-</span>";
                            } else {
                                if (randomJackpot == "OFF") {
                                    randomJackpot = "<span class='FloatR red-text' set-lan='text:" + randomJackpot + "'></span>";
                                } else if (randomJackpot == "VIEW") {
                                    randomJackpot = "<span class='FloatR orange-text' set-lan='text:" + randomJackpot + "'></span>";
                                } else if (randomJackpot == "EDIT") {
                                    randomJackpot = "<span class='FloatR green-text' set-lan='text:" + randomJackpot + "'></span>";
                                }
                            }

                            if (market == "" || market == null) {
                                market = "<span class='FloatR'>-</span>";
                            } else {
                                if (market == "OFF") {
                                    market = "<span class='FloatR red-text' set-lan='text:" + market + "'></span>";
                                } else if (market == "VIEW") {
                                    market = "<span class='FloatR orange-text' set-lan='text:" + market + "'></span>";
                                } else if (market == "EDIT") {
                                    market = "<span class='FloatR green-text' set-lan='text:" + market + "'></span>";
                                }
                            }

                            if (notification == "" || notification == null) {
                                notification = "<span class='FloatR'>-</span>";
                            } else {
                                if (notification == "OFF") {
                                    notification = "<span class='FloatR red-text' set-lan='text:" + notification + "'></span>";
                                } else if (notification == "VIEW") {
                                    notification = "<span class='FloatR orange-text' set-lan='text:" + notification + "'></span>";
                                } else if (notification == "EDIT") {
                                    notification = "<span class='FloatR green-text' set-lan='text:" + notification + "'></span>";
                                }
                            }

                            if (tournament == "" || tournament == null) {
                                tournament = "<span class='FloatR'>-</span>";
                            } else {
                                if (tournament == "OFF") {
                                    tournament = "<span class='FloatR red-text' set-lan='text:" + tournament + "'></span>";
                                } else if (tournament == "VIEW") {
                                    tournament = "<span class='FloatR orange-text' set-lan='text:" + tournament + "'></span>";
                                } else if (tournament == "EDIT") {
                                    tournament = "<span class='FloatR green-text' set-lan='text:" + tournament + "'></span>";
                                }
                            }

                            if (dailyReward == "" || dailyReward == null) {
                                dailyReward = "<span class='FloatR'>-</span>";
                            } else {
                                if (dailyReward == "OFF") {
                                    dailyReward = "<span class='FloatR red-text' set-lan='text:" + dailyReward + "'></span>";
                                } else if (dailyReward == "VIEW") {
                                    dailyReward = "<span class='FloatR orange-text' set-lan='text:" + dailyReward + "'></span>";
                                } else if (dailyReward == "EDIT") {
                                    dailyReward = "<span class='FloatR green-text' set-lan='text:" + dailyReward + "'></span>";
                                }
                            }

                            if (marketingTools == "" || marketingTools == null) {
                                marketingTools = "<span class='FloatR'>-</span>";
                            } else {
                                if (marketingTools == "OFF") {
                                    marketingTools = "<span class='FloatR red-text' set-lan='text:" + marketingTools + "'></span>";
                                } else if (marketingTools == "VIEW") {
                                    marketingTools = "<span class='FloatR orange-text' set-lan='text:" + marketingTools + "'></span>";
                                } else if (marketingTools == "EDIT") {
                                    marketingTools = "<span class='FloatR green-text' set-lan='text:" + marketingTools + "'></span>";
                                }
                            }

                            if (lotto == "" || lotto == null) {
                                lotto = "<span class='FloatR'>-</span>";
                            } else {
                                if (lotto == "OFF") {
                                    lotto = "<span class='FloatR red-text' set-lan='text:" + lotto + "'></span>";
                                } else if (lotto == "VIEW") {
                                    lotto = "<span class='FloatR orange-text' set-lan='text:" + lotto + "'></span>";
                                } else if (lotto == "EDIT") {
                                    lotto = "<span class='FloatR green-text' set-lan='text:" + lotto + "'></span>";
                                }
                            }

                            var Zone = "";
                            var Zone2 = "";
                            if (Position == "COMPANY") {
                                Zone = "<b set-lan='text:Announcements'></b>" + announcement + "<br />" +
                                    "<b set-lan='text:Mission'></b>" + mission + "<br />";
                                Zone2 = "<b set-lan='text:Red Envelope'></b>" + randomJackpot + "<br />";
                            }
                            else if (Position == "AGENT") {
                                Zone = "<b set-lan='text:Announcements'></b>" + announcement + "<br />";
                            }

                            htmlData += "<td><b set-lan='text:Dashboard'></b>" + dashboard + "<br />" +
                                "<b set-lan='text:Account'></b>" + account + "<br />" +
                                "<b set-lan='text:Management'></b>" + member + "<br />" +
                                "<b set-lan='text:Report'></b>" + report + "<br />" +
                                "<b set-lan='text:Payment'></b>" + payment + "<br />" +
                                Zone +
                                "<b set-lan='text:Stock Mngement'></b>" + stockManagement + "<br />" +
                                "<b set-lan='text:Online User'></b>" + userOnline + "<br />" +
                                "<b set-lan='text:Feedback'></b>" + feedback + "<br />" +
                                Zone2 +
                                "<b set-lan='text:Market'></b>" + market + "<br />" +
                                "<b set-lan='text:Notification'></b>" + notification + "<br />" +
                                "<b set-lan='text:Tournament'></b>" + tournament + "<br />" +
                                "<b set-lan='text:Daily Rewards'></b>" + dailyReward + "<br />" +
                                "<b set-lan='text:Marketing Tools'></b>" + marketingTools + "<br />" +
                                "<b set-lan='text:Lucky Draw'></b>" + lotto + "<br />" +
                                "</td>";

                            if (obj.lastLoginIp == "" || obj.lastLoginIp == null) {
                                htmlData += "<td>-</td>";
                            } else {
                                htmlData += "<td><p class='overflow ellipsis' title='" + obj.lastLoginIp + "'>" + obj.lastLoginIp + "</p></td>";
                            }

                            if (obj.lastLoginTime == "" || obj.lastLoginTime == null) {
                                htmlData += "<td class='aligncenter'>-</td>";
                            } else {
                                htmlData += "<td class='aligncenter'>" + obj.lastLoginTime + "</td>";
                            }

                            htmlData += "</tr>";
                            no++;
                        }
                        $("#tbData > tbody").append(htmlData);
                    }
                    else {
                        $("#tbData > tbody").append("<tr><td colspan='13' style='text-align: center;' set-lan='text:No data.'></td></tr>");
                    }

                    SetScroll();
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

        const postSubData = async (num) => {
            $("#tbData > tbody").html("");
            const parameterSub = {
                page: num,
                size: 100
            }
            const requestAwait = await fetchDataSite(`${apiURL}/v1/subuser/inquiry`, 'POST', "include", parameterSub)
            const response = await requestAwait.json()

            if (response.messageCode == 0000 || response.messageCode == null) {
                var htmlData = "";
                if (response.total != 0) {
                    var no = 1;

                    for (var i = 0; i < response.data.length; i++) {
                        var obj = response.data[i];
                        var Lock = obj.isLock;

                        if (Lock == true) {
                            htmlData += "<tr style='background-color: #e9ecef;'>";
                        }
                        else {
                            htmlData += "<tr>";
                        }
                        htmlData += "<td class='aligncenter'>" + (((num - 1) * 20) + no) + "</td>";
                        htmlData += "<td>" + response.data[i].username + "</td>";

                        if (response.data[i].nickName == null || response.data[i].nickName == "") {
                            htmlData += "<td>-</td>";
                        } else {
                            htmlData += "<td>" + obj.nickName + "</td>";
                        }

                        if (obj.phone == "" || obj.phone == null) {
                            htmlData += "<td class='colTel'>-</td>";
                        } else {
                            htmlData += "<td class='colTel'>" + obj.phone + "</td>";
                        }
                        htmlData += "<td class='aligncenter colEdit zonenone'><a class='link' onclick='viewEdit(\"" + obj.id + "\");'><i class='fas fa-pencil-alt'></i></a></td>";

                        if (Lock == false) {
                            Lock = "Unlock";
                        }
                        else {
                            Lock = "Lock";
                        }
                        htmlData += "<td class='colLock aligncenter' set-lan='text:" + Lock + "'></td>";

                        var dashboard = obj.permissions.dashboard;
                        var account = obj.permissions.account;
                        var member = obj.permissions.member;
                        var report = obj.permissions.report;
                        var payment = obj.permissions.payment;
                        var announcement = obj.permissions.announcement;
                        var mission = obj.permissions.mission;
                        var stockManagement = obj.permissions.stockManagement;
                        var userOnline = obj.permissions.userOnline;
                        var feedback = obj.permissions.feedback;
                        var randomJackpot = obj.permissions.randomJackpot;
                        var market = obj.permissions.market;
                        var notification = obj.permissions.notification;
                        var tournament = obj.permissions.tournament;
                        var dailyReward = obj.permissions.dailyReward;
                        var marketingTools = obj.permissions.marketingTools;
                        var lotto = obj.permissions.lotto;

                        if (dashboard == "" || dashboard == null) {
                            dashboard = "<span class='FloatR'>-</span>";
                        } else {
                            if (dashboard == "OFF") {
                                dashboard = "<span class='FloatR red-text' set-lan='text:" + dashboard + "'></span>";
                            } else if (dashboard == "VIEW") {
                                dashboard = "<span class='FloatR orange-text' set-lan='text:" + dashboard + "'></span>";
                            } else if (dashboard == "EDIT") {
                                dashboard = "<span class='FloatR green-text' set-lan='text:" + dashboard + "'></span>";
                            }
                        }

                        if (account == "" || account == null) {
                            account = "<span class='FloatR'>-</span>";
                        } else {
                            //account = "<span class='FloatR' set-lan='text:" + account + "'></span>";
                            if (account == "OFF") {
                                account = "<span class='FloatR red-text' set-lan='text:" + account + "'></span>";
                            } else if (account == "VIEW") {
                                account = "<span class='FloatR orange-text' set-lan='text:" + account + "'></span>";
                            } else if (account == "EDIT") {
                                account = "<span class='FloatR green-text' set-lan='text:" + account + "'></span>";
                            }
                        }

                        if (member == "" || member == null) {
                            member = "<span class='FloatR'>-</span>";
                        } else {
                            //member = "<span class='FloatR' set-lan='text:" + member + "'></span>";
                            if (member == "OFF") {
                                member = "<span class='FloatR red-text' set-lan='text:" + member + "'></span>";
                            } else if (member == "VIEW") {
                                member = "<span class='FloatR orange-text' set-lan='text:" + member + "'></span>";
                            } else if (member == "EDIT") {
                                member = "<span class='FloatR green-text' set-lan='text:" + member + "'></span>";
                            }
                        }

                        if (report == "" || report == null) {
                            report = "<span class='FloatR'>-</span>";
                        } else {
                            //report = "<span class='FloatR' set-lan='text:" + report + "'></span>";
                            if (report == "OFF") {
                                report = "<span class='FloatR red-text' set-lan='text:" + report + "'></span>";
                            } else if (report == "VIEW") {
                                report = "<span class='FloatR orange-text' set-lan='text:" + report + "'></span>";
                            } else if (report == "EDIT") {
                                report = "<span class='FloatR green-text' set-lan='text:" + report + "'></span>";
                            }
                        }

                        if (payment == "" || payment == null) {
                            payment = "<span class='FloatR'>-</span>";
                        } else {
                            //payment = "<span class='FloatR' set-lan='text:" + payment + "'></span>";
                            if (payment == "OFF") {
                                payment = "<span class='FloatR red-text' set-lan='text:" + payment + "'></span>";
                            } else if (payment == "VIEW") {
                                payment = "<span class='FloatR orange-text' set-lan='text:" + payment + "'></span>";
                            } else if (payment == "EDIT") {
                                payment = "<span class='FloatR green-text' set-lan='text:" + payment + "'></span>";
                            }
                        }

                        if (announcement == "" || announcement == null) {
                            announcement = "<span class='FloatR'>-</span>";
                        } else {
                            //announcement = "<span class='FloatR' set-lan='text:" + announcement + "'></span>";
                            if (announcement == "OFF") {
                                announcement = "<span class='FloatR red-text' set-lan='text:" + announcement + "'></span>";
                            } else if (announcement == "VIEW") {
                                announcement = "<span class='FloatR orange-text' set-lan='text:" + announcement + "'></span>";
                            } else if (announcement == "EDIT") {
                                announcement = "<span class='FloatR green-text' set-lan='text:" + announcement + "'></span>";
                            }
                        }

                        if (mission == "" || mission == null) {
                            mission = "<span class='FloatR'>-</span>";
                        } else {
                            //mission = "<span class='FloatR' set-lan='text:" + mission + "'></span>";
                            if (mission == "OFF") {
                                mission = "<span class='FloatR red-text' set-lan='text:" + mission + "'></span>";
                            } else if (mission == "VIEW") {
                                mission = "<span class='FloatR orange-text' set-lan='text:" + mission + "'></span>";
                            } else if (mission == "EDIT") {
                                mission = "<span class='FloatR green-text' set-lan='text:" + mission + "'></span>";
                            }
                        }

                        if (stockManagement == "" || stockManagement == null) {
                            stockManagement = "<span class='FloatR'>-</span>";
                        } else {
                            //stockManagement = "<span class='FloatR' set-lan='text:" + stockManagement + "'></span>";
                            if (stockManagement == "OFF") {
                                stockManagement = "<span class='FloatR red-text' set-lan='text:" + stockManagement + "'></span>";
                            } else if (stockManagement == "VIEW") {
                                stockManagement = "<span class='FloatR orange-text' set-lan='text:" + stockManagement + "'></span>";
                            } else if (stockManagement == "EDIT") {
                                stockManagement = "<span class='FloatR green-text' set-lan='text:" + stockManagement + "'></span>";
                            }
                        }

                        if (userOnline == "" || userOnline == null) {
                            userOnline = "<span class='FloatR'>-</span>";
                        } else {
                            //userOnline = "<span class='FloatR' set-lan='text:" + userOnline + "'></span>";
                            if (userOnline == "OFF") {
                                userOnline = "<span class='FloatR red-text' set-lan='text:" + userOnline + "'></span>";
                            } else if (userOnline == "VIEW") {
                                userOnline = "<span class='FloatR orange-text' set-lan='text:" + userOnline + "'></span>";
                            } else if (userOnline == "EDIT") {
                                userOnline = "<span class='FloatR green-text' set-lan='text:" + userOnline + "'></span>";
                            }
                        }

                        if (feedback == "" || feedback == null) {
                            feedback = "<span class='FloatR'>-</span>";
                        } else {
                            //feedback = "<span class='FloatR' set-lan='text:" + feedback + "'></span>";
                            if (feedback == "OFF") {
                                feedback = "<span class='FloatR red-text' set-lan='text:" + feedback + "'></span>";
                            } else if (feedback == "VIEW") {
                                feedback = "<span class='FloatR orange-text' set-lan='text:" + feedback + "'></span>";
                            } else if (feedback == "EDIT") {
                                feedback = "<span class='FloatR green-text' set-lan='text:" + feedback + "'></span>";
                            }
                        }

                        if (randomJackpot == "" || randomJackpot == null) {
                            randomJackpot = "<span class='FloatR'>-</span>";
                        } else {
                            if (randomJackpot == "OFF") {
                                randomJackpot = "<span class='FloatR red-text' set-lan='text:" + randomJackpot + "'></span>";
                            } else if (randomJackpot == "VIEW") {
                                randomJackpot = "<span class='FloatR orange-text' set-lan='text:" + randomJackpot + "'></span>";
                            } else if (randomJackpot == "EDIT") {
                                randomJackpot = "<span class='FloatR green-text' set-lan='text:" + randomJackpot + "'></span>";
                            }
                        }

                        if (market == "" || market == null) {
                            market = "<span class='FloatR'>-</span>";
                        } else {
                            if (market == "OFF") {
                                market = "<span class='FloatR red-text' set-lan='text:" + market + "'></span>";
                            } else if (market == "VIEW") {
                                market = "<span class='FloatR orange-text' set-lan='text:" + market + "'></span>";
                            } else if (market == "EDIT") {
                                market = "<span class='FloatR green-text' set-lan='text:" + market + "'></span>";
                            }
                        }

                        if (notification == "" || notification == null) {
                            notification = "<span class='FloatR'>-</span>";
                        } else {
                            if (notification == "OFF") {
                                notification = "<span class='FloatR red-text' set-lan='text:" + notification + "'></span>";
                            } else if (notification == "VIEW") {
                                notification = "<span class='FloatR orange-text' set-lan='text:" + notification + "'></span>";
                            } else if (notification == "EDIT") {
                                notification = "<span class='FloatR green-text' set-lan='text:" + notification + "'></span>";
                            }
                        }

                        if (tournament == "" || tournament == null) {
                            tournament = "<span class='FloatR'>-</span>";
                        } else {
                            if (tournament == "OFF") {
                                tournament = "<span class='FloatR red-text' set-lan='text:" + tournament + "'></span>";
                            } else if (tournament == "VIEW") {
                                tournament = "<span class='FloatR orange-text' set-lan='text:" + tournament + "'></span>";
                            } else if (tournament == "EDIT") {
                                tournament = "<span class='FloatR green-text' set-lan='text:" + tournament + "'></span>";
                            }
                        }

                        if (dailyReward == "" || dailyReward == null) {
                            dailyReward = "<span class='FloatR'>-</span>";
                        } else {
                            if (dailyReward == "OFF") {
                                dailyReward = "<span class='FloatR red-text' set-lan='text:" + dailyReward + "'></span>";
                            } else if (dailyReward == "VIEW") {
                                dailyReward = "<span class='FloatR orange-text' set-lan='text:" + dailyReward + "'></span>";
                            } else if (dailyReward == "EDIT") {
                                dailyReward = "<span class='FloatR green-text' set-lan='text:" + dailyReward + "'></span>";
                            }
                        }

                        if (marketingTools == "" || marketingTools == null) {
                            marketingTools = "<span class='FloatR'>-</span>";
                        } else {
                            if (marketingTools == "OFF") {
                                marketingTools = "<span class='FloatR red-text' set-lan='text:" + marketingTools + "'></span>";
                            } else if (marketingTools == "VIEW") {
                                marketingTools = "<span class='FloatR orange-text' set-lan='text:" + marketingTools + "'></span>";
                            } else if (marketingTools == "EDIT") {
                                marketingTools = "<span class='FloatR green-text' set-lan='text:" + marketingTools + "'></span>";
                            }
                        }

                        if (lotto == "" || lotto == null) {
                            lotto = "<span class='FloatR'>-</span>";
                        } else {
                            if (lotto == "OFF") {
                                lotto = "<span class='FloatR red-text' set-lan='text:" + lotto + "'></span>";
                            } else if (lotto == "VIEW") {
                                lotto = "<span class='FloatR orange-text' set-lan='text:" + lotto + "'></span>";
                            } else if (lotto == "EDIT") {
                                lotto = "<span class='FloatR green-text' set-lan='text:" + lotto + "'></span>";
                            }
                        }

                        var Zone = "";
                        var Zone2 = "";
                        if (Position == "COMPANY") {
                            Zone = "<b set-lan='text:Announcements'></b>" + announcement + "<br />" +
                                "<b set-lan='text:Mission'></b>" + mission + "<br />";
                            Zone2 = "<b set-lan='text:Red Envelope'></b>" + randomJackpot + "<br />";
                        }
                        else if (Position == "AGENT") {
                            Zone = "<b set-lan='text:Announcements'></b>" + announcement + "<br />";
                        }

                        htmlData += "<td><b set-lan='text:Dashboard'></b>" + dashboard + "<br />" +
                            "<b set-lan='text:Account'></b>" + account + "<br />" +
                            "<b set-lan='text:Management'></b>" + member + "<br />" +
                            "<b set-lan='text:Report'></b>" + report + "<br />" +
                            "<b set-lan='text:Payment'></b>" + payment + "<br />" +
                            Zone +
                            "<b set-lan='text:Announcements'></b>" + announcement + "<br />" +
                            "<b set-lan='text:Mission'></b>" + mission + "<br />" +
                            "<b set-lan='text:Stock Mngement'></b>" + stockManagement + "<br />" +
                            "<b set-lan='text:Online User'></b>" + userOnline + "<br />" +
                            "<b set-lan='text:Feedback'></b>" + feedback + "<br />" +
                            Zone2 +
                            "<b set-lan='text:Market'></b>" + market + "<br />" +
                            "<b set-lan='text:Notification'></b>" + notification + "<br />" +
                            "<b set-lan='text:Tournament'></b>" + tournament + "<br />" +
                            "<b set-lan='text:Daily Rewards'></b>" + dailyReward + "<br />" +
                            "<b set-lan='text:Marketing Tools'></b>" + marketingTools + "<br />" +
                            "<b set-lan='text:Lucky Draw'></b>" + lotto + "<br />" +
                            "</td>";

                        //permission
                        //if (obj.permissions.dashboard == "" || obj.permissions.dashboard == null) {
                        //    htmlData += "<td class='aligncenter'>-</td>";
                        //}
                        //else {
                        //    htmlData += "<td class='aligncenter'><label set-lan='text:" + obj.permissions.dashboard + "'></label></td>";
                        //}

                        //if (obj.permissions.account == "" || obj.permissions.account == null) {
                        //    htmlData += "<td class='aligncenter'>-</td>";
                        //}
                        //else {
                        //    htmlData += "<td class='aligncenter'><label set-lan='text:" + obj.permissions.account + "'></label></td>";
                        //}

                        //if (obj.permissions.member == "" || obj.permissions.member == null) {
                        //    htmlData += "<td class='aligncenter'>-</td>";
                        //}
                        //else {
                        //    htmlData += "<td class='aligncenter'><label set-lan='text:" + obj.permissions.member + "'></label></td>";
                        //}

                        //if (obj.permissions.report == "" || obj.permissions.report == null) {
                        //    htmlData += "<td class='aligncenter'>-</td>";
                        //}
                        //else {
                        //    htmlData += "<td class='aligncenter'><label set-lan='text:" + obj.permissions.report + "'></label></td>";
                        //}

                        //if (obj.permissions.payment == "" || obj.permissions.payment == null) {
                        //    htmlData += "<td class='aligncenter'>-</td>";
                        //}
                        //else {
                        //    htmlData += "<td class='aligncenter'><label set-lan='text:" + obj.permissions.payment + "'></label></td>";
                        //}

                        //if (obj.permissions.announcement == "" || obj.permissions.announcement == null) {
                        //    htmlData += "<td class='aligncenter'>-</td>";
                        //}
                        //else {
                        //    htmlData += "<td class='aligncenter'><label set-lan='text:" + obj.permissions.announcement + "'></label></td>";
                        //}

                        //if (obj.permissions.mission == "" || obj.permissions.mission == null) {
                        //    htmlData += "<td class='aligncenter'>-</td>";
                        //}
                        //else {
                        //    htmlData += "<td class='aligncenter'><label set-lan='text:" + obj.permissions.mission + "'></label></td>";
                        //}

                        //if (obj.permissions.stockManagement == "" || obj.permissions.stockManagement == null) {
                        //    htmlData += "<td class='aligncenter'>-</td>";
                        //}
                        //else {
                        //    htmlData += "<td class='aligncenter'><label set-lan='text:" + obj.permissions.stockManagement + "'></label></td>";
                        //}
                        //permission

                        if (obj.lastLoginIp == "" || obj.lastLoginIp == null) {
                            htmlData += "<td>-</td>";
                        } else {
                            htmlData += "<td><p class='overflow ellipsis' title='" + obj.lastLoginIp + "'>" + obj.lastLoginIp + "</p></td>";
                        }

                        if (obj.lastLoginTime == "" || obj.lastLoginTime == null) {
                            htmlData += "<td class='aligncenter'>-</td>";
                        } else {
                            htmlData += "<td class='aligncenter'>" + obj.lastLoginTime + "</td>";
                        }

                        htmlData += "</tr>";
                        no++;
                    }
                    $("#tbData > tbody").append(htmlData);
                }
                else {
                    $("#tbData > tbody").append("<tr><td colspan='13' style='text-align: center;' set-lan='text:No data.'></td></tr>");
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
