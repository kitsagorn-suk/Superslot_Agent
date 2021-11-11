<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="daily_report.aspx.cs" Inherits="Pretty_Gaming.Menu_Report.daily_report" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .btn-toolbar .select-wrapper {
            max-width: 200px !important;
        }

        .FloatR {
            float: right;
        }

        .hr {
            margin-top: 3px;
            margin-bottom: 3px;
        }

        .linkUser {
            cursor: pointer;
            width: 6.4em !important;
        }

        tbody > tr > td {
            background-color: #fff !important;
        }
    </style>
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="" set-lan="text:Report"></a></li>
            <li class="breadcrumb-item active txtMem" set-lan="text:Daily Rewards Report"></li>
        </ol>
    </nav>
    <div class="row">
        <div class="col-md-8">
            <h1 set-lan="text:Daily Rewards Report"></h1>
        </div>
    </div>
    <div class="btn-toolbar section-group" role="toolbar" style="padding-bottom: 0px !important;">
        <div class="row col-md-12">
            <div class="form-group row" style="padding-left: 1rem;">
                <label for="email" class="col-form-label" set-lan="text:Username_"></label>
                <div style="padding-left: 1rem;">
                    <input type="text" class="form-control" id="searchLoginname" onkeypress="Key_Enter(event)">
                </div>
            </div>
        </div>
        <div class="row col-md-12">
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
    <div class="row">
        <div class="col-md-8">
            <div id="navMenu" style="color: #17172c; width: fit-content; padding: 5px; font-weight: bold; border-radius: .3rem; font-size: .9rem; padding-right: 10px !important;">
            </div>
        </div>
        <div class="col-md-4">
            <section style="float: right; margin-top: -0.2rem;">
                <div class="data-container"></div>
                <div id="pagination-demo2"></div>
            </section>
        </div>
    </div>
    <div class="table-wrapper" style="margin-top: 10px; margin-bottom: 10px;">
        <table class="table table-border tableMaxWidth table-striped" id="tbData"></table>
    </div>

    <%--<div class="table-wrapper" style="margin-top: 10px; margin-bottom: 10px; width: 100%; display: none;" id="tb">
    </div>
    <div style="margin-bottom: 10px; width: 100%; overflow: auto; height: 40em; /*display: none; */" id="tb2">
        <table class="table table-border tableMaxWidth table-striped" id="tbData"></table>
    </div>--%>

    <%--modal--%>
    <div class="modal fade" id="modalGetCurrency" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
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
    <script src="../js/pagination.js"></script>
    <script type="text/javascript">      
        var typeTime = "Day";
        var Check_Enter = "";

        $(document).ready(function () {
            $("#menuReport , #menuReport > a").addClass("active");
            $("#menuReport > div").css("display", "block");

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

            DateNow();
            GetData('1', '', '');
            SetLan(localStorage.getItem("Language"));
        });

        function Key_Enter(event) {
            var x = event.which || event.keyCode;
            if (x == 13) {
                Check_Enter = "Enter";
                event.preventDefault()
                Search_Click();
            }
        }

        function DateNow() {
            var date = new Date();
            var dateSetSTART = date.getFullYear() + "-" + ("0" + (date.getMonth() + 1)).slice(-2) + "-" + ("0" + date.getDate()).slice(-2);
            date.setDate(date.getDate() + 1);
            var dateSetEND = date.getFullYear() + "-" + ("0" + (date.getMonth() + 1)).slice(-2) + "-" + ("0" + date.getDate()).slice(-2);
            $("#startdate").val(dateSetSTART);
            $("#todate").val(dateSetEND);
            $("#starttime").val('00:00');
            $("#totime").val('00:00');
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
                var yesterdayString = ("0" + yesterdayDate.getDate()).slice(-2) + "/" + ("0" + (yesterdayDate.getMonth() + 1)).slice(-2) + "/" + yesterdayDate.getFullYear();//yesterdayDate.getFullYear() + '-' + (yesterdayDate.getMonth() + 1) + '-' + yesterdayDate.getDate();

                var date2 = new Date(yesterdayDate);
                date2.setDate(date2.getDate() + 1);
                var endDate = ("0" + date2.getDate()).slice(-2) + "/" + ("0" + (date2.getMonth() + 1)).slice(-2) + "/" + date2.getFullYear();//date2.getFullYear() + '-' + (date2.getMonth() + 1) + '-' + date2.getDate();

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

                //var firstday = date.getDate() - date.getDay();
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

                //var firstday = (date.getDate() - date.getDay()) - 7;
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

            NumPage = 0;
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
                    var endDate = ("0" + date2.getDate()).slice(-2) + "/" + ("0" + (date2.getMonth() + 1)).slice(-2) + "/" + date2.getFullYear();//date2.getFullYear() + '-' + (date2.getMonth() + 1) + '-' + date2.getDate();

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
                    var endDate = ("0" + date2.getDate()).slice(-2) + "/" + ("0" + (date2.getMonth() + 1)).slice(-2) + "/" + date2.getFullYear();//date2.getFullYear() + '-' + (date2.getMonth() + 1) + '-' + date2.getDate();

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

                    //var firstday = (startVal.getDate() - startVal.getDay()) - 7;
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

                    //var firstday = (startVal.getDate() - startVal.getDay()) + 7;
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

            NumPage = 0;
            Search_Click();
        }

        function GetFormattedDate(txtDate) {
            var month = txtDate.split('/')[1];
            var day = txtDate.split('/')[0];
            var year = txtDate.split('/')[2];
            return year + "-" + month + "-" + day;
        }

        function capitalizeFirstLetter(string) {
            return string.charAt(0).toUpperCase() + string.slice(1);
        }

        function Search_Click() {
            if ($("#searchLoginname").val() != "") {
                NumPage = 0;
                $("#navMenu , #tbData").html("");
                GetData('2', '', $("#searchLoginname").val());
            }
            else {
                NumPage = 0;
                $("#navMenu , #tbData").html("");
                GetData('1', '', '');
            }
        }

        var NumPage = 0;
        var TotalData;
        function GetData(status, userID, username) {
            $("#myModalLoad").modal();
            postData(status, userID, username, NumPage);
        }

        function Check(status, userID, username) {
            NumPage = 0;
            GetData(status, userID, username);
        }

        function GetNumPage(status, userID, username, num) {
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
                                postPage(status, userID, username, num);
                            }
                            NumPage = num;
                        }
                    });
                })('demo2');
            });
        }

        const postData = async (status, userID, username, num) => {
            $("#myModalLoad").modal();

            if (num == 0) {
                num = num + 1;
            }

            var URL;
            var parameter = {};
            if (status == 1) {
                URL = `${apiURL}/v1/dailyReward/report/stakeholder_payment`;
                parameter = {
                    startDate: $("#startdate").val(),
                    startTime: $("#starttime").val() + ":00",
                    endDate: $("#todate").val(),
                    endTime: $("#totime").val() + ":00",
                    userID: userID,
                    username: username,
                    page: num,
                    size: 100
                }
            }
            else if (status == 2) {
                URL = `${apiURL}/v1/dailyReward/report/redeem_history`;
                parameter = {
                    startDate: $("#startdate").val(),
                    startTime: $("#starttime").val() + ":00",
                    endDate: $("#todate").val(),
                    endTime: $("#totime").val() + ":00",
                    username: username,
                    page: num,
                    size: 100
                }
            }
            const requestAwait = await fetchDataSite(URL, 'POST', "include", parameter)
            const response = await requestAwait.json()

            if (response.messageCode == 0000 || response.messageCode == null) {
                TotalData = response.total;
                GetNumPage(status, userID, username, num);

                if (NumPage == 0) {
                    if (status == 1) {
                        $("#navMenu , #tbData").html("");
                        //$("#tb2").css('display', 'flex');
                        $("#tb").css('display', 'none');

                        var no = 1;
                        var htmlAll = "";
                        var htmlHead = "";
                        var htmlData = "";
                        var htmlFoot = "";

                        htmlHead += "<thead class='rgba-green-slight'><tr>";
                        htmlHead += "<th style='width: 1%;' set-lan='text:No'></th>";
                        htmlHead += "<th style='width: 8%; text-align: left; padding-left: 5px;' set-lan='text:Username'></th>";
                        htmlHead += "<th style='width: 8%; text-align: left; padding-left: 5px;' set-lan='text:Nickname'></th>";
                        htmlHead += "<th style='width: 8%;' set-lan='text:Level'></th>";
                        htmlHead += "<th style='width: 8%;' set-lan='text:Payout'></th>";
                        htmlHead += "</tr></thead>";

                        htmlFoot += "<tfoot class='rgba-yellow-slight'>";
                        htmlFoot += "<tr class='total'>";
                        htmlFoot += "<td></td><td></td><td></td>";
                        htmlFoot += "<td set-lan='text:Total'></td>";
                        htmlFoot += "<td id='totalPay'>-</td>";
                        htmlFoot += "</tr></tfoot>";

                        if (response.total > 0) {
                            for (var i = 0; i < response.data.details.length; i++) {
                                var obj = response.data.details[i];

                                var Level = obj.level
                                if (Level == "SH_HOLDER") {
                                    Level = "Shareholder";
                                }
                                else {
                                    var txt = Level;
                                    var txt2 = txt.toLowerCase();
                                    Level = capitalizeFirstLetter(txt2);
                                }

                                var payout = parseFloat(obj.payout).toFixed(2);
                                payout = payout.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1,");

                                htmlData += "<tr>";
                                htmlData += "<td class='aligncenter'>" + (((num - 1) * 100) + no) + "</td>";
                                if (Level == "Member") {
                                    htmlData += "<td><a onclick='Check(`2`,``,`" + obj.username + "`)' class='linkNav linkUser'>" + obj.username + "</a></td>";
                                }
                                else {
                                    htmlData += "<td><a onclick='Check(`1`,`" + obj.userID + "`,``)' class='linkNav linkUser'>" + obj.username + "</a></td>";
                                }
                                htmlData += "<td><a class='overflow ellipsis' title='" + obj.nickname + "'>" + obj.nickname + "</a></td>";
                                htmlData += "<td class='aligncenter' set-lan='text:" + Level + "'></td>";
                                htmlData += "<td class='alignright'>" + payout + "</td>";
                                htmlData += "</tr>";

                                no++;
                            }

                            htmlAll = htmlHead + htmlData + htmlFoot;
                            $("#tbData").append(htmlAll);

                            var realizedAmount = parseFloat(response.data.realizedAmount).toFixed(2);
                            realizedAmount = realizedAmount.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1,");
                            $("#totalPay").text(realizedAmount.toString());

                        }
                        else {
                            htmlData += '<tr><td colspan="5" class="aligncenter" set-lan="text:No data."></td></tr>';

                            htmlAll = htmlHead + htmlData + htmlFoot;
                            $("#tbData").append(htmlAll);
                            $("#totalPay").text("-");
                        }

                        if (response.data.parentList.length != 0) {
                            var navMenu = "";
                            for (var i = 0; i < response.data.parentList.length; i++) {
                                var obj = response.data.parentList[i];
                                if (navMenu == "") {
                                    navMenu += "<a class='linkNav' onclick='Check(`1`,`" + obj.id + "`,``)'>" + obj.username + "</a>";
                                }
                                else {
                                    navMenu += " / <a class='linkNav' onclick='Check(`1`,`" + obj.id + "`,``)'>" + obj.username + "</a>";
                                }
                            }
                            $("#navMenu").append(navMenu);
                            $("#navMenu > a:last-child").css("text-decoration", "underline");
                        }

                        SetLan(localStorage.getItem("Language"));
                        $("#myModalLoad").modal('hide');
                    }
                    else if (status == 2) {
                        var htmlData = "";
                        $("#tbData").html("");
                        //test
                        //$("#tb2").css('display', 'flex');
                        $("#tb").css('display', 'none');
                        //test

                        var no = 1;
                        var htmlAll = "";
                        var htmlHead = "";
                        var htmlData = "";
                        var htmlFoot = "";

                        htmlHead += "<thead class='rgba-green-slight'><tr>";
                        htmlHead += "<th style='width: 1%;' set-lan='text:No'></th>";
                        htmlHead += "<th style='width: 8%; text-align: left; padding-left: 5px;' set-lan='text:Information'></th>";
                        htmlHead += "<th style='width: 8%;' set-lan='text:Level'></th>";
                        htmlHead += "<th style='width: 8%; text-align: left; padding-left: 5px;' set-lan='text:Item Name'></th>";
                        htmlHead += "<th style='width: 8%;' set-lan='text:Value'></th>";
                        htmlHead += "</tr></thead>";

                        htmlFoot += "<tfoot class='rgba-yellow-slight'>";
                        htmlFoot += "<tr class='total'>";
                        htmlFoot += "<td></td><td></td><td></td>";
                        htmlFoot += "<td set-lan='text:Total'></td>";
                        htmlFoot += "<td id='totalGet'>-</td>";
                        htmlFoot += "</tr></tfoot>";

                        if (response.total != 0) {
                            for (var i = 0; i < response.data.details.length; i++) {
                                var obj = response.data.details[i];

                                var date = new Date(obj.createDate);
                                var txtClaim;
                                if (obj.createDate == "" || obj.createDate == null) {
                                    txtClaim = "-";
                                }
                                else {
                                    txtClaim = ("0" + date.getDate()).slice(-2) + "/" + ("0" + (date.getMonth() + 1)).slice(-2) + "/" + date.getFullYear() + " " + ("0" + date.getHours()).slice(-2) + ":" + ("0" + date.getMinutes()).slice(-2) + ":" + ("0" + date.getSeconds()).slice(-2);
                                }

                                var date2 = new Date(obj.exchangeDate);
                                var txtExchange;
                                if (obj.exchangeDate == "" || obj.exchangeDate == null) {
                                    txtExchange = "-";
                                }
                                else {
                                    txtExchange = ("0" + date2.getDate()).slice(-2) + "/" + ("0" + (date2.getMonth() + 1)).slice(-2) + "/" + date2.getFullYear() + " " + ("0" + date2.getHours()).slice(-2) + ":" + ("0" + date2.getMinutes()).slice(-2) + ":" + ("0" + date2.getSeconds()).slice(-2);
                                }

                                var Level = obj.level
                                if (Level == "SH_HOLDER") {
                                    Level = "Shareholder";
                                }
                                else {
                                    var txt = Level;
                                    var txt2 = txt.toLowerCase();
                                    Level = capitalizeFirstLetter(txt2);
                                }

                                var itemValue = parseFloat(obj.itemValue).toFixed(2);
                                itemValue = itemValue.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1,");

                                htmlData += "<tr>";
                                htmlData += "<td class='aligncenter'>" + (((num - 1) * 100) + no) + "</td>";
                                htmlData += "<td><b set-lan='text:User'></b>: " + obj.username + "<br><b set-lan='text:Claim Date'></b>: " + txtClaim + "<br><b set-lan='text:Exchange Date'></b>: " + txtExchange + "</td>"
                                htmlData += "<td class='aligncenter' set-lan='text:" + Level + "'></td>";
                                htmlData += "<td>" + obj.itemsName + "</td>";
                                htmlData += "<td class='alignright'>" + itemValue + "</td>";
                                htmlData += "</tr>";

                                no++;
                            }
                            htmlAll = htmlHead + htmlData + htmlFoot;
                            $("#tbData").append(htmlAll);

                            var realizedAmount = parseFloat(response.data.realizedAmount).toFixed(2);
                            realizedAmount = realizedAmount.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1,");
                            $("#totalGet").text(realizedAmount.toString());

                            SetLan(localStorage.getItem("Language"));
                            $("#myModalLoad").modal('hide');
                        }
                        else {
                            htmlData += "<tr><td colspan='9' class='aligncenter' set-lan='text:No data.'></td></tr>";
                            htmlAll = htmlHead + htmlData + htmlFoot;
                            $("#tbData").append(htmlAll);
                            $("#totalGet").text("-");

                            SetLan(localStorage.getItem("Language"));
                            $("#myModalLoad").modal('hide');
                        }

                        var txt = "<a class='linkNav Check2' onclick='Check(`2`,``,`" + username + "`)'>" + username + "</a>";
                        var arrNav = $("#navMenu").html();
                        var Check = arrNav.search("Check2");
                        if (Check < 0 && arrNav != "") {
                            arrNav += " / " + txt;
                        }
                        else if (arrNav == "") {
                            arrNav += txt;
                        }

                        $("#navMenu").html("");
                        $("#navMenu").append(arrNav);
                        $("#navMenu > a:last-child").css("text-decoration", "underline");

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

        const postPage = async (status, userID, username, num) => {
            $("#myModalLoad").modal();
            $("#tbData > tbody").html("");

            var URL;
            var parameter = {};
            if (status == 1) {
                URL = `${apiURL}/v1/dailyReward/report/stakeholder_payment`;
                parameter = {
                    startDate: $("#startdate").val(),
                    startTime: $("#starttime").val() + ":00",
                    endDate: $("#todate").val(),
                    endTime: $("#totime").val() + ":00",
                    userID: userID,
                    username: username,
                    page: num,
                    size: 100
                }
            }
            else if (status == 2) {
                URL = `${apiURL}/v1/dailyReward/report/redeem_history`;
                parameter = {
                    startDate: $("#startdate").val(),
                    startTime: $("#starttime").val() + ":00",
                    endDate: $("#todate").val(),
                    endTime: $("#totime").val() + ":00",
                    username: username,
                    page: num,
                    size: 100
                }
            }
            const requestAwait = await fetchDataSite(URL, 'POST', "include", parameter)
            const response = await requestAwait.json()

            if (response.messageCode == 0000 || response.messageCode == null) {
                if (status == 1) {
                    $("#navMenu , #tbData").html("");
                    //test
                    //$("#tb2").css('display', 'flex');
                    $("#tb").css('display', 'none');
                    //test

                    var no = 1;
                    var htmlAll = "";
                    var htmlHead = "";
                    var htmlData = "";
                    var htmlFoot = "";

                    htmlHead += "<thead class='rgba-green-slight'><tr>";
                    htmlHead += "<th style='width: 1%;' set-lan='text:No'></th>";
                    htmlHead += "<th style='width: 8%; text-align: left; padding-left: 5px;' set-lan='text:Username'></th>";
                    htmlHead += "<th style='width: 8%; text-align: left; padding-left: 5px;' set-lan='text:Nickname'></th>";
                    htmlHead += "<th style='width: 8%;' set-lan='text:Level'></th>";
                    htmlHead += "<th style='width: 8%;' set-lan='text:Payout'></th>";
                    htmlHead += "</tr></thead>";

                    htmlFoot += "<tfoot class='rgba-yellow-slight'>";
                    htmlFoot += "<tr class='total'>";
                    htmlFoot += "<td></td><td></td><td></td>";
                    htmlFoot += "<td set-lan='text:Total'></td>";
                    htmlFoot += "<td id='totalPay'>-</td>";
                    htmlFoot += "</tr></tfoot>";

                    if (response.total > 0) {
                        for (var i = 0; i < response.data.details.length; i++) {
                            var obj = response.data.details[i];

                            var Level = obj.level
                            if (Level == "SH_HOLDER") {
                                Level = "Shareholder";
                            }
                            else {
                                var txt = Level;
                                var txt2 = txt.toLowerCase();
                                Level = capitalizeFirstLetter(txt2);
                            }

                            var payout = parseFloat(obj.payout).toFixed(2);
                            payout = payout.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1,");

                            htmlData += "<tr>";
                            htmlData += "<td class='aligncenter'>" + (((num - 1) * 100) + no) + "</td>";
                            if (Level == "Member") {
                                htmlData += "<td><a onclick='Check(`2`,``,`" + obj.username + "`)' class='linkNav linkUser'>" + obj.username + "</a></td>";
                            }
                            else {
                                htmlData += "<td><a onclick='Check(`1`,`" + obj.userID + "`,``)' class='linkNav linkUser'>" + obj.username + "</a></td>";
                            }
                            htmlData += "<td><a class='overflow ellipsis' title='" + obj.nickname + "'>" + obj.nickname + "</a></td>";
                            htmlData += "<td class='aligncenter' set-lan='text:" + Level + "'></td>";
                            htmlData += "<td class='alignright'>" + payout + "</td>";
                            htmlData += "</tr>";

                            no++;
                        }

                        htmlAll = htmlHead + htmlData + htmlFoot;
                        $("#tbData").append(htmlAll);

                        var realizedAmount = parseFloat(response.data.realizedAmount).toFixed(2);
                        realizedAmount = realizedAmount.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1,");
                        $("#totalPay").text(realizedAmount.toString());

                    }
                    else {
                        htmlData += '<tr><td colspan="5" class="aligncenter" set-lan="text:No data."></td></tr>';

                        htmlAll = htmlHead + htmlData + htmlFoot;
                        $("#tbData").append(htmlAll);
                        $("#totalPay").text("-");
                    }

                    if (response.data.parentList.length != 0) {
                        var navMenu = "";
                        for (var i = 0; i < response.data.parentList.length; i++) {
                            var obj = response.data.parentList[i];
                            if (navMenu == "") {
                                navMenu += "<a class='linkNav' onclick='Check(`1`,`" + obj.id + "`,``)'>" + obj.username + "</a>";
                            }
                            else {
                                navMenu += " / <a class='linkNav' onclick='Check(`1`,`" + obj.id + "`,``)'>" + obj.username + "</a>";
                            }
                        }
                        $("#navMenu").append(navMenu);
                        $("#navMenu > a:last-child").css("text-decoration", "underline");
                    }

                    SetLan(localStorage.getItem("Language"));
                    $("#myModalLoad").modal('hide');
                }
                else if (status == 2) {
                    var htmlData = "";
                    $("#tbData").html("");
                    //test
                    //$("#tb2").css('display', 'flex');
                    $("#tb").css('display', 'none');
                    //test

                    var no = 1;
                    var htmlAll = "";
                    var htmlHead = "";
                    var htmlData = "";
                    var htmlFoot = "";

                    htmlHead += "<thead class='rgba-green-slight'><tr>";
                    htmlHead += "<th style='width: 1%;' set-lan='text:No'></th>";
                    htmlHead += "<th style='width: 8%; text-align: left; padding-left: 5px;' set-lan='text:Information'></th>";
                    htmlHead += "<th style='width: 8%;' set-lan='text:Level'></th>";
                    htmlHead += "<th style='width: 8%; text-align: left; padding-left: 5px;' set-lan='text:Item Name'></th>";
                    htmlHead += "<th style='width: 8%;' set-lan='text:Value'></th>";
                    htmlHead += "</tr></thead>";

                    htmlFoot += "<tfoot class='rgba-yellow-slight'>";
                    htmlFoot += "<tr class='total'>";
                    htmlFoot += "<td></td><td></td><td></td>";
                    htmlFoot += "<td set-lan='text:Total'></td>";
                    htmlFoot += "<td id='totalGet'>-</td>";
                    htmlFoot += "</tr></tfoot>";

                    if (response.total != 0) {
                        for (var i = 0; i < response.data.details.length; i++) {
                            var obj = response.data.details[i];

                            var Date = obj.createDate;
                            Date = Date.split('T')[0].slice(0, 10);
                            var Time = obj.createDate;;
                            Time = Time.split('T')[1].slice(0, 8);

                            var YY = Date.split('-')[0];
                            var MM = Date.split('-')[1];
                            var DD = Date.split('-')[2];
                            Date = DD + "/" + MM + "/" + YY + " " + Time;

                            var Level = obj.level
                            if (Level == "SH_HOLDER") {
                                Level = "Shareholder";
                            }
                            else {
                                var txt = Level;
                                var txt2 = txt.toLowerCase();
                                Level = capitalizeFirstLetter(txt2);
                            }

                            var itemValue = parseFloat(obj.itemValue).toFixed(2);
                            itemValue = itemValue.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1,");

                            htmlData += "<tr>";
                            htmlData += "<td class='aligncenter'>" + (((num - 1) * 100) + no) + "</td>";
                            htmlData += "<td><b set-lan='text:User'></b>: " + obj.username + "<br><b set-lan='text:Exchange Date'></b>: " + Date + "</td>"
                            htmlData += "<td class='aligncenter' set-lan='text:" + Level + "'></td>";
                            htmlData += "<td>" + obj.itemsName + "</td>";
                            htmlData += "<td class='alignright'>" + itemValue + "</td>";
                            htmlData += "</tr>";

                            no++;
                        }
                        htmlAll = htmlHead + htmlData + htmlFoot;
                        $("#tbData").append(htmlAll);

                        var realizedAmount = parseFloat(response.data.realizedAmount).toFixed(2);
                        realizedAmount = realizedAmount.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1,");
                        $("#totalGet").text(realizedAmount.toString());

                        SetLan(localStorage.getItem("Language"));
                        $("#myModalLoad").modal('hide');
                    }
                    else {
                        htmlData += "<tr><td colspan='9' class='aligncenter' set-lan='text:No data.'></td></tr>";
                        htmlAll = htmlHead + htmlData + htmlFoot;
                        $("#tbData").append(htmlAll);

                        $("#totalReward").text("-");
                        $("#totalGet").text("-");

                        SetLan(localStorage.getItem("Language"));
                        $("#myModalLoad").modal('hide');
                    }

                    var txt = "<a class='linkNav Check2' onclick='Check(`2`,``,`" + username + "`)'>" + username + "</a>";
                    var arrNav = $("#navMenu").html();
                    var Check = arrNav.search("Check2");
                    if (Check < 0 && arrNav != "") {
                        arrNav += " / " + txt;
                    }
                    else if (arrNav == "") {
                        arrNav += txt;
                    }

                    $("#navMenu").html("");
                    $("#navMenu").append(arrNav);
                    $("#navMenu > a:last-child").css("text-decoration", "underline");

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
