<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Game.aspx.cs" Inherits="Pretty_Gaming.Menu_Marketing.Game" %>


<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="" set-lan="text:Marketing Tools"></a></li>
            <li class="breadcrumb-item active txtMem" set-lan="text:Game"></li>
        </ol>
    </nav>
    <div class="row">
        <div class="col-md-8">
            <h1 set-lan="text:Game"></h1>
        </div>
        <div class="col-md-4" style="text-align: right;">
            <button id="btnAddMission" type="button" class="btn btn-yellow font-weight-bold" onclick="Download()" set-lan="html:Download_"></button>
        </div>
    </div>
    <div class="btn-toolbar section-group" role="toolbar" style="padding-bottom: 0px !important;">
        <div class="row col-md-12">
            <div class="form-group row" style="padding-left: 1rem;">
                <label for="email" class="col-form-label" set-lan="text:Game Name_"></label>
                <div style="padding-left: 1rem;">
                    <input type="text" class="form-control" id="searchGameName" onkeypress="Key_Enter(event)">
                </div>
            </div>
            <div class="form-group row" style="padding-left: 2rem;">
                <label for="email" class="col-form-label" set-lan="text:Provider_"></label>
                <div style="padding-left: 1rem;">
                    <div class="select-outline">
                        <select id="selProvider" class="mdb-select" name="LselPro">
                            <option value="" set-lan="text:All"></option>
                        </select>
                    </div>
                </div>
            </div>
            <div class="form-group row" style="padding-left: 2rem;">
                <label for="email" class="col-form-label" set-lan="text:Game Type_"></label>
                <div style="padding-left: 1rem;">
                    <div class="select-outline">
                        <select id="selGameType" class="mdb-select" name="LselGame">
                            <option value="" set-lan="text:All"></option>
                        </select>
                    </div>
                </div>
            </div>

            <%--Don't Delete!--%>
            <div class="row" style="padding-left: 2.5rem; display: none;">
                <label for="DontDelete" class="col-form-label alignright">Don't Delete!</label>
                <div style="padding-left: 1rem;" class="select-outline">
                    <select class="mdb-select" id="DontDelete">
                        <option value="0" disabled selected></option>
                    </select>
                </div>
            </div>
            <%--Don't Delete!--%>

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
                    <th style="width: 8%;">
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" value="Slip_1" onclick="toggle(this, `ImgSlip1`)" id="MultiSlip_1"><label class="form-check-label" for="MultiSlip_1" set-lan="text:Select all"></label>
                        </div>
                    </th>
                    <th style="width: 1%;" set-lan="text:No"></th>
                    <th style='width: 10%; text-align: left; padding-left: 5px;' set-lan='text:Provider'></th>
                    <th style='width: 10%; text-align: left; padding-left: 5px;' set-lan='text:Game Type'></th>
                    <th style='width: 10%; text-align: left; padding-left: 5px;' set-lan='text:Game Name'></th>
                    <th style="width: 15%;" set-lan="text:Image"></th>
                    <th style="width: 15%;" set-lan="text:Image"></th>
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
                </tr>
            </tfoot>
        </table>
    </div>

    <%--modal--%>
    <div class="modal fade" id="modalDownload" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content" style="width: 70% !important;">
                <div class="modal-header text-center">
                    <h4 class="modal-title w-100 font-weight-bold" set-lan="text:Download"></h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body mx-3">
                    <div class="form-group row">
                        <label for="ID" class="col-12 col-form-label" style="text-align: center;" set-lan="text:Are you sure you want to download this item?"></label>
                    </div>
                </div>
                <div class="modal-footer d-flex justify-content-center">
                    <button class="btn btn-yellow font-weight-bold" type="button" onclick="postDownload();" set-lan="text:Download"></button>
                    <button type="button" class="btn btn-yellow font-weight-bold" data-dismiss="modal" aria-label="Close" set-lan="text:Cancel"></button>
                </div>
            </div>
        </div>
    </div>
    <%--modal--%>
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

    <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.2.0/jszip.min.js"></script>

    <script>
        var Status_MarketingTools = localStorage.getItem("Status_MarketingTools");
        var Check_Enter = "";
        var arrData = ["6094bdd4d23909a7d1708c8c", "609907389f28b026175c3940"];

        $(document).ready(function () {
            getProvider();
            getGameType();

            $("#menuMarketing , #menuMarketing > a").addClass("active");
            $("#menuMarketing > div").css("display", "block");

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

        function toggle(source, ID) {
            var AA = ID.toString();
            checkboxes = document.getElementsByName(AA);
            for (var i = 0, n = checkboxes.length; i < n; i++) {
                checkboxes[i].checked = source.checked;
            }
        }

        function Download() {
            $('input[name="ImgSlip1"]:checked').each(function () {
                arrData.push(this.value);
            });

            console.log(arrData);

            if (arrData == "") {
                document.getElementById("lbAlert").setAttribute("set-lan", "text:Please select 'Data'");
                $("#myModalLoad").modal('hide');
                $('#modalAlert').modal('show');
                SetLan(localStorage.getItem("Language"));
            }
            else {
                $("#modalDownload").modal();
            }
        }

        function Key_Enter(event) {
            var x = event.which || event.keyCode;
            if (x == 13) {
                Check_Enter = "Enter";
                event.preventDefault()
                Search_Click();
            }
        }

        function Search_Click() {
            NumPage = 0;
            GetData();
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
                                postPage(num);
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

            var Provider = $('#selProvider').val();
            var GameType = $('#selGameType').val();

            const parameter = {
                gameName: $('#searchGameName').val(),
                provider: Provider,
                gameType: GameType,
                page: num,
                size: 100
            }
            const requestAwait = await fetchDataSite(`${apiURL}/v1/marketing/getGame`, 'POST', "include", parameter)
            const response = await requestAwait.json()

            if (response.messageCode == 0000 || response.messageCode == null) {
                TotalData = response.total;
                GetNumPage(num);

                if (NumPage == 0) {
                    $("#tbData > tbody").html("");
                    var htmlData = "";
                    if (response.total != 0) {
                        var no = 1;

                        for (var i = 0; i < response.data.length; i++) {
                            var obj = response.data[i];

                            htmlData += "<tr>";
                            htmlData += "<td style='text-align: center;'><div class='custom-control custom-checkbox' style='margin-left: 0.5rem;'><input type='checkbox' class='custom-control-input' id='" + obj.id + "' name='ImgSlip1' value='" + obj.id + "'><label class='custom-control-label' for='" + obj.id + "'></label></div></td>";
                            htmlData += "<td class='aligncenter'>" + (((num - 1) * 100) + no) + "</td>";
                            htmlData += "<td>" + obj.provider + "</td>";
                            htmlData += "<td>" + obj.gameType + "</td>";
                            htmlData += "<td>" + obj.gameName + "</td>";
                            htmlData += "<td style='text-align: center;'><img src='" + obj.image + "' style='height: 100px;'></td>";
                            htmlData += "<td style='text-align: center;'><img src='" + obj.recommendImage + "' style='height: 100px;'></td>";
                            htmlData += "</tr>";
                            no++;
                        }

                        $("#tbData > tbody").append(htmlData);
                    }
                    else {
                        $("#tbData > tbody").append("<tr><td colspan='6' style='text-align: center;' set-lan='text:No data.'></td></tr>");
                    }

                    $('#selProvider option').removeAttr('selected');
                    $("#selProvider option[value='" + Provider + "']").attr("selected", "selected");
                    $('#selGameType option').removeAttr('selected');
                    $("#selGameType option[value='" + GameType + "']").attr("selected", "selected");

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

        const postPage = async (num) => {
            $("#tbData > tbody").html("");

            var Provider = $('#selProvider').val();
            var GameType = $('#selGameType').val();
            const parameterPage = {
                gameName: $('#searchGameName').val(),
                provider: Provider,
                gameType: GameType,
                page: num,
                size: 100
            }
            const requestAwait = await fetchDataSite(`${apiURL}/v1/marketing/getGame`, 'POST', "include", parameterPage)
            const response = await requestAwait.json()

            if (response.messageCode == 0000 || response.messageCode == null) {
                var htmlData = "";
                if (response.total != 0) {
                    var no = 1;

                    for (var i = 0; i < response.data.length; i++) {
                        var obj = response.data[i];

                        htmlData += "<tr>";
                        htmlData += "<td style='text-align: center;'><div class='custom-control custom-checkbox' style='margin-left: 0.5rem;'><input type='checkbox' class='custom-control-input' id='" + obj.id + "' name='ImgSlip1' value='" + obj.id + "'><label class='custom-control-label' for='" + obj.id + "'></label></div></td>";
                        htmlData += "<td class='aligncenter'>" + (((num - 1) * 100) + no) + "</td>";
                        htmlData += "<td>" + obj.provider + "</td>";
                        htmlData += "<td>" + obj.gameType + "</td>";
                        htmlData += "<td>" + obj.gameName + "</td>";
                        htmlData += "<td style='text-align: center;'><img src='" + obj.image + "' style='height: 100px;'></td>";
                        htmlData += "<td style='text-align: center;'><img src='" + obj.recommendImage + "' style='height: 100px;'></td>";
                        htmlData += "</tr>";
                        no++;
                    }

                    $("#tbData > tbody").append(htmlData);
                }
                else {
                    $("#tbData > tbody").append("<tr><td colspan='6' style='text-align: center;' set-lan='text:No data.'></td></tr>");
                }

                $('#selProvider option').removeAttr('selected');
                $("#selProvider option[value='" + Provider + "']").attr("selected", "selected");
                $('#selGameType option').removeAttr('selected');
                $("#selGameType option[value='" + GameType + "']").attr("selected", "selected");

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

        const getProvider = async () => {
            const requestAwait = await fetchDataSite(`${apiURL}/v1/marketing/provider`, 'GET', "include", {})
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

        const getGameType = async () => {
            const requestAwait = await fetchDataSite(`${apiURL}/v1/marketing/gameType`, 'GET', "include", {})
            const response = await requestAwait.json()
            if (response.messageCode == 0000 || response.messageCode == null) {
                if (response.data.length != 0) {
                    var select = document.getElementById('selGameType');
                    for (var i = 0; i < response.data.length; i++) {
                        var opt = document.createElement('option');
                        opt.value = response.data[i].Code;
                        opt.innerHTML = response.data[i].Code;
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

        const postDownload = async () => {
            const parameter = {
                gameIDs: arrData
            }
            const response = await axios.post('${apiURL}/v1/marketing/download', 'POST', "include", parameter, {
                responseType: 'blob'
            });

            var zip = new JSZip();
            zip.loadAsync(response.data).then(function (contents) {
                console.log(Object.keys(contents.files));
                contents.files["jquery-ui-1.12.1/AUTHORS.txt"].async("string").then(function (data) {
                    console.log(data);
                });
            });
        }

    </script>
</asp:Content>
