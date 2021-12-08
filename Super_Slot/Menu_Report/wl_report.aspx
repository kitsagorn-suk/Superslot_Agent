<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="wl_report.aspx.cs" Inherits="Pretty_Gaming.Menu_Report.wl_report" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .rgba-green-slight {
            background-color: rgb(70, 34, 14) !important;
        }

        .linkUser {
            cursor: pointer;
            width: 6.4em !important;
        }

        .table-striped > tbody > tr:nth-child(2n+1) > td, .table-striped > tbody > tr:nth-child(2n+1) > th {
            background-color: #f1f1f1;
        }
    </style>

    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="" set-lan="text:Report"></a></li>
            <li class="breadcrumb-item active txtMem" set-lan="text:W/L Report"></li>
        </ol>
    </nav>
    <div class="row">
        <div class="col-md-8">
            <h1 set-lan="text:W/L Report"></h1>
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
            <a onclick="btnExport();" id="btnExport" set-lan="title:Export Excel" title="Export Excel" style="display: initial; padding-left: 0.5rem;">
                <img src="../img/excel_logo.png" style="width: 37px; margin-left: .5rem; padding-top: 3px;"></a>
            <label id="txtExport" set-lan="text:ExportNote" style="font-size: 10pt; width: 185px; margin-left: .5rem; line-height: 1rem;"></label>
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

    <%-- <div class="table-wrapper" style="margin-top: 10px; margin-bottom: 10px; width: 100%; display: none;" id="tb">
    </div>
    <div style="margin-bottom: 10px; width: 100%; overflow: auto; height: 40em; /*display: none; */" id="tb2">
        <table class="table table-border tableMaxWidth table-striped" <%--style="table-layout: fixed;" id="tbData"></table>
    </div>--%>

    <%--Modal--%>
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
    <div class="modal fade" id="modalGetCommission" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header text-center">
                    <h4 class="modal-title w-100 font-weight-bold" set-lan="text:Comm"></h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body mx-3">
                    <div class="row">
                        <div class="form-group col-md-6" style="margin-bottom: 0px !important;">
                            <label for="email" class="col-9 col-form-label alignright" set-lan="text:Original Baccarat_"></label>
                            <label id="txtnormalBaccarat" class="col-2 col-form-label" style="word-break: inherit;"></label>
                        </div>
                        <div class="form-group col-md-6" style="margin-bottom: 0px !important;">
                            <label for="email" class="col-9 col-form-label alignright" set-lan="text:Super6 Baccarat_"></label>
                            <label id="txtsuper6Baccarat" class="col-2 col-form-label" style="word-break: inherit;"></label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group col-md-6" style="margin-bottom: 0px !important;">
                            <label for="email" class="col-9 col-form-label alignright" set-lan="text:Bacarrat 4 Point_"></label>
                            <label id="txtfourPointBaccarat" class="col-2 col-form-label" style="word-break: inherit;"></label>
                        </div>
                        <div class="form-group col-md-6" style="margin-bottom: 0px !important;">
                            <label for="email" class="col-9 col-form-label alignright" set-lan="text:Cow Cow_"></label>
                            <label id="txtcowCowBaccarat" class="col-2 col-form-label" style="word-break: inherit;"></label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group col-md-6" style="margin-bottom: 0px !important;">
                            <label for="email" class="col-9 col-form-label alignright" set-lan="text:Dragon Tiger_"></label>
                            <label id="txtdragonTiger" class="col-2 col-form-label" style="word-break: inherit;"></label>
                        </div>
                        <div class="form-group col-md-6" style="margin-bottom: 0px !important;">
                            <label for="email" class="col-9 col-form-label alignright" set-lan="text:Roulete_"></label>
                            <label id="txtroulette" class="col-2 col-form-label" style="word-break: inherit;"></label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group col-md-6" style="margin-bottom: 0px !important;">
                            <label for="email" class="col-9 col-form-label alignright" set-lan="text:Sicbo_"></label>
                            <label id="txtsicBo" class="col-2 col-form-label" style="word-break: inherit;"></label>
                        </div>
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
                    <button type="button" class="btn btn-yellow font-weight-bold" data-dismiss="modal" aria-label="Close">Close</button>
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

            GetDataTB("", "", "");
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

        function btnExport() {
            var arrBet = [];
            var targetDiv = document.querySelectorAll('.AA');
            for (var i = 0; i < targetDiv.length; i++) {
                arrBet.push(targetDiv[i].textContent);
            }

            var date = new Date();
            var dateSet = ("0" + date.getDate()).slice(-2) + "" + ("0" + (date.getMonth() + 1)).slice(-2) + "" + ("0" + date.getFullYear()).slice(-2) + "_" + ("0" + date.getHours()).slice(-2) + "" + ("0" + date.getMinutes()).slice(-2);
            var startDate = $("#startdate").val() + " " + $("#starttime").val();
            var toDate = $("#todate").val() + " " + $("#totime").val();

            if ("ActiveXObject" in window) {
                alert("Export excel is not support an internet explorer program.");
            } else {
                var cache = {};
                this.tmpl = function tmpl(str, data) {
                    var fn = !/\W/.test(str) ? cache[str] = cache[str] || tmpl(document.getElementById(str).innerHTML) :
                        new Function("obj",
                            "var p=[],print=function(){p.push.apply(p,arguments);};" +
                            "with(obj){p.push('" +
                            str.replace(/[\r\t\n]/g, " ")
                                .split("{{").join("\t")
                                .replace(/((^|}})[^\t]*)'/g, "$1\r")
                                .replace(/\t=(.*?)}}/g, "',$1,'")
                                .split("\t").join("');")
                                .split("}}").join("p.push('")
                                .split("\r").join("\\'") + "');}return p.join('');");
                    return data ? fn(data) : fn;
                };
                var txtTemp = "";
                if (arrBet.length == 1) {
                    txtTemp = '<html xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:x="urn:schemas-microsoft-com:office:excel" xmlns="http://www.w3.org/TR/REC-html40"><head><!--[if gte mso 9]><xml><x:ExcelWorkbook><x:ExcelWorksheets><x:ExcelWorksheet><x:Name>{{=worksheet}}</x:Name><x:WorksheetOptions><x:DisplayGridlines/></x:WorksheetOptions></x:ExcelWorksheet></x:ExcelWorksheets></x:ExcelWorkbook></xml><![endif]--></head><body><table><tr><td colspan="15" style="font-weight: bold; text-align: center;">Report W/L Report : ' + arrBet + '</td></tr><tr><td colspan="15" style="font-weight: bold; text-align: center;">Start date : ' + startDate + '&emsp;To date : ' + toDate + '</td></tr><tr><td colspan="15" style="font-weight: bold; text-align: center;"</td></tr></table>{{for(var i=0; i<tables.length;i++){ }}<table>{{=tables[i]}}</table>{{ } }}</body></html>';
                }
                else {
                    txtTemp = '<html xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:x="urn:schemas-microsoft-com:office:excel" xmlns="http://www.w3.org/TR/REC-html40"><head><!--[if gte mso 9]><xml><x:ExcelWorkbook><x:ExcelWorksheets><x:ExcelWorksheet><x:Name>{{=worksheet}}</x:Name><x:WorksheetOptions><x:DisplayGridlines/></x:WorksheetOptions></x:ExcelWorksheet></x:ExcelWorksheets></x:ExcelWorkbook></xml><![endif]--></head><body><table><tr><td colspan="15" style="font-weight: bold; text-align: center;">Report W/L Report : ' + arrBet + '</td></tr><tr><td colspan="15" style="font-weight: bold; text-align: center;">Start date : ' + startDate + '&emsp;To date : ' + toDate + '</td></tr><tr><td colspan="15" style="font-weight: bold; text-align: center;"></td></tr></table>{{for(var i=0; i<tables.length;i++){ }}<table>{{=tables[i]}}</table>{{ } }}</body></html>';
                }
                var tableToExcel = (function () {
                    var uri = 'data:application/vnd.ms-excel;base64,',
                        template = txtTemp;
                    base64 = function (s) {
                        return window.btoa(unescape(encodeURIComponent(s)));
                    },
                        format = function (s, c) {
                            return s.replace(/{(\w+)}/g, function (m, p) {
                                return c[p];
                            });
                        };
                    return function (tableList, name) {
                        if (!tableList.length > 0 && !tableList[0].nodeType) table = document.getElementById(table);
                        var tables = [];
                        for (var i = 0; i < tableList.length; i++) {
                            tables.push(tableList[i].innerHTML);
                        }
                        var ctx = {
                            worksheet: name || 'Worksheet',
                            tables: tables
                        };
                        var a = document.createElement('a');
                        a.href = uri + base64(tmpl(template, ctx));
                        a.download = 'Report_WL_Report_' + dateSet + '.xls';
                        a.click();
                    };
                })();
                tableToExcel(document.getElementsByTagName("table"), "W/L Report");
            }
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
            //GetDataTB("", "", "");
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
            //GetDataTB("", "", "");
            Search_Click();
        }

        function Search_Click() {
            var username = "";
            if ($("#searchLoginname").val() != "") {
                username = $("#searchLoginname").val();
                postSearch(username);
            }
            else {
                GetDataTB('', '', '');
            }
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

        var NumPage = 0;
        var TotalData;
        function GetData(status, itemID, Menu, username) {
            $("#myModalLoad").modal();
            var ID = itemID;

            //if (NumPage == null) {
            //    NumPage = 1;
            //}

            if (status == 1) {
                postData(status, NumPage, ID, "", username);
            }
            else if (status == 2) {
                postData(status, NumPage, ID, "", username);
            }
            else if (status == 3) {
                postData(status, NumPage, ID, "", username);
            }
            else if (status == 4) {     //start->Provider//end->Date
                postData(status, NumPage, ID, Menu, username);
            }
            else if (status == 5) {     //ID->tran
                postData(status, NumPage, ID, Menu, "");
            }

        }

        function GetNumPage(status, num, itemID, Menu, username) {
            $(function () {
                (function (name) {
                    var container = $('#pagination-' + name);
                    container.pagination({
                        totalNumber: TotalData,
                        pageNumber: num,
                        pageSize: 100,
                        //dataSource: 'https://api.flickr.com/services/feeds/photos_public.gne?tags=cat&tagmode=any&format=json&jsoncallback=?',
                        dataSource: '/json/DataSource.json',
                        locator: 'items',
                        callback: function (response, pagination) {
                            num = container.pagination('getSelectedPageNum');
                            if (NumPage != 0) {
                                if (status == 1) {
                                    postList(num, itemID, username);
                                }
                                else if (status == 2) {
                                    postTable(itemID, num, username);
                                }
                                else if (status == 3) {
                                    postTableMember(itemID, num);
                                }
                                else if (status == 4) {     ////start->Provider//end->Date
                                    postTableGame(itemID, num, Menu, username);
                                }
                                else if (status == 5) {     ////itemID->tran
                                    postTableDetail(itemID, num, Menu);
                                }
                            }
                            NumPage = num;
                        }
                    });
                })('demo2');
            });
        }

        function GetDataTB(itemID, num, username) {
            NumPage = 0;
            GetData('1', itemID, "", username);
        }

        function GetDataTable1(itemID, num, username) {
            NumPage = 0;
            $("#myModalLoad").modal();
            $("#tbData > tbody , #navMenu").html("");
            GetData('2', itemID, "", username);
        }

        function GetDataTableMember(itemID, num) {
            NumPage = 0;
            $("#myModalLoad").modal();
            $("#tbData > tbody , #navMenu").html("");
            GetData('3', itemID, "", "");
        }

        function GetDataTableGame(itemID, num, Menu, username) {
            NumPage = 0;
            $("#myModalLoad").modal();
            $("#tbData > tbody , #navMenu").html("");
            GetData('4', itemID, Menu, username);
        }

        function GetDataTableDetail(tran, Menu) {
            NumPage = 0;
            GetData('5', tran, Menu, "");
        }

        function sumHeadTable() {
            var colCount = 0;
            $('tr:nth-child(1) td').each(function () {
                if ($(this).attr('colspan')) {
                    colCount += +$(this).attr('colspan');
                } else {
                    colCount++;
                }
            });
            colCount = colCount / 2;
            return colCount;
        }

        const postSearch = async (username) => {
            const parameter = {
                username: username
            }
            const requestAwait = await fetchDataSite(`${apiURL}/v1/report/win_lose/find_by_username`, 'POST', "include", parameter)
            const response = await requestAwait.json()

            if (response.messageCode == 0000 || response.messageCode == null) {
                console.log(response.data.position);
                if (response.data.position == "AGENT") {
                    //GetDataTB(response.data.id, "", "");
                    GetDataTB("", "", username);
                }
                if (response.data.position == "MEMBER") {
                    GetDataTableGame(response.data.id, "", "", username);
                }
            }
            else if (response.messageCode == 1102) {
                document.getElementById("lbAlert").setAttribute("set-lan", "text:missing 'Username' field");
                $("#myModalLoad").modal('hide');
                $('#modalAlert').modal('show');
            }
            else if (response.messageCode == 1300) {
                document.getElementById("lbAlert").setAttribute("set-lan", "text:User Not Found");
                $("#myModalLoad").modal('hide');
                $('#modalAlert').modal('show');
            }
            else if (response.messageCode == 8004) {
                document.getElementById('lbAlert').innerHTML = response.messageDescription;
                $("#myModalLoad").modal('hide');
                $('#modalAlert').modal('show');
                window.location.href = "/Login.aspx";
            }
            SetLan(localStorage.getItem("Language"));
        }

        const postData = async (status, num, tbID, menu, username) => {
            if (num == 0) {
                num = num + 1;
            }

            var URL;
            var parameter = {};
            if (status == 1 || status == 2) {
                URL = `${apiURL}/v1/report/win_lose_agent`;
                parameter = {
                    startDate: $("#startdate").val(),
                    startTime: $("#starttime").val() + ":00",
                    endDate: $("#todate").val(),
                    endTime: $("#totime").val() + ":00",
                    parentID: tbID,
                    username: username,
                    page: num,
                    size: 100
                }
            }
            else if (status == 3) {
                URL = `${apiURL}/v1/report/win_lose_member`;
                parameter = {
                    startDate: $("#startdate").val(),
                    startTime: $("#starttime").val() + ":00",
                    endDate: $("#todate").val(),
                    endTime: $("#totime").val() + ":00",
                    userID: tbID,
                    page: num,
                    size: 100
                }
            }
            else if (status == 4) {     //start->Provider//end->Date
                URL = `${apiURL}/v1/report/trans_in_out`;
                parameter = {
                    startDate: $("#startdate").val(),
                    startTime: $("#starttime").val() + ":00",
                    endDate: $("#todate").val(),
                    endTime: $("#totime").val() + ":00",
                    userID: tbID,
                    page: num,
                    size: 100
                }
            }
            else if (status == 5) {    //tbID->tran
                URL = `${apiURL}/v1/report/bet_history`;
                parameter = {
                    transactionMapping: parseInt(tbID),
                    page: num,
                    size: 100
                }
            }

            const requestAwait = await fetchDataSite(URL, 'POST', "include", parameter)
            const response = await requestAwait.json()
            if (response.messageCode == 0000 || response.messageCode == null) {
                //NumPage = num;
                TotalData = response.total;
                GetNumPage(status, num, tbID, menu, username);

                if (NumPage == 0) {
                    if (status == 1) {
                        $("#navMenu , #tbData").html("");
                        ////$("#tb2").css('display', 'flex');
                        $("#tb").css('display', 'none');
                        $('#btnExport ,#txtExport').css('display', 'initial');

                        if (response.data.parentList.length != 0) {
                            var AA = "";
                            var Menu = [];
                            for (var i = 0; i < response.data.parentList.length; i++) {
                                var Position = response.data.parentList[i].position;
                                if (AA == "") {
                                    if (Position == "MEMBER") {
                                        AA += "<a class='linkNav AA' onclick='GetDataTableGame(`" + response.data.parentList[i].id + "`," + num + ",``,`" + response.data.parentList[i].username + "`)'>" + response.data.parentList[i].username + "</a>";
                                        Menu.push("GetDataTableGame|" + response.data.parentList[i].id + "|" + num + "||" + response.data.parentList[i].username);
                                    }
                                    else {
                                        AA += "<a class='linkNav AA' onclick='GetDataTB(`" + response.data.parentList[i].id + "`," + num + ")'>" + response.data.parentList[i].username + "</a>";
                                        Menu.push("GetDataTB|" + response.data.parentList[i].id + "|" + num + "|" + response.data.parentList[i].username);
                                    }
                                }
                                else {
                                    if (Position == "MEMBER") {
                                        AA += " / <a class='linkNav AA' onclick='GetDataTableGame(`" + response.data.parentList[i].id + "`," + num + ",``,`" + response.data.parentList[i].username + "`)'>" + response.data.parentList[i].username + "</a>";
                                        Menu.push("GetDataTableGame|" + response.data.parentList[i].id + "|" + num + "||" + response.data.parentList[i].username);
                                    }
                                    else {
                                        AA += " / <a class='linkNav AA' onclick='GetDataTable1(`" + response.data.parentList[i].id + "`," + num + ")'>" + response.data.parentList[i].username + "</a>";
                                        Menu.push("GetDataTable1|" + response.data.parentList[i].id + "|" + num + "|" + response.data.parentList[i].username);
                                    }
                                }
                            }
                            $("#navMenu").append(AA);
                            $("#navMenu > a:last-child").css("text-decoration", "underline");
                        }

                        var Posi = localStorage.getItem("Position");
                        var Usertype = localStorage.getItem("UserType");

                        var htmlAll = "";
                        var htmlHead = "";
                        var htmlData = "";
                        var htmlFoot = "";

                        htmlHead += "<thead class='rgba-green-slight'>";
                        htmlHead += "<tr>";
                        htmlHead += "<th rowspan='2' class='align-middle' style='width: 2.5%; color: #f1ca34; background-color: rgb(70, 34, 14); border-right: 1px #ced4da solid;' set-lan='text:No'></th>";
                        htmlHead += "<th rowspan='2' class='align-middle' style='width: 7.5%; left: 2%; text-align: left; padding-left: 5px; color: #f1ca34; background-color: rgb(70, 34, 14); border: 1px #ced4da solid' set-lan='text:Username'></th>";
                        htmlHead += "<th rowspan='2' class='align-middle' style='width: 7.5%; left: 2%; text-align: left; padding-left: 5px; color: #f1ca34; background-color: rgb(70, 34, 14); border: 1px #ced4da solid' set-lan='text:Nickname'></th>";
                        htmlHead += "<th rowspan='2' class='align-middle' style='width: 7.5%; left: 2%; color: #f1ca34; background-color: rgb(70, 34, 14); border: 1px #ced4da solid' set-lan='text:Level'></th>";
                        htmlHead += "<th rowspan='2' class='align-middle' style='width: 9%; left: 8%; text-align: right; padding-right: 5px; color: #f1ca34; background-color: rgb(70, 34, 14); border: 1px #ced4da solid' set-lan='text:Valid turn'></th>";

                        var house = -(parseFloat(response.data.summary.winLose / parseFloat(response.data.summary.validTurnover)) * 100);
                        house = parseFloat(house).toFixed(2);
                        htmlHead += "<th rowspan='2' class='align-middle' style='width: 8%; left: 3%; text-align: right; padding-right: 5px; color: #f1ca34; background-color: rgb(70, 34, 14); border: 1px #ced4da solid'><label style='margin-bottom: 0rem;' set-lan='text:Member W/L'></label><br/><label>&nbsp;(100%)</label><br/><label style='margin-bottom: 0rem;' set-lan='text:House Edge'></label><br/>";

                        if (response.total > 0) {
                            if (house < 0) {
                                htmlHead += "<label style='color: red !important;'>&nbsp;(" + house + "%)</label></th>";
                            }
                            else {
                                htmlHead += "<label>&nbsp;(" + house + "%)</label></th>";
                            }
                        } else {
                            htmlHead += "<label>&nbsp;(%)</label></th>";
                        }

                        htmlHead += "<th colspan='3' style='color: #f1ca34; left: 9%; background-color: rgb(70, 34, 14); border: 1px #ced4da solid;' set-lan='text:Member'></th>";

                        if (Posi == "AMB") {
                            htmlHead += "<th colspan='3' style='left: 0 !important; color: #f1ca34; background-color: rgb(70, 34, 14); border: 1px #ced4da solid;' set-lan='text:AMB'></th>";
                            htmlHead += "<th colspan='3' style='left: 0 !important; color: #f1ca34; background-color: rgb(70, 34, 14); border: 1px #ced4da solid;' set-lan='text:Provider'></th>";
                        }
                        else if (Posi == "COMPANY" && Usertype == "main") {
                            htmlHead += "<th colspan='3' style='left: 0 !important; color: #f1ca34; background-color: rgb(70, 34, 14); border: 1px #ced4da solid;' set-lan='text:Company'></th>";
                            htmlHead += "<th colspan='3' style='left: 0 !important; color: #f1ca34; background-color: rgb(70, 34, 14); border: 1px #ced4da solid;' set-lan='text:AMB'></th>";
                        }
                        else {
                            htmlHead += "<th colspan='3' style='left: 0 !important; color: #f1ca34; background-color: rgb(70, 34, 14); border: 1px #ced4da solid;' set-lan='text:Agent'></th>";
                            htmlHead += "<th colspan='3' style='left: 0 !important; color: #f1ca34; background-color: rgb(70, 34, 14); border: 1px #ced4da solid;' set-lan='text:Company'></th>";
                        }

                        htmlHead += "</tr>";
                        htmlHead += "<tr>";
                        htmlHead += "<th style='left: 0 !important; color: #f1ca34; background-color: rgb(70, 34, 14); border: 1px #ced4da solid; text-align: right; padding-right: 5px;' set-lan='text:Win lose'></th>";
                        htmlHead += "<th style='left: 0 !important; color: #f1ca34; background-color: rgb(70, 34, 14); border: 1px #ced4da solid; text-align: right; padding-right: 5px;' set-lan='text:Comm'></th>";
                        htmlHead += "<th style='left: 0 !important; color: #f1ca34; background-color: rgb(70, 34, 14); border: 1px #ced4da solid; text-align: right; padding-right: 5px;' set-lan='text:Total-'></th>";
                        htmlHead += "<th style='left: 0 !important; color: #f1ca34; background-color: rgb(70, 34, 14); border: 1px #ced4da solid; text-align: right; padding-right: 5px;' set-lan='text:Win lose'></th>";
                        htmlHead += "<th style='left: 0 !important; color: #f1ca34; background-color: rgb(70, 34, 14); border: 1px #ced4da solid; text-align: right; padding-right: 5px;' set-lan='text:Comm'></th>";
                        htmlHead += "<th style='left: 0 !important; color: #f1ca34; background-color: rgb(70, 34, 14); border: 1px #ced4da solid; text-align: right; padding-right: 5px;' set-lan='text:Total-'></th>";
                        htmlHead += "<th style='left: 0 !important; color: #f1ca34; background-color: rgb(70, 34, 14); border: 1px #ced4da solid; text-align: right; padding-right: 5px;' set-lan='text:Win lose'></th>";
                        htmlHead += "<th style='left: 0 !important; color: #f1ca34; background-color: rgb(70, 34, 14); border: 1px #ced4da solid; text-align: right; padding-right: 5px;' set-lan='text:Comm'></th>";
                        htmlHead += "<th style='left: 0 !important; color: #f1ca34; background-color: rgb(70, 34, 14); border: 1px #ced4da solid; text-align: right; padding-right: 5px;' set-lan='text:Total-'></th>";
                        htmlHead += "</tr>";
                        htmlHead += "</thead>";
                        htmlHead += "<tbody style=''>";

                        htmlFoot += "</tbody>";
                        htmlFoot += "<tfoot class='rgba-yellow-slight'>";
                        htmlFoot += "<tr class='total'>";
                        htmlFoot += "<td style='font-weight: bold; background-color: #f2e8be; border-right: 1px #ced4da solid; width: 2.5%;'></td>";
                        htmlFoot += "<td style='font-weight: bold; background-color: #f2e8be; border-right: 1px #ced4da solid; width: 7.5%; left: 2%;'></td>";
                        htmlFoot += "<td style='font-weight: bold; background-color: #f2e8be; border-right: 1px #ced4da solid; width: 7.5%; left: 2%;'></td>";
                        htmlFoot += "<td set-lan='text:Total' style='font-weight: bold; background-color: #f2e8be; border-right: 1px #ced4da solid; width: 7.5%; left: 2%;'></td>";
                        htmlFoot += "<td id='totalValid' style='font-weight: bold; background-color: #f2e8be; border-right: 1px #ced4da solid; width: 9%; left: 8%;'>-</td>";
                        htmlFoot += "<td id='totalWL' style='font-weight: bold; background-color: #f2e8be; border-right: 1px #ced4da solid; width: 9%; left: 8%;'>-</td>";
                        htmlFoot += "<td id='totalPU_Win' style='font-weight: bold; background-color: #f2e8be; border-right: 1px #ced4da solid; left: 9%;'>-</td>";
                        htmlFoot += "<td id='totalPU_Com' style='font-weight: bold; background-color: #f2e8be; border-right: 1px #ced4da solid; left: 0;'>-</td>";
                        htmlFoot += "<td id='totalPU_Total' style='font-weight: bold; background-color: #f2e8be; border-right: 1px #ced4da solid; left: 0;'>-</td>";
                        htmlFoot += "<td id='totalU_Win' style='font-weight: bold; background-color: #f2e8be; border-right: 1px #ced4da solid; left: 0;'>-</td>";
                        htmlFoot += "<td id='totalU_Com' style='font-weight: bold; background-color: #f2e8be; border-right: 1px #ced4da solid; left: 0;'>-</td>";
                        htmlFoot += "<td id='totalU_Total' style='font-weight: bold; background-color: #f2e8be; border-right: 1px #ced4da solid; left: 0;'>-</td>";
                        htmlFoot += "<td id='totalNU_Win' style='font-weight: bold; background-color: #f2e8be; border-right: 1px #ced4da solid; left: 0;'>-</td>";
                        htmlFoot += "<td id='totalNU_Com' style='font-weight: bold; background-color: #f2e8be; border-right: 1px #ced4da solid; left: 0;'>-</td>";
                        htmlFoot += "<td id='totalNU_Total' style='font-weight: bold; background-color: #f2e8be; border-right: 1px #ced4da solid; left: 0;'>-</td>";
                        htmlFoot += "</tr>";
                        htmlFoot += "</tfoot>";

                        if (response.total > 0) {
                            var no = 1;
                            var Position = "";
                            var Total = 0;

                            for (var i = 0; i < response.data.detail.length; i++) {
                                htmlData += "<tr>";
                                htmlData += "<td class='aligncenter' style='width: 2.5%;'>" + (((num - 1) * 100) + no) + "</td>";

                                if (response.data.detail[i].position == "MEMBER") {
                                    htmlData += "<td style='width: 7.5%; left: 2%;'><p onclick='GetDataTableGame(`" + response.data.detail[i].userID + "`,`" + num + "`,`" + Menu + "`,`" + response.data.detail[i].username + "`)' class='linkNav overflow ellipsis linkUser' title='" + response.data.detail[i].username + "'>" + response.data.detail[i].username + "</p></td>";
                                }
                                else {
                                    htmlData += "<td style='width: 7.5%; left: 2%;'><p onclick='GetDataTable1(`" + response.data.detail[i].userID + "`," + num + ",``)' class='linkNav overflow ellipsis linkUser' title='" + response.data.detail[i].username + "'>" + response.data.detail[i].username + "</p></td>";
                                }

                                if (response.data.detail[i].position == "SH_HOLDER") {
                                    Position = "Shareholder";
                                }
                                else {
                                    var txt = response.data.detail[i].position;
                                    var txt2 = txt.toLowerCase();
                                    Position = capitalizeFirstLetter(txt2);
                                }
                                htmlData += "<td style='width: 7.5%; left: 2%;'><p class='overflow ellipsis' title='" + response.data.detail[i].nickname + "'>" + response.data.detail[i].nickname + "</p></td>";
                                htmlData += "<td class='aligncenter' set-lan='text:" + Position + "' style='width: 7.5%; left: 2%;'></td>";

                                // >> validTurnover << //
                                var Amt2 = parseFloat(response.data.detail[i].validTurnover).toFixed(2);
                                var n2 = Amt2.indexOf("-");
                                if (n2 == 0) {
                                    htmlData += "<td class='alignright' style='color: red; width: 9%; left: 8%;'>" + response.data.detail[i].validTurnover.toFixed(2).toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                }
                                else {
                                    htmlData += "<td class='alignright' style='width: 9%; left: 8%;'>" + response.data.detail[i].validTurnover.toFixed(2).toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                }

                                // >> winLose << //
                                var AmtWinLose = parseFloat(response.data.detail[i].winLose).toFixed(2);
                                var nWinLose = AmtWinLose.indexOf("-");
                                if (nWinLose == 0) {
                                    htmlData += "<td class='alignright' style='color: red; width: 9%; left: 8%;'>" + response.data.detail[i].winLose.toFixed(2).toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                }
                                else {
                                    htmlData += "<td class='alignright' style='width: 9%; left: 8%;'>" + response.data.detail[i].winLose.toFixed(2).toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                }

                                // >> previousUser << //
                                var AmtP1 = parseFloat(response.data.detail[i].previousUser.winLose).toFixed(2);
                                var nP1 = AmtP1.indexOf("-");
                                if (nP1 == 0) {
                                    htmlData += "<td class='alignright' style='color: red; background-color: #fff9e06b; left: 0 !important;'>" + response.data.detail[i].previousUser.winLose.toFixed(2).toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                }
                                else {
                                    htmlData += "<td class='alignright' style='background-color: #fff9e06b; left: 0 !important;'>" + response.data.detail[i].previousUser.winLose.toFixed(2).toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                }

                                var AmtP2 = parseFloat(response.data.detail[i].previousUser.com).toFixed(2);
                                var nP2 = AmtP2.indexOf("-");
                                if (nP2 == 0) {
                                    htmlData += "<td class='alignright' style='color: red; background-color: #fff9e06b; left: 0 !important;'>" + response.data.detail[i].previousUser.com.toFixed(2).toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                }
                                else {
                                    htmlData += "<td class='alignright' style='background-color: #fff9e06b; left: 0 !important;'>" + response.data.detail[i].previousUser.com.toFixed(2).toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                }

                                var AmtP3 = parseFloat(response.data.detail[i].previousUser.total).toFixed(2);
                                var nP3 = AmtP3.indexOf("-");
                                if (nP3 == 0) {
                                    htmlData += "<td class='alignright' style='color: red; background-color: #fff9e06b; left: 0 !important;'>" + response.data.detail[i].previousUser.total.toFixed(2).toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                }
                                else {
                                    htmlData += "<td class='alignright' style='background-color: #fff9e06b; left: 0 !important;'>" + response.data.detail[i].previousUser.total.toFixed(2).toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                }

                                // >> User << //
                                var AmtU1 = parseFloat(response.data.detail[i].user.winLose).toFixed(2);
                                var nU1 = AmtU1.indexOf("-");
                                if (nU1 == 0) {
                                    htmlData += "<td class='alignright' style='color: red; background-color: #fcea9e75; left: 0 !important;'>" + response.data.detail[i].user.winLose.toFixed(2).toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                }
                                else {
                                    htmlData += "<td class='alignright' style='background-color: #fcea9e75; left: 0 !important;'>" + response.data.detail[i].user.winLose.toFixed(2).toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                }

                                var AmtU2 = parseFloat(response.data.detail[i].user.com).toFixed(2);
                                var nU2 = AmtU2.indexOf("-");
                                if (nU2 == 0) {
                                    htmlData += "<td class='alignright' style='color: red; background-color: #fcea9e75; left: 0 !important;'>" + response.data.detail[i].user.com.toFixed(2).toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                }
                                else {
                                    htmlData += "<td class='alignright' style='background-color: #fcea9e75; left: 0 !important;'>" + response.data.detail[i].user.com.toFixed(2).toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                }

                                var AmtU3 = parseFloat(response.data.detail[i].user.total).toFixed(2);
                                var nU3 = AmtU3.indexOf("-");
                                if (nU3 == 0) {
                                    htmlData += "<td class='alignright' style='color: red; background-color: #fcea9e75; left: 0 !important;'>" + response.data.detail[i].user.total.toFixed(2).toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                }
                                else {
                                    htmlData += "<td class='alignright' style='background-color: #fcea9e75; left: 0 !important;'>" + response.data.detail[i].user.total.toFixed(2).toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                }

                                // >> nextUser << //
                                var AmtN1 = parseFloat(response.data.detail[i].nextUser.winLose).toFixed(2);
                                var nN1 = AmtN1.indexOf("-");
                                if (nN1 == 0) {
                                    htmlData += "<td class='alignright' style='color: red; background-color: #ffd06373; left: 0 !important;'>" + response.data.detail[i].nextUser.winLose.toFixed(2).toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                }
                                else {
                                    htmlData += "<td class='alignright' style='background-color: #ffd06373; left: 0 !important;'>" + response.data.detail[i].nextUser.winLose.toFixed(2).toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                }

                                var AmtN2 = parseFloat(response.data.detail[i].nextUser.com).toFixed(2);
                                var nN2 = AmtN2.indexOf("-");
                                if (nN2 == 0) {
                                    htmlData += "<td class='alignright' style='color: red; background-color: #ffd06373; left: 0 !important;'>" + response.data.detail[i].nextUser.com.toFixed(2).toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                }
                                else {
                                    htmlData += "<td class='alignright' style='background-color: #ffd06373; left: 0 !important;'>" + response.data.detail[i].nextUser.com.toFixed(2).toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                }

                                var AmtN3 = parseFloat(response.data.detail[i].nextUser.total).toFixed(2);
                                var nN3 = AmtN3.indexOf("-");
                                if (nN3 == 0) {
                                    htmlData += "<td class='alignright' style='color: red; background-color: #ffd06373; left: 0 !important;'>" + response.data.detail[i].nextUser.total.toFixed(2).toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                }
                                else {
                                    htmlData += "<td class='alignright' style='background-color: #ffd06373; left: 0 !important;'>" + response.data.detail[i].nextUser.total.toFixed(2).toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                }

                                htmlData += "</tr>";
                                Total = Total + response.data.detail[i].credit;
                                no++;
                            }

                            htmlAll = htmlHead + htmlData + htmlFoot;
                            $("#tbData").append(htmlAll);

                            SetLan(localStorage.getItem("Language"));
                            ////$("#tb2").css('display', 'flex');
                            $("#tb").css('display', 'none');


                            $("#totalValid").text(response.data.summary.validTurnover.toFixed(2).toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,'));
                            $("#totalWL").text(response.data.summary.winLose.toFixed(2).toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,'));

                            $("#totalU_Win").text(response.data.summary.user.winLose.toFixed(2).toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,'));
                            $("#totalU_Com").text(response.data.summary.user.com.toFixed(2).toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,'));
                            $("#totalU_Total").text(response.data.summary.user.total.toFixed(2).toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,'));

                            $("#totalPU_Win").text(response.data.summary.previousUser.winLose.toFixed(2).toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,'));
                            $("#totalPU_Com").text(response.data.summary.previousUser.com.toFixed(2).toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,'));
                            $("#totalPU_Total").text(response.data.summary.previousUser.total.toFixed(2).toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,'));

                            $("#totalNU_Win").text(response.data.summary.nextUser.winLose.toFixed(2).toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,'));
                            $("#totalNU_Com").text(response.data.summary.nextUser.com.toFixed(2).toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,'));
                            $("#totalNU_Total").text(response.data.summary.nextUser.total.toFixed(2).toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,'));

                            var A2 = parseFloat(response.data.summary.validTurnover).toFixed(2);
                            var n2 = A2.indexOf("-");
                            if (n2 == 0) {
                                document.getElementById("totalValid").style.color = "red";
                            }
                            else {
                                document.getElementById("totalValid").style.color = "rgb(23, 23, 44)";
                            }

                            var AWL = parseFloat(response.data.summary.winLose).toFixed(2);
                            var nWL = AWL.indexOf("-");
                            if (nWL == 0) {
                                document.getElementById("totalWL").style.color = "red";
                            }
                            else {
                                document.getElementById("totalWL").style.color = "rgb(23, 23, 44)";
                            }

                            var A11 = parseFloat(response.data.summary.user.winLose).toFixed(2);
                            var n11 = A11.indexOf("-");
                            if (n11 == 0) {
                                document.getElementById("totalU_Win").style.color = "red";
                            }
                            else {
                                document.getElementById("totalU_Win").style.color = "rgb(23, 23, 44)";
                            }

                            var A12 = parseFloat(response.data.summary.user.com).toFixed(2);
                            var n12 = A12.indexOf("-");
                            if (n12 == 0) {
                                document.getElementById("totalU_Com").style.color = "red";
                            }
                            else {
                                document.getElementById("totalU_Com").style.color = "rgb(23, 23, 44)";
                            }

                            var A13 = parseFloat(response.data.summary.user.total).toFixed(2);
                            var n13 = A13.indexOf("-");
                            if (n13 == 0) {
                                document.getElementById("totalU_Total").style.color = "red";
                            }
                            else {
                                document.getElementById("totalU_Total").style.color = "rgb(23, 23, 44)";
                            }

                            var A21 = parseFloat(response.data.summary.previousUser.winLose).toFixed(2);
                            var n21 = A21.indexOf("-");
                            if (n21 == 0) {
                                document.getElementById("totalPU_Win").style.color = "red";
                            }
                            else {
                                document.getElementById("totalPU_Win").style.color = "rgb(23, 23, 44)";
                            }

                            var A22 = parseFloat(response.data.summary.previousUser.com).toFixed(2);
                            var n22 = A22.indexOf("-");
                            if (n22 == 0) {
                                document.getElementById("totalPU_Com").style.color = "red";
                            }
                            else {
                                document.getElementById("totalPU_Com").style.color = "rgb(23, 23, 44)";
                            }

                            var A23 = parseFloat(response.data.summary.previousUser.total).toFixed(2);
                            var n23 = A23.indexOf("-");
                            if (n23 == 0) {
                                document.getElementById("totalPU_Total").style.color = "red";
                            }
                            else {
                                document.getElementById("totalPU_Total").style.color = "rgb(23, 23, 44)";
                            }

                            var A31 = parseFloat(response.data.summary.nextUser.winLose).toFixed(2);
                            var n31 = A31.indexOf("-");
                            if (n31 == 0) {
                                document.getElementById("totalNU_Win").style.color = "red";
                            }
                            else {
                                document.getElementById("totalNU_Win").style.color = "rgb(23, 23, 44)";
                            }

                            var A32 = parseFloat(response.data.summary.nextUser.com).toFixed(2);
                            var n32 = A32.indexOf("-");
                            if (n32 == 0) {
                                document.getElementById("totalNU_Com").style.color = "red";
                            }
                            else {
                                document.getElementById("totalNU_Com").style.color = "rgb(23, 23, 44)";
                            }

                            var A33 = parseFloat(response.data.summary.nextUser.total).toFixed(2);
                            var n33 = A33.indexOf("-");
                            if (n33 == 0) {
                                document.getElementById("totalNU_Total").style.color = "red";
                            }
                            else {
                                document.getElementById("totalNU_Total").style.color = "rgb(23, 23, 44)";
                            }
                        }
                        else {
                            htmlData += "<tr><td colspan='15' style='text-align: center;' set-lan='text:No data.'></td></tr>";
                            htmlAll = htmlHead + htmlData + htmlFoot;
                            $("#tbData").append(htmlAll);
                            $("#totalValid").text("-");
                            $("#totalWL").text("-");

                            $("#totalU_Win").text("-");
                            $("#totalU_Com").text("-");
                            $("#totalU_Total").text("-");

                            $("#totalPU_Win").text("-");
                            $("#totalPU_Com").text("-");
                            $("#totalPU_Total").text("-");

                            $("#totalNU_Win").text("-");
                            $("#totalNU_Com").text("-");
                            $("#totalNU_Total").text("-");
                        }

                        SetLan(localStorage.getItem("Language"));
                        $("#myModalLoad").modal('hide');
                    }
                    else if (status == 2) {
                        $("#navMenu , #tbData").html("");
                        ////$("#tb2").css('display', 'flex');
                        $("#tb").css('display', 'none');
                        $('#btnExport ,#txtExport').css('display', 'initial');

                        if (response.data.parentList.length != 0) {
                            var AA = "";
                            var Menu = [];
                            for (var i = 0; i < response.data.parentList.length; i++) {
                                var Position = response.data.parentList[i].position;
                                if (AA == "") {
                                    if (Position == "MEMBER") {
                                        AA += "<a class='linkNav AA' onclick='GetDataTableGame(`" + response.data.parentList[i].id + "`," + num + ",``,`" + response.data.parentList[i].username + "`)'>" + response.data.parentList[i].username + "</a>";
                                        Menu.push("GetDataTableGame|" + response.data.parentList[i].id + "|" + num + "||" + response.data.parentList[i].username);
                                    }
                                    else {
                                        AA += "<a class='linkNav AA' onclick='GetDataTB(`" + response.data.parentList[i].id + "`," + num + ")'>" + response.data.parentList[i].username + "</a>";
                                        Menu.push("GetDataTB|" + response.data.parentList[i].id + "|" + num + "|" + response.data.parentList[i].username);
                                    }
                                }
                                else {
                                    if (Position == "MEMBER") {
                                        AA += " / <a class='linkNav AA' onclick='GetDataTableGame(`" + response.data.parentList[i].id + "`," + num + ",``,`" + response.data.parentList[i].username + "`)'>" + response.data.parentList[i].username + "</a>";
                                        Menu.push("GetDataTableGame|" + response.data.parentList[i].id + "|" + num + "||" + response.data.parentList[i].username);
                                    }
                                    else {
                                        AA += " / <a class='linkNav AA' onclick='GetDataTable1(`" + response.data.parentList[i].id + "`," + num + ")'>" + response.data.parentList[i].username + "</a>";
                                        Menu.push("GetDataTable1|" + response.data.parentList[i].id + "|" + num + "|" + response.data.parentList[i].username);
                                    }
                                }
                            }
                            $("#navMenu").append(AA);
                            $("#navMenu > a:last-child").css("text-decoration", "underline");
                        }

                        var htmlAll = "";
                        var htmlHead = "";
                        var htmlData = "";
                        var htmlFoot = "";

                        htmlHead += "<thead class='rgba-green-slight'>";
                        htmlHead += "<tr>";
                        htmlHead += "<th rowspan='2' class='align-middle' style='width: 2.5%; color: #f1ca34; background-color: rgb(70, 34, 14); border: 1px #ced4da solid;' set-lan='text:No'></th>";
                        htmlHead += "<th rowspan='2' class='align-middle' style='width: 7.5%; left: 2%; text-align: left; padding-left: 5px; color: #f1ca34; background-color: rgb(70, 34, 14); border: 1px #ced4da solid;' set-lan='text:Username'></th>";
                        htmlHead += "<th rowspan='2' class='align-middle' style='width: 7.5%; left: 2%; text-align: left; padding-left: 5px; color: #f1ca34; background-color: rgb(70, 34, 14); border: 1px #ced4da solid;' set-lan='text:Nickname'></th>";
                        htmlHead += "<th rowspan='2' class='align-middle' style='width: 7.5%; left: 2%; color: #f1ca34; background-color: rgb(70, 34, 14); border: 1px #ced4da solid;' set-lan='text:Level'></th>";
                        htmlHead += "<th rowspan='2' class='align-middle' style='width: 9%; left: 8%; text-align: right; padding-right: 5px; color: #f1ca34; background-color: rgb(70, 34, 14); border: 1px #ced4da solid;' set-lan='text:Valid turn'></th>";

                        var house = -(parseFloat(response.data.summary.winLose / parseFloat(response.data.summary.validTurnover)) * 100);
                        house = parseFloat(house).toFixed(2);
                        htmlHead += "<th rowspan='2' class='align-middle' style='width: 8%; left: 3%; text-align: right; padding-right: 5px; color: #f1ca34; background-color: rgb(70, 34, 14); border: 1px #ced4da solid'><label style='margin-bottom: 0rem;' set-lan='text:Member W/L'></label><br/><label>&nbsp;(100%)</label><br/><label style='margin-bottom: 0rem;' set-lan='text:House Edge'></label><br/>";
                        if (response.total > 0) {
                            if (house < 0) {
                                htmlHead += "<label style='color: red !important;'>&nbsp;(" + house + "%)</label></th>";
                            }
                            else {
                                htmlHead += "<label>&nbsp;(" + house + "%)</label></th>";
                            }
                        } else {
                            htmlHead += "<label>&nbsp;(%)</label></th>";
                        }

                        htmlHead += "<th colspan='3' set-lan='text:Member' style='left: 0 !important; color: #f1ca34; background-color: rgb(70, 34, 14); border: 1px #ced4da solid;'></th>";
                        htmlHead += "<th colspan='3' set-lan='text:Agent' style='left: 0 !important; color: #f1ca34; background-color: rgb(70, 34, 14); border: 1px #ced4da solid;'></th>";
                        htmlHead += "<th colspan='3' set-lan='text:Company' style='left: 0 !important; color: #f1ca34; background-color: rgb(70, 34, 14); border: 1px #ced4da solid;'></th>";
                        htmlHead += "</tr>";
                        htmlHead += "<tr>";
                        htmlHead += "<th style='left: 0 !important; width: 5%; color: #f1ca34; background-color: rgb(70, 34, 14); border: 1px #ced4da solid; text-align: right; padding-right: 5px;' set-lan='text:Win lose'></th>";
                        htmlHead += "<th style='left: 0 !important; width: 5%; color: #f1ca34; background-color: rgb(70, 34, 14); border: 1px #ced4da solid; text-align: right; padding-right: 5px;' set-lan='text:Comm'></th>";
                        htmlHead += "<th style='left: 0 !important; width: 5%; color: #f1ca34; background-color: rgb(70, 34, 14); border: 1px #ced4da solid; text-align: right; padding-right: 5px;' set-lan='text:Total-'></th>";
                        htmlHead += "<th style='left: 0 !important; width: 5%; color: #f1ca34; background-color: rgb(70, 34, 14); border: 1px #ced4da solid; text-align: right; padding-right: 5px;' set-lan='text:Win lose'></th>";
                        htmlHead += "<th style='left: 0 !important; width: 5%; color: #f1ca34; background-color: rgb(70, 34, 14); border: 1px #ced4da solid; text-align: right; padding-right: 5px;' set-lan='text:Comm'></th>";
                        htmlHead += "<th style='left: 0 !important; width: 5%; color: #f1ca34; background-color: rgb(70, 34, 14); border: 1px #ced4da solid; text-align: right; padding-right: 5px;' set-lan='text:Total-'></th>";
                        htmlHead += "<th style='left: 0 !important; width: 5%; color: #f1ca34; background-color: rgb(70, 34, 14); border: 1px #ced4da solid; text-align: right; padding-right: 5px;' set-lan='text:Win lose'></th>";
                        htmlHead += "<th style='left: 0 !important; width: 5%; color: #f1ca34; background-color: rgb(70, 34, 14); border: 1px #ced4da solid; text-align: right; padding-right: 5px;' set-lan='text:Comm'></th>";
                        htmlHead += "<th style='left: 0 !important; width: 5%; color: #f1ca34; background-color: rgb(70, 34, 14); border: 1px #ced4da solid; text-align: right; padding-right: 5px;' set-lan='text:Total-'></th>";
                        htmlHead += "</tr>";
                        htmlHead += "</thead>";
                        htmlHead += "<tbody>";

                        htmlFoot += "</tbody>";
                        htmlFoot += "<tfoot class='rgba-yellow-slight'>";
                        htmlFoot += "<tr class='total'>";
                        htmlFoot += "<td style='font-weight: bold; background-color: #f2e8be; border-right: 1px #ced4da solid; width: 2.5%;'></td>";
                        htmlFoot += "<td style='font-weight: bold; background-color: #f2e8be; border-right: 1px #ced4da solid; width: 7.5%; left: 2%;'></td>";
                        htmlFoot += "<td style='font-weight: bold; background-color: #f2e8be; border-right: 1px #ced4da solid; width: 7.5%; left: 2%;'></td>";
                        htmlFoot += "<td set-lan='text:Total' style='font-weight: bold; background-color: #f2e8be; border-right: 1px #ced4da solid; width: 9.5%; left: 2%;'></td>";
                        htmlFoot += "<td id='totalValid' style='font-weight: bold; background-color: #f2e8be; border-right: 1px #ced4da solid; width: 9%; left: 8%;'>-</td>";
                        htmlFoot += "<td id='totalWL' style='font-weight: bold; background-color: #f2e8be; border-right: 1px #ced4da solid; width: 9%; left: 8%;'>-</td>";
                        htmlFoot += "<td id='totalPU_Win' style='font-weight: bold; background-color: #f2e8be; border-right: 1px #ced4da solid; left: 9%;'>-</td>";
                        htmlFoot += "<td id='totalPU_Com' style='font-weight: bold; background-color: #f2e8be; border-right: 1px #ced4da solid; left: 0;'>-</td>";
                        htmlFoot += "<td id='totalPU_Total' style='font-weight: bold; background-color: #f2e8be; border-right: 1px #ced4da solid; left: 0;'>-</td>";
                        htmlFoot += "<td id='totalU_Win' style='font-weight: bold; background-color: #f2e8be; border-right: 1px #ced4da solid; left: 0;'>-</td>";
                        htmlFoot += "<td id='totalU_Com' style='font-weight: bold; background-color: #f2e8be; border-right: 1px #ced4da solid; left: 0;'>-</td>";
                        htmlFoot += "<td id='totalU_Total' style='font-weight: bold; background-color: #f2e8be; border-right: 1px #ced4da solid; left: 0;'>-</td>";
                        htmlFoot += "<td id='totalNU_Win' style='font-weight: bold; background-color: #f2e8be; border-right: 1px #ced4da solid; left: 0;'>-</td>";
                        htmlFoot += "<td id='totalNU_Com' style='font-weight: bold; background-color: #f2e8be; border-right: 1px #ced4da solid; left: 0;'>-</td>";
                        htmlFoot += "<td id='totalNU_Total' style='font-weight: bold; background-color: #f2e8be; border-right: 1px #ced4da solid; left: 0;'>-</td>";
                        htmlFoot += "</tr>";
                        htmlFoot += "</tfoot>";

                        if (response.total > 0) {
                            var no = 1;
                            var Position = "";
                            var Total = 0;

                            for (var i = 0; i < response.data.detail.length; i++) {
                                htmlData += "<tr>";
                                htmlData += "<td class='aligncenter' style='width: 2.5%;'>" + (((num - 1) * 100) + no) + "</td>";

                                if (response.data.detail[i].position == "MEMBER") {
                                    htmlData += "<td style='width: 7.5%; left: 1%;'><p onclick='GetDataTableGame(`" + response.data.detail[i].userID + "`,`" + num + "`,`" + Menu + "`,`" + response.data.detail[i].username + "`)' class='linkNav overflow ellipsis linkUser' title='" + response.data.detail[i].username + "'>" + response.data.detail[i].username + "</p></td>";
                                }
                                else {
                                    htmlData += "<td style='width: 7.5%; left: 1%;'><p onclick='GetDataTable1(`" + response.data.detail[i].userID + "`,`" + num + "`,``)' class='linkNav overflow ellipsis linkUser' title='" + response.data.detail[i].username + "'>" + response.data.detail[i].username + "</p></td>";
                                }

                                if (response.data.detail[i].position == "SH_HOLDER") {
                                    Position = "Shareholder";
                                }
                                else {
                                    var txt = response.data.detail[i].position;
                                    var txt2 = txt.toLowerCase();
                                    Position = capitalizeFirstLetter(txt2);
                                }
                                htmlData += "<td style='width: 7.5%; left: 2%;'><p class='overflow ellipsis' title='" + response.data.detail[i].nickname + "'>" + response.data.detail[i].nickname + "</p></td>";
                                htmlData += "<td class='aligncenter' set-lan='text:" + Position + "' style='width: 7.5%; left: 2%;'></td>";

                                // >> validTurnover << //
                                var Amt2 = parseFloat(response.data.detail[i].validTurnover).toFixed(2);
                                var n2 = Amt2.indexOf("-");
                                if (n2 == 0) {
                                    htmlData += "<td class='alignright' style='color: red; width: 9%; left: 8%;'>" + response.data.detail[i].validTurnover.toFixed(2).toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                }
                                else {
                                    htmlData += "<td class='alignright' style='width: 9%; left: 8%;'>" + response.data.detail[i].validTurnover.toFixed(2).toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                }

                                // >> winLose << //
                                var AmtWinLose = parseFloat(response.data.detail[i].winLose).toFixed(2);
                                var nWinLose = AmtWinLose.indexOf("-");
                                if (nWinLose == 0) {
                                    htmlData += "<td class='alignright' style='color: red; width: 9%; left: 8%;'>" + response.data.detail[i].winLose.toFixed(2).toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                }
                                else {
                                    htmlData += "<td class='alignright' style='width: 9%; left: 8%;'>" + response.data.detail[i].winLose.toFixed(2).toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                }

                                // >> previousUser << //
                                var AmtP1 = parseFloat(response.data.detail[i].previousUser.winLose).toFixed(2);
                                var nP1 = AmtP1.indexOf("-");
                                if (nP1 == 0) {
                                    htmlData += "<td class='alignright' style='color: red; background-color: #fff9e06b; left: 0 !important;'>" + response.data.detail[i].previousUser.winLose.toFixed(2).toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                }
                                else {
                                    htmlData += "<td class='alignright' style='background-color: #fff9e06b; left: 0 !important;'>" + response.data.detail[i].previousUser.winLose.toFixed(2).toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                }

                                var AmtP2 = parseFloat(response.data.detail[i].previousUser.com).toFixed(2);
                                var nP2 = AmtP2.indexOf("-");
                                if (nP2 == 0) {
                                    htmlData += "<td class='alignright' style='color: red; background-color: #fff9e06b; left: 0 !important;'>" + response.data.detail[i].previousUser.com.toFixed(2).toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                }
                                else {
                                    htmlData += "<td class='alignright' style='background-color: #fff9e06b; left: 0 !important;'>" + response.data.detail[i].previousUser.com.toFixed(2).toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                }

                                var AmtP3 = parseFloat(response.data.detail[i].previousUser.total).toFixed(2);
                                var nP3 = AmtP3.indexOf("-");
                                if (nP3 == 0) {
                                    htmlData += "<td class='alignright' style='color: red; background-color: #fff9e06b; left: 0 !important;'>" + response.data.detail[i].previousUser.total.toFixed(2).toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                }
                                else {
                                    htmlData += "<td class='alignright' style='background-color: #fff9e06b; left: 0 !important;'>" + response.data.detail[i].previousUser.total.toFixed(2).toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                }

                                // >> User << //
                                var AmtU1 = parseFloat(response.data.detail[i].user.winLose).toFixed(2);
                                var nU1 = AmtU1.indexOf("-");
                                if (nU1 == 0) {
                                    htmlData += "<td class='alignright' style='color: red; background-color: #fcea9e75; left: 0 !important;'>" + response.data.detail[i].user.winLose.toFixed(2).toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                }
                                else {
                                    htmlData += "<td class='alignright' style='background-color: #fcea9e75; left: 0 !important;'>" + response.data.detail[i].user.winLose.toFixed(2).toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                }

                                var AmtU2 = parseFloat(response.data.detail[i].user.com).toFixed(2);
                                var nU2 = AmtU2.indexOf("-");
                                if (nU2 == 0) {
                                    htmlData += "<td class='alignright' style='color: red; background-color: #fcea9e75; left: 0 !important;'>" + response.data.detail[i].user.com.toFixed(2).toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                }
                                else {
                                    htmlData += "<td class='alignright' style='background-color: #fcea9e75; left: 0 !important;'>" + response.data.detail[i].user.com.toFixed(2).toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                }

                                var AmtU3 = parseFloat(response.data.detail[i].user.total).toFixed(2);
                                var nU3 = AmtU3.indexOf("-");
                                if (nU3 == 0) {
                                    htmlData += "<td class='alignright' style='color: red; background-color: #fcea9e75; left: 0 !important;'>" + response.data.detail[i].user.total.toFixed(2).toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                }
                                else {
                                    htmlData += "<td class='alignright' style='background-color: #fcea9e75; left: 0 !important;'>" + response.data.detail[i].user.total.toFixed(2).toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                }

                                // >> nextUser << //
                                var AmtN1 = parseFloat(response.data.detail[i].nextUser.winLose).toFixed(2);
                                var nN1 = AmtN1.indexOf("-");
                                if (nN1 == 0) {
                                    htmlData += "<td class='alignright' style='color: red; background-color: #ffd06373; left: 0 !important;'>" + response.data.detail[i].nextUser.winLose.toFixed(2).toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                }
                                else {
                                    htmlData += "<td class='alignright' style='background-color: #ffd06373; left: 0 !important;'>" + response.data.detail[i].nextUser.winLose.toFixed(2).toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                }

                                var AmtN2 = parseFloat(response.data.detail[i].nextUser.com).toFixed(2);
                                var nN2 = AmtN2.indexOf("-");
                                if (nN2 == 0) {
                                    htmlData += "<td class='alignright' style='color: red; background-color: #ffd06373; left: 0 !important;'>" + response.data.detail[i].nextUser.com.toFixed(2).toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                }
                                else {
                                    htmlData += "<td class='alignright' style='background-color: #ffd06373; left: 0 !important;'>" + response.data.detail[i].nextUser.com.toFixed(2).toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                }

                                var AmtN3 = parseFloat(response.data.detail[i].nextUser.total).toFixed(2);
                                var nN3 = AmtN3.indexOf("-");
                                if (nN3 == 0) {
                                    htmlData += "<td class='alignright' style='color: red; background-color: #ffd06373; left: 0 !important;'>" + response.data.detail[i].nextUser.total.toFixed(2).toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                }
                                else {
                                    htmlData += "<td class='alignright' style='background-color: #ffd06373; left: 0 !important;'>" + response.data.detail[i].nextUser.total.toFixed(2).toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                }

                                htmlData += "</tr>";
                                Total = Total + response.data.detail[i].credit;
                                no++;
                            }

                            htmlAll = htmlHead + htmlData + htmlFoot;
                            $("#tbData").append(htmlAll);
                            SetLan(localStorage.getItem("Language"));
                            ////$("#tb2").css('display', 'flex');
                            $("#tb").css('display', 'none');


                            $("#totalValid").text(response.data.summary.validTurnover.toFixed(2).toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,'));
                            $("#totalWL").text(response.data.summary.winLose.toFixed(2).toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,'));

                            $("#totalU_Win").text(response.data.summary.user.winLose.toFixed(2).toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,'));
                            $("#totalU_Com").text(response.data.summary.user.com.toFixed(2).toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,'));
                            $("#totalU_Total").text(response.data.summary.user.total.toFixed(2).toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,'));

                            $("#totalPU_Win").text(response.data.summary.previousUser.winLose.toFixed(2).toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,'));
                            $("#totalPU_Com").text(response.data.summary.previousUser.com.toFixed(2).toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,'));
                            $("#totalPU_Total").text(response.data.summary.previousUser.total.toFixed(2).toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,'));

                            $("#totalNU_Win").text(response.data.summary.nextUser.winLose.toFixed(2).toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,'));
                            $("#totalNU_Com").text(response.data.summary.nextUser.com.toFixed(2).toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,'));
                            $("#totalNU_Total").text(response.data.summary.nextUser.total.toFixed(2).toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,'));

                            var A2 = parseFloat(response.data.summary.validTurnover).toFixed(2);
                            var n2 = A2.indexOf("-");
                            if (n2 == 0) {
                                document.getElementById("totalValid").style.color = "red";
                            }
                            else {
                                document.getElementById("totalValid").style.color = "rgb(23, 23, 44)";
                            }

                            var AWL = parseFloat(response.data.summary.winLose).toFixed(2);
                            var nWL = AWL.indexOf("-");
                            if (nWL == 0) {
                                document.getElementById("totalWL").style.color = "red";
                            }
                            else {
                                document.getElementById("totalWL").style.color = "rgb(23, 23, 44)";
                            }

                            var A11 = parseFloat(response.data.summary.user.winLose).toFixed(2);
                            var n11 = A11.indexOf("-");
                            if (n11 == 0) {
                                document.getElementById("totalU_Win").style.color = "red";
                            }
                            else {
                                document.getElementById("totalU_Win").style.color = "rgb(23, 23, 44)";
                            }

                            var A12 = parseFloat(response.data.summary.user.com).toFixed(2);
                            var n12 = A12.indexOf("-");
                            if (n12 == 0) {
                                document.getElementById("totalU_Com").style.color = "red";
                            }
                            else {
                                document.getElementById("totalU_Com").style.color = "rgb(23, 23, 44)";
                            }

                            var A13 = parseFloat(response.data.summary.user.total).toFixed(2);
                            var n13 = A13.indexOf("-");
                            if (n13 == 0) {
                                document.getElementById("totalU_Total").style.color = "red";
                            }
                            else {
                                document.getElementById("totalU_Total").style.color = "rgb(23, 23, 44)";
                            }

                            var A21 = parseFloat(response.data.summary.previousUser.winLose).toFixed(2);
                            var n21 = A21.indexOf("-");
                            if (n21 == 0) {
                                document.getElementById("totalPU_Win").style.color = "red";
                            }
                            else {
                                document.getElementById("totalPU_Win").style.color = "rgb(23, 23, 44)";
                            }

                            var A22 = parseFloat(response.data.summary.previousUser.com).toFixed(2);
                            var n22 = A22.indexOf("-");
                            if (n22 == 0) {
                                document.getElementById("totalPU_Com").style.color = "red";
                            }
                            else {
                                document.getElementById("totalPU_Com").style.color = "rgb(23, 23, 44)";
                            }

                            var A23 = parseFloat(response.data.summary.previousUser.total).toFixed(2);
                            var n23 = A23.indexOf("-");
                            if (n23 == 0) {
                                document.getElementById("totalPU_Total").style.color = "red";
                            }
                            else {
                                document.getElementById("totalPU_Total").style.color = "rgb(23, 23, 44)";
                            }

                            var A31 = parseFloat(response.data.summary.nextUser.winLose).toFixed(2);
                            var n31 = A31.indexOf("-");
                            if (n31 == 0) {
                                document.getElementById("totalNU_Win").style.color = "red";
                            }
                            else {
                                document.getElementById("totalNU_Win").style.color = "rgb(23, 23, 44)";
                            }

                            var A32 = parseFloat(response.data.summary.nextUser.com).toFixed(2);
                            var n32 = A32.indexOf("-");
                            if (n32 == 0) {
                                document.getElementById("totalNU_Com").style.color = "red";
                            }
                            else {
                                document.getElementById("totalNU_Com").style.color = "rgb(23, 23, 44)";
                            }

                            var A33 = parseFloat(response.data.summary.nextUser.total).toFixed(2);
                            var n33 = A33.indexOf("-");
                            if (n33 == 0) {
                                document.getElementById("totalNU_Total").style.color = "red";
                            }
                            else {
                                document.getElementById("totalNU_Total").style.color = "rgb(23, 23, 44)";
                            }
                        }
                        else {
                            htmlData += "<tr><td colspan='15' style='text-align: center;' set-lan='text:No data.'></td></tr>";
                            htmlAll = htmlHead + htmlData + htmlFoot;
                            $("#tbData").append(htmlAll);

                            $("#totalValid").text("-");
                            $("#totalWL").text("-");

                            $("#totalU_Win").text("-");
                            $("#totalU_Com").text("-");
                            $("#totalU_Total").text("-");

                            $("#totalPU_Win").text("-");
                            $("#totalPU_Com").text("-");
                            $("#totalPU_Total").text("-");

                            $("#totalNU_Win").text("-");
                            $("#totalNU_Com").text("-");
                            $("#totalNU_Total").text("-");
                        }

                        SetLan(localStorage.getItem("Language"));
                        $("#myModalLoad").modal('hide');
                    }
                    else if (status == 3) {
                        $("#navMenu , #tbData").html("");
                        ////$("#tb2").css('display', 'flex');
                        $("#tb").css('display', 'none');
                        $('#btnExport ,#txtExport').css('display', 'initial');

                        var AA = "";
                        var Menu = [];
                        if (response.data.parentList.length != 0) {
                            for (var i = 0; i < response.data.parentList.length; i++) {
                                var Position = response.data.parentList[i].position;
                                if (AA == "") {
                                    if (Position == "MEMBER") {
                                        AA += "<a class='linkNav AA' onclick='GetDataTableGame(`" + response.data.parentList[i].id + "`," + num + ",``,`" + response.data.parentList[i].username + "`)'>" + response.data.parentList[i].username + "</a>";
                                        Menu.push("GetDataTableGame|" + response.data.parentList[i].id + "|" + num + "||" + response.data.parentList[i].username);
                                    }
                                    else {
                                        AA += "<a class='linkNav AA' onclick='GetDataTB(`" + response.data.parentList[i].id + "`," + num + ")'>" + response.data.parentList[i].username + "</a>";
                                        Menu.push("GetDataTB|" + response.data.parentList[i].id + "|" + num + "|" + response.data.parentList[i].username);
                                    }
                                }
                                else {
                                    if (Position == "MEMBER") {
                                        AA += " / <a class='linkNav AA' onclick='GetDataTableGame(`" + response.data.parentList[i].id + "`," + num + ",``,`" + response.data.parentList[i].username + "`)'>" + response.data.parentList[i].username + "</a>";
                                        Menu.push("GetDataTableGame|" + response.data.parentList[i].id + "|" + num + "||" + response.data.parentList[i].username);
                                    }
                                    else {
                                        AA += " / <a class='linkNav AA' onclick='GetDataTable1(`" + response.data.parentList[i].id + "`," + num + ")'>" + response.data.parentList[i].username + "</a>";
                                        Menu.push("GetDataTable1|" + response.data.parentList[i].id + "|" + num + "|" + response.data.parentList[i].username);
                                    }
                                }
                            }
                            $("#navMenu").append(AA);
                            $("#navMenu > a:last-child").css("text-decoration", "underline");
                        }

                        var htmlAll = "";
                        var htmlHead = "";
                        var htmlData = "";
                        var htmlFoot = "";
                        htmlHead += "<thead class='rgba-green-slight'>";
                        htmlHead += "<tr>";
                        htmlHead += "<th rowspan='2' class='align-middle' style='width: 7%; color: #f1ca34; background-color: rgb(70, 34, 14); border: 1px #ced4da solid;' set-lan='text:Date'></th>";
                        htmlHead += "<th rowspan='2' class='align-middle' style='width: 7%; left: 7%; color: #f1ca34; background-color: rgb(70, 34, 14); border: 1px #ced4da solid;' set-lan='text:Provider'></th>";
                        htmlHead += "<th rowspan='2' class='align-middle' style='width: 7%; left: 7%; color: #f1ca34; background-color: rgb(70, 34, 14); border: 1px #ced4da solid;' set-lan='text:Count'></th>";
                        htmlHead += "<th rowspan='2' class='align-middle' style='width: 10%; left: 7%; text-align: right; padding-right: 5px; color: #f1ca34; background-color: rgb(70, 34, 14); border: 1px #ced4da solid;' set-lan='text:Valid turn'></th>";
                        htmlHead += "<th colspan='3' set-lan='text:Member' style='left: 0%; color: #f1ca34; background-color: rgb(70, 34, 14); border: 1px #ced4da solid;'></th>";
                        htmlHead += "<th colspan='3' set-lan='text:Agent' style='left: 0%; color: #f1ca34; background-color: rgb(70, 34, 14); border: 1px #ced4da solid;'></th>";
                        htmlHead += "<th colspan='3' set-lan='text:Company' style='left: 0%; color: #f1ca34; background-color: rgb(70, 34, 14); border: 1px #ced4da solid;'></th>";
                        htmlHead += "</tr>";
                        htmlHead += "<tr>";
                        htmlHead += "<th style='left: 0%; width: 5%; color: #f1ca34; background-color: rgb(70, 34, 14); border: 1px #ced4da solid; text-align: right; padding-right: 5px;' set-lan='text:Win lose'></th>";
                        htmlHead += "<th style='left: 0%; width: 5%; color: #f1ca34; background-color: rgb(70, 34, 14); border: 1px #ced4da solid; text-align: right; padding-right: 5px;' set-lan='text:Comm'></th>";
                        htmlHead += "<th style='left: 0%; width: 5%; color: #f1ca34; background-color: rgb(70, 34, 14); border: 1px #ced4da solid; text-align: right; padding-right: 5px;' set-lan='text:Total-'></th>";
                        htmlHead += "<th style='left: 0%; width: 5%; color: #f1ca34; background-color: rgb(70, 34, 14); border: 1px #ced4da solid; text-align: right; padding-right: 5px;' set-lan='text:Win lose'></th>";
                        htmlHead += "<th style='left: 0%; width: 5%; color: #f1ca34; background-color: rgb(70, 34, 14); border: 1px #ced4da solid; text-align: right; padding-right: 5px;' set-lan='text:Comm'></th>";
                        htmlHead += "<th style='left: 0%; width: 5%; color: #f1ca34; background-color: rgb(70, 34, 14); border: 1px #ced4da solid; text-align: right; padding-right: 5px;' set-lan='text:Total-'></th>";
                        htmlHead += "<th style='left: 0%; width: 5%; color: #f1ca34; background-color: rgb(70, 34, 14); border: 1px #ced4da solid; text-align: right; padding-right: 5px;' set-lan='text:Win lose'></th>";
                        htmlHead += "<th style='left: 0%; width: 5%; color: #f1ca34; background-color: rgb(70, 34, 14); border: 1px #ced4da solid; text-align: right; padding-right: 5px;' set-lan='text:Comm'></th>";
                        htmlHead += "<th style='left: 0%; width: 5%; color: #f1ca34; background-color: rgb(70, 34, 14); border: 1px #ced4da solid; text-align: right; padding-right: 5px;' set-lan='text:Total-'></th>";
                        htmlHead += "</tr>";
                        htmlHead += "</thead>";
                        htmlHead += "<tbody>";

                        htmlFoot += "</tbody>";
                        htmlFoot += "<tfoot class='rgba-yellow-slight'>";
                        htmlFoot += "<tr class='total'>";
                        htmlFoot += "<td style='font-weight: bold; background-color: #f2e8be; border-right: 1px #ced4da solid; width: 7%;'></td>";
                        htmlFoot += "<td style='font-weight: bold; background-color: #f2e8be; border-right: 1px #ced4da solid; width: 7%; left: 7%;'></td>";
                        htmlFoot += "<td style='font-weight: bold; background-color: #f2e8be; border-right: 1px #ced4da solid; width: 7%; left: 7%;' set-lan='text:Total'></td>";
                        htmlFoot += "<td style='font-weight: bold; background-color: #f2e8be; border-right: 1px #ced4da solid; width: 10%; left: 7%;' id='totalValid'>-</td>";
                        htmlFoot += "<td style='font-weight: bold; background-color: #f2e8be; border-right: 1px #ced4da solid; left: 0 !important;' id='totalPU_Win'>-</td>";
                        htmlFoot += "<td style='font-weight: bold; background-color: #f2e8be; border-right: 1px #ced4da solid; left: 0 !important;' id='totalPU_Com'>-</td>";
                        htmlFoot += "<td style='font-weight: bold; background-color: #f2e8be; border-right: 1px #ced4da solid; left: 0 !important;' id='totalPU_Total'>-</td>";
                        htmlFoot += "<td style='font-weight: bold; background-color: #f2e8be; border-right: 1px #ced4da solid; left: 0 !important;' id='totalU_Win'>-</td>";
                        htmlFoot += "<td style='font-weight: bold; background-color: #f2e8be; border-right: 1px #ced4da solid; left: 0 !important;' id='totalU_Com'>-</td>";
                        htmlFoot += "<td style='font-weight: bold; background-color: #f2e8be; border-right: 1px #ced4da solid; left: 0 !important;' id='totalU_Total'>-</td>";
                        htmlFoot += "<td style='font-weight: bold; background-color: #f2e8be; border-right: 1px #ced4da solid; left: 0 !important;' id='totalNU_Win'>-</td>";
                        htmlFoot += "<td style='font-weight: bold; background-color: #f2e8be; border-right: 1px #ced4da solid; left: 0 !important;' id='totalNU_Com'>-</td>";
                        htmlFoot += "<td style='font-weight: bold; background-color: #f2e8be; border-right: 1px #ced4da solid; left: 0 !important;' id='totalNU_Total'>-</td>";
                        htmlFoot += "</tr>";
                        htmlFoot += "</tfoot>";

                        if (response.total > 0) {
                            for (var i = 0; i < response.data.groupByDate.length; i++) {
                                htmlData += "<tr>";
                                //htmlData += "<td style='width: 7%;' class='aligncenter align-middle' rowspan='" + response.data.groupByDate[i].detail.length + "'>" + response.data.groupByDate[i].date + "</td>";

                                for (var j = 0; j < response.data.groupByDate[i].detail.length; j++) {
                                    var Date = response.data.groupByDate[i].date;
                                    var d = Date.split('-')[2];
                                    var m = Date.split('-')[1];
                                    var y = Date.split('-')[0];
                                    Date = d + "/" + m + "/" + y;

                                    htmlData += "<td style='width: 7%;' class='aligncenter align-middle'>" + Date + "</td>";
                                    htmlData += "<td style='width: 7%; left: 7%;'><p onclick='GetDataTableGame(`" + response.data.groupByDate[i].detail[j].provider + "`,`" + response.data.groupByDate[i].date + "`,`" + tbID + "`,`" + Menu + "`)' class='linkNav overflow ellipsis linkUser' title='" + response.data.groupByDate[i].detail[j].provider + "'>" + response.data.groupByDate[i].detail[j].provider + "</p></td>";
                                    htmlData += "<td style='width: 7%; left: 7%;' class='aligncenter'>" + response.data.groupByDate[i].detail[j].count + "</td>";

                                    //// >> turnover << //
                                    //var Amt1 = parseFloat(response.data.groupByDate[i].detail[j].turnover).toFixed(2);
                                    //var n1 = Amt1.indexOf("-");
                                    //if (n1 == 0) {
                                    //    htmlData += "<td class='alignright' style='color: red;'>" + response.data.groupByDate[i].detail[j].turnover.toFixed(2).toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                    //}
                                    //else {
                                    //    htmlData += "<td class='alignright'>" + response.data.groupByDate[i].detail[j].turnover.toFixed(2).toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                    //}

                                    // >> validTurnover << //
                                    var Amt2 = parseFloat(response.data.groupByDate[i].detail[j].validTurnover).toFixed(2);
                                    var n2 = Amt2.indexOf("-");
                                    if (n2 == 0) {
                                        htmlData += "<td class='alignright' style='color: red; width: 10%; left: 7%;'>" + response.data.groupByDate[i].detail[j].validTurnover.toFixed(2).toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                    }
                                    else {
                                        htmlData += "<td class='alignright' style='width: 10%; left: 7%;'>" + response.data.groupByDate[i].detail[j].validTurnover.toFixed(2).toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                    }

                                    // >> previousUser << //
                                    var AmtP1 = parseFloat(response.data.groupByDate[i].detail[j].previousUser.winLose).toFixed(2);
                                    var nP1 = AmtP1.indexOf("-");
                                    if (nP1 == 0) {
                                        htmlData += "<td class='alignright' style='left: 0%; color: red; background-color: #fff9e06b;'>" + response.data.groupByDate[i].detail[j].previousUser.winLose.toFixed(2).toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                    }
                                    else {
                                        htmlData += "<td class='alignright' style='left: 0%; background-color: #fff9e06b;'>" + response.data.groupByDate[i].detail[j].previousUser.winLose.toFixed(2).toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                    }

                                    var AmtP2 = parseFloat(response.data.groupByDate[i].detail[j].previousUser.com).toFixed(2);
                                    var nP2 = AmtP2.indexOf("-");
                                    if (nP2 == 0) {
                                        htmlData += "<td class='alignright' style='left: 0%; color: red; background-color: #fff9e06b;'>" + response.data.groupByDate[i].detail[j].previousUser.com.toFixed(2).toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                    }
                                    else {
                                        htmlData += "<td class='alignright' style='left: 0%; background-color: #fff9e06b;'>" + response.data.groupByDate[i].detail[j].previousUser.com.toFixed(2).toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                    }

                                    var AmtP3 = parseFloat(response.data.groupByDate[i].detail[j].previousUser.total).toFixed(2);
                                    var nP3 = AmtP3.indexOf("-");
                                    if (nP3 == 0) {
                                        htmlData += "<td class='alignright' style='left: 0%; color: red; background-color: #fff9e06b;'>" + response.data.groupByDate[i].detail[j].previousUser.total.toFixed(2).toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                    }
                                    else {
                                        htmlData += "<td class='alignright' style='left: 0%; background-color: #fff9e06b;'>" + response.data.groupByDate[i].detail[j].previousUser.total.toFixed(2).toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                    }

                                    // >> User << //
                                    var AmtU1 = parseFloat(response.data.groupByDate[i].detail[j].user.winLose).toFixed(2);
                                    var nU1 = AmtU1.indexOf("-");
                                    if (nU1 == 0) {
                                        htmlData += "<td class='alignright' style='left: 0%; color: red; background-color: #fcea9e75;'>" + response.data.groupByDate[i].detail[j].user.winLose.toFixed(2).toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                    }
                                    else {
                                        htmlData += "<td class='alignright' style='left: 0%; background-color: #fcea9e75;'>" + response.data.groupByDate[i].detail[j].user.winLose.toFixed(2).toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                    }

                                    var AmtU2 = parseFloat(response.data.groupByDate[i].detail[j].user.com).toFixed(2);
                                    var nU2 = AmtU2.indexOf("-");
                                    if (nU2 == 0) {
                                        htmlData += "<td class='alignright' style='left: 0%; color: red; background-color: #fcea9e75;'>" + response.data.groupByDate[i].detail[j].user.com.toFixed(2).toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                    }
                                    else {
                                        htmlData += "<td class='alignright' style='left: 0%; background-color: #fcea9e75;'>" + response.data.groupByDate[i].detail[j].user.com.toFixed(2).toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                    }

                                    var AmtU3 = parseFloat(response.data.groupByDate[i].detail[j].user.total).toFixed(2);
                                    var nU3 = AmtU3.indexOf("-");
                                    if (nU3 == 0) {
                                        htmlData += "<td class='alignright' style='left: 0%; color: red; background-color: #fcea9e75;'>" + response.data.groupByDate[i].detail[j].user.total.toFixed(2).toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                    }
                                    else {
                                        htmlData += "<td class='alignright' style='left: 0%; background-color: #fcea9e75;'>" + response.data.groupByDate[i].detail[j].user.total.toFixed(2).toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                    }

                                    // >> nextUser << //
                                    var AmtN1 = parseFloat(response.data.groupByDate[i].detail[j].nextUser.winLose).toFixed(2);
                                    var nN1 = AmtN1.indexOf("-");
                                    if (nN1 == 0) {
                                        htmlData += "<td class='alignright' style='left: 0%; color: red; background-color: #ffd06373;'>" + response.data.groupByDate[i].detail[j].nextUser.winLose.toFixed(2).toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                    }
                                    else {
                                        htmlData += "<td class='alignright' style='left: 0%; background-color: #ffd06373;'>" + response.data.groupByDate[i].detail[j].nextUser.winLose.toFixed(2).toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                    }

                                    var AmtN2 = parseFloat(response.data.groupByDate[i].detail[j].nextUser.com).toFixed(2);
                                    var nN2 = AmtN2.indexOf("-");
                                    if (nN2 == 0) {
                                        htmlData += "<td class='alignright' style='left: 0%; color: red; background-color: #ffd06373;'>" + response.data.groupByDate[i].detail[j].nextUser.com.toFixed(2).toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                    }
                                    else {
                                        htmlData += "<td class='alignright' style='left: 0%; background-color: #ffd06373;'>" + response.data.groupByDate[i].detail[j].nextUser.com.toFixed(2).toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                    }

                                    var AmtN3 = parseFloat(response.data.groupByDate[i].detail[j].nextUser.total).toFixed(2);
                                    var nN3 = AmtN3.indexOf("-");
                                    if (nN3 == 0) {
                                        htmlData += "<td class='alignright' style='left: 0%; color: red; background-color: #ffd06373;'>" + response.data.groupByDate[i].detail[j].nextUser.total.toFixed(2).toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                    }
                                    else {
                                        htmlData += "<td class='alignright' style='left: 0%; background-color: #ffd06373;'>" + response.data.groupByDate[i].detail[j].nextUser.total.toFixed(2).toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                    }
                                    htmlData += "</tr>";
                                }
                            }

                            htmlAll = htmlHead + htmlData + htmlFoot;
                            $("#tbData").append(htmlAll);

                            SetLan(localStorage.getItem("Language"));
                            ////$("#tb2").css('display', 'flex');
                            $("#tb").css('display', 'none');

                            $("#totalValid").text(response.data.summary.validTurnover.toFixed(2).toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,'));

                            $("#totalU_Win").text(response.data.summary.user.winLose.toFixed(2).toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,'));
                            $("#totalU_Com").text(response.data.summary.user.com.toFixed(2).toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,'));
                            $("#totalU_Total").text(response.data.summary.user.total.toFixed(2).toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,'));

                            $("#totalPU_Win").text(response.data.summary.previousUser.winLose.toFixed(2).toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,'));
                            $("#totalPU_Com").text(response.data.summary.previousUser.com.toFixed(2).toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,'));
                            $("#totalPU_Total").text(response.data.summary.previousUser.total.toFixed(2).toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,'));

                            $("#totalNU_Win").text(response.data.summary.nextUser.winLose.toFixed(2).toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,'));
                            $("#totalNU_Com").text(response.data.summary.nextUser.com.toFixed(2).toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,'));
                            $("#totalNU_Total").text(response.data.summary.nextUser.total.toFixed(2).toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,'));

                            var A2 = parseFloat(response.data.summary.validTurnover).toFixed(2);
                            var n2 = A2.indexOf("-");
                            if (n2 == 0) {
                                document.getElementById("totalValid").style.color = "red";
                            }
                            else {
                                document.getElementById("totalValid").style.color = "rgb(23, 23, 44)";
                            }

                            var A11 = parseFloat(response.data.summary.user.winLose).toFixed(2);
                            var n11 = A11.indexOf("-");
                            if (n11 == 0) {
                                document.getElementById("totalU_Win").style.color = "red";
                            }
                            else {
                                document.getElementById("totalU_Win").style.color = "rgb(23, 23, 44)";
                            }

                            var A12 = parseFloat(response.data.summary.user.com).toFixed(2);
                            var n12 = A12.indexOf("-");
                            if (n12 == 0) {
                                document.getElementById("totalU_Com").style.color = "red";
                            }
                            else {
                                document.getElementById("totalU_Com").style.color = "rgb(23, 23, 44)";
                            }

                            var A13 = parseFloat(response.data.summary.user.total).toFixed(2);
                            var n13 = A13.indexOf("-");
                            if (n13 == 0) {
                                document.getElementById("totalU_Total").style.color = "red";
                            }
                            else {
                                document.getElementById("totalU_Total").style.color = "rgb(23, 23, 44)";
                            }

                            var A21 = parseFloat(response.data.summary.previousUser.winLose).toFixed(2);
                            var n21 = A21.indexOf("-");
                            if (n21 == 0) {
                                document.getElementById("totalPU_Win").style.color = "red";
                            }
                            else {
                                document.getElementById("totalPU_Win").style.color = "rgb(23, 23, 44)";
                            }

                            var A22 = parseFloat(response.data.summary.previousUser.com).toFixed(2);
                            var n22 = A22.indexOf("-");
                            if (n22 == 0) {
                                document.getElementById("totalPU_Com").style.color = "red";
                            }
                            else {
                                document.getElementById("totalPU_Com").style.color = "rgb(23, 23, 44)";
                            }

                            var A23 = parseFloat(response.data.summary.previousUser.total).toFixed(2);
                            var n23 = A23.indexOf("-");
                            if (n23 == 0) {
                                document.getElementById("totalPU_Total").style.color = "red";
                            }
                            else {
                                document.getElementById("totalPU_Total").style.color = "rgb(23, 23, 44)";
                            }

                            var A31 = parseFloat(response.data.summary.nextUser.winLose).toFixed(2);
                            var n31 = A31.indexOf("-");
                            if (n31 == 0) {
                                document.getElementById("totalNU_Win").style.color = "red";
                            }
                            else {
                                document.getElementById("totalNU_Win").style.color = "rgb(23, 23, 44)";
                            }

                            var A32 = parseFloat(response.data.summary.nextUser.com).toFixed(2);
                            var n32 = A32.indexOf("-");
                            if (n32 == 0) {
                                document.getElementById("totalNU_Com").style.color = "red";
                            }
                            else {
                                document.getElementById("totalNU_Com").style.color = "rgb(23, 23, 44)";
                            }

                            var A33 = parseFloat(response.data.summary.nextUser.total).toFixed(2);
                            var n33 = A33.indexOf("-");
                            if (n33 == 0) {
                                document.getElementById("totalNU_Total").style.color = "red";
                            }
                            else {
                                document.getElementById("totalNU_Total").style.color = "rgb(23, 23, 44)";
                            }
                        }
                        else {
                            htmlData += "<tr><td colspan='15' style='text-align: center;' set-lan='text:No data.'></td></tr>";
                            htmlAll = htmlHead + htmlData + htmlFoot;
                            $("#tbData").append(htmlAll);
                            $("#totalValid").text("-");

                            $("#totalU_Win").text("-");
                            $("#totalU_Com").text("-");
                            $("#totalU_Total").text("-");

                            $("#totalPU_Win").text("-");
                            $("#totalPU_Com").text("-");
                            $("#totalPU_Total").text("-");

                            $("#totalNU_Win").text("-");
                            $("#totalNU_Com").text("-");
                            $("#totalNU_Total").text("-");
                        }

                        SetLan(localStorage.getItem("Language"));
                        $("#myModalLoad").modal('hide');
                    }
                    else if (status == 4) {
                        $("#navMenu , #tbData").html("");
                        ////$("#tb2").css('display', 'flex');
                        $("#tb").css('display', 'none');

                        $('#btnExport ,#txtExport').css('display', 'none');

                        var AA = "";
                        var Menu = [];
                        if (menu == "" || menu == null) {
                            //AA += "<a class='linkNav AA' onclick='GetDataTableGame(`" + tbID + "`,`" + num + ",`" + menu + "`,`" + username + "`)'>" + username + "</a>";
                            AA += "<a class='linkNav' onclick='GetDataTableGame(`" + tbID + "`,`" + num + "`,``,`" + username + "`)'>" + username + "</a>";
                            Menu.push("GetDataTableGame|" + tbID + "|" + num + "|" + menu + "|" + username);
                            $("#navMenu").append(AA);
                            $("#navMenu > a:last-child").css("text-decoration", "underline");
                        }
                        else {
                            var array = menu.split(',');
                            for (var i = 0; i < array.length; i++) {
                                if (AA == "") {
                                    AA += "<a class='linkNav AA' onclick='" + array[i].split('|')[0] + "(`" + array[i].split('|')[1] + "`,`" + array[i].split('|')[2] + "`)'>" + array[i].split('|')[3] + "</a>";
                                    Menu.push(array[i].split('|')[0] + "|" + array[i].split('|')[1] + "|" + array[i].split('|')[2] + "|" + array[i].split('|')[3]);
                                }
                                else {
                                    AA += " / <a class='linkNav AA' onclick='" + array[i].split('|')[0] + "(`" + array[i].split('|')[1] + "`,`" + array[i].split('|')[2] + "`)'>" + array[i].split('|')[3] + "</a>";
                                    Menu.push(array[i].split('|')[0] + "|" + array[i].split('|')[1] + "|" + array[i].split('|')[2] + "|" + array[i].split('|')[3]);
                                }
                            }
                            AA += " / <a class='linkNav AA' onclick='GetDataTableGame(`" + tbID + "`,`" + num + "`,`" + menu + "`,`" + username + "`) '>" + username + "</a>";
                            Menu.push("GetDataTableGame|" + tbID + "|" + num + "|" + menu + "|" + username);

                            $("#navMenu").append(AA);
                            $("#navMenu > a:last-child").css("text-decoration", "underline");
                        }

                        var htmlAll = "";
                        var htmlHead = "";
                        var htmlData = "";
                        var htmlFoot = "";
                        htmlHead += "<thead class='rgba-green-slight'>";
                        htmlHead += "<tr>";
                        htmlHead += "<th rowspan='2' class='align-middle' style='width: 2.5%;' set-lan='text:No'></th>";
                        htmlHead += "<th rowspan='2' class='align-middle' style='width: 14.5%; left: 1%; text-align: left; padding-left: 5px;' set-lan='text:Information'></th>";
                        htmlHead += "<th rowspan='2' class='align-middle' style='width: 14.5%; left: 14.5%; text-align: left; padding-left: 5px;' set-lan='text:Detail'></th>";
                        htmlHead += "<th rowspan='2' class='align-middle' style='width: 9.5%; left: 14.5%; text-align: right; padding-right: 5px;' set-lan='text:Amount'></th>";
                        htmlHead += "<th rowspan='2' class='align-middle' style='width: 6%; left: 9.5%;' set-lan='text:Status'></th>";
                        htmlHead += "<th rowspan='2' class='align-middle' style='width: 6%; left: 6%;' set-lan='text:IP address'></th>";
                        htmlHead += "<th colspan='" + response.data.summary.length + "' set-lan='text:Win/Loss & Comm & Total' style='left: 9.5%; border: 1px #ced4da solid;'></th>";
                        htmlHead += "</tr>";
                        htmlHead += "<tr>";
                        for (var i = 0; i < response.data.summary.length; i++) {
                            var posi = response.data.summary[i].position;
                            if (posi == "MEMBER") {
                                htmlHead += "<th style='width: 5%; left: 0;' set-lan='text:Member'></th>";
                            } else if (posi == "AGENT") {
                                htmlHead += "<th style='width: 5%; left: 0;' set-lan='text:Agent'></th>";
                            } else if (posi == "SH_HOLDER") {
                                htmlHead += "<th style='width: 5%; left: 0;' set-lan='text:Shareholder'></th>";
                            } else if (posi == "COMPANY") {
                                htmlHead += "<th style='width: 5%; left: 0;' set-lan='text:Company'></th>";
                            } else if (posi == "AMB") {
                                htmlHead += "<th style='width: 5%; left: 0;' set-lan='text:AMB'></th>";
                            } else if (posi == "PROVIDER") {
                                htmlHead += "<th style='width: 5%; left: 0;' set-lan='text:Provider'></th>";
                            }
                        }
                        htmlHead += "</tr>";
                        htmlHead += "</thead>";
                        htmlHead += "<tbody>";
                        htmlFoot += "</tbody>";
                        htmlFoot += "<tfoot class='rgba-yellow-slight'>";
                        htmlFoot += "<tr class='total'>";
                        htmlFoot += "<td style='width: 2.5%;'></td>";
                        htmlFoot += "<td style='width: 14.5%; left: 1%;'></td>";
                        htmlFoot += "<td style='width: 14.5%; left: 14.5%;'></td>";
                        htmlFoot += "<td style='width: 6%;'></td>";
                        htmlFoot += "<td style='width: 6%;'></td>";
                        htmlFoot += "<td style='width: 9.5%; left: 14.5%;'><span set-lan='text:Total Win/Loss_'></span><br><span set-lan='text:Total Comm_'></span><br><span set-lan='text:Total'></span></td>";
                        if (response.data.summary == "" || response.data.summary == null) {
                            htmlFoot += "<td>-</td>";
                        } else {
                            for (var i = 0; i < response.data.summary.length; i++) {
                                var posi = response.data.summary[i].position;
                                if (posi == "MEMBER") {
                                    htmlFoot += "<td id='totalMember'>-</td>";
                                } else if (posi == "AGENT") {
                                    htmlFoot += "<td id='totalAgent'>-</td>";
                                } else if (posi == "SH_HOLDER") {
                                    htmlFoot += "<td id='totalShare'>-</td>";
                                } else if (posi == "COMPANY") {
                                    htmlFoot += "<td id='totalCompany'>-</td>";
                                } else if (posi == "AMB") {
                                    htmlFoot += "<td id='totalAMB'>-</td>";
                                } else if (posi == "PROVIDER") {
                                    htmlFoot += "<td id='totalProvider'>-</td>";
                                }
                            }
                        }
                        htmlFoot += "</tr>";
                        htmlFoot += "</tfoot>";

                        if (response.total > 0) {
                            var no = 1;

                            for (var i = 0; i < response.data.detail.length; i++) {
                                var obj = response.data.detail[i];

                                htmlData += "<tr>";
                                htmlData += "<td style='width: 2.5%;' class='aligncenter'>" + (((num - 1) * 100) + no) + "</td>";

                                var date = new window.Date(obj.dateTime);
                                var Time;
                                if (obj.dateTime == "" || obj.dateTime == null) {
                                    Time = "-";
                                }
                                else {
                                    Time = ("0" + date.getDate()).slice(-2) + "/" + ("0" + (date.getMonth() + 1)).slice(-2) + "/" + date.getFullYear() + " " + ("0" + date.getHours()).slice(-2) + ":" + ("0" + date.getMinutes()).slice(-2) + ":" + ("0" + date.getSeconds()).slice(-2);
                                }

                                htmlData += "<td style='width: 14.5%; left: 2%;'><b set-lan='text:User'></b>: " + obj.username + "<br><b set-lan='text:Provider'></b>: " + obj.provider + "<br><b set-lan='text:Date'></b>: " + Time + "</td>";

                                var Amount = parseFloat(obj.amount).toFixed(2);

                                var payload = obj.payload;
                                if (payload == null || payload == "") {
                                    htmlData += "<td style='width: 14.5%; left: 14.5%;'><b set-lan='text:" + obj.action + "'></b><br><b set-lan='text:Date'></b>: " + Time + "<br><b set-lan='text:Amount'></b>: " + Amount.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                }
                                else {
                                    htmlData += "<td style='width: 14.5%; left: 14.5%;'><b set-lan='text:" + obj.action + "'></b><br><b set-lan='text:Date'></b>: " + Time + "<br><b set-lan='text:Amount'></b>: " + Amount.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') +
                                        "<br><a onclick='GetDataTableDetail(`" + obj.payload.transactionMapping + "`,`" + Menu + "`)' class='link overflow ellipsis' set-lan='text:detail+'></a></td>";
                                }

                                // >> Amount << //
                                var n1 = Amount.indexOf("-");
                                if (n1 == 0) {
                                    htmlData += "<td style='width: 9.5%; left: 14.5%;' class='alignright txtRed'>" + Amount.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                }
                                else {
                                    htmlData += "<td style='width: 9.5%; left: 14.5%;' class='alignright'>" + Amount.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                }

                                if (obj.status == "SUCCESS") {
                                    htmlData += "<td class='aligncenter' style='width: 6%; left: 0 !important;' set-lan='text:Success'></td>";
                                } else {
                                    htmlData += "<td class='aligncenter' style='width: 6%; left: 0 !important;'>" + obj.status + "</td>";
                                }


                                if (obj.ip != "") {
                                    htmlData += "<td style='width: 6%; left: 0 !important;'><p class='overflow ellipsis' title='" + obj.ip + "'>" + obj.ip + "</p></td>";
                                } else {
                                    htmlData += "<td style='width: 6%; left: 0 !important;' class='aligncenter'>-</td>";
                                }

                                for (var j = 0; j < obj.agentInOutDetail.length; j++) {
                                    var WL = parseFloat(obj.agentInOutDetail[j].winLose.winLose).toFixed(2);
                                    var COM = parseFloat(obj.agentInOutDetail[j].winLose.com).toFixed(2);
                                    var TOTAL = parseFloat(obj.agentInOutDetail[j].winLose.total).toFixed(2);

                                    htmlData += "<td style='left: 0 !important;'>";
                                    if (WL < 0) {
                                        htmlData += "<p class='bottom0 alignright txtRed'>" + WL.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</p>";
                                    }
                                    else {
                                        htmlData += "<p class='bottom0 alignright'>" + WL.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</p>";
                                    }
                                    if (COM < 0) {
                                        htmlData += "<p class='bottom0 alignright txtRed'>" + COM.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</p>";
                                    }
                                    else {
                                        htmlData += "<p class='bottom0 alignright'>" + COM.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</p>";
                                    }
                                    if (TOTAL < 0) {
                                        htmlData += "<p class='bottom0 alignright txtRed'>" + TOTAL.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</p></td>";
                                    }
                                    else {
                                        htmlData += "<p class='bottom0 alignright'>" + TOTAL.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</p></td>";
                                    }
                                }

                                htmlData += "</tr>";
                                no++;
                            }

                            htmlAll = htmlHead + htmlData + htmlFoot;
                            $("#tbData").append(htmlAll);
                            SetLan(localStorage.getItem("Language"));
                            ////$("#tb2").css('display', 'flex');
                            $("#tb").css('display', 'none');

                            for (var i = 0; i < response.data.summary.length; i++) {
                                var txt = "";
                                var Position = response.data.summary[i].position;

                                var WL = parseFloat(response.data.summary[i].winLose.winLose).toFixed(2);
                                var COM = parseFloat(response.data.summary[i].winLose.com).toFixed(2);
                                var TOTAL = parseFloat(response.data.summary[i].winLose.total).toFixed(2);

                                if (WL < 0) {
                                    txt += "<span class='txtRed'>" + WL.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</span><br>";
                                }
                                else {
                                    txt += "<span>" + WL.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</span><br>";
                                }

                                if (COM < 0) {
                                    txt += "<span class='txtRed'>" + COM.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</span><br>";
                                }
                                else {
                                    txt += "<span>" + COM.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</span><br>";
                                }

                                if (TOTAL < 0) {
                                    txt += "<span class='txtRed'>" + TOTAL.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</span>";
                                }
                                else {
                                    txt += "<span>" + TOTAL.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</span>";
                                }

                                if (Position == "MEMBER") {
                                    $("#totalMember").html(txt);
                                } else if (Position == "AGENT") {
                                    $("#totalAgent").html(txt);
                                } else if (Position == "SH_HOLDER") {
                                    $("#totalShare").html(txt);
                                } else if (Position == "COMPANY") {
                                    $("#totalCompany").html(txt);
                                } else if (Position == "AMB") {
                                    $("#totalAMB").html(txt);
                                } else if (Position == "PROVIDER") {
                                    $("#totalProvider").html(txt);
                                }
                            }
                        }
                        else {
                            htmlData += "<tr><td colspan='15' style='text-align: center;' set-lan='text:No data.'></td></tr>";
                            htmlAll = htmlHead + htmlData + htmlFoot;
                            $("#tbData").append(htmlAll);
                            $("#totalMember").text("-");
                            $("#totalAgent").text("-");
                            $("#totalShare").text("-");
                            $("#totalCompany").text("-");
                            $("#totalAMB").text("-");
                        }

                        SetLan(localStorage.getItem("Language"));
                        $("#myModalLoad").modal('hide');
                    }
                    else if (status == 5) {
                        $("#tbData").html("");
                        ////$("#tb2").css('display', 'flex');
                        $("#tb").css('display', 'none');
                        $('#btnExport ,#txtExport').css('display', 'none');

                        var newNav = "";
                        var navMenu = "";
                        newNav += "<a class='linkNav' set-lan='text:detail+'></a>";
                        var arrNav = $("#navMenu").html();
                        var n = arrNav.search("detail");
                        if (n < 0) {
                            arrNav += " / " + newNav;
                            navMenu = arrNav;
                        }
                        else {
                            arrNav = arrNav.split(' / ');
                            var Last = arrNav.pop();
                            for (var i = 0; i < arrNav.length; i++) {
                                navMenu += arrNav[i] + " / ";
                            }
                            navMenu += newNav;
                        }

                        $("#navMenu").html("");
                        $("#navMenu").append(navMenu);
                        $("#navMenu > a:last-child").css("text-decoration", "underline");

                        var htmlAll = "";
                        var htmlHead = "";
                        var htmlData = "";
                        var htmlFoot = "";
                        htmlHead += "<thead class='rgba-green-slight'>";
                        htmlHead += "<tr>";
                        htmlHead += "<th class='align-middle' style='width: 2.5%;' set-lan='text:No'></th>";
                        htmlHead += "<th class='align-middle' style='width: 7%; left: 3%;' set-lan='text:Date'></th>";

                        htmlHead += "<th class='align-middle' style='width: 7%; left: 3%;' set-lan='text:Bet Detail'></th>";

                        htmlHead += "<th class='align-middle' style='width: 7%; left: 7%; text-align: left;padding-left: 5px;' set-lan='text:Game Type'></th>";
                        htmlHead += "<th class='align-middle' style='width: 7%; left: 7%; text-align: left;padding-left: 5px;' set-lan='text:Game Name'></th>";
                        htmlHead += "<th class='align-middle' style='width: 7%; left: 7%; text-align: right; padding-right: 5px;' set-lan='text:Amount'></th>";
                        htmlHead += "<th class='align-middle' style='width: 7%; left: 7%; text-align: right; padding-right: 5px;' set-lan='text:Payout'></th>";
                        htmlHead += "<th style='width: 7%; left: 7%; text-align: right; padding-right: 5px;'><label style='margin-bottom: 0rem;' set-lan='text:Netwin'></label><label>&nbsp;(100%)</label></th>";
                        htmlHead += "<th class='align-middle' style='width: 7%; left: 7%; text-align: right; padding-right: 5px;' set-lan='text:Balance'></th>";
                        htmlHead += "</tr>";
                        htmlHead += "</thead>";
                        htmlHead += "<tbody>";

                        htmlFoot += "</tbody>";
                        htmlFoot += "<tfoot class='rgba-yellow-slight'>";
                        htmlFoot += "<tr class='total'>";
                        htmlFoot += "<td style='width: 2.5%;'></td>";
                        htmlFoot += "<td style='width: 7%; left: 3%;'></td>";
                        htmlFoot += "<td style='width: 7%; left: 7%;'></td>";
                        htmlFoot += "<td style='width: 7%; left: 7%;'></td>";
                        htmlFoot += "<td style='width: 7%; left: 7%;' set-lan='text:Total'></td>";
                        htmlFoot += "<td style='width: 7%; left: 7%;' id='totalAmount'></td>";
                        htmlFoot += "<td style='width: 7%; left: 7%;' id='totalPayout'></td>";
                        htmlFoot += "<td style='width: 7%; left: 7%;' id='totalNetwin'></td>";
                        htmlFoot += "<td style='width: 7%; left: 7%;'></td>";
                        htmlFoot += "</tr>";
                        htmlFoot += "</tfoot>";

                        if (response.total > 0) {
                            var no = 1;

                            for (var i = 0; i < response.data.details.length; i++) {
                                var obj = response.data.details[i];

                                htmlData += "<tr>";
                                htmlData += "<td class='aligncenter'>" + (((num - 1) * 100) + no) + "</td>";

                                var date = new window.Date(obj.betTime);
                                var txtDate;
                                if (obj.betTime == "" || obj.betTime == null) {
                                    txtDate = "-";
                                }
                                else {
                                    txtDate = ("0" + date.getDate()).slice(-2) + "/" + ("0" + (date.getMonth() + 1)).slice(-2) + "/" + date.getFullYear() + " " + ("0" + date.getHours()).slice(-2) + ":" + ("0" + date.getMinutes()).slice(-2) + ":" + ("0" + date.getSeconds()).slice(-2);
                                }
                                htmlData += "<td class='aligncenter'>" + txtDate + "</td>";

                                if (obj.betDetailSupport == true) {
                                    htmlData += "<td><a onclick='postBetDetail(`" + obj.id + "`)' class='link overflow ellipsis' set-lan='text:detail+'></a></td>";
                                }
                                else if (obj.betDetailSupport == false) {
                                    htmlData += "<td class='aligncenter'>-</td>";
                                }

                                htmlData += "<td>" + obj.gameType + "</td>";
                                htmlData += "<td>" + obj.gameName + "</td>";

                                var AMOUNT = parseFloat(obj.amount).toFixed(2);
                                var PAY = parseFloat(obj.payout).toFixed(2);
                                var NET = parseFloat(obj.netWin).toFixed(2);
                                var BAL = parseFloat(obj.balanceAfter).toFixed(2);

                                if (AMOUNT < 0) {
                                    htmlData += "<td class='alignright txtRed'>" + AMOUNT.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                }
                                else {
                                    htmlData += "<td class='alignright'>" + AMOUNT.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                }

                                if (PAY < 0) {
                                    htmlData += "<td class='alignright txtRed'>" + PAY.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                }
                                else {
                                    htmlData += "<td class='alignright'>" + PAY.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                }

                                if (NET < 0) {
                                    htmlData += "<td class='alignright txtRed'>" + NET.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                }
                                else {
                                    htmlData += "<td class='alignright'>" + NET.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                }

                                if (BAL < 0) {
                                    htmlData += "<td class='alignright txtRed'>" + BAL.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                }
                                else {
                                    htmlData += "<td class='alignright'>" + BAL.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                                }

                                htmlData += "</tr>";
                                no++;
                            }
                            htmlAll = htmlHead + htmlData + htmlFoot;
                            $("#tbData").append(htmlAll);

                            SetLan(localStorage.getItem("Language"));
                            ////$("#tb2").css('display', 'flex');
                            $("#tb").css('display', 'none');

                            var amount = parseFloat(response.data.summary.amount).toFixed(2);
                            var payout = parseFloat(response.data.summary.payout).toFixed(2);
                            var netWin = parseFloat(response.data.summary.netWin).toFixed(2);

                            $("#totalAmount").text(amount.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,'));
                            $("#totalPayout").text(payout.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,'));
                            $("#totalNetwin").text(netWin.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,'));

                            if (amount < 0) {
                                document.getElementById("totalAmount").style.color = "red";
                            }
                            else {
                                document.getElementById("totalAmount").style.color = "rgb(23, 23, 44)";
                            }

                            if (payout < 0) {
                                document.getElementById("totalPayout").style.color = "red";
                            }
                            else {
                                document.getElementById("totalPayout").style.color = "rgb(23, 23, 44)";
                            }

                            if (netWin < 0) {
                                document.getElementById("totalNetwin").style.color = "red";
                            }
                            else {
                                document.getElementById("totalNetwin").style.color = "rgb(23, 23, 44)";
                            }
                        }
                        else {
                            htmlData += "<tr><td colspan='9' style='text-align: center;' set-lan='text:No data.'></td></tr>";
                            htmlAll = htmlHead + htmlData + htmlFoot;
                            $("#tbData").append(htmlAll);
                        }

                        SetLan(localStorage.getItem("Language"));
                        $("#myModalLoad").modal('hide');
                    }
                }

                document.getElementById("tbData").style.display = "";
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

        const postList = async (num, tbID, username) => {
            $("#navMenu , #tbData").html("");
            ////$("#tb2").css('display', 'flex');
            $("#tb").css('display', 'none');
            $('#btnExport ,#txtExport').css('display', 'initial');

            if (username == null) {
                username = "";
            }

            const parameter = {
                startDate: $("#startdate").val(),
                startTime: $("#starttime").val() + ":00",
                endDate: $("#todate").val(),
                endTime: $("#totime").val() + ":00",
                parentID: tbID,
                username: username,
                page: num,
                size: 100
            }
            const requestAwait = await fetchDataSite(`${apiURL}/v1/report/win_lose_agent`, 'POST', "include", parameter)
            const response = await requestAwait.json()

            if (response.messageCode == 0000 || response.messageCode == null) {
                if (response.data.parentList.length != 0) {
                    var AA = "";
                    var Menu = [];
                    for (var i = 0; i < response.data.parentList.length; i++) {
                        var Position = response.data.parentList[i].position;
                        if (AA == "") {
                            if (Position == "MEMBER") {
                                AA += "<a class='linkNav AA' onclick='GetDataTableGame(`" + response.data.parentList[i].id + "`," + num + ",``,`" + response.data.parentList[i].username + "`)'>" + response.data.parentList[i].username + "</a>";
                                Menu.push("GetDataTableGame|" + response.data.parentList[i].id + "|" + num + "||" + response.data.parentList[i].username);
                            }
                            else {
                                AA += "<a class='linkNav AA' onclick='GetDataTB(`" + response.data.parentList[i].id + "`," + num + ")'>" + response.data.parentList[i].username + "</a>";
                                Menu.push("GetDataTB|" + response.data.parentList[i].id + "|" + num + "|" + response.data.parentList[i].username);
                            }
                        }
                        else {
                            if (Position == "MEMBER") {
                                AA += " / <a class='linkNav AA' onclick='GetDataTableGame(`" + response.data.parentList[i].id + "`," + num + ",``,`" + response.data.parentList[i].username + "`)'>" + response.data.parentList[i].username + "</a>";
                                Menu.push("GetDataTableGame|" + response.data.parentList[i].id + "|" + num + "||" + response.data.parentList[i].username);
                            }
                            else {
                                AA += " / <a class='linkNav AA' onclick='GetDataTable1(`" + response.data.parentList[i].id + "`," + num + ")'>" + response.data.parentList[i].username + "</a>";
                                Menu.push("GetDataTable1|" + response.data.parentList[i].id + "|" + num + "|" + response.data.parentList[i].username);
                            }
                        }
                    }
                    $("#navMenu").append(AA);
                    $("#navMenu > a:last-child").css("text-decoration", "underline");
                }

                var Posi = localStorage.getItem("Position");
                var Usertype = localStorage.getItem("UserType");

                var htmlAll = "";
                var htmlHead = "";
                var htmlData = "";
                var htmlFoot = "";

                htmlHead += "<thead class='rgba-green-slight'>";
                htmlHead += "<tr>";
                htmlHead += "<th rowspan='2' class='align-middle' style='width: 2.5%; color: #f1ca34; background-color: rgb(70, 34, 14); border-right: 1px #ced4da solid;' set-lan='text:No'></th>";
                htmlHead += "<th rowspan='2' class='align-middle' style='width: 7.5%; left: 2%; text-align: left; padding-left: 5px; color: #f1ca34; background-color: rgb(70, 34, 14); border: 1px #ced4da solid' set-lan='text:Username'></th>";
                htmlHead += "<th rowspan='2' class='align-middle' style='width: 7.5%; left: 2%; text-align: left; padding-left: 5px; color: #f1ca34; background-color: rgb(70, 34, 14); border: 1px #ced4da solid' set-lan='text:Nickname'></th>";
                htmlHead += "<th rowspan='2' class='align-middle' style='width: 7.5%; left: 2%; color: #f1ca34; background-color: rgb(70, 34, 14); border: 1px #ced4da solid' set-lan='text:Level'></th>";
                htmlHead += "<th rowspan='2' class='align-middle' style='width: 9%; left: 8%; text-align: right; padding-right: 5px; color: #f1ca34; background-color: rgb(70, 34, 14); border: 1px #ced4da solid' set-lan='text:Valid turn'></th>";

                var house = -(parseFloat(response.data.summary.winLose / parseFloat(response.data.summary.validTurnover)) * 100);
                house = parseFloat(house).toFixed(2);
                htmlHead += "<th rowspan='2' class='align-middle' style='width: 8%; left: 3%; text-align: right; padding-right: 5px; color: #f1ca34; background-color: rgb(70, 34, 14); border: 1px #ced4da solid'><label style='margin-bottom: 0rem;' set-lan='text:Member W/L'></label><br/><label>&nbsp;(100%)</label><br/><label style='margin-bottom: 0rem;' set-lan='text:House Edge'></label><br/>";

                if (response.total > 0) {
                    if (house < 0) {
                        htmlHead += "<label style='color: red !important;'>&nbsp;(" + house + "%)</label></th>";
                    }
                    else {
                        htmlHead += "<label>&nbsp;(" + house + "%)</label></th>";
                    }
                } else {
                    htmlHead += "<label>&nbsp;(%)</label></th>";
                }

                htmlHead += "<th colspan='3' style='color: #f1ca34; left: 9%; background-color: rgb(70, 34, 14); border: 1px #ced4da solid;' set-lan='text:Member'></th>";

                if (Posi == "AMB") {
                    htmlHead += "<th colspan='3' style='left: 0 !important; color: #f1ca34; background-color: rgb(70, 34, 14); border: 1px #ced4da solid;' set-lan='text:AMB'></th>";
                    htmlHead += "<th colspan='3' style='left: 0 !important; color: #f1ca34; background-color: rgb(70, 34, 14); border: 1px #ced4da solid;' set-lan='text:Provider'></th>";
                }
                else if (Posi == "COMPANY" && Usertype == "main") {
                    htmlHead += "<th colspan='3' style='left: 0 !important; color: #f1ca34; background-color: rgb(70, 34, 14); border: 1px #ced4da solid;' set-lan='text:Company'></th>";
                    htmlHead += "<th colspan='3' style='left: 0 !important; color: #f1ca34; background-color: rgb(70, 34, 14); border: 1px #ced4da solid;' set-lan='text:AMB'></th>";
                }
                else {
                    htmlHead += "<th colspan='3' style='left: 0 !important; color: #f1ca34; background-color: rgb(70, 34, 14); border: 1px #ced4da solid;' set-lan='text:Agent'></th>";
                    htmlHead += "<th colspan='3' style='left: 0 !important; color: #f1ca34; background-color: rgb(70, 34, 14); border: 1px #ced4da solid;' set-lan='text:Company'></th>";
                }

                htmlHead += "</tr>";
                htmlHead += "<tr>";
                htmlHead += "<th style='left: 0 !important; color: #f1ca34; background-color: rgb(70, 34, 14); border: 1px #ced4da solid; text-align: right; padding-right: 5px;' set-lan='text:Win lose'></th>";
                htmlHead += "<th style='left: 0 !important; color: #f1ca34; background-color: rgb(70, 34, 14); border: 1px #ced4da solid; text-align: right; padding-right: 5px;' set-lan='text:Comm'></th>";
                htmlHead += "<th style='left: 0 !important; color: #f1ca34; background-color: rgb(70, 34, 14); border: 1px #ced4da solid; text-align: right; padding-right: 5px;' set-lan='text:Total-'></th>";
                htmlHead += "<th style='left: 0 !important; color: #f1ca34; background-color: rgb(70, 34, 14); border: 1px #ced4da solid; text-align: right; padding-right: 5px;' set-lan='text:Win lose'></th>";
                htmlHead += "<th style='left: 0 !important; color: #f1ca34; background-color: rgb(70, 34, 14); border: 1px #ced4da solid; text-align: right; padding-right: 5px;' set-lan='text:Comm'></th>";
                htmlHead += "<th style='left: 0 !important; color: #f1ca34; background-color: rgb(70, 34, 14); border: 1px #ced4da solid; text-align: right; padding-right: 5px;' set-lan='text:Total-'></th>";
                htmlHead += "<th style='left: 0 !important; color: #f1ca34; background-color: rgb(70, 34, 14); border: 1px #ced4da solid; text-align: right; padding-right: 5px;' set-lan='text:Win lose'></th>";
                htmlHead += "<th style='left: 0 !important; color: #f1ca34; background-color: rgb(70, 34, 14); border: 1px #ced4da solid; text-align: right; padding-right: 5px;' set-lan='text:Comm'></th>";
                htmlHead += "<th style='left: 0 !important; color: #f1ca34; background-color: rgb(70, 34, 14); border: 1px #ced4da solid; text-align: right; padding-right: 5px;' set-lan='text:Total-'></th>";
                htmlHead += "</tr>";
                htmlHead += "</thead>";
                htmlHead += "<tbody style=''>";

                htmlFoot += "</tbody>";
                htmlFoot += "<tfoot class='rgba-yellow-slight'>";
                htmlFoot += "<tr class='total'>";
                htmlFoot += "<td style='font-weight: bold; background-color: #f2e8be; border-right: 1px #ced4da solid; width: 2.5%;'></td>";
                htmlFoot += "<td style='font-weight: bold; background-color: #f2e8be; border-right: 1px #ced4da solid; width: 7.5%; left: 2%;'></td>";
                htmlFoot += "<td style='font-weight: bold; background-color: #f2e8be; border-right: 1px #ced4da solid; width: 7.5%; left: 2%;'></td>";
                htmlFoot += "<td set-lan='text:Total' style='font-weight: bold; background-color: #f2e8be; border-right: 1px #ced4da solid; width: 7.5%; left: 2%;'></td>";
                htmlFoot += "<td id='totalValid' style='font-weight: bold; background-color: #f2e8be; border-right: 1px #ced4da solid; width: 9%; left: 8%;'>-</td>";
                htmlFoot += "<td id='totalWL' style='font-weight: bold; background-color: #f2e8be; border-right: 1px #ced4da solid; width: 9%; left: 8%;'>-</td>";
                htmlFoot += "<td id='totalPU_Win' style='font-weight: bold; background-color: #f2e8be; border-right: 1px #ced4da solid; left: 9%;'>-</td>";
                htmlFoot += "<td id='totalPU_Com' style='font-weight: bold; background-color: #f2e8be; border-right: 1px #ced4da solid; left: 0;'>-</td>";
                htmlFoot += "<td id='totalPU_Total' style='font-weight: bold; background-color: #f2e8be; border-right: 1px #ced4da solid; left: 0;'>-</td>";
                htmlFoot += "<td id='totalU_Win' style='font-weight: bold; background-color: #f2e8be; border-right: 1px #ced4da solid; left: 0;'>-</td>";
                htmlFoot += "<td id='totalU_Com' style='font-weight: bold; background-color: #f2e8be; border-right: 1px #ced4da solid; left: 0;'>-</td>";
                htmlFoot += "<td id='totalU_Total' style='font-weight: bold; background-color: #f2e8be; border-right: 1px #ced4da solid; left: 0;'>-</td>";
                htmlFoot += "<td id='totalNU_Win' style='font-weight: bold; background-color: #f2e8be; border-right: 1px #ced4da solid; left: 0;'>-</td>";
                htmlFoot += "<td id='totalNU_Com' style='font-weight: bold; background-color: #f2e8be; border-right: 1px #ced4da solid; left: 0;'>-</td>";
                htmlFoot += "<td id='totalNU_Total' style='font-weight: bold; background-color: #f2e8be; border-right: 1px #ced4da solid; left: 0;'>-</td>";
                htmlFoot += "</tr>";
                htmlFoot += "</tfoot>";

                if (response.total > 0) {
                    var no = 1;
                    var Position = "";
                    var Total = 0;

                    for (var i = 0; i < response.data.detail.length; i++) {
                        htmlData += "<tr>";
                        htmlData += "<td class='aligncenter' style='width: 2.5%;'>" + (((num - 1) * 100) + no) + "</td>";

                        if (response.data.detail[i].position == "MEMBER") {
                            htmlData += "<td style='width: 7.5%; left: 2%;'><p onclick='GetDataTableGame(`" + response.data.detail[i].userID + "`,`" + num + "`,`" + Menu + "`,`" + response.data.detail[i].username + "`)' class='linkNav overflow ellipsis linkUser' title='" + response.data.detail[i].username + "'>" + response.data.detail[i].username + "</p></td>";
                        }
                        else {
                            htmlData += "<td style='width: 7.5%; left: 2%;'><p onclick='GetDataTable1(`" + response.data.detail[i].userID + "`," + num + ",``)' class='linkNav overflow ellipsis linkUser' title='" + response.data.detail[i].username + "'>" + response.data.detail[i].username + "</p></td>";
                        }

                        if (response.data.detail[i].position == "SH_HOLDER") {
                            Position = "Shareholder";
                        }
                        else {
                            var txt = response.data.detail[i].position;
                            var txt2 = txt.toLowerCase();
                            Position = capitalizeFirstLetter(txt2);
                        }
                        htmlData += "<td style='width: 7.5%; left: 2%;'><p class='overflow ellipsis' title='" + response.data.detail[i].nickname + "'>" + response.data.detail[i].nickname + "</p></td>";
                        htmlData += "<td class='aligncenter' set-lan='text:" + Position + "' style='width: 7.5%; left: 2%;'></td>";

                        // >> validTurnover << //
                        var Amt2 = parseFloat(response.data.detail[i].validTurnover).toFixed(2);
                        var n2 = Amt2.indexOf("-");
                        if (n2 == 0) {
                            htmlData += "<td class='alignright' style='color: red; width: 9%; left: 8%;'>" + response.data.detail[i].validTurnover.toFixed(2).toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                        }
                        else {
                            htmlData += "<td class='alignright' style='width: 9%; left: 8%;'>" + response.data.detail[i].validTurnover.toFixed(2).toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                        }

                        // >> winLose << //
                        var AmtWinLose = parseFloat(response.data.detail[i].winLose).toFixed(2);
                        var nWinLose = AmtWinLose.indexOf("-");
                        if (nWinLose == 0) {
                            htmlData += "<td class='alignright' style='color: red; width: 9%; left: 8%;'>" + response.data.detail[i].winLose.toFixed(2).toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                        }
                        else {
                            htmlData += "<td class='alignright' style='width: 9%; left: 8%;'>" + response.data.detail[i].winLose.toFixed(2).toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                        }

                        // >> previousUser << //
                        var AmtP1 = parseFloat(response.data.detail[i].previousUser.winLose).toFixed(2);
                        var nP1 = AmtP1.indexOf("-");
                        if (nP1 == 0) {
                            htmlData += "<td class='alignright' style='color: red; background-color: #fff9e06b; left: 0 !important;'>" + response.data.detail[i].previousUser.winLose.toFixed(2).toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                        }
                        else {
                            htmlData += "<td class='alignright' style='background-color: #fff9e06b; left: 0 !important;'>" + response.data.detail[i].previousUser.winLose.toFixed(2).toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                        }

                        var AmtP2 = parseFloat(response.data.detail[i].previousUser.com).toFixed(2);
                        var nP2 = AmtP2.indexOf("-");
                        if (nP2 == 0) {
                            htmlData += "<td class='alignright' style='color: red; background-color: #fff9e06b; left: 0 !important;'>" + response.data.detail[i].previousUser.com.toFixed(2).toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                        }
                        else {
                            htmlData += "<td class='alignright' style='background-color: #fff9e06b; left: 0 !important;'>" + response.data.detail[i].previousUser.com.toFixed(2).toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                        }

                        var AmtP3 = parseFloat(response.data.detail[i].previousUser.total).toFixed(2);
                        var nP3 = AmtP3.indexOf("-");
                        if (nP3 == 0) {
                            htmlData += "<td class='alignright' style='color: red; background-color: #fff9e06b; left: 0 !important;'>" + response.data.detail[i].previousUser.total.toFixed(2).toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                        }
                        else {
                            htmlData += "<td class='alignright' style='background-color: #fff9e06b; left: 0 !important;'>" + response.data.detail[i].previousUser.total.toFixed(2).toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                        }

                        // >> User << //
                        var AmtU1 = parseFloat(response.data.detail[i].user.winLose).toFixed(2);
                        var nU1 = AmtU1.indexOf("-");
                        if (nU1 == 0) {
                            htmlData += "<td class='alignright' style='color: red; background-color: #fcea9e75; left: 0 !important;'>" + response.data.detail[i].user.winLose.toFixed(2).toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                        }
                        else {
                            htmlData += "<td class='alignright' style='background-color: #fcea9e75; left: 0 !important;'>" + response.data.detail[i].user.winLose.toFixed(2).toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                        }

                        var AmtU2 = parseFloat(response.data.detail[i].user.com).toFixed(2);
                        var nU2 = AmtU2.indexOf("-");
                        if (nU2 == 0) {
                            htmlData += "<td class='alignright' style='color: red; background-color: #fcea9e75; left: 0 !important;'>" + response.data.detail[i].user.com.toFixed(2).toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                        }
                        else {
                            htmlData += "<td class='alignright' style='background-color: #fcea9e75; left: 0 !important;'>" + response.data.detail[i].user.com.toFixed(2).toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                        }

                        var AmtU3 = parseFloat(response.data.detail[i].user.total).toFixed(2);
                        var nU3 = AmtU3.indexOf("-");
                        if (nU3 == 0) {
                            htmlData += "<td class='alignright' style='color: red; background-color: #fcea9e75; left: 0 !important;'>" + response.data.detail[i].user.total.toFixed(2).toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                        }
                        else {
                            htmlData += "<td class='alignright' style='background-color: #fcea9e75; left: 0 !important;'>" + response.data.detail[i].user.total.toFixed(2).toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                        }

                        // >> nextUser << //
                        var AmtN1 = parseFloat(response.data.detail[i].nextUser.winLose).toFixed(2);
                        var nN1 = AmtN1.indexOf("-");
                        if (nN1 == 0) {
                            htmlData += "<td class='alignright' style='color: red; background-color: #ffd06373; left: 0 !important;'>" + response.data.detail[i].nextUser.winLose.toFixed(2).toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                        }
                        else {
                            htmlData += "<td class='alignright' style='background-color: #ffd06373; left: 0 !important;'>" + response.data.detail[i].nextUser.winLose.toFixed(2).toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                        }

                        var AmtN2 = parseFloat(response.data.detail[i].nextUser.com).toFixed(2);
                        var nN2 = AmtN2.indexOf("-");
                        if (nN2 == 0) {
                            htmlData += "<td class='alignright' style='color: red; background-color: #ffd06373; left: 0 !important;'>" + response.data.detail[i].nextUser.com.toFixed(2).toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                        }
                        else {
                            htmlData += "<td class='alignright' style='background-color: #ffd06373; left: 0 !important;'>" + response.data.detail[i].nextUser.com.toFixed(2).toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                        }

                        var AmtN3 = parseFloat(response.data.detail[i].nextUser.total).toFixed(2);
                        var nN3 = AmtN3.indexOf("-");
                        if (nN3 == 0) {
                            htmlData += "<td class='alignright' style='color: red; background-color: #ffd06373; left: 0 !important;'>" + response.data.detail[i].nextUser.total.toFixed(2).toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                        }
                        else {
                            htmlData += "<td class='alignright' style='background-color: #ffd06373; left: 0 !important;'>" + response.data.detail[i].nextUser.total.toFixed(2).toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                        }

                        htmlData += "</tr>";
                        Total = Total + response.data.detail[i].credit;
                        no++;
                    }

                    htmlAll = htmlHead + htmlData + htmlFoot;
                    $("#tbData").append(htmlAll);

                    SetLan(localStorage.getItem("Language"));
                    ////$("#tb2").css('display', 'flex');
                    $("#tb").css('display', 'none');


                    $("#totalValid").text(response.data.summary.validTurnover.toFixed(2).toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,'));
                    $("#totalWL").text(response.data.summary.winLose.toFixed(2).toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,'));

                    $("#totalU_Win").text(response.data.summary.user.winLose.toFixed(2).toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,'));
                    $("#totalU_Com").text(response.data.summary.user.com.toFixed(2).toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,'));
                    $("#totalU_Total").text(response.data.summary.user.total.toFixed(2).toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,'));

                    $("#totalPU_Win").text(response.data.summary.previousUser.winLose.toFixed(2).toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,'));
                    $("#totalPU_Com").text(response.data.summary.previousUser.com.toFixed(2).toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,'));
                    $("#totalPU_Total").text(response.data.summary.previousUser.total.toFixed(2).toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,'));

                    $("#totalNU_Win").text(response.data.summary.nextUser.winLose.toFixed(2).toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,'));
                    $("#totalNU_Com").text(response.data.summary.nextUser.com.toFixed(2).toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,'));
                    $("#totalNU_Total").text(response.data.summary.nextUser.total.toFixed(2).toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,'));

                    var A2 = parseFloat(response.data.summary.validTurnover).toFixed(2);
                    var n2 = A2.indexOf("-");
                    if (n2 == 0) {
                        document.getElementById("totalValid").style.color = "red";
                    }
                    else {
                        document.getElementById("totalValid").style.color = "rgb(23, 23, 44)";
                    }

                    var AWL = parseFloat(response.data.summary.winLose).toFixed(2);
                    var nWL = AWL.indexOf("-");
                    if (nWL == 0) {
                        document.getElementById("totalWL").style.color = "red";
                    }
                    else {
                        document.getElementById("totalWL").style.color = "rgb(23, 23, 44)";
                    }

                    var A11 = parseFloat(response.data.summary.user.winLose).toFixed(2);
                    var n11 = A11.indexOf("-");
                    if (n11 == 0) {
                        document.getElementById("totalU_Win").style.color = "red";
                    }
                    else {
                        document.getElementById("totalU_Win").style.color = "rgb(23, 23, 44)";
                    }

                    var A12 = parseFloat(response.data.summary.user.com).toFixed(2);
                    var n12 = A12.indexOf("-");
                    if (n12 == 0) {
                        document.getElementById("totalU_Com").style.color = "red";
                    }
                    else {
                        document.getElementById("totalU_Com").style.color = "rgb(23, 23, 44)";
                    }

                    var A13 = parseFloat(response.data.summary.user.total).toFixed(2);
                    var n13 = A13.indexOf("-");
                    if (n13 == 0) {
                        document.getElementById("totalU_Total").style.color = "red";
                    }
                    else {
                        document.getElementById("totalU_Total").style.color = "rgb(23, 23, 44)";
                    }

                    var A21 = parseFloat(response.data.summary.previousUser.winLose).toFixed(2);
                    var n21 = A21.indexOf("-");
                    if (n21 == 0) {
                        document.getElementById("totalPU_Win").style.color = "red";
                    }
                    else {
                        document.getElementById("totalPU_Win").style.color = "rgb(23, 23, 44)";
                    }

                    var A22 = parseFloat(response.data.summary.previousUser.com).toFixed(2);
                    var n22 = A22.indexOf("-");
                    if (n22 == 0) {
                        document.getElementById("totalPU_Com").style.color = "red";
                    }
                    else {
                        document.getElementById("totalPU_Com").style.color = "rgb(23, 23, 44)";
                    }

                    var A23 = parseFloat(response.data.summary.previousUser.total).toFixed(2);
                    var n23 = A23.indexOf("-");
                    if (n23 == 0) {
                        document.getElementById("totalPU_Total").style.color = "red";
                    }
                    else {
                        document.getElementById("totalPU_Total").style.color = "rgb(23, 23, 44)";
                    }

                    var A31 = parseFloat(response.data.summary.nextUser.winLose).toFixed(2);
                    var n31 = A31.indexOf("-");
                    if (n31 == 0) {
                        document.getElementById("totalNU_Win").style.color = "red";
                    }
                    else {
                        document.getElementById("totalNU_Win").style.color = "rgb(23, 23, 44)";
                    }

                    var A32 = parseFloat(response.data.summary.nextUser.com).toFixed(2);
                    var n32 = A32.indexOf("-");
                    if (n32 == 0) {
                        document.getElementById("totalNU_Com").style.color = "red";
                    }
                    else {
                        document.getElementById("totalNU_Com").style.color = "rgb(23, 23, 44)";
                    }

                    var A33 = parseFloat(response.data.summary.nextUser.total).toFixed(2);
                    var n33 = A33.indexOf("-");
                    if (n33 == 0) {
                        document.getElementById("totalNU_Total").style.color = "red";
                    }
                    else {
                        document.getElementById("totalNU_Total").style.color = "rgb(23, 23, 44)";
                    }
                }
                else {
                    htmlData += "<tr><td colspan='15' style='text-align: center;' set-lan='text:No data.'></td></tr>";
                    htmlAll = htmlHead + htmlData + htmlFoot;
                    $("#tbData").append(htmlAll);
                    $("#totalValid").text("-");
                    $("#totalWL").text("-");

                    $("#totalU_Win").text("-");
                    $("#totalU_Com").text("-");
                    $("#totalU_Total").text("-");

                    $("#totalPU_Win").text("-");
                    $("#totalPU_Com").text("-");
                    $("#totalPU_Total").text("-");

                    $("#totalNU_Win").text("-");
                    $("#totalNU_Com").text("-");
                    $("#totalNU_Total").text("-");
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

        const postTable = async (tbID, num, username) => {
            $("#navMenu , #tbData").html("");
            ////$("#tb2").css('display', 'flex');
            $("#tb").css('display', 'none');
            $('#btnExport ,#txtExport').css('display', 'initial');

            if (username == null) {
                username = "";
            }

            const parameter = {
                startDate: $("#startdate").val(),
                startTime: $("#starttime").val() + ":00",
                endDate: $("#todate").val(),
                endTime: $("#totime").val() + ":00",
                parentID: tbID,
                username: username,
                page: num,
                size: 100
            }
            const requestAwait = await fetchDataSite(`${apiURL}/v1/report/win_lose_agent`, 'POST', "include", parameter)
            const response = await requestAwait.json()

            if (response.messageCode == 0000 || response.messageCode == null) {
                if (response.data.parentList.length != 0) {
                    var AA = "";
                    var Menu = [];
                    for (var i = 0; i < response.data.parentList.length; i++) {
                        var Position = response.data.parentList[i].position;
                        if (AA == "") {
                            if (Position == "MEMBER") {
                                AA += "<a class='linkNav AA' onclick='GetDataTableGame(`" + response.data.parentList[i].id + "`," + num + ",``,`" + response.data.parentList[i].username + "`)'>" + response.data.parentList[i].username + "</a>";
                                Menu.push("GetDataTableGame|" + response.data.parentList[i].id + "|" + num + "||" + response.data.parentList[i].username);
                            }
                            else {
                                AA += "<a class='linkNav AA' onclick='GetDataTB(`" + response.data.parentList[i].id + "`," + num + ")'>" + response.data.parentList[i].username + "</a>";
                                Menu.push("GetDataTB|" + response.data.parentList[i].id + "|" + num + "|" + response.data.parentList[i].username);
                            }
                        }
                        else {
                            if (Position == "MEMBER") {
                                AA += " / <a class='linkNav AA' onclick='GetDataTableGame(`" + response.data.parentList[i].id + "`," + num + ",``,`" + response.data.parentList[i].username + "`)'>" + response.data.parentList[i].username + "</a>";
                                Menu.push("GetDataTableGame|" + response.data.parentList[i].id + "|" + num + "||" + response.data.parentList[i].username);
                            }
                            else {
                                AA += " / <a class='linkNav AA' onclick='GetDataTable1(`" + response.data.parentList[i].id + "`," + num + ")'>" + response.data.parentList[i].username + "</a>";
                                Menu.push("GetDataTable1|" + response.data.parentList[i].id + "|" + num + "|" + response.data.parentList[i].username);
                            }
                        }
                    }
                    $("#navMenu").append(AA);
                    $("#navMenu > a:last-child").css("text-decoration", "underline");
                }

                var htmlAll = "";
                var htmlHead = "";
                var htmlData = "";
                var htmlFoot = "";

                htmlHead += "<thead class='rgba-green-slight'>";
                htmlHead += "<tr>";
                htmlHead += "<th rowspan='2' class='align-middle' style='width: 2.5%; color: #f1ca34; background-color: rgb(70, 34, 14); border: 1px #ced4da solid;' set-lan='text:No'></th>";
                htmlHead += "<th rowspan='2' class='align-middle' style='width: 7.5%; left: 2%; text-align: left; padding-left: 5px; color: #f1ca34; background-color: rgb(70, 34, 14); border: 1px #ced4da solid;' set-lan='text:Username'></th>";
                htmlHead += "<th rowspan='2' class='align-middle' style='width: 7.5%; left: 2%; text-align: left; padding-left: 5px; color: #f1ca34; background-color: rgb(70, 34, 14); border: 1px #ced4da solid;' set-lan='text:Nickname'></th>";
                htmlHead += "<th rowspan='2' class='align-middle' style='width: 7.5%; left: 2%; color: #f1ca34; background-color: rgb(70, 34, 14); border: 1px #ced4da solid;' set-lan='text:Level'></th>";
                htmlHead += "<th rowspan='2' class='align-middle' style='width: 9%; left: 8%; text-align: right; padding-right: 5px; color: #f1ca34; background-color: rgb(70, 34, 14); border: 1px #ced4da solid;' set-lan='text:Valid turn'></th>";

                var house = -(parseFloat(response.data.summary.winLose / parseFloat(response.data.summary.validTurnover)) * 100);
                house = parseFloat(house).toFixed(2);
                htmlHead += "<th rowspan='2' class='align-middle' style='width: 8%; left: 3%; text-align: right; padding-right: 5px; color: #f1ca34; background-color: rgb(70, 34, 14); border: 1px #ced4da solid'><label style='margin-bottom: 0rem;' set-lan='text:Member W/L'></label><br/><label>&nbsp;(100%)</label><br/><label style='margin-bottom: 0rem;' set-lan='text:House Edge'></label><br/>";
                if (response.total > 0) {
                    if (house < 0) {
                        htmlHead += "<label style='color: red !important;'>&nbsp;(" + house + "%)</label></th>";
                    }
                    else {
                        htmlHead += "<label>&nbsp;(" + house + "%)</label></th>";
                    }
                } else {
                    htmlHead += "<label>&nbsp;(%)</label></th>";
                }

                htmlHead += "<th colspan='3' set-lan='text:Member' style='left: 0 !important; color: #f1ca34; background-color: rgb(70, 34, 14); border: 1px #ced4da solid;'></th>";
                htmlHead += "<th colspan='3' set-lan='text:Agent' style='left: 0 !important; color: #f1ca34; background-color: rgb(70, 34, 14); border: 1px #ced4da solid;'></th>";
                htmlHead += "<th colspan='3' set-lan='text:Company' style='left: 0 !important; color: #f1ca34; background-color: rgb(70, 34, 14); border: 1px #ced4da solid;'></th>";
                htmlHead += "</tr>";
                htmlHead += "<tr>";
                htmlHead += "<th style='left: 0 !important; width: 5%; color: #f1ca34; background-color: rgb(70, 34, 14); border: 1px #ced4da solid; text-align: right; padding-right: 5px;' set-lan='text:Win lose'></th>";
                htmlHead += "<th style='left: 0 !important; width: 5%; color: #f1ca34; background-color: rgb(70, 34, 14); border: 1px #ced4da solid; text-align: right; padding-right: 5px;' set-lan='text:Comm'></th>";
                htmlHead += "<th style='left: 0 !important; width: 5%; color: #f1ca34; background-color: rgb(70, 34, 14); border: 1px #ced4da solid; text-align: right; padding-right: 5px;' set-lan='text:Total-'></th>";
                htmlHead += "<th style='left: 0 !important; width: 5%; color: #f1ca34; background-color: rgb(70, 34, 14); border: 1px #ced4da solid; text-align: right; padding-right: 5px;' set-lan='text:Win lose'></th>";
                htmlHead += "<th style='left: 0 !important; width: 5%; color: #f1ca34; background-color: rgb(70, 34, 14); border: 1px #ced4da solid; text-align: right; padding-right: 5px;' set-lan='text:Comm'></th>";
                htmlHead += "<th style='left: 0 !important; width: 5%; color: #f1ca34; background-color: rgb(70, 34, 14); border: 1px #ced4da solid; text-align: right; padding-right: 5px;' set-lan='text:Total-'></th>";
                htmlHead += "<th style='left: 0 !important; width: 5%; color: #f1ca34; background-color: rgb(70, 34, 14); border: 1px #ced4da solid; text-align: right; padding-right: 5px;' set-lan='text:Win lose'></th>";
                htmlHead += "<th style='left: 0 !important; width: 5%; color: #f1ca34; background-color: rgb(70, 34, 14); border: 1px #ced4da solid; text-align: right; padding-right: 5px;' set-lan='text:Comm'></th>";
                htmlHead += "<th style='left: 0 !important; width: 5%; color: #f1ca34; background-color: rgb(70, 34, 14); border: 1px #ced4da solid; text-align: right; padding-right: 5px;' set-lan='text:Total-'></th>";
                htmlHead += "</tr>";
                htmlHead += "</thead>";
                htmlHead += "<tbody>";

                htmlFoot += "</tbody>";
                htmlFoot += "<tfoot class='rgba-yellow-slight'>";
                htmlFoot += "<tr class='total'>";
                htmlFoot += "<td style='font-weight: bold; background-color: #f2e8be; border-right: 1px #ced4da solid; width: 2.5%;'></td>";
                htmlFoot += "<td style='font-weight: bold; background-color: #f2e8be; border-right: 1px #ced4da solid; width: 7.5%; left: 2%;'></td>";
                htmlFoot += "<td style='font-weight: bold; background-color: #f2e8be; border-right: 1px #ced4da solid; width: 7.5%; left: 2%;'></td>";
                htmlFoot += "<td set-lan='text:Total' style='font-weight: bold; background-color: #f2e8be; border-right: 1px #ced4da solid; width: 9.5%; left: 2%;'></td>";
                htmlFoot += "<td id='totalValid' style='font-weight: bold; background-color: #f2e8be; border-right: 1px #ced4da solid; width: 9%; left: 8%;'>-</td>";
                htmlFoot += "<td id='totalWL' style='font-weight: bold; background-color: #f2e8be; border-right: 1px #ced4da solid; width: 9%; left: 8%;'>-</td>";
                htmlFoot += "<td id='totalPU_Win' style='font-weight: bold; background-color: #f2e8be; border-right: 1px #ced4da solid; left: 9%;'>-</td>";
                htmlFoot += "<td id='totalPU_Com' style='font-weight: bold; background-color: #f2e8be; border-right: 1px #ced4da solid; left: 0;'>-</td>";
                htmlFoot += "<td id='totalPU_Total' style='font-weight: bold; background-color: #f2e8be; border-right: 1px #ced4da solid; left: 0;'>-</td>";
                htmlFoot += "<td id='totalU_Win' style='font-weight: bold; background-color: #f2e8be; border-right: 1px #ced4da solid; left: 0;'>-</td>";
                htmlFoot += "<td id='totalU_Com' style='font-weight: bold; background-color: #f2e8be; border-right: 1px #ced4da solid; left: 0;'>-</td>";
                htmlFoot += "<td id='totalU_Total' style='font-weight: bold; background-color: #f2e8be; border-right: 1px #ced4da solid; left: 0;'>-</td>";
                htmlFoot += "<td id='totalNU_Win' style='font-weight: bold; background-color: #f2e8be; border-right: 1px #ced4da solid; left: 0;'>-</td>";
                htmlFoot += "<td id='totalNU_Com' style='font-weight: bold; background-color: #f2e8be; border-right: 1px #ced4da solid; left: 0;'>-</td>";
                htmlFoot += "<td id='totalNU_Total' style='font-weight: bold; background-color: #f2e8be; border-right: 1px #ced4da solid; left: 0;'>-</td>";
                htmlFoot += "</tr>";
                htmlFoot += "</tfoot>";

                if (response.total > 0) {
                    var no = 1;
                    var Position = "";
                    var Total = 0;

                    for (var i = 0; i < response.data.detail.length; i++) {
                        htmlData += "<tr>";
                        htmlData += "<td class='aligncenter' style='width: 2.5%;'>" + (((num - 1) * 100) + no) + "</td>";

                        if (response.data.detail[i].position == "MEMBER") {
                            htmlData += "<td style='width: 7.5%; left: 2%;'><p onclick='GetDataTableGame(`" + response.data.detail[i].userID + "`,`" + num + "`,`" + Menu + "`,`" + response.data.detail[i].username + "`)' class='linkNav overflow ellipsis linkUser' title='" + response.data.detail[i].username + "'>" + response.data.detail[i].username + "</p></td>";
                        }
                        else {
                            htmlData += "<td style='width: 7.5%; left: 2%;'><p onclick='GetDataTable1(`" + response.data.detail[i].userID + "`,`" + num + "`,``)' class='linkNav overflow ellipsis linkUser' title='" + response.data.detail[i].username + "'>" + response.data.detail[i].username + "</p></td>";
                        }

                        if (response.data.detail[i].position == "SH_HOLDER") {
                            Position = "Shareholder";
                        }
                        else {
                            var txt = response.data.detail[i].position;
                            var txt2 = txt.toLowerCase();
                            Position = capitalizeFirstLetter(txt2);
                        }
                        htmlData += "<td style='width: 7.5%; left: 2%;'><p class='overflow ellipsis' title='" + response.data.detail[i].nickname + "'>" + response.data.detail[i].nickname + "</p></td>";
                        htmlData += "<td class='aligncenter' set-lan='text:" + Position + "' style='width: 7.5%; left: 2%;'></td>";

                        // >> validTurnover << //
                        var Amt2 = parseFloat(response.data.detail[i].validTurnover).toFixed(2);
                        var n2 = Amt2.indexOf("-");
                        if (n2 == 0) {
                            htmlData += "<td class='alignright' style='color: red; width: 9%; left: 8%;'>" + response.data.detail[i].validTurnover.toFixed(2).toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                        }
                        else {
                            htmlData += "<td class='alignright' style='width: 9%; left: 8%;'>" + response.data.detail[i].validTurnover.toFixed(2).toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                        }

                        // >> winLose << //
                        var AmtWinLose = parseFloat(response.data.detail[i].winLose).toFixed(2);
                        var nWinLose = AmtWinLose.indexOf("-");
                        if (nWinLose == 0) {
                            htmlData += "<td class='alignright' style='color: red; width: 9%; left: 8%;'>" + response.data.detail[i].winLose.toFixed(2).toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                        }
                        else {
                            htmlData += "<td class='alignright' style='width: 9%; left: 8%;'>" + response.data.detail[i].winLose.toFixed(2).toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                        }

                        // >> previousUser << //
                        var AmtP1 = parseFloat(response.data.detail[i].previousUser.winLose).toFixed(2);
                        var nP1 = AmtP1.indexOf("-");
                        if (nP1 == 0) {
                            htmlData += "<td class='alignright' style='color: red; background-color: #fff9e06b; left: 0 !important;'>" + response.data.detail[i].previousUser.winLose.toFixed(2).toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                        }
                        else {
                            htmlData += "<td class='alignright' style='background-color: #fff9e06b; left: 0 !important;'>" + response.data.detail[i].previousUser.winLose.toFixed(2).toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                        }

                        var AmtP2 = parseFloat(response.data.detail[i].previousUser.com).toFixed(2);
                        var nP2 = AmtP2.indexOf("-");
                        if (nP2 == 0) {
                            htmlData += "<td class='alignright' style='color: red; background-color: #fff9e06b; left: 0 !important;'>" + response.data.detail[i].previousUser.com.toFixed(2).toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                        }
                        else {
                            htmlData += "<td class='alignright' style='background-color: #fff9e06b; left: 0 !important;'>" + response.data.detail[i].previousUser.com.toFixed(2).toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                        }

                        var AmtP3 = parseFloat(response.data.detail[i].previousUser.total).toFixed(2);
                        var nP3 = AmtP3.indexOf("-");
                        if (nP3 == 0) {
                            htmlData += "<td class='alignright' style='color: red; background-color: #fff9e06b; left: 0 !important;'>" + response.data.detail[i].previousUser.total.toFixed(2).toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                        }
                        else {
                            htmlData += "<td class='alignright' style='background-color: #fff9e06b; left: 0 !important;'>" + response.data.detail[i].previousUser.total.toFixed(2).toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                        }

                        // >> User << //
                        var AmtU1 = parseFloat(response.data.detail[i].user.winLose).toFixed(2);
                        var nU1 = AmtU1.indexOf("-");
                        if (nU1 == 0) {
                            htmlData += "<td class='alignright' style='color: red; background-color: #fcea9e75; left: 0 !important;'>" + response.data.detail[i].user.winLose.toFixed(2).toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                        }
                        else {
                            htmlData += "<td class='alignright' style='background-color: #fcea9e75; left: 0 !important;'>" + response.data.detail[i].user.winLose.toFixed(2).toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                        }

                        var AmtU2 = parseFloat(response.data.detail[i].user.com).toFixed(2);
                        var nU2 = AmtU2.indexOf("-");
                        if (nU2 == 0) {
                            htmlData += "<td class='alignright' style='color: red; background-color: #fcea9e75; left: 0 !important;'>" + response.data.detail[i].user.com.toFixed(2).toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                        }
                        else {
                            htmlData += "<td class='alignright' style='background-color: #fcea9e75; left: 0 !important;'>" + response.data.detail[i].user.com.toFixed(2).toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                        }

                        var AmtU3 = parseFloat(response.data.detail[i].user.total).toFixed(2);
                        var nU3 = AmtU3.indexOf("-");
                        if (nU3 == 0) {
                            htmlData += "<td class='alignright' style='color: red; background-color: #fcea9e75; left: 0 !important;'>" + response.data.detail[i].user.total.toFixed(2).toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                        }
                        else {
                            htmlData += "<td class='alignright' style='background-color: #fcea9e75; left: 0 !important;'>" + response.data.detail[i].user.total.toFixed(2).toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                        }

                        // >> nextUser << //
                        var AmtN1 = parseFloat(response.data.detail[i].nextUser.winLose).toFixed(2);
                        var nN1 = AmtN1.indexOf("-");
                        if (nN1 == 0) {
                            htmlData += "<td class='alignright' style='color: red; background-color: #ffd06373; left: 0 !important;'>" + response.data.detail[i].nextUser.winLose.toFixed(2).toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                        }
                        else {
                            htmlData += "<td class='alignright' style='background-color: #ffd06373; left: 0 !important;'>" + response.data.detail[i].nextUser.winLose.toFixed(2).toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                        }

                        var AmtN2 = parseFloat(response.data.detail[i].nextUser.com).toFixed(2);
                        var nN2 = AmtN2.indexOf("-");
                        if (nN2 == 0) {
                            htmlData += "<td class='alignright' style='color: red; background-color: #ffd06373; left: 0 !important;'>" + response.data.detail[i].nextUser.com.toFixed(2).toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                        }
                        else {
                            htmlData += "<td class='alignright' style='background-color: #ffd06373; left: 0 !important;'>" + response.data.detail[i].nextUser.com.toFixed(2).toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                        }

                        var AmtN3 = parseFloat(response.data.detail[i].nextUser.total).toFixed(2);
                        var nN3 = AmtN3.indexOf("-");
                        if (nN3 == 0) {
                            htmlData += "<td class='alignright' style='color: red; background-color: #ffd06373; left: 0 !important;'>" + response.data.detail[i].nextUser.total.toFixed(2).toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                        }
                        else {
                            htmlData += "<td class='alignright' style='background-color: #ffd06373; left: 0 !important;'>" + response.data.detail[i].nextUser.total.toFixed(2).toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                        }

                        htmlData += "</tr>";
                        Total = Total + response.data.detail[i].credit;
                        no++;
                    }

                    htmlAll = htmlHead + htmlData + htmlFoot;
                    $("#tbData").append(htmlAll);
                    SetLan(localStorage.getItem("Language"));
                    ////$("#tb2").css('display', 'flex');
                    $("#tb").css('display', 'none');


                    $("#totalValid").text(response.data.summary.validTurnover.toFixed(2).toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,'));
                    $("#totalWL").text(response.data.summary.winLose.toFixed(2).toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,'));

                    $("#totalU_Win").text(response.data.summary.user.winLose.toFixed(2).toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,'));
                    $("#totalU_Com").text(response.data.summary.user.com.toFixed(2).toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,'));
                    $("#totalU_Total").text(response.data.summary.user.total.toFixed(2).toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,'));

                    $("#totalPU_Win").text(response.data.summary.previousUser.winLose.toFixed(2).toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,'));
                    $("#totalPU_Com").text(response.data.summary.previousUser.com.toFixed(2).toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,'));
                    $("#totalPU_Total").text(response.data.summary.previousUser.total.toFixed(2).toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,'));

                    $("#totalNU_Win").text(response.data.summary.nextUser.winLose.toFixed(2).toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,'));
                    $("#totalNU_Com").text(response.data.summary.nextUser.com.toFixed(2).toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,'));
                    $("#totalNU_Total").text(response.data.summary.nextUser.total.toFixed(2).toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,'));

                    var A2 = parseFloat(response.data.summary.validTurnover).toFixed(2);
                    var n2 = A2.indexOf("-");
                    if (n2 == 0) {
                        document.getElementById("totalValid").style.color = "red";
                    }
                    else {
                        document.getElementById("totalValid").style.color = "rgb(23, 23, 44)";
                    }

                    var AWL = parseFloat(response.data.summary.winLose).toFixed(2);
                    var nWL = AWL.indexOf("-");
                    if (nWL == 0) {
                        document.getElementById("totalWL").style.color = "red";
                    }
                    else {
                        document.getElementById("totalWL").style.color = "rgb(23, 23, 44)";
                    }

                    var A11 = parseFloat(response.data.summary.user.winLose).toFixed(2);
                    var n11 = A11.indexOf("-");
                    if (n11 == 0) {
                        document.getElementById("totalU_Win").style.color = "red";
                    }
                    else {
                        document.getElementById("totalU_Win").style.color = "rgb(23, 23, 44)";
                    }

                    var A12 = parseFloat(response.data.summary.user.com).toFixed(2);
                    var n12 = A12.indexOf("-");
                    if (n12 == 0) {
                        document.getElementById("totalU_Com").style.color = "red";
                    }
                    else {
                        document.getElementById("totalU_Com").style.color = "rgb(23, 23, 44)";
                    }

                    var A13 = parseFloat(response.data.summary.user.total).toFixed(2);
                    var n13 = A13.indexOf("-");
                    if (n13 == 0) {
                        document.getElementById("totalU_Total").style.color = "red";
                    }
                    else {
                        document.getElementById("totalU_Total").style.color = "rgb(23, 23, 44)";
                    }

                    var A21 = parseFloat(response.data.summary.previousUser.winLose).toFixed(2);
                    var n21 = A21.indexOf("-");
                    if (n21 == 0) {
                        document.getElementById("totalPU_Win").style.color = "red";
                    }
                    else {
                        document.getElementById("totalPU_Win").style.color = "rgb(23, 23, 44)";
                    }

                    var A22 = parseFloat(response.data.summary.previousUser.com).toFixed(2);
                    var n22 = A22.indexOf("-");
                    if (n22 == 0) {
                        document.getElementById("totalPU_Com").style.color = "red";
                    }
                    else {
                        document.getElementById("totalPU_Com").style.color = "rgb(23, 23, 44)";
                    }

                    var A23 = parseFloat(response.data.summary.previousUser.total).toFixed(2);
                    var n23 = A23.indexOf("-");
                    if (n23 == 0) {
                        document.getElementById("totalPU_Total").style.color = "red";
                    }
                    else {
                        document.getElementById("totalPU_Total").style.color = "rgb(23, 23, 44)";
                    }

                    var A31 = parseFloat(response.data.summary.nextUser.winLose).toFixed(2);
                    var n31 = A31.indexOf("-");
                    if (n31 == 0) {
                        document.getElementById("totalNU_Win").style.color = "red";
                    }
                    else {
                        document.getElementById("totalNU_Win").style.color = "rgb(23, 23, 44)";
                    }

                    var A32 = parseFloat(response.data.summary.nextUser.com).toFixed(2);
                    var n32 = A32.indexOf("-");
                    if (n32 == 0) {
                        document.getElementById("totalNU_Com").style.color = "red";
                    }
                    else {
                        document.getElementById("totalNU_Com").style.color = "rgb(23, 23, 44)";
                    }

                    var A33 = parseFloat(response.data.summary.nextUser.total).toFixed(2);
                    var n33 = A33.indexOf("-");
                    if (n33 == 0) {
                        document.getElementById("totalNU_Total").style.color = "red";
                    }
                    else {
                        document.getElementById("totalNU_Total").style.color = "rgb(23, 23, 44)";
                    }
                }
                else {
                    htmlData += "<tr><td colspan='15' style='text-align: center;' set-lan='text:No data.'></td></tr>";
                    htmlAll = htmlHead + htmlData + htmlFoot;
                    $("#tbData").append(htmlAll);

                    $("#totalValid").text("-");
                    $("#totalWL").text("-");

                    $("#totalU_Win").text("-");
                    $("#totalU_Com").text("-");
                    $("#totalU_Total").text("-");

                    $("#totalPU_Win").text("-");
                    $("#totalPU_Com").text("-");
                    $("#totalPU_Total").text("-");

                    $("#totalNU_Win").text("-");
                    $("#totalNU_Com").text("-");
                    $("#totalNU_Total").text("-");
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

        const postTableMember = async (tbID, num) => {
            $("#navMenu , #tbData").html("");
            ////$("#tb2").css('display', 'flex');
            $("#tb").css('display', 'none');
            $('#btnExport ,#txtExport').css('display', 'initial');

            const parameter = {
                startDate: $("#startdate").val(),
                startTime: $("#starttime").val() + ":00",
                endDate: $("#todate").val(),
                endTime: $("#totime").val() + ":00",
                userID: tbID,
                page: num,
                size: 100
            }
            const requestAwait = await fetchDataSite(`${apiURL}/v1/report/win_lose_member`, 'POST', "include", parameter)
            const response = await requestAwait.json()

            if (response.messageCode == 0000 || response.messageCode == null) {
                var AA = "";
                var Menu = [];
                if (response.data.parentList.length != 0) {
                    for (var i = 0; i < response.data.parentList.length; i++) {
                        var Position = response.data.parentList[i].position;
                        if (AA == "") {
                            if (Position == "MEMBER") {
                                AA += "<a class='linkNav AA' onclick='GetDataTableGame(`" + response.data.parentList[i].id + "`," + num + ",``,`" + response.data.parentList[i].username + "`)'>" + response.data.parentList[i].username + "</a>";
                                Menu.push("GetDataTableGame|" + response.data.parentList[i].id + "|" + num + "||" + response.data.parentList[i].username);
                            }
                            else {
                                AA += "<a class='linkNav AA' onclick='GetDataTB(`" + response.data.parentList[i].id + "`," + num + ")'>" + response.data.parentList[i].username + "</a>";
                                Menu.push("GetDataTB|" + response.data.parentList[i].id + "|" + num + "|" + response.data.parentList[i].username);
                            }
                        }
                        else {
                            if (Position == "MEMBER") {
                                AA += " / <a class='linkNav AA' onclick='GetDataTableGame(`" + response.data.parentList[i].id + "`," + num + ",``,`" + response.data.parentList[i].username + "`)'>" + response.data.parentList[i].username + "</a>";
                                Menu.push("GetDataTableGame|" + response.data.parentList[i].id + "|" + num + "||" + response.data.parentList[i].username);
                            }
                            else {
                                AA += " / <a class='linkNav AA' onclick='GetDataTable1(`" + response.data.parentList[i].id + "`," + num + ")'>" + response.data.parentList[i].username + "</a>";
                                Menu.push("GetDataTable1|" + response.data.parentList[i].id + "|" + num + "|" + response.data.parentList[i].username);
                            }
                        }
                    }
                    $("#navMenu").append(AA);
                    $("#navMenu > a:last-child").css("text-decoration", "underline");
                }

                var htmlAll = "";
                var htmlHead = "";
                var htmlData = "";
                var htmlFoot = "";
                htmlHead += "<thead class='rgba-green-slight'>";
                htmlHead += "<tr>";
                htmlHead += "<th rowspan='2' class='align-middle' style='width: 7%; color: #f1ca34; background-color: rgb(70, 34, 14); border: 1px #ced4da solid;' set-lan='text:Date'></th>";
                htmlHead += "<th rowspan='2' class='align-middle' style='width: 7%; left: 7%; color: #f1ca34; background-color: rgb(70, 34, 14); border: 1px #ced4da solid;' set-lan='text:Provider'></th>";
                htmlHead += "<th rowspan='2' class='align-middle' style='width: 7%; left: 7%; color: #f1ca34; background-color: rgb(70, 34, 14); border: 1px #ced4da solid;' set-lan='text:Count'></th>";
                htmlHead += "<th rowspan='2' class='align-middle' style='width: 10%; left: 7%; text-align: right; padding-right: 5px; color: #f1ca34; background-color: rgb(70, 34, 14); border: 1px #ced4da solid;' set-lan='text:Valid turn'></th>";
                htmlHead += "<th colspan='3' set-lan='text:Member' style='left: 0%; color: #f1ca34; background-color: rgb(70, 34, 14); border: 1px #ced4da solid;'></th>";
                htmlHead += "<th colspan='3' set-lan='text:Agent' style='left: 0%; color: #f1ca34; background-color: rgb(70, 34, 14); border: 1px #ced4da solid;'></th>";
                htmlHead += "<th colspan='3' set-lan='text:Company' style='left: 0%; color: #f1ca34; background-color: rgb(70, 34, 14); border: 1px #ced4da solid;'></th>";
                htmlHead += "</tr>";
                htmlHead += "<tr>";
                htmlHead += "<th style='left: 0%; width: 5%; color: #f1ca34; background-color: rgb(70, 34, 14); border: 1px #ced4da solid; text-align: right; padding-right: 5px;' set-lan='text:Win lose'></th>";
                htmlHead += "<th style='left: 0%; width: 5%; color: #f1ca34; background-color: rgb(70, 34, 14); border: 1px #ced4da solid; text-align: right; padding-right: 5px;' set-lan='text:Comm'></th>";
                htmlHead += "<th style='left: 0%; width: 5%; color: #f1ca34; background-color: rgb(70, 34, 14); border: 1px #ced4da solid; text-align: right; padding-right: 5px;' set-lan='text:Total-'></th>";
                htmlHead += "<th style='left: 0%; width: 5%; color: #f1ca34; background-color: rgb(70, 34, 14); border: 1px #ced4da solid; text-align: right; padding-right: 5px;' set-lan='text:Win lose'></th>";
                htmlHead += "<th style='left: 0%; width: 5%; color: #f1ca34; background-color: rgb(70, 34, 14); border: 1px #ced4da solid; text-align: right; padding-right: 5px;' set-lan='text:Comm'></th>";
                htmlHead += "<th style='left: 0%; width: 5%; color: #f1ca34; background-color: rgb(70, 34, 14); border: 1px #ced4da solid; text-align: right; padding-right: 5px;' set-lan='text:Total-'></th>";
                htmlHead += "<th style='left: 0%; width: 5%; color: #f1ca34; background-color: rgb(70, 34, 14); border: 1px #ced4da solid; text-align: right; padding-right: 5px;' set-lan='text:Win lose'></th>";
                htmlHead += "<th style='left: 0%; width: 5%; color: #f1ca34; background-color: rgb(70, 34, 14); border: 1px #ced4da solid; text-align: right; padding-right: 5px;' set-lan='text:Comm'></th>";
                htmlHead += "<th style='left: 0%; width: 5%; color: #f1ca34; background-color: rgb(70, 34, 14); border: 1px #ced4da solid; text-align: right; padding-right: 5px;' set-lan='text:Total-'></th>";
                htmlHead += "</tr>";
                htmlHead += "</thead>";
                htmlHead += "<tbody>";

                htmlFoot += "</tbody>";
                htmlFoot += "<tfoot class='rgba-yellow-slight'>";
                htmlFoot += "<tr class='total'>";
                htmlFoot += "<td style='font-weight: bold; background-color: #f2e8be; border-right: 1px #ced4da solid; width: 7%;'></td>";
                htmlFoot += "<td style='font-weight: bold; background-color: #f2e8be; border-right: 1px #ced4da solid; width: 7%; left: 7%;'></td>";
                htmlFoot += "<td style='font-weight: bold; background-color: #f2e8be; border-right: 1px #ced4da solid; width: 7%; left: 7%;' set-lan='text:Total'></td>";
                htmlFoot += "<td style='font-weight: bold; background-color: #f2e8be; border-right: 1px #ced4da solid; width: 10%; left: 7%;' id='totalValid'>-</td>";
                htmlFoot += "<td style='font-weight: bold; background-color: #f2e8be; border-right: 1px #ced4da solid; left: 0 !important;' id='totalPU_Win'>-</td>";
                htmlFoot += "<td style='font-weight: bold; background-color: #f2e8be; border-right: 1px #ced4da solid; left: 0 !important;' id='totalPU_Com'>-</td>";
                htmlFoot += "<td style='font-weight: bold; background-color: #f2e8be; border-right: 1px #ced4da solid; left: 0 !important;' id='totalPU_Total'>-</td>";
                htmlFoot += "<td style='font-weight: bold; background-color: #f2e8be; border-right: 1px #ced4da solid; left: 0 !important;' id='totalU_Win'>-</td>";
                htmlFoot += "<td style='font-weight: bold; background-color: #f2e8be; border-right: 1px #ced4da solid; left: 0 !important;' id='totalU_Com'>-</td>";
                htmlFoot += "<td style='font-weight: bold; background-color: #f2e8be; border-right: 1px #ced4da solid; left: 0 !important;' id='totalU_Total'>-</td>";
                htmlFoot += "<td style='font-weight: bold; background-color: #f2e8be; border-right: 1px #ced4da solid; left: 0 !important;' id='totalNU_Win'>-</td>";
                htmlFoot += "<td style='font-weight: bold; background-color: #f2e8be; border-right: 1px #ced4da solid; left: 0 !important;' id='totalNU_Com'>-</td>";
                htmlFoot += "<td style='font-weight: bold; background-color: #f2e8be; border-right: 1px #ced4da solid; left: 0 !important;' id='totalNU_Total'>-</td>";
                htmlFoot += "</tr>";
                htmlFoot += "</tfoot>";

                if (response.total > 0) {
                    for (var i = 0; i < response.data.groupByDate.length; i++) {
                        htmlData += "<tr>";
                        //htmlData += "<td style='width: 7%;' class='aligncenter align-middle' rowspan='" + response.data.groupByDate[i].detail.length + "'>" + response.data.groupByDate[i].date + "</td>";

                        for (var j = 0; j < response.data.groupByDate[i].detail.length; j++) {
                            var Date = response.data.groupByDate[i].date;
                            var d = Date.split('-')[2];
                            var m = Date.split('-')[1];
                            var y = Date.split('-')[0];
                            Date = d + "/" + m + "/" + y;

                            htmlData += "<td style='width: 7%;' class='aligncenter align-middle'>" + Date + "</td>";
                            htmlData += "<td style='width: 7%; left: 7%;'><p onclick='GetDataTableGame(`" + response.data.groupByDate[i].detail[j].provider + "`,`" + response.data.groupByDate[i].date + "`,`" + tbID + "`,`" + Menu + "`)' class='linkNav overflow ellipsis linkUser' title='" + response.data.groupByDate[i].detail[j].provider + "'>" + response.data.groupByDate[i].detail[j].provider + "</p></td>";
                            htmlData += "<td style='width: 7%; left: 7%;' class='aligncenter'>" + response.data.groupByDate[i].detail[j].count + "</td>";

                            //// >> turnover << //
                            //var Amt1 = parseFloat(response.data.groupByDate[i].detail[j].turnover).toFixed(2);
                            //var n1 = Amt1.indexOf("-");
                            //if (n1 == 0) {
                            //    htmlData += "<td class='alignright' style='color: red;'>" + response.data.groupByDate[i].detail[j].turnover.toFixed(2).toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                            //}
                            //else {
                            //    htmlData += "<td class='alignright'>" + response.data.groupByDate[i].detail[j].turnover.toFixed(2).toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                            //}

                            // >> validTurnover << //
                            var Amt2 = parseFloat(response.data.groupByDate[i].detail[j].validTurnover).toFixed(2);
                            var n2 = Amt2.indexOf("-");
                            if (n2 == 0) {
                                htmlData += "<td class='alignright' style='color: red; width: 10%; left: 7%;'>" + response.data.groupByDate[i].detail[j].validTurnover.toFixed(2).toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                            }
                            else {
                                htmlData += "<td class='alignright' style='width: 10%; left: 7%;'>" + response.data.groupByDate[i].detail[j].validTurnover.toFixed(2).toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                            }

                            // >> previousUser << //
                            var AmtP1 = parseFloat(response.data.groupByDate[i].detail[j].previousUser.winLose).toFixed(2);
                            var nP1 = AmtP1.indexOf("-");
                            if (nP1 == 0) {
                                htmlData += "<td class='alignright' style='left: 0%; color: red; background-color: #fff9e06b;'>" + response.data.groupByDate[i].detail[j].previousUser.winLose.toFixed(2).toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                            }
                            else {
                                htmlData += "<td class='alignright' style='left: 0%; background-color: #fff9e06b;'>" + response.data.groupByDate[i].detail[j].previousUser.winLose.toFixed(2).toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                            }

                            var AmtP2 = parseFloat(response.data.groupByDate[i].detail[j].previousUser.com).toFixed(2);
                            var nP2 = AmtP2.indexOf("-");
                            if (nP2 == 0) {
                                htmlData += "<td class='alignright' style='left: 0%; color: red; background-color: #fff9e06b;'>" + response.data.groupByDate[i].detail[j].previousUser.com.toFixed(2).toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                            }
                            else {
                                htmlData += "<td class='alignright' style='left: 0%; background-color: #fff9e06b;'>" + response.data.groupByDate[i].detail[j].previousUser.com.toFixed(2).toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                            }

                            var AmtP3 = parseFloat(response.data.groupByDate[i].detail[j].previousUser.total).toFixed(2);
                            var nP3 = AmtP3.indexOf("-");
                            if (nP3 == 0) {
                                htmlData += "<td class='alignright' style='left: 0%; color: red; background-color: #fff9e06b;'>" + response.data.groupByDate[i].detail[j].previousUser.total.toFixed(2).toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                            }
                            else {
                                htmlData += "<td class='alignright' style='left: 0%; background-color: #fff9e06b;'>" + response.data.groupByDate[i].detail[j].previousUser.total.toFixed(2).toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                            }

                            // >> User << //
                            var AmtU1 = parseFloat(response.data.groupByDate[i].detail[j].user.winLose).toFixed(2);
                            var nU1 = AmtU1.indexOf("-");
                            if (nU1 == 0) {
                                htmlData += "<td class='alignright' style='left: 0%; color: red; background-color: #fcea9e75;'>" + response.data.groupByDate[i].detail[j].user.winLose.toFixed(2).toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                            }
                            else {
                                htmlData += "<td class='alignright' style='left: 0%; background-color: #fcea9e75;'>" + response.data.groupByDate[i].detail[j].user.winLose.toFixed(2).toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                            }

                            var AmtU2 = parseFloat(response.data.groupByDate[i].detail[j].user.com).toFixed(2);
                            var nU2 = AmtU2.indexOf("-");
                            if (nU2 == 0) {
                                htmlData += "<td class='alignright' style='left: 0%; color: red; background-color: #fcea9e75;'>" + response.data.groupByDate[i].detail[j].user.com.toFixed(2).toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                            }
                            else {
                                htmlData += "<td class='alignright' style='left: 0%; background-color: #fcea9e75;'>" + response.data.groupByDate[i].detail[j].user.com.toFixed(2).toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                            }

                            var AmtU3 = parseFloat(response.data.groupByDate[i].detail[j].user.total).toFixed(2);
                            var nU3 = AmtU3.indexOf("-");
                            if (nU3 == 0) {
                                htmlData += "<td class='alignright' style='left: 0%; color: red; background-color: #fcea9e75;'>" + response.data.groupByDate[i].detail[j].user.total.toFixed(2).toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                            }
                            else {
                                htmlData += "<td class='alignright' style='left: 0%; background-color: #fcea9e75;'>" + response.data.groupByDate[i].detail[j].user.total.toFixed(2).toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                            }

                            // >> nextUser << //
                            var AmtN1 = parseFloat(response.data.groupByDate[i].detail[j].nextUser.winLose).toFixed(2);
                            var nN1 = AmtN1.indexOf("-");
                            if (nN1 == 0) {
                                htmlData += "<td class='alignright' style='left: 0%; color: red; background-color: #ffd06373;'>" + response.data.groupByDate[i].detail[j].nextUser.winLose.toFixed(2).toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                            }
                            else {
                                htmlData += "<td class='alignright' style='left: 0%; background-color: #ffd06373;'>" + response.data.groupByDate[i].detail[j].nextUser.winLose.toFixed(2).toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                            }

                            var AmtN2 = parseFloat(response.data.groupByDate[i].detail[j].nextUser.com).toFixed(2);
                            var nN2 = AmtN2.indexOf("-");
                            if (nN2 == 0) {
                                htmlData += "<td class='alignright' style='left: 0%; color: red; background-color: #ffd06373;'>" + response.data.groupByDate[i].detail[j].nextUser.com.toFixed(2).toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                            }
                            else {
                                htmlData += "<td class='alignright' style='left: 0%; background-color: #ffd06373;'>" + response.data.groupByDate[i].detail[j].nextUser.com.toFixed(2).toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                            }

                            var AmtN3 = parseFloat(response.data.groupByDate[i].detail[j].nextUser.total).toFixed(2);
                            var nN3 = AmtN3.indexOf("-");
                            if (nN3 == 0) {
                                htmlData += "<td class='alignright' style='left: 0%; color: red; background-color: #ffd06373;'>" + response.data.groupByDate[i].detail[j].nextUser.total.toFixed(2).toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                            }
                            else {
                                htmlData += "<td class='alignright' style='left: 0%; background-color: #ffd06373;'>" + response.data.groupByDate[i].detail[j].nextUser.total.toFixed(2).toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                            }
                            htmlData += "</tr>";
                        }
                    }

                    htmlAll = htmlHead + htmlData + htmlFoot;
                    $("#tbData").append(htmlAll);

                    SetLan(localStorage.getItem("Language"));
                    ////$("#tb2").css('display', 'flex');
                    $("#tb").css('display', 'none');

                    $("#totalValid").text(response.data.summary.validTurnover.toFixed(2).toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,'));

                    $("#totalU_Win").text(response.data.summary.user.winLose.toFixed(2).toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,'));
                    $("#totalU_Com").text(response.data.summary.user.com.toFixed(2).toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,'));
                    $("#totalU_Total").text(response.data.summary.user.total.toFixed(2).toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,'));

                    $("#totalPU_Win").text(response.data.summary.previousUser.winLose.toFixed(2).toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,'));
                    $("#totalPU_Com").text(response.data.summary.previousUser.com.toFixed(2).toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,'));
                    $("#totalPU_Total").text(response.data.summary.previousUser.total.toFixed(2).toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,'));

                    $("#totalNU_Win").text(response.data.summary.nextUser.winLose.toFixed(2).toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,'));
                    $("#totalNU_Com").text(response.data.summary.nextUser.com.toFixed(2).toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,'));
                    $("#totalNU_Total").text(response.data.summary.nextUser.total.toFixed(2).toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,'));

                    var A2 = parseFloat(response.data.summary.validTurnover).toFixed(2);
                    var n2 = A2.indexOf("-");
                    if (n2 == 0) {
                        document.getElementById("totalValid").style.color = "red";
                    }
                    else {
                        document.getElementById("totalValid").style.color = "rgb(23, 23, 44)";
                    }

                    var A11 = parseFloat(response.data.summary.user.winLose).toFixed(2);
                    var n11 = A11.indexOf("-");
                    if (n11 == 0) {
                        document.getElementById("totalU_Win").style.color = "red";
                    }
                    else {
                        document.getElementById("totalU_Win").style.color = "rgb(23, 23, 44)";
                    }

                    var A12 = parseFloat(response.data.summary.user.com).toFixed(2);
                    var n12 = A12.indexOf("-");
                    if (n12 == 0) {
                        document.getElementById("totalU_Com").style.color = "red";
                    }
                    else {
                        document.getElementById("totalU_Com").style.color = "rgb(23, 23, 44)";
                    }

                    var A13 = parseFloat(response.data.summary.user.total).toFixed(2);
                    var n13 = A13.indexOf("-");
                    if (n13 == 0) {
                        document.getElementById("totalU_Total").style.color = "red";
                    }
                    else {
                        document.getElementById("totalU_Total").style.color = "rgb(23, 23, 44)";
                    }

                    var A21 = parseFloat(response.data.summary.previousUser.winLose).toFixed(2);
                    var n21 = A21.indexOf("-");
                    if (n21 == 0) {
                        document.getElementById("totalPU_Win").style.color = "red";
                    }
                    else {
                        document.getElementById("totalPU_Win").style.color = "rgb(23, 23, 44)";
                    }

                    var A22 = parseFloat(response.data.summary.previousUser.com).toFixed(2);
                    var n22 = A22.indexOf("-");
                    if (n22 == 0) {
                        document.getElementById("totalPU_Com").style.color = "red";
                    }
                    else {
                        document.getElementById("totalPU_Com").style.color = "rgb(23, 23, 44)";
                    }

                    var A23 = parseFloat(response.data.summary.previousUser.total).toFixed(2);
                    var n23 = A23.indexOf("-");
                    if (n23 == 0) {
                        document.getElementById("totalPU_Total").style.color = "red";
                    }
                    else {
                        document.getElementById("totalPU_Total").style.color = "rgb(23, 23, 44)";
                    }

                    var A31 = parseFloat(response.data.summary.nextUser.winLose).toFixed(2);
                    var n31 = A31.indexOf("-");
                    if (n31 == 0) {
                        document.getElementById("totalNU_Win").style.color = "red";
                    }
                    else {
                        document.getElementById("totalNU_Win").style.color = "rgb(23, 23, 44)";
                    }

                    var A32 = parseFloat(response.data.summary.nextUser.com).toFixed(2);
                    var n32 = A32.indexOf("-");
                    if (n32 == 0) {
                        document.getElementById("totalNU_Com").style.color = "red";
                    }
                    else {
                        document.getElementById("totalNU_Com").style.color = "rgb(23, 23, 44)";
                    }

                    var A33 = parseFloat(response.data.summary.nextUser.total).toFixed(2);
                    var n33 = A33.indexOf("-");
                    if (n33 == 0) {
                        document.getElementById("totalNU_Total").style.color = "red";
                    }
                    else {
                        document.getElementById("totalNU_Total").style.color = "rgb(23, 23, 44)";
                    }
                }
                else {
                    htmlData += "<tr><td colspan='15' style='text-align: center;' set-lan='text:No data.'></td></tr>";
                    htmlAll = htmlHead + htmlData + htmlFoot;
                    $("#tbData").append(htmlAll);
                    $("#totalValid").text("-");

                    $("#totalU_Win").text("-");
                    $("#totalU_Com").text("-");
                    $("#totalU_Total").text("-");

                    $("#totalPU_Win").text("-");
                    $("#totalPU_Com").text("-");
                    $("#totalPU_Total").text("-");

                    $("#totalNU_Win").text("-");
                    $("#totalNU_Com").text("-");
                    $("#totalNU_Total").text("-");
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

        const postTableGame = async (tbID, num, menu, username) => {
            $("#navMenu , #tbData").html("");
            ////$("#tb2").css('display', 'flex');
            $("#tb").css('display', 'none');

            $('#btnExport ,#txtExport').css('display', 'none');

            const parameter = {
                startDate: $("#startdate").val(),
                startTime: $("#starttime").val() + ":00",
                endDate: $("#todate").val(),
                endTime: $("#totime").val() + ":00",
                userID: tbID,
                page: num,
                size: 100
            }
            const requestAwait = await fetchDataSite(`${apiURL}/v1/report/trans_in_out`, 'POST', "include", parameter)
            const response = await requestAwait.json()

            if (response.messageCode == 0000 || response.messageCode == null) {
                var AA = "";
                var Menu = [];
                if (menu == "" || menu == null) {
                    AA += "<a class='linkNav AA' onclick='GetDataTableGame(`" + tbID + "`,`" + num + "`,`" + menu + "`,`" + username + "`) '>" + username + "</a>";
                    Menu.push("GetDataTableGame|" + tbID + "|" + num + "|" + menu + "|" + username);
                    $("#navMenu").append(AA);
                    $("#navMenu > a:last-child").css("text-decoration", "underline");
                }
                else {
                    var array = menu.split(',');
                    for (var i = 0; i < array.length; i++) {
                        if (AA == "") {
                            AA += "<a class='linkNav AA' onclick='" + array[i].split('|')[0] + "(`" + array[i].split('|')[1] + "`,`" + array[i].split('|')[2] + "`)'>" + array[i].split('|')[3] + "</a>";
                            Menu.push(array[i].split('|')[0] + "|" + array[i].split('|')[1] + "|" + array[i].split('|')[2] + "|" + array[i].split('|')[3]);
                        }
                        else {
                            AA += " / <a class='linkNav AA' onclick='" + array[i].split('|')[0] + "(`" + array[i].split('|')[1] + "`,`" + array[i].split('|')[2] + "`)'>" + array[i].split('|')[3] + "</a>";
                            Menu.push(array[i].split('|')[0] + "|" + array[i].split('|')[1] + "|" + array[i].split('|')[2] + "|" + array[i].split('|')[3]);
                        }
                    }
                    AA += " / <a class='linkNav AA' onclick='GetDataTableGame(`" + tbID + "`,`" + num + "`,`" + menu + "`,`" + username + "`) '>" + username + "</a>";
                    Menu.push("GetDataTableGame|" + tbID + "|" + num + "|" + menu + "|" + username);

                    $("#navMenu").append(AA);
                    $("#navMenu > a:last-child").css("text-decoration", "underline");
                }

                var htmlAll = "";
                var htmlHead = "";
                var htmlData = "";
                var htmlFoot = "";
                htmlHead += "<thead class='rgba-green-slight'>";
                htmlHead += "<tr>";
                htmlHead += "<th rowspan='2' class='align-middle' style='width: 2.5%;' set-lan='text:No'></th>";
                htmlHead += "<th rowspan='2' class='align-middle' style='width: 14.5%; left: 1%; text-align: left; padding-left: 5px;' set-lan='text:Information'></th>";
                htmlHead += "<th rowspan='2' class='align-middle' style='width: 14.5%; left: 14.5%; text-align: left; padding-left: 5px;' set-lan='text:Detail'></th>";
                htmlHead += "<th rowspan='2' class='align-middle' style='width: 9.5%; left: 14.5%; text-align: right; padding-right: 5px;' set-lan='text:Amount'></th>";
                htmlHead += "<th rowspan='2' class='align-middle' style='width: 6%; left: 9.5%;' set-lan='text:Status'></th>";
                htmlHead += "<th rowspan='2' class='align-middle' style='width: 6%; left: 6%;' set-lan='text:IP address'></th>";
                htmlHead += "<th colspan='" + response.data.summary.length + "' set-lan='text:Win/Loss & Comm & Total' style='left: 9.5%; border: 1px #ced4da solid;'></th>";
                htmlHead += "</tr>";
                htmlHead += "<tr>";
                for (var i = 0; i < response.data.summary.length; i++) {
                    var posi = response.data.summary[i].position;
                    if (posi == "MEMBER") {
                        htmlHead += "<th style='width: 5%; left: 0;' set-lan='text:Member'></th>";
                    } else if (posi == "AGENT") {
                        htmlHead += "<th style='width: 5%; left: 0;' set-lan='text:Agent'></th>";
                    } else if (posi == "SH_HOLDER") {
                        htmlHead += "<th style='width: 5%; left: 0;' set-lan='text:Shareholder'></th>";
                    } else if (posi == "COMPANY") {
                        htmlHead += "<th style='width: 5%; left: 0;' set-lan='text:Company'></th>";
                    } else if (posi == "AMB") {
                        htmlHead += "<th style='width: 5%; left: 0;' set-lan='text:AMB'></th>";
                    } else if (posi == "PROVIDER") {
                        htmlHead += "<th style='width: 5%; left: 0;' set-lan='text:Provider'></th>";
                    }
                }
                htmlHead += "</tr>";
                htmlHead += "</thead>";
                htmlHead += "<tbody>";

                htmlFoot += "</tbody>";
                htmlFoot += "<tfoot class='rgba-yellow-slight'>";
                htmlFoot += "<tr class='total'>";
                htmlFoot += "<td style='width: 2.5%;'></td>";
                htmlFoot += "<td style='width: 14.5%; left: 1%;'></td>";
                htmlFoot += "<td style='width: 14.5%; left: 14.5%;'></td>";
                htmlFoot += "<td style='width: 6%;'></td>";
                htmlFoot += "<td style='width: 6%;'></td>";
                htmlFoot += "<td style='width: 9.5%; left: 14.5%;'><span set-lan='text:Total Win/Loss_'></span><br><span set-lan='text:Total Comm_'></span><br><span set-lan='text:Total'></span></td>";
                if (response.data.summary == "" || response.data.summary == null) {
                    htmlFoot += "<td>-</td>";
                } else {
                    for (var i = 0; i < response.data.summary.length; i++) {
                        var posi = response.data.summary[i].position;
                        if (posi == "MEMBER") {
                            htmlFoot += "<td id='totalMember'>-</td>";
                        } else if (posi == "AGENT") {
                            htmlFoot += "<td id='totalAgent'>-</td>";
                        } else if (posi == "SH_HOLDER") {
                            htmlFoot += "<td id='totalShare'>-</td>";
                        } else if (posi == "COMPANY") {
                            htmlFoot += "<td id='totalCompany'>-</td>";
                        } else if (posi == "AMB") {
                            htmlFoot += "<td id='totalAMB'>-</td>";
                        } else if (posi == "PROVIDER") {
                            htmlFoot += "<td id='totalProvider'>-</td>";
                        }
                    }
                }
                htmlFoot += "</tr>";
                htmlFoot += "</tfoot>";

                if (response.total > 0) {
                    var no = 1;

                    for (var i = 0; i < response.data.detail.length; i++) {
                        var obj = response.data.detail[i];

                        htmlData += "<tr>";
                        htmlData += "<td style='width: 2.5%;' class='aligncenter'>" + (((num - 1) * 100) + no) + "</td>";

                        var date = new window.Date(obj.dateTime);
                        var Time;
                        if (obj.dateTime == "" || obj.dateTime == null) {
                            Time = "-";
                        }
                        else {
                            Time = ("0" + date.getDate()).slice(-2) + "/" + ("0" + (date.getMonth() + 1)).slice(-2) + "/" + date.getFullYear() + " " + ("0" + date.getHours()).slice(-2) + ":" + ("0" + date.getMinutes()).slice(-2) + ":" + ("0" + date.getSeconds()).slice(-2);
                        }

                        htmlData += "<td style='width: 14.5%; left: 2%;'><b set-lan='text:User'></b>: " + obj.username + "<br><b set-lan='text:Provider'></b>: " + obj.provider + "<br><b set-lan='text:Date'></b>: " + Time + "</td>";

                        var Amount = parseFloat(obj.amount).toFixed(2);

                        var payload = obj.payload;
                        if (payload == null || payload == "") {
                            htmlData += "<td style='width: 14.5%; left: 14.5%;'><b set-lan='text:" + obj.action + "'></b><br><b set-lan='text:Date'></b>: " + Time + "<br><b set-lan='text:Amount'></b>: " + Amount.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                        }
                        else {
                            htmlData += "<td style='width: 14.5%; left: 14.5%;'><b set-lan='text:" + obj.action + "'></b><br><b set-lan='text:Date'></b>: " + Time + "<br><b set-lan='text:Amount'></b>: " + Amount.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') +
                                "<br><a onclick='GetDataTableDetail(`" + obj.payload.transactionMapping + "`,`" + Menu + "`)' class='link overflow ellipsis' set-lan='text:detail+'></a></td>";
                        }

                        // >> Amount << //
                        var n1 = Amount.indexOf("-");
                        if (n1 == 0) {
                            htmlData += "<td style='width: 9.5%; left: 14.5%;' class='alignright txtRed'>" + Amount.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                        }
                        else {
                            htmlData += "<td style='width: 9.5%; left: 14.5%;' class='alignright'>" + Amount.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                        }

                        if (obj.status == "SUCCESS") {
                            htmlData += "<td class='aligncenter' style='width: 6%; left: 0 !important;' set-lan='text:Success'></td>";
                        } else {
                            htmlData += "<td class='aligncenter' style='width: 6%; left: 0 !important;'>" + obj.status + "</td>";
                        }


                        if (obj.ip != "") {
                            htmlData += "<td style='width: 6%; left: 0 !important;'><p class='overflow ellipsis' title='" + obj.ip + "'>" + obj.ip + "</p></td>";
                        } else {
                            htmlData += "<td style='width: 6%; left: 0 !important;' class='aligncenter'>-</td>";
                        }

                        for (var j = 0; j < obj.agentInOutDetail.length; j++) {
                            var WL = parseFloat(obj.agentInOutDetail[j].winLose.winLose).toFixed(2);
                            var COM = parseFloat(obj.agentInOutDetail[j].winLose.com).toFixed(2);
                            var TOTAL = parseFloat(obj.agentInOutDetail[j].winLose.total).toFixed(2);

                            htmlData += "<td style='left: 0 !important;'>";
                            if (WL < 0) {
                                htmlData += "<p class='bottom0 alignright txtRed'>" + WL.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</p>";
                            }
                            else {
                                htmlData += "<p class='bottom0 alignright'>" + WL.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</p>";
                            }
                            if (COM < 0) {
                                htmlData += "<p class='bottom0 alignright txtRed'>" + COM.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</p>";
                            }
                            else {
                                htmlData += "<p class='bottom0 alignright'>" + COM.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</p>";
                            }
                            if (TOTAL < 0) {
                                htmlData += "<p class='bottom0 alignright txtRed'>" + TOTAL.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</p></td>";
                            }
                            else {
                                htmlData += "<p class='bottom0 alignright'>" + TOTAL.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</p></td>";
                            }
                        }

                        htmlData += "</tr>";
                        no++;
                    }

                    htmlAll = htmlHead + htmlData + htmlFoot;
                    $("#tbData").append(htmlAll);
                    SetLan(localStorage.getItem("Language"));
                    ////$("#tb2").css('display', 'flex');
                    $("#tb").css('display', 'none');

                    for (var i = 0; i < response.data.summary.length; i++) {
                        var txt = "";
                        var Position = response.data.summary[i].position;

                        var WL = parseFloat(response.data.summary[i].winLose.winLose).toFixed(2);
                        var COM = parseFloat(response.data.summary[i].winLose.com).toFixed(2);
                        var TOTAL = parseFloat(response.data.summary[i].winLose.total).toFixed(2);

                        if (WL < 0) {
                            txt += "<span class='txtRed'>" + WL.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</span><br>";
                        }
                        else {
                            txt += "<span>" + WL.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</span><br>";
                        }

                        if (COM < 0) {
                            txt += "<span class='txtRed'>" + COM.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</span><br>";
                        }
                        else {
                            txt += "<span>" + COM.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</span><br>";
                        }

                        if (TOTAL < 0) {
                            txt += "<span class='txtRed'>" + TOTAL.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</span>";
                        }
                        else {
                            txt += "<span>" + TOTAL.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</span>";
                        }

                        if (Position == "MEMBER") {
                            $("#totalMember").html(txt);
                        } else if (Position == "AGENT") {
                            $("#totalAgent").html(txt);
                        } else if (Position == "SH_HOLDER") {
                            $("#totalShare").html(txt);
                        } else if (Position == "COMPANY") {
                            $("#totalCompany").html(txt);
                        } else if (Position == "AMB") {
                            $("#totalAMB").html(txt);
                        } else if (Position == "PROVIDER") {
                            $("#totalProvider").html(txt);
                        }
                    }
                }
                else {
                    htmlData += "<tr><td colspan='15' style='text-align: center;' set-lan='text:No data.'></td></tr>";
                    htmlAll = htmlHead + htmlData + htmlFoot;
                    $("#tbData").append(htmlAll);
                    $("#totalMember").text("-");
                    $("#totalAgent").text("-");
                    $("#totalShare").text("-");
                    $("#totalCompany").text("-");
                    $("#totalAMB").text("-");
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

        const postTableDetail = async (tbID, num, menu) => {
            $("#tbData").html("");
            ////$("#tb2").css('display', 'flex');
            $("#tb").css('display', 'none');
            $('#btnExport ,#txtExport').css('display', 'none');

            const parameter = {
                transactionMapping: parseInt(tbID),
                page: num,
                size: 100
            }
            const requestAwait = await fetchDataSite(`${apiURL}/v1/report/bet_history`, 'POST', "include", parameter)
            const response = await requestAwait.json()

            if (response.messageCode == 0000 || response.messageCode == null) {
                var newNav = "";
                var navMenu = "";
                newNav += "<a class='linkNav' set-lan='text:detail+'></a>";
                var arrNav = $("#navMenu").html();
                var n = arrNav.search("detail");
                if (n < 0) {
                    arrNav += " / " + newNav;
                    navMenu = arrNav;
                }
                else {
                    arrNav = arrNav.split(' / ');
                    var Last = arrNav.pop();
                    for (var i = 0; i < arrNav.length; i++) {
                        navMenu += arrNav[i] + " / ";
                    }
                    navMenu += newNav;
                }

                $("#navMenu").html("");
                $("#navMenu").append(navMenu);
                $("#navMenu > a:last-child").css("text-decoration", "underline");

                var htmlAll = "";
                var htmlHead = "";
                var htmlData = "";
                var htmlFoot = "";
                htmlHead += "<thead class='rgba-green-slight'>";
                htmlHead += "<tr>";
                htmlHead += "<th class='align-middle' style='width: 2.5%;' set-lan='text:No'></th>";
                htmlHead += "<th class='align-middle' style='width: 7%; left: 3%;' set-lan='text:Date'></th>";

                htmlHead += "<th class='align-middle' style='width: 7%; left: 3%;' set-lan='text:Bet Detail'></th>";

                htmlHead += "<th class='align-middle' style='width: 7%; left: 7%; text-align: left;padding-left: 5px;' set-lan='text:Game Type'></th>";
                htmlHead += "<th class='align-middle' style='width: 7%; left: 7%; text-align: left;padding-left: 5px;' set-lan='text:Game Name'></th>";
                htmlHead += "<th class='align-middle' style='width: 7%; left: 7%; text-align: right; padding-right: 5px;' set-lan='text:Amount'></th>";
                htmlHead += "<th class='align-middle' style='width: 7%; left: 7%; text-align: right; padding-right: 5px;' set-lan='text:Payout'></th>";
                htmlHead += "<th style='width: 7%; left: 7%; text-align: right; padding-right: 5px;'><label style='margin-bottom: 0rem;' set-lan='text:Netwin'></label><label>&nbsp;(100%)</label></th>";
                htmlHead += "<th class='align-middle' style='width: 7%; left: 7%; text-align: right; padding-right: 5px;' set-lan='text:Balance'></th>";
                htmlHead += "</tr>";
                htmlHead += "</thead>";
                htmlHead += "<tbody>";

                htmlFoot += "</tbody>";
                htmlFoot += "<tfoot class='rgba-yellow-slight'>";
                htmlFoot += "<tr class='total'>";
                htmlFoot += "<td style='width: 2.5%;'></td>";
                htmlFoot += "<td style='width: 7%; left: 3%;'></td>";
                htmlFoot += "<td style='width: 7%; left: 7%;'></td>";
                htmlFoot += "<td style='width: 7%; left: 7%;'></td>";
                htmlFoot += "<td style='width: 7%; left: 7%;' set-lan='text:Total'></td>";
                htmlFoot += "<td style='width: 7%; left: 7%;' id='totalAmount'></td>";
                htmlFoot += "<td style='width: 7%; left: 7%;' id='totalPayout'></td>";
                htmlFoot += "<td style='width: 7%; left: 7%;' id='totalNetwin'></td>";
                htmlFoot += "<td style='width: 7%; left: 7%;'></td>";
                htmlFoot += "</tr>";
                htmlFoot += "</tfoot>";

                if (response.total > 0) {
                    var no = 1;

                    for (var i = 0; i < response.data.details.length; i++) {
                        var obj = response.data.details[i];

                        htmlData += "<tr>";
                        htmlData += "<td class='aligncenter'>" + (((num - 1) * 100) + no) + "</td>";

                        var date = new window.Date(obj.betTime);
                        var txtDate;
                        if (obj.betTime == "" || obj.betTime == null) {
                            txtDate = "-";
                        }
                        else {
                            txtDate = ("0" + date.getDate()).slice(-2) + "/" + ("0" + (date.getMonth() + 1)).slice(-2) + "/" + date.getFullYear() + " " + ("0" + date.getHours()).slice(-2) + ":" + ("0" + date.getMinutes()).slice(-2) + ":" + ("0" + date.getSeconds()).slice(-2);
                        }
                        htmlData += "<td class='aligncenter'>" + txtDate + "</td>";

                        if (obj.betDetailSupport == true) {
                            htmlData += "<td><a onclick='postBetDetail(`" + obj.id + "`)' class='link overflow ellipsis' set-lan='text:detail+'></a></td>";
                        }
                        else if (obj.betDetailSupport == false) {
                            htmlData += "<td class='aligncenter'>-</td>";
                        }

                        htmlData += "<td>" + obj.gameType + "</td>";
                        htmlData += "<td>" + obj.gameName + "</td>";

                        var AMOUNT = parseFloat(obj.amount).toFixed(2);
                        var PAY = parseFloat(obj.payout).toFixed(2);
                        var NET = parseFloat(obj.netWin).toFixed(2);
                        var BAL = parseFloat(obj.balanceAfter).toFixed(2);

                        if (AMOUNT < 0) {
                            htmlData += "<td class='alignright txtRed'>" + AMOUNT.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                        }
                        else {
                            htmlData += "<td class='alignright'>" + AMOUNT.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                        }

                        if (PAY < 0) {
                            htmlData += "<td class='alignright txtRed'>" + PAY.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                        }
                        else {
                            htmlData += "<td class='alignright'>" + PAY.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                        }

                        if (NET < 0) {
                            htmlData += "<td class='alignright txtRed'>" + NET.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                        }
                        else {
                            htmlData += "<td class='alignright'>" + NET.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                        }

                        if (BAL < 0) {
                            htmlData += "<td class='alignright txtRed'>" + BAL.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                        }
                        else {
                            htmlData += "<td class='alignright'>" + BAL.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                        }

                        htmlData += "</tr>";
                        no++;
                    }
                    htmlAll = htmlHead + htmlData + htmlFoot;
                    $("#tbData").append(htmlAll);

                    SetLan(localStorage.getItem("Language"));
                    ////$("#tb2").css('display', 'flex');
                    $("#tb").css('display', 'none');

                    var amount = parseFloat(response.data.summary.amount).toFixed(2);
                    var payout = parseFloat(response.data.summary.payout).toFixed(2);
                    var netWin = parseFloat(response.data.summary.netWin).toFixed(2);

                    $("#totalAmount").text(amount.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,'));
                    $("#totalPayout").text(payout.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,'));
                    $("#totalNetwin").text(netWin.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,'));

                    if (amount < 0) {
                        document.getElementById("totalAmount").style.color = "red";
                    }
                    else {
                        document.getElementById("totalAmount").style.color = "rgb(23, 23, 44)";
                    }

                    if (payout < 0) {
                        document.getElementById("totalPayout").style.color = "red";
                    }
                    else {
                        document.getElementById("totalPayout").style.color = "rgb(23, 23, 44)";
                    }

                    if (netWin < 0) {
                        document.getElementById("totalNetwin").style.color = "red";
                    }
                    else {
                        document.getElementById("totalNetwin").style.color = "rgb(23, 23, 44)";
                    }
                }
                else {
                    htmlData += "<tr><td colspan='9' style='text-align: center;' set-lan='text:No data.'></td></tr>";
                    htmlAll = htmlHead + htmlData + htmlFoot;
                    $("#tbData").append(htmlAll);
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

        const postBetDetail = async (ID) => {
            const parameter = {
                id: ID
            }
            const requestAwait = await fetchDataSite(`${apiURL}/v1/bet_detail_url`, 'POST', "include", parameter)
            const response = await requestAwait.json()

            if (response.messageCode == 0000 || response.messageCode == null) {
                window.open(response.data, '_blank');
            }
            else if (response.messageCode == 9900) {
                document.getElementById('lbAlert').innerHTML = response.messageDescription;;
                $("#myModalLoad").modal('hide');
                $('#modalAlert').modal('show');
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
