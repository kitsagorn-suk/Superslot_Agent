<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="provider_report.aspx.cs" Inherits="Pretty_Gaming.Menu_Report.provider_report" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .btn-toolbar .select-wrapper {
            max-width: 200px !important;
        }
    </style>
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="" set-lan="text:Report"></a></li>
            <li class="breadcrumb-item active txtMem" set-lan="text:Provider Report"></li>
        </ol>
    </nav>
    <div class="row">
        <div class="col-md-8">
            <h1 set-lan="text:Provider Report"></h1>
        </div>
    </div>
    <div class="btn-toolbar section-group" role="toolbar" style="padding-bottom: 0px !important;">
        <div class="row col-md-12">
            <div class="form-group row" style="padding-left: 1rem;">
                <label for="email" class="col-form-label" set-lan="text:Provider_"></label>
                <div style="padding-left: 1rem;">
                    <div class="select-outline">
                        <select id="selProvider" class="mdb-select" multiple>
                            <option value="" set-lan="text:Select" disabled selected></option>
                        </select>
                    </div>
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
    <div class="table-wrapper" style="margin-top: 10px; margin-bottom: 10px;">
        <section style="float: right; margin-top: -2.2rem;">
            <div class="data-container"></div>
            <div id="pagination-demo2"></div>
        </section>
        <table class="table table-border" id="tbData">
            <thead class="rgba-green-slight">
                <tr>
                    <th style="width: 10%;" set-lan="text:Provider"></th>
                    <th style="width: 10%; text-align: right; padding-right: 5px;" set-lan="text:Valid Turnover"></th>
                    <th style="width: 10%; text-align: right; padding-right: 5px;" set-lan="text:CountTicket"></th>
                    <th style="width: 10%; text-align: right; padding-right: 5px;" set-lan="text:RTP"></th>
                    <th style="width: 10%; text-align: right; padding-right: 5px;" set-lan="text:Netwin"></th>
                    <th style="width: 10%; text-align: right; padding-right: 5px;" set-lan="text:W/L"></th>
                    <th style="width: 10%; text-align: right; padding-right: 5px;" id="txtRP"></th>
                </tr>
            </thead>
            <tbody>
            </tbody>
            <tfoot class="rgba-yellow-slight">
                <tr class="total">
                    <td set-lan='text:Total'></td>
                    <td id="totalValid">-</td>
                    <td id="totalCount">-</td>
                    <td id="totalRTP">-</td>
                    <td id="totalNetwin">-</td>
                    <td id="totalCom">-</td>
                    <td id="totalPro">-</td>
                </tr>
            </tfoot>
        </table>
    </div>

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

            var txtPosition = localStorage.getItem("Position");
            if (txtPosition == "AMB") {
                document.getElementById("txtRP").setAttribute("set-lan", "text:W/L Provider");
            } else if (txtPosition == "COMPANY") {
                document.getElementById("txtRP").setAttribute("set-lan", "text:W/L Company AMB");
            } else {
                document.getElementById("txtRP").setAttribute("set-lan", "text:W/L Company");
            }

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

            getProvider();
            DateNow();
            GetData();
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
            var start = $("#startdate").val();
            var end = $("#todate").val();
            var Time_S = $("#starttime").val() + ":00";
            var Time_E = $("#totime").val() + ":00";
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
            GetData();
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
            GetData();
        }

        function GetFormattedDate(txtDate) {
            var month = txtDate.split('/')[1];
            var day = txtDate.split('/')[0];
            var year = txtDate.split('/')[2];
            return year + "-" + month + "-" + day;
        }

        function Search_Click() {
            NumPage = 0;
            GetData();
        }


        var NumPage = 0;
        var TotalData;
        function GetData() {
            $("#myModalLoad").modal();
            //if (NumPage == null) {
            //    NumPage = 1;
            //}
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
                                postGetTable(num);
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
                startDate: $("#startdate").val(),
                endDate: $("#todate").val(),
                startTime: $("#starttime").val() + ":00",
                endTime: $("#totime").val() + ":00",
                provider: $('#selProvider').val(),
                page: num,
                size: 100
            }
            const requestAwait = await fetchDataSite(`${apiURL}/v1/report/provider`, 'POST', "include", parameter)
            const response = await requestAwait.json()

            if (response.messageCode == 0000 || response.messageCode == null) {
                //NumPage = num;
                TotalData = response.total;
                GetNumPage(num);

                if (NumPage == 0) {
                    var htmlData = "";
                    $("#tbData > tbody").html("");
                    var no = 1;
                    if (response.total != 0) {
                        for (var i = 0; i < response.data.detail.length; i++) {
                            var obj = response.data.detail[i];

                            htmlData += "<tr>";
                            htmlData += "<td class='aligncenter'>" + obj.providerName + " (" + obj.provider + ")</td>";

                            var Amt = parseFloat(obj.turnover).toFixed(2);
                            htmlData += "<td class='alignright'>" + Amt.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                            htmlData += "<td class='alignright'>" + obj.count.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";

                            var Amt3 = parseFloat(obj.rtp).toFixed(2);
                            if (Amt3 < 0) {
                                htmlData += "<td class='alignright' style='color: red;'>" + Amt3.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "%</td>";
                            } else {
                                htmlData += "<td class='alignright'>" + Amt3.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "%</td>";
                            }

                            var Amt1 = parseFloat(obj.netWin).toFixed(2);
                            if (Amt1 < 0) {
                                htmlData += "<td class='alignright' style='color: red;'>" + Amt1.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                            }
                            else {
                                htmlData += "<td class='alignright'>" + Amt1.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                            }

                            var Amt5 = parseFloat(obj.netWinUser).toFixed(2);
                            if (Amt5 < 0) {
                                htmlData += "<td class='alignright txtRed'>" + Amt5.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                            }
                            else {
                                htmlData += "<td class='alignright'>" + Amt5.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                            }

                            var Amt4 = parseFloat(obj.netWinProvider).toFixed(2);
                            if (Amt4 < 0) {
                                htmlData += "<td class='alignright txtRed'>" + Amt4.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                            }
                            else {
                                htmlData += "<td class='alignright'>" + Amt4.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                            }

                            htmlData += "</tr>";
                            no++;
                        }
                        $("#tbData > tbody").append(htmlData);

                        var turnover = parseFloat(response.data.summary.turnover).toFixed(2);
                        var count = response.data.summary.count;

                        var rtp = parseFloat(response.data.summary.rtp).toFixed(2);
                        var netWin = parseFloat(response.data.summary.netWin).toFixed(2);
                        var netWinUser = parseFloat(response.data.summary.netWinUser).toFixed(2);
                        var netWinProvider = parseFloat(response.data.summary.netWinProvider).toFixed(2);

                        $("#totalValid").text(turnover.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,'));
                        $("#totalCount").text(count.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,'));
                        $("#totalRTP").text(rtp.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "%");
                        $("#totalNetwin").text(netWin.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,'));
                        $("#totalCom").text(netWinUser.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,'));
                        $("#totalPro").text(netWinProvider.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,'));

                        if (turnover < 0) {
                            document.getElementById("totalValid").style.color = "red";
                        } else {
                            document.getElementById("totalValid").style.color = "rgb(23, 23, 44)";
                        }

                        if (count < 0) {
                            document.getElementById("totalCount").style.color = "red";
                        } else {
                            document.getElementById("totalCount").style.color = "rgb(23, 23, 44)";
                        }

                        if (rtp < 0) {
                            document.getElementById("totalRTP").style.color = "red";
                        } else {
                            document.getElementById("totalRTP").style.color = "rgb(23, 23, 44)";
                        }

                        if (netWin < 0) {
                            document.getElementById("totalNetwin").style.color = "red";
                        } else {
                            document.getElementById("totalNetwin").style.color = "rgb(23, 23, 44)";
                        }

                        if (netWinUser < 0) {
                            document.getElementById("totalCom").style.color = "red";
                        } else {
                            document.getElementById("totalCom").style.color = "rgb(23, 23, 44)";
                        }

                        if (netWinProvider < 0) {
                            document.getElementById("totalPro").style.color = "red";
                        } else {
                            document.getElementById("totalPro").style.color = "rgb(23, 23, 44)";
                        }

                        SetLan(localStorage.getItem("Language"));
                        $("#myModalLoad").modal('hide');
                    }
                    else {
                        $("#totalValid").text("-");
                        $("#totalCount").text("-");
                        $("#totalRTP").text("-");
                        $("#totalNetwin").text("-");
                        $("#totalCom").text("-");
                        $("#totalPro").text("-");
                        document.getElementById("totalValid").style.color = "rgb(23, 23, 44)";
                        document.getElementById("totalCount").style.color = "rgb(23, 23, 44)";
                        document.getElementById("totalRTP").style.color = "rgb(23, 23, 44)";
                        document.getElementById("totalNetwin").style.color = "rgb(23, 23, 44)";
                        document.getElementById("totalCom").style.color = "rgb(23, 23, 44)";
                        document.getElementById("totalPro").style.color = "rgb(23, 23, 44)";

                        htmlData += "<tr>";
                        htmlData += "<td colspan='7' class='aligncenter' set-lan='text:No data.'></td>";
                        htmlData += "</tr>";

                        $("#tbData > tbody").append(htmlData);
                        SetLan(localStorage.getItem("Language"));
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

        const postGetTable = async (num) => {
            const parameter = {
                startDate: $("#startdate").val(),
                endDate: $("#todate").val(),
                startTime: $("#starttime").val() + ":00",
                endTime: $("#totime").val() + ":00",
                provider: $('#selProvider').val(),
                page: num,
                size: 100
            }
            const requestAwait = await fetchDataSite(`${apiURL}/v1/report/provider`, 'POST', "include", parameter)
            const response = await requestAwait.json()

            if (response.messageCode == 0000 || response.messageCode == null) {
                var htmlData = "";
                $("#tbData > tbody").html("");
                var no = 1;
                if (response.total != 0) {
                    for (var i = 0; i < response.data.detail.length; i++) {
                        var obj = response.data.detail[i];

                        htmlData += "<tr>";
                        htmlData += "<td class='aligncenter'>" + obj.providerName + " (" + obj.provider + ")</td>";

                        var Amt = parseFloat(obj.turnover).toFixed(2);
                        htmlData += "<td class='alignright'>" + Amt.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                        htmlData += "<td class='alignright'>" + obj.count.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";

                        var Amt3 = parseFloat(obj.rtp).toFixed(2);
                        if (Amt3 < 0) {
                            htmlData += "<td class='alignright' style='color: red;'>" + Amt3.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "%</td>";
                        } else {
                            htmlData += "<td class='alignright'>" + Amt3.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "%</td>";
                        }

                        var Amt1 = parseFloat(obj.netWin).toFixed(2);
                        if (Amt1 < 0) {
                            htmlData += "<td class='alignright' style='color: red;'>" + Amt1.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                        }
                        else {
                            htmlData += "<td class='alignright'>" + Amt1.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                        }

                        var Amt5 = parseFloat(obj.netWinUser).toFixed(2);
                        if (Amt5 < 0) {
                            htmlData += "<td class='alignright txtRed'>" + Amt5.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                        }
                        else {
                            htmlData += "<td class='alignright'>" + Amt5.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                        }

                        var Amt4 = parseFloat(obj.netWinProvider).toFixed(2);
                        if (Amt4 < 0) {
                            htmlData += "<td class='alignright txtRed'>" + Amt4.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                        }
                        else {
                            htmlData += "<td class='alignright'>" + Amt4.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                        }

                        htmlData += "</tr>";
                        no++;
                    }
                    $("#tbData > tbody").append(htmlData);

                    var turnover = parseFloat(response.data.summary.turnover).toFixed(2);
                    var count = response.data.summary.count;

                    var rtp = parseFloat(response.data.summary.rtp).toFixed(2);
                    var netWin = parseFloat(response.data.summary.netWin).toFixed(2);
                    var netWinUser = parseFloat(response.data.summary.netWinUser).toFixed(2);
                    var netWinProvider = parseFloat(response.data.summary.netWinProvider).toFixed(2);

                    $("#totalValid").text(turnover.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,'));
                    $("#totalCount").text(count.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,'));
                    $("#totalRTP").text(rtp.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "%");
                    $("#totalNetwin").text(netWin.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,'));
                    $("#totalCom").text(netWinUser.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,'));
                    $("#totalPro").text(netWinProvider.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,'));

                    if (turnover < 0) {
                        document.getElementById("totalValid").style.color = "red";
                    } else {
                        document.getElementById("totalValid").style.color = "rgb(23, 23, 44)";
                    }

                    if (count < 0) {
                        document.getElementById("totalCount").style.color = "red";
                    } else {
                        document.getElementById("totalCount").style.color = "rgb(23, 23, 44)";
                    }

                    if (rtp < 0) {
                        document.getElementById("totalRTP").style.color = "red";
                    } else {
                        document.getElementById("totalRTP").style.color = "rgb(23, 23, 44)";
                    }

                    if (netWin < 0) {
                        document.getElementById("totalNetwin").style.color = "red";
                    } else {
                        document.getElementById("totalNetwin").style.color = "rgb(23, 23, 44)";
                    }

                    if (netWinUser < 0) {
                        document.getElementById("totalCom").style.color = "red";
                    } else {
                        document.getElementById("totalCom").style.color = "rgb(23, 23, 44)";
                    }

                    if (netWinProvider < 0) {
                        document.getElementById("totalPro").style.color = "red";
                    } else {
                        document.getElementById("totalPro").style.color = "rgb(23, 23, 44)";
                    }

                    SetLan(localStorage.getItem("Language"));
                    $("#myModalLoad").modal('hide');
                }
                else {
                    $("#totalValid").text("-");
                    $("#totalCount").text("-");
                    $("#totalRTP").text("-");
                    $("#totalNetwin").text("-");
                    $("#totalCom").text("-");
                    $("#totalPro").text("-");
                    document.getElementById("totalValid").style.color = "rgb(23, 23, 44)";
                    document.getElementById("totalCount").style.color = "rgb(23, 23, 44)";
                    document.getElementById("totalRTP").style.color = "rgb(23, 23, 44)";
                    document.getElementById("totalNetwin").style.color = "rgb(23, 23, 44)";
                    document.getElementById("totalCom").style.color = "rgb(23, 23, 44)";
                    document.getElementById("totalPro").style.color = "rgb(23, 23, 44)";

                    htmlData += "<tr>";
                    htmlData += "<td colspan='7' class='aligncenter' set-lan='text:No data.'></td>";
                    htmlData += "</tr>";

                    $("#tbData > tbody").append(htmlData);
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

        const getProvider = async () => {
            const requestAwait = await fetchDataSite(`${apiURL}/v1/list/provider`, 'GET', "include", {})
            const response = await requestAwait.json()
            if (response.messageCode == 0000 || response.messageCode == null) {
                if (response.data.length != 0) {
                    var select = document.getElementById('selProvider');
                    for (var i = 0; i < response.data.length; i++) {
                        var opt = document.createElement('option');
                        opt.value = response.data[i].code;
                        opt.innerHTML = response.data[i].code;
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

