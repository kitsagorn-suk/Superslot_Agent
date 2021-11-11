<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="transfer_failed.aspx.cs" Inherits="Pretty_Gaming.Menu_CheckBalance.transfer_failed" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .linkCursor {
            cursor: pointer;
        }
    </style>
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="" set-lan="text:Stock Mngement"></a></li>
            <li class="breadcrumb-item active txtMem" set-lan="text:Transfer"></li>
        </ol>
    </nav>
    <div class="row">
        <div class="col-md-8">
            <h1 set-lan="text:Transfer"></h1>
        </div>
        <div class="col-md-4" style="text-align: right; display: none;" id="ZoneBtnOut">
            <button class="btn btn-yellow font-weight-bold" type="button" set-lan="text:Outstanding" onclick="getOutstanding()"></button>
        </div>
    </div>
    <div class="btn-toolbar section-group" role="toolbar" style="padding-bottom: 0px !important;">
        <div class="form-group row" style="padding-left: 1rem;">
            <label for="email" class="col-form-label" set-lan="text:Username_"></label>
            <div style="padding-left: 1rem;">
                <input type="text" class="form-control" id="searchLoginname" onkeypress="Key_Enter(event)">
            </div>
        </div>
        <div class="form-group row" style="padding-left: 2.5rem;">
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
    <div class="row" style="margin-top: 20px;">
        <div class="col-md-8">
            <div id="navMenu" style="color: #17172c; width: fit-content; padding: 5px; font-weight: bold; border-radius: .3rem; font-size: .9rem; padding-right: 10px !important;">
            </div>
        </div>
        <div class="col-md-4">
            <section style="float: right;">
                <div class="data-container"></div>
                <div id="pagination-demo2"></div>
            </section>
        </div>
    </div>
    <div class="table-wrapper" style="margin-bottom: 10px; margin-top: 10px;">
        <table class="table table-border" id="tbData">
            <thead class="rgba-green-slight">
                <tr>
                    <th style="width: 1%;" set-lan="text:No"></th>
                    <th style="width: 7%; text-align: left; padding-left: 5px;" set-lan="text:Information"></th>
                    <th style="width: 13%; text-align: center; padding-left: 5px;" set-lan="text:Detail"></th>
                    <th style="width: 5%; text-align: right; padding-right: 5px;" set-lan="text:CreditBefore"></th>
                    <th style="width: 5%; text-align: right; padding-right: 5px;" set-lan="text:Amount"></th>
                    <th style="width: 5%; text-align: right; padding-right: 5px;" set-lan="text:CreditAfter"></th>
                    <th style="width: 3%;" set-lan="text:Status"></th>
                    <th style="width: 6%;" set-lan="text:Date"></th>
                    <th style="width: 5%;" set-lan="text:Remark"></th>
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
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
            </tfoot>
        </table>
    </div>

    <!-- Modal -->
    <div class="modal fade" id="modalGetOut" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header text-center">
                    <h4 class="modal-title w-100 font-weight-bold" set-lan="text:Outstanding"></h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body mx-3">
                    <div><b set-lan="text:Credit_"></b>&nbsp;<b style="color: #007bff;" id="txtCredit">-</b></div>
                    <table class="table table-border" id="tbDataOut" style="margin-top: 1rem;">
                        <thead class="rgba-green-slight">
                            <tr>
                                <th style="text-align: left; padding-left: 5px;" set-lan="text:Provider"></th>
                                <th set-lan="text:Outstanding"></th>
                            </tr>
                        </thead>
                        <tbody></tbody>
                        <tfoot class="rgba-yellow-slight">
                            <tr class="total">
                                <td></td>
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
    <div class="modal fade" id="modalGetDetail" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header text-center">
                    <h4 class="modal-title w-100 font-weight-bold" set-lan="text:Detail"></h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body mx-3">
                    <div class="form-group row mr-4" style="margin-bottom: 0px !important;">
                        <label for="email" class="col-4 col-form-label alignright" set-lan="text:Username_"></label>
                        <div class="switch col-8">
                            <label style="margin-top: 10px;">
                                <span class="blue-text text-13" id="txtUser"></span>
                            </label>
                        </div>
                    </div>
                    <div class="form-group row mr-4" style="margin-bottom: 0px !important;">
                        <label for="email" class="col-4 col-form-label alignright" set-lan="text:TransactionRef_"></label>
                        <div class="switch col-8">
                            <label style="margin-top: 10px;">
                                <span class="blue-text text-13" id="txtTranRef"></span>
                            </label>
                        </div>
                    </div>
                    <div class="form-group row mr-4" style="margin-bottom: 0px !important;">
                        <label for="email" class="col-4 col-form-label alignright" set-lan="text:Date_"></label>
                        <div class="switch col-8">
                            <label style="margin-top: 10px;">
                                <span class="blue-text text-13" id="txtDate"></span>
                            </label>
                        </div>
                    </div>
                    <div class="form-group row mr-4" style="margin-bottom: 0px !important;">
                        <label for="email" class="col-4 col-form-label alignright" set-lan="text:Amount_"></label>
                        <div class="switch col-8">
                            <label style="margin-top: 10px;">
                                <span class="text-13" id="txtAmount"></span>
                            </label>
                        </div>
                    </div>
                </div>
                <div class="modal-footer d-flex justify-content-center">
                    <button type="button" class="btn btn-yellow font-weight-bold" onclick="btnApprove();" set-lan="text:Approve"></button>
                    <button type="button" class="btn btn-yellow font-weight-bold" onclick="btnReject();" set-lan="text:Reject"></button>
                    <button type="button" class="btn btn-yellow font-weight-bold" data-dismiss="modal" aria-label="Close" set-lan="text:Close"></button>
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
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainScript" runat="server">
    <script src="../js/pagination.js"></script>
    <script type="text/javascript">
        var ID_verify = "";
        var ID_user = "";
        var Check_Enter = "";

        $(document).ready(function () {
            $("#menuCheck , #menuCheck > a").addClass("active");
            $("#menuCheck > div").css("display", "block");

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
            $("#startdate").val(dateSet);
            $("#todate").val(dateSet);
        }

        function Search_Click() {
            NumPage = 0;
            NumPageDetail = 0;

            GetData();
        }

        function getOutstanding() {
            $("#myModalLoad").modal();
            postOutstanding(ID_user);
        }

        function btnApprove() {
            $("#myModalLoad").modal();
            postApprove();
        }

        function btnReject() {
            $("#myModalLoad").modal();
            postReject();
        }

        function GetDataDetail0(ID, TranNo, User) {
            $("#navMenu").html("");
            var nav = "";
            nav += "<a class='linkNav' onclick='GetData()'>" + User + "</a>";
            nav += " / <a class='linkNav' onclick='GetDataDetail0(`" + ID + "`,`" + TranNo + "`,`" + User + "`)'>" + TranNo + "</a>";
            $("#navMenu").append(nav);
            $("#navMenu > a:last-child").css("text-decoration", "underline");

            GetDataDetail(ID);
        }

        function GetVerify(ID) {
            ID_verify = ID;
            postVerify(ID);
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
                                postTransfer(num);
                            }
                            NumPage = num;
                        }
                    });
                })('demo2');
            });
        }

        var NumPageDetail = 0;
        var TotalDataDetail;
        var IndexDetail;
        function GetDataDetail(ID) {
            $("#myModalLoad").modal();
            //if (NumPageDetail == null) {
            //    NumPageDetail = 0;
            //}
            postDataDetail(ID, NumPageDetail);
        }

        function GetNumPageDetail(ID, num) {
            $(function () {
                (function (name) {
                    var container = $('#pagination-' + name);
                    container.pagination({
                        totalNumber: TotalDataDetail,
                        pageNumber: IndexDetail,
                        pageSize: 100,
                        dataSource: 'https://api.flickr.com/services/feeds/photos_public.gne?tags=cat&tagmode=any&format=json&jsoncallback=?',
                        locator: 'items',
                        callback: function (response, pagination) {
                            num = container.pagination('getSelectedPageNum');
                            if (NumPageDetail != 0) {
                                postMember(ID, num);
                            }
                            NumPageDetail = num;
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
                username: $('#searchLoginname').val(),
                startDate: $("#startdate").val(),
                endDate: $("#todate").val(),
                page: num,
                size: 100
            }

            const requestAwait = await fetchDataSite(`${apiURL}/v1/transaction/transfer_failed`, 'POST', "include", parameter)
            const response = await requestAwait.json()
            if (response.messageCode == 0000 || response.messageCode == null) {
                TotalData = response.total;
                GetNumPage(num);

                if (NumPage == 0) {
                    $("#tbData > tbody , #navMenu").html("");
                    document.getElementById("ZoneBtnOut").style.display = "none";

                    var htmlData = "";
                    if (response.total != 0) {
                        var no = 1;

                        for (var i = 0; i < response.data.length; i++) {
                            var obj = response.data[i];
                            var Status = obj.status;

                            htmlData += "<tr>";
                            htmlData += "<td class='aligncenter'>" + (((num - 1) * 20) + no) + "</td>";
                            htmlData += "<td><b set-lan='text:User'></b> :" + obj.username + "<br /><b set-lan='text:Provider'></b> :" + obj.provider + "</td>";

                            if (Status == "FAILED") {
                                htmlData += "<td><b class='aligncenter' set-lan='text:" + obj.action + "'></b><br /><b set-lan='text:TransactionNo'></b> :" + obj.transactionNo + "<br /><b set-lan='text:TransactionRef'></b> :" + obj.transactionRef + "<br /><a onclick='GetDataDetail0(`" + obj.id + "`,`" + obj.transactionNo + "`,`" + obj.username + "`)' class='link overflow ellipsis' set-lan='text:detail+'></a></td>";
                            }
                            else {
                                htmlData += "<td><b class='aligncenter' set-lan='text:" + obj.action + "'></b><br /><b set-lan='text:TransactionNo'></b> :" + obj.transactionNo + "<br /><b set-lan='text:TransactionRef'></b> :" + obj.transactionRef + "</td>";
                            }


                            htmlData += "<td class='alignright'>" + obj.beforeBalance.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                            htmlData += "<td class='alignright'>" + obj.amount.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                            htmlData += "<td class='alignright'>" + obj.afterBalance.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";

                            if (Status == "FAILED") {
                                htmlData += "<td class='aligncenter txtRed' set-lan='text:FAILED'></td>";
                            }
                            else {
                                htmlData += "<td class='aligncenter' set-lan='text:Success'></td>";
                            }

                            var date = new Date(obj.createTime);
                            var txtDate;
                            if (obj.createTime == "" || obj.createTime == null) {
                                txtDate = "-";
                            }
                            else {
                                txtDate = ("0" + date.getDate()).slice(-2) + "/" + ("0" + (date.getMonth() + 1)).slice(-2) + "/" + date.getFullYear() + " " + ("0" + date.getHours()).slice(-2) + ":" + ("0" + date.getMinutes()).slice(-2) + ":" + ("0" + date.getSeconds()).slice(-2);
                            }
                            htmlData += "<td class='aligncenter'>" + txtDate + "</td>";
                            htmlData += "<td>" + obj.remark + "</td>";
                            htmlData += "</tr>";
                            no++;

                        }
                        $("#tbData > tbody").append(htmlData);
                    }
                    else {
                        $("#tbData > tbody").append("<tr><td colspan='9' style='text-align: center;' set-lan='text:No data.'></td></tr>");
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

        const postDataDetail = async (ID, num) => {
            //if (num == 0) {
            //    num = num + 1;
            //}

            const parameter = {
                id: ID,
                page: num,
                size: 100
            }

            const requestAwait = await fetchDataSite(`${apiURL}/v1/transaction/member`, 'POST', "include", parameter)
            const response = await requestAwait.json()
            if (response.messageCode == 0000 || response.messageCode == null) {
                TotalDataDetail = response.total;
                IndexDetail = response.data.index;
                GetNumPageDetail(ID, NumPageDetail);

                if (NumPageDetail == 0) {
                    $("#tbData > tbody").html("");
                    var htmlData = "";
                    if (response.total != 0) {
                        document.getElementById("ZoneBtnOut").style.display = "block";

                        var no = 1;
                        for (var i = 0; i < response.data.detail.length; i++) {
                            var obj = response.data.detail[i];
                            var Status = obj.status;

                            if (Status == "FAILED") {
                                htmlData += "<tr style='background-color: #e9ecef;'>";
                            }
                            else {
                                htmlData += "<tr>";
                            }

                            htmlData += "<td class='aligncenter'>" + (((IndexDetail - 1) * 20) + no) + "</td>";
                            htmlData += "<td><b set-lan='text:User'></b> :" + obj.username + "<br /><b set-lan='text:Provider'></b> :" + obj.provider + "</td>";

                            if (Status == "FAILED") {
                                htmlData += "<td><b class='aligncenter' set-lan='text:" + obj.action + "'></b><br /><b set-lan='text:TransactionNo'></b> :" + obj.transactionNo + "<br /><b set-lan='text:TransactionRef'></b> :" + obj.transactionRef + "<br /><a onclick='GetVerify(`" + obj.id + "`)' class='link overflow ellipsis' set-lan='text:detail+'></a></td>";
                            }
                            else {
                                htmlData += "<td><b class='aligncenter' set-lan='text:" + obj.action + "'></b><br /><b set-lan='text:TransactionNo'></b> :" + obj.transactionNo + "<br /><b set-lan='text:TransactionRef'></b> :" + obj.transactionRef + "</td>";
                            }

                            htmlData += "<td class='alignright'>" + obj.beforeBalance.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                            htmlData += "<td class='alignright'>" + obj.amount.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                            htmlData += "<td class='alignright'>" + obj.afterBalance.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";

                            if (Status == "FAILED") {
                                htmlData += "<td class='aligncenter txtRed' set-lan='text:FAILED'></td>";
                            }
                            else {
                                htmlData += "<td class='aligncenter' set-lan='text:Success'></td>";
                            }

                            var date = new Date(obj.createTime);
                            var txtDate;
                            if (obj.createTime == "" || obj.createTime == null) {
                                txtDate = "-";
                            }
                            else {
                                txtDate = ("0" + date.getDate()).slice(-2) + "/" + ("0" + (date.getMonth() + 1)).slice(-2) + "/" + date.getFullYear() + " " + ("0" + date.getHours()).slice(-2) + ":" + ("0" + date.getMinutes()).slice(-2) + ":" + ("0" + date.getSeconds()).slice(-2);
                            }
                            htmlData += "<td class='aligncenter'>" + txtDate + "</td>";
                            htmlData += "<td>" + obj.remark + "</td>";
                            htmlData += "</tr>";
                            no++;
                        }

                        ID_user = response.data.member.id;

                        $("#tbData > tbody").append(htmlData);
                    }
                    else {
                        $("#tbData > tbody").append("<tr><td colspan='6' style='text-align: center;' set-lan='text:No data.'></td></tr>");
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

        const postTransfer = async (num) => {
            $("#tbData > tbody , #navMenu").html("");
            document.getElementById("ZoneBtnOut").style.display = "none";

            const parameterSub = {
                username: $('#searchLoginname').val(),
                startDate: $("#startdate").val(),
                endDate: $("#todate").val(),
                page: num,
                size: 100
            }

            const requestAwait = await fetchDataSite(`${apiURL}/v1/transaction/transfer_failed`, 'POST', "include", parameterSub)
            const response = await requestAwait.json()

            if (response.messageCode == 0000 || response.messageCode == null) {
                var htmlData = "";
                if (response.total != 0) {
                    var no = 1;

                    for (var i = 0; i < response.data.length; i++) {
                        var obj = response.data[i];
                        var Status = obj.status;

                        htmlData += "<tr>";
                        htmlData += "<td class='aligncenter'>" + (((num - 1) * 20) + no) + "</td>";
                        htmlData += "<td><b set-lan='text:User'></b> :" + obj.username + "<br /><b set-lan='text:Provider'></b> :" + obj.provider + "</td>";

                        if (Status == "FAILED") {
                            htmlData += "<td><b class='aligncenter' set-lan='text:" + obj.action + "'></b><br /><b set-lan='text:TransactionNo'></b> :" + obj.transactionNo + "<br /><b set-lan='text:TransactionRef'></b> :" + obj.transactionRef + "<br /><a onclick='GetDataDetail0(`" + obj.id + "`,`" + obj.transactionNo + "`,`" + obj.username + "`)' class='link overflow ellipsis' set-lan='text:detail+'></a></td>";
                        }
                        else {
                            htmlData += "<td><b class='aligncenter' set-lan='text:" + obj.action + "'></b><br /><b set-lan='text:TransactionNo'></b> :" + obj.transactionNo + "<br /><b set-lan='text:TransactionRef'></b> :" + obj.transactionRef + "</td>";
                        }


                        htmlData += "<td class='alignright'>" + obj.beforeBalance.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                        htmlData += "<td class='alignright'>" + obj.amount.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                        htmlData += "<td class='alignright'>" + obj.afterBalance.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";

                        if (Status == "FAILED") {
                            htmlData += "<td class='aligncenter txtRed' set-lan='text:FAILED'></td>";
                        }
                        else {
                            htmlData += "<td class='aligncenter' set-lan='text:Success'></td>";
                        }

                        var date = new Date(obj.createTime);
                        var txtDate;
                        if (obj.createTime == "" || obj.createTime == null) {
                            txtDate = "-";
                        }
                        else {
                            txtDate = ("0" + date.getDate()).slice(-2) + "/" + ("0" + (date.getMonth() + 1)).slice(-2) + "/" + date.getFullYear() + " " + ("0" + date.getHours()).slice(-2) + ":" + ("0" + date.getMinutes()).slice(-2) + ":" + ("0" + date.getSeconds()).slice(-2);
                        }
                        htmlData += "<td class='aligncenter'>" + txtDate + "</td>";
                        htmlData += "<td>" + obj.remark + "</td>";
                        htmlData += "</tr>";
                        no++;

                    }
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

        const postMember = async (ID, num) => {
            $("#tbData > tbody").html("");

            const parameter = {
                id: ID,
                page: num,
                size: 100
            }
            const requestAwait = await fetchDataSite(`${apiURL}/v1/transaction/member`, 'POST', "include", parameter)
            const response = await requestAwait.json()

            if (response.messageCode == 0000 || response.messageCode == null) {
                var htmlData = "";
                if (response.total != 0) {
                    document.getElementById("ZoneBtnOut").style.display = "block";

                    var no = 1;
                    for (var i = 0; i < response.data.detail.length; i++) {
                        var obj = response.data.detail[i];
                        var Status = obj.status;

                        if (Status == "FAILED") {
                            htmlData += "<tr style='background-color: #e9ecef;'>";
                        }
                        else {
                            htmlData += "<tr>";
                        }

                        htmlData += "<td class='aligncenter'>" + (((num - 1) * 20) + no) + "</td>";
                        htmlData += "<td><b set-lan='text:User'></b> :" + obj.username + "<br /><b set-lan='text:Provider'></b> :" + obj.provider + "</td>";

                        if (Status == "FAILED") {
                            htmlData += "<td><b class='aligncenter' set-lan='text:" + obj.action + "'></b><br /><b set-lan='text:TransactionNo'></b> :" + obj.transactionNo + "<br /><b set-lan='text:TransactionRef'></b> :" + obj.transactionRef + "<br /><a onclick='GetVerify(`" + obj.id + "`)' class='link overflow ellipsis' set-lan='text:detail+'></a></td>";
                        }
                        else {
                            htmlData += "<td><b class='aligncenter' set-lan='text:" + obj.action + "'></b><br /><b set-lan='text:TransactionNo'></b> :" + obj.transactionNo + "<br /><b set-lan='text:TransactionRef'></b> :" + obj.transactionRef + "</td>";
                        }

                        htmlData += "<td class='alignright'>" + obj.beforeBalance.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                        htmlData += "<td class='alignright'>" + obj.amount.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                        htmlData += "<td class='alignright'>" + obj.afterBalance.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";

                        if (Status == "FAILED") {
                            htmlData += "<td class='aligncenter txtRed' set-lan='text:FAILED'></td>";
                        }
                        else {
                            htmlData += "<td class='aligncenter' set-lan='text:Success'></td>";
                        }

                        var date = new Date(obj.createTime);
                        var txtDate;
                        if (obj.createTime == "" || obj.createTime == null) {
                            txtDate = "-";
                        }
                        else {
                            txtDate = ("0" + date.getDate()).slice(-2) + "/" + ("0" + (date.getMonth() + 1)).slice(-2) + "/" + date.getFullYear() + " " + ("0" + date.getHours()).slice(-2) + ":" + ("0" + date.getMinutes()).slice(-2) + ":" + ("0" + date.getSeconds()).slice(-2);
                        }
                        htmlData += "<td class='aligncenter'>" + txtDate + "</td>";
                        htmlData += "<td>" + obj.remark + "</td>";
                        htmlData += "</tr>";
                        no++;
                    }

                    ID_user = response.data.member.id;

                    $("#tbData > tbody").append(htmlData);
                }
                else {
                    $("#tbData > tbody").append("<tr><td colspan='6' style='text-align: center;' set-lan='text:No data.'></td></tr>");
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

        const postVerify = async (ID) => {
            const parameter = {
                id: ID
            }
            const requestAwait = await fetchDataSite(`${apiURL}/v1/transaction/verify_transfer_credit`, 'POST', "include", parameter)
            const response = await requestAwait.json()

            if (response.messageCode == 0000 || response.messageCode == null) {
                document.getElementById("txtUser").innerHTML = response.data.Username;
                document.getElementById("txtTranRef").innerHTML = response.data.RequestID;

                var date = new Date(response.data.Time);
                var txtDate;
                if (response.data.Time == "" || response.data.Time == null) {
                    txtDate = "-";
                }
                else {
                    txtDate = ("0" + date.getDate()).slice(-2) + "/" + ("0" + (date.getMonth() + 1)).slice(-2) + "/" + date.getFullYear() + " " + ("0" + date.getHours()).slice(-2) + ":" + ("0" + date.getMinutes()).slice(-2) + ":" + ("0" + date.getSeconds()).slice(-2);
                }
                document.getElementById("txtDate").innerHTML = txtDate;

                var Amount = response.data.Amount;
                if (Amount < 0) {
                    $("#txtAmount").addClass("txtRed");
                }
                else {
                    $("#txtAmount").addClass("blue-text");
                }
                document.getElementById("txtAmount").innerHTML = Amount.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,');

                SetLan(localStorage.getItem("Language"));
                $('#modalGetDetail').modal('show');
                $("#myModalLoad").modal('hide');
            }
            else if (response.messageCode == 1303) {
                document.getElementById("lbAlert").setAttribute("set-lan", "text:Transaction Not Found");
                SetLan(localStorage.getItem("Language"));
                $('#modalAlert').modal('show');
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

        const postApprove = async () => {
            const parameter = {
                id: ID_verify
            }
            const requestAwait = await fetchDataSite(`${apiURL}/v1/transaction/approve_transfer_credit`, 'POST', "include", parameter)
            const response = await requestAwait.json()

            if (response.messageCode == 0000 || response.messageCode == null) {
                document.getElementById("lbAlertSuccess").setAttribute("set-lan", "text:Approve success");
                SetLan(localStorage.getItem("Language"));
                $("#myModalLoad").modal('hide');
                $('#modalGetDetail').modal('hide');
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

        const postReject = async () => {
            const parameter = {
                id: ID_verify
            }
            const requestAwait = await fetchDataSite(`${apiURL}/v1/transaction/reject_transfer_credit`, 'POST', "include", parameter)
            const response = await requestAwait.json()

            if (response.messageCode == 0000 || response.messageCode == null) {
                document.getElementById("lbAlertSuccess").setAttribute("set-lan", "text:Reject success");
                SetLan(localStorage.getItem("Language"));
                $("#myModalLoad").modal('hide');
                $('#modalGetDetail').modal('hide');
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

        const postOutstanding = async (ID) => {
            $("#tbDataOut > tbody").html("");

            const parameter = {
                memberID: ID,
            }
            const requestAwait = await fetchDataSite(`${apiURL}/v1/transaction/member_credit`, 'POST', "include", parameter)
            const response = await requestAwait.json()

            if (response.messageCode == 0000 || response.messageCode == null) {
                var htmlData = "";
                if (response.data.outstandingAtPartner != null) {
                    document.getElementById("ZoneBtnOut").style.display = "block";

                    for (var i = 0; i < response.data.outstandingAtPartner.length; i++) {
                        var obj = response.data.outstandingAtPartner[i];
                        htmlData += "<tr>";
                        htmlData += "<td>" + obj.name + " (" + obj.code + ")</td>";
                        htmlData += "<td class='alignright'>" + obj.outstanding.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";
                        htmlData += "</tr>";
                    }
                    $("#txtCredit").text(response.data.credits.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1,"));
                    $("#tbDataOut > tbody").append(htmlData);
                }
                else {
                    $("#tbDataOut > tbody").append("<tr><td colspan='3' style='text-align: center;' set-lan='text:No data.'></td></tr>");
                }

                SetLan(localStorage.getItem("Language"));
                $('#modalGetOut').modal('show');
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
