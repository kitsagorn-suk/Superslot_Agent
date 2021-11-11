<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="tier.aspx.cs" Inherits="Pretty_Gaming.Menu_RedEnvelope.tier" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="" set-lan="text:Red Envelope"></a></li>
            <li class="breadcrumb-item active txtMem" set-lan="text:Tier"></li>
        </ol>
    </nav>
    <div class="row">
        <div class="col-md-8">
            <h1 set-lan="text:Tier"></h1>
        </div>
        <div class="col-md-4" style="text-align: right;" id="ZoneBtnAdd">
            <button id="btnAddAnnouncement" type="button" class="btn btn-yellow font-weight-bold" onclick="newTier('Add Tier')" set-lan="html:Add Tier_"></button>
            <button id="btnReOrder" type="button" class="btn btn-yellow font-weight-bold" onclick="getReOder('ReOrder');" set-lan="html:Reorder_"></button>
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
                    <th style='width: 5%; text-align: left; padding-left: 5px;' set-lan='text:Tier'></th>
                    <th style='width: 5%; text-align: left; padding-left: 5px;' set-lan='text:Opening Count'></th>
                    <%--<th style="width: 1%;" class="edit" set-lan="text:Action"></th>--%>
                </tr>
            </thead>
            <tbody></tbody>
            <tfoot class="rgba-yellow-slight">
                <tr class="total">
                    <td></td>
                    <td></td>
                    <td></td>
                    <%--<td class="edit"></td>--%>
                </tr>
            </tfoot>
        </table>
    </div>

    <%--modal--%>
    <div class="modal fade" id="modalTier" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header text-center">
                    <h4 class="modal-title w-100 font-weight-bold" id="txtHead"></h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body mx-3">
                    <div class="form-group row" style="display: none;">
                        <label for="ID" class="col-4 col-form-label" style="text-align: right;">ID :</label>
                        <div class="col-8">
                            <input type="text" class="form-control" id="ID" autocomplete="off" />
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="username" class="col-4 col-form-label" style="text-align: right;" set-lan="html:Opening Count-"></label>
                        <div class="col-8">
                            <input type="text" id="Opening" class="form-control" autocomplete="off" oninput="this.value=this.value.replace(/[^0-9]/g, '').replace(/(\..*)\./g, '$1');" />
                            <small class="text-muted form-text" set-lan="text:numberonly"></small>
                        </div>
                    </div>
                </div>
                <div class="modal-footer d-flex justify-content-center">
                    <button class="btn btn-yellow font-weight-bold" type="button" id="Add" onclick="btnSave('Add');" set-lan="text:Add Tier"></button>
                    <button class="btn btn-yellow font-weight-bold" type="button" id="Save" onclick="btnSave('Save');" set-lan="text:Save"></button>
                    <button type="button" class="btn btn-yellow font-weight-bold" data-dismiss="modal" aria-label="Close" set-lan="text:Cancel"></button>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="modalDelete" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content" style="width: 70% !important;">
                <div class="modal-header text-center">
                    <h4 class="modal-title w-100 font-weight-bold" set-lan="text:Delete tier"></h4>
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
                    <button class="btn btn-yellow font-weight-bold" type="button" id="Delete" onclick="postDelete();" set-lan="text:Delete"></button>
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
        var ID_DEL = "";
        var Status_RandomJackpot = localStorage.getItem("Status_RandomJackpot");

        $(document).ready(function () {
            $("#menuRedEnvelope , #menuRedEnvelope > a").addClass("active");
            $("#menuRedEnvelope > div").css("display", "block");

            //if (Status_RandomJackpot == "VIEW") {
            document.getElementById("ZoneBtnAdd").style.display = "none";
            $('.edit , .colEdit').css('display', 'none');
            //}
            //else {
            //    $('.edit , .colEdit').css('display', 'table-cell');
            //}

            getTier();
            $("#myModalLoad").modal();
            SetLan(localStorage.getItem("Language"));
        });

        function newTier(type) {
            document.getElementById('Add').disabled = false;
            document.getElementById("Add").style.display = "block";
            document.getElementById("Save").style.display = "none";
            document.getElementById("txtHead").setAttribute("set-lan", "text:" + type);
            $('#Opening').val("");

            SetLan(localStorage.getItem("Language"));
            $("#modalTier").modal();
        }

        function btnSave(status) {
            var Opening = $('#Opening').val();

            if (Opening == "" || Opening == null) {
                document.getElementById("lbAlert").setAttribute("set-lan", "text:missing 'Opening Count' field");
                SetLan(localStorage.getItem("Language"));
                $('#modalAlert').modal('show');
                $("#myModalLoad").modal('hide');
            }
            else {
                if (status == "Add") {
                    postAdd();
                }
                else if (status == "Save") {
                    postEdit();
                }
            }
        }

        function btnEdit(ID, Tier, OpeningCount) {
            document.getElementById("Add").style.display = "none";
            document.getElementById("Save").style.display = "block";
            document.getElementById("txtHead").setAttribute("set-lan", "text:Edit Tier");

            $('#ID').val(ID);
            $('#Opening').val(OpeningCount);

            SetLan(localStorage.getItem("Language"));
            $("#modalTier").modal();
        }

        function btnDel(ID) {
            ID_DEL = ID;
            $("#modalDelete").modal();
        }

        const getTier = async () => {
            const requestAwait = await fetchDataSite(`${apiURL}/v1/randomJackpot/get/tier`, 'GET', "include", {})
            const response = await requestAwait.json()
            if (response.messageCode == 0000 || response.messageCode == null) {
                $("#tbData > tbody").html("");
                var htmlData = "";
                var no = 1;

                if (response.data != null) {
                    for (var i = 0; i < response.data.length; i++) {
                        var obj = response.data[i];
                        var OpenCount = obj.openingCount;
                        OpenCount = OpenCount.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1,");

                        htmlData += "<tr>";
                        htmlData += "<td style='width: 1%;' class='aligncenter'>" + no + "</td>";
                        htmlData += "<td>" + obj.tier + "</td>";
                        htmlData += "<td>" + OpenCount + "</td>";
                        //htmlData += "<td style='width: 1%;' class='aligncenter colEdit zonenone'><a class='link' onclick='btnEdit(`" + obj.id + "`,`" + obj.tier + "`,`" + obj.openingCount + "`)'><i class='fas fa-pencil-alt'></i></a><a class='link' style='margin-left: 1rem;' onclick='btnDel(\"" + obj.id + "\");'><i class='fas fa-trash'></i></a></td>";
                        htmlData += "</tr>";
                        no++;
                    }
                    $("#tbData > tbody").append(htmlData);
                }
                else {
                    $("#tbData > tbody").append("<tr><td colspan='4' style='text-align: center;' set-lan='text:No data.'></td></tr>");
                }

                //if (Status_RandomJackpot == "VIEW") {
                document.getElementById("ZoneBtnAdd").style.display = "none";
                $('.edit , .colEdit').css('display', 'none');
                //}
                //else {
                //    $('.edit , .colEdit').css('display', 'table-cell');
                //}

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

        const getReOder = async (status) => {
            const requestAwait = await fetchDataSite(`${apiURL}/v1/randomJackpot/reorder/tier`, 'GET', "include", {})
            const response = await requestAwait.json()

            if (response.messageCode == 0000 || response.messageCode == null) {
                if (status == "ReOrder") {
                    document.getElementById("lbAlertSuccess").setAttribute("set-lan", "text:Reorder success");
                    SetLan(localStorage.getItem("Language"));
                    $("#myModalLoad").modal('hide');
                    $("#modalAnnouncement").modal('hide');
                    $('#modalAlertSuccess').modal();
                }

                setTimeout(function () {
                    window.location.href = "/Menu_RedEnvelope/tier.aspx";
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

        const postAdd = async () => {
            var Open = $('#Opening').val();
            const parameter = [parseInt(Open)];
            const requestAwait = await fetchDataSite(`${apiURL}/v1/randomJackpot/add/tiers`, 'POST', "include", parameter)
            const response = await requestAwait.json()

            if (response.messageCode == 0000 || response.messageCode == null) {
                document.getElementById("lbAlertSuccess").setAttribute("set-lan", "text:Add new tier success");
                SetLan(localStorage.getItem("Language"));
                $("#myModalLoad").modal('hide');
                $("#modalAnnouncement").modal('hide');
                $('#modalAlertSuccess').modal();
                getReOder();
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

        const postEdit = async () => {
            const parameter = {
                id: $('#ID').val(),
                openingCount: parseInt($('#Opening').val())
            }
            const requestAwait = await fetchDataSite(`${apiURL}/v1/randomJackpot/edit/tier`, 'POST', "include", parameter)
            const response = await requestAwait.json()

            if (response.messageCode == 0000 || response.messageCode == null) {
                document.getElementById("lbAlertSuccess").setAttribute("set-lan", "text:Edit tier success");
                SetLan(localStorage.getItem("Language"));
                $("#myModalLoad").modal('hide');
                $("#modalAnnouncement").modal('hide');
                $('#modalAlertSuccess').modal();
                getReOder();
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
            const requestAwait = await fetchDataSite(`${apiURL}/v1/randomJackpot/delete/tier`, 'POST', "include", parameter)
            const response = await requestAwait.json()

            if (response.messageCode == 0000 || response.messageCode == null) {
                document.getElementById("lbAlertSuccess").setAttribute("set-lan", "text:Delete tier success");
                SetLan(localStorage.getItem("Language"));
                $("#myModalLoad").modal('hide');
                $("#modalDelete").modal('hide');
                $('#modalAlertSuccess').modal();
                getReOder();
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

