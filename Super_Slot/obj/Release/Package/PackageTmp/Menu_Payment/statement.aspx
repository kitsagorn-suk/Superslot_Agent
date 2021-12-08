<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="statement.aspx.cs" Inherits="Super_Slot.Menu_Payment.statement" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .testDate {
            position: relative;
            color: white;
        }

            .testDate:before {
                position: absolute;
                content: attr(data-date);
                display: inline-block;
                color: black;
            }

            .testDate::-webkit-datetime-edit, .testDate::-webkit-inner-spin-button, .testDate::-webkit-clear-button {
                display: none;
            }

            .testDate::-webkit-calendar-picker-indicator {
                background: transparent;
                bottom: 0;
                color: transparent;
                height: auto;
                left: 0;
                position: absolute;
                right: 0;
                top: 0;
                width: auto;
                z-index: 999;
            }

        .input-wrapper {
            position: relative;
        }

        .iconCalendar {
            position: absolute;
            top: 12px;
            left: 120px;
            z-index: 9;
        }
    </style>
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="" set-lan="text:Payment"></a></li>
            <li class="breadcrumb-item active txtMem" set-lan="text:Statement"></li>
        </ol>
    </nav>
    <div class="row">
        <div class="col-md-8">
            <h1 set-lan="text:Statement"></h1>
        </div>
    </div>
    <div class="btn-toolbar section-group" role="toolbar" style="padding-bottom: 0px !important;">
        <div class="form-group row" style="padding-left: 1rem;">
            <label for="email" class="col-form-label" set-lan="text:Username_"></label>
            <div style="padding-left: 1rem;">
                <input type="text" class="form-control" id="searchLoginname" onkeypress="Key_Enter(event)">
            </div>
        </div>
        <div class="form-group row" style="padding-left: 2rem;">
            <label for="email" class="col-form-label alignright" set-lan="text:Action_"></label>
            <div style="padding-left: 1rem;" class="select-outline">
                <select class="mdb-select" id="selType" name="LselType">
                    <option value="" set-lan="text:All" selected></option>
                    <option value="DEPOSIT" set-lan="text:Deposit"></option>
                    <option value="WITHDRAW" set-lan="text:Withdrawal"></option>
                </select>
            </div>
        </div>
        <div class="row col-md-12">
            <div class="form-group row" style="padding-left: 1.1rem;">
                <label for="email" class="col-form-label" set-lan="text:Start date_"></label>
                <div style="padding-left: 1rem;" class="input-wrapper">
                    <input type="date" class="form-control" id="startdate" style="width: 150px;" onkeypress="Key_Enter(event)" />
                </div>
            </div>
            <div class="form-group row" style="padding-left: 2.5rem;">
                <label for="email" class="col-form-label" set-lan="text:To date_"></label>
                <div style="padding-left: 1rem;">
                    <input type="date" class="form-control" id="todate" style="width: 150px;" onkeypress="Key_Enter(event)" />
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
                    <th style="width: 5%;" set-lan="text:No"></th>
                    <th style="width: 15%; text-align: left; padding-left: 5px;" set-lan="text:Login name"></th>
                    <th style="width: 8%; text-align: left; padding-left: 5px;" set-lan="text:Action"></th>
                    <th style="width: 10%; text-align: right; padding-right: 5px;" set-lan="text:Amount"></th>
                    <th style="width: 10%; text-align: left; padding-left: 5px;" set-lan="text:Request By"></th>
                    <th style="width: 10%; text-align: center; padding-left: 5px;" set-lan="text:Date"></th>
                </tr>
            </thead>
            <tbody>
            </tbody>
            <tfoot class="rgba-yellow-slight">
                <tr class="total">
                    <td></td>
                    <td></td>
                    <td set-lan="text:Total"></td>
                    <td id="totalCash">-</td>
                    <td></td>
                    <td></td>
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
            $("#menuPayment , #menuPayment > a").addClass("active");
            $("#menuPayment > div").css("display", "block");

            var date = new Date();
            var dateSet = date.getFullYear() + "-" + ("0" + (date.getMonth() + 1)).slice(-2) + "-" + ("0" + date.getDate()).slice(-2);
            $("#startdate").val(dateSet);
            $("#todate").val(dateSet);

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

        function btnTime(type) {
            var start = "";
            var end = "";
            var date = new Date();

            if (type == "Today") {
                date = ("0" + date.getDate()).slice(-2) + "/" + ("0" + (date.getMonth() + 1)).slice(-2) + "/" + date.getFullYear();
                $("#startdate").val(GetFormattedDate(date));
                $("#todate").val(GetFormattedDate(date));
                start = GetFormattedDate(date);
                end = GetFormattedDate(date);

                typeTime = "Day";
            }
            else if (type == "Yesterday") {
                var todayTimeStamp = +new Date;
                var oneDayTimeStamp = 1000 * 60 * 60 * 24;
                var diff = todayTimeStamp - oneDayTimeStamp;
                var yesterdayDate = new Date(diff);
                var yesterdayString = ("0" + yesterdayDate.getDate()).slice(-2) + "/" + ("0" + (yesterdayDate.getMonth() + 1)).slice(-2) + "/" + yesterdayDate.getFullYear();//yesterdayDate.getFullYear() + '-' + (yesterdayDate.getMonth() + 1) + '-' + yesterdayDate.getDate();
                $("#startdate").val(GetFormattedDate(yesterdayString));
                $("#todate").val(GetFormattedDate(yesterdayString));
                start = GetFormattedDate(yesterdayString);
                end = GetFormattedDate(yesterdayString);

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
                var startDate = ("0" + date1.getDate()).slice(-2) + "/" + ("0" + (date1.getMonth() + 1)).slice(-2) + "/" + date1.getFullYear();
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
                var startDate = ("0" + date1.getDate()).slice(-2) + "/" + ("0" + (date1.getMonth() + 1)).slice(-2) + "/" + date1.getFullYear();
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
                var endDate = ("0" + date2.getDate()).slice(-2) + "/" + ("0" + (date2.getMonth() + 1)).slice(-2) + "/" + date2.getFullYear();
                $("#startdate").val(GetFormattedDate(startDate));
                $("#todate").val(GetFormattedDate(endDate));
                start = GetFormattedDate(startDate);
                end = GetFormattedDate(endDate);

                typeTime = "Month";
            }

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
                    $("#startdate").val(yesterdayString);
                    $("#todate").val(yesterdayString);
                    start = yesterdayString;
                    end = yesterdayString;
                }
                else if (type == "Next") {
                    var Val = new Date(startVal.setDate(startVal.getDate() + 1));
                    var tomorrowString = Val.getFullYear() + "-" + ("0" + (Val.getMonth() + 1)).slice(-2) + "-" + ("0" + Val.getDate()).slice(-2);
                    $("#startdate").val(tomorrowString);
                    $("#todate").val(tomorrowString);
                    start = tomorrowString;
                    end = tomorrowString;
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
                    var tomorrowString2 = current2.getFullYear() + "-" + ("0" + (current2.getMonth() + 1)).slice(-2) + "-" + ("0" + current2.getDate()).slice(-2);
                    $("#todate").val(tomorrowString2);
                    start = tomorrowString;
                    end = tomorrowString2;
                }
            }

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
            var Type = $('#selType').val();

            const parameter = {
                username: $('#searchLoginname').val(),
                action: $('#selType').val(),
                startDate: $("#startdate").val(),
                endDate: $("#todate").val(),
                page: num,
                size: 100
            }

            const requestAwait = await fetchDataSite(`${apiURL}/v1/user/credit/statement`, 'POST', "include", parameter)
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
                            htmlData += "<td class='aligncenter'>" + (((num - 1) * 20) + no) + "</td>";
                            htmlData += "<td>" + obj.username + "</td>";

                            if (obj.action == "WITHDRAW") {
                                htmlData += "<td set-lan='text:WITHDRAWAL'></td>";
                            }
                            else {
                                htmlData += "<td set-lan='text:" + obj.action + "'></td>";
                            }

                            var Amt = parseFloat(obj.amount).toFixed(2);
                            htmlData += "<td class='alignright'>" + Amt.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                            htmlData += "<td>" + obj.createBy + "</td>";
                            htmlData += "<td class='aligncenter'>" + obj.createTime + "</td>";
                            htmlData += "</tr>";
                            no++;
                        }
                        $("#tbData > tbody").append(htmlData);

                        var Total = parseFloat(response.data.summary.amount).toFixed(2);
                        $("#totalCash").text(Total.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,'));
                        if (Total < 0) {
                            document.getElementById("totalCash").style.color = "red";
                        } else {
                            document.getElementById("totalCash").style.color = "rgb(23, 23, 44)";
                        }


                        $('#selType option').removeAttr('selected');
                        $("#selType option[value='" + Type + "']").attr("selected", "selected");


                        SetLan(localStorage.getItem("Language"));
                        $("#myModalLoad").modal('hide');
                    }
                    else {
                        $("#totalCash").text("-");
                        document.getElementById("totalCash").style.color = "rgb(23, 23, 44)";

                        htmlData += "<tr>";
                        htmlData += "<td colspan='6' class='aligncenter' set-lan='text:No data.'></td>";
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
            console.log(NumPage);
            var Type = $('#selType').val();
            const parameter = {
                username: $('#searchLoginname').val(),
                action: $('#selType').val(),
                startDate: $("#startdate").val(),
                endDate: $("#todate").val(),
                page: num,
                size: 100
            }
            const requestAwait = await fetchDataSite(`${apiURL}/v1/user/credit/statement`, 'POST', "include", parameter)
            const response = await requestAwait.json()

            if (response.messageCode == 0000 || response.messageCode == null) {
                var htmlData = "";
                $("#tbData > tbody").html("");
                var no = 1;
                if (response.total != 0) {
                    for (var i = 0; i < response.data.detail.length; i++) {
                        var obj = response.data.detail[i];

                        htmlData += "<tr>";
                        htmlData += "<td class='aligncenter'>" + (((num - 1) * 20) + no) + "</td>";
                        htmlData += "<td>" + obj.username + "</td>";

                        if (obj.action == "WITHDRAW") {
                            htmlData += "<td set-lan='text:WITHDRAWAL'></td>";
                        }
                        else {
                            htmlData += "<td set-lan='text:" + obj.action + "'></td>";
                        }

                        var Amt = parseFloat(obj.amount).toFixed(2);
                        htmlData += "<td class='alignright'>" + Amt.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                        htmlData += "<td>" + obj.createBy + "</td>";
                        htmlData += "<td class='aligncenter'>" + obj.createTime + "</td>";
                        htmlData += "</tr>";
                        no++;
                    }
                    $("#tbData > tbody").append(htmlData);

                    var Total = parseFloat(response.data.summary.amount).toFixed(2);
                    $("#totalCash").text(Total.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,'));
                    if (Total < 0) {
                        document.getElementById("totalCash").style.color = "red";
                    } else {
                        document.getElementById("totalCash").style.color = "rgb(23, 23, 44)";
                    }


                    $('#selType option').removeAttr('selected');
                    $("#selType option[value='" + Type + "']").attr("selected", "selected");


                    SetLan(localStorage.getItem("Language"));
                    $("#myModalLoad").modal('hide');
                }
                else {
                    $("#totalCash").text("-");
                    document.getElementById("totalCash").style.color = "rgb(23, 23, 44)";

                    htmlData += "<tr>";
                    htmlData += "<td colspan='6' class='aligncenter' set-lan='text:No data.'></td>";
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

    </script>
</asp:Content>

