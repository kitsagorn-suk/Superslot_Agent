<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="company_add.aspx.cs" Inherits="Super_Slot.company_add" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .iconColor {
            color: #1461C9 !important;
            cursor: pointer;
        }
    </style>
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="" set-lan="text:Management"></a></li>
            <li class="breadcrumb-item"><a href="/Menu_MemberManagement/company_list.aspx" id="headMain"></a></li>
            <li class="breadcrumb-item active" id="headPage"></li>
        </ol>
    </nav>
    <h1 id="headTopic"></h1>
    <div class="section-group mb-4">
        <h4 set-lan="text:Basic Info"></h4>
        <div class="form-row">
            <div class="form-group col-5">
                <div class="form-group row inputform">
                    <label for="username" class="col-4 col-form-label" set-lan="html:Username-"></label>
                    <div class="col-8">
                        <input type="text" id="username" class="form-control" autocomplete="off" onkeypress="clsAlphaNoOnly(event)" maxlength="30" />
                        <small class="text-muted form-text" set-lan="text:textnumberonly"></small>
                    </div>
                </div>
                <div class="form-group row inputform">
                    <label for="username" class="col-4 col-form-label" set-lan="html:Password-"></label>
                    <div class="col-8" id="ZonePass1">
                        <input type="text" id="password" class="form-control" autocomplete="off" maxlength="24" />
                    </div>
                    <div class="col-8" id="ZonePass2">
                        <button type="button" class="btn btn-yellow font-weight-bold waves-effect waves-light" onclick="editPass();" set-lan="text:Edit Password"></button>
                    </div>
                </div>
                <div class="form-group row inputform" id="ZoneApiKey">
                    <label for="username" class="col-4 col-form-label" set-lan="html:ApiKey"></label>
                    <div class="col-8">
                        <input type="text" id="ApiKey" class="form-control" autocomplete="off" disabled="disabled">
                    </div>
                </div>
            </div>
            <div class="col-1"></div>
            <div class="form-group col-5">
                <div class="form-group row inputform">
                    <label for="username" class="col-4 col-form-label" set-lan="text:Nickname"></label>
                    <div class="col-8">
                        <input type="text" id="nickname" class="form-control" autocomplete="off" onkeypress="clsAlphaTHNoOnly(event)" maxlength="30" />
                        <small class="text-muted form-text" set-lan="text:textTHnumberonly"></small>
                    </div>
                </div>
                <div class="form-group row inputform">
                    <label for="username" class="col-4 col-form-label" set-lan="text:Phone number"></label>
                    <div class="col-8">
                        <input type="text" id="phonenumber" class="form-control" autocomplete="off" oninput="this.value=this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" maxlength="15" />
                        <small class="text-muted form-text" set-lan="text:numberonly"></small>
                    </div>
                </div>
            </div>
        </div>
        <div id="ZoneStatus">
            <h4 set-lan="text:Status"></h4>
            <div class="form-row">
                <div class="form-group col-5">
                    <div class="form-group row inputform">
                        <label for="pt" class="col-4 col-form-label" set-lan="text:Suspend"></label>
                        <div class="col-4">
                            <input type="text" id="suspend" class="form-control" autocomplete="off" disabled="disabled" set-lan="value:NoSus">
                        </div>
                    </div>
                </div>
                <div class="col-1"></div>
                <div class="form-group col-5">
                    <div class="form-group row inputform">
                        <label for="pt" class="col-4 col-form-label" set-lan="text:Lock"></label>
                        <div class="col-4">
                            <input type="text" id="lock" class="form-control" autocomplete="off" disabled="disabled" set-lan="value:Unlock">
                        </div>
                        <div class="col-4">
                            <button type="button" class="btn btn-yellow font-weight-bold waves-effect waves-light" onclick="editStatus();" set-lan="text:Edit Status"></button>
                        </div>
                    </div>
                </div>
            </div>
            <div class="form-row">
                <div class="form-group col-5"></div>
                <div class="col-1"></div>
                <div class="form-group col-5">
                    <div class="form-group row inputform">
                        <label for="pt" class="col-4 col-form-label" style="padding-right: 0px;" set-lan="text:Lock from Login Failed"></label>
                        <div class="col-4">
                            <input type="text" id="lockFailed" class="form-control" autocomplete="off" disabled="disabled" set-lan="value:Unlock">
                        </div>
                        <div class="col-4">
                            <button type="button" class="btn btn-yellow font-weight-bold waves-effect waves-light" onclick="EditLockFailed();" set-lan="text:Edit Status"></button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div id="ZoneMission">
            <h4 set-lan="text:Mission"></h4>
            <div class="form-row">
                <div class="form-group col-5">
                    <div class="form-group row inputform">
                        <label for="Mission" class="col-4 col-form-label" set-lan="text:Mission"></label>
                        <div class="col-8">
                            <button type="button" class="btn btn-yellow font-weight-bold waves-effect waves-light" onclick="editMission();" set-lan="text:Edit Mission"></button>
                        </div>
                    </div>
                </div>
            </div>
            <div id="ZoneMission_Agent2" style="display: none;">
                <div class="form-row">
                    <div class="form-group col-5">
                        <div class="row inputform">
                            <label for="Mission" class="col-4 col-form-label" set-lan="html:Reward Mission_"></label>
                            <div class="col-8">
                                <input type="text" id="Mission_Reward" class="form-control" autocomplete="off" onkeyup="javascript:this.value=Comma(this.value);" oninput="this.value=this.value.replace(/[^0-9]/g, '').replace(/(\..*)\./g, '$1');" maxlength="30" />
                                <small class="text-muted form-text" set-lan="text:numberonly"></small>
                            </div>
                        </div>
                    </div>
                    <div class="col-1"></div>
                    <div class="form-group col-5">
                        <div class="row inputform">
                            <label for="Mission" class="col-4 col-form-label" set-lan="html:Turnover Mission_"></label>
                            <div class="col-5">
                                <input type="text" id="Mission_Turnover" class="form-control" autocomplete="off" onkeyup="javascript:this.value=Comma(this.value);" oninput="this.value=this.value.replace(/[^0-9]/g, '').replace(/(\..*)\./g, '$1');" maxlength="30" />
                                <small class="text-muted form-text" set-lan="text:numberonly"></small>
                            </div>
                            <label for="Mission" class="col-2 col-form-label" set-lan="text:as much"></label>
                        </div>
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group col-5">
                        <div class="row inputform">
                            <label for="Mission" class="col-4 col-form-label" set-lan="html:Max Withdraw Mission_" style="padding-right: 0px;"></label>
                            <div class="col-8">
                                <input type="text" id="Mission_Max" class="form-control" autocomplete="off" onkeyup="javascript:this.value=Comma(this.value);" oninput="this.value=this.value.replace(/[^0-9]/g, '').replace(/(\..*)\./g, '$1');" maxlength="30" />
                                <small class="text-muted form-text" set-lan="text:numberonly"></small>
                            </div>
                        </div>
                    </div>
                    <div class="col-1"></div>
                    <div class="form-group col-5">
                        <div class="row inputform">
                            <label for="Mission" class="col-4 col-form-label" set-lan="html:Limit Mission_" style="padding-right: 0px;"></label>
                            <div class="col-5">
                                <input type="text" id="Mission_Limit" class="form-control" autocomplete="off" onkeyup="javascript:this.value=Comma(this.value);" oninput="this.value=this.value.replace(/[^0-9]/g, '').replace(/(\..*)\./g, '$1');" maxlength="30" />
                                <small class="text-muted form-text" set-lan="text:numberonly"></small>
                            </div>
                            <label for="Mission" class="col-2 col-form-label" set-lan="text:person"></label>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <h4 set-lan="text:Credit Settings"></h4>
        <div class="form-row">
            <div class="form-group col-5">
                <div class="form-group row inputform">
                    <label for="pt" class="col-4 col-form-label" set-lan="html:Our PT-"></label>
                    <div class="col-8">
                        <div class="row">
                            <div class="col-8">
                                <div class="select-outline">
                                    <select class="mdb-select" id="ddl_positiontracking" onchange="changePT('our')">
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="form-group row inputform">
                    <label for="pt" class="col-4 col-form-label" set-lan="html:Given PT-"></label>
                    <div class="col-8">
                        <div class="row">
                            <div class="col-8">
                                <div class="select-outline">
                                    <select class="mdb-select" id="ddl_givenPT" onchange="changePT('given')">
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-1"></div>
            <div class="form-group col-5">
                <div class="form-group row inputform">
                    <label for="credit" class="col-4 col-form-label" set-lan="html:Credit-"></label>
                    <div class="col-8">
                        <input type="text" id="credit" class="form-control" autocomplete="off" onkeyup="javascript:this.value=Comma(this.value);" oninput="this.value=this.value.replace(/[^0-9]/g, '').replace(/(\..*)\./g, '$1');" maxlength="30" />
                        <small id="creditHelper" class="text-muted form-text"></small>
                    </div>
                </div>
            </div>
            <div class="form-group col-5" style="display: none;">
                <div class="form-group row inputform">
                    <label for="pt" class="col-4 col-form-label">test</label>
                    <div class="col-8">
                        <div class="row">
                            <div class="col-8">
                                <div class="select-outline">
                                    <select class="mdb-select" id="ddl_test">
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="form-row">
            <div class="col-12" style="text-align: center; margin-top: 1rem;">
                <button class="btn btn-yellow font-weight-bold" id="btnADD" onclick="AddCompany()" type="button" set-lan="text:Add Shareholder"></button>
                <button class="btn btn-yellow font-weight-bold" id="btnSAVE" onclick="SaveCompany()" type="button" set-lan="text:Save Shareholder"></button>
            </div>
        </div>
    </div>
    <%--<label id="lbText"></label>--%>

    <%--Modal--%>
    <div class="modal fade" id="modalDetail" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header text-center">
                    <h4 class="modal-title w-100 font-weight-bold" id="hdDetail" set-lan="text:No"></h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body mx-5">
                    <label id="lbDetail"></label>
                </div>
                <div class="modal-footer d-flex justify-content-center">
                    <button type="button" class="btn btn-yellow font-weight-bold waves-effect waves-light" data-dismiss="modal" aria-label="Close" set-lan="text:Close"></button>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="modalMission" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header text-center">
                    <h4 class="modal-title w-100 font-weight-bold" set-lan="text:Mission"></h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body mx-3">
                    <table class="table table-border" id="tbData2">
                        <thead class="rgba-green-slight">
                            <tr>
                                <th set-lan="text:Status"></th>
                                <th set-lan="text:Language Thai"></th>
                                <th set-lan="text:Language English"></th>
                            </tr>
                        </thead>
                        <tbody>
                        </tbody>
                        <tfoot class="rgba-yellow-slight">
                            <tr class="total">
                                <td></td>
                                <td></td>
                                <td></td>
                            </tr>
                        </tfoot>
                    </table>
                </div>
                <div class="modal-footer d-flex justify-content-center">
                    <%--<button type="button" class="btn btn-yellow font-weight-bold" onclick="saveMission('new');" id="saveMissionNew" set-lan="text:OK"></button>
                    <button type="button" class="btn btn-yellow font-weight-bold" onclick="saveMission('edit');" id="saveMissionEdit" set-lan="text:OK"></button>--%>
                    <button type="button" class="btn btn-yellow font-weight-bold waves-effect waves-light" data-dismiss="modal" aria-label="Close" set-lan="text:Close"></button>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="modalPassword" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header text-center">
                    <h4 class="modal-title w-100 font-weight-bold" set-lan="text:Password"></h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body mx-3">
                    <div class="form-group row mr-4" style="margin-bottom: 0px !important;">
                        <label for="email" class="col-4 col-form-label alignright" set-lan="html:New Password"></label>
                        <input type="text" class="form-control col-8" autocomplete="off" id="password_new" maxlength="24" />
                        <label class="col-4 col-form-label alignright"></label>
                    </div>
                </div>
                <div class="modal-footer d-flex justify-content-center">
                    <button type="button" class="btn btn-yellow font-weight-bold" onclick="saveNewPass();" set-lan="text:Save"></button>
                    <button type="button" class="btn btn-yellow font-weight-bold" data-dismiss="modal" aria-label="Close" set-lan="text:Close"></button>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="modalStatus" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header text-center">
                    <h4 class="modal-title w-100 font-weight-bold" set-lan="text:Status"></h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body mx-3">
                    <div class="form-group row mr-4" style="margin-bottom: 0px !important;">
                        <label for="email" class="col-4 col-form-label alignright" set-lan="text:Suspend-"></label>
                        <div class="switch col-8">
                            <label style="margin-top: 10px;">
                                <input type="checkbox" id="chkSuspend" onclick="chgSuspend(this)">
                                <span class="lever ml-0"></span>
                                <span class="blue-text text-13" id="txtSuspend"></span>
                            </label>
                        </div>
                    </div>
                    <div class="form-group row mr-4" style="margin-bottom: 0px !important;">
                        <label for="email" class="col-4 col-form-label alignright" set-lan="text:Lock-"></label>
                        <div class="switch col-8">
                            <label style="margin-top: 10px;">
                                <input type="checkbox" id="chkLock" onclick="chgLock(this)">
                                <span class="lever ml-0"></span>
                                <span class="blue-text text-13" id="txtLock"></span>
                            </label>
                        </div>
                    </div>
                </div>
                <div class="modal-footer d-flex justify-content-center">
                    <button type="button" class="btn btn-yellow font-weight-bold" onclick="saveEditStatus();" set-lan="text:Save"></button>
                    <button type="button" class="btn btn-yellow font-weight-bold" data-dismiss="modal" aria-label="Close" set-lan="text:Close"></button>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="modalLockFailed" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header text-center">
                    <h4 class="modal-title w-100 font-weight-bold" set-lan="text:Lock from Login Failed"></h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body mx-3">
                    <div class="form-group row mr-4" style="margin-bottom: 0px !important;">
                        <span class="col-9 col-form-label" set-lan="text:Are you sure to unlock this username?"></span>
                    </div>
                </div>
                <div class="modal-footer d-flex justify-content-center">
                    <button type="button" class="btn btn-yellow font-weight-bold" onclick="SaveLockFailed();" set-lan="text:OK"></button>
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
    <script>
        var Postion = localStorage.getItem("Position");
        var TextHead = "";
        var ARR = "";
        var Check = "";
        var ValScroll = 0;

        $(document).ready(function () {
            $("#menuMemberManage , #menuMemberManage > a").addClass("active");
            $("#menuMemberManage > div").css("display", "block");

            $("#myModalLoad").modal();

            var uname = getUrlParameter('uname');
            var scroll = getUrlParameter('s');
            if (uname == "") {
                //document.getElementById("saveMissionEdit").style.display = "none";
                document.getElementById("btnSAVE").style.display = "none";
                document.getElementById("ZonePass2").style.display = "none";
                document.getElementById("ZoneStatus").style.display = "none";
                document.getElementById("ZoneApiKey").style.display = "none";
                TextHead = "text:Add ";
                getProfile();
                postMission();
            }
            else {
                //document.getElementById("saveMissionNew").style.display = "none";
                document.getElementById("btnADD").style.display = "none";
                document.getElementById("ZonePass1").style.display = "none";
                $('#username').prop("disabled", true);
                $('#credit').prop("disabled", true);
                TextHead = "text:Save ";
                postUser(uname);
            }

            if (scroll != "" || scroll != null) {
                ValScroll = scroll;
            }

            if (Postion == "AMB") {
                document.getElementById("headMain").setAttribute("set-lan", "text:Company List");
                document.getElementById("headPage").setAttribute("set-lan", TextHead + "Company");
                document.getElementById("headTopic").setAttribute("set-lan", TextHead + "Company");
                document.getElementById("btnADD").setAttribute("set-lan", TextHead + "Company");
                document.getElementById("btnSAVE").setAttribute("set-lan", TextHead + "Company");
            }
            else if (Postion == "COMPANY") {
                document.getElementById("headMain").setAttribute("set-lan", "text:Shareholder List");
                document.getElementById("headPage").setAttribute("set-lan", TextHead + "Shareholder");
                document.getElementById("headTopic").setAttribute("set-lan", TextHead + "Shareholder");
                document.getElementById("btnADD").setAttribute("set-lan", TextHead + "Shareholder");
                document.getElementById("btnSAVE").setAttribute("set-lan", TextHead + "Shareholder");
            }
            else if (Postion == "SH_HOLDER") {
                document.getElementById("headMain").setAttribute("set-lan", "text:Agent List");
                document.getElementById("headPage").setAttribute("set-lan", TextHead + "Agent");
                document.getElementById("headTopic").setAttribute("set-lan", TextHead + "Agent");
                document.getElementById("btnADD").setAttribute("set-lan", TextHead + "Agent");
                document.getElementById("btnSAVE").setAttribute("set-lan", TextHead + "Agent");
            }
            else if (Postion == "AGENT") {
                document.getElementById("headMain").setAttribute("set-lan", "text:Agents & Members List");
                document.getElementById("headPage").setAttribute("set-lan", TextHead + "Agent");
                document.getElementById("headTopic").setAttribute("set-lan", TextHead + "Agent");
                document.getElementById("btnADD").setAttribute("set-lan", TextHead + "Agent");
                document.getElementById("btnSAVE").setAttribute("set-lan", TextHead + "Agent");
            }

            if (Postion == "SH_HOLDER" || Postion == "AGENT") {
                document.getElementById("ZoneMission_Agent2").style.display = "block";
            }

            $('#creditHelper').html('<span set-lan="html:Min"></span>' + ' 0, <span set-lan="html:Max"></span> ' + localStorage.getItem("Credit").toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,'));
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

        function getModalDetail(txt) {
            document.getElementById("hdDetail").setAttribute("set-lan", "text:" + txt);
            if (txt == "Reward Mission") {
                document.getElementById("lbDetail").setAttribute("set-lan", "html:Detail_Reward");
            } else if (txt == "Turnover Mission") {
                document.getElementById("lbDetail").setAttribute("set-lan", "html:Detail_Turnover");
            } else if (txt == "Max withdraw") {
                document.getElementById("lbDetail").setAttribute("set-lan", "html:Detail_Max");
            } else if (txt == "Limit Mission") {
                document.getElementById("lbDetail").setAttribute("set-lan", "html:Detail_Limit");
            }

            SetLan(localStorage.getItem("Language"));
            $('#modalDetail').modal('show');
        }

        function editPass() {
            $('#modalPassword').modal('show');
        }

        function EditLockFailed() {
            $('#modalLockFailed').modal('show');
        }

        function editStatus() {
            var Sus = $('#suspend').val();
            var Lock = $('#lock').val();
            if (Sus == "Yes" || Sus == "ใช่" || Sus == "是") {
                document.getElementById("chkSuspend").checked = true;
                document.getElementById("txtSuspend").setAttribute("set-lan", "text:YesSus");
            } else {
                document.getElementById("chkSuspend").checked = false;
                document.getElementById("txtSuspend").setAttribute("set-lan", "text:NoSus");
            }

            if (Lock == "Lock" || Lock == "ล็อค" || Lock == "锁") {
                document.getElementById("chkLock").checked = true;
                document.getElementById("txtLock").setAttribute("set-lan", "text:Lock");
            }
            else {
                document.getElementById("chkLock").checked = false;
                document.getElementById("txtLock").setAttribute("set-lan", "text:Unlock");
            }

            SetLan(localStorage.getItem("Language"));
            $('#modalStatus').modal('show');
        }

        function editMission() {
            if (Check == "") {
                $('input[name="chkMission"]:checked').prop("checked", false);
            }
            $('#modalMission').modal('show');
        }

        function chgSuspend(ele) {
            if (ele.checked) {
                document.getElementById("txtSuspend").setAttribute("set-lan", "text:YesSus");
                SetLan(localStorage.getItem("Language"));
            } else {
                document.getElementById("txtSuspend").setAttribute("set-lan", "text:NoSus");
                SetLan(localStorage.getItem("Language"));
            }
        }

        function chgLock(ele) {
            if (ele.checked) {
                document.getElementById("txtLock").setAttribute("set-lan", "text:Lock");
                SetLan(localStorage.getItem("Language"));
            } else {
                document.getElementById("txtLock").setAttribute("set-lan", "text:Unlock");
                SetLan(localStorage.getItem("Language"));
            }
        }

        function changePT(type) {
            if (type == "our") {
                var txt = parseInt($("select#ddl_positiontracking").val());
                var pt = parseInt(localStorage.getItem("PositionTracking"));
                var total = 0;
                if (txt >= pt) {
                    total = txt - pt;
                }
                else if (txt <= pt) {
                    total = pt - txt;
                }
                $('#ddl_givenPT option').removeAttr('selected');
                $("#ddl_givenPT option[value='" + total + "']").attr("selected", "selected");
            }

            if (type == "given") {
                var txt = parseInt($("select#ddl_givenPT").val());
                var pt = parseInt(localStorage.getItem("PositionTracking"));
                var total = 0;
                if (txt >= pt) {
                    total = txt - pt;
                }
                else if (txt <= pt) {
                    total = pt - txt;
                }
                $('#ddl_positiontracking option').removeAttr('selected');
                $("#ddl_positiontracking option[value='" + total + "']").attr("selected", "selected");
            }
        }

        function AddCompany() {
            $("#myModalLoad").modal();

            if ($('#username').val() == "") {
                document.getElementById("lbAlert").setAttribute("set-lan", "text:missing 'Username' field");
                SetLan(localStorage.getItem("Language"));
                $('#modalAlert').modal('show');
                $("#myModalLoad").modal('hide');
            }
            else if ($('#password').val() == "") {
                document.getElementById("lbAlert").setAttribute("set-lan", "text:missing 'Password' field");
                SetLan(localStorage.getItem("Language"));
                $('#modalAlert').modal('show');
                $("#myModalLoad").modal('hide');
            }
            else if ($('#credit').val() == "") {
                document.getElementById("lbAlert").setAttribute("set-lan", "text:missing 'Credit' field");
                SetLan(localStorage.getItem("Language"));
                $('#modalAlert').modal('show');
                $("#myModalLoad").modal('hide');
            }
            else {
                postAddCompany();
            }
        }

        function SaveCompany() {
            $("#myModalLoad").modal();
            postEditCompany();
        }

        function SaveLockFailed() {
            $("#myModalLoad").modal();
            postLockFailed();
        }

        function saveNewPass() {
            $("#myModalLoad").modal();

            if ($('#password_new').val() == "") {
                document.getElementById("lbAlert").setAttribute("set-lan", "text:missing 'New Password' field");
                SetLan(localStorage.getItem("Language"));
                $('#modalAlert').modal('show');
                $("#myModalLoad").modal('hide');
            }
            else {
                postNewPass();
            }
        }

        function saveEditStatus() {
            $("#myModalLoad").modal();
            var statussuspend = false;
            var statuslock = false;

            if (document.getElementById('chkSuspend').checked) {
                statussuspend = true;
            } else {
                statussuspend = false;
            }

            if (document.getElementById('chkLock').checked) {
                statuslock = true;
            } else {
                statuslock = false;
            }

            postEditStatus(statussuspend, statuslock);
        }

        function saveMission(txt) {
            if (txt == "edit") {
                postEditMission();
            }
            else if (txt == "new") {
                $('#modalMission').modal('hide');
            }
        }

        const getProfile = async () => {
            const requestAwait = await fetchDataSite(`${apiURL}/v1/user/profile`, 'GET', "include", {})
            const response = await requestAwait.json()
            if (response.messageCode == 0000 || response.messageCode == null) {
                if (response.data.positionTracking != null || response.data.positionTracking != "") {
                    localStorage.setItem("PositionTracking", response.data.positionTracking);
                    localStorage.setItem("Credit", response.data.credit);

                    var htmlPT = "<option value='' disabled selected>Choose Position Tracking</option>";
                    var PT = response.data.positionTracking;
                    for (var i = 0; i <= PT; i++) {
                        htmlPT += "<option value=" + i + ">" + i + "%</option>";
                    }
                    document.getElementById('ddl_positiontracking').innerHTML = htmlPT;
                    document.getElementById('ddl_givenPT').innerHTML = htmlPT;
                    $("#ddl_positiontracking option[value='0']").attr("selected", "selected");
                    $("#ddl_givenPT option:last").attr("selected", "selected");
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

        const postUser = async (username) => {
            const parameterCom = {
                id: username.toString(),
                page: 1,
                size: 20
            }
            const requestAwait = await fetchDataSite(`${apiURL}/v1/user/inquiry`, 'POST', "include", parameterCom)
            const response = await requestAwait.json()

            if (response.messageCode == 0000 || response.messageCode == null) {
                var htmlData = "";
                if (response.data.detail != null) {
                    for (var i = 0; i <= response.data.detail.length; i++) {
                        ARR = response.data.detail[i].mission;

                        var POSI = response.data.detail[i].position;
                        var Sus = response.data.detail[i].isSuspend;
                        var Lock = response.data.detail[i].isLock;
                        var LockFailed = response.data.detail[i].isLockedForLogin;

                        if (POSI != "AGENT") {
                            document.getElementById("ZoneApiKey").style.display = "none";
                        }

                        $('#username').val(response.data.detail[i].username);
                        $('#nickname').val(response.data.detail[i].nickName);
                        $('#ApiKey').val(response.data.detail[i].id);
                        $('#phonenumber').val(response.data.detail[i].phone);
                        $('#credit').val(Comma(response.data.detail[i].credit));

                        $('#Mission_Reward').val(Comma(response.data.detail[i].rewardNewMemberMission));
                        $('#Mission_Turnover').val(Comma(response.data.detail[i].turnOverNewMemberMission));
                        $('#Mission_Max').val(Comma(response.data.detail[i].maxWithdrawNewMemberMission));
                        $('#Mission_Limit').val(Comma(response.data.detail[i].limitNewMemberMission));

                        var ourPT = response.data.detail[i].ourPT;
                        var setPT = response.data.detail[i].ourPT + response.data.detail[i].givenPT;
                        localStorage.setItem("PositionTracking", setPT);

                        var htmlPT = "<option value='' disabled selected>Choose Position Tracking</option>";
                        var PT = response.data.detail[i].givenPT;
                        for (var i = 0; i <= setPT; i++) {
                            htmlPT += "<option value=" + i + ">" + i + "%</option>";
                        }
                        document.getElementById('ddl_positiontracking').innerHTML = htmlPT;
                        document.getElementById('ddl_givenPT').innerHTML = htmlPT;
                        $("#ddl_positiontracking option[value='" + ourPT + "']").attr("selected", "selected");
                        $("#ddl_givenPT option[value='" + PT + "']").attr("selected", "selected");

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

                        if (LockFailed == false) {
                            LockFailed = "Unlock";
                        }
                        else {
                            LockFailed = "Lock";
                        }

                        if (Sus == "Yes") {
                            document.getElementById("chkSuspend").checked = true;
                        }

                        if (Lock == "Lock") {
                            document.getElementById("chkLock").checked = true;
                        }

                        document.getElementById("suspend").setAttribute("set-lan", "value:" + Sus + "Sus");
                        document.getElementById("txtSuspend").setAttribute("set-lan", "text:" + Sus + "Sus");
                        document.getElementById("lock").setAttribute("set-lan", "value:" + Lock + "");
                        document.getElementById("txtLock").setAttribute("set-lan", "text:" + Lock + "");
                        document.getElementById("lockFailed").setAttribute("set-lan", "value:" + LockFailed + "");
                    }
                }

                if (ARR.length > 0) {
                    for (var j = 0; j < ARR.length; j++) {
                        htmlData += "<tr>";
                        if (ARR[j].status == true) {
                            htmlData += "<td style='text-align: center;'><div class='custom-control custom-checkbox' style='margin-left: 0.5rem;'><input type='checkbox' class='custom-control-input' id='" + ARR[j].missionID + "' name='chkMission' value='" + ARR[j].missionID + "' checked><label class='custom-control-label' for='" + ARR[j].missionID + "'></label></div></td>";
                            Check = "YES";
                        }
                        else {
                            htmlData += "<td style='text-align: center;'><div class='custom-control custom-checkbox' style='margin-left: 0.5rem;'><input type='checkbox' class='custom-control-input' id='" + ARR[j].missionID + "' name='chkMission' value='" + ARR[j].missionID + "'><label class='custom-control-label' for='" + ARR[j].missionID + "'></label></div></td>";
                        }
                        htmlData += "<td>" + ARR[j].nameTH + "</td>";
                        htmlData += "<td>" + ARR[j].nameEN + "</td>";
                        htmlData += "</tr>";
                    }
                    $("#tbData2 > tbody").append(htmlData);
                }
                else {
                    htmlData += "<tr>";
                    htmlData += "<td colspan='3' class='aligncenter' set-lan='text:No data.'></td>";
                    htmlData += "</tr>";
                    $("#tbData2 > tbody").append(htmlData);
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

        const postAddCompany = async () => {
            var creditVal = $('#credit').val();
            var credit = creditVal.split(',').join("");

            var Mission_Turnover = $('#Mission_Turnover').val();
            var Mission_Reward = $('#Mission_Reward').val();
            var Mission_Max = $('#Mission_Max').val();
            var Mission_Limit = $('#Mission_Limit').val();

            if (Mission_Turnover == "" || Mission_Turnover == null) {
                Mission_Turnover = 0;
            } else {
                Mission_Turnover = Mission_Turnover.split(',').join("");
            }

            if (Mission_Reward == "" || Mission_Reward == null) {
                Mission_Reward = 0;
            } else {
                Mission_Reward = Mission_Reward.split(',').join("");
            }

            if (Mission_Max == "" || Mission_Max == null) {
                Mission_Max = 0;
            } else {
                Mission_Max = Mission_Max.split(',').join("");
            }
            if (Mission_Limit == "" || Mission_Limit == null) {
                Mission_Limit = 0;
            } else {
                Mission_Limit = Mission_Limit.split(',').join("");
            }

            var arrData = [];
            $('input[name="chkMission"]:checked').each(function () {
                arrData.push(this.value);
            });

            var parameterAddCom = {};
            if (Postion == "SH_HOLDER" || Postion == "AGENT") {
                parameterAddCom = {
                    username: $('#username').val(),
                    password: $('#password').val(),
                    nickName: $('#nickname').val(),
                    phone: $('#phonenumber').val(),
                    ourPT: parseInt($("select#ddl_positiontracking").val()),
                    givenPT: parseInt($("select#ddl_givenPT").val()),
                    credit: parseInt(credit),
                    listMissionID: arrData,
                    newMemberMissionAgent: {
                        turnOverNewMemberMission: parseInt(Mission_Turnover),
                        rewardNewMemberMission: parseInt(Mission_Reward),
                        maxWithdrawNewMemberMission: parseInt(Mission_Max),
                        limitNewMemberMission: parseInt(Mission_Limit)
                    }
                }
            }
            else {
                parameterAddCom = {
                    username: $('#username').val(),
                    password: $('#password').val(),
                    nickName: $('#nickname').val(),
                    phone: $('#phonenumber').val(),
                    ourPT: parseInt($("select#ddl_positiontracking").val()),
                    givenPT: parseInt($("select#ddl_givenPT").val()),
                    credit: parseInt(credit),
                    listMissionID: arrData
                }
            }
            const requestAwait = await fetchDataSite(`${apiURL}/v1/user/create`, 'POST', "include", parameterAddCom)
            const response = await requestAwait.json()

            if (response.messageCode == 0000 || response.messageCode == null) {
                if (Postion == "AMB") {
                    document.getElementById("lbAlertSuccess").setAttribute("set-lan", "text:Add company success");
                }
                else if (Postion == "COMPANY") {
                    document.getElementById("lbAlertSuccess").setAttribute("set-lan", "text:Add shareholder success");
                }
                else if (Postion == "SH_HOLDER" || Postion == "AGENT") {
                    document.getElementById("lbAlertSuccess").setAttribute("set-lan", "text:Add agent success");
                }

                SetLan(localStorage.getItem("Language"));
                $("#myModalLoad").modal('hide');
                $('#modalAlertSuccess').modal();
                setTimeout(function () {
                    window.location.href = "/Menu_MemberManagement/company_list.aspx?s=" + ValScroll;
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

        const postNewPass = async () => {
            const parameterCom = {
                username: $('#username').val(),
                newPassword: $('#password_new').val()
            }
            const requestAwait = await fetchDataSite(`${apiURL}/v1/user/update_password`, 'POST', "include", parameterCom)
            const response = await requestAwait.json()

            if (response.messageCode == 0000 || response.messageCode == null) {
                document.getElementById("lbAlertSuccess").setAttribute("set-lan", "text:Change new password success");
                SetLan(localStorage.getItem("Language"));
                $('#modalPassword').modal('hide');
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

        const postEditStatus = async (sus, lock) => {
            const parameterCom = {
                username: $('#username').val(),
                isLock: lock,
                isSuspend: sus
            }
            const requestAwait = await fetchDataSite(`${apiURL}/v1/user/update_status`, 'POST', "include", parameterCom)
            const response = await requestAwait.json()

            if (response.messageCode == 0000 || response.messageCode == null) {
                document.getElementById("lbAlertSuccess").setAttribute("set-lan", "text:Edit status suspend, lock success");
                SetLan(localStorage.getItem("Language"));
                $("#myModalLoad").modal('hide');
                $('#modalStatus').modal('hide');
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

        const postLockFailed = async () => {
            const parameterCom = {
                username: $('#username').val()
            }
            const requestAwait = await fetchDataSite(`${apiURL}/v1/user/unlock_for_login`, 'POST', "include", parameterCom)
            const response = await requestAwait.json()

            if (response.messageCode == 0000 || response.messageCode == null) {
                document.getElementById("lbAlertSuccess").setAttribute("set-lan", "text:Edit status success");
                SetLan(localStorage.getItem("Language"));
                $("#myModalLoad").modal('hide');
                $('#modalLockFailed').modal('hide');
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

        const postEditCompany = async () => {
            var Mission_Turnover = $('#Mission_Turnover').val();
            var Mission_Reward = $('#Mission_Reward').val();
            var Mission_Max = $('#Mission_Max').val();
            var Mission_Limit = $('#Mission_Limit').val();

            if (Mission_Turnover == "" || Mission_Turnover == null) {
                Mission_Turnover = 0;
            } else {
                Mission_Turnover = Mission_Turnover.split(',').join("");
            }

            if (Mission_Reward == "" || Mission_Reward == null) {
                Mission_Reward = 0;
            } else {
                Mission_Reward = Mission_Reward.split(',').join("");
            }

            if (Mission_Max == "" || Mission_Max == null) {
                Mission_Max = 0;
            } else {
                Mission_Max = Mission_Max.split(',').join("");
            }

            if (Mission_Limit == "" || Mission_Limit == null) {
                Mission_Limit = 0;
            } else {
                Mission_Limit = Mission_Limit.split(',').join("");
            }

            var parameterCom = {};
            if (Postion == "SH_HOLDER" || Postion == "AGENT") {
                parameterCom = {
                    username: $('#username').val(),
                    nickName: $('#nickname').val(),
                    phone: $('#phonenumber').val(),
                    ourPT: parseInt($("select#ddl_positiontracking").val()),
                    givenPT: parseInt($("select#ddl_givenPT").val()),
                    newMemberMissionAgent: {
                        turnOverNewMemberMission: parseInt(Mission_Turnover),
                        rewardNewMemberMission: parseInt(Mission_Reward),
                        maxWithdrawNewMemberMission: parseInt(Mission_Max),
                        limitNewMemberMission: parseInt(Mission_Limit)
                    }
                }
            }
            else {
                parameterCom = {
                    username: $('#username').val(),
                    nickName: $('#nickname').val(),
                    phone: $('#phonenumber').val(),
                    ourPT: parseInt($("select#ddl_positiontracking").val()),
                    givenPT: parseInt($("select#ddl_givenPT").val())
                }
            }
            const requestAwait = await fetchDataSite(`${apiURL}/v1/user/update`, 'POST', "include", parameterCom)
            const response = await requestAwait.json()

            if (response.messageCode == 0000 || response.messageCode == null) {
                postEditMission();
                //if (Postion == "AMB") {
                //    document.getElementById("lbAlertSuccess").setAttribute("set-lan", "text:Edit company success");
                //}
                //else if (Postion == "COMPANY") {
                //    document.getElementById("lbAlertSuccess").setAttribute("set-lan", "text:Edit shareholder success");
                //}
                //else if (Postion == "SH_HOLDER" || Postion == "AGENT") {
                //    document.getElementById("lbAlertSuccess").setAttribute("set-lan", "text:Edit agent success");
                //}
                //SetLan(localStorage.getItem("Language"));
                //$("#myModalLoad").modal('hide');
                //$('#modalAlertSuccess').modal();
                //setTimeout(function () {
                //    window.location.href = "/Menu_MemberManagement/company_list.aspx";
                //}, 1500);
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

        const postEditMission = async () => {
            var arrData = [];
            $('input[name="chkMission"]:checked').each(function () {
                arrData.push(this.value);
            });
            const parameter = {
                username: $('#username').val(),
                listMissionID: arrData
            }
            const requestAwait = await fetchDataSite(`${apiURL}/v1/user/mission/update_action`, 'POST', "include", parameter)
            const response = await requestAwait.json()
            if (response.messageCode == 0000 || response.messageCode == null) {
                if (Postion == "AMB") {
                    document.getElementById("lbAlertSuccess").setAttribute("set-lan", "text:Edit company success");
                }
                else if (Postion == "COMPANY") {
                    document.getElementById("lbAlertSuccess").setAttribute("set-lan", "text:Edit shareholder success");
                }
                else if (Postion == "SH_HOLDER" || Postion == "AGENT") {
                    document.getElementById("lbAlertSuccess").setAttribute("set-lan", "text:Edit agent success");
                }
                SetLan(localStorage.getItem("Language"));
                $("#myModalLoad").modal('hide');
                $('#modalAlertSuccess').modal();
                setTimeout(function () {
                    window.location.href = "/Menu_MemberManagement/company_list.aspx?s=" + ValScroll;
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

        const postMission = async () => {
            const parameter = {}
            const requestAwait = await fetchDataSite(`${apiURL}/v1/user/get_active_mission`, 'POST', "include", parameter)
            const response = await requestAwait.json()
            if (response.messageCode == 0000 || response.messageCode == null) {
                var htmlData = "";
                if (response.data.length > 0) {
                    for (var j = 0; j < response.data.length; j++) {
                        htmlData += "<tr>";
                        if (response.data[j].status == true) {
                            htmlData += "<td style='text-align: center;'><div class='custom-control custom-checkbox' style='margin-left: 0.5rem;'><input type='checkbox' class='custom-control-input' id='" + response.data[j].missionID + "' name='chkMission' value='" + response.data[j].missionID + "' checked><label class='custom-control-label' for='" + response.data[j].missionID + "'></label></div></td>";
                        }
                        else {
                            htmlData += "<td style='text-align: center;'><div class='custom-control custom-checkbox' style='margin-left: 0.5rem;'><input type='checkbox' class='custom-control-input' id='" + response.data[j].missionID + "' name='chkMission' value='" + response.data[j].missionID + "'><label class='custom-control-label' for='" + response.data[j].missionID + "'></label></div></td>";
                        }
                        htmlData += "<td>" + response.data[j].nameTH + "</td>";
                        htmlData += "<td>" + response.data[j].nameEN + "</td>";
                        htmlData += "</tr>";
                    }
                    $("#tbData2 > tbody").append(htmlData);
                }
                else {
                    htmlData += "<tr>";
                    htmlData += "<td colspan='3' class='aligncenter' set-lan='text:No data.'></td>";
                    htmlData += "</tr>";
                    $("#tbData2 > tbody").append(htmlData);
                }

                SetLan(localStorage.getItem("Language"));
                $("#myModalLoad").modal('hide');
            }
            else if (response.messageCode == 8004) {
                ``
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
