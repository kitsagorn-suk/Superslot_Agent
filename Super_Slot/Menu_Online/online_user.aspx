<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="online_user.aspx.cs" Inherits="Pretty_Gaming.Menu_Online.online_user" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .overflow {
            width: 8.5em !important;
        }
    </style>
    <div class="row">
        <div class="col-md-8">
            <h1 set-lan="text:Online User"></h1>
        </div>
    </div>    
    <div class="table-wrapper" style="margin-bottom: 10px;">
        <table class="table table-border" id="tbData">
            <thead class="rgba-green-slight">
                <tr>
                    <th style="width: 5%;" set-lan="text:No"></th>
                    <th style='width: 17%; text-align: left; padding-left: 5px;' set-lan='text:Game Name'></th>
                    <th style='width: 17%; text-align: left; padding-left: 5px;' set-lan='text:Provider'></th>
                    <th style="width: 14%; text-align: right; padding-right: 5px;" set-lan="text:User Amount"></th>
                </tr>
            </thead>
            <tbody>
            </tbody>
            <tfoot class="rgba-yellow-slight">
                <tr class="total">
                    <td></td>
                    <td></td>
                    <td set-lan='text:Total'></td>
                    <td id="totalSum"></td>                 
                </tr>
            </tfoot>
        </table>
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
    <script type="text/javascript">
        $(document).ready(function () {
            getOnline();
            $("#menuOnlineUser , #menuOnlineUser > a").addClass("active");
            $("#menuOnlineUser > div").css("display", "block");
            $("#myModalLoad").modal();
        });

        function NewLine(str, maxLength) {
            var buff = "";
            var numOfLines = Math.floor(str.length / maxLength);
            for (var i = 0; i < numOfLines + 1; i++) {
                buff += str.substr(i * maxLength, maxLength); if (i !== numOfLines) { buff += "\n"; }
            }
            return buff;
        } 

        const getOnline = async () => {
            $("#tbData > tbody").html("");
            const requestAwait = await fetchDataSite(`${apiURL}/v1/online_user`, 'GET', "include", {})
            const response = await requestAwait.json()

            if (response.messageCode == 0000 || response.messageCode == null) {
                var Sum = response.data.sum;
                var htmlData = "";
                var no = 1;
                if (Sum != 0) {
                    for (var i = 0; i < response.data.data.length; i++) {
                        var obj = response.data.data[i];

                        htmlData += "<tr>";
                        htmlData += "<td class='aligncenter'>" + no + "</td>";
                        htmlData += "<td>" + obj.gameName + "</td>";
                        htmlData += "<td>" + obj.provider + "</td>";
                        htmlData += "<td class='alignright'>" + obj.count + "</td>";
                        htmlData += "</tr>";
                        no++;
                    }
                    $('#totalSum').text(Sum.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,'));
                    $("#tbData > tbody").append(htmlData);
                }
                else {
                    $('#totalSum').text("-");
                    $("#tbData > tbody").append("<tr><td colspan='4' style='text-align: center;' set-lan='text:No data.'></td></tr>");
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
    </script>
</asp:Content>
