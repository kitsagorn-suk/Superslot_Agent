<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="company_list.aspx.cs" Inherits="Super_Slot.company_list" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="" set-lan="text:Management"></a></li>
            <li class="breadcrumb-item active" id="headPage"></li>
        </ol>
    </nav>
    <div class="row">
        <div class="col-md-8">
            <h1 id="headTopic"></h1>
        </div>
    </div>
    <div class="btn-toolbar section-group" role="toolbar" style="padding-bottom: 0px !important;">
        <div class="form-group row" style="padding-left: 1rem;">
            <label for="email" class="col-form-label" set-lan="text:Username_"></label>
            <div style="padding-left: 1rem;">
                <input type="text" class="form-control" id="searchLoginname" onkeypress="Key_Enter(event)">
            </div>
        </div>
        <div class="form-group row " style="padding-left: 3rem;">
            <label for="email" class="col-form-label" set-lan="text:Level_"></label>
            <div style="padding-left: 1rem;">
                <div class="select-outline">
                    <select id="level" class="mdb-select">
                        <option value="" selected set-lan="text:All">All</option>
                    </select>
                </div>
            </div>
        </div>
        <div class="form-group row" style="padding-left: 2rem;">
            <button class="btn btn-yellow font-weight-bold m-0 px-3 py-2 z-depth-0 waves-effect btnMenu" type="button" set-lan="text:Search" onclick="Search_Click()" id="btnSearch"></button>
        </div>
    </div>
    <div class="row">
        <div class="col-md-8">
            <div id="navMenu" style="margin-top: 1rem; color: #17172c; width: fit-content; padding: 5px; font-weight: bold; border-radius: .3rem; font-size: .9rem; padding-left: 10px !important; padding-right: 10px !important;">
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
                    <th style="width: 3%;" set-lan="text:No"></th>
                    <th style="width: 4%;" set-lan="text:Level"></th>
                    <th style="width: 7%; text-align: left; padding-left: 5px;" set-lan="text:Username"></th>
                    <th style="width: 7%; text-align: left; padding-left: 5px;" set-lan="text:Nickname"></th>
                    <th style="width: 5%; text-align: left; padding-left: 5px;" set-lan="text:Phone"></th>
                    <th style="width: 4%;" class="edit" set-lan="text:Edit"></th>
                    <th style="width: 4%;" class="edit" set-lan="text:Mission"></th>
                    <th style="width: 4%;" class="edit modify" set-lan="text:Verify"></th>
                    <th class="thSus" style="width: 5%;" set-lan="text:Suspend"></th>
                    <th class="thLock" style="width: 5%;" set-lan="text:Lock"></th>
                    <th style="width: 10%; text-align: right; padding-right: 5px;" set-lan="text:Credit"></th>
                    <th style="width: 4%;" set-lan="text:PT"></th>
                    <th style="width: 11%;" set-lan="text:Last login date"></th>
                    <th style="width: 5%; text-align: left; padding-left: 5px;" set-lan="text:Last login IP"></th>
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
                    <td class="edit"></td>
                    <td class="edit"></td>
                    <td class="edit modify"></td>
                    <td></td>
                    <td set-lan="text:Total" style="display: none;"></td>
                    <td id="totalCredit" style="display: none;">-</td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
            </tfoot>
        </table>
    </div>

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
                    <h4 class="modal-title w-100 font-weight-bold" set-lan="text:Commission"></h4>
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
    <div class="modal fade" id="modalAlert" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
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
        var Postion = localStorage.getItem("Position");
        var Status_Agent = localStorage.getItem("Status_Agent");
        var ValScroll = 0;
        var Check_Enter = "";

        $(document).ready(function () {
            $("#menuMemberManage , #menuMemberManage > a").addClass("active");
            $("#menuMemberManage > div").css("display", "block");

            if (Postion == "AMB") {
                selLevel(1, 1);
                document.getElementById("headPage").setAttribute("set-lan", "text:Company List");
                document.getElementById("headTopic").setAttribute("set-lan", "text:Company List");
            }
            else if (Postion == "COMPANY") {
                selLevel(2, 2);
                document.getElementById("headPage").setAttribute("set-lan", "text:Shareholder List");
                document.getElementById("headTopic").setAttribute("set-lan", "text:Shareholder List");
            }
            else if (Postion == "SH_HOLDER") {
                selLevel(3, 3);
                document.getElementById("headPage").setAttribute("set-lan", "text:Agent List");
                document.getElementById("headTopic").setAttribute("set-lan", "text:Agent List");
            }
            else if (Postion == "AGENT") {
                selLevel(3, 4);
                document.getElementById("headPage").setAttribute("set-lan", "text:Agents & Members List");
                document.getElementById("headTopic").setAttribute("set-lan", "text:Agents & Members List");
            }

            NumPage = 0;
            GetData('1', "");

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

            SetLan(localStorage.getItem("Language"));
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

        function Key_Enter(event) {
            var x = event.which || event.keyCode;
            if (x == 13) {
                Check_Enter = "Enter";
                event.preventDefault()
                Search_Click();
            }
        }

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

        function selLevel(min, max) {
            var select = document.getElementById('level');
            for (var i = min; i <= max; i++) {
                var opt = document.createElement('option');
                if (i == 1) {
                    opt.value = "COMPANY";
                    opt.innerHTML = "Company";
                    opt.setAttribute('set-lan', "text:Company");
                }
                else if (i == 2) {
                    opt.value = "SH_HOLDER";
                    opt.innerHTML = "Shareholder";
                    opt.setAttribute('set-lan', "text:Shareholder");
                }
                else if (i == 3) {
                    opt.value = "AGENT";
                    opt.innerHTML = "Agent";
                    opt.setAttribute('set-lan', "text:Agent");
                }
                else if (i == 4) {
                    opt.value = "MEMBER";
                    opt.innerHTML = "Member";
                    opt.setAttribute('set-lan', "text:Member");
                }
                SetLan(localStorage.getItem("Language"));
                select.appendChild(opt);
            }
        }

        function Search_Click() {
            NumPage = 0;
            GetData('1', "");
        }

        function GetDataTable(itemID) {
            NumPage = 0;
            $("#myModalLoad").modal();
            $("#tbData > tbody , #navMenu").html("");
            GetData('2', itemID);
        }

        function capitalizeFirstLetter(string) {
            return string.charAt(0).toUpperCase() + string.slice(1);
        }

        function viewEdit(val) {
            $("#myModalLoad").modal();
            GetScroll();

            window.location.href = "/Menu_MemberManagement/company_add.aspx?uname=" + val + "&s=" + ValScroll;
        }

        function viewEditMem(val) {
            $("#myModalLoad").modal();
            window.location.href = "/Menu_Member/member_add.aspx?uname=" + val;
        }

        function ModifyOpen() {
            $('.modify').css('display', 'table-cell');
        }

        function ModifyClose() {
            $('.modify').css('display', 'none');
        }

        var NumPage = 0;
        var TotalData;
        function GetData(status, itemID) {
            $("#myModalLoad").modal();
            var ID = itemID;
            postData(NumPage, ID, status);
        }

        function GetNumPage(num, tbID, status) {
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
                                postTable(tbID, num, status);
                            }
                            NumPage = num;
                        }
                    });
                })('demo2');
            });
        }

        const postData = async (num, tbID, status) => {
            if (num == 0) {
                num = num + 1;
            }

            var parameter = {};
            var URL = `${apiURL}/v1/user/inquiry`;
            if (status == 1) {
                parameter = {
                    parentID: tbID,
                    username: $('#searchLoginname').val(),
                    position: $('#level').val(),
                    page: num,
                    size: 100
                }
            }
            else if (status == 2) {
                parameter = {
                    parentID: tbID,
                    page: num,
                    size: 100
                }
            }
            const requestAwait = await fetchDataSite(URL, 'POST', "include", parameter)
            const response = await requestAwait.json()

            if (response.messageCode == 0000 || response.messageCode == null) {
                TotalData = response.total;
                GetNumPage(num, tbID, status);

                if (NumPage == 0) {
                    if (status == 1) {
                        $("#tbData > tbody , #navMenu").html("");

                        var dataMenu = response.data.parentList;
                        var Check = "";
                        var htmlMenu = "";
                        var htmlData = "";
                        if (response.total > 0) {
                            var no = 1;
                            var Position = "";
                            var Total = 0;

                            for (var i = 0; i < response.data.detail.length; i++) {
                                var obj = response.data.detail[i];

                                if (obj.isLock == true || obj.isSuspend == true) {
                                    htmlData += "<tr style='background-color: #e9ecef;'>";
                                }
                                else {
                                    htmlData += "<tr>";
                                }

                                htmlData += "<td class='aligncenter'>" + (((num - 1) * 100) + no) + "</td>";

                                if (obj.position == "SH_HOLDER") {
                                    Position = "Shareholder";
                                }
                                else {
                                    var txt = obj.position;
                                    var txt2 = txt.toLowerCase();
                                    Position = capitalizeFirstLetter(txt2);
                                }
                                htmlData += "<td class='aligncenter' set-lan='text:" + Position + "'></td>";

                                if (obj.position == "MEMBER") {
                                    Check = "Mem";
                                    htmlData += "<td><p class='overflow ellipsis' title='" + obj.username + "'>" + obj.username + "</p></td>";
                                }
                                else {
                                    htmlData += "<td><a onclick='GetDataTable(\"" + obj.id + "\")' class='linkNav overflow ellipsis' title='" + obj.username + "'>" + obj.username + "</a></td>";
                                }

                                if (obj.nickName == null || obj.nickName == "") {
                                    htmlData += "<td>-</td>";
                                } else {
                                    htmlData += "<td>" + obj.nickName + "</td>";
                                }

                                if (obj.phone == "" || obj.phone == null) {
                                    htmlData += "<td class='colTel'>-</td>";
                                } else {
                                    htmlData += "<td class='colTel'>" + obj.phone + "</td>";
                                }

                                var Sus = obj.isSuspend;
                                var Lock = obj.isLock;
                                var Modi = obj.verifyOTP;
                                if (Sus == false) {
                                    Sus = "No";
                                }
                                else {
                                    Sus = "Yes";
                                }

                                if (Lock == false) {
                                    Lock = "Unlock";
                                }
                                else {
                                    Lock = "Lock";
                                }

                                if (Modi == false) {
                                    Modi = "No";
                                } else {
                                    Modi = "Yes";
                                }

                                if (obj.position == "MEMBER") {
                                    htmlData += "<td class='aligncenter colEdit zonenone'><a class='link' onclick='viewEditMem(\"" + obj.id + "\");'><i class='fas fa-pencil-alt'></i></a></td>";
                                }
                                else {
                                    htmlData += "<td class='aligncenter colEdit zonenone'><a class='link' onclick='viewEdit(\"" + obj.id + "\");'><i class='fas fa-pencil-alt'></i></a></td>";
                                }

                                var C = 0;
                                if (obj.mission.length > 0) {
                                    for (var j = 0; j < obj.mission.length; j++) {
                                        if (obj.mission[j].status == true) {
                                            C++;
                                        }
                                    }
                                    htmlData += "<td class='aligncenter colEdit zonenone'>" + C + "/" + obj.mission.length + "</td>";
                                } else {
                                    htmlData += "<td class='aligncenter colEdit zonenone'>0/0</td>";
                                }

                                if (obj.position == "MEMBER") {
                                    htmlData += "<td class='aligncenter colEdit zonenone modify' set-lan='text:" + Modi + "Sus'></td>";
                                }
                                else {
                                    htmlData += "<td class='aligncenter colEdit zonenone modify'>-</td>";
                                }
                                htmlData += "<td class='colSus aligncenter' set-lan='text:" + Sus + "Sus'></td>";
                                htmlData += "<td class='colLock aligncenter' set-lan='text:" + Lock + "'></td>";

                                var valCredit = parseFloat(Math.round(obj.credit) * 100 / 100).toFixed(2);
                                htmlData += "<td class='alignright'>" + valCredit.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";

                                if (obj.positionTracking == "" || obj.positionTracking == null) {
                                    htmlData += "<td class='aligncenter'>-</td>";
                                } else {
                                    htmlData += "<td class='aligncenter'>" + obj.positionTracking + "%</td>";
                                }

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
                            var Total2 = parseFloat(Math.round(Total) * 100 / 100).toFixed(2);
                            $("#totalCredit").text(Total2.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,'));
                        }
                        else {
                            $("#tbData > tbody").append("<tr><td colspan='13' style='text-align: center;' set-lan='text:No data.'></td></tr>");
                            $("#totalCredit").text("-");
                        }

                        if (response.data.parentList.length != 0) {
                            var AA = "";
                            for (var i = 0; i < response.data.parentList.length; i++) {
                                if (AA == "") {
                                    AA += "<a class='linkNav' onclick='GetDataTable(\"" + response.data.parentList[i].id + "\")'>" + response.data.parentList[i].username + "</a>";
                                }
                                else {
                                    AA += " / <a class='linkNav' onclick='GetDataTable(\"" + response.data.parentList[i].id + "\")'>" + response.data.parentList[i].username + "</a>";
                                }
                            }
                            $("#navMenu").append(AA);
                            $("#navMenu > a:last-child").css("text-decoration", "underline");
                        }

                        if (dataMenu.length > 1) {
                            $('.edit , .colEdit').css('display', 'none');
                        }
                        else {
                            $('.edit , .colEdit').css('display', 'table-cell');
                        }

                        if (Check == "Mem") {
                            $('.modify').css('display', 'table-cell');
                        } else {
                            $('.modify').css('display', 'none');
                        }

                        if (localStorage.getItem("UserType") == "sub") {
                            if (localStorage.getItem("Status_Member") == "VIEW") {
                                $('.zonenone , .edit').css('display', 'none');
                            }
                        }

                        if (localStorage.getItem("Status_Member") == "VIEW") {
                            $('.zonenone , .edit').css('display', 'none');
                        }

                        SetScroll();
                        SetLan(localStorage.getItem("Language"));
                        $("#myModalLoad").modal('hide');
                    }
                    else if (status == 2) {
                        $("#tbData > tbody , #navMenu").html("");
                        var dataMenu = response.data.parentList;
                        var Check = "";
                        var htmlMenu = "";
                        var htmlData = "";

                        if (response.total > 0) {
                            var no = 1;
                            var Position = "";
                            var Total = 0;

                            for (var i = 0; i < response.data.detail.length; i++) {
                                var obj = response.data.detail[i];

                                if (obj.isLock == true || obj.isSuspend == true) {
                                    htmlData += "<tr style='background-color: #e9ecef;'>";
                                }
                                else {
                                    htmlData += "<tr>";
                                }

                                htmlData += "<td class='aligncenter'>" + (((num - 1) * 100) + no) + "</td>";

                                if (obj.position == "SH_HOLDER") {
                                    Position = "Shareholder";
                                }
                                else {
                                    var txt = obj.position;
                                    var txt2 = txt.toLowerCase();
                                    Position = capitalizeFirstLetter(txt2);
                                }
                                htmlData += "<td class='aligncenter' set-lan='text:" + Position + "'></td>";

                                if (obj.position == "MEMBER") {
                                    Check = "Mem";
                                    htmlData += "<td><p class='overflow ellipsis' title='" + obj.username + "'>" + obj.username + "</p></td>";
                                }
                                else {
                                    htmlData += "<td><a onclick='GetDataTable(\"" + obj.id + "\")' class='linkNav overflow ellipsis' title='" + obj.username + "'>" + obj.username + "</a></td>";
                                }

                                if (obj.nickName == null || obj.nickName == "") {
                                    htmlData += "<td>-</td>";
                                } else {
                                    htmlData += "<td>" + obj.nickName + "</td>";
                                }

                                if (obj.phone == "" || obj.phone == null) {
                                    htmlData += "<td class='colTel'>-</td>";
                                } else {
                                    htmlData += "<td class='colTel'>" + obj.phone + "</td>";
                                }

                                var Sus = obj.isSuspend;
                                var Lock = obj.isLock;
                                var Modi = obj.verifyOTP;
                                if (Sus == false) {
                                    Sus = "No";
                                }
                                else {
                                    Sus = "Yes";
                                }

                                if (Lock == false) {
                                    Lock = "Unlock";
                                }
                                else {
                                    Lock = "Lock";
                                }

                                if (Modi == false) {
                                    Modi = "No";
                                } else {
                                    Modi = "Yes";
                                }

                                if (obj.position == "MEMBER") {
                                    htmlData += "<td class='aligncenter colEdit zonenone'><a class='link' onclick='viewEditMem(\"" + obj.id + "\");'><i class='fas fa-pencil-alt'></i></a></td>";
                                }
                                else {
                                    htmlData += "<td class='aligncenter colEdit zonenone'><a class='link' onclick='viewEdit(\"" + obj.id + "\");'><i class='fas fa-pencil-alt'></i></a></td>";
                                }

                                var C = 0;
                                if (obj.mission.length > 0) {
                                    for (var j = 0; j < obj.mission.length; j++) {
                                        if (obj.mission[j].status == true) {
                                            C++;
                                        }
                                    }
                                    htmlData += "<td class='aligncenter colEdit zonenone'>" + C + "/" + obj.mission.length + "</td>";
                                } else {
                                    htmlData += "<td class='aligncenter colEdit zonenone'>0/0</td>";
                                }

                                if (obj.position == "MEMBER") {
                                    htmlData += "<td class='aligncenter colEdit zonenone modify' set-lan='text:" + Modi + "Sus'></td>";
                                }
                                else {
                                    htmlData += "<td class='aligncenter colEdit zonenone modify'>-</td>";
                                }
                                htmlData += "<td class='colSus aligncenter' set-lan='text:" + Sus + "Sus'></td>";
                                htmlData += "<td class='colLock aligncenter' set-lan='text:" + Lock + "'></td>";

                                var valCredit = parseFloat(Math.round(obj.credit) * 100 / 100).toFixed(2);
                                htmlData += "<td class='alignright'>" + valCredit.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";

                                if (obj.positionTracking == "" || obj.positionTracking == null) {
                                    htmlData += "<td class='aligncenter'>-</td>";
                                } else {
                                    htmlData += "<td class='aligncenter'>" + obj.positionTracking + "%</td>";
                                }

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
                            var Total2 = parseFloat(Math.round(Total) * 100 / 100).toFixed(2);
                            $("#totalCredit").text(Total2.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,'));
                        }
                        else {
                            $("#tbData > tbody").append("<tr><td colspan='13' style='text-align: center;' set-lan='text:No data.'></td></tr>");
                            $("#totalCredit").text("-");
                        }

                        if (response.data.parentList.length != 0) {
                            var AA = "";
                            for (var i = 0; i < response.data.parentList.length; i++) {
                                if (AA == "") {
                                    AA += "<a class='linkNav' onclick='GetDataTable(\"" + response.data.parentList[i].id + "\")'>" + response.data.parentList[i].username + "</a>";
                                }
                                else {
                                    AA += " / <a class='linkNav' onclick='GetDataTable(\"" + response.data.parentList[i].id + "\")'>" + response.data.parentList[i].username + "</a>";
                                }
                            }
                            $("#navMenu").append(AA);
                            $("#navMenu > a:last-child").css("text-decoration", "underline");
                        }

                        if (dataMenu.length > 1) {
                            $('.edit , .colEdit').css('display', 'none');
                        }
                        else {
                            $('.edit , .colEdit').css('display', 'table-cell');
                        }

                        if (Check == "Mem") {
                            $('.modify').css('display', 'table-cell');
                        } else {
                            $('.modify').css('display', 'none');
                        }

                        if (localStorage.getItem("UserType") == "sub") {
                            if (localStorage.getItem("Status_Member") == "VIEW") {
                                $('.zonenone , .edit').css('display', 'none');
                            }
                        }

                        if (localStorage.getItem("Status_Member") == "VIEW") {
                            $('.zonenone , .edit').css('display', 'none');
                        }

                        SetScroll();
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

        const postTable = async (tbID, num, status) => {
            $("#tbData > tbody , #navMenu").html("");

            var parameter = {};
            var URL = `${apiURL}/v1/user/inquiry`;
            if (status == 1) {
                parameter = {
                    parentID: tbID,
                    username: $('#searchLoginname').val(),
                    position: $('#level').val(),
                    page: num,
                    size: 100
                }
            }
            else if (status == 2) {
                parameter = {
                    parentID: tbID,
                    page: num,
                    size: 100
                }
            }
            const requestAwait = await fetchDataSite(URL, 'POST', "include", parameter)
            const response = await requestAwait.json()

            if (response.messageCode == 0000 || response.messageCode == null) {
                if (status == 1) {
                    var dataMenu = response.data.parentList;
                    var Check = "";
                    var htmlMenu = "";
                    var htmlData = "";
                    if (response.total > 0) {
                        var no = 1;
                        var Position = "";
                        var Total = 0;

                        for (var i = 0; i < response.data.detail.length; i++) {
                            var obj = response.data.detail[i];

                            if (obj.isLock == true || obj.isSuspend == true) {
                                htmlData += "<tr style='background-color: #e9ecef;'>";
                            }
                            else {
                                htmlData += "<tr>";
                            }

                            htmlData += "<td class='aligncenter'>" + (((num - 1) * 100) + no) + "</td>";

                            if (obj.position == "SH_HOLDER") {
                                Position = "Shareholder";
                            }
                            else {
                                var txt = obj.position;
                                var txt2 = txt.toLowerCase();
                                Position = capitalizeFirstLetter(txt2);
                            }
                            htmlData += "<td class='aligncenter' set-lan='text:" + Position + "'></td>";

                            if (obj.position == "MEMBER") {
                                Check = "Mem";
                                htmlData += "<td><p class='overflow ellipsis' title='" + obj.username + "'>" + obj.username + "</p></td>";
                            }
                            else {
                                htmlData += "<td><a onclick='GetDataTable(\"" + obj.id + "\")' class='linkNav overflow ellipsis' title='" + obj.username + "'>" + obj.username + "</a></td>";
                            }

                            if (obj.nickName == null || obj.nickName == "") {
                                htmlData += "<td>-</td>";
                            } else {
                                htmlData += "<td>" + obj.nickName + "</td>";
                            }

                            if (obj.phone == "" || obj.phone == null) {
                                htmlData += "<td class='colTel'>-</td>";
                            } else {
                                htmlData += "<td class='colTel'>" + obj.phone + "</td>";
                            }

                            var Sus = obj.isSuspend;
                            var Lock = obj.isLock;
                            var Modi = obj.verifyOTP;
                            if (Sus == false) {
                                Sus = "No";
                            }
                            else {
                                Sus = "Yes";
                            }

                            if (Lock == false) {
                                Lock = "Unlock";
                            }
                            else {
                                Lock = "Lock";
                            }

                            if (Modi == false) {
                                Modi = "No";
                            } else {
                                Modi = "Yes";
                            }

                            if (obj.position == "MEMBER") {
                                htmlData += "<td class='aligncenter colEdit zonenone'><a class='link' onclick='viewEditMem(\"" + obj.id + "\");'><i class='fas fa-pencil-alt'></i></a></td>";
                            }
                            else {
                                htmlData += "<td class='aligncenter colEdit zonenone'><a class='link' onclick='viewEdit(\"" + obj.id + "\");'><i class='fas fa-pencil-alt'></i></a></td>";
                            }

                            var C = 0;
                            if (obj.mission.length > 0) {
                                for (var j = 0; j < obj.mission.length; j++) {
                                    if (obj.mission[j].status == true) {
                                        C++;
                                    }
                                }
                                htmlData += "<td class='aligncenter colEdit zonenone'>" + C + "/" + obj.mission.length + "</td>";
                            } else {
                                htmlData += "<td class='aligncenter colEdit zonenone'>0/0</td>";
                            }

                            if (obj.position == "MEMBER") {
                                htmlData += "<td class='aligncenter colEdit zonenone modify' set-lan='text:" + Modi + "Sus'></td>";
                            }
                            else {
                                htmlData += "<td class='aligncenter colEdit zonenone modify'>-</td>";
                            }
                            htmlData += "<td class='colSus aligncenter' set-lan='text:" + Sus + "Sus'></td>";
                            htmlData += "<td class='colLock aligncenter' set-lan='text:" + Lock + "'></td>";

                            var valCredit = parseFloat(Math.round(obj.credit) * 100 / 100).toFixed(2);
                            htmlData += "<td class='alignright'>" + valCredit.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";

                            if (obj.positionTracking == "" || obj.positionTracking == null) {
                                htmlData += "<td class='aligncenter'>-</td>";
                            } else {
                                htmlData += "<td class='aligncenter'>" + obj.positionTracking + "%</td>";
                            }

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
                        var Total2 = parseFloat(Math.round(Total) * 100 / 100).toFixed(2);
                        $("#totalCredit").text(Total2.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,'));
                    }
                    else {
                        $("#tbData > tbody").append("<tr><td colspan='13' style='text-align: center;' set-lan='text:No data.'></td></tr>");
                        $("#totalCredit").text("-");
                    }

                    if (response.data.parentList.length != 0) {
                        var AA = "";
                        for (var i = 0; i < response.data.parentList.length; i++) {
                            if (AA == "") {
                                AA += "<a class='linkNav' onclick='GetDataTable(\"" + response.data.parentList[i].id + "\")'>" + response.data.parentList[i].username + "</a>";
                            }
                            else {
                                AA += " / <a class='linkNav' onclick='GetDataTable(\"" + response.data.parentList[i].id + "\")'>" + response.data.parentList[i].username + "</a>";
                            }
                        }
                        $("#navMenu").append(AA);
                        $("#navMenu > a:last-child").css("text-decoration", "underline");
                    }

                    if (dataMenu.length > 1) {
                        $('.edit , .colEdit').css('display', 'none');
                    }
                    else {
                        $('.edit , .colEdit').css('display', 'table-cell');
                    }

                    if (Check == "Mem") {
                        $('.modify').css('display', 'table-cell');
                    } else {
                        $('.modify').css('display', 'none');
                    }

                    if (localStorage.getItem("UserType") == "sub") {
                        if (localStorage.getItem("Status_Member") == "VIEW") {
                            $('.zonenone , .edit').css('display', 'none');
                        }
                    }

                    if (localStorage.getItem("Status_Member") == "VIEW") {
                        $('.zonenone , .edit').css('display', 'none');
                    }

                    SetLan(localStorage.getItem("Language"));
                    $("#myModalLoad").modal('hide');
                }
                else if (status == 2) {
                    var dataMenu = response.data.parentList;
                    var Check = "";
                    var htmlMenu = "";
                    var htmlData = "";

                    if (response.total > 0) {
                        var no = 1;
                        var Position = "";
                        var Total = 0;

                        for (var i = 0; i < response.data.detail.length; i++) {
                            var obj = response.data.detail[i];

                            if (obj.isLock == true || obj.isSuspend == true) {
                                htmlData += "<tr style='background-color: #e9ecef;'>";
                            }
                            else {
                                htmlData += "<tr>";
                            }

                            htmlData += "<td class='aligncenter'>" + (((num - 1) * 100) + no) + "</td>";

                            if (obj.position == "SH_HOLDER") {
                                Position = "Shareholder";
                            }
                            else {
                                var txt = obj.position;
                                var txt2 = txt.toLowerCase();
                                Position = capitalizeFirstLetter(txt2);
                            }
                            htmlData += "<td class='aligncenter' set-lan='text:" + Position + "'></td>";

                            if (obj.position == "MEMBER") {
                                Check = "Mem";
                                htmlData += "<td><p class='overflow ellipsis' title='" + obj.username + "'>" + obj.username + "</p></td>";
                            }
                            else {
                                htmlData += "<td><a onclick='GetDataTable(\"" + obj.id + "\")' class='linkNav overflow ellipsis' title='" + obj.username + "'>" + obj.username + "</a></td>";
                            }

                            if (obj.nickName == null || obj.nickName == "") {
                                htmlData += "<td>-</td>";
                            } else {
                                htmlData += "<td>" + obj.nickName + "</td>";
                            }

                            if (obj.phone == "" || obj.phone == null) {
                                htmlData += "<td class='colTel'>-</td>";
                            } else {
                                htmlData += "<td class='colTel'>" + obj.phone + "</td>";
                            }

                            var Sus = obj.isSuspend;
                            var Lock = obj.isLock;
                            var Modi = obj.verifyOTP;
                            if (Sus == false) {
                                Sus = "No";
                            }
                            else {
                                Sus = "Yes";
                            }

                            if (Lock == false) {
                                Lock = "Unlock";
                            }
                            else {
                                Lock = "Lock";
                            }

                            if (Modi == false) {
                                Modi = "No";
                            } else {
                                Modi = "Yes";
                            }

                            if (obj.position == "MEMBER") {
                                htmlData += "<td class='aligncenter colEdit zonenone'><a class='link' onclick='viewEditMem(\"" + obj.id + "\");'><i class='fas fa-pencil-alt'></i></a></td>";
                            }
                            else {
                                htmlData += "<td class='aligncenter colEdit zonenone'><a class='link' onclick='viewEdit(\"" + obj.id + "\");'><i class='fas fa-pencil-alt'></i></a></td>";
                            }

                            var C = 0;
                            if (obj.mission.length > 0) {
                                for (var j = 0; j < obj.mission.length; j++) {
                                    if (obj.mission[j].status == true) {
                                        C++;
                                    }
                                }
                                htmlData += "<td class='aligncenter colEdit zonenone'>" + C + "/" + obj.mission.length + "</td>";
                            } else {
                                htmlData += "<td class='aligncenter colEdit zonenone'>0/0</td>";
                            }

                            if (obj.position == "MEMBER") {
                                htmlData += "<td class='aligncenter colEdit zonenone modify' set-lan='text:" + Modi + "Sus'></td>";
                            }
                            else {
                                htmlData += "<td class='aligncenter colEdit zonenone modify'>-</td>";
                            }
                            htmlData += "<td class='colSus aligncenter' set-lan='text:" + Sus + "Sus'></td>";
                            htmlData += "<td class='colLock aligncenter' set-lan='text:" + Lock + "'></td>";

                            var valCredit = parseFloat(Math.round(obj.credit) * 100 / 100).toFixed(2);
                            htmlData += "<td class='alignright'>" + valCredit.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,') + "</td>";

                            if (obj.positionTracking == "" || obj.positionTracking == null) {
                                htmlData += "<td class='aligncenter'>-</td>";
                            } else {
                                htmlData += "<td class='aligncenter'>" + obj.positionTracking + "%</td>";
                            }

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
                        var Total2 = parseFloat(Math.round(Total) * 100 / 100).toFixed(2);
                        $("#totalCredit").text(Total2.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,'));
                    }
                    else {
                        $("#tbData > tbody").append("<tr><td colspan='13' style='text-align: center;' set-lan='text:No data.'></td></tr>");
                        $("#totalCredit").text("-");
                    }

                    if (response.data.parentList.length != 0) {
                        var AA = "";
                        for (var i = 0; i < response.data.parentList.length; i++) {
                            if (AA == "") {
                                AA += "<a class='linkNav' onclick='GetDataTable(\"" + response.data.parentList[i].id + "\")'>" + response.data.parentList[i].username + "</a>";
                            }
                            else {
                                AA += " / <a class='linkNav' onclick='GetDataTable(\"" + response.data.parentList[i].id + "\")'>" + response.data.parentList[i].username + "</a>";
                            }
                        }
                        $("#navMenu").append(AA);
                        $("#navMenu > a:last-child").css("text-decoration", "underline");
                    }

                    if (dataMenu.length > 1) {
                        $('.edit , .colEdit').css('display', 'none');
                    }
                    else {
                        $('.edit , .colEdit').css('display', 'table-cell');
                    }

                    if (Check == "Mem") {
                        $('.modify').css('display', 'table-cell');
                    } else {
                        $('.modify').css('display', 'none');
                    }

                    if (localStorage.getItem("UserType") == "sub") {
                        if (localStorage.getItem("Status_Member") == "VIEW") {
                            $('.zonenone , .edit').css('display', 'none');
                        }
                    }

                    if (localStorage.getItem("Status_Member") == "VIEW") {
                        $('.zonenone , .edit').css('display', 'none');
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

    </script>
</asp:Content>
