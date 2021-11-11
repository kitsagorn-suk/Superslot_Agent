<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="feedback.aspx.cs" Inherits="Pretty_Gaming.Menu_Feedback.feedback" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .overflow {
            width: 8.5em !important;
        }
    </style>
    <div class="row">
        <div class="col-md-8">
            <h1 set-lan="text:Feedback"></h1>
        </div>
    </div>
    <div class="btn-toolbar section-group" role="toolbar" style="padding-bottom: 0px !important;">
        <div class="form-group row" style="padding-left: 1rem;">
            <label for="email" class="col-form-label" set-lan="text:WhiteLabel_"></label>
            <div style="padding-left: 1rem;">
                <input type="text" class="form-control" id="searchLoginname" onkeypress="Key_Enter(event)">
            </div>
        </div>
        <div class="form-group row" style="padding-left: 2rem;">
            <button class="btn btn-yellow font-weight-bold m-0 px-3 py-2 z-depth-0 waves-effect btnMenu" type="button" set-lan="text:Search" onclick="Search_Click()"></button>
        </div>
    </div>
    <div class="table-wrapper" style="margin-bottom: 10px; margin-top: 50px;">
        <section style="float: right; margin-top: -2.2rem;">
            <div class="data-container"></div>
            <div id="pagination-demo2"></div>
        </section>
        <table class="table table-border" id="tbData">
            <thead class="rgba-green-slight">
                <tr>
                    <th style="width: 20%;" set-lan="text:Date"></th>
                    <th style='width: 14%; text-align: left; padding-left: 5px;' set-lan='text:WhiteLabel'></th>
                    <th style='width: 17%; text-align: left; padding-left: 5px;' set-lan='text:Type Feedback'></th>
                    <th style="width: 14%; text-align: left; padding-left: 5px;" set-lan="text:Username"></th>
                    <th style="width: 14%;" set-lan="text:Phone"></th>
                    <th style="width: 40%;" set-lan="text:Description"></th>
                    <th style="width: 14%;" set-lan="text:IP address"></th>
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
        var Check_Enter = "";

        $(document).ready(function () {
            $("#menuFeedback , #menuFeedback > a").addClass("active");
            $("#menuFeedback > div").css("display", "block");

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
            GetData();
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
            NumPage = 0;
            GetData();
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
                                postSubData(num);
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

            const parameter = {
                parentUsername: $('#searchLoginname').val(),
                page: num,
                size: 100
            }
            const requestAwait = await fetchDataSite(`${apiURL}/v1/feedback/inquiry`, 'POST', "include", parameter)
            const response = await requestAwait.json()

            if (response.messageCode == 0000 || response.messageCode == null) {
                TotalData = response.total;
                GetNumPage(num);

                if (NumPage == 0) {
                    $("#tbData > tbody").html("");
                    var htmlData = "";
                    if (response.total != 0) {
                        for (var i = 0; i < response.data.length; i++) {
                            var obj = response.data[i];

                            var date = new Date(obj.createTime);
                            var txtDate;
                            if (obj.createTime == "" || obj.createTime == null) {
                                txtDate = "-";
                            }
                            else {
                                txtDate = ("0" + date.getDate()).slice(-2) + "/" + ("0" + (date.getMonth() + 1)).slice(-2) + "/" + date.getFullYear() + " " + ("0" + date.getHours()).slice(-2) + ":" + ("0" + date.getMinutes()).slice(-2) + ":" + ("0" + date.getSeconds()).slice(-2);
                            }

                            htmlData += "<tr>";
                            htmlData += "<td class='aligncenter'>" + txtDate + "</td>";
                            htmlData += "<td><p class='overflow ellipsis' title='" + obj.parentUsername + "'>" + obj.parentUsername + "</td>";
                            htmlData += "<td>" + obj.type + "</td>";
                            htmlData += "<td><p class='overflow ellipsis' title='" + obj.memberUsername + "'>" + obj.memberUsername + "</td>";

                            if (obj.phone == "" || obj.phone == null) {
                                htmlData += "<td class='colTel'>-</td>";
                            } else {
                                htmlData += "<td class='colTel'>" + obj.phone + "</td>";
                            }

                            var nLine = NewLine(obj.description, 50);

                            htmlData += "<td>" + nLine + "</td>";

                            if (obj.ip == "" || obj.ip == null) {
                                htmlData += "<td>-</td>";
                            } else {
                                htmlData += "<td><p class='overflow ellipsis' title='" + obj.ip + "'>" + obj.ip + "</p></td>";
                            }

                            htmlData += "</tr>";
                        }
                        $("#tbData > tbody").append(htmlData);
                    }
                    else {
                        $("#tbData > tbody").append("<tr><td colspan='7' style='text-align: center;' set-lan='text:No data.'></td></tr>");
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

        const postSubData = async (num) => {
            $("#tbData > tbody").html("");

            const parameterSub = {
                parentUsername: $('#searchLoginname').val(),
                page: num,
                size: 100
            }
            const requestAwait = await fetchDataSite(`${apiURL}/v1/feedback/inquiry`, 'POST', "include", parameterSub)
            const response = await requestAwait.json()

            if (response.messageCode == 0000 || response.messageCode == null) {
                var htmlData = "";
                if (response.total != 0) {

                    for (var i = 0; i < response.data.length; i++) {
                        var obj = response.data[i];

                        var date = new Date(obj.createTime);
                        var txtDate;
                        if (obj.createTime == "" || obj.createTime == null) {
                            txtDate = "-";
                        }
                        else {
                            txtDate = ("0" + date.getDate()).slice(-2) + "/" + ("0" + (date.getMonth() + 1)).slice(-2) + "/" + date.getFullYear() + " " + ("0" + date.getHours()).slice(-2) + ":" + ("0" + date.getMinutes()).slice(-2) + ":" + ("0" + date.getSeconds()).slice(-2);
                        }

                        htmlData += "<tr>";
                        htmlData += "<td class='aligncenter'>" + txtDate + "</td>";
                        htmlData += "<td><p class='overflow ellipsis' title='" + obj.parentUsername + "'>" + obj.parentUsername + "</td>";
                        htmlData += "<td>" + obj.type + "</td>";
                        htmlData += "<td><p class='overflow ellipsis' title='" + obj.memberUsername + "'>" + obj.memberUsername + "</td>";

                        if (obj.phone == "" || obj.phone == null) {
                            htmlData += "<td class='colTel'>-</td>";
                        } else {
                            htmlData += "<td class='colTel'>" + obj.phone + "</td>";
                        }

                        var nLine = NewLine(obj.description, 50);

                        htmlData += "<td>" + nLine + "</td>";

                        if (obj.ip == "" || obj.ip == null) {
                            htmlData += "<td>-</td>";
                        } else {
                            htmlData += "<td><p class='overflow ellipsis' title='" + obj.ip + "'>" + obj.ip + "</p></td>";
                        }

                        htmlData += "</tr>";
                    }
                    $("#tbData > tbody").append(htmlData);
                }
                else {
                    $("#tbData > tbody").append("<tr><td colspan='7' style='text-align: center;' set-lan='text:No data.'></td></tr>");
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
