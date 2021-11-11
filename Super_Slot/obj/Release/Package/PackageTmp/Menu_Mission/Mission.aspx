<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Mission.aspx.cs" Inherits="Pretty_Gaming.Menu_Mission.Mission" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .modalScroll {
            overflow-y: auto !important;
        }
    </style>

    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="" set-lan="text:Mission"></a></li>
            <li class="breadcrumb-item active txtMem" set-lan="text:Mission Management"></li>
        </ol>
    </nav>
    <div class="row">
        <div class="col-md-8">
            <h1 set-lan="text:Mission Management"></h1>
        </div>
        <div class="col-md-4" style="text-align: right;">
            <button id="btnAddMission" type="button" class="btn btn-yellow font-weight-bold" onclick="newMission('Add Mission')" set-lan="html:Add Mission_"></button>
        </div>
    </div>
    <div class="btn-toolbar section-group" role="toolbar" style="padding-bottom: 0px !important;">
        <div class="row col-md-12">
            <div class="form-group row" style="padding-left: 1rem;">
                <label for="email" class="col-form-label" set-lan="text:Detail_"></label>
                <div style="padding-left: 1rem;">
                    <input type="text" class="form-control" id="searchDetail" onkeypress="Key_Enter(event)">
                </div>
            </div>
            <div class="form-group row" style="padding-left: 2rem;">
                <button class="btn btn-yellow font-weight-bold m-0 px-3 py-2 z-depth-0 waves-effect btnMenu" type="button" set-lan="text:Search" onclick="Search_Click()"></button>
            </div>
        </div>
    </div>
    <div class="table-wrapper" style="margin-top: 10px; margin-bottom: 10px;">
        <section style="float: right; margin-bottom: 0.5rem;">
            <div class="data-container"></div>
            <div id="pagination-demo2"></div>
        </section>
        <table class="table table-border" id="tbData">
            <thead class="rgba-green-slight">
                <tr>
                    <th style="width: 1%;" set-lan="text:No"></th>
                    <th style='width: 8%; text-align: left; padding-left: 5px;' set-lan='text:Information'></th>
                    <th style='width: 10%;' set-lan='text:Detail'></th>
                    <th style="width: 1%;" set-lan="text:Image"></th>
                    <th style="width: 6%;" set-lan="text:MissionTemplate"></th>
                    <th style="width: 3%;" set-lan="text:Status"></th>
                    <th style="width: 1%;" class="edit" set-lan="text:Action"></th>
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
                    <td class="edit"></td>
                </tr>
            </tfoot>
        </table>
    </div>

    <%--modal--%>
    <div class="modal fade modalScroll" id="modalAnnouncement" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-xl" role="document">
            <div class="modal-content">
                <div class="modal-header text-center">
                    <h4 class="modal-title w-100 font-weight-bold" id="txtHead"></h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body mx-3">
                    <div class="row">
                        <div class="form-group row" style="display: none;">
                            <label for="ID" class="col-3 col-form-label" style="text-align: right;">ID :</label>
                            <div class="col-9">
                                <input type="text" class="form-control" id="ID" autocomplete="off" />
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12">
                            <div class="form-group row" id="zoneStatus">
                                <label for="Status" class="col-3 col-form-label" style="text-align: right;" set-lan="text:Status_"></label>
                                <div class="col-3">
                                    <input type="text" id="status" class="form-control" autocomplete="off" disabled="disabled" set-lan="value:Active">
                                </div>
                                <div class="col-3">
                                    <button type="button" class="btn btn-yellow font-weight-bold waves-effect waves-light" onclick="editStatus();" set-lan="text:Edit Status">Edit Status</button>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="MissionTemplate" class="col-3 col-form-label" style="text-align: right;" set-lan="html:Mission Template Code-"></label>
                                <div class="col-9">
                                    <div class="select-outline">
                                        <select class="mdb-select" id="selMission">
                                            <option value="" set-lan="text:Select" disabled selected></option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div id="ZoneCode">
                        <div class="row">
                            <div class="col-6">
                                <div class="form-group row">
                                    <label for="MissionReward" class="col-6 col-form-label" style="text-align: right; padding-left: 0px;" set-lan="html:Mission Template Reward-"></label>
                                    <div class="col-6">
                                        <input type="text" id="MissionReward" class="form-control" autocomplete="off" onkeyup="javascript:this.value=Comma(this.value);" oninput="this.value=this.value.replace(/[^0-9]/g, '').replace(/(\..*)\./g, '$1');" maxlength="30" />
                                    </div>
                                </div>
                            </div>
                            <div class="col-6">
                                <div class="form-group row" id="zoneSpin" style="display: none;">
                                    <label for="MissionReward" class="col-6 col-form-label" style="text-align: right; padding-left: 0px;" set-lan="html:Mission Template Spin-"></label>
                                    <div class="col-6">
                                        <input type="text" id="MissionSpin" class="form-control" autocomplete="off" onkeyup="javascript:this.value=Comma(this.value);" oninput="this.value=this.value.replace(/[^0-9]/g, '').replace(/(\..*)\./g, '$1');" maxlength="30" />
                                    </div>
                                </div>
                                <div class="form-group row" id="zoneTurnover" style="display: none;">
                                    <label for="MissionReward" class="col-6 col-form-label" style="text-align: right; padding-left: 0px; padding-right: 0px;" set-lan="html:Mission Template Turnover-"></label>
                                    <div class="col-6">
                                        <input type="text" id="MissionTurnover" class="form-control" autocomplete="off" onkeyup="javascript:this.value=Comma(this.value);" oninput="this.value=this.value.replace(/[^0-9]/g, '').replace(/(\..*)\./g, '$1');" maxlength="30" />
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-12">
                                <div class="form-group row" style="display: none;">
                                    <label for="MissionTemplateName" class="col-3 col-form-label" style="text-align: right;" set-lan="text:Mission Template Name_"></label>
                                    <div class="col-9">
                                        <input type="text" class="form-control" id="MissionName" autocomplete="off" />
                                    </div>
                                </div>
                                <div class="form-group row" id="zoneGame">
                                    <label for="selGameList" class="col-3 col-form-label" style="text-align: right;" set-lan="html:Game List_"></label>
                                    <div class="col-4">
                                        <div class="select-outline">
                                            <select class="mdb-select" id="selProvider"></select>
                                        </div>
                                    </div>
                                    <div class="col-5" id="zone1">
                                        <div class="select-outline">
                                            <select class="mdb-select" id="selGameType"></select>
                                        </div>
                                    </div>
                                    <div class="col-3"></div>
                                    <div class="col-9" id="zone2" style="margin-top: 1rem;">
                                        <div class="select-outline">
                                            <select class="mdb-select" id="selGame" multiple></select>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="starttime" class="col-3 col-form-label" style="text-align: right;" set-lan="html:Start date_"></label>
                                    <div class="col-3">
                                        <input type="date" class="form-control" id="startdate" />
                                    </div>
                                    <div class="col-3">
                                        <input type="time" class="form-control" id="starttime" />
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="totime" class="col-3 col-form-label" style="text-align: right;" set-lan="html:To date_"></label>
                                    <div class="col-3">
                                        <input type="date" class="form-control" id="todate" />
                                    </div>
                                    <div class="col-3">
                                        <input type="time" class="form-control" id="totime" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <br />
                    <div class="row">
                        <div class="col-4">
                            <label class="col-12 col-form-label" style="text-align: left; margin-left: 2rem;" set-lan="text:Language Thai"></label>
                            <div class="form-group row">
                                <label for="username" class="col-5 col-form-label" style="text-align: right; padding-left: 0px; padding-right: 0px;" set-lan="html:ImageTH-"></label>
                                <div class="col-7">
                                    <input id="default_file" type="file" name="myFiles" class="form-control" onchange="CheckExt(this)" />
                                    <img id="blah" src="../img/noImage.jpg" style="width: 205px; margin-top: .5rem; height: 184px;" />
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="ActivityName" class="col-5 col-form-label" style="text-align: right; padding-left: 0px; padding-right: 0px;" set-lan="text:Activity Name TH_"></label>
                                <div class="col-7">
                                    <input type="text" class="form-control" id="ActivityNameTH" autocomplete="off" />
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="Preliminary" class="col-5 col-form-label" style="text-align: right; padding-left: 0px; padding-right: 0px;" set-lan="text:Preliminary detailsTH_"></label>
                                <div class="col-7">
                                    <input type="text" class="form-control" id="PreliminaryTH" autocomplete="off" />
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="ActivityDescription" class="col-5 col-form-label" style="text-align: right; padding-left: 0px; padding-right: 0px;" set-lan="text:Activity Description TH_"></label>
                                <div class="col-7">
                                    <textarea id="ActivityDescriptionTH" rows="5" class="form-control" autocomplete="off"></textarea>
                                </div>
                            </div>
                        </div>
                        <div class="col-4">
                            <label class="col-12 col-form-label" style="text-align: left; margin-left: 2rem;" set-lan="text:Language English"></label>
                            <div class="form-group row">
                                <label for="username" class="col-5 col-form-label" style="text-align: right; padding-left: 0px; padding-right: 0px;" set-lan="html:ImageEN-"></label>
                                <div class="col-7">
                                    <input id="default_file2" type="file" name="myFiles" class="form-control" onchange="CheckExt(this)" />
                                    <img id="blah2" src="../img/noImage.jpg" style="width: 205px; margin-top: .5rem; height: 184px;" />
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="ActivityName" class="col-5 col-form-label" style="text-align: right; padding-left: 0px; padding-right: 0px;" set-lan="text:Activity Name EN_"></label>
                                <div class="col-7">
                                    <input type="text" class="form-control" id="ActivityNameEN" autocomplete="off" />
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="Preliminary" class="col-5 col-form-label" style="text-align: right; padding-left: 0px; padding-right: 0px;" set-lan="text:Preliminary detailsEN_"></label>
                                <div class="col-7">
                                    <input type="text" class="form-control" id="PreliminaryEN" autocomplete="off" />
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="ActivityDescription" class="col-5 col-form-label" style="text-align: right; padding-left: 0px; padding-right: 0px;" set-lan="text:Activity Description EN_"></label>
                                <div class="col-7">
                                    <textarea id="ActivityDescriptionEN" rows="5" class="form-control" autocomplete="off"></textarea>
                                </div>
                            </div>
                        </div>
                        <div class="col-4">
                            <label class="col-12 col-form-label" style="text-align: left; margin-left: 2rem;" set-lan="text:Language Chinese"></label>
                            <div class="form-group row">
                                <label for="username" class="col-5 col-form-label" style="text-align: right; padding-left: 0px; padding-right: 0px;" set-lan="html:ImageCH-"></label>
                                <div class="col-7">
                                    <input id="default_fileCH" type="file" name="myFiles" class="form-control" onchange="CheckExt(this)" />
                                    <img id="blahCH" src="../img/noImage.jpg" style="width: 205px; margin-top: .5rem; height: 184px;" />
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="ActivityName" class="col-5 col-form-label" style="text-align: right; padding-left: 0px; padding-right: 0px;" set-lan="text:Activity Name CH_"></label>
                                <div class="col-7">
                                    <input type="text" class="form-control" id="ActivityNameCH" autocomplete="off" />
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="Preliminary" class="col-5 col-form-label" style="text-align: right; padding-left: 0px; padding-right: 0px;" set-lan="text:Preliminary detailsCH_"></label>
                                <div class="col-7">
                                    <input type="text" class="form-control" id="PreliminaryCH" autocomplete="off" />
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="ActivityDescription" class="col-5 col-form-label" style="text-align: right; padding-left: 0px; padding-right: 0px;" set-lan="text:Activity Description CH_"></label>
                                <div class="col-7">
                                    <textarea id="ActivityDescriptionCH" rows="5" class="form-control" autocomplete="off"></textarea>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer d-flex justify-content-center">
                    <button class="btn btn-yellow font-weight-bold" type="button" id="Add" onclick="btnAdd();" set-lan="text:Add Mission"></button>
                    <button class="btn btn-yellow font-weight-bold" type="button" id="Save" onclick="btnSave();" set-lan="text:Save"></button>
                    <button type="button" class="btn btn-yellow font-weight-bold" data-dismiss="modal" aria-label="Close" set-lan="text:Cancel"></button>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="modalDelete" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content" style="width: 70% !important;">
                <div class="modal-header text-center">
                    <h4 class="modal-title w-100 font-weight-bold" set-lan="text:Delete mission"></h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body mx-3">
                    <div class="form-group row">
                        <label for="ID" class="col-12 col-form-label" style="text-align: center;" set-lan="text:Confirm delete this item ?"></label>
                    </div>
                </div>
                <div class="modal-footer d-flex justify-content-center">
                    <button class="btn btn-yellow font-weight-bold" type="button" onclick="postDelete();" set-lan="text:Delete"></button>
                    <button type="button" class="btn btn-yellow font-weight-bold" data-dismiss="modal" aria-label="Close" set-lan="text:Cancel"></button>
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
                        <label for="email" class="col-4 col-form-label alignright" set-lan="text:Status_"></label>
                        <div class="switch col-8">
                            <label style="margin-top: 10px;">
                                <input type="checkbox" id="chkSuspend" onclick="chgSuspend(this)">
                                <span class="lever ml-0"></span>
                                <span class="blue-text text-13" id="txtSuspend"></span>
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
    <script>
        var Status_Mission = localStorage.getItem("Status_Mission");
        var formdata = new FormData();
        var formdata2 = new FormData();
        var formdataCH = new FormData();
        var ID_DEL = "";
        var ValScroll = 0;
        var Check_Enter = "";

        $(document).ready(function () {
            $("#menuMission , #menuMission > a").addClass("active");
            $("#menuMission > div").css("display", "block");

            document.getElementById("zone1").style.display = "none";
            document.getElementById("zone2").style.display = "none";

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

            $('#default_file').change(function () {
                readURL(this);
                if ($(this).prop('files').length > 0) {
                    file = $(this).prop('files')[0];
                    formdata.append("file", file);
                }
            });

            $('#default_file2').change(function () {
                readURL2(this);
                if ($(this).prop('files').length > 0) {
                    file = $(this).prop('files')[0];
                    formdata2.append("file", file);
                }
            });

            $('#default_fileCH').change(function () {
                readURLCH(this);
                if ($(this).prop('files').length > 0) {
                    file = $(this).prop('files')[0];
                    formdataCH.append("file", file);
                }
            });

            $("#selProvider").change(function () {
                $("#selGameType").empty();
                document.getElementById("zone2").style.display = "none";
                getGameType();
            });

            $("#selGameType").change(function () {
                $("#selGame").empty();
                getGame("");
            });

            $("#selMission").change(function () {
                $('#MissionSpin').val("");
                $('#MissionTurnover').val("");
                $("#selGame").empty();
                $('#selProvider option').removeAttr('selected');
                $("#selProvider option[value='']").attr("selected", "selected");
                $('#selGame option').removeAttr('selected');
                $("#selGame option[value='']").attr("selected", "selected");

                var Code = $('#selMission').val();
                if (Code == "MT01") {
                    document.getElementById("ZoneCode").style.display = "block";
                    document.getElementById("zoneSpin").style.display = "none";
                    document.getElementById("zoneTurnover").style.display = "none";
                } else if (Code == "MT02") {
                    document.getElementById("ZoneCode").style.display = "block";
                    document.getElementById("zoneSpin").style.display = "flex";
                    document.getElementById("zoneTurnover").style.display = "none";
                } else if (Code == "MT03") {
                    document.getElementById("ZoneCode").style.display = "block";
                    document.getElementById("zoneSpin").style.display = "none";
                    document.getElementById("zoneTurnover").style.display = "flex";
                } else if (Code == "MT91" || Code == "MT90" || Code == "MT99") {
                    document.getElementById("ZoneCode").style.display = "none";
                }
                document.getElementById("zone1").style.display = "none";
                document.getElementById("zone2").style.display = "none";
            });

            if (Status_Mission == "VIEW") {
                document.getElementById("btnAddMission").style.display = "none";
            }

            DateNow();
            getMissionTem();
            getProvider();
            GetData();

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
            console.log(ValScroll);
        }

        function SetScroll() {
            var scroll = getUrlParameter('s');
            if (scroll != "" || scroll != null) {
                document.documentElement.scrollTop = document.body.scrollTop = scroll;
            }
        }

        function DateNow() {
            var date = new Date();
            var dateSet = date.getFullYear() + "-" + ("0" + (date.getMonth() + 1)).slice(-2) + "-" + ("0" + date.getDate()).slice(-2);
            $("#startdate").val(dateSet);
            $("#todate").val(dateSet);
            $("#starttime").val('00:00');
            $("#totime").val('23:59');
        }

        function newMission(type) {
            document.getElementById("Add").style.display = "block";
            document.getElementById("Save").style.display = "none";
            document.getElementById("zoneStatus").style.display = "none";
            document.getElementById("zoneGame").style.display = "flex";
            document.getElementById("zone1").style.display = "none";
            document.getElementById("zone2").style.display = "none";
            document.getElementById("ZoneCode").style.display = "block";
            document.getElementById("zoneSpin").style.display = "none";
            document.getElementById("zoneTurnover").style.display = "none";
            document.getElementById("txtHead").setAttribute("set-lan", "text:" + type);
            DateNow();

            $("#selMission").removeAttr("disabled");
            $('#selMission option').removeAttr('selected');
            $("#selMission option[value='']").attr("selected", "selected");
            $('#selProvider option').removeAttr('selected');
            $("#selProvider option[value='']").attr("selected", "selected");
            $('#selGameType option').removeAttr('selected');
            $("#selGameType option[value='']").attr("selected", "selected");
            $('#selGame option').removeAttr('selected');
            $("#selGame option[value='']").attr("selected", "selected");
            $('#MissionReward').val("");
            $('#MissionSpin').val("");
            $('#MissionTurnover').val("");
            $('#MissionName').val("");
            $('#ActivityNameTH').val("");
            $('#ActivityNameEN').val("");
            $('#ActivityNameCH').val("");
            $('#ActivityDescriptionTH').val("");
            $('#ActivityDescriptionEN').val("");
            $('#ActivityDescriptionCH').val("");
            $('#PreliminaryTH').val("");
            $('#PreliminaryEN').val("");
            $('#PreliminaryCH').val("");
            $('#default_file').val("");
            $('#blah').attr('src', '../img/noImage.jpg');
            $('#default_file2').val("");
            $('#blah2').attr('src', '../img/noImage.jpg');
            $('#default_fileCH').val("");
            $('#blahCH').attr('src', '../img/noImage.jpg');
            SetLan(localStorage.getItem("Language"));
            $("#modalAnnouncement").modal();
        }

        function readURL(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();

                reader.onload = function (e) {
                    $('#blah').attr('src', e.target.result);
                }
                reader.readAsDataURL(input.files[0]);
            }
        }

        function readURL2(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();

                reader.onload = function (e) {
                    $('#blah2').attr('src', e.target.result);
                }
                reader.readAsDataURL(input.files[0]);
            }
        }

        function readURLCH(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();

                reader.onload = function (e) {
                    $('#blahCH').attr('src', e.target.result);
                }
                reader.readAsDataURL(input.files[0]);
            }
        }

        function ImgError(source) {
            source.src = "../img/noImage.jpg";
            source.onerror = "";
            return true;
        }

        function btnDel(ID) {
            ID_DEL = ID;
            $("#modalDelete").modal();
        }

        function btnAdd() {
            var Mission = $('#selMission').val();
            var Reward = $('#MissionReward').val();
            var Spin = $('#MissionSpin').val();
            var Turnover = $('#MissionTurnover').val();

            var urlImg1 = "";
            var urlImg2 = "";
            var urlImgCH = "";

            var startD = $("#startdate").val();
            var startT = $("#starttime").val();
            var endD = $("#todate").val();
            var endT = $("#totime").val();
            startD = startD + "T" + startT;
            endD = endD + "T" + endT;
            var fromdate = new Date(startD); //Year, Month, Date
            var todate = new Date(endD); //Year, Month, Date

            if (todate < fromdate) {
                document.getElementById("lbAlert").setAttribute("set-lan", "text:missing 'Start-To Date' field");
                SetLan(localStorage.getItem("Language"));
                $('#modalAlert').modal('show');
                $("#myModalLoad").modal('hide');
            }
            else if (Mission == "" || Mission == null) {
                document.getElementById("lbAlert").setAttribute("set-lan", "text:missing 'Mission Template Code' field");
                SetLan(localStorage.getItem("Language"));
                $('#modalAlert').modal('show');
                $("#myModalLoad").modal('hide');
            }
            else if (Mission == "MT01" && Reward == "") {
                document.getElementById("lbAlert").setAttribute("set-lan", "text:missing 'Mission Template Reward' field");
                SetLan(localStorage.getItem("Language"));
                $('#modalAlert').modal('show');
                $("#myModalLoad").modal('hide');
            }
            else if (Mission == "MT02" && Reward == "") {
                document.getElementById("lbAlert").setAttribute("set-lan", "text:missing 'Mission Template Reward' field");
                SetLan(localStorage.getItem("Language"));
                $('#modalAlert').modal('show');
                $("#myModalLoad").modal('hide');
            }
            else if (Mission == "MT03" && Reward == "") {
                document.getElementById("lbAlert").setAttribute("set-lan", "text:missing 'Mission Template Reward' field");
                SetLan(localStorage.getItem("Language"));
                $('#modalAlert').modal('show');
                $("#myModalLoad").modal('hide');
            }
            else if (Mission == "MT02" && Spin == "") {
                document.getElementById("lbAlert").setAttribute("set-lan", "text:missing 'Mission Template Spin' field");
                SetLan(localStorage.getItem("Language"));
                $('#modalAlert').modal('show');
                $("#myModalLoad").modal('hide');
            }
            else if (Mission == "MT03" && Turnover == "") {
                document.getElementById("lbAlert").setAttribute("set-lan", "text:missing 'Mission Template Turnover' field");
                SetLan(localStorage.getItem("Language"));
                $('#modalAlert').modal('show');
                $("#myModalLoad").modal('hide');
            }
            else if ($('#default_file').val() == "" || $('#default_file2').val() == "" || $('#default_fileCH').val() == "") {
                document.getElementById("lbAlert").setAttribute("set-lan", "text:missing 'Image' field");
                SetLan(localStorage.getItem("Language"));
                $('#modalAlert').modal('show');
                $("#myModalLoad").modal('hide');
            }
            else {
                urlImg1 = postFile(formdata).then(function (result) {
                    urlImg1 = result;

                    urlImg2 = postFile(formdata2).then(function (result) {
                        urlImg2 = result;

                        urlImgCH = postFile(formdataCH).then(function (result) {
                            urlImgCH = result;

                            postAddMission(urlImg1, urlImg2, urlImgCH);
                        });

                    });
                });
            }
        }

        function btnSave() {
            var Mission = $('#selMission').val();
            var Reward = $('#MissionReward').val();
            var Spin = $('#MissionSpin').val();
            var Turnover = $('#MissionTurnover').val();

            var urlImg1 = "";
            var urlImg2 = "";
            var urlImgCH = "";

            var srcTH = document.getElementById("blah").src.split("/").pop();
            var srcEN = document.getElementById("blah2").src.split("/").pop();
            var srcCH = document.getElementById("blahCH").src.split("/").pop();

            var startD = $("#startdate").val();
            var startT = $("#starttime").val();
            var endD = $("#todate").val();
            var endT = $("#totime").val();
            startD = startD + "T" + startT;
            endD = endD + "T" + endT;
            var fromdate = new Date(startD); //Year, Month, Date
            var todate = new Date(endD); //Year, Month, Date  

            var Mission2 = "";
            if (Mission == null) {
                Mission2 = $('#selMission option[disabled]:selected').val();
                if (Mission2 == "MT90" || Mission2 == "MT91" || Mission == "MT99") {
                    Mission = Mission2;
                }
            }

            if (todate < fromdate) {
                document.getElementById("lbAlert").setAttribute("set-lan", "text:missing 'Start-To Date' field");
                SetLan(localStorage.getItem("Language"));
                $('#modalAlert').modal('show');
                $("#myModalLoad").modal('hide');
            }
            else if (Mission == "" || Mission == null) {
                document.getElementById("lbAlert").setAttribute("set-lan", "text:missing 'Mission Template Code' field");
                SetLan(localStorage.getItem("Language"));
                $('#modalAlert').modal('show');
                $("#myModalLoad").modal('hide');
            }
            else if (Reward == "") {
                document.getElementById("lbAlert").setAttribute("set-lan", "text:missing 'Mission Template Reward' field");
                SetLan(localStorage.getItem("Language"));
                $('#modalAlert').modal('show');
                $("#myModalLoad").modal('hide');
            }
            else if (Mission == "MT01" && Reward == "") {
                document.getElementById("lbAlert").setAttribute("set-lan", "text:missing 'Mission Template Reward' field");
                SetLan(localStorage.getItem("Language"));
                $('#modalAlert').modal('show');
                $("#myModalLoad").modal('hide');
            }
            else if (Mission == "MT02" && Reward == "") {
                document.getElementById("lbAlert").setAttribute("set-lan", "text:missing 'Mission Template Reward' field");
                SetLan(localStorage.getItem("Language"));
                $('#modalAlert').modal('show');
                $("#myModalLoad").modal('hide');
            }
            else if (Mission == "MT03" && Reward == "") {
                document.getElementById("lbAlert").setAttribute("set-lan", "text:missing 'Mission Template Reward' field");
                SetLan(localStorage.getItem("Language"));
                $('#modalAlert').modal('show');
                $("#myModalLoad").modal('hide');
            }
            else if (Mission == "MT02" && Spin == "") {
                document.getElementById("lbAlert").setAttribute("set-lan", "text:missing 'Mission Template Spin' field");
                SetLan(localStorage.getItem("Language"));
                $('#modalAlert').modal('show');
                $("#myModalLoad").modal('hide');
            }
            else if (Mission == "MT03" && Turnover == "") {
                document.getElementById("lbAlert").setAttribute("set-lan", "text:missing 'Mission Template Turnover' field");
                SetLan(localStorage.getItem("Language"));
                $('#modalAlert').modal('show');
                $("#myModalLoad").modal('hide');
            }
            else if (srcTH == "noImage.jpg" || srcEN == "noImage.jpg" || srcCH == "noImage.jpg") {
                document.getElementById("lbAlert").setAttribute("set-lan", "text:missing 'Image' field");
                SetLan(localStorage.getItem("Language"));
                $('#modalAlert').modal('show');
                $("#myModalLoad").modal('hide');
            }
            else if ($('#default_file').val() == "" && $('#default_file2').val() == "" && $('#default_fileCH').val() == "") {
                urlImg1 = document.getElementById("blah").src;
                urlImg2 = document.getElementById("blah2").src;
                urlImgCH = document.getElementById("blahCH").src;
                postSaveMission(urlImg1, urlImg2, urlImgCH);
            }
            else if ($('#default_file').val() != "" && $('#default_file2').val() != "" && $('#default_fileCH').val() != "") {
                urlImg1 = postFile(formdata).then(function (result) {
                    urlImg1 = result;

                    urlImg2 = postFile(formdata2).then(function (result) {
                        urlImg2 = result;

                        urlImgCH = postFile(formdataCH).then(function (result) {
                            urlImgCH = result;

                            postSaveMission(urlImg1, urlImg2, urlImgCH);
                        });
                    });
                });
            }
            else if ($('#default_file').val() != "") {
                urlImg1 = postFile(formdata).then(function (result) {
                    urlImg1 = result;

                    if ($('#default_file2').val() != "") {
                        urlImg2 = postFile(formdata2).then(function (result) {
                            urlImg2 = result;

                            if ($('#default_fileCH').val() != "") {
                                urlImgCH = postFile(formdataCH).then(function (result) {
                                    urlImgCH = result;

                                    postSaveMission(urlImg1, urlImg2, urlImgCH);
                                });
                            }
                            else {
                                urlImgCH = document.getElementById("blahCH").src;
                                postSaveMission(urlImg1, urlImg2, urlImgCH);
                            }
                        });
                    }
                    else {
                        urlImg2 = document.getElementById("blah2").src;

                        if ($('#default_fileCH').val() != "") {
                            urlImgCH = postFile(formdataCH).then(function (result) {
                                urlImgCH = result;

                                postSaveMission(urlImg1, urlImg2, urlImgCH);
                            });
                        }
                        else {
                            urlImgCH = document.getElementById("blahCH").src;
                            postSaveMission(urlImg1, urlImg2, urlImgCH);
                        }
                    }
                });
            }
            else if ($('#default_file2').val() != "") {
                urlImg2 = postFile(formdata2).then(function (result) {
                    urlImg2 = result;

                    if ($('#default_file').val() != "") {
                        urlImg1 = postFile(formdata).then(function (result) {
                            urlImg1 = result;

                            if ($('#default_fileCH').val() != "") {
                                urlImgCH = postFile(formdataCH).then(function (result) {
                                    urlImgCH = result;

                                    postSaveMission(urlImg1, urlImg2, urlImgCH);
                                });
                            }
                            else {
                                urlImgCH = document.getElementById("blahCH").src;
                                postSaveMission(urlImg1, urlImg2, urlImgCH);
                            }
                        });
                    }
                    else {
                        urlImg1 = document.getElementById("blah").src;

                        if ($('#default_fileCH').val() != "") {
                            urlImgCH = postFile(formdataCH).then(function (result) {
                                urlImgCH = result;

                                postSaveMission(urlImg1, urlImg2, urlImgCH);
                            });
                        }
                        else {
                            urlImgCH = document.getElementById("blahCH").src;
                            postSaveMission(urlImg1, urlImg2, urlImgCH);
                        }
                    }
                });
            }
            else if ($('#default_fileCH').val() != "") {
                urlImgCH = postFile(formdataCH).then(function (result) {
                    urlImgCH = result;

                    if ($('#default_file').val() != "") {
                        urlImg1 = postFile(formdata).then(function (result) {
                            urlImg1 = result;

                            if ($('#default_file2').val() != "") {
                                urlImg2 = postFile(formdata2).then(function (result) {
                                    urlImg2 = result;
                                    postSaveMission(urlImg1, urlImg2, urlImgCH);
                                });
                            }
                            else {
                                urlImg2 = document.getElementById("blah2").src;
                                postSaveMission(urlImg1, urlImg2, urlImgCH);
                            }
                        });
                    }
                    else {
                        urlImg1 = document.getElementById("blah").src;
                        if ($('#default_file2').val() != "") {
                            urlImg2 = postFile(formdata2).then(function (result) {
                                urlImg2 = result;
                                postSaveMission(urlImg1, urlImg2, urlImgCH);

                            });
                        }
                        else {
                            urlImg2 = document.getElementById("blah2").src;
                            postSaveMission(urlImg1, urlImg2, urlImgCH);
                        }
                    }
                });
            }
        }

        function btnEdit(ID, details, game, start, end, TemName, code, status, reward, spin, turnover) {
            GetScroll();
            document.getElementById("Add").style.display = "none";
            document.getElementById("Save").style.display = "block";
            document.getElementById("zoneStatus").style.display = "flex";
            $("#selMission").removeAttr("disabled");

            if (code == "MT01") {
                document.getElementById("zoneSpin").style.display = "none";
                document.getElementById("zoneTurnover").style.display = "none";
            } else if (code == "MT02") {
                document.getElementById("zoneSpin").style.display = "flex";
                document.getElementById("zoneTurnover").style.display = "none";
            } else if (code == "MT03") {
                document.getElementById("zoneSpin").style.display = "none";
                document.getElementById("zoneTurnover").style.display = "flex";
            } else if (code == "MT91" || code == "MT90" || code == "MT99") {
                document.getElementById("ZoneCode").style.display = "none";
                $("#selMission").attr("disabled", "disabled");
            }

            document.getElementById("txtHead").setAttribute("set-lan", "text:Edit Mission");
            $('#ID').val(ID);
            $('#selMission option').removeAttr('selected');
            $("#selMission option[value='" + code + "']").attr("selected", "selected");
            $('#MissionReward').val(reward);
            $('#MissionSpin').val(spin);
            $('#MissionTurnover').val(turnover);
            $('#MissionName').val(TemName);
            $("#startdate").val(start.split('T')[0]);
            $("#starttime").val(start.split('T')[1].slice(0, 5));
            $("#todate").val(end.split('T')[0]);
            $("#totime").val(end.split('T')[1].slice(0, 5));
            document.getElementById("status").setAttribute("set-lan", "value:" + status + "");
            document.getElementById("txtSuspend").setAttribute("set-lan", "text:" + status + "");

            var DetailArr = details.split(',');
            for (var i = 0; i < DetailArr.length; i++) {
                if (DetailArr[i].split('|')[0] == "th") {
                    $('#default_file').val("");
                    $('#blah').attr('src', DetailArr[i].split('|')[3]);
                    $('#ActivityNameTH').val(DetailArr[i].split('|')[1]);
                    $('#ActivityDescriptionTH').val(DetailArr[i].split('|')[2]);
                    $('#PreliminaryTH').val(DetailArr[i].split('|')[4]);

                } else if (DetailArr[i].split('|')[0] == "en") {
                    $('#default_file2').val("");
                    $('#blah2').attr('src', DetailArr[i].split('|')[3]);
                    $('#ActivityNameEN').val(DetailArr[i].split('|')[1]);
                    $('#ActivityDescriptionEN').val(DetailArr[i].split('|')[2]);
                    $('#PreliminaryEN').val(DetailArr[i].split('|')[4]);

                } else if (DetailArr[i].split('|')[0] == "ch") {
                    $('#default_fileCH').val("");
                    $('#blahCH').attr('src', DetailArr[i].split('|')[3]);
                    $('#ActivityNameCH').val(DetailArr[i].split('|')[1]);
                    $('#ActivityDescriptionCH').val(DetailArr[i].split('|')[2]);
                    $('#PreliminaryCH').val(DetailArr[i].split('|')[4]);
                }
            }

            if (game == "" || game == null) {
                document.getElementById("zone1").style.display = "none";
                document.getElementById("zone2").style.display = "none";
            }
            else {
                var GameArr = game.split(',');
                var GamePro, GameType;
                var G = [];
                for (var i = 0; i < GameArr.length; i++) {
                    GamePro = GameArr[i].split('|')[0];
                    GameType = GameArr[i].split('|')[1];
                    G.push(GameArr[i].split('|')[3]);
                }

                $('#selProvider option').removeAttr('selected');
                $("#selProvider option[value='" + GamePro + "']").attr("selected", "selected");

                getGameType(GameType, G);
            }

            SetLan(localStorage.getItem("Language"));
            $("#modalAnnouncement").modal();
        }

        function Search_Click() {
            NumPage = 0;
            GetData();
        }

        function chgSuspend(ele) {
            if (ele.checked) {
                document.getElementById("txtSuspend").setAttribute("set-lan", "text:Active");
                SetLan(localStorage.getItem("Language"));
            } else {
                document.getElementById("txtSuspend").setAttribute("set-lan", "text:Inactive");
                SetLan(localStorage.getItem("Language"));
            }
        }

        function editStatus() {
            var Sus = $('#status').val();
            if (Sus == "Active" || Sus == "ใช้งาน") {
                document.getElementById("chkSuspend").checked = true;
            } else {
                document.getElementById("chkSuspend").checked = false;
            }

            $('#modalStatus').modal('show');
        }

        function saveEditStatus() {
            $("#myModalLoad").modal();
            var statussuspend = false;

            if (document.getElementById('chkSuspend').checked) {
                statussuspend = true;
            } else {
                statussuspend = false;
            }

            postEditStatus(statussuspend);
        }

        function NewLine(str, maxLength) {
            var buff = "";
            var numOfLines = Math.floor(str.length / maxLength);
            for (var i = 0; i < numOfLines + 1; i++) {
                buff += str.substr(i * maxLength, maxLength); if (i !== numOfLines) { buff += "\n"; }
            }
            return buff;
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
                        dataSource: 'https://api.flickr.com/services/feeds/photos_public.gne?tags=cat&tagmode=any&format=json&jsoncallback=?',
                        locator: 'items',
                        callback: function (response, pagination) {
                            num = container.pagination('getSelectedPageNum');
                            if (NumPage != 0) {
                                postMission(num);
                            }
                            NumPage = num;
                        }
                    });
                })('demo2');
            });
        }

        var validFiles = ["bmp", "gif", "png", "jpg", "jpeg", "pic", "psd", "tif", "eps"];
        function CheckExt(obj) {
            var source = obj.value;
            var ext = source.substring(source.lastIndexOf(".") + 1, source.length).toLowerCase();
            for (var i = 0; i < validFiles.length; i++) {
                if (validFiles[i] == ext)
                    break;
            }
            if (i >= validFiles.length) {
                if (obj.id == "default_file") {
                    $('#default_file').val("");
                    $('#blah').attr('src', '../img/noImage.jpg');
                } else if (obj.id == "default_file2") {
                    $('#default_file2').val("");
                    $('#blah2').attr('src', '../img/noImage.jpg');
                } else if (obj.id == "default_fileCH") {
                    $('#default_fileCH').val("");
                    $('#blahCH').attr('src', '../img/noImage.jpg');
                }

                document.getElementById("lbAlert").setAttribute("set-lan", "html:missing 'image file' field");
                SetLan(localStorage.getItem("Language"));
                $('#modalAlert').modal('show');
                $("#myModalLoad").modal('hide');
            }
        }

        const postData = async (num) => {
            if (num == 0) {
                num = num + 1;
            }

            const parameter = {
                detail: $("#searchDetail").val(),
                page: num,
                size: 100
            }

            const requestAwait = await fetchDataSite(`${apiURL}/v1/mission/inquiry`, 'POST', "include", parameter)
            const response = await requestAwait.json()
            if (response.messageCode == 0000 || response.messageCode == null) {
                //NumPage = num;
                TotalData = response.total;
                GetNumPage(num);

                if (NumPage == 0) {
                    var Lan = localStorage.getItem("Language");
                    $("#tbData > tbody").html("");
                    var htmlData = "";
                    if (response.total != 0) {
                        var no = 1;
                        for (var i = 0; i < response.data.length; i++) {
                            var date = new Date(response.data[i].activityStartTime);
                            var txtStartDate;
                            if (response.data[i].activityStartTime == "" || response.data[i].activityStartTime == null) {
                                txtStartDate = "-";
                            }
                            else {
                                txtStartDate = ("0" + date.getDate()).slice(-2) + "/" + ("0" + (date.getMonth() + 1)).slice(-2) + "/" + date.getFullYear() + " " + ("0" + date.getHours()).slice(-2) + ":" + ("0" + date.getMinutes()).slice(-2) + ":" + ("0" + date.getSeconds()).slice(-2);
                            }

                            var date2 = new Date(response.data[i].activityEndTime);
                            var txtEndDate;
                            if (response.data[i].activityEndTime == "" || response.data[i].activityEndTime == null) {
                                txtEndDate = "-";
                            }
                            else {
                                txtEndDate = ("0" + date2.getDate()).slice(-2) + "/" + ("0" + (date2.getMonth() + 1)).slice(-2) + "/" + date2.getFullYear() + " " + ("0" + date2.getHours()).slice(-2) + ":" + ("0" + date2.getMinutes()).slice(-2) + ":" + ("0" + date2.getSeconds()).slice(-2);
                            }

                            htmlData += "<tr>";
                            htmlData += "<td style='width: 1%;' class='aligncenter'>" + (((num - 1) * 20) + no) + "</td>";
                            htmlData += "<td style='width: 8%;'><b set-lan='text:Start time_'></b>" + txtStartDate + "<br /><b set-lan='text:End time_'></b>" + txtEndDate + "</td>";

                            var Detail = [];
                            for (var j = 0; j < response.data[i].details.length; j++) {
                                Detail.push(response.data[i].details[j].language + "|" + response.data[i].details[j].activityName + "|" + response.data[i].details[j].activityDescription + "|" + response.data[i].details[j].image + "|" + response.data[i].details[j].shortDescription);
                                if (Lan == "Thai") {
                                    if (j == 0) {
                                        var nLine = NewLine(response.data[i].details[j].activityDescription, 80);

                                        htmlData += "<td style='width: 10%;'><b set-lan='text:Name'></b> :" + response.data[i].details[j].activityName + "<br /><b set-lan='text:Description'></b> :" + nLine + "</td>";
                                        htmlData += "<td style='width: 1%; text-align: center;'><img src='" + response.data[i].details[j].image + "' style='height: 100px;'></td>";
                                    }
                                }
                                else if (Lan == "English") {
                                    if (j == 1) {
                                        var nLine = NewLine(response.data[i].details[j].activityDescription, 80);

                                        htmlData += "<td style='width: 10%;'><b set-lan='text:Name'></b> :" + response.data[i].details[j].activityName + "<br /><b set-lan='text:Description'></b> :" + nLine + "</td>";
                                        htmlData += "<td style='width: 1%; text-align: center;'><img src='" + response.data[i].details[j].image + "' style='height: 100px;'></td>";
                                    }
                                }
                                else if (Lan == "Chinese") {
                                    if (response.data[i].details.length == 3) {
                                        if (j == 2) {
                                            var nLine = NewLine(response.data[i].details[j].activityDescription, 80);

                                            htmlData += "<td style='width: 10%;'><b set-lan='text:Name'></b> :" + response.data[i].details[j].activityName + "<br /><b set-lan='text:Description'></b> :" + nLine + "</td>";
                                            htmlData += "<td style='width: 1%; text-align: center;'><img src='" + response.data[i].details[j].image + "' style='height: 100px;'></td>";
                                        }
                                    }
                                    else {
                                        if (j == 1) {
                                            var nLine = NewLine(response.data[i].details[j].activityDescription, 80);

                                            htmlData += "<td style='width: 10%;'><b set-lan='text:Name'></b> :<br /><b set-lan='text:Description'></b> :</td>";
                                            htmlData += "<td style='width: 1%; text-align: center;'><img src='../img/noImage.jpg' style='height: 100px;'></td>";
                                        }
                                    }
                                }
                            }

                            var Game = [];
                            if (response.data[i].gameList.length != 0) {
                                for (var j = 0; j < response.data[i].gameList.length; j++) {
                                    Game.push(response.data[i].gameList[j].provider + "|" + response.data[i].gameList[j].gameType + "|AA|" + response.data[i].gameList[j].id);
                                }
                            }

                            var code = response.data[i].missionTemplateCode;
                            var spin = 0;
                            var turn = 0;
                            if (response.data[i].missionTemplate.spin != null) {
                                spin = response.data[i].missionTemplate.spin;
                            }
                            if (response.data[i].missionTemplate.turnover != null) {
                                turn = response.data[i].missionTemplate.turnover;
                            }

                            if (code == "MT01") {
                                htmlData += "<td style='width: 6%;'><b set-lan='text:Code'></b> :" + code + "<br /><b set-lan='text:Reward'></b> :" + response.data[i].missionTemplate.reward + "</td>";
                            }
                            else if (code == "MT02") {
                                htmlData += "<td style='width: 6%;'><b set-lan='text:Code'></b> :" + code + "<br /><b set-lan='text:Reward'></b> :" + response.data[i].missionTemplate.reward + "<br /><b set-lan='text:Spin'></b> :" + spin + "</td>";
                            }
                            else if (code == "MT03") {
                                htmlData += "<td style='width: 6%;'><b set-lan='text:Code'></b> :" + code + "<br /><b set-lan='text:Reward'></b> :" + response.data[i].missionTemplate.reward + "<br /><b set-lan='text:Turnover'></b> :" + turn + "</td>";
                            }
                            else {
                                htmlData += "<td style='width: 6%;'><b set-lan='text:Code'></b> :" + code + "</td>";
                            }

                            var Status = response.data[i].active;
                            if (Status == true) {
                                htmlData += "<td style='width: 3%;' class='aligncenter' set-lan='text:Active'></td>";
                                Status = "Active";
                            }
                            else if (Status == false) {
                                htmlData += "<td style='width: 3%;' class='aligncenter' set-lan='text:Inactive'></td>";
                                Status = "Inactive";
                            }

                            htmlData += "<td style='width: 1%;' class='aligncenter colEdit zonenone'><a class='link' onclick='btnEdit(`" + response.data[i].id + "`,`" + Detail + "`,`" + Game + "`,`" + response.data[i].activityStartTime + "`,`" + response.data[i].activityEndTime + "`,`" + response.data[i].missionTemplate.name + "`,`" + response.data[i].missionTemplateCode + "`,`" + Status + "`,`" + response.data[i].missionTemplate.reward + "`,`" + spin + "`,`" + turn + "`)'><i class='fas fa-pencil-alt'></i></a><a class='link' style='margin-left: 0.5rem;' onclick='btnDel(\"" + response.data[i].id + "\");'><i class='fas fa-trash'></i></a></td>";
                            htmlData += "</tr>";
                            no++;
                        }

                        $("#tbData > tbody").append(htmlData);
                    }
                    else {
                        $("#tbData > tbody").append("<tr><td colspan='6' style='text-align: center;' set-lan='text:No data.'></td></tr>");
                    }

                    if (Status_Mission == "VIEW") {
                        $('.edit , .colEdit').css('display', 'none');
                    }
                    else {
                        $('.edit , .colEdit').css('display', 'table-cell');
                    }

                    SetScroll();
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

        const postMission = async (num) => {
            var Lan = localStorage.getItem("Language");
            $("#tbData > tbody").html("");

            const parameter = {
                detail: $("#searchDetail").val(),
                page: num,
                size: 100
            }
            const requestAwait = await fetchDataSite(`${apiURL}/v1/mission/inquiry`, 'POST', "include", parameter)
            const response = await requestAwait.json()

            if (response.messageCode == 0000 || response.messageCode == null) {
                var htmlData = "";
                if (response.total != 0) {
                    var no = 1;
                    for (var i = 0; i < response.data.length; i++) {
                        var date = new Date(response.data[i].activityStartTime);
                        var txtStartDate;
                        if (response.data[i].activityStartTime == "" || response.data[i].activityStartTime == null) {
                            txtStartDate = "-";
                        }
                        else {
                            txtStartDate = ("0" + date.getDate()).slice(-2) + "/" + ("0" + (date.getMonth() + 1)).slice(-2) + "/" + date.getFullYear() + " " + ("0" + date.getHours()).slice(-2) + ":" + ("0" + date.getMinutes()).slice(-2) + ":" + ("0" + date.getSeconds()).slice(-2);
                        }

                        var date2 = new Date(response.data[i].activityEndTime);
                        var txtEndDate;
                        if (response.data[i].activityEndTime == "" || response.data[i].activityEndTime == null) {
                            txtEndDate = "-";
                        }
                        else {
                            txtEndDate = ("0" + date2.getDate()).slice(-2) + "/" + ("0" + (date2.getMonth() + 1)).slice(-2) + "/" + date2.getFullYear() + " " + ("0" + date2.getHours()).slice(-2) + ":" + ("0" + date2.getMinutes()).slice(-2) + ":" + ("0" + date2.getSeconds()).slice(-2);
                        }

                        htmlData += "<tr>";
                        htmlData += "<td style='width: 1%;' class='aligncenter'>" + (((num - 1) * 20) + no) + "</td>";
                        htmlData += "<td style='width: 8%;'><b set-lan='text:Start time_'></b>" + txtStartDate + "<br /><b set-lan='text:End time_'></b>" + txtEndDate + "</td>";

                        var Detail = [];
                        for (var j = 0; j < response.data[i].details.length; j++) {
                            Detail.push(response.data[i].details[j].language + "|" + response.data[i].details[j].activityName + "|" + response.data[i].details[j].activityDescription + "|" + response.data[i].details[j].image + "|" + response.data[i].details[j].shortDescription);
                            if (Lan == "Thai") {
                                if (j == 0) {
                                    var nLine = NewLine(response.data[i].details[j].activityDescription, 80);

                                    htmlData += "<td style='width: 10%;'><b set-lan='text:Name'></b> :" + response.data[i].details[j].activityName + "<br /><b set-lan='text:Description'></b> :" + nLine + "</td>";
                                    htmlData += "<td style='width: 1%; text-align: center;'><img src='" + response.data[i].details[j].image + "' style='height: 100px;'></td>";
                                }
                            }
                            else if (Lan == "English") {
                                if (j == 1) {
                                    var nLine = NewLine(response.data[i].details[j].activityDescription, 80);

                                    htmlData += "<td style='width: 10%;'><b set-lan='text:Name'></b> :" + response.data[i].details[j].activityName + "<br /><b set-lan='text:Description'></b> :" + nLine + "</td>";
                                    htmlData += "<td style='width: 1%; text-align: center;'><img src='" + response.data[i].details[j].image + "' style='height: 100px;'></td>";
                                }
                            }
                            else if (Lan == "Chinese") {
                                if (response.data[i].details.length == 3) {
                                    if (j == 2) {
                                        var nLine = NewLine(response.data[i].details[j].activityDescription, 80);

                                        htmlData += "<td style='width: 10%;'><b set-lan='text:Name'></b> :" + response.data[i].details[j].activityName + "<br /><b set-lan='text:Description'></b> :" + nLine + "</td>";
                                        htmlData += "<td style='width: 1%; text-align: center;'><img src='" + response.data[i].details[j].image + "' style='height: 100px;'></td>";
                                    }
                                }
                                else {
                                    if (j == 1) {
                                        var nLine = NewLine(response.data[i].details[j].activityDescription, 80);

                                        htmlData += "<td style='width: 10%;'><b set-lan='text:Name'></b> :<br /><b set-lan='text:Description'></b> :</td>";
                                        htmlData += "<td style='width: 1%; text-align: center;'><img src='../img/noImage.jpg' style='height: 100px;'></td>";
                                    }
                                }
                            }
                        }

                        var Game = [];
                        if (response.data[i].gameList.length != 0) {
                            for (var j = 0; j < response.data[i].gameList.length; j++) {
                                Game.push(response.data[i].gameList[j].provider + "|" + response.data[i].gameList[j].gameType + "|AA|" + response.data[i].gameList[j].id);
                            }
                        }

                        var code = response.data[i].missionTemplateCode;
                        var spin = 0;
                        var turn = 0;
                        if (response.data[i].missionTemplate.spin != null) {
                            spin = response.data[i].missionTemplate.spin;
                        }
                        if (response.data[i].missionTemplate.turnover != null) {
                            turn = response.data[i].missionTemplate.turnover;
                        }

                        if (code == "MT01") {
                            htmlData += "<td style='width: 6%;'><b set-lan='text:Code'></b> :" + code + "<br /><b set-lan='text:Reward'></b> :" + response.data[i].missionTemplate.reward + "</td>";
                        }
                        else if (code == "MT02") {
                            htmlData += "<td style='width: 6%;'><b set-lan='text:Code'></b> :" + code + "<br /><b set-lan='text:Reward'></b> :" + response.data[i].missionTemplate.reward + "<br /><b set-lan='text:Spin'></b> :" + spin + "</td>";
                        }
                        else if (code == "MT03") {
                            htmlData += "<td style='width: 6%;'><b set-lan='text:Code'></b> :" + code + "<br /><b set-lan='text:Reward'></b> :" + response.data[i].missionTemplate.reward + "<br /><b set-lan='text:Turnover'></b> :" + turn + "</td>";
                        }
                        else {
                            htmlData += "<td style='width: 6%;'><b set-lan='text:Code'></b> :" + code + "</td>";
                        }

                        var Status = response.data[i].active;
                        if (Status == true) {
                            htmlData += "<td style='width: 3%;' class='aligncenter' set-lan='text:Active'></td>";
                            Status = "Active";
                        }
                        else if (Status == false) {
                            htmlData += "<td style='width: 3%;' class='aligncenter' set-lan='text:Inactive'></td>";
                            Status = "Inactive";
                        }

                        htmlData += "<td style='width: 1%;' class='aligncenter colEdit zonenone'><a class='link' onclick='btnEdit(`" + response.data[i].id + "`,`" + Detail + "`,`" + Game + "`,`" + response.data[i].activityStartTime + "`,`" + response.data[i].activityEndTime + "`,`" + response.data[i].missionTemplate.name + "`,`" + response.data[i].missionTemplateCode + "`,`" + Status + "`,`" + response.data[i].missionTemplate.reward + "`,`" + spin + "`,`" + turn + "`)'><i class='fas fa-pencil-alt'></i></a><a class='link' style='margin-left: 0.5rem;' onclick='btnDel(\"" + response.data[i].id + "\");'><i class='fas fa-trash'></i></a></td>";
                        htmlData += "</tr>";
                        no++;
                    }

                    $("#tbData > tbody").append(htmlData);
                }
                else {
                    $("#tbData > tbody").append("<tr><td colspan='6' style='text-align: center;' set-lan='text:No data.'></td></tr>");
                }

                if (Status_Mission == "VIEW") {
                    $('.edit , .colEdit').css('display', 'none');
                }
                else {
                    $('.edit , .colEdit').css('display', 'table-cell');
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

        const getMissionTem = async () => {
            const requestAwait = await fetchDataSite(`${apiURL}/v1/list/mission_templates`, 'GET', "include", {})
            const response = await requestAwait.json()

            if (response.messageCode == 0000 || response.messageCode == null) {
                if (response.data.length != 0) {
                    var select = document.getElementById('selMission');

                    for (var i = 0; i < response.data.length; i++) {
                        var opt = document.createElement('option');
                        opt.value = response.data[i].code;
                        opt.innerHTML = response.data[i].code + " - " + response.data[i].name;

                        if (response.data[i].code == "MT90" || response.data[i].code == "MT91" || response.data[i].code == "MT99") {
                            opt.disabled = true;
                        }

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

        const getProvider = async () => {
            const requestAwait = await fetchDataSite(`${apiURL}/v1/list/provider`, 'GET', "include", {})
            const response = await requestAwait.json()
            if (response.messageCode == 0000 || response.messageCode == null) {
                if (response.data.length != 0) {
                    var select = document.getElementById('selProvider');

                    var opt1 = document.createElement('option');
                    opt1.value = "";
                    opt1.innerHTML = "Select";
                    opt1.setAttribute('disabled', '');
                    opt1.setAttribute('selected', '');
                    select.appendChild(opt1);

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

        const getGameType = async (GT, G) => {
            $("#selGameType").empty();
            const parameter = {
                provider: $('#selProvider').val()
            }
            const requestAwait = await fetchDataSite(`${apiURL}/v1/list/game_type_by_provider`, 'POST', "include", parameter)
            const response = await requestAwait.json()
            if (response.messageCode == 0000 || response.messageCode == null) {
                if (response.data.length != 0) {
                    var select = document.getElementById('selGameType');

                    var opt1 = document.createElement('option');
                    opt1.value = "";
                    opt1.innerHTML = "Select";
                    opt1.setAttribute('disabled', '');
                    opt1.setAttribute('selected', '');
                    select.appendChild(opt1);

                    for (var i = 0; i < response.data.length; i++) {
                        var opt = document.createElement('option');
                        opt.value = response.data[i].code;
                        opt.innerHTML = response.data[i].code;
                        select.appendChild(opt);
                    }
                }

                if (GT != "") {
                    $('#selGameType option').removeAttr('selected');
                    $("#selGameType option[value='" + GT + "']").attr("selected", "selected");
                    getGame(G);
                }

                document.getElementById("zone1").style.display = "block";
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

        const getGame = async (G) => {
            $("#selGame").empty();
            const parameter = {
                provider: $('#selProvider').val(),
                gameType: $('#selGameType').val()
            }

            const requestAwait = await fetchDataSite(`${apiURL}/v1/list/game`, 'POST', "include", parameter)
            const response = await requestAwait.json()
            if (response.messageCode == 0000 || response.messageCode == null) {
                if (response.data.length != 0) {
                    var select = document.getElementById('selGame');

                    var opt1 = document.createElement('option');
                    opt1.value = "";
                    opt1.innerHTML = "Select";
                    opt1.setAttribute('disabled', '');
                    opt1.setAttribute('selected', '');
                    select.appendChild(opt1);

                    for (var i = 0; i < response.data.length; i++) {
                        var opt = document.createElement('option');
                        opt.value = response.data[i].id;
                        opt.innerHTML = response.data[i].gameName;
                        select.appendChild(opt);
                    }
                }

                if (G != "") {
                    $('#selGame option').removeAttr('selected');
                    for (var i = 0; i < G.length; i++) {
                        $("#selGame option[value='" + G[i] + "']").attr("selected", "selected");
                    }
                }

                document.getElementById("zone2").style.display = "block";
                $('#selGame').materialSelect();
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

        const postFile = async (fData) => {
            const requestAwait = await fetch(`${apiURL}/v1/mission/upload_image`, {
                method: 'POST',
                credentials: 'include',
                body: fData
            })
            const response = await requestAwait.json()
            var urlImg = response.url;
            return urlImg;
        }

        const postAddMission = async (Img1, Img2, ImgCH) => {
            var startD = $("#startdate").val();
            var endD = $("#todate").val();
            var startT = $("#starttime").val();
            var endT = $("#totime").val();

            const parameter = {
                active: true,
                details: [{
                    language: "th",
                    activityName: $('#ActivityNameTH').val(),
                    shortDescription: $('#PreliminaryTH').val(),
                    activityDescription: $('#ActivityDescriptionTH').val(),
                    image: Img1
                },
                {
                    language: "en",
                    activityName: $('#ActivityNameEN').val(),
                    shortDescription: $('#PreliminaryEN').val(),
                    activityDescription: $('#ActivityDescriptionEN').val(),
                    image: Img2
                },
                {
                    language: "ch",
                    activityName: $('#ActivityNameCH').val(),
                    shortDescription: $('#PreliminaryCH').val(),
                    activityDescription: $('#ActivityDescriptionCH').val(),
                    image: ImgCH
                }],
                gameList: $('#selGame').val(),
                activityStartTime: startD + "T" + startT + ":00Z",
                activityEndTime: endD + "T" + endT + ":00Z",
                missionTemplate: {
                    name: $('#MissionName').val(),
                    reward: parseInt($('#MissionReward').val()),
                    spin: parseInt($('#MissionSpin').val()),
                    turnover: parseInt($('#MissionTurnover').val())
                },
                missionTemplateCode: $('#selMission').val()
            }

            const requestAwait = await fetchDataSite(`${apiURL}/v1/mission/create`, 'POST', "include", parameter)
            const response = await requestAwait.json()
            if (response.messageCode == 0000 || response.messageCode == null) {
                document.getElementById("lbAlertSuccess").setAttribute("set-lan", "text:Add new mission success");
                SetLan(localStorage.getItem("Language"));
                $("#myModalLoad").modal('hide');
                $("#modalAnnouncement").modal('hide');
                $('#modalAlertSuccess').modal();
                setTimeout(function () {
                    window.location.href = "/Menu_Mission/Mission.aspx?s=0";
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

        const postSaveMission = async (Img1, Img2, ImgCH) => {
            var startD = $("#startdate").val();
            var endD = $("#todate").val();
            var startT = $("#starttime").val();
            var endT = $("#totime").val();

            var Mission = $('#selMission').val();
            var Mission2 = $('#selMission option[disabled]:selected').val();
            if (Mission == null) {
                if (Mission2 == "MT90" || Mission2 == "MT91" || Mission2 == "MT99") {
                    Mission = Mission2;
                }
            }

            const parameter = {
                id: $('#ID').val(),
                details: [{
                    language: "th",
                    activityName: $('#ActivityNameTH').val(),
                    shortDescription: $('#PreliminaryTH').val(),
                    activityDescription: $('#ActivityDescriptionTH').val(),
                    image: Img1
                },
                {
                    language: "en",
                    activityName: $('#ActivityNameEN').val(),
                    shortDescription: $('#PreliminaryEN').val(),
                    activityDescription: $('#ActivityDescriptionEN').val(),
                    image: Img2
                },
                {
                    language: "ch",
                    activityName: $('#ActivityNameCH').val(),
                    shortDescription: $('#PreliminaryCH').val(),
                    activityDescription: $('#ActivityDescriptionCH').val(),
                    image: ImgCH
                }],
                gameList: $('#selGame').val(),
                activityStartTime: startD + "T" + startT + ":00Z",
                activityEndTime: endD + "T" + endT + ":00Z",
                missionTemplate: {
                    name: $('#MissionName').val(),
                    reward: parseInt($('#MissionReward').val()),
                    spin: parseInt($('#MissionSpin').val()),
                    turnover: parseInt($('#MissionTurnover').val())
                },
                missionTemplateCode: Mission
            }
            const requestAwait = await fetchDataSite(`${apiURL}/v1/mission/update`, 'POST', "include", parameter)
            const response = await requestAwait.json()

            if (response.messageCode == 0000 || response.messageCode == null) {
                document.getElementById("lbAlertSuccess").setAttribute("set-lan", "text:Edit mission success");
                SetLan(localStorage.getItem("Language"));
                $("#myModalLoad").modal('hide');
                $("#modalAnnouncement").modal('hide');
                $('#modalAlertSuccess').modal();
                setTimeout(function () {
                    window.location.href = "/Menu_Mission/Mission.aspx?s=" + ValScroll;
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

        const postDelete = async () => {
            const parameter = {
                id: ID_DEL
            }

            const requestAwait = await fetchDataSite(`${apiURL}/v1/mission/delete`, 'POST', "include", parameter)
            const response = await requestAwait.json()
            if (response.messageCode == 0000 || response.messageCode == null) {
                document.getElementById("lbAlertSuccess").setAttribute("set-lan", "text:Delete mission success");
                SetLan(localStorage.getItem("Language"));
                $("#myModalLoad").modal('hide');
                $("#modalDelete").modal('hide');
                $('#modalAlertSuccess').modal();
                setTimeout(function () {
                    window.location.href = "/Menu_Mission/Mission.aspx?s=" + ValScroll;
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

        const postEditStatus = async (status) => {
            const parameter = {
                id: $('#ID').val(),
                active: status
            }

            const requestAwait = await fetchDataSite(`${apiURL}/v1/mission/update_status`, 'POST', "include", parameter)
            const response = await requestAwait.json()
            if (response.messageCode == 0000 || response.messageCode == null) {
                document.getElementById("lbAlertSuccess").setAttribute("set-lan", "text:Edit status success");
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
    </script>
</asp:Content>
