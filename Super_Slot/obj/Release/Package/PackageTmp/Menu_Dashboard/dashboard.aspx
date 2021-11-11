<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="dashboard.aspx.cs" Inherits="Super_Slot.Menu_Dashboard.dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .HeadFont {
            font-size: 2rem;
        }

        .borderTab {
            border-left: 2px solid #dee2e6 !important;
            border-bottom: 2px solid #dee2e6 !important;
            border-right: 2px solid #dee2e6 !important;
        }
    </style>

    <!-- Classic tabs -->
    <div class="classic-tabs">
        <ul class="nav tabs-cyan" id="myClassicTab" role="tablist" style="background-color: #46220e !important;">
            <li class="nav-item">
                <a class="nav-link  waves-light active show" id="tabOne-tab-classic" data-toggle="tab" href="#tabOne-classic"
                    role="tab" aria-controls="tabOne-classic" aria-selected="true" onclick="Click_Tab('1')" set-lan="text:Today"></a>
            </li>
            <li class="nav-item">
                <a class="nav-link waves-light" id="tabTwo-tab-classic" data-toggle="tab" href="#tabTwo-classic" role="tab"
                    aria-controls="tabTwo-classic" aria-selected="false" onclick="Click_Tab('2')" set-lan="text:Backward"></a>
            </li>
        </ul>
        <div class="tab-content border-right border-bottom border-left rounded-bottom borderTab" id="myClassicTabContent">
            <div class="tab-pane fade active show" id="tabOne-classic" role="tabpanel" aria-labelledby="tabOne-tab-classic">
                <div class="col-12" style="float: right;">
                    <div class="row" style="float: right;">
                        <a onclick="sync('1')"><i class="fas fa-sync" style="margin-top: 15%; color: #2f80ed;"></i>
                            <label id="countdown_Tab1" class="col-form-label" style="text-align: right;"></label>
                        </a>
                    </div>
                </div>
                <div class="row">
                    <div class="col-6">
                        <div class="card mb-4">
                            <div class="card-header" set-lan="text:Concurrent User/Peak"></div>
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-12 aligncenter"><span class="card-sub-value HeadFont" id="txtConcurrent"></span></div>
                                </div>
                                <div class="row">
                                    <div class="col-12 aligncenter"><span class="card-sub-title" id="time1"></span></div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-6">
                        <div class="card mb-4">
                            <div class="card-header" set-lan="text:Dash_Turnover"></div>
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-12 aligncenter"><span class="card-sub-value HeadFont" id="txtTurnover"></span></div>
                                </div>
                                <div class="row">
                                    <div class="col-12 aligncenter"><span class="card-sub-title" id="time2"></span></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-6">
                        <div class="card mb-4">
                            <div class="card-header" set-lan="text:Netwin"></div>
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-12 aligncenter"><span class="card-sub-value HeadFont" id="txtNetwin"></span></div>
                                </div>
                                <div class="row">
                                    <div class="col-12 aligncenter"><span class="card-sub-title" id="time3"></span></div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-6">
                        <div class="card mb-4">
                            <div class="card-header" set-lan="text:Cash Flow"></div>
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-12 aligncenter"><span class="card-sub-value HeadFont" id="txtCashFlow"></span></div>
                                </div>
                                <div class="row">
                                    <div class="col-12 aligncenter"><span class="card-sub-title" id="time16"></span></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-6">
                        <div class="card mb-4">
                            <div class="card-header" set-lan="text:CCU by Type"></div>
                            <div class="card-body">
                                <div class="row">
                                    <div id="Donut1" style="min-width: 400px; height: 400px; margin: 0 auto"></div>
                                </div>
                                <div class="row">
                                    <div class="col-12 aligncenter"><span class="card-sub-title" id="time4"></span></div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-6">
                        <div class="card mb-4">
                            <div class="card-header" set-lan="text:CCU by Provider"></div>
                            <div class="card-body">
                                <div class="row">
                                    <div id="Donut2" style="min-width: 400px; height: 400px; margin: 0 auto"></div>
                                </div>
                                <div class="row">
                                    <div class="col-12 aligncenter"><span class="card-sub-title" id="time5"></span></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-6">
                        <div class="card mb-4">
                            <div class="card-header" set-lan="text:CCU by Game"></div>
                            <div class="card-body">
                                <div class="row">
                                    <div id="Donut3" style="min-width: 400px; height: 400px; margin: 0 auto"></div>
                                </div>
                                <div class="row">
                                    <div class="col-12 aligncenter"><span class="card-sub-title" id="time13"></span></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-4">
                        <div class="card mb-4">
                            <div class="card-header" set-lan="text:Active User/New User"></div>
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-12 aligncenter"><span class="card-sub-value HeadFont" id="txtAcive_New_User"></span></div>
                                </div>
                                <div class="row">
                                    <div class="col-12 aligncenter"><span class="card-sub-title" id="txtAcive_New_User2">&nbsp;</span></div>
                                    <div class="col-12 aligncenter"><span class="card-sub-title" id="time6"></span></div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-5">
                        <div class="card mb-4">
                            <div class="card-header" set-lan="text:Dash_Deposit/Withdraw"></div>
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-12 aligncenter"><span class="card-sub-value HeadFont" id="txtDeposit_Withdraw"></span></div>
                                </div>
                                <div class="row">
                                    <div class="col-12 aligncenter"><span class="card-sub-title" id="txtDeposit_Withdraw2"></span></div>
                                    <div class="col-12 aligncenter"><span class="card-sub-title" id="time7"></span></div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-3">
                        <div class="card mb-4">
                            <div class="card-header" set-lan="text:First Top up"></div>
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-12 aligncenter"><span class="card-sub-value HeadFont" id="txtFirst"></span></div>
                                </div>
                                <div class="row">
                                    <div class="col-12 aligncenter"><span class="card-sub-title" id="txtFirst2"></span></div>
                                    <div class="col-12 aligncenter"><span class="card-sub-title" id="time8"></span></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-4">
                        <div class="card mb-4">
                            <div class="card-header" set-lan="text:Bonus/Rewards"></div>
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-12 aligncenter"><span class="card-sub-value HeadFont" id="txtBonus_Rewards"></span></div>
                                </div>
                                <div class="row">
                                    <div class="col-12 aligncenter"><span class="card-sub-title" id="txtBonus_Rewards2"></span></div>
                                    <div class="col-12 aligncenter"><span class="card-sub-title" id="time9"></span></div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-4">
                        <div class="card mb-4">
                            <div class="card-header"><span set-lan="text:Red Envelope"></span>/<span set-lan="text:Market"></span></div>
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-12 aligncenter"><span class="card-sub-value HeadFont" id="txtJackpot"></span></div>
                                </div>
                                <div class="row">
                                    <div class="col-12 aligncenter"><span class="card-sub-title" id="txtJackpot2"></span></div>
                                    <div class="col-12 aligncenter"><span class="card-sub-title" id="time10"></span></div>
                                </div>
                            </div>
                        </div>
                    </div>



                    <div class="col-4">
                        <div class="card mb-4">
                            <div class="card-header"><span set-lan="text:Tournament"></span>/<span set-lan="text:Daily Rewards"></span></div>
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-12 aligncenter"><span class="card-sub-value HeadFont" id="txtTournament"></span></div>
                                </div>
                                <div class="row">
                                    <div class="col-12 aligncenter"><span class="card-sub-title" id="txtTournament2"></span></div>
                                    <div class="col-12 aligncenter"><span class="card-sub-title" id="time17"></span></div>
                                </div>
                            </div>
                        </div>
                    </div>








                </div>
                <div class="row">
                    <div class="col-12">
                        <div class="card mb-4">
                            <div class="card-header" set-lan="text:Turnover Today"></div>
                            <div class="card-body">
                                <div class="row">
                                    <div id="container" style="width: 99%;"></div>
                                </div>
                                <div class="row">
                                    <div class="col-12 aligncenter"><span class="card-sub-title" id="time11"></span></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-12">
                        <div class="card mb-4">
                            <div class="card-header" set-lan="text:CCU Today"></div>
                            <div class="card-body">
                                <div class="row">
                                    <div id="container2" style="width: 99%;"></div>
                                </div>
                                <div class="row">
                                    <div class="col-12 aligncenter"><span class="card-sub-title" id="time12"></span></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="tab-pane fade" id="tabTwo-classic" role="tabpanel" aria-labelledby="tabTwo-tab-classic">
                <div class="col-12" style="float: right;">
                    <div class="row" style="float: right;">
                        <a onclick="sync('2')"><i class="fas fa-sync" style="margin-top: 15%; color: #2f80ed;"></i>
                            <label id="countdown_Tab2" class="col-form-label" style="text-align: right;"></label>
                        </a>
                    </div>
                </div>
                <div class="row">
                    <div class="col-12">
                        <div class="card mb-4">
                            <div class="card-header" set-lan="text:Turnover Monthly"></div>
                            <div class="card-body">
                                <div class="row">
                                    <div id="container4" style="width: 99%;"></div>
                                </div>
                                <div class="row">
                                    <div class="col-12 aligncenter"><span class="card-sub-title" id="time15"></span></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-12">
                        <div class="card mb-4">
                            <div class="card-header" set-lan="text:Netwin Monthly"></div>
                            <div class="card-body">
                                <div class="row">
                                    <div id="container3" style="width: 99%;"></div>
                                </div>
                                <div class="row">
                                    <div class="col-12 aligncenter"><span class="card-sub-title" id="time14"></span></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Classic tabs -->

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
                    <button type="button" class="btn btn-yellow font-weight-bold" data-dismiss="modal" aria-label="Close" set-lan="text:Close"></button>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainScript" runat="server">
    <script>
        var Status = 1;
        var First_UTC;
        var TO_Today = [];
        var TO_Yes = [];
        var CCU_Today = [];
        var CCU_Yes = [];
        var Monthly_Netwin = [];
        var Monthly_Turnover = [];
        var NOW = new Date();
        var NOW_UTC = Date.UTC(NOW.getUTCFullYear(), NOW.getUTCMonth(), NOW.getUTCDate());

        $(document).ready(function () {
            $("#menuDashboard , #menuDashboard > a").addClass("active");
            $("#menuDashboard > div").css("display", "block");

            if (Status == 1) {
                getDashboard_Tab1();
            } else if (Status == 2) {
                getDashboard_Tab2();
            }

            setInterval(function () {
                if (Status == 1) {
                    getDashboard_Tab1();
                } else if (Status == 2) {
                    getDashboard_Tab2();
                }
            }, 30 * 1000);
        });

        function Click_Tab(tab) {
            if (tab == 1) {
                getDashboard_Tab1();
            } else if (tab == 2) {
                getDashboard_Tab2();
            }
            Status = tab;
        }

        function sync(tab) {
            if (tab == 1) {
                getDashboard_Tab1();
            } else if (tab == 2) {
                getDashboard_Tab2();
            }
        }

        function matcher(regexp) {
            return function (obj) {
                var found = false;
                Object.keys(obj).forEach(function (key) {
                    if (!found) {
                        if ((typeof obj[key] == 'string') && regexp.exec(obj[key])) {
                            found = true;
                        }
                    }
                });
                return found;
            };
        }

        function getDonut1(re) {
            chart = new Highcharts.Chart({
                chart: {
                    renderTo: 'Donut1',
                    type: 'pie',
                },
                title: {
                    text: null
                },
                yAxis: {
                    title: {
                        text: 'Total percent market share'
                    }
                },
                plotOptions: {
                    pie: {
                        shadow: false
                    }
                },
                tooltip: {
                    formatter: function () {
                        //return '<b>' + this.point.name + '</b>: ' + this.y + ' %';
                        return '<b>' + this.point.name + '</b>: ' + this.y;
                    }
                },
                series: [{
                    name: null,
                    //data: [["Firefox", 70], ["MSIE", 40], ["Chrome", 30]],
                    data: re,
                    size: '80%',
                    innerSize: '50%',
                    showInLegend: true,
                    dataLabels: {
                        enabled: false
                    }
                }],
                credits: {
                    enabled: false
                },
                navigation: {
                    buttonOptions: {
                        enabled: false
                    }
                },
                legend: {
                    labelFormatter: function () {
                        return this.name + ': ' + (this.y ? this.y : 0)
                    }
                }
            });
        }

        function getDonut2(re2) {
            // Create the chart
            chart = new Highcharts.Chart({
                chart: {
                    renderTo: 'Donut2',
                    type: 'pie',
                },
                title: {
                    text: null
                },
                yAxis: {
                    title: {
                        text: 'Total percent market share'
                    }
                },
                plotOptions: {
                    pie: {
                        shadow: false
                    }
                },
                tooltip: {
                    formatter: function () {
                        //return '<b>' + this.point.name + '</b>: ' + this.y + ' %';
                        return '<b>' + this.point.name + '</b>: ' + this.y;
                    }
                },
                series: [{
                    name: null,
                    //data: [["Firefox", 70], ["MSIE", 40], ["Chrome", 30]],
                    data: re2,
                    size: '80%',
                    innerSize: '50%',
                    showInLegend: true,
                    dataLabels: {
                        enabled: false
                    }
                }],
                credits: {
                    enabled: false
                },
                navigation: {
                    buttonOptions: {
                        enabled: false
                    }
                },
                legend: {
                    labelFormatter: function () {
                        return this.name + ': ' + (this.y ? this.y : 0)
                    }
                }
            });
        }

        function getDonut3(re) {
            chart = new Highcharts.Chart({
                chart: {
                    renderTo: 'Donut3',
                    type: 'pie',
                },
                title: {
                    text: null
                },
                yAxis: {
                    title: {
                        text: 'Total percent market share'
                    }
                },
                plotOptions: {
                    pie: {
                        shadow: false
                    }
                },
                tooltip: {
                    formatter: function () {
                        //return '<b>' + this.point.name + '</b>: ' + this.y + ' %';
                        return '<b>' + this.point.name + '</b>: ' + this.y;
                    }
                },
                series: [{
                    name: null,
                    //data: [["Firefox", 70], ["MSIE", 40], ["Chrome", 30]],
                    data: re,
                    size: '80%',
                    innerSize: '50%',
                    showInLegend: true,
                    dataLabels: {
                        enabled: false
                    }
                }],
                credits: {
                    enabled: false
                },
                navigation: {
                    buttonOptions: {
                        enabled: false
                    }
                },
                legend: {
                    labelFormatter: function () {
                        return this.name + ': ' + (this.y ? this.y : 0)
                    }
                }
            });
        }

        function getGraph() {
            $.ajax({
                url: apiURL + '/apiRoute/dashBoardRouter/balanceInfo',
                type: 'GET',
                headers: {
                    "Authorization": localStorage.getItem("Token"),
                    "Content-Type": "application/json"
                },
                success: function (data) {
                    if (data.code == 0 || data.code == null) {
                        if (data.basicInfo != null) {
                            var txt1 = parseFloat(data.basicInfo.t.turnOver).toFixed(2);
                            var txt2 = parseFloat(data.basicInfo.t.validAmt).toFixed(2);
                            var txt3 = parseFloat(data.basicInfo.t.memberWinLose).toFixed(2);
                            var txt4 = parseFloat(data.basicInfo.t.winLose).toFixed(2);

                            var txt_1 = parseFloat(data.basicInfo.y.turnOver).toFixed(2);
                            var txt_2 = parseFloat(data.basicInfo.y.validAmt).toFixed(2);
                            var txt_3 = parseFloat(data.basicInfo.y.memberWinLose).toFixed(2);
                            var txt_4 = parseFloat(data.basicInfo.y.winLose).toFixed(2);

                            $('#txtTodayTurnOver').text(txt1.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,'));
                            $('#txtTodayValidAmount').text(txt2.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,'));
                            $('#txtTodayMemberWinLose').text(txt3.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,'));
                            $('#txtTodayWinLose').text(txt4.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,'));

                            $('#txtYesterdayTurnOver').text(txt_1.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,'));
                            $('#txtYesterdayValidAmount').text(txt_2.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,'));
                            $('#txtYesterdayMemberWinLose').text(txt_3.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,'));
                            $('#txtYesterdayWinLose').text(txt_4.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,'));

                            if (data.basicInfo.t.turnOver < 0) {
                                $('#txtTodayTurnOver').addClass('txtRed');
                            }
                            if (data.basicInfo.t.validAmt < 0) {
                                $('#txtTodayValidAmount').addClass('txtRed');
                            }
                            if (data.basicInfo.t.memberWinLose < 0) {
                                $('#txtTodayMemberWinLose').addClass('txtRed');
                            }
                            if (data.basicInfo.t.winLose < 0) {
                                $('#txtTodayWinLose').addClass('txtRed');
                            }
                            if (data.basicInfo.y.turnOver < 0) {
                                $('#txtYesterdayTurnOver').addClass('txtRed');
                            }
                            if (data.basicInfo.y.validAmt < 0) {
                                $('#txtYesterdayValidAmount').addClass('txtRed');
                            }
                            if (data.basicInfo.y.memberWinLose < 0) {
                                $('#txtYesterdayMemberWinLose').addClass('txtRed');
                            }
                            if (data.basicInfo.y.winLose < 0) {
                                $('#txtYesterdayWinLose').addClass('txtRed');
                            }
                        }

                        if (data.outStand != null) {
                            var txt1 = parseFloat(data.outStand.bets).toFixed(2);
                            var txt2 = parseFloat(data.outStand.balance).toFixed(2);

                            $('#txtTotalOutstandingBets').text(txt1.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,'));
                            $('#txtTotalOutstandingBalance').text(txt2.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,'));

                            if (data.outStand.bets < 0) {
                                $('#txtTotalOutstandingBets').addClass('txtRed');
                            }
                            if (data.outStand.balance.winLose < 0) {
                                $('#txtTotalOutstandingBalance').addClass('txtRed');
                            }
                        }

                        if (data.downLine != null) {
                            $('#txtDownlineMembers').text(data.downLine.member.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,'));
                            $('#txtDownlineAgents').text(data.downLine.agent.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,'));

                            if (data.downLine.member < 0) {
                                $('#txtDownlineMembers').addClass('txtRed');
                            }
                            if (data.downLine.agent < 0) {
                                $('#txtDownlineAgents').addClass('txtRed');
                            }
                        }

                        if (data.newMember != null) {
                            $('#txtNewMembersToday').text(data.newMember.today.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,'));
                            $('#txtNewMembersLastWeek').text(data.newMember.lastWeek.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,'));
                            $('#txtNewMembersLastMonth').text(data.newMember.lastMonth.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,'));

                            if (data.newMember.today < 0) {
                                $('#txtNewMembersToday').addClass('txtRed');
                            }
                            if (data.newMember.lastWeek < 0) {
                                $('#txtNewMembersLastWeek').addClass('txtRed');
                            }
                            if (data.newMember.lastMonth < 0) {
                                $('#txtNewMembersLastMonth').addClass('txtRed');
                            }
                        }
                    }
                    else {
                        document.getElementById('lbAlert').innerHTML = data.msg;
                        $('#modalAlert').modal('show');
                    }
                },
                error: function (xhr, status, error) {
                    document.getElementById('lbAlert').innerHTML = xhr.status + " | " + status;
                    $('#modalAlert').modal('show');
                }
            });

            var monthNames = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];
            var monthNamesTH = ["มกราคม", "กุมภาพันธ์", "มีนาคม", "เมษายน", "พฤษภาคม", "มิถุนายน", "กรกฎาคม", "สิงหาคม", "กันยายน", "ตุลาคม", "พฤศจิกายน", "ธันวาคม"];
            var monthNamesCH = ["一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月", "十二月"];

            var date = new Date();
            var txtMonth = "";

            if (localStorage.getItem("Language") == "English") {
                txtMonth = "in " + monthNames[date.getMonth()];
            }
            else if (localStorage.getItem("Language") == "Thai") {
                txtMonth = "เดือน " + monthNamesTH[date.getMonth()];
            }
            else if (localStorage.getItem("Language") == "Chinese") {
                txtMonth = "在 " + monthNamesCH[date.getMonth()];
            }

            var txtYear = date.getFullYear();
            var firstDay = new Date(date.getFullYear(), date.getMonth(), 1);
            var lastDay = new Date(date.getFullYear(), date.getMonth() + 1, 0);
            var daysOfMonth = [];

            var jsData = {};
            var arr = []
            jsData.arr = arr;

            var jsData2 = {};
            var arr2 = []
            jsData2.arr2 = arr2;

            for (var d = firstDay; d <= lastDay; d.setDate(d.getDate() + 1)) {
                var data = {
                    "_id": d.getDate(),
                    "winLose": 0,
                    "validAmt": 0,
                    "count": 0
                }
                jsData.arr.push(data);

                var data2 = {
                    "_id": d.getDate(),
                    "count": 0
                }
                jsData2.arr2.push(data2);

                daysOfMonth.push(d.getDate());
            }

            var arr1 = [];
            var arr2 = [];
            var arr3 = [];
            var arr_1 = [];
            $.ajax({
                url: apiURL + '/apiRoute/dashBoardRouter/balanceInfo/grap',
                type: 'GET',
                headers: {
                    "Authorization": localStorage.getItem("Token"),
                    "Content-Type": "application/json"
                },
                success: function (data) {
                    if (data.code == 0 || data.code == null) {
                        var headGraph = "";
                        var headGraph2 = "";
                        var date = "";
                        var title = "";
                        var txt1 = "";
                        var txt2 = "";
                        var txt3 = "";
                        var txt4 = "";

                        if (localStorage.getItem("Language") == "English") {
                            headGraph = "Balance info";
                            title = "Value: {point.y:,.0f}";
                            txt1 = "Win Lose";
                            txt2 = "Valid Turn Over";
                            txt3 = "Ticket";
                            headGraph2 = "New Members";
                            txt4 = "Member";
                        }
                        else if (localStorage.getItem("Language") == "Thai") {
                            headGraph = "ข้อมูลยอดคงเหลือ";
                            title = "มูลค่า: {point.y:,.0f}";
                            txt1 = "แพ้ชนะ";
                            txt2 = "ยอดเล่นจริง";
                            txt3 = "ตั๋ว";
                            headGraph2 = "สมาชิกใหม่";
                            txt4 = "สมาชิก";
                        }
                        else if (localStorage.getItem("Language") == "Chinese") {
                            headGraph = "余额信息";
                            title = "Value: {point.y:,.0f}";
                            txt1 = "赢输";
                            txt2 = "下注金额";
                            txt3 = "下注单";
                            headGraph2 = "新会员";
                            txt4 = "会员";
                        }

                        var obj = data.turn;
                        for (var i = 0; i < jsData.arr.length; i++) {
                            for (var x = 0; x < obj.length; x++) {
                                var objTxt = obj[x];
                                if (jsData.arr[i]._id == objTxt._id) {
                                    jsData.arr[i].winLose = objTxt.winLose;
                                    jsData.arr[i].validAmt = objTxt.validAmt;
                                    jsData.arr[i].count = objTxt.count;
                                }
                            }

                            arr1.push(jsData.arr[i].winLose);
                            arr2.push(jsData.arr[i].validAmt);
                            arr3.push(jsData.arr[i].count);
                        }

                        var obj2 = data.member;
                        for (var j = 0; j < jsData2.arr2.length; j++) {
                            for (var y = 0; y < obj2.length; y++) {
                                var objTxt2 = obj2[y];
                                if (jsData2.arr2[j]._id == objTxt2._id) {
                                    jsData2.arr2[j].count = objTxt2.count;
                                }
                            }

                            arr_1.push(jsData2.arr2[j].count);
                        }

                        Highcharts.setOptions({
                            lang: {
                                thousandsSep: ','
                            }
                        });

                        Highcharts.chart('container', {
                            title: {
                                text: headGraph
                            },
                            exporting: {
                                enabled: false
                            },
                            subtitle: {
                                text: txtMonth + "," + txtYear
                            },
                            yAxis: {
                                title: {
                                    enabled: false
                                }
                            },
                            credits: {
                                enabled: false
                            },
                            legend: {
                                layout: 'horizontal',
                                align: 'center',
                                verticalAlign: 'top'
                            },
                            plotOptions: {
                                series: {
                                    pointStart: 1
                                }
                            },
                            tooltip: {
                                headerFormat: '',
                                pointFormat: title
                            },
                            series: [{
                                name: txt1,
                                data: arr1,
                                color: '#CFA137'
                            }, {
                                name: txt2,
                                data: arr2,
                                color: '#5fa76f'
                            }, {
                                name: txt3,
                                data: arr3,
                                color: '#d14c58'
                            }]
                        });

                        Highcharts.chart('container2', {
                            title: {
                                text: headGraph2
                            },
                            exporting: {
                                enabled: false
                            },
                            subtitle: {
                                text: txtMonth + "," + txtYear
                            },
                            yAxis: {
                                title: {
                                    enabled: false
                                }
                            },
                            credits: {
                                enabled: false
                            },
                            legend: {
                                layout: 'horizontal',
                                align: 'center',
                                verticalAlign: 'top'
                            },
                            plotOptions: {
                                series: {
                                    pointStart: 1
                                }
                            },
                            tooltip: {
                                headerFormat: '',
                                pointFormat: title
                            },
                            series: [{
                                name: txt4,
                                data: arr_1,
                                color: '#CFA137'
                            }]
                        });
                    }
                    else {
                        document.getElementById('lbAlert').innerHTML = data.msg;
                        $('#modalAlert').modal('show');
                    }
                },
                error: function (xhr, status, error) {
                    document.getElementById('lbAlert').innerHTML = xhr.status + " | " + status;
                    $('#modalAlert').modal('show');
                }
            });

            $("#myModalLoad").modal('hide');
        }

        function getGraph1() {
            var arrToday = TO_Today;
            var arrYes = TO_Yes;
            $(function () {
                $('#container').highcharts({
                    chart: {
                        zoomType: 'x'
                    },
                    title: {
                        text: null
                    },
                    credits: {
                        enabled: false
                    },
                    navigation: {
                        buttonOptions: {
                            enabled: false
                        }
                    },
                    yAxis: {
                        title: {
                            text: null
                        }
                    },
                    xAxis: {
                        type: 'datetime',
                        tickInterval: 3600 * 1000,
                        labels: {
                            format: '{value:%H:%M}',
                        }
                        //min: Date.UTC(2020, 5, 24),
                        //max: Date.UTC(2020, 5, 25)
                    },
                    series: [
                        {
                            name: 'Today',
                            data: arrToday,
                            color: '#ffac0a',
                            pointStart: NOW_UTC,
                            pointInterval: 24 * 3600 * 1000 // one day
                        },
                        {
                            name: 'Yesterday',
                            data: arrYes,
                            color: '#b3b3bf',
                            pointStart: NOW_UTC,
                            pointInterval: 24 * 3600 * 1000 // one day
                        }
                    ]
                });
            });
        }

        function getGraph2() {
            var arrToday = CCU_Today;
            var arrYes = CCU_Yes;

            $(function () {
                $('#container2').highcharts({
                    chart: {
                        zoomType: 'x'
                    },
                    title: {
                        text: null
                    },
                    credits: {
                        enabled: false
                    },
                    navigation: {
                        buttonOptions: {
                            enabled: false
                        }
                    },
                    yAxis: {
                        title: {
                            text: null
                        }
                    },
                    xAxis: {
                        type: 'datetime',
                        tickInterval: 3600 * 1000,
                        labels: {
                            format: '{value:%H:%M}',
                        }
                        //min: Date.UTC(2020, 5, 23),
                        //max: Date.UTC(2020, 5, 24)
                    },
                    series: [
                        {
                            name: 'Today',
                            data: arrToday,
                            color: '#ffac0a',
                            pointStart: NOW_UTC,
                            pointInterval: 24 * 3600 * 1000 // one day
                        },
                        {
                            name: 'Yesterday',
                            data: arrYes,
                            color: '#b3b3bf',
                            pointStart: NOW_UTC,
                            pointInterval: 24 * 3600 * 1000 // one day
                        }
                    ]
                });
            });
        }

        function getGraph3() {
            var arrMonthlyNetWin = Monthly_Netwin;
            $(function () {
                $('#container3').highcharts({
                    chart: {
                        zoomType: 'x'
                    },
                    title: {
                        text: null
                    },
                    credits: {
                        enabled: false
                    },
                    navigation: {
                        buttonOptions: {
                            enabled: false
                        }
                    },
                    yAxis: {
                        title: {
                            text: null
                        }
                    },
                    xAxis: {
                        type: 'datetime',
                        tickInterval: 24 * 3600 * 1000,
                        labels: {
                            format: '{value:%Y-%m-%d}',
                        }
                    },
                    series: [{
                        name: 'Monthly Netwin',
                        data: arrMonthlyNetWin,
                        color: '#ffac0a',
                        pointStart: First_UTC,
                        pointInterval: 24 * 36e5
                    }]
                });
            });
        }

        function getGraph4() {
            var arrMonthly_Turnover = Monthly_Turnover;
            $(function () {
                $('#container4').highcharts({
                    chart: {
                        zoomType: 'x'
                    },
                    title: {
                        text: null
                    },
                    credits: {
                        enabled: false
                    },
                    navigation: {
                        buttonOptions: {
                            enabled: false
                        }
                    },
                    yAxis: {
                        title: {
                            text: null
                        }
                    },
                    xAxis: {
                        type: 'datetime',
                        tickInterval: 24 * 3600 * 1000,
                        labels: {
                            format: '{value:%Y-%m-%d}',
                        }
                    },
                    series: [{
                        name: 'Monthly Turnover',
                        data: arrMonthly_Turnover,
                        color: '#ffac0a',
                        pointStart: First_UTC,
                        pointInterval: 24 * 36e5
                    }]
                });
            });
        }

        const fetchData = (url = "", method = "GET", credentials = "include", body = {}) => {
            if (method == "GET") {
                return fetch(url, {
                    method,
                    headers: { 'Content-Type': 'application/json' },
                    credentials,
                })
            }
            return fetch(url, {
                method,
                headers: { 'Content-Type': 'application/json' },
                credentials,
                body: JSON.stringify(body) // body data type must match "Content-Type" header
            })
        }

        const getDashboard_Tab1 = async () => {
            const requestAwait = await fetchData(`${apiURL}/v1/report/dashboard`, 'GET', "include", {})
            const response = await requestAwait.json()
            if (response.messageCode == 0000 || response.messageCode == null) {
                document.getElementById("txtConcurrent").innerHTML = response.data.concurrent.ccu.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "/" + response.data.concurrent.pcu.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,');
                document.getElementById("txtTurnover").innerHTML = response.data.turnover.amount.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,');
                document.getElementById("txtNetwin").innerHTML = response.data.netWin.amount.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,');
                document.getElementById("txtAcive_New_User").innerHTML = response.data.user.activeUser.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "/" + response.data.user.newUser.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,');
                document.getElementById("txtDeposit_Withdraw").innerHTML = response.data.depositWithdraw.deposit.amount.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "/" + response.data.depositWithdraw.withdraw.amount.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,');
                document.getElementById("txtDeposit_Withdraw2").innerHTML = "Inculding " + response.data.depositWithdraw.deposit.transaction.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "/" + response.data.depositWithdraw.withdraw.transaction.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + " transactions.";
                document.getElementById("txtFirst").innerHTML = response.data.firstTopUp.amount.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,');
                document.getElementById("txtFirst2").innerHTML = "Including " + response.data.firstTopUp.transaction.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + " transactions.";
                document.getElementById("txtBonus_Rewards").innerHTML = response.data.bonusRewards.bonus.amount.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "/" + response.data.bonusRewards.rewards.amount.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,');
                document.getElementById("txtBonus_Rewards2").innerHTML = "Including " + response.data.bonusRewards.bonus.transaction.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "/" + response.data.bonusRewards.rewards.transaction.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + " transactions.";
                document.getElementById("txtJackpot").innerHTML = response.data.jackpotMarket.jackpot.amount.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "/" + response.data.jackpotMarket.market.amount.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,');
                document.getElementById("txtJackpot2").innerHTML = "Including " + response.data.jackpotMarket.jackpot.transaction.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "/" + response.data.jackpotMarket.market.transaction.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + " transactions.";
                document.getElementById("txtTournament").innerHTML = response.data.jackpotMarket.tournament.amount.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "/" + response.data.jackpotMarket.dailyReward.amount.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,');
                document.getElementById("txtTournament2").innerHTML = "Including " + response.data.jackpotMarket.tournament.transaction.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "/" + response.data.jackpotMarket.dailyReward.transaction.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + " transactions.";
                document.getElementById("txtCashFlow").innerHTML = response.data.cashFlow.amount.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,');

                document.getElementById("time1").innerHTML = response.data.user.updateTime;
                document.getElementById("time2").innerHTML = response.data.turnover.updateTime;
                document.getElementById("time3").innerHTML = response.data.netWin.updateTime;
                document.getElementById("time4").innerHTML = response.data.concurrent.updateTime;
                document.getElementById("time5").innerHTML = response.data.concurrent.updateTime;
                document.getElementById("time6").innerHTML = response.data.user.updateTime;
                document.getElementById("time7").innerHTML = response.data.depositWithdraw.updateTime;
                document.getElementById("time8").innerHTML = response.data.firstTopUp.updateTime;
                document.getElementById("time9").innerHTML = response.data.bonusRewards.updateTime;
                document.getElementById("time10").innerHTML = response.data.jackpotMarket.updateTime;
                document.getElementById("time11").innerHTML = response.data.chartTurnover.updateTime;
                document.getElementById("time12").innerHTML = response.data.concurrent.updateTime;
                document.getElementById("time13").innerHTML = response.data.concurrent.updateTime;
                document.getElementById("time16").innerHTML = response.data.cashFlow.updateTime;
                document.getElementById("time17").innerHTML = response.data.jackpotMarket.updateTime;

                var obj0 = response.data.concurrent.gameType;
                var result = Object.values(obj0).map(function (key) {
                    return [key.name, key.count];
                });

                var obj1 = response.data.concurrent.provider;
                //var result2 = Object.keys(obj1).map(function (key) {
                var result2 = Object.values(obj1).map(function (key) {
                    //return [String(key), obj1[key]];
                    return [key.name, key.count];
                });

                var obj3 = response.data.concurrent.game;
                var result3 = Object.values(obj3).map(function (key) {
                    return [key.name, key.count];
                });

                getDonut1(result);
                getDonut2(result2);
                getDonut3(result3);

                var obj4 = response.data.chartTurnover.today;
                TO_Today = Object.keys(obj4).map(function (key) {
                    var aa = key;
                    var BB1 = aa.split(' ')[0];
                    var BB2 = aa.split(' ')[1];
                    var CC1 = BB1.split('-');
                    var CC2 = BB2.split(':');
                    var d = Date.UTC(CC1[0], parseInt(CC1[1] - 1), CC1[2], CC2[0], CC2[1], CC2[2]);
                    return [Number(d), obj4[key]];
                });

                var obj5 = response.data.chartTurnover.yesterday;
                TO_Yes = Object.keys(obj5).map(function (key) {
                    var aa = key;
                    var BB1 = aa.split(' ')[0];
                    var BB2 = aa.split(' ')[1];
                    var CC1 = BB1.split('-');
                    var CC2 = BB2.split(':');
                    CC1[2] = parseInt(CC1[2]) + 1;
                    var d = Date.UTC(CC1[0], parseInt(CC1[1] - 1), CC1[2], CC2[0], CC2[1], CC2[2]);
                    return [Number(d), obj5[key]];
                });

                var obj6 = response.data.concurrent.chartCCU.today;
                CCU_Today = Object.keys(obj6).map(function (key) {
                    var aa = key;
                    var BB1 = aa.split(' ')[0];
                    var BB2 = aa.split(' ')[1];
                    var CC1 = BB1.split('-');
                    var CC2 = BB2.split(':');
                    var d = Date.UTC(CC1[0], parseInt(CC1[1] - 1), CC1[2], CC2[0], CC2[1], CC2[2]);
                    return [Number(d), obj6[key]];
                });

                var obj7 = response.data.concurrent.chartCCU.yesterday;
                CCU_Yes = Object.keys(obj7).map(function (key) {
                    var aa = key;
                    var BB1 = aa.split(' ')[0];
                    var BB2 = aa.split(' ')[1];
                    var CC1 = BB1.split('-');
                    var CC2 = BB2.split(':');
                    CC1[2] = parseInt(CC1[2]) + 1;
                    var d = Date.UTC(CC1[0], parseInt(CC1[1] - 1), CC1[2], CC2[0], CC2[1], CC2[2]);
                    return [Number(d), obj7[key]];
                });

                getGraph1();
                getGraph2();
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

        const getDashboard_Tab2 = async () => {
            const requestAwait = await fetchData(`${apiURL}/v1/report/dashboard_monthly`, 'GET', "include", {})
            const response = await requestAwait.json()

            if (response.messageCode == 0000 || response.messageCode == null) {
                var arrMN = [];
                var obj8 = response.data.monthly.netWin;
                Monthly_Netwin = Object.keys(obj8).map(function (key) {
                    arrMN.push(obj8[key]);
                });
                Monthly_Netwin = arrMN;

                var arrMT = [];
                var obj9 = response.data.monthly.turnover;
                Monthly_Turnover = Object.keys(obj9).map(function (key) {
                    arrMT.push(obj9[key]);
                });
                Monthly_Turnover = arrMT;

                First_UTC = new Date(response.data.monthly.firstDate);
                First_UTC = Date.UTC(First_UTC.getUTCFullYear(), First_UTC.getUTCMonth(), First_UTC.getUTCDate());

                getGraph3();
                getGraph4();
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
