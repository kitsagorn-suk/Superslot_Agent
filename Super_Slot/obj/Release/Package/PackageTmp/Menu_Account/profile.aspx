<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="profile.aspx.cs" Inherits="Super_Slot.Menu_Account.profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .accordionn {
            background-color: #e9ecef;
            border-radius: 3px;
            border: 1px #c6c6c6 solid;
            color: #444;
            cursor: pointer;
            width: 100%;
            text-align: left;
            outline: none;
            font-size: 1rem;
            transition: 0.4s;
            padding: .375rem .75rem;
            line-height: 1.5;
        }

            .accordionn.active, .accordionn:hover {
                background-color: #e9ecef;
                border-radius: 3px;
                border: 1px #c6c6c6 solid;
            }

            .accordionn:after {
                content: '\002B';
                color: #777;
                font-weight: bold;
                float: right;
                margin-left: 5px;
            }

            .accordionn.active:after {
                content: "\2212";
            }

        .panel {
            /*background-color: #f8f9fa;*/
            max-height: 0;
            overflow: hidden;
            transition: max-height 0.2s ease-out;
            padding: 0px;
        }
    </style>
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="" set-lan="text:Account"></a></li>
            <li class="breadcrumb-item active" set-lan="text:Profile"></li>
        </ol>
    </nav>
    <h1 set-lan="text:Profile"></h1>
    <div class="section-group mb-4">
        <div class="form-row">
            <div class="form-group col-5">
                <h4 set-lan="text:Basic Info"></h4>
                <div class="form-group row inputform">
                    <label for="username" class="col-4 col-form-label" set-lan="text:Username"></label>
                    <div class="col-8">
                        <input type="text" id="username" class="form-control" autocomplete="off" disabled="disabled" />
                    </div>
                </div>
                <div class="form-group row inputform">
                    <label for="username" class="col-4 col-form-label" set-lan="text:Phone number"></label>
                    <div class="col-8">
                        <input type="text" id="phonenumber" class="form-control" autocomplete="off" disabled="disabled" />
                    </div>
                </div>
            </div>
            <div class="col-1"></div>
            <div class="form-group col-5">
                <h4 set-lan="text:Credit"></h4>
                <div class="form-group row inputform">
                    <label for="username" class="col-4 col-form-label" set-lan="text:Currency"></label>
                    <div class="col-8">
                        <input type="text" id="Currency" class="form-control" autocomplete="off" disabled="disabled" />
                    </div>
                </div>
                <div class="form-group row inputform">
                    <label for="username" class="col-4 col-form-label" set-lan="text:Credit"></label>
                    <div class="col-8">
                        <input type="text" id="Credit" class="form-control" autocomplete="off" disabled="disabled" />
                    </div>
                </div>
                <div class="form-group row inputform">
                    <label for="username" class="col-4 col-form-label" set-lan="text:PT"></label>
                    <div class="col-8">
                        <input type="text" id="PT" class="form-control" autocomplete="off" disabled="disabled" />
                    </div>
                </div>
            </div>
        </div>
        <div class="form-row">
            <div class="form-group col-5">
                <div id="zoneAPI" style="display: none;">
                    <h4 set-lan="text:API"></h4>
                    <div class="form-group row inputform">
                        <label for="username" class="col-4 col-form-label" set-lan="text:Key"></label>
                        <div class="col-8">
                            <input type="text" id="key" class="form-control" autocomplete="off" disabled="disabled" />
                        </div>
                    </div>
                    <div class="form-group row inputform callback">
                        <label for="username" class="col-4 col-form-label" set-lan="text:Callback url servlet"></label>
                        <div class="col-8">
                            <input type="text" id="web" class="form-control" autocomplete="off" />
                            <small class="text-muted form-text" set-lan="text:Example www.google.com"></small>
                        </div>
                    </div>
                    <div class="zoneAddIP">
                        <div class="zonedivIP">
                            <div class="form-group row inputform">
                                <label for="username" class="col-4 col-form-label" set-lan="text:IP"></label>
                                <div class="col-7">
                                    <input type="text" class="form-control codeip" autocomplete="off" />
                                </div>
                                <div class="col-1" style="color: red; font-size: 1.5rem;">
                                    <a class='removeIP'><i class='fa fa-minus-circle' aria-hidden='true'></i></a>
                                </div>
                            </div>
                        </div>
                        <div class="form-group row inputform" style="margin-top: -15px;">
                            <label for="username" class="col-4 col-form-label"></label>
                            <div class="col-7"><small class="text-muted form-text" set-lan="text:Example 192.168.0.1"></small></div>
                        </div>
                        <button class="btn btn-yellow font-weight-bold" onclick="gotoURL();" type="button" style="float: right;" set-lan="text:Click to API Document"></button>
                        <button class="btn btn-yellow font-weight-bold addIP zonenone" onclick="" type="button" style="float: right; margin-right: 5px;" set-lan="text:Add IP"></button>
                    </div>
                </div>
            </div>
        </div>
        <div class="form-row">
            <div class="col-12" style="text-align: right;">
                <button class="btn btn-yellow font-weight-bold zonenone" onclick="btnEdit()" type="button" style="float: right; display: none;" id="btnSaveProfile" set-lan="text:Save Profile"></button>
            </div>
        </div>
        <div class="form-row" style="margin-top: -2.5rem;">
            <div class="form-group col-12">
                <h4 set-lan="text:History login date & IP"></h4>
                <table class="table table-border" id="tbData">
                    <thead class="rgba-green-slight">
                        <tr>
                            <th set-lan="text:Date"></th>
                            <th set-lan="text:IP address"></th>
                        </tr>
                    </thead>
                    <tbody id="tbodyLogin">
                    </tbody>
                    <tfoot class="rgba-yellow-slight">
                        <tr class="total">
                            <td></td>
                            <td></td>
                        </tr>
                    </tfoot>
                </table>
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
                    <h4 class="modal-title w-100 font-weight-bold" set-lan="text:Success">Success</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body mx-3 text-center">
                    <label set-lan="text:Save profile success"></label>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainScript" runat="server">
    <script>
        $(document).ready(function () {
            $("#menuAccount , #menuAccount > a").addClass("active");
            $("#menuAccount > div").css("display", "block");

            $("#myModalLoad").modal();

            $('.addIP').click(function (e) {
                var matched = $(".zonedivIP .inputform");
                matched = matched.length;

                e.preventDefault();
                var html = "";
                html += "<div class='form-group row inputform'>";
                if (matched > 0) {
                    html += "<label for='username' class='col-4 col-form-label'></label>";
                }
                else {
                    html += "<label for='username' class='col-4 col-form-label' set-lan='text:IP'></label>";
                }
                html += "<div class='col-7 reClass'>";
                html += "<input type='text' class='form-control codeip' autocomplete='off' />";
                html += "</div>";
                html += "<div class='col-1' style='color: red; font-size: 1.5rem;'>";
                html += "<a class='removeIP'><i class='fa fa-minus-circle' aria-hidden='true'></i></a>";
                html += "</div>";
                html += "</div>";
                $('.zonedivIP').append(html);

                SetLan(localStorage.getItem("Language"));
            });

            $('.zoneAddIP').on("click", ".removeIP", function (e) {
                e.preventDefault();
                $(this).parent('div').parent('div').remove();
            })

            getProfile();

        });

        function gotoURL() {
            window.open('https://service-api.prettygaming.asia/index', '_blank');
        }

        function actionZone(e) {
            e.classList.toggle("active");
            var panel = e.nextElementSibling;
            if (panel.style.maxHeight) {
                panel.style.maxHeight = null;
                panel.style.padding = "0px";
            } else {
                panel.style.maxHeight = (panel.scrollHeight + 10) + "px";
                panel.style.padding = "5px";
            }
        }

        function btnEdit() {
            $("#myModalLoad").modal();

            var arrIP = [];
            var els = document.getElementsByClassName("codeip");
            for (var i = 0; i < els.length; i++) {
                var val = els[i].value;
                arrIP.push(val);
            }

            var dataEdit = new Object();
            dataEdit.ip = arrIP;
            dataEdit.webHookEvents = $('#web').val();
            $.ajax({
                url: apiURL + "/apiRoute/member/setIpAndWebHookEvent",
                type: 'POST',
                dataType: 'json',
                data: JSON.stringify(dataEdit),
                contentType: 'application/json; charset=utf-8',
                beforeSend: function (xhr, settings) { xhr.setRequestHeader('Authorization', token); },
                success: function (data) {
                    if (data.code == 0 || data.code == null) {
                        SetLan(localStorage.getItem("Language"));
                        $("#myModalLoad").modal('hide');
                        $('#modalAlertSuccess').modal();
                        setTimeout(function () {
                            window.location.href = "/Menu_Account/profile.aspx";
                        }, 1500);
                    }
                    else {
                        document.getElementById('lbAlert').innerHTML = data.msg;
                        $("#myModalLoad").modal('hide');
                        $('#modalAlert').modal('show');
                    }
                },
                error: function (xhr, status, error) {
                    document.getElementById('lbAlert').innerHTML = xhr.status + " | " + status;
                    $("#myModalLoad").modal('hide');
                    $('#modalAlert').modal('show');
                }
            });
        }

        const getProfile = async () => {
            const requestAwait = await fetchDataSite(`${apiURL}/v1/user/profile`, 'GET', "include", {})
            const response = await requestAwait.json()
            if (response.messageCode == 0000 || response.messageCode == null) {
                $('#username').val(response.data.username);
                if (response.data.phone == "") {
                    $('#phonenumber').val("-");
                } else {
                    $('#phonenumber').val(response.data.phone);
                }

                //if (response.data.nickName == "") {
                //    $('#Nickname').val("-");
                //} else {
                //    $('#Nickname').val(response.data.nickName);
                //}
                $('#PT').val(response.data.positionTracking + "%");
                $('#GivenPT').val(response.data.givenPT);
                $('#Currency').val(response.data.currency);
                $('#Credit').val(Comma(response.data.credit));

                if (response.data.history_logs != null) {
                    var htmlLogin = "";
                    var arrData = response.data.history_logs;
                    for (var i = 0; i < arrData.length; i++) {
                        htmlLogin += "<tr>";
                        htmlLogin += "<td>" + arrData[i].createTime + "</td>";
                        htmlLogin += "<td>" + arrData[i].ip + "</td>";
                        htmlLogin += "</tr>";
                    }
                    $("#tbodyLogin").append(htmlLogin);
                }
                else {
                    $("#tbodyLogin").append("<tr><td colspan='2'>No data.</td></tr>");
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
