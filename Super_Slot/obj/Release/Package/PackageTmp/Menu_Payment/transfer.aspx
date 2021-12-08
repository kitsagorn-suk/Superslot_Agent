<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="transfer.aspx.cs" Inherits="Super_Slot.Menu_Payment.transfer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .modalScroll {
            overflow-y: auto !important;
        }
    </style>
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="" set-lan="text:Payment"></a></li>
            <li class="breadcrumb-item active txtMem" set-lan="text:Deposit / Withdrawal"></li>
        </ol>
    </nav>
    <h1 class="txtHead" set-lan="text:Deposit / Withdrawal"></h1>
    <div class="btn-toolbar section-group" role="toolbar" style="padding-bottom: 0px !important;">
        <div class="form-group row" style="padding-left: 1rem;">
            <label for="email" class="col-form-label" set-lan="text:Username_"></label>
            <div style="padding-left: 1rem;">
                <input type="text" class="form-control" id="searchLoginname" onkeypress="Key_Enter(event)">
            </div>
        </div>
        <div class="form-group row" style="padding-left: 2rem;">
            <button class="btn btn-yellow font-weight-bold m-0 px-3 py-2 z-depth-0 waves-effect btnMenu" type="button" set-lan="text:Search" onclick="Search_Click()"></button>
        </div>
    </div>
    <div class="row">
        <div class="col-md-8" style="padding-top: 1.4rem;"><b set-lan="text:Credit_"></b>&nbsp;<b style="color: #007bff;" id="txtCredit">-</b></div>
        <div class="col-md-4">
            <div id="wrapper" style="float: right;">
                <section>
                    <div class="data-container"></div>
                    <div id="pagination-demo2"></div>
                </section>
            </div>
        </div>
    </div>
    <div class="table-wrapper" style="margin-bottom: 10px;">
        <table class="table table-border" id="tbData">
            <thead class="rgba-green-slight">
                <tr>
                    <th style="width: 3%;" set-lan="text:No"></th>
                    <th style="width: 7%; text-align: left; padding-left: 5px;" set-lan="text:Login name"></th>
                    <th style="width: 7%; text-align: left; padding-left: 5px;" set-lan="text:Nickname"></th>
                    <th style="width: 7%;" set-lan="text:Level"></th>
                    <th style="width: 9%; text-align: right; padding-right: 5px;" set-lan="text:Credit"></th>
                    <th style="width: 9%; text-align: right; padding-right: 5px;" set-lan="text:Credit outstanding"></th>
                    <th style="width: 6%;" class="zonenone" set-lan="text:Deposit"></th>
                    <th style="width: 6%;" class="zonenone" set-lan="text:Withdrawal"></th>
                    <th style="width: 8%;" set-lan="text:Detail"></th>
                    <th style="width: 10%;" set-lan="text:Last login date"></th>
                    <th style="width: 7%; text-align: left; padding-left: 5px;" set-lan="text:Last login IP"></th>
                </tr>
            </thead>
            <tbody>
            </tbody>
            <tfoot class="rgba-yellow-slight">
                <tr class="total">
                    <td></td>
                    <td></td>
                    <td></td>
                    <td set-lan="text:Total"></td>
                    <td id="totalCredit">-</td>
                    <td></td>
                    <td class="zonenone"></td>
                    <td class="zonenone"></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
            </tfoot>
        </table>
    </div>

    <!-- Modal -->
    <div class="modal fade" id="modalGetCredit" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header text-center">
                    <h4 class="modal-title w-100 font-weight-bold" set-lan="text:Credit outstanding"></h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body mx-3">
                    <div class="form-group row mr-4" style="margin-bottom: 0px !important;">
                        <label for="email" class="col-5 col-form-label alignright" set-lan="text:Credit outstanding-"></label>
                        <label id="txtCreditOut" class="col-7 col-form-label"></label>
                    </div>
                </div>
                <div class="modal-footer d-flex justify-content-center">
                    <button type="button" class="btn btn-yellow font-weight-bold" data-dismiss="modal" aria-label="Close" set-lan="text:Close"></button>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="modalGetDeposit" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header text-center">
                    <h4 class="modal-title w-100 font-weight-bold" set-lan="text:Deposit"></h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body mx-3">
                    <div class="form-group row mr-4" style="margin-bottom: 0px !important;">
                        <label for="email" class="col-4 col-form-label alignright" set-lan="text:Account-"></label>
                        <label id="txtDepositName" class="col-8 col-form-label"></label>
                    </div>
                    <div class="form-group row mr-4" style="margin-bottom: 0px !important;">
                        <label for="email" class="col-4 col-form-label alignright" set-lan="text:Deposit-"></label>
                        <div class="col-8">
                            <input type="text" id="deposit" class="form-control" autocomplete="off" onkeyup="javascript:this.value=Comma(this.value);" oninput="this.value=this.value.replace(/[^0-9]/g, '').replace(/(\..*)\./g, '$1');" maxlength="30" />
                            <small class="text-muted form-text" set-lan="text:numberonly"></small>
                        </div>
                    </div>
                </div>
                <div class="modal-footer d-flex justify-content-center">
                    <button class="btn btn-yellow font-weight-bold" onclick="AddDeposit()" type="button" set-lan="text:Save"></button>
                    <button type="button" class="btn btn-yellow font-weight-bold" data-dismiss="modal" aria-label="Close" set-lan="text:Close"></button>
                </div>
            </div>
        </div>
    </div>
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
    <div class="modal fade" id="modalGetWithdrawal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header text-center">
                    <h4 class="modal-title w-100 font-weight-bold" set-lan="text:Withdrawal"></h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body mx-3">
                    <div class="form-group row mr-4" style="margin-bottom: 0px !important;">
                        <label for="email" class="col-4 col-form-label alignright" set-lan="text:Account-"></label>
                        <label id="txtWithdrawalName" class="col-8 col-form-label"></label>
                    </div>
                    <div class="form-group row mr-4" style="margin-bottom: 0px !important;">
                        <label for="email" class="col-4 col-form-label alignright" set-lan="text:Withdrawal-"></label>
                        <div class="col-8">
                            <input type="text" id="withdrawal" class="form-control" autocomplete="off" onkeyup="javascript:this.value=Comma(this.value);" oninput="this.value=this.value.replace(/[^0-9]/g, '').replace(/(\..*)\./g, '$1');" maxlength="30" />
                            <small class="text-muted form-text" set-lan="text:numberonly"></small>
                        </div>
                    </div>
                </div>
                <div class="modal-footer d-flex justify-content-center">
                    <button class="btn btn-yellow font-weight-bold" onclick="AddWithdrawal()" type="button" set-lan="text:Save"></button>
                    <button type="button" class="btn btn-yellow font-weight-bold" data-dismiss="modal" aria-label="Close" set-lan="text:Close"></button>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade modalScroll" id="modalGetDetail" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header text-center">
                    <h4 class="modal-title w-100 font-weight-bold" set-lan="text:History Detail"></h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body mx-3">
                    <div class="row">
                        <div class="col-5">
                            <div class="form-group row mr-4" style="margin-bottom: 0px !important;">
                                <label for="email" class="col-4 col-form-label alignright" set-lan="text:Start date_"></label>
                                <div class="col-8">
                                    <input type="date" class="form-control" id="datestartDetail" />
                                </div>
                            </div>
                        </div>
                        <div class="col-5">
                            <div class="form-group row mr-4" style="margin-bottom: 0px !important;">
                                <label for="email" class="col-4 col-form-label alignright" set-lan="text:To date_"></label>
                                <div class="col-8">
                                    <input type="date" class="form-control" id="dateendDetail" />
                                </div>
                            </div>
                        </div>
                        <div class="col-2">
                            <a class="btn btn-yellow font-weight-bold m-0 px-3 py-2 z-depth-0 waves-effect btnMenu" set-lan="text:Search" onclick="searchHis();"></a>
                        </div>
                    </div>
                    <div id="wrapper2" style="float: right; margin-top: .5rem;">
                        <section>
                            <div class="data-container"></div>
                            <div id="pagination-demo22"></div>
                        </section>
                    </div>
                    <table class="table table-border" id="tbData2" style="margin-top: 3rem;">
                        <thead class="rgba-green-slight">
                            <tr>
                                <th set-lan="text:No"></th>
                                <th set-lan="text:Action"></th>
                                <th set-lan="text:Amount"></th>
                                <th set-lan="text:Date"></th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td colspan="4">No cash transactions</td>
                            </tr>
                        </tbody>
                        <tfoot class="rgba-yellow-slight">
                            <tr class="total">
                                <td></td>
                                <td set-lan="text:Total"></td>
                                <td id="totalAmount">-</td>
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

    <!-- Modal -->
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
                    <label id="lbAlertAction"></label>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainScript" runat="server">
    <script src="../js/pagination.js"></script>
    <script>
        var Uname_Dep_Wit = "";
        var Uname_Detail = "";
        var Check_Enter = "";

        $(document).ready(function () {
            $("#menuPayment , #menuPayment > a").addClass("active");
            $("#menuPayment > div").css("display", "block");

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

            getProfile();
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
            var dateSet = date.getFullYear() + "-" + ("0" + (date.getMonth() + 1)).slice(-2) + "-" + ("0" + date.getDate()).slice(-2);
            $("#datestartDetail").val(dateSet);
            $("#dateendDetail").val(dateSet);
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

        var NumPage2 = 0;
        var TotalData2;
        function GetData2() {
            $("#myModalLoad").modal();
            //if (NumPage2 == null) {
            //    NumPage2 = 1;
            //}
            postDataHis(NumPage2);
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
                                postList(num);
                            }
                            NumPage = num;
                        }
                    });
                })('demo2');
            });
        }

        function GetNumPage2(num) {
            $(function () {
                (function (name) {
                    var container = $('#pagination-' + name);
                    container.pagination({
                        totalNumber: TotalData2,
                        pageNumber: num,
                        pageSize: 100,
                        dataSource: '/json/DataSource.json',
                        locator: 'items',
                        callback: function (response, pagination) {
                            num = container.pagination('getSelectedPageNum');
                            if (NumPage2 != 0) {
                                postHisStatement(num);
                            }
                            NumPage2 = num;
                        }
                    });
                })('demo22');
            });
        }

        function getModalDeposit(valName) {
            $("#deposit").val("");
            $('#txtDepositName').text(valName);
            Uname_Dep_Wit = valName;
            $('#modalGetDeposit').modal('show');
        }

        function getModalWithdrawal(valName) {
            $("#withdrawal").val("");
            $('#txtWithdrawalName').text(valName);
            Uname_Dep_Wit = valName;
            $('#modalGetWithdrawal').modal('show');
        }

        function AddDeposit() {
            $("#myModalLoad").modal();

            if ($("#deposit").val() == "") {
                document.getElementById("lbAlert").setAttribute("set-lan", "text:missing 'deposit' field");
                SetLan(localStorage.getItem("Language"));
                $('#modalAlert').modal('show');
                $("#myModalLoad").modal('hide');
            }
            else {
                postDeposit();
            }
        }

        function AddWithdrawal() {
            $("#myModalLoad").modal();

            if ($("#withdrawal").val() == "") {
                document.getElementById("lbAlert").setAttribute("set-lan", "text:missing 'withdrawal' field");
                SetLan(localStorage.getItem("Language"));
                $('#modalAlert').modal('show');
                $("#myModalLoad").modal('hide');
            }
            else {
                postWithdrawal();
            }
        }

        function getModalDetail(valName) {
            Uname_Detail = valName;
            DateNow();
            searchHis();
        }

        function getCreditOutstanding(ID) {
            $("#myModalLoad").modal();
            postCreditOutstanding(ID);
            $('#modalGetCredit').modal('show');
        }

        function searchHis() {
            NumPage2 = 0;
            if ($("#datestartDetail").val() != "" && $("#dateendDetail").val() != "") {
                GetData2();
            }
            else {
                document.getElementById("lbAlert").setAttribute("set-lan", "text:missing 'date' field");
                SetLan(localStorage.getItem("Language"));
                $("#myModalLoad").modal('hide');
                $('#modalAlert').modal('show');
            }
        }

        function capitalizeFirstLetter(string) {
            return string.charAt(0).toUpperCase() + string.slice(1);
        }

        const postData = async (num) => {
            if (num == 0) {
                num = num + 1;
            }

            const parameterCom = {
                username: $('#searchLoginname').val(),
                page: num,
                size: 100,
                calCredit: true
            }

            const requestAwait = await fetchDataSite(`${apiURL}/v1/user/credit/inquiry`, 'POST', "include", parameterCom)
            const response = await requestAwait.json()
            if (response.messageCode == 0000 || response.messageCode == null) {
                //NumPage = num;
                TotalData = response.total;
                GetNumPage(num);

                if (NumPage == 0) {
                    $("#tbData > tbody , #navMenu").html("");
                    var dataMenu = response.data.parentList;
                    var htmlMenu = "";
                    var htmlData = "";
                    if (response.total != 0) {
                        var no = 1;
                        var Position = "";
                        var Total = 0;

                        for (var i = 0; i < response.data.detail.length; i++) {
                            var obj = response.data.detail[i];

                            htmlData += "<tr>";
                            htmlData += "<td class='aligncenter'>" + (((num - 1) * 20) + no) + "</td>";
                            htmlData += "<td><p class='overflow ellipsis' title='" + obj.username + "'>" + obj.username + "</p></td>";

                            if (obj.nickName == null || obj.nickName == "") {
                                htmlData += "<td>-</td>";
                            } else {
                                htmlData += "<td>" + obj.nickName + "</td>";
                            }
                            if (obj.position == "SH_HOLDER") {
                                Position = "Shareholder";
                            }
                            else {
                                var txt = obj.position;
                                var txt2 = txt.toLowerCase();
                                Position = capitalizeFirstLetter(txt2);
                            }
                            htmlData += "<td class='aligncenter' set-lan='text:" + Position + "'></td>";
                            var valCredit = parseFloat(Math.round(obj.credit) * 100 / 100).toFixed(2);
                            htmlData += "<td class='alignright'>" + valCredit.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                            htmlData += "<td class='aligncenter'><button type='button' class='btn btn-yellow font-weight-bold m-0 px-3 py-2 z-depth-0 waves-effect btnMenu' onclick='getCreditOutstanding(\"" + obj.id + "\");' style='line-height: 0rem !important;' set-lan='text:Detail'></button></td>";
                            htmlData += "<td class='aligncenter zonenone'><button type='button' class='btn btn-yellow font-weight-bold m-0 px-3 py-2 z-depth-0 waves-effect btnMenu' onclick='getModalDeposit(\"" + obj.username + "\");' style='line-height: 0rem !important;'>+</button></td>";
                            htmlData += "<td class='aligncenter zonenone'><button type='button' class='btn btn-yellow font-weight-bold m-0 px-3 py-2 z-depth-0 waves-effect btnMenu' onclick='getModalWithdrawal(\"" + obj.username + "\");' style='line-height: 0rem !important;'>-</button></td>";
                            htmlData += "<td class='aligncenter'><button type='button' class='btn btn-yellow font-weight-bold m-0 px-3 py-2 z-depth-0 waves-effect btnMenu' onclick='getModalDetail(\"" + obj.username + "\");' style='line-height: 0rem !important;' set-lan='text:Detail'></button></td>";

                            if (obj.lastLoginTime == "" || obj.lastLoginTime == null) {
                                htmlData += "<td class='aligncenter'>-</td>";
                            } else {
                                htmlData += "<td class='aligncenter'>" + obj.lastLoginTime + "</td>";
                            }

                            if (obj.lastLoginIp == "" || obj.lastLoginIp == null) {
                                htmlData += "<td>-</td>";
                            } else {
                                htmlData += "<td><p class='overflow ellipsis' title='" + obj.lastLoginIp + "'>" + obj.lastLoginIp + "</p></td>";
                            }

                            htmlData += "</tr>";
                            Total = Total + obj.credit;
                            no++;
                        }
                        $("#tbData > tbody").append(htmlData);
                        var ZZ = 0;
                        ZZ = response.data.totalCredit;
                        var Total2 = parseFloat(Math.round(ZZ) * 100 / 100).toFixed(2);
                        $("#totalCredit").text(Total2.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,'));

                        if (localStorage.getItem("UserType") == "sub") {
                            if (localStorage.getItem("Status_Payment") == "VIEW") {
                                $('.zonenone').css('display', 'none');
                            }
                        }

                        if (localStorage.getItem("Status_Payment") == "VIEW") {
                            $('.zonenone').css('display', 'none');
                        }
                    }
                    else {
                        $("#tbData > tbody").append("<tr><td colspan='10' style='text-align: center;' set-lan='text:No data.'></td></tr>");
                        $("#totalCredit").text("-");
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

        const postList = async (num) => {
            $("#tbData > tbody , #navMenu").html("");

            const parameterCom = {
                username: $('#searchLoginname').val(),
                page: num,
                size: 100,
                calCredit: true
            }
            const requestAwait = await fetchDataSite(`${apiURL}/v1/user/credit/inquiry`, 'POST', "include", parameterCom)
            const response = await requestAwait.json()

            if (response.messageCode == 0000 || response.messageCode == null) {
                var dataMenu = response.data.parentList;
                var htmlMenu = "";
                var htmlData = "";
                if (response.total != 0) {
                    var no = 1;
                    var Position = "";
                    var Total = 0;

                    for (var i = 0; i < response.data.detail.length; i++) {
                        var obj = response.data.detail[i];

                        htmlData += "<tr>";
                        htmlData += "<td class='aligncenter'>" + (((num - 1) * 20) + no) + "</td>";
                        htmlData += "<td><p class='overflow ellipsis' title='" + obj.username + "'>" + obj.username + "</p></td>";

                        if (obj.nickName == null || obj.nickName == "") {
                            htmlData += "<td>-</td>";
                        } else {
                            htmlData += "<td>" + obj.nickName + "</td>";
                        }
                        if (obj.position == "SH_HOLDER") {
                            Position = "Shareholder";
                        }
                        else {
                            var txt = obj.position;
                            var txt2 = txt.toLowerCase();
                            Position = capitalizeFirstLetter(txt2);
                        }
                        htmlData += "<td class='aligncenter' set-lan='text:" + Position + "'></td>";
                        var valCredit = parseFloat(Math.round(obj.credit) * 100 / 100).toFixed(2);
                        htmlData += "<td class='alignright'>" + valCredit.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                        htmlData += "<td class='aligncenter'><button type='button' class='btn btn-yellow font-weight-bold m-0 px-3 py-2 z-depth-0 waves-effect btnMenu' onclick='getCreditOutstanding(\"" + obj.id + "\");' style='line-height: 0rem !important;' set-lan='text:Detail'></button></td>";
                        htmlData += "<td class='aligncenter zonenone'><button type='button' class='btn btn-yellow font-weight-bold m-0 px-3 py-2 z-depth-0 waves-effect btnMenu' onclick='getModalDeposit(\"" + obj.username + "\");' style='line-height: 0rem !important;'>+</button></td>";
                        htmlData += "<td class='aligncenter zonenone'><button type='button' class='btn btn-yellow font-weight-bold m-0 px-3 py-2 z-depth-0 waves-effect btnMenu' onclick='getModalWithdrawal(\"" + obj.username + "\");' style='line-height: 0rem !important;'>-</button></td>";
                        htmlData += "<td class='aligncenter'><button type='button' class='btn btn-yellow font-weight-bold m-0 px-3 py-2 z-depth-0 waves-effect btnMenu' onclick='getModalDetail(\"" + obj.username + "\");' style='line-height: 0rem !important;' set-lan='text:Detail'></button></td>";

                        if (obj.lastLoginTime == "" || obj.lastLoginTime == null) {
                            htmlData += "<td class='aligncenter'>-</td>";
                        } else {
                            htmlData += "<td class='aligncenter'>" + obj.lastLoginTime + "</td>";
                        }

                        if (obj.lastLoginIp == "" || obj.lastLoginIp == null) {
                            htmlData += "<td>-</td>";
                        } else {
                            htmlData += "<td><p class='overflow ellipsis' title='" + obj.lastLoginIp + "'>" + obj.lastLoginIp + "</p></td>";
                        }

                        htmlData += "</tr>";
                        Total = Total + obj.credit;
                        no++;
                    }
                    $("#tbData > tbody").append(htmlData);
                    var ZZ = 0;
                    ZZ = response.data.totalCredit;
                    var Total2 = parseFloat(Math.round(ZZ) * 100 / 100).toFixed(2);
                    $("#totalCredit").text(Total2.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,'));

                    if (localStorage.getItem("UserType") == "sub") {
                        if (localStorage.getItem("Status_Payment") == "VIEW") {
                            $('.zonenone').css('display', 'none');
                        }
                    }

                    if (localStorage.getItem("Status_Payment") == "VIEW") {
                        $('.zonenone').css('display', 'none');
                    }
                }
                else {
                    $("#tbData > tbody").append("<tr><td colspan='10' style='text-align: center;' set-lan='text:No data.'></td></tr>");
                    $("#totalCredit").text("-");
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

        const postDeposit = async () => {
            var valDeposit = $("#deposit").val();
            if (valDeposit != "") {
                valDeposit = parseFloat($("#deposit").val().replace(/,/g, ""));
            }
            else {
                valDeposit = "";
            }
            const parameter = {
                username: Uname_Dep_Wit,
                amount: valDeposit
            }
            const requestAwait = await fetchDataSite(`${apiURL}/v1/user/credit/deposit`, 'POST', "include", parameter)
            const response = await requestAwait.json()
            if (response.messageCode == 0000 || response.messageCode == null) {
                $('#modalGetDeposit').modal('hide');

                document.getElementById("lbAlertAction").setAttribute("set-lan", "text:Update deposit success");
                SetLan(localStorage.getItem("Language"));

                $("#myModalLoad").modal('hide');
                $('#modalAlertSuccess').modal();

                setTimeout(function () {
                    location.reload();
                }, 1500);
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

        const postWithdrawal = async () => {
            var valWithdrawal = $("#withdrawal").val();
            if (valWithdrawal != "") {
                valWithdrawal = parseFloat($("#withdrawal").val().replace(/,/g, ""));
            }
            else {
                valWithdrawal = "";
            }
            const parameter = {
                username: Uname_Dep_Wit,
                amount: valWithdrawal
            }
            const requestAwait = await fetchDataSite(`${apiURL}/v1/user/credit/withdraw`, 'POST', "include", parameter)
            const response = await requestAwait.json()
            if (response.messageCode == 0000 || response.messageCode == null) {
                $('#modalGetWithdrawal').modal('hide');

                document.getElementById("lbAlertAction").setAttribute("set-lan", "text:Update withdrawal success");
                SetLan(localStorage.getItem("Language"));

                $("#myModalLoad").modal('hide');
                $('#modalAlertSuccess').modal();

                setTimeout(function () {
                    location.reload();
                }, 1500);
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

        const postDataHis = async (num) => {
            if (num == 0) {
                num = num + 1;
            }

            const parameterCom = {
                username: Uname_Detail,
                startDate: $("#datestartDetail").val(),
                endDate: $("#dateendDetail").val(),
                page: num,
                size: 100
            }
            const requestAwait = await fetchDataSite(`${apiURL}/v1/user/credit/statement`, 'POST', "include", parameterCom)
            const response = await requestAwait.json()

            if (response.messageCode == 0000 || response.messageCode == null) {
                //NumPage2 = num;
                TotalData2 = response.total;
                GetNumPage2(num);

                if (NumPage2 == 0) {
                    $("#tbData2 > tbody").html("");

                    var htmlData = "";
                    if (response.total != 0) {
                        var no = 1;
                        var Position = "";
                        var Total = 0;
                        for (var i = 0; i < response.data.detail.length; i++) {
                            var obj = response.data.detail[i];
                            htmlData += "<tr>";
                            htmlData += "<td class='aligncenter'>" + (((num - 1) * 20) + no) + "</td>";

                            if (obj.action == "WITHDRAW") {
                                htmlData += "<td set-lan='text:WITHDRAWAL'></td>";
                            }
                            else {
                                htmlData += "<td set-lan='text:" + obj.action + "'></td>";
                            }

                            var Amt = parseFloat(obj.amount).toFixed(2);
                            htmlData += "<td class='alignright'>" + Amt.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                            htmlData += "<td class='aligncenter'>" + obj.createTime + "</td>";
                            htmlData += "</tr>";
                            no++;
                        }

                        var total = response.data.summary.amount;
                        var Total2 = parseFloat(total).toFixed(2);
                        $("#totalAmount").text(Total2.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,'));

                        $("#tbData2 > tbody").append(htmlData);
                        SetLan(localStorage.getItem("Language"));
                        $('#modalGetDetail').modal('show');
                        $("#myModalLoad").modal('hide');
                    }
                    else {
                        htmlData += "<tr>";
                        htmlData += "<td colspan='4' class='aligncenter' set-lan='text:No data.'></td>";
                        htmlData += "</tr>";

                        $("#totalAmount").text("-");

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

        const postHisStatement = async (num) => {
            const parameterCom = {
                username: Uname_Detail,
                startDate: $("#datestartDetail").val(),
                endDate: $("#dateendDetail").val(),
                page: num,
                size: 100
            }
            const requestAwait = await fetchDataSite(`${apiURL}/v1/user/credit/statement`, 'POST', "include", parameterCom)
            const response = await requestAwait.json()

            if (response.messageCode == 0000 || response.messageCode == null) {
                $("#tbData2 > tbody").html("");

                var htmlData = "";
                if (response.total != 0) {
                    var no = 1;
                    var Position = "";
                    var Total = 0;
                    for (var i = 0; i < response.data.detail.length; i++) {
                        var obj = response.data.detail[i];
                        htmlData += "<tr>";
                        htmlData += "<td class='aligncenter'>" + (((num - 1) * 20) + no) + "</td>";

                        if (obj.action == "WITHDRAW") {
                            htmlData += "<td set-lan='text:WITHDRAWAL'></td>";
                        }
                        else {
                            htmlData += "<td set-lan='text:" + obj.action + "'></td>";
                        }

                        var Amt = parseFloat(obj.amount).toFixed(2);
                        htmlData += "<td class='alignright'>" + Amt.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                        htmlData += "<td class='aligncenter'>" + obj.createTime + "</td>";
                        htmlData += "</tr>";
                        no++;
                    }

                    var total = response.data.summary.amount;
                    var Total2 = parseFloat(total).toFixed(2);
                    $("#totalAmount").text(Total2.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,'));

                    $("#tbData2 > tbody").append(htmlData);
                    SetLan(localStorage.getItem("Language"));
                    $('#modalGetDetail').modal('show');
                    $("#myModalLoad").modal('hide');
                }
                else {
                    htmlData += "<tr>";
                    htmlData += "<td colspan='4' class='aligncenter' set-lan='text:No data.'></td>";
                    htmlData += "</tr>";

                    $("#totalAmount").text("-");

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

        const getProfile = async () => {
            const requestAwait = await fetchDataSite(`${apiURL}/v1/user/profile`, 'GET', "include", {})
            const response = await requestAwait.json()
            if (response.messageCode == 0000 || response.messageCode == null) {
                $("#txtCredit").text(response.data.credit.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1,"));
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

        const postCreditOutstanding = async (ID) => {
            const parameter = {
                userID: ID
            }
            const requestAwait = await fetchDataSite(`${apiURL}/v1/user/credit/cal_credit`, 'POST', "include", parameter)
            const response = await requestAwait.json()
            if (response.messageCode == 0000 || response.messageCode == null) {
                var txtCreditOut = response.data.credit;
                var txtCreditOut2 = parseFloat(txtCreditOut).toFixed(2);
                $("#txtCreditOut").text(txtCreditOut2.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1,"));
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
