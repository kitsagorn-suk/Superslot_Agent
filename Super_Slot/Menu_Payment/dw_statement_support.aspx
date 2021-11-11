<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="dw_statement_support.aspx.cs" Inherits="Pretty_Gaming.Menu_Payment.dw_statement_support" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .btn-toolbar .select-wrapper {
            max-width: 200px !important;
        }

        .modalScroll {
            overflow-y: auto !important;
        }
    </style>
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="" set-lan="text:Payment"></a></li>
            <li class="breadcrumb-item active txtMem" set-lan="text:Deposit / Withdrawal Statement"></li>
        </ol>
    </nav>
    <div class="row">
        <div class="col-md-8">
            <h1 set-lan="text:Deposit / Withdrawal Statement"></h1>
        </div>
    </div>
    <div class="btn-toolbar section-group" role="toolbar" style="padding-bottom: 0px !important;">
        <div class="col-md-12 row">
            <div class="form-group row" style="padding-left: 1rem;">
                <label for="email" class="col-form-label" set-lan="text:Username_"></label>
                <div style="padding-left: 1rem;">
                    <input type="text" class="form-control" id="searchLoginname" onkeypress="Key_Enter(event)">
                </div>
            </div>
        </div>
        <div class="col-md-12 row">
            <div class="form-group row" style="padding-left: 1.1rem;">
                <label for="email" class="col-form-label" set-lan="text:Start date_"></label>
                <div style="padding-left: 1rem;">
                    <input type="date" class="form-control" style="width: 150px;" id="startdate" onkeypress="Key_Enter(event)" />
                </div>
                <div style="padding-left: 0.7rem;">
                    <input type="time" class="form-control" id="starttime" onkeypress="Key_Enter(event)" />
                </div>
            </div>
            <div class="form-group row" style="padding-left: 2.5rem;">
                <label for="email" class="col-form-label" set-lan="text:To date_"></label>
                <div style="padding-left: 1rem;">
                    <input type="date" class="form-control" style="width: 150px;" id="todate" onkeypress="Key_Enter(event)" />
                </div>
                <div style="padding-left: 0.7rem;">
                    <input type="time" class="form-control" id="totime" onkeypress="Key_Enter(event)" />
                </div>
            </div>
            <div class="form-group row" style="padding-left: 2rem;">
                <button class="btn btn-yellow font-weight-bold m-0 px-3 py-2 z-depth-0 waves-effect btnMenu" type="button" set-lan="text:Search" onclick="Search_Click()"></button>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-8">
            <div class="btn-toolbar mb-3" role="toolbar" style="margin-top: 1rem;">
                <div class="btn-group mr-auto">
                    <div class="btn-group btn-group-green mr-3" data-toggle="buttons">
                        <label class="btn btn-white border border-success z-depth-0 form-check-label" onclick="btnTimePN('Previous');">
                            <input class="form-check-input" type="radio" name="options" id="option1" autocomplete="off" checked>
                            <span set-lan="text:Previous"></span>
                        </label>
                        <label class="btn btn-white border border-success z-depth-0 form-check-label active" onclick="btnTime('Today');">
                            <input class="form-check-input" type="radio" name="options" id="option2" autocomplete="off" checked>
                            <span set-lan="text:Today"></span>
                        </label>
                        <label class="btn btn-white border border-success z-depth-0 form-check-label" onclick="btnTime('Yesterday');">
                            <input class="form-check-input" type="radio" name="options" id="option3" autocomplete="off">
                            <span set-lan="text:Yesterday"></span>
                        </label>
                        <label class="btn btn-white border border-success z-depth-0 form-check-label" onclick="btnTime('This week');">
                            <input class="form-check-input" type="radio" name="options" id="option4" autocomplete="off">
                            <span set-lan="text:This week"></span>
                        </label>
                        <label class="btn btn-white border border-success z-depth-0 form-check-label" onclick="btnTime('Last week');">
                            <input class="form-check-input" type="radio" name="options" id="option5" autocomplete="off">
                            <span set-lan="text:Last week"></span>
                        </label>
                        <label class="btn btn-white border border-success z-depth-0 form-check-label" onclick="btnTime('This month');">
                            <input class="form-check-input" type="radio" name="options" id="option6" autocomplete="off">
                            <span set-lan="text:This month"></span>
                        </label>
                        <label class="btn btn-white border border-success z-depth-0 form-check-label" onclick="btnTime('Last month');">
                            <input class="form-check-input" type="radio" name="options" id="option7" autocomplete="off">
                            <span set-lan="text:Last month"></span>
                        </label>
                        <label class="btn btn-white border border-success z-depth-0 form-check-label" onclick="btnTimePN('Next');">
                            <input class="form-check-input" type="radio" name="options" id="option8" autocomplete="off" checked>
                            <span set-lan="text:Next"></span>
                        </label>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div id="zonePlsSearch" class="btn-toolbar section-group" role="toolbar" style="margin-top: 1rem; padding-top: 2rem; font-weight: bold; background-color: #dee2e6;">
        <p class="col-12" style="text-align: center; color: #333;" set-lan="text:Please enter search."></p>
    </div>
    <div class="table-wrapper" style="margin-top: 10px; margin-bottom: 10px;">
        <table class="table table-border" id="tbData" style="display: none;">
            <thead class="rgba-green-slight">
                <tr>
                    <th style="width: 3%;" set-lan="text:No"></th>
                    <th style="width: 7%; text-align: left; padding-left: 5px;" set-lan="text:Username"></th>
                    <th style="width: 7%;" set-lan="text:Level"></th>
                    <th style="width: 5%;" set-lan="text:Currency"></th>
                    <th style="width: 7%; text-align: right; padding-right: 5px;" set-lan="text:Total Deposit"></th>
                    <th style="width: 7%; text-align: right; padding-right: 5px;" set-lan="text:Total Withdrawal"></th>
                    <th style="width: 7%; text-align: right; padding-right: 5px;" set-lan="text:Balance"></th>
                    <th style="width: 8%;" set-lan="text:Detail"></th>
                </tr>
            </thead>
            <tbody>
                <td colspan="8" class="aligncenter" set-lan="text:No data."></td>
            </tbody>
            <tfoot class="rgba-yellow-slight">
                <tr class="total">
                    <td></td>
                    <td></td>
                    <td></td>
                    <td set-lan="text:Total"></td>
                    <td id="totalDeposit">-</td>
                    <td id="totalWithdrawal">-</td>
                    <td id="totalBalance">-</td>
                    <td></td>
                </tr>
            </tfoot>
        </table>
    </div>

    <%--Modal--%>
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
                    <div id="wrapper2" style="float: right; margin-top: .5rem;">
                        <section>
                            <div class="data-container"></div>
                            <div id="pagination-demo22"></div>
                        </section>
                    </div>
                    <table class="table table-border" id="tbData2">
                        <thead class="rgba-green-slight">
                            <tr>
                                <th set-lan="text:No"></th>
                                <th set-lan="text:Username"></th>
                                <th set-lan="text:Currency"></th>
                                <th set-lan="text:Action"></th>
                                <th set-lan="text:Amount"></th>
                                <th set-lan="text:Date"></th>
                            </tr>
                        </thead>
                        <tbody></tbody>
                        <tfoot class="rgba-yellow-slight">
                            <tr class="total">
                                <td></td>
                                <td></td>
                                <td></td>
                                <td set-lan="text:Total"></td>
                                <td id="totalDetail">-</td>
                                <td></td>
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
    <%--modal--%>
    <div class="modal fade modalScroll" id="modalGetCurrency" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header text-center">
                    <h4 class="modal-title w-100 font-weight-bold" set-lan="text:Currency"></h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body mx-3">
                    <div class="form-group row mr-4" style="margin-bottom: 0px !important;">
                        <label for="email" class="col-4 col-form-label alignright" set-lan="text:Account-"></label>
                        <label id="txtName" class="col-8 col-form-label"></label>
                    </div>
                    <div class="form-group row mr-4" style="margin-bottom: 0px !important;">
                        <label for="email" class="col-4 col-form-label alignright" set-lan="text:Currency_"></label>
                        <label id="txtCurrency" class="col-8 col-form-label"></label>
                    </div>
                </div>
                <div class="modal-footer d-flex justify-content-center">
                    <button type="button" class="btn btn-yellow font-weight-bold" data-dismiss="modal" aria-label="Close" set-lan="text:Close"></button>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade modalScroll" id="modalAlert" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
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
    <script src="../js/pagination.js"></script>
    <script type="text/javascript">
        var typeTime = "Day";
        var NumPage2 = 0;
        var TotalData2;

        $(document).ready(function () {
            $("#menuPaymentSup , #menuPaymentSup > a").addClass("active");
            $("#menuPaymentSup > div").css("display", "block");

            var date = new Date();
            var dateSetSTART = date.getFullYear() + "-" + ("0" + (date.getMonth() + 1)).slice(-2) + "-" + ("0" + date.getDate()).slice(-2);
            date.setDate(date.getDate() + 1);
            var dateSetEND = date.getFullYear() + "-" + ("0" + (date.getMonth() + 1)).slice(-2) + "-" + ("0" + date.getDate()).slice(-2);
            $("#startdate").val(dateSetSTART);
            $("#todate").val(dateSetEND);
            $("#starttime").val('00:00');
            $("#totime").val('00:00');

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
        });

        function Key_Enter(event) {
            var x = event.which || event.keyCode;
            if (x == 13) {
                Check_Enter = "Enter";
                event.preventDefault()
                Search_Click();
            }
        }

        function capitalizeFirstLetter(string) {
            return string.charAt(0).toUpperCase() + string.slice(1);
        }

        function btnTime(type) {
            var start = "";
            var end = "";
            var date = new Date();

            if (type == "Today") {
                var date2 = new Date(date);
                date2.setDate(date2.getDate() + 1);
                var endDate = ("0" + date2.getDate()).slice(-2) + "/" + ("0" + (date2.getMonth() + 1)).slice(-2) + "/" + date2.getFullYear();
                date = ("0" + date.getDate()).slice(-2) + "/" + ("0" + (date.getMonth() + 1)).slice(-2) + "/" + date.getFullYear();

                $("#startdate").val(GetFormattedDate(date));
                $("#todate").val(GetFormattedDate(endDate));
                start = GetFormattedDate(date);
                end = GetFormattedDate(endDate);

                typeTime = "Day";
            }
            else if (type == "Yesterday") {
                var todayTimeStamp = +new Date;
                var oneDayTimeStamp = 1000 * 60 * 60 * 24;
                var diff = todayTimeStamp - oneDayTimeStamp;
                var yesterdayDate = new Date(diff);
                var yesterdayString = ("0" + yesterdayDate.getDate()).slice(-2) + "/" + ("0" + (yesterdayDate.getMonth() + 1)).slice(-2) + "/" + yesterdayDate.getFullYear();

                var date2 = new Date(yesterdayDate);
                date2.setDate(date2.getDate() + 1);
                var endDate = ("0" + date2.getDate()).slice(-2) + "/" + ("0" + (date2.getMonth() + 1)).slice(-2) + "/" + date2.getFullYear();

                $("#startdate").val(GetFormattedDate(yesterdayString));
                $("#todate").val(GetFormattedDate(endDate));
                start = GetFormattedDate(yesterdayString);
                end = GetFormattedDate(endDate);

                typeTime = "Day";
            }
            else if (type == "This week") {
                var GetDay = date.getDay();
                var firstday, SetDay;

                if (GetDay == 2) {
                    firstday = date.getDate();
                } else if (GetDay > 2) {
                    SetDay = date.getDay() - 2;
                    firstday = date.getDate() - SetDay;
                } else if (GetDay < 2) {
                    if (GetDay == 0) {
                        SetDay = 5 - GetDay;
                        firstday = date.getDate() - SetDay;
                    } else if (GetDay == 1) {
                        SetDay = 7 - GetDay;
                        firstday = date.getDate() - SetDay;
                    }
                }

                var lastday = firstday + 6;
                var date1 = new Date(date.setDate(firstday));
                var date2 = new Date(date.setDate(lastday));

                if (date1 > date2) {
                    date2.setMonth(date2.getMonth() + 1);
                }
                var startDate = ("0" + date1.getDate()).slice(-2) + "/" + ("0" + (date1.getMonth() + 1)).slice(-2) + "/" + date1.getFullYear();
                date2.setDate(date2.getDate() + 1);
                var endDate = ("0" + date2.getDate()).slice(-2) + "/" + ("0" + (date2.getMonth() + 1)).slice(-2) + "/" + date2.getFullYear();
                $("#startdate").val(GetFormattedDate(startDate));
                $("#todate").val(GetFormattedDate(endDate));
                start = GetFormattedDate(startDate);
                end = GetFormattedDate(endDate);

                typeTime = "Week";
            }
            else if (type == "Last week") {
                var GetDay = date.getDay();
                var firstday, SetDay;

                if (GetDay == 2) {
                    firstday = date.getDate() - 7;
                } else if (GetDay > 2) {
                    SetDay = date.getDay() - 2;
                    firstday = (date.getDate() - SetDay) - 7;
                } else if (GetDay < 2) {
                    if (GetDay == 0) {
                        SetDay = 5 - GetDay;
                        firstday = (date.getDate() - SetDay) - 7;
                    } else if (GetDay == 1) {
                        SetDay = 7 - GetDay;
                        firstday = (date.getDate() - SetDay) - 7;
                    }
                }

                var date1 = new Date(date.setDate(firstday));
                var lastday = date1.getDate() + 6;
                var date2 = new Date(date.setDate(lastday));

                if (date1 > date2) {
                    date2.setMonth(date2.getMonth() + 1);
                }
                var startDate = ("0" + date1.getDate()).slice(-2) + "/" + ("0" + (date1.getMonth() + 1)).slice(-2) + "/" + date1.getFullYear();
                date2.setDate(date2.getDate() + 1);
                var endDate = ("0" + date2.getDate()).slice(-2) + "/" + ("0" + (date2.getMonth() + 1)).slice(-2) + "/" + date2.getFullYear();
                $("#startdate").val(GetFormattedDate(startDate));
                $("#todate").val(GetFormattedDate(endDate));
                start = GetFormattedDate(startDate);
                end = GetFormattedDate(endDate);

                typeTime = "Week";
            }
            else if (type == "This month") {
                var date1 = new Date(date.getFullYear(), date.getMonth(), 1);
                var date2 = new Date(date.getFullYear(), date.getMonth() + 1, 0);
                var startDate = ("0" + date1.getDate()).slice(-2) + "/" + ("0" + (date1.getMonth() + 1)).slice(-2) + "/" + date1.getFullYear();
                date2.setDate(date2.getDate() + 1);
                var endDate = ("0" + date2.getDate()).slice(-2) + "/" + ("0" + (date2.getMonth() + 1)).slice(-2) + "/" + date2.getFullYear();

                $("#startdate").val(GetFormattedDate(startDate));
                $("#todate").val(GetFormattedDate(endDate));
                start = GetFormattedDate(startDate);
                end = GetFormattedDate(endDate);

                typeTime = "Month";
            }
            else if (type == "Last month") {
                var date1 = new Date(date.getFullYear(), date.getMonth() - 1, 1);
                var date2 = new Date(date.getFullYear(), date.getMonth(), 0);
                var startDate = ("0" + date1.getDate()).slice(-2) + "/" + ("0" + (date1.getMonth() + 1)).slice(-2) + "/" + date1.getFullYear();
                date2.setDate(date2.getDate() + 1);
                var endDate = ("0" + date2.getDate()).slice(-2) + "/" + ("0" + (date2.getMonth() + 1)).slice(-2) + "/" + date2.getFullYear();

                $("#startdate").val(GetFormattedDate(startDate));
                $("#todate").val(GetFormattedDate(endDate));
                start = GetFormattedDate(startDate);
                end = GetFormattedDate(endDate);

                typeTime = "Month";
            }

            var Time_S = $("#starttime").val() + ":00";
            var Time_E = $("#totime").val() + ":00";

            Search_Click();
        }

        function btnTimePN(type) {
            var startVal = new Date($('#startdate').val());
            var toVal = new Date($('#todate').val());
            var start = "";
            var end = "";
            var starttime = "";
            var endtime = "";

            if (typeTime == "Day") {
                if (type == "Previous") {
                    var todayTimeStamp = startVal;
                    var oneDayTimeStamp = 1000 * 60 * 60 * 24;
                    var diff = todayTimeStamp - oneDayTimeStamp;
                    var yesterdayDate = new Date(diff);
                    var yesterdayString = yesterdayDate.getFullYear() + "-" + ("0" + (yesterdayDate.getMonth() + 1)).slice(-2) + "-" + ("0" + yesterdayDate.getDate()).slice(-2);

                    var date2 = new Date(yesterdayDate);
                    date2.setDate(date2.getDate() + 1);
                    var endDate = ("0" + date2.getDate()).slice(-2) + "/" + ("0" + (date2.getMonth() + 1)).slice(-2) + "/" + date2.getFullYear();

                    $("#startdate").val(yesterdayString);
                    $("#todate").val(GetFormattedDate(endDate));
                    start = yesterdayString;
                    end = GetFormattedDate(endDate);
                }
                else if (type == "Next") {
                    var Val = new Date(startVal.setDate(startVal.getDate() + 1));
                    var tomorrowString = Val.getFullYear() + "-" + ("0" + (Val.getMonth() + 1)).slice(-2) + "-" + ("0" + Val.getDate()).slice(-2);

                    var date2 = new Date(Val);
                    date2.setDate(date2.getDate() + 1);
                    var endDate = ("0" + date2.getDate()).slice(-2) + "/" + ("0" + (date2.getMonth() + 1)).slice(-2) + "/" + date2.getFullYear();

                    $("#startdate").val(tomorrowString);
                    $("#todate").val(GetFormattedDate(endDate));
                    start = tomorrowString;
                    end = GetFormattedDate(endDate);
                }
            }
            else if (typeTime == "Week") {
                if (type == "Previous") {
                    var GetDay = startVal.getDay();
                    var firstday, SetDay;

                    if (GetDay == 2) {
                        firstday = startVal.getDate() - 7;
                    } else if (GetDay > 2) {
                        SetDay = startVal.getDay() - 2;
                        firstday = (startVal.getDate() - SetDay) - 7;
                    } else if (GetDay < 2) {
                        if (GetDay == 0) {
                            SetDay = 5 - GetDay;
                            firstday = (startVal.getDate() - SetDay) - 7;
                        } else if (GetDay == 1) {
                            SetDay = 7 - GetDay;
                            firstday = (startVal.getDate() - SetDay) - 7;
                        }
                    }

                    var lastday = firstday + 6;
                    var date1 = new Date(startVal.setDate(firstday));
                    var date2 = new Date(startVal.setDate(lastday));
                    var startDate = date1.getFullYear() + "-" + ("0" + (date1.getMonth() + 1)).slice(-2) + "-" + ("0" + date1.getDate()).slice(-2);

                    date2.setDate(date2.getDate() + 1);
                    var endDate;
                    if (date1.getDate() > date2.getDate()) {
                        endDate = date2.getFullYear() + "-" + ("0" + (date2.getMonth() + 2)).slice(-2) + "-" + ("0" + date2.getDate()).slice(-2);
                    }
                    else {
                        endDate = date2.getFullYear() + "-" + ("0" + (date2.getMonth() + 1)).slice(-2) + "-" + ("0" + date2.getDate()).slice(-2);
                    }

                    $("#startdate").val(startDate);
                    $("#todate").val(endDate);
                    start = startDate;
                    end = endDate;
                }
                else if (type == "Next") {
                    var GetDay = startVal.getDay();
                    var firstday, SetDay;

                    if (GetDay == 2) {
                        firstday = startVal.getDate() + 7;
                    } else if (GetDay > 2) {
                        SetDay = startVal.getDay() - 2;
                        firstday = (startVal.getDate() - SetDay) + 7;
                    } else if (GetDay < 2) {
                        if (GetDay == 0) {
                            SetDay = 5 - GetDay;
                            firstday = (startVal.getDate() - SetDay) + 7;
                        } else if (GetDay == 1) {
                            SetDay = 7 - GetDay;
                            firstday = (startVal.getDate() - SetDay) + 7;
                        }
                    }

                    var date1 = new Date(startVal.setDate(firstday));

                    var startDate = date1.getFullYear() + "-" + ("0" + (date1.getMonth() + 1)).slice(-2) + "-" + ("0" + date1.getDate()).slice(-2);

                    var date2 = new Date(date1.setTime(date1.getTime() + (6 * 24 * 60 * 60 * 1000)));
                    date2.setDate(date2.getDate() + 1);
                    var endDate = date2.getFullYear() + "-" + ("0" + (date2.getMonth() + 1)).slice(-2) + "-" + ("0" + date2.getDate()).slice(-2);

                    $("#startdate").val(startDate);
                    $("#todate").val(endDate);
                    start = startDate;
                    end = endDate;
                }
            }
            else if (typeTime == "Month") {
                if (type == "Previous") {
                    var current = new Date(startVal.getFullYear(), startVal.getMonth() - 1, 1);
                    var tomorrowString = current.getFullYear() + "-" + ("0" + (current.getMonth() + 1)).slice(-2) + "-" + ("0" + current.getDate()).slice(-2);
                    $("#startdate").val(tomorrowString);
                    var current2 = new Date(startVal.getFullYear(), startVal.getMonth(), 0);
                    current2.setDate(current2.getDate() + 1);
                    var tomorrowString2 = current2.getFullYear() + "-" + ("0" + (current2.getMonth() + 1)).slice(-2) + "-" + ("0" + current2.getDate()).slice(-2);
                    $("#todate").val(tomorrowString2);
                    start = tomorrowString;
                    end = tomorrowString2;
                }
                else if (type == "Next") {
                    var current = new Date(startVal.getFullYear(), startVal.getMonth() + 1, 1);
                    var tomorrowString = current.getFullYear() + "-" + ("0" + (current.getMonth() + 1)).slice(-2) + "-" + ("0" + current.getDate()).slice(-2);
                    $("#startdate").val(tomorrowString);
                    var current2 = new Date(startVal.getFullYear(), startVal.getMonth() + 2, 0);
                    current2.setDate(current2.getDate() + 1);
                    var tomorrowString2 = current2.getFullYear() + "-" + ("0" + (current2.getMonth() + 1)).slice(-2) + "-" + ("0" + current2.getDate()).slice(-2);
                    $("#todate").val(tomorrowString2);
                    start = tomorrowString;
                    end = tomorrowString2;
                }
            }
            var Time_S = $("#starttime").val() + ":00";
            var Time_E = $("#totime").val() + ":00";

            Search_Click();
        }

        function GetFormattedDate(txtDate) {
            var month = txtDate.split('/')[1];
            var day = txtDate.split('/')[0];
            var year = txtDate.split('/')[2];
            return year + "-" + month + "-" + day;
        }

        function Search_Click() {
            $("#myModalLoad").modal();
            postData();
        }

        function getModalDetail(ID) {
            $("#myModalLoad").modal();
            postDataDetail(NumPage2, ID);
        }

        function GetNumPageDetail(num, ID) {
            $(function () {
                (function (name) {
                    var container = $('#pagination-' + name);
                    container.pagination({
                        totalNumber: TotalData2,
                        pageNumber: num,
                        pageSize: 100,
                        dataSource: 'https://api.flickr.com/services/feeds/photos_public.gne?tags=cat&tagmode=any&format=json&jsoncallback=?',
                        locator: 'items',
                        callback: function (response, pagination) {
                            num = container.pagination('getSelectedPageNum');
                            if (NumPage2 != 0) {
                                postDataDetail_Page(num, ID);
                            }
                            NumPage2 = num;
                        }
                    });
                })('demo22');
            });
        }

        const postData = async () => {
            const parameter = {
                username: $("#searchLoginname").val(),
                startDate: $("#startdate").val(),
                startTime: $("#starttime").val() + ":00",
                endDate: $("#todate").val(),
                endTime: $("#totime").val() + ":00",
            }
            const requestAwait = await fetchDataSite(`${apiURL}/v1/report/transaction_statement_member`, 'POST', "include", parameter)
            const response = await requestAwait.json()

            var no = 1;
            var htmlData = "";
            if (response.messageCode == 0000 || response.messageCode == null) {
                $("#tbData > tbody").html("");
                if (response.data.userID == "undefined" || response.data.userID == "" || response.data.userID == null) {
                    $("#totalDeposit").text("-");
                    $("#totalWithdrawal").text("-");
                    $("#totalBalance").text("-");

                    document.getElementById("totalDeposit").style.color = "rgb(23, 23, 44)";
                    document.getElementById("totalWithdrawal").style.color = "rgb(23, 23, 44)";
                    document.getElementById("totalBalance").style.color = "rgb(23, 23, 44)";

                    htmlData += "<tr>";
                    htmlData += "<td colspan='8' class='aligncenter' set-lan='text:No data.'></td>";
                    htmlData += "</tr>";

                    $("#tbData > tbody").append(htmlData);
                    document.getElementById("zonePlsSearch").style.display = "none";
                    document.getElementById("tbData").style.display = "";
                    SetLan(localStorage.getItem("Language"));
                    $("#myModalLoad").modal('hide');
                }
                else {
                    var obj = response.data;
                    htmlData += "<tr>";
                    htmlData += "<td class='aligncenter'>" + no + "</td>";

                    var Position = obj.position;
                    if (Position == "SH_HOLDER") {
                        Position = "Shareholder";
                    } else {
                        var txt = Position;
                        var txt2 = txt.toLowerCase();
                        Position = capitalizeFirstLetter(txt2);
                    }

                    htmlData += "<td>" + obj.username + "</a></td>";
                    htmlData += "<td class='aligncenter' set-lan='text:" + Position + "'></td>";
                    htmlData += "<td class='aligncenter'>" + obj.currency + "</td>";

                    var Amt1 = parseFloat(obj.deposit).toFixed(2);
                    if (Amt1 < 0) {
                        htmlData += "<td class='alignright' style='color: red;'>" + Amt1.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                    }
                    else {
                        htmlData += "<td class='alignright'>" + Amt1.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                    }

                    var Amt2 = parseFloat(obj.withdraw).toFixed(2);
                    if (Amt2 < 0) {
                        htmlData += "<td class='alignright' style='color: red;'>" + Amt2.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                    }
                    else {
                        htmlData += "<td class='alignright'>" + Amt2.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                    }

                    var Amt3 = parseFloat(obj.balance).toFixed(2);
                    if (Amt3 < 0) {
                        htmlData += "<td class='alignright' style='color: red;'>" + Amt3.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                    }
                    else {
                        htmlData += "<td class='alignright'>" + Amt3.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                    }

                    htmlData += "<td class='aligncenter'><button type='button' class='btn btn-yellow font-weight-bold m-0 px-3 py-2 z-depth-0 waves-effect btnMenu' onclick='getModalDetail(\"" + obj.userID + "\");' style='line-height: 0rem !important;' set-lan='text:Detail'></button></td>";

                    htmlData += "</tr>";
                    no++;

                    $("#tbData > tbody").append(htmlData);

                    var deposit = parseFloat(response.data.deposit).toFixed(2);
                    var withdraw = parseFloat(response.data.withdraw).toFixed(2);
                    var balance = parseFloat(response.data.balance).toFixed(2);

                    $("#totalDeposit").text(deposit.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,'));
                    $("#totalWithdrawal").text(withdraw.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,'));
                    $("#totalBalance").text(balance.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,'));

                    if (deposit < 0) {
                        document.getElementById("totalDeposit").style.color = "red";
                    } else {
                        document.getElementById("totalDeposit").style.color = "rgb(23, 23, 44)";
                    }

                    if (withdraw < 0) {
                        document.getElementById("totalWithdrawal").style.color = "red";
                    } else {
                        document.getElementById("totalWithdrawal").style.color = "rgb(23, 23, 44)";
                    }

                    if (balance < 0) {
                        document.getElementById("totalBalance").style.color = "red";
                    } else {
                        document.getElementById("totalBalance").style.color = "rgb(23, 23, 44)";
                    }

                    document.getElementById("zonePlsSearch").style.display = "none";
                    document.getElementById("tbData").style.display = "";
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
            else if (response.messageCode == 1102) {
                document.getElementById("lbAlert").setAttribute("set-lan", "text:missing 'Username' field");
                SetLan(localStorage.getItem("Language"));
                $('#modalAlert').modal('show');
                $("#myModalLoad").modal('hide');
            }
            else {
                document.getElementById('lbAlert').innerHTML = response.messageDescription;
                $("#myModalLoad").modal('hide');
                $('#modalAlert').modal('show');
            }
        }

        const postDataDetail = async (num, ID) => {
            if (num == 0) {
                num = num + 1;
            }

            const parameter = {
                startDate: $("#startdate").val(),
                startTime: $("#starttime").val() + ":00",
                endDate: $("#todate").val(),
                endTime: $("#totime").val() + ":00",
                userID: ID,
                page: num,
                size: 100
            }

            const requestAwait = await fetchDataSite(`${apiURL}/v1/report/transaction_statement_detail`, 'POST', "include", parameter)
            const response = await requestAwait.json()
            if (response.messageCode == 0000 || response.messageCode == null) {
                TotalData2 = response.total;
                GetNumPageDetail(num, ID);

                if (NumPage2 == 0) {
                    $("#tbData2 > tbody").html("");
                    var htmlData = "";

                    if (response.total != 0) {
                        var no = 1;
                        for (var i = 0; i < response.data.detail.length; i++) {
                            var obj = response.data.detail[i];
                            htmlData += "<tr>";
                            htmlData += "<td class='aligncenter'>" + (((num - 1) * 100) + no) + "</td>";
                            htmlData += "<td>" + obj.username + "</td>";
                            htmlData += "<td>" + obj.currency + "</td>";

                            if (obj.action == "WITHDRAW") {
                                htmlData += "<td set-lan='text:WITHDRAWAL'></td>";
                            }
                            else {
                                htmlData += "<td set-lan='text:" + obj.action + "'></td>";
                            }

                            var Amt = parseFloat(obj.amount).toFixed(2);
                            if (Amt < 0) {
                                htmlData += "<td class='alignright' style='color: red;'>" + Amt.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                            } else {
                                htmlData += "<td class='alignright'>" + Amt.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                            }

                            var SetDate = new Date(obj.createTime);
                            SetDate = ("0" + SetDate.getDate()).slice(-2) + "/" + ("0" + (SetDate.getMonth() + 1)).slice(-2) + "/" + SetDate.getFullYear() + " " + ("0" + SetDate.getHours()).slice(-2) + ":" + ("0" + SetDate.getMinutes()).slice(-2) + ":" + ("0" + SetDate.getSeconds()).slice(-2);
                            htmlData += "<td class='aligncenter'>" + SetDate + "</td>";
                            htmlData += "</tr>";
                            no++;
                        }

                        var amount = parseFloat(response.data.summary.amount).toFixed(2);
                        $("#totalDetail").text(amount.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,'));
                        if (amount < 0) {
                            document.getElementById("totalDetail").style.color = "red";
                        } else {
                            document.getElementById("totalDetail").style.color = "rgb(23, 23, 44)";
                        }

                        $("#tbData2 > tbody").append(htmlData);
                        SetLan(localStorage.getItem("Language"));
                        $('#modalGetDetail').modal('show');
                        $("#myModalLoad").modal('hide');
                    }
                    else {
                        $("#totalDetail").text("-");
                        document.getElementById("totalDetail").style.color = "rgb(23, 23, 44)";

                        htmlData += "<tr>";
                        htmlData += "<td colspan='6' class='aligncenter' set-lan='text:No data.'></td>";
                        htmlData += "</tr>";

                        $("#tbData2 > tbody").append(htmlData);
                        SetLan(localStorage.getItem("Language"));
                        $('#modalGetDetail').modal('show');
                        $("#myModalLoad").modal('hide');
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

        const postDataDetail_Page = async (num, ID) => {
            const parameter = {
                startDate: $("#startdate").val(),
                startTime: $("#starttime").val() + ":00",
                endDate: $("#todate").val(),
                endTime: $("#totime").val() + ":00",
                userID: ID,
                page: num,
                size: 100
            }
            const requestAwait = await fetchDataSite(`${apiURL}/v1/report/transaction_statement_detail`, 'POST', "include", parameter)
            const response = await requestAwait.json()

            if (response.messageCode == 0000 || response.messageCode == null) {
                $("#tbData2 > tbody").html("");
                var htmlData = "";

                if (response.total != 0) {
                    var no = 1;
                    for (var i = 0; i < response.data.detail.length; i++) {
                        var obj = response.data.detail[i];
                        htmlData += "<tr>";
                        htmlData += "<td class='aligncenter'>" + (((num - 1) * 100) + no) + "</td>";
                        htmlData += "<td>" + obj.username + "</td>";
                        htmlData += "<td>" + obj.currency + "</td>";

                        if (obj.action == "WITHDRAW") {
                            htmlData += "<td set-lan='text:WITHDRAWAL'></td>";
                        }
                        else {
                            htmlData += "<td set-lan='text:" + obj.action + "'></td>";
                        }

                        var Amt = parseFloat(obj.amount).toFixed(2);
                        if (Amt < 0) {
                            htmlData += "<td class='alignright' style='color: red;'>" + Amt.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                        } else {
                            htmlData += "<td class='alignright'>" + Amt.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                        }

                        var SetDate = new Date(obj.createTime);
                        SetDate = ("0" + SetDate.getDate()).slice(-2) + "/" + ("0" + (SetDate.getMonth() + 1)).slice(-2) + "/" + SetDate.getFullYear() + " " + ("0" + SetDate.getHours()).slice(-2) + ":" + ("0" + SetDate.getMinutes()).slice(-2) + ":" + ("0" + SetDate.getSeconds()).slice(-2);
                        htmlData += "<td class='aligncenter'>" + SetDate + "</td>";
                        htmlData += "</tr>";
                        no++;
                    }

                    var amount = parseFloat(response.data.summary.amount).toFixed(2);
                    $("#totalDetail").text(amount.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,'));
                    if (amount < 0) {
                        document.getElementById("totalDetail").style.color = "red";
                    } else {
                        document.getElementById("totalDetail").style.color = "rgb(23, 23, 44)";
                    }

                    $("#tbData2 > tbody").append(htmlData);
                    SetLan(localStorage.getItem("Language"));
                    $('#modalGetDetail').modal('show');
                    $("#myModalLoad").modal('hide');
                }
                else {
                    $("#totalDetail").text("-");
                    document.getElementById("totalDetail").style.color = "rgb(23, 23, 44)";

                    htmlData += "<tr>";
                    htmlData += "<td colspan='6' class='aligncenter' set-lan='text:No data.'></td>";
                    htmlData += "</tr>";

                    $("#tbData2 > tbody").append(htmlData);
                    SetLan(localStorage.getItem("Language"));
                    $('#modalGetDetail').modal('show');
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
    </script>
</asp:Content>

