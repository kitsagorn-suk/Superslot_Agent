<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="provider_id.aspx.cs" Inherits="Pretty_Gaming.Menu_MemberManagement.provider_id" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="" set-lan="text:Management"></a></li>
            <li class="breadcrumb-item active" set-lan="text:Provider ID"></li>
        </ol>
    </nav>
    <h1 class="txtHead" set-lan="text:Provider ID"></h1>
    <div class="btn-toolbar section-group" role="toolbar" style="padding-bottom: 0px !important;">
        <div class="form-group row" style="padding-left: 1rem;">
            <label for="email" class="col-form-label" set-lan="text:Username_"></label>
            <div style="padding-left: 1rem;">
                <input type="text" class="form-control" id="searchLoginname" onkeypress="Key_Enter(event)">
            </div>
        </div>
        <div class="form-group row" style="padding-left: 2rem;">
            <button class="btn btn-yellow font-weight-bold m-0 px-3 py-2 z-depth-0 waves-effect btnMenu" type="button" set-lan="text:Search" onclick="Search_Click()" id="btnSearch"></button>
        </div>
    </div>
    <div id="zonePlsSearch" class="btn-toolbar section-group" role="toolbar" style="margin-top: 1rem; padding-top: 2rem; font-weight: bold; background-color: #dee2e6;">
        <p class="col-12" style="text-align: center; color: #333;" set-lan="text:Please enter search."></p>
    </div>
    <div class="row" id="ZoneBalance" style="display: none;">
        <div class="col-md-8" style="padding-top: 1.4rem;"><b set-lan="text:Member Balance_"></b>&nbsp;<b style="color: #007bff;" id="txtCredit">-</b></div>
    </div>
    <div class="table-wrapper" style="margin-bottom: 10px; padding-top: 1.4rem;">
        <table class="table table-border" id="tbData" style="display: none;">
            <thead class="rgba-green-slight">
                <tr>
                    <th style="width: 5%;" set-lan="text:No"></th>
                    <th set-lan="text:Provider"></th>
                    <th set-lan="text:ID"></th>
                    <th set-lan="text:Detail"></th>
                    <th set-lan="text:Action"></th>
                </tr>
            </thead>
            <tbody></tbody>
            <tfoot class="rgba-yellow-slight">
                <tr class="total">
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
    <div class="modal fade" id="ModalCoin" tabindex="-1" role="dialog" aria-labelledby="ModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header text-center">
                    <h4 class="modal-title w-100 font-weight-bold" set-lan="text:Sending Data List"></h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true" style="color: #cfa137;">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="form-group col-12">
                        <label set-lan="text:Are you sure that you are sending data list items?"></label>
                    </div>
                </div>
                <div class="modal-footer d-flex justify-content-center">
                    <button type="button" class="btn btn-yellow font-weight-bold waves-effect waves-light" onclick="Coin_Send()" id="btnCoin" set-lan="text:OK"></button>
                    <button type="button" class="btn btn-yellow font-weight-bold waves-effect waves-light" data-dismiss="modal" set-lan="text:Cancel"></button>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="ModalModify" tabindex="-1" role="dialog" aria-labelledby="ModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header text-center">
                    <h4 class="modal-title w-100 font-weight-bold" set-lan="text:Sending Data List"></h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true" style="color: #cfa137;">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="form-group col-12">
                        <label set-lan="text:Are you sure that you are sending data list items?"></label>
                    </div>
                </div>
                <div class="modal-footer d-flex justify-content-center">
                    <button type="button" class="btn btn-yellow font-weight-bold waves-effect waves-light" onclick="Sending()" id="btnDelete" set-lan="text:OK"></button>
                    <button type="button" class="btn btn-yellow font-weight-bold waves-effect waves-light" data-dismiss="modal" set-lan="text:Cancel"></button>
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
                    <label id="lbAlertSuccess"></label>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainScript" runat="server">
    <script type="text/javascript">
        var Sending_Code, Sending_ID, Coin_Code, Coin_ID;
        var Check_Enter = "";

        $(document).ready(function () {
            if (localStorage.getItem("Position") != "SUPPORT") {
                $("#menuMemberManage , #menuMemberManage > a").addClass("active");
                $("#menuMemberManage > div").css("display", "block");
            }
            else {
                $("#menuMemberManageSup , #menuMemberManageSup > a").addClass("active");
                $("#menuMemberManageSup > div").css("display", "block");
            }

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

        function Key_Enter(event) {
            var x = event.which || event.keyCode;
            if (x == 13) {
                Check_Enter = "Enter";
                event.preventDefault()
                Search_Click();
            }
        }

        function Search_Click() {
            $("#myModalLoad").modal();
            console.log($('#searchLoginname').val());
            if ($('#searchLoginname').val() == "" || $('#searchLoginname').val() == null) {
                document.getElementById("lbAlert").setAttribute("set-lan", "text:missing 'Username' field");
                document.getElementById("zonePlsSearch").style.display = "";
                document.getElementById("tbData").style.display = "none";
                document.getElementById("ZoneBalance").style.display = "none";
                $("#myModalLoad").modal('hide');
                $('#modalAlert').modal('show');
            } else {
                postProviderID();
            }

            SetLan(localStorage.getItem("Language"));
        }

        function Modify(code, id) {
            $("#ModalModify").modal();
            Sending_Code = code;
            Sending_ID = id;
        }

        function Coin_Modify(code, id) {
            $("#ModalCoin").modal();
            Coin_Code = code;
            Coin_ID = id;
        }

        const postProviderID = async () => {
            $("#myModalLoad").modal();
            $("#tbData > tbody").html("");
            const parameter = {
                username: $('#searchLoginname').val(),
            }
            const requestAwait = await fetchDataSite(`${apiURL}/v1/user/provider`, 'POST', "include", parameter)
            const response = await requestAwait.json()

            if (response.messageCode == 0000 || response.messageCode == null) {
                var htmlData = "";
                if (response.data.providers != 0) {
                    var no = 1;

                    for (var i = 0; i < response.data.providers.length; i++) {
                        var obj = response.data.providers[i];
                        var TextBal = "";
                        var TextOut = "";
                        var BalVal = obj.balance;
                        var OutVal = obj.outstanding;

                        if (BalVal == 0) {
                            TextBal = "<b set-lan='text:Balance'></b>: <span id='Balance_" + obj.id + "'>" + BalVal + "</span>";
                        }
                        else if (BalVal > 0) {
                            BalVal = BalVal.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1,");
                            TextBal = "<b set-lan='text:Balance'></b>: <span id='Balance_" + obj.id + "' style='color: #007bff;'>" + BalVal + "</span>";
                        }
                        else if (BalVal == "" || BalVal == null || BalVal < 0) {
                            if (BalVal < 0) {
                                BalVal = BalVal.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1,");
                            }
                            TextBal = "<b set-lan='text:Balance'></b>: <span id='Balance_" + obj.id + "' style='color: #E84D4D;'>" + BalVal + "</span>";
                        }
                        else {
                            TextBal = "<b set-lan='text:Balance'></b>: <span id='Balance_" + obj.id + "'>" + BalVal + "</span>";
                        }

                        if (OutVal == 0) {
                            TextOut = "<b set-lan='text:Outstanding'></b>: <span id='Outstanding_" + obj.id + "'>" + OutVal + "</span>";
                        }
                        else if (OutVal > 0) {
                            OutVal = OutVal.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1,");
                            TextOut = "<b set-lan='text:Outstanding'></b>: <span id='Outstanding_" + obj.id + "' style='color: #007bff;'>" + OutVal + "</span>";
                        }
                        else if (OutVal == "" || OutVal == null || OutVal < 0) {
                            if (OutVal < 0) {
                                OutVal = OutVal.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1,");
                            }
                            TextOut = "<b set-lan='text:Outstanding'></b>: <span id='Outstanding_" + obj.id + "' style='color: #E84D4D;'>" + OutVal + "</span>";
                        }
                        else {
                            TextOut = "<b set-lan='text:Outstanding'></b>: <span id='Outstanding_" + obj.id + "'>" + OutVal + "</span>";
                        }

                        htmlData += "<tr>";
                        htmlData += "<td class='aligncenter'>" + no + "</td>";
                        htmlData += "<td>" + obj.provider + " (" + obj.code + ")</td>";
                        htmlData += "<td>" + obj.id + "</td>";
                        htmlData += "<td>" + TextBal + "<br>" + TextOut + "</td>";
                        htmlData += "<td style='text-align: center;'><a class='link' data-toggle='modal' onclick='Modify(`" + obj.code + "`,`" + obj.id + "`)'><i class='fas fa-chevron-right'></i></a>" +
                            "<a class='link' data-toggle='modal' onclick='Coin_Modify(`" + obj.code + "`,`" + obj.id + "`)' style='margin-left: 1rem;'><i class='fas fa-coins'></i></a></td>";
                        htmlData += "</tr>";
                        no++;
                    }
                    $("#tbData > tbody").append(htmlData);
                }
                else {
                    $("#tbData > tbody").append("<tr><td colspan='5' style='text-align: center;' set-lan='text:No data.'></td></tr>");
                }
                $("#txtCredit").text(response.data.memberBalance.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1,"));
                document.getElementById("zonePlsSearch").style.display = "none";
                document.getElementById("tbData").style.display = "";
                document.getElementById("ZoneBalance").style.display = "";
                SetLan(localStorage.getItem("Language"));
                $("#myModalLoad").modal('hide');
            }
            else if (response.messageCode == 1300) {
                $("#txtCredit").text("-");
                $("#tbData > tbody").append("<tr><td colspan='5' style='text-align: center;' set-lan='text:No data.'></td></tr>");
                document.getElementById("zonePlsSearch").style.display = "none";
                document.getElementById("tbData").style.display = "";
                document.getElementById("ZoneBalance").style.display = "";
                SetLan(localStorage.getItem("Language"));
                $("#myModalLoad").modal('hide');
            }
            else if (response.messageCode == 1102) {
                document.getElementById("lbAlert").setAttribute("set-lan", "text:missing 'Username' field");
                document.getElementById("zonePlsSearch").style.display = "";
                document.getElementById("tbData").style.display = "none";
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
            SetLan(localStorage.getItem("Language"));
        }

        const Sending = async () => {
            const parameter = {
                providerID: Sending_ID,
                provider: Sending_Code
            }
            const requestAwait = await fetchDataSite(`${apiURL}/v1/user/balanceByProviderIDHandler`, 'POST', "include", parameter)
            const response = await requestAwait.json()

            if (response.messageCode == 0000 || response.messageCode == null) {
                var BalVal = response.data.balance;
                var OutVal = response.data.outstanding;

                if (BalVal == 0) {
                    document.getElementById("Balance_" + Sending_ID).style.color = "#333";
                }
                else if (BalVal > 0) {
                    BalVal = BalVal.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1,");
                    document.getElementById("Balance_" + Sending_ID).style.color = "#007bff";
                }
                else if (BalVal == "" || BalVal == null || BalVal < 0) {
                    if (BalVal < 0) {
                        BalVal = BalVal.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1,");
                    }
                    document.getElementById("Balance_" + Sending_ID).style.color = "#E84D4D";
                }
                else {
                    document.getElementById("Balance_" + Sending_ID).style.color = "#333";
                }

                if (OutVal == 0) {
                    document.getElementById("Outstanding_" + Sending_ID).style.color = "#333";
                }
                else if (OutVal > 0) {
                    OutVal = OutVal.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1,");
                    document.getElementById("Outstanding_" + Sending_ID).style.color = "#007bff";
                }
                else if (OutVal == "" || OutVal == null || OutVal < 0) {
                    if (OutVal < 0) {
                        OutVal = OutVal.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1,");
                    }
                    document.getElementById("Outstanding_" + Sending_ID).style.color = "#E84D4D";
                }
                else {
                    document.getElementById("Outstanding_" + Sending_ID).style.color = "#333";
                }

                document.getElementById("Balance_" + Sending_ID).innerHTML = BalVal;
                document.getElementById("Outstanding_" + Sending_ID).innerHTML = OutVal;
                document.getElementById("lbAlertSuccess").setAttribute("set-lan", "text:sending data list success");

                SetLan(localStorage.getItem("Language"));
                $("#ModalModify").modal('hide');
                $("#myModalLoad").modal('hide');
                $('#modalAlertSuccess').modal();

                setTimeout(function () {
                    $('#modalAlertSuccess').modal('hide');
                }, 1500);
            }
            else if (response.messageCode == 9901) {
                document.getElementById("lbAlert").setAttribute("set-lan", "text:Can not be verified");
                SetLan(localStorage.getItem("Language"));
                $('#modalAlert').modal('show');
                $("#myModalLoad").modal('hide');
                $("#ModalModify").modal('hide');
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

        const Coin_Send = async () => {
            const parameter = {
                providerID: Coin_ID,
                provider: Coin_Code
            }
            const requestAwait = await fetchDataSite(`${apiURL}/v1/user/pullBalanceByProviderIDHandler`, 'POST', "include", parameter)
            const response = await requestAwait.json()

            if (response.messageCode == 0000 || response.messageCode == null) {
                var text = "";
                if (response.messageDescription == "success") {
                    text = "Success";
                }
                else {
                    text = "FAILED";
                }
                document.getElementById("lbAlert").setAttribute("set-lan", "text:" + text);
                SetLan(localStorage.getItem("Language"));
                $('#modalAlert').modal('show');
                $("#myModalLoad").modal('hide');
                $("#ModalCoin").modal('hide');

                setTimeout(function () {
                    $('#modalAlert').modal('hide');
                }, 1500);
            }
            else if (response.messageCode == 9901) {
                document.getElementById("lbAlert").setAttribute("set-lan", "text:Can not be verified");
                SetLan(localStorage.getItem("Language"));
                $('#modalAlert').modal('show');
                $("#myModalLoad").modal('hide');
                $("#ModalModify").modal('hide');
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
