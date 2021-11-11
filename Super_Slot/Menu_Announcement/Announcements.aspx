<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Announcements.aspx.cs" Inherits="Pretty_Gaming.Menu_Announcement.Announcements" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        select {
            display: block !important;
        }

        #wrapper {
            margin: 20px auto;
        }

        #pagination-data-container {
            margin-top: 5px;
        }

            #pagination-data-container ul {
                padding: 0;
                margin: 0;
            }

            #pagination-data-container li {
                margin-bottom: 5px;
                padding: 5px 10px;
                background: #eee;
                color: #666;
            }

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
                position: absolute;
                top: 9px;
                right: 10px;
                color: black;
                opacity: 1;
            }

        .mouse {
            cursor: unset !important;
        }

        .card-sub {
            cursor: move;
            border: none;
            -webkit-box-shadow: 0 0 1px 2px rgba(0, 0, 0, 0.05), 0 -2px 1px -2px rgba(0, 0, 0, 0.04), 0 0 0 -1px rgba(0, 0, 0, 0.05);
            box-shadow: 0 0 1px 2px rgba(0, 0, 0, 0.05), 0 -2px 1px -2px rgba(0, 0, 0, 0.04), 0 0 0 -1px rgba(0, 0, 0, 0.05);
        }

        .card-img-top {
            width: 100%;
            border-top-left-radius: calc(.25rem - 1px);
            border-top-right-radius: calc(.25rem - 1px);
            height: 153px !important;
        }

        .card-block {
            border-radius: .3rem;
            padding: 1.25rem;
            padding-top: 0px !important;
            background-color: #fff !important;
            margin-bottom: 1rem;
        }

        .cardtitle {
            padding: .7rem;
            background-color: #fff;
        }

        .card-title {
            width: 14.5em;
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
        }

        .ui-sortable-handle {
            padding-top: 1.25rem !important;
        }

        .iconCard {
            padding: .4rem;
            border-radius: 5px;
            margin-right: .2rem;
            padding-top: 3px;
            padding-bottom: 3px;
        }

        .top-left {
            position: absolute;
            top: 1.5rem;
            left: 16px;
            z-index: 999;
        }

        .fsBoxGame {
            font-size: 10pt;
        }

        .modalScroll {
            overflow-y: auto !important;
        }
    </style>

    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="" set-lan="text:Announcements"></a></li>
            <li class="breadcrumb-item active txtMem" set-lan="text:Announcement Info"></li>
        </ol>
    </nav>
    <div class="row">
        <div class="col-md-8">
            <h1 set-lan="text:Announcement Info"></h1>
        </div>
        <div class="col-md-4" style="text-align: right;" id="ZoneBtnAdd">
            <button id="btnAddAnnouncement" type="button" class="btn btn-yellow font-weight-bold" onclick="newAnnouncement('Add Announcement')" set-lan="html:Add Announcement_"></button>
        </div>
    </div>
    <div class="btn-toolbar section-group" role="toolbar" style="padding-bottom: 0px !important; display: none;">
        <div class="form-group row col-md-5">
            <label for="email" class="col-5 col-form-label alignright">Title :</label>
            <div class="col-7">
                <input type="text" class="form-control" id="searchTitle" autocomplete="off" />
            </div>
        </div>
        <div class="form-group row col-md-5">
            <label for="email" class="col-5 col-form-label alignright">Status :</label>
            <div class="col-7">
                <select class="form-control" id="searchStatus">
                    <option value="Active">Active</option>
                    <option value="Inactive">Inactive</option>
                </select>
            </div>
        </div>
        <div class="form-group row col-md-5">
            <label for="email" class="col-5 col-form-label alignright">Start time :</label>
            <div class="col-7">
                <input type="datetime-local" class="form-control" id="startdate" />
            </div>
        </div>
        <div class="form-group row col-md-5">
            <label for="email" class="col-5 col-form-label alignright">End time :</label>
            <div class="col-7">
                <input type="datetime-local" class="form-control" id="enddate" />
            </div>
        </div>
        <div class="form-group row col-md-5">
            <label for="email" class="col-5 col-form-label alignright">Category :</label>
            <div class="col-7">
                <select class="form-control" id="searchCategory">
                    <option value="CatA">Cat A</option>
                    <option value="CatB">Cat B</option>
                </select>
            </div>
        </div>
        <div class="form-group row col-md-5" style="padding-left: 1rem;">
            <button class="btn btn-yellow font-weight-bold" type="button" onclick="btnSearch();">Search</button>
        </div>
    </div>
    <div class="card-block">
        <h3 style="padding-top: 1rem;" set-lan="text:Admin"></h3>
        <div class="row" id="sortableAdmin"></div>
        <label id="NoDataAdmin" class="col-12 col-form-label" style="text-align: center; display: none;" set-lan="text:No data."></label>
    </div>
    <div class="card-block">
        <h3 style="padding-top: 1rem;" set-lan="text:Company"></h3>
        <div class="row" id="sortableCompany"></div>
        <label id="NoDataCompany" class="col-12 col-form-label" style="text-align: center; display: none;" set-lan="text:No data."></label>
    </div>
    <div class="card-block" id="ZoneAgent">
        <h3 style="padding-top: 1rem;" set-lan="text:Agent"></h3>
        <div class="row" id="sortableAgent"></div>
        <label id="NoDataAgent" class="col-12 col-form-label" style="text-align: center; display: none;" set-lan="text:No data."></label>
    </div>

    <%--modal--%>
    <div class="modal fade modalScroll" id="modalAnnouncement" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header text-center">
                    <h4 class="modal-title w-100 font-weight-bold" id="txtHead"></h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body mx-3">
                    <div class="form-group row" style="display: none;">
                        <label for="ID" class="col-3 col-form-label" style="text-align: right;">ID :</label>
                        <div class="col-9">
                            <input type="text" class="form-control" id="ID" autocomplete="off" />
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="username" class="col-3 col-form-label" style="text-align: right;" set-lan="html:Announcment Title-"></label>
                        <div class="col-9">
                            <input type="text" class="form-control" id="title" autocomplete="off" />
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="username" class="col-3 col-form-label" style="text-align: right;" set-lan="text:Content_"></label>
                        <div class="col-9">
                            <textarea id="content" rows="3" class="form-control" autocomplete="off"></textarea>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="username" class="col-3 col-form-label" style="text-align: right;" set-lan="html:ImageTH-"></label>
                        <div class="col-5">
                            <input id="default_fileTH" type="file" name="myFiles" class="form-control" onchange="CheckExt(this)" />
                            <img id="blahTH" src="../img/noImage.jpg" style="width: inherit; margin-top: .5rem; height: 153px;" />
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="username" class="col-3 col-form-label" style="text-align: right;" set-lan="html:ImageEN-"></label>
                        <div class="col-5">
                            <input id="default_fileEN" type="file" name="myFiles" class="form-control" onchange="CheckExt(this)" />
                            <img id="blahEN" src="../img/noImage.jpg" style="width: inherit; margin-top: .5rem; height: 153px;" />
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="username" class="col-3 col-form-label" style="text-align: right;" set-lan="html:ImageCH-"></label>
                        <div class="col-5">
                            <input id="default_fileCH" type="file" name="myFiles" class="form-control" onchange="CheckExt(this)" />
                            <img id="blahCH" src="../img/noImage.jpg" style="width: inherit; margin-top: .5rem; height: 153px;" />
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="username" class="col-3 col-form-label" style="text-align: right;" set-lan="text:Category_"></label>
                        <div class="col-5">
                            <select class="form-control" id="ddlCategory">
                                <option value="normal">Normal</option>
                                <option value="system">System</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="username" class="col-3 col-form-label" style="text-align: right;" set-lan="text:Start time_"></label>
                        <div class="col-5">
                            <input type="datetime-local" class="form-control" id="starttime" />
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="username" class="col-3 col-form-label" style="text-align: right;" set-lan="text:End time_"></label>
                        <div class="col-5">
                            <input type="datetime-local" class="form-control" id="endtime" />
                        </div>
                    </div>
                </div>
                <div class="modal-footer d-flex justify-content-center">
                    <button class="btn btn-yellow font-weight-bold" type="button" id="Add" onclick="btnAdd();" set-lan="text:Add Announcement"></button>
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
                    <h4 class="modal-title w-100 font-weight-bold" set-lan="text:Delete announcement"></h4>
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
                    <button class="btn btn-yellow font-weight-bold" type="button" id="Delete" onclick="Del();" set-lan="text:Delete"></button>
                    <button type="button" class="btn btn-yellow font-weight-bold" data-dismiss="modal" aria-label="Close" set-lan="text:Cancel"></button>
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
                    <label id="lbAlertTEN"></label>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainScript" runat="server">
    <script>
        var formdataTH = new FormData();
        var formdataEN = new FormData();
        var formdataCH = new FormData();
        var ID_DEL = "";
        var Position = localStorage.getItem("Position");
        var Status_Announcement = localStorage.getItem("Status_Announcement");

        $(document).ready(function () {
            $("#menuAnnouncement , #menuAnnouncement > a").addClass("active");
            $("#menuAnnouncement > div").css("display", "block");

            var date = new Date();
            var dateSet = date.getFullYear() + "-" + ("0" + (date.getMonth() + 1)).slice(-2) + "-" + ("0" + date.getDate()).slice(-2) + "T00:00";
            var dateSetEnd = date.getFullYear() + "-" + ("0" + (date.getMonth() + 1)).slice(-2) + "-" + ("0" + date.getDate()).slice(-2) + "T23:59";
            $("#startdate").val(dateSet);
            $("#enddate").val(dateSetEnd);

            if (Position == "COMPANY") {
                $("#sortableCompany").sortable({
                    update: function (event, ui) {
                        var sortedIDs = $("#sortableCompany").sortable("toArray", { "attribute": "data-id" });
                        postSeq(sortedIDs);
                    }
                });
            }
            if (Position == "AGENT") {
                $("#sortableAgent").sortable({
                    update: function (event, ui) {
                        var sortedIDs = $("#sortableAgent").sortable("toArray", { "attribute": "data-id" });
                        postSeq(sortedIDs);
                    }
                });
            }
            $("#sortableCompany").disableSelection();
            $("#sortableAgent").disableSelection();

            $('#default_fileTH').change(function () {
                readURLTH(this);
                if ($(this).prop('files').length > 0) {
                    file = $(this).prop('files')[0];
                    formdataTH.append("file", file);
                }
            });

            $('#default_fileEN').change(function () {
                readURLEN(this);
                if ($(this).prop('files').length > 0) {
                    file = $(this).prop('files')[0];
                    formdataEN.append("file", file);
                }
            });

            $('#default_fileCH').change(function () {
                readURLCH(this);
                if ($(this).prop('files').length > 0) {
                    file = $(this).prop('files')[0];
                    formdataCH.append("file", file);
                }
            });

            $('#starttime').change(function () {
                var Start = $("#starttime").val();
                document.getElementById("endtime").setAttribute("min", Start);
            });

            if (Status_Announcement == "VIEW") {
                document.getElementById("btnAddAnnouncement").style.display = "none";
            }

            DateNow();
            postAnnounce();

            SetLan(localStorage.getItem("Language"));
        });

        function postAnnounce() {
            if (Position == "AMB") {
                document.getElementById("ZoneBtnAdd").style.display = "none";
                document.getElementById("ZoneAgent").style.display = "none";
                postAnnounceAdmin();
                postAnnounceCompany();
            }
            else if (Position == "COMPANY") {
                document.getElementById("ZoneAgent").style.display = "none";
                postAnnounceAdmin();
                postAnnounceCompany();
            }
            else if (Position == "AGENT") {
                postAnnounceAdmin();
                postAnnounceCompany();
                postAnnounceAgent();
            }
        }

        function DateNow() {
            var date2 = new Date();
            document.getElementById('starttime').value = date2.toISOString().slice(0, 16);
            document.getElementById('endtime').value = date2.toISOString().slice(0, 16);
        }

        function readURLTH(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();

                reader.onload = function (e) {
                    $('#blahTH').attr('src', e.target.result);
                }
                reader.readAsDataURL(input.files[0]);
            }
        }

        function readURLEN(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();

                reader.onload = function (e) {
                    $('#blahEN').attr('src', e.target.result);
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

        function newAnnouncement(type) {
            document.getElementById('Add').disabled = false;
            document.getElementById("Add").style.display = "block";
            document.getElementById("Save").style.display = "none";
            DateNow();
            document.getElementById("txtHead").setAttribute("set-lan", "text:" + type);
            $('#title').val("");
            $('#content').val("");
            $('#default_fileTH').val("");
            $('#blahTH').attr('src', '../img/noImage.jpg');
            $('#default_fileEN').val("");
            $('#blahEN').attr('src', '../img/noImage.jpg');
            $('#default_fileCH').val("");
            $('#blahCH').attr('src', '../img/noImage.jpg');
            $('#ddlCategory option').removeAttr('selected');
            $("#ddlCategory option[value='normal']").attr("selected", "selected");
            $('#endtime').removeAttr('min');
            SetLan(localStorage.getItem("Language"));
            $("#modalAnnouncement").modal();
        }

        function btnAdd() {
            var urlTH = "";
            var urlEN = "";
            var urlCH = "";

            var fromdate = new Date($("#starttime").val()); //Year, Month, Date
            var todate = new Date($("#endtime").val()); //Year, Month, Date
            if (todate < fromdate) {
                document.getElementById("lbAlert").setAttribute("set-lan", "text:missing 'Start-To Date' field");
                SetLan(localStorage.getItem("Language"));
                $('#modalAlert').modal('show');
                $("#myModalLoad").modal('hide');
            }
            else if ($('#title').val() == "") {
                document.getElementById("lbAlert").setAttribute("set-lan", "text:missing 'Announcment Title' field");
                SetLan(localStorage.getItem("Language"));
                $('#modalAlert').modal('show');
                $("#myModalLoad").modal('hide');
            }
            else if ($('#default_fileTH').val() == "" || $('#default_fileEN').val() == "" || $('#default_fileCH').val() == "") {
                document.getElementById("lbAlert").setAttribute("set-lan", "text:missing 'Image' field");
                SetLan(localStorage.getItem("Language"));
                $('#modalAlert').modal('show');
                $("#myModalLoad").modal('hide');
            }
            else {
                document.getElementById('Add').disabled = true;
                urlTH = postFile(formdataTH).then(function (result) {
                    urlTH = result;

                    urlEN = postFile(formdataEN).then(function (result) {
                        urlEN = result;

                        urlCH = postFile(formdataCH).then(function (result) {
                            urlCH = result;

                            postAddAnnounce(urlTH, urlEN, urlCH);
                        });
                    });
                });
            }
        }

        function btnSave() {
            var urlTH = "";
            var urlEN = "";
            var urlCH = "";

            var srcTH = document.getElementById("blahTH").src.split("/").pop();
            var srcEN = document.getElementById("blahEN").src.split("/").pop();
            var srcCH = document.getElementById("blahCH").src.split("/").pop();

            var fromdate = new Date($("#starttime").val()); //Year, Month, Date
            var todate = new Date($("#endtime").val()); //Year, Month, Date
            if (todate < fromdate) {
                document.getElementById("lbAlert").setAttribute("set-lan", "text:missing 'Start-To Date' field");
                SetLan(localStorage.getItem("Language"));
                $('#modalAlert').modal('show');
                $("#myModalLoad").modal('hide');
            }
            else if ($('#title').val() == "") {
                document.getElementById("lbAlert").setAttribute("set-lan", "text:missing 'Announcment Title' field");
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
            else if ($('#default_fileTH').val() == "" && $('#default_fileEN').val() == "" && $('#default_fileCH').val() == "") {
                urlTH = document.getElementById("blahTH").src;
                urlEN = document.getElementById("blahEN").src;
                urlCH = document.getElementById("blahCH").src;
                postSaveAnnounce(urlTH, urlEN, urlCH);
            }
            else if ($('#default_fileTH').val() != "" && $('#default_fileEN').val() != "" && $('#default_fileCH').val() != "") {
                urlTH = postFile(formdataTH).then(function (result) {
                    urlTH = result;

                    urlEN = postFile(formdataEN).then(function (result) {
                        urlEN = result;

                        urlCH = postFile(formdataCH).then(function (result) {
                            urlCH = result;

                            postSaveAnnounce(urlTH, urlEN, urlCH);
                        });
                    });
                });
            }
            else if ($('#default_fileTH').val() != "") {
                urlTH = postFile(formdataTH).then(function (result) {
                    urlTH = result;

                    if ($('#default_fileEN').val() != "") {
                        urlEN = postFile(formdataEN).then(function (result) {
                            urlEN = result;

                            if ($('#default_fileCH').val() != "") {
                                urlCH = postFile(formdataCH).then(function (result) {
                                    urlCH = result;

                                    postSaveAnnounce(urlTH, urlEN, urlCH);
                                });
                            }
                            else {
                                urlCH = document.getElementById("blahCH").src;
                                postSaveAnnounce(urlTH, urlEN, urlCH);
                            }
                        });
                    }
                    else {
                        urlEN = document.getElementById("blahEN").src;

                        if ($('#default_fileCH').val() != "") {
                            urlCH = postFile(formdataCH).then(function (result) {
                                urlCH = result;

                                postSaveAnnounce(urlTH, urlEN, urlCH);
                            });
                        }
                        else {
                            urlCH = document.getElementById("blahCH").src;
                            postSaveAnnounce(urlTH, urlEN, urlCH);
                        }
                    }
                });
            }
            else if ($('#default_fileEN').val() != "") {
                urlEN = postFile(formdataEN).then(function (result) {
                    urlEN = result;

                    if ($('#default_fileTH').val() != "") {
                        urlTH = postFile(formdataTH).then(function (result) {
                            urlTH = result;

                            if ($('#default_fileCH').val() != "") {
                                urlCH = postFile(formdataCH).then(function (result) {
                                    urlCH = result;

                                    postSaveAnnounce(urlTH, urlEN, urlCH);
                                });
                            }
                            else {
                                urlCH = document.getElementById("blahCH").src;
                                postSaveAnnounce(urlTH, urlEN, urlCH);
                            }
                        });
                    }
                    else {
                        urlTH = document.getElementById("blahTH").src;

                        if ($('#default_fileCH').val() != "") {
                            urlCH = postFile(formdataCH).then(function (result) {
                                urlCH = result;

                                postSaveAnnounce(urlTH, urlEN, urlCH);
                            });
                        }
                        else {
                            urlCH = document.getElementById("blahCH").src;
                            postSaveAnnounce(urlTH, urlEN, urlCH);
                        }
                    }
                });
            }
            else if ($('#default_fileCH').val() != "") {
                urlCH = postFile(formdataCH).then(function (result) {
                    urlCH = result;

                    if ($('#default_fileTH').val() != "") {
                        urlTH = postFile(formdataTH).then(function (result) {
                            urlTH = result;

                            if ($('#default_fileEN').val() != "") {
                                urlEN = postFile(formdataEN).then(function (result) {
                                    urlEN = result;
                                    postSaveAnnounce(urlTH, urlEN, urlCH);
                                });
                            }
                            else {
                                urlEN = document.getElementById("blahEN").src;
                                postSaveAnnounce(urlTH, urlEN, urlCH);
                            }
                        });
                    }
                    else {
                        urlTH = document.getElementById("blahTH").src;
                        if ($('#default_fileEN').val() != "") {
                            urlEN = postFile(formdataEN).then(function (result) {
                                urlEN = result;
                                postSaveAnnounce(urlTH, urlEN, urlCH);
                            });
                        }
                        else {
                            urlEN = document.getElementById("blahEN").src;
                            postSaveAnnounce(urlTH, urlEN, urlCH);
                        }
                    }
                });
            }
        }

        function btnEdit(ID, Title, Content, ImgTH, ImgEN, ImgCH, Category, Start, End) {
            document.getElementById("Add").style.display = "none";
            document.getElementById("Save").style.display = "block";
            document.getElementById("txtHead").setAttribute("set-lan", "text:Edit Announcement");
            $('#ID').val(ID);
            $('#title').val(Title);
            if (Content != "undefined") {
                $('#content').val(Content);
            }
            else {
                $('#content').val("");
            }

            $('#default_fileTH').val("");
            $('#blahTH').attr('src', ImgTH);
            $('#default_fileEN').val("");
            $('#blahEN').attr('src', ImgEN);
            $('#default_fileCH').val("");
            $('#blahCH').attr('src', ImgCH);

            $('#ddlCategory option').removeAttr('selected');
            $("#ddlCategory option[value='" + Category + "']").attr("selected", "selected");
            document.getElementById('starttime').value = Start;
            document.getElementById('endtime').value = End;
            SetLan(localStorage.getItem("Language"));
            $("#modalAnnouncement").modal();
        }

        function btnDel(ID) {
            ID_DEL = ID;
            $("#modalDelete").modal();
        }

        function Del() {
            document.getElementById('Delete').disabled = true;
            postDelete();
        }

        function chgStatus(ID, Status) {
            if (Status == "ACTIVE") {
                Status = "INACTIVE";
            }
            else if (Status == "INACTIVE") {
                Status = "ACTIVE";
            }
            postAction(ID, Status);
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
                if (obj.id == "default_fileTH") {
                    $('#default_fileTH').val("");
                    $('#blahTH').attr('src', '../img/noImage.jpg');
                } else if (obj.id == "default_fileEN") {
                    $('#default_fileEN').val("");
                    $('#blahEN').attr('src', '../img/noImage.jpg');
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

        const postFile = async (fData, Status) => {
            const requestAwait = await fetch(`${apiURL}/v1/announcement/upload_image`, {
                method: 'POST',
                credentials: 'include',
                body: fData
            })
            const response = await requestAwait.json()
            var urlImg = response.url;
            return urlImg;
        }

        const postAnnounceAdmin = async () => {
            var Lan = localStorage.getItem("Language");
            $("#sortableAdmin").html("");

            const parameter = {
                announcementType: "AMB",
                page: 1,
                size: 100
            }
            const requestAwait = await fetchDataSite(`${apiURL}/v1/announcement/inquiry`, 'POST', "include", parameter)
            const response = await requestAwait.json()

            if (response.messageCode == 0000 || response.messageCode == null) {
                var htmlDataAdmin = "";

                if (response.total != 0) {
                    for (var i = 0; i < response.data.length; i++) {
                        var no = 0;
                        var txtID = "";
                        var start = response.data[i].startDate + "T" + response.data[i].startTime;
                        var end = response.data[i].endDate + "T" + response.data[i].endTime;

                        txtID = "status_" + response.data[i].seq;

                        htmlDataAdmin += "<div class='col-lg-12 col-xl-3 ui-sortable-handle' data-id='" + response.data[i].id + "'><div class='card-sub mouse'>";

                        if (Lan == "Thai") {
                            if (response.data[i].image.th != "") {
                                htmlDataAdmin += "<img class='card-img-top img-fluid' src='" + response.data[i].image.th + "' alt='Card image cap'>";
                            } else {
                                htmlDataAdmin += "<img class='card-img-top img-fluid' src='../img/noImage.jpg' alt='Card image cap'>";
                            }
                        }
                        else if (Lan == "English") {
                            if (response.data[i].image.en != "") {
                                htmlDataAdmin += "<img class='card-img-top img-fluid' src='" + response.data[i].image.en + "' alt='Card image cap'>";
                            } else {
                                htmlDataAdmin += "<img class='card-img-top img-fluid' src='../img/noImage.jpg' alt='Card image cap'>";
                            }
                        }
                        else if (Lan == "Chinese") {
                            if (response.data[i].image.ch != "") {
                                htmlDataAdmin += "<img class='card-img-top img-fluid' src='" + response.data[i].image.ch + "' alt='Card image cap'>";
                            } else {
                                htmlDataAdmin += "<img class='card-img-top img-fluid' src='../img/noImage.jpg' alt='Card image cap'>";
                            }
                        }

                        if (response.data[i].status == "ACTIVE") {
                            htmlDataAdmin += "<div class='switch top-left'><label style='display: none;'><input type='checkbox' id='" + txtID + "' onclick='chgStatus(`" + response.data[i].id + "`,`" + response.data[i].status + "`)' checked><span class='lever ml-0 edit'></span></label>";
                        }
                        else {
                            htmlDataAdmin += "<div class='switch top-left'><label style='display: none;'><input type='checkbox' id='" + txtID + "' onclick='chgStatus(`" + response.data[i].id + "`,`" + response.data[i].status + "`)'><span class='lever ml-0 edit'></span></label>";
                        }

                        htmlDataAdmin += "</div>";
                        htmlDataAdmin += "<div class='cardtitle'>";
                        no = parseInt(response.data[i].seq) + 1;
                        htmlDataAdmin += "<h4 class='card-title'>" + no + " : " + response.data[i].title + "</h4>";
                        htmlDataAdmin += "<b class='fsBoxGame' set-lan='text:Start time_'></b>";

                        var date = new Date(response.data[i].startDate);
                        var txtStartDate;
                        if (response.data[i].startDate == "" || response.data[i].startDate == null) {
                            txtStartDate = "-";
                        }
                        else {
                            txtStartDate = ("0" + date.getDate()).slice(-2) + "/" + ("0" + (date.getMonth() + 1)).slice(-2) + "/" + date.getFullYear();
                        }
                        htmlDataAdmin += "<label class='fsBoxGame'>" + txtStartDate + " " + response.data[i].startTime + "</label><br />";
                        htmlDataAdmin += "<b class='fsBoxGame' set-lan='text:End time_'></b>";

                        var date2 = new Date(response.data[i].endDate);
                        var txtEndDate;
                        if (response.data[i].endDate == "" || response.data[i].endDate == null) {
                            txtEndDate = "-";
                        }
                        else {
                            txtEndDate = ("0" + date2.getDate()).slice(-2) + "/" + ("0" + (date2.getMonth() + 1)).slice(-2) + "/" + date2.getFullYear();
                        }
                        htmlDataAdmin += "<label class='fsBoxGame'>" + txtEndDate + " " + response.data[i].endTime + "</label>";
                        htmlDataAdmin += "<div class='row' style='float: right; margin-top: -5px;'>";
                        htmlDataAdmin += "</div></div></div></div>";
                    }
                    $("#sortableAdmin").append(htmlDataAdmin);
                }
                else {
                    //NoDataAdmin
                    document.getElementById("NoDataAdmin").style.display = "block";
                }

                if (Status_Announcement == "VIEW") {
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

        const postAnnounceCompany = async () => {
            var Lan = localStorage.getItem("Language");
            $("#sortableCompany").html("");

            const parameter = {
                announcementType: "COMPANY",
                page: 1,
                size: 100
            }
            const requestAwait = await fetchDataSite(`${apiURL}/v1/announcement/inquiry`, 'POST', "include", parameter)
            const response = await requestAwait.json()

            if (response.messageCode == 0000 || response.messageCode == null) {
                var htmlData = "";

                if (response.total != 0) {
                    if (Position == "AGENT" || Position == "AMB") {
                        for (var i = 0; i < response.data.length; i++) {
                            var no = 0;
                            var txtID = "";
                            var start = response.data[i].startDate + "T" + response.data[i].startTime;
                            var end = response.data[i].endDate + "T" + response.data[i].endTime;

                            txtID = "status_" + response.data[i].seq;

                            htmlData += "<div class='col-lg-12 col-xl-3 ui-sortable-handle' data-id='" + response.data[i].id + "'><div class='card-sub mouse'>";

                            if (Lan == "Thai") {
                                if (response.data[i].image.th != "") {
                                    htmlData += "<img class='card-img-top img-fluid' src='" + response.data[i].image.th + "' alt='Card image cap'>";
                                } else {
                                    htmlData += "<img class='card-img-top img-fluid' src='../img/noImage.jpg' alt='Card image cap'>";
                                }
                            }
                            else if (Lan == "English") {
                                if (response.data[i].image.en != "") {
                                    htmlData += "<img class='card-img-top img-fluid' src='" + response.data[i].image.en + "' alt='Card image cap'>";
                                } else {
                                    htmlData += "<img class='card-img-top img-fluid' src='../img/noImage.jpg' alt='Card image cap'>";
                                }
                            }
                            else if (Lan == "Chinese") {
                                if (response.data[i].image.ch != "") {
                                    htmlData += "<img class='card-img-top img-fluid' src='" + response.data[i].image.ch + "' alt='Card image cap'>";
                                } else {
                                    htmlData += "<img class='card-img-top img-fluid' src='../img/noImage.jpg' alt='Card image cap'>";
                                }
                            }

                            if (response.data[i].status == "ACTIVE") {
                                htmlData += "<div class='switch top-left'><label style='display: none;'><input type='checkbox' id='" + txtID + "' onclick='chgStatus(`" + response.data[i].id + "`,`" + response.data[i].status + "`)' checked><span class='lever ml-0 edit'></span></label>";
                            }
                            else {
                                htmlData += "<div class='switch top-left'><label style='display: none;'><input type='checkbox' id='" + txtID + "' onclick='chgStatus(`" + response.data[i].id + "`,`" + response.data[i].status + "`)'><span class='lever ml-0 edit'></span></label>";
                            }

                            htmlData += "</div>";
                            htmlData += "<div class='cardtitle'>";
                            no = parseInt(response.data[i].seq) + 1;
                            htmlData += "<h4 class='card-title'>" + no + " : " + response.data[i].title + "</h4>";
                            htmlData += "<b class='fsBoxGame' set-lan='text:Start time_'></b>";

                            var date = new Date(response.data[i].startDate);
                            var txtStartDate;
                            if (response.data[i].startDate == "" || response.data[i].startDate == null) {
                                txtStartDate = "-";
                            }
                            else {
                                txtStartDate = ("0" + date.getDate()).slice(-2) + "/" + ("0" + (date.getMonth() + 1)).slice(-2) + "/" + date.getFullYear();
                            }
                            htmlData += "<label class='fsBoxGame'>" + txtStartDate + " " + response.data[i].startTime + "</label><br />";

                            htmlData += "<b class='fsBoxGame' set-lan='text:End time_'></b>";

                            var date2 = new Date(response.data[i].endDate);
                            var txtEndDate;
                            if (response.data[i].endDate == "" || response.data[i].endDate == null) {
                                txtEndDate = "-";
                            }
                            else {
                                txtEndDate = ("0" + date2.getDate()).slice(-2) + "/" + ("0" + (date2.getMonth() + 1)).slice(-2) + "/" + date2.getFullYear();
                            }
                            htmlData += "<label class='fsBoxGame'>" + txtEndDate + " " + response.data[i].endTime + "</label>";

                            htmlData += "<div class='row' style='float: right; margin-top: -5px;'>";
                            htmlData += "</div></div></div></div>";
                        }
                    }
                    else if (Position == "COMPANY") {
                        for (var i = 0; i < response.data.length; i++) {
                            var no = 0;
                            var txtID = "";
                            var start = response.data[i].startDate + "T" + response.data[i].startTime;
                            var end = response.data[i].endDate + "T" + response.data[i].endTime;

                            txtID = "status_" + response.data[i].seq;

                            htmlData += "<div class='col-lg-12 col-xl-3 ui-sortable-handle' data-id='" + response.data[i].id + "'><div class='card-sub'>";

                            if (Lan == "Thai") {
                                if (response.data[i].image.th != "") {
                                    htmlData += "<img class='card-img-top img-fluid' src='" + response.data[i].image.th + "' alt='Card image cap'>";
                                } else {
                                    htmlData += "<img class='card-img-top img-fluid' src='../img/noImage.jpg' alt='Card image cap'>";
                                }
                            }
                            else if (Lan == "English") {
                                if (response.data[i].image.en != "") {
                                    htmlData += "<img class='card-img-top img-fluid' src='" + response.data[i].image.en + "' alt='Card image cap'>";
                                } else {
                                    htmlData += "<img class='card-img-top img-fluid' src='../img/noImage.jpg' alt='Card image cap'>";
                                }
                            }
                            else if (Lan == "Chinese") {
                                if (response.data[i].image.ch != "") {
                                    htmlData += "<img class='card-img-top img-fluid' src='" + response.data[i].image.ch + "' alt='Card image cap'>";
                                } else {
                                    htmlData += "<img class='card-img-top img-fluid' src='../img/noImage.jpg' alt='Card image cap'>";
                                }
                            }

                            if (response.data[i].status == "ACTIVE") {
                                htmlData += "<div class='switch top-left'><label><input type='checkbox' id='" + txtID + "' onclick='chgStatus(`" + response.data[i].id + "`,`" + response.data[i].status + "`)' checked><span class='lever ml-0 edit'></span></label>";
                            }
                            else {
                                htmlData += "<div class='switch top-left'><label><input type='checkbox' id='" + txtID + "' onclick='chgStatus(`" + response.data[i].id + "`,`" + response.data[i].status + "`)'><span class='lever ml-0 edit'></span></label>";
                            }

                            htmlData += "</div>";
                            htmlData += "<div class='cardtitle'>";
                            no = parseInt(response.data[i].seq) + 1;
                            htmlData += "<h4 class='card-title'>" + no + " : " + response.data[i].title + "</h4>";
                            htmlData += "<b class='fsBoxGame' set-lan='text:Start time_'></b>";

                            var date = new Date(response.data[i].startDate);
                            var txtStartDate;
                            if (response.data[i].startDate == "" || response.data[i].startDate == null) {
                                txtStartDate = "-";
                            }
                            else {
                                txtStartDate = ("0" + date.getDate()).slice(-2) + "/" + ("0" + (date.getMonth() + 1)).slice(-2) + "/" + date.getFullYear();
                            }
                            htmlData += "<label class='fsBoxGame'>" + txtStartDate + " " + response.data[i].startTime + "</label><br />";

                            htmlData += "<b class='fsBoxGame' set-lan='text:End time_'></b>";

                            var date2 = new Date(response.data[i].endDate);
                            var txtEndDate;
                            if (response.data[i].endDate == "" || response.data[i].endDate == null) {
                                txtEndDate = "-";
                            }
                            else {
                                txtEndDate = ("0" + date2.getDate()).slice(-2) + "/" + ("0" + (date2.getMonth() + 1)).slice(-2) + "/" + date2.getFullYear();
                            }
                            htmlData += "<label class='fsBoxGame'>" + txtEndDate + " " + response.data[i].endTime + "</label>";

                            htmlData += "<div class='row' style='float: right; margin-top: -5px;'>";
                            htmlData += "<a class='iconCard edit' onclick='btnEdit(`" + response.data[i].id + "`,`" + response.data[i].title + "`,`" + response.data[i].content + "`,`" + response.data[i].image.th + "`,`" + response.data[i].image.en + "`,`" + response.data[i].image.ch + "`,`" + response.data[i].category + "`,`" + start + "`,`" + end + "`)' style='background-color: #00c851;'><i class='fas fa-pencil-alt' style='color: #fff;'></i></a>";
                            htmlData += "<a class='iconCard edit' onclick='btnDel(`" + response.data[i].id + "`)' style='background-color: #e14d5b;'><i class='fas fa-trash' style='color: #fff;'></i></a>";
                            htmlData += "</div></div></div></div>";
                        }
                    }

                    $("#sortableCompany").append(htmlData);
                }
                else {
                    document.getElementById("NoDataCompany").style.display = "block";
                }

                if (Status_Announcement == "VIEW") {
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

        const postAnnounceAgent = async () => {
            var Lan = localStorage.getItem("Language");
            $("#sortableAgent").html("");

            const parameter = {
                announcementType: "AGENT",
                page: 1,
                size: 100
            }
            const requestAwait = await fetchDataSite(`${apiURL}/v1/announcement/inquiry`, 'POST', "include", parameter)
            const response = await requestAwait.json()

            if (response.messageCode == 0000 || response.messageCode == null) {
                var htmlData = "";

                if (response.total != 0) {
                    for (var i = 0; i < response.data.length; i++) {
                        var no = 0;
                        var txtID = "";
                        var start = response.data[i].startDate + "T" + response.data[i].startTime;
                        var end = response.data[i].endDate + "T" + response.data[i].endTime;

                        txtID = "status_" + response.data[i].seq;

                        htmlData += "<div class='col-lg-12 col-xl-3 ui-sortable-handle' data-id='" + response.data[i].id + "'><div class='card-sub'>";

                        if (Lan == "Thai") {
                            if (response.data[i].image.th != "") {
                                htmlData += "<img class='card-img-top img-fluid' src='" + response.data[i].image.th + "' alt='Card image cap'>";
                            } else {
                                htmlData += "<img class='card-img-top img-fluid' src='../img/noImage.jpg' alt='Card image cap'>";
                            }
                        }
                        else if (Lan == "English") {
                            if (response.data[i].image.en != "") {
                                htmlData += "<img class='card-img-top img-fluid' src='" + response.data[i].image.en + "' alt='Card image cap'>";
                            } else {
                                htmlData += "<img class='card-img-top img-fluid' src='../img/noImage.jpg' alt='Card image cap'>";
                            }
                        }
                        else if (Lan == "Chinese") {
                            if (response.data[i].image.ch != "") {
                                htmlData += "<img class='card-img-top img-fluid' src='" + response.data[i].image.ch + "' alt='Card image cap'>";
                            } else {
                                htmlData += "<img class='card-img-top img-fluid' src='../img/noImage.jpg' alt='Card image cap'>";
                            }
                        }

                        if (response.data[i].status == "ACTIVE") {
                            htmlData += "<div class='switch top-left'><label><input type='checkbox' id='" + txtID + "' onclick='chgStatus(`" + response.data[i].id + "`,`" + response.data[i].status + "`)' checked><span class='lever ml-0 edit'></span></label>";
                        }
                        else {
                            htmlData += "<div class='switch top-left'><label><input type='checkbox' id='" + txtID + "' onclick='chgStatus(`" + response.data[i].id + "`,`" + response.data[i].status + "`)'><span class='lever ml-0 edit'></span></label>";
                        }

                        htmlData += "</div>";
                        htmlData += "<div class='cardtitle'>";
                        no = parseInt(response.data[i].seq) + 1;
                        htmlData += "<h4 class='card-title'>" + no + " : " + response.data[i].title + "</h4>";
                        htmlData += "<b class='fsBoxGame' set-lan='text:Start time_'></b>";

                        var date = new Date(response.data[i].startDate);
                        var txtStartDate;
                        if (response.data[i].startDate == "" || response.data[i].startDate == null) {
                            txtStartDate = "-";
                        }
                        else {
                            txtStartDate = ("0" + date.getDate()).slice(-2) + "/" + ("0" + (date.getMonth() + 1)).slice(-2) + "/" + date.getFullYear();
                        }
                        htmlData += "<label class='fsBoxGame'>" + txtStartDate + " " + response.data[i].startTime + "</label><br />";

                        htmlData += "<b class='fsBoxGame' set-lan='text:End time_'></b>";

                        var date2 = new Date(response.data[i].endDate);
                        var txtEndDate;
                        if (response.data[i].endDate == "" || response.data[i].endDate == null) {
                            txtEndDate = "-";
                        }
                        else {
                            txtEndDate = ("0" + date2.getDate()).slice(-2) + "/" + ("0" + (date2.getMonth() + 1)).slice(-2) + "/" + date2.getFullYear();
                        }
                        htmlData += "<label class='fsBoxGame'>" + txtEndDate + " " + response.data[i].endTime + "</label>";

                        htmlData += "<div class='row' style='float: right; margin-top: -5px;'>";
                        htmlData += "<a class='iconCard edit' onclick='btnEdit(`" + response.data[i].id + "`,`" + response.data[i].title + "`,`" + response.data[i].content + "`,`" + response.data[i].image.th + "`,`" + response.data[i].image.en + "`,`" + response.data[i].image.ch + "`,`" + response.data[i].category + "`,`" + start + "`,`" + end + "`)' style='background-color: #00c851;'><i class='fas fa-pencil-alt' style='color: #fff;'></i></a>";
                        htmlData += "<a class='iconCard edit' onclick='btnDel(`" + response.data[i].id + "`)' style='background-color: #e14d5b;'><i class='fas fa-trash' style='color: #fff;'></i></a>";
                        htmlData += "</div></div></div></div>";
                    }
                    $("#sortableAgent").append(htmlData);
                }
                else {
                    document.getElementById("NoDataAgent").style.display = "block";
                }

                if (Status_Announcement == "VIEW") {
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

        const postAddAnnounce = async (ImgTH, ImgEN, ImgCH) => {
            var start = $("#starttime").val();
            var end = $("#endtime").val();

            const parameter = {
                title: $('#title').val(),
                content: $('#content').val(),
                startDate: start.split('T')[0],
                startTime: start.split('T')[1],
                endDate: end.split('T')[0],
                endTime: end.split('T')[1],
                category: $("select#ddlCategory").val(),
                image: {
                    th: ImgTH,
                    en: ImgEN,
                    ch: ImgCH
                }
            }
            const requestAwait = await fetchDataSite(`${apiURL}/v1/announcement/create`, 'POST', "include", parameter)
            const response = await requestAwait.json()
            if (response.messageCode == 0000 || response.messageCode == null) {
                var TEN = response.data;
                if (TEN == null || TEN == "") {
                    document.getElementById("lbAlertSuccess").setAttribute("set-lan", "text:Add new announcement success");
                    SetLan(localStorage.getItem("Language"));
                    $("#myModalLoad").modal('hide');
                    $("#modalAnnouncement").modal('hide');
                    $('#modalAlertSuccess').modal();
                    setTimeout(function () {
                        window.location.href = "/Menu_Announcement/Announcements.aspx";
                    }, 1500);
                }
                else {
                    var txt = response.data.warning;
                    document.getElementById("lbAlertSuccess").setAttribute("set-lan", "text:Add new announcement success");
                    document.getElementById("lbAlertTEN").setAttribute("set-lan", "text:" + txt);
                    SetLan(localStorage.getItem("Language"));
                    $("#myModalLoad").modal('hide');
                    $("#modalAnnouncement").modal('hide');
                    $('#modalAlertSuccess').modal();
                    setTimeout(function () {
                        window.location.href = "/Menu_Announcement/Announcements.aspx";
                    }, 1500);
                }
            }
            else if (response.messageCode == 1502) {
                document.getElementById('Add').disabled = false;
                document.getElementById('lbAlert').setAttribute("set-lan", "text:" + response.messageDescription);
                SetLan(localStorage.getItem("Language"));
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

        const postSaveAnnounce = async (ImgTH, ImgEN, ImgCH) => {
            var start = $("#starttime").val();
            var end = $("#endtime").val();

            const parameter = {
                id: $('#ID').val(),
                title: $('#title').val(),
                content: $('#content').val(),
                startDate: start.split('T')[0],
                startTime: start.split('T')[1],
                endDate: end.split('T')[0],
                endTime: end.split('T')[1],
                category: $("select#ddlCategory").val(),
                image: {
                    th: ImgTH,
                    en: ImgEN,
                    ch: ImgCH
                }
            }

            const requestAwait = await fetchDataSite(`${apiURL}/v1/announcement/update`, 'POST', "include", parameter)
            const response = await requestAwait.json()
            if (response.messageCode == 0000 || response.messageCode == null) {
                document.getElementById("lbAlertSuccess").setAttribute("set-lan", "text:Edit announcement success");
                SetLan(localStorage.getItem("Language"));
                $("#myModalLoad").modal('hide');
                $("#modalAnnouncement").modal('hide');
                $('#modalAlertSuccess').modal();
                setTimeout(function () {
                    window.location.href = "/Menu_Announcement/Announcements.aspx";
                }, 1500);
            }
            else if (response.messageCode == 1502) {
                document.getElementById('lbAlert').setAttribute("set-lan", "text:" + response.messageDescription);
                SetLan(localStorage.getItem("Language"));
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

        const postSeq = async (Seq) => {
            const parameter = {
                ids: Seq
            }

            const requestAwait = await fetchDataSite(`${apiURL}/v1/announcement/update_seq`, 'POST', "include", parameter)
            const response = await requestAwait.json()
            if (response.messageCode == 0000 || response.messageCode == null) {
                document.getElementById("lbAlertSuccess").setAttribute("set-lan", "text:Change announcement success");
                SetLan(localStorage.getItem("Language"));
                $("#myModalLoad").modal('hide');
                $('#modalAlertSuccess').modal();
                setTimeout(function () {
                    window.location.href = "/Menu_Announcement/Announcements.aspx";
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

        const postAction = async (ID, Status) => {
            const parameter = {
                id: ID,
                status: Status
            }

            const requestAwait = await fetchDataSite(`${apiURL}/v1/announcement/update_status`, 'POST', "include", parameter)
            const response = await requestAwait.json()
            if (response.messageCode == 0000 || response.messageCode == null) {
                document.getElementById("lbAlertSuccess").setAttribute("set-lan", "text:Change announcement success");
                SetLan(localStorage.getItem("Language"));
                $("#myModalLoad").modal('hide');
                $('#modalAlertSuccess').modal();
                setTimeout(function () {
                    window.location.href = "/Menu_Announcement/Announcements.aspx";
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

            const requestAwait = await fetchDataSite(`${apiURL}/v1/announcement/delete`, 'POST', "include", parameter)
            const response = await requestAwait.json()
            if (response.messageCode == 0000 || response.messageCode == null) {
                document.getElementById("lbAlertSuccess").setAttribute("set-lan", "text:Delete announcement success");
                SetLan(localStorage.getItem("Language"));
                $("#myModalLoad").modal('hide');
                $("#modalDelete").modal('hide');
                $('#modalAlertSuccess').modal();
                setTimeout(function () {
                    window.location.href = "/Menu_Announcement/Announcements.aspx";
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

