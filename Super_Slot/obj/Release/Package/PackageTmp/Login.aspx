<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Super_Slot.Login" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=1480" />
    <meta http-equiv="x-ua-compatible" content="ie=edge" />
    <title>Agent Super Slot</title>
    <link rel="icon" href="img/logo.png" />
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css" />
    <link href="../css/bootstrap.min.css" rel="stylesheet" />
    <link href="../css/mdb.min.css" rel="stylesheet" />
    <link href="../css/style.css" rel="stylesheet" />
    <style>
        .waves-input-wrapper {
            display: block !important;
        }

        /*HNY*/
        .login-page {
            background-image: url("img/background/bg_songkran.jpg") !important;
            background-size: cover;
            background-repeat: round;
        }
        /*HNY*/
    </style>
</head>
<body class="login-page">
    <div id="myModalLoad" class="modal" data-backdrop="static" data-keyboard="false">
        <div class="d-flex justify-content-center" style="position: fixed; top: 50%; left: 50%; transform: translate(-50%, -50%); color: #CFA137 !important;">
            <div class="spinner-border" role="status" style="width: 10rem; height: 10rem; font-size: 5rem;">
                <span class="sr-only">Loading...</span>
            </div>
        </div>
    </div>
    <form runat="server" class="login-page">
        <div class="wrapper container h-100 d-flex justify-content-center align-items-center">
            <div class="login-section">
                <div class="card">
                    <div class="login-footer pt-4" style="padding-top: 1rem !important; border-bottom: 1px #fff solid; padding-bottom: 1rem !important;">
                        <a style="color: #fff;" id="txtLan">
                            <img src="img/Flag/usa.png" style="width: 20px;" />&emsp;English</a>
                        <div id="divblock" style="display: none; left: 8rem;">
                            <div style="border-bottom: 1px #ddd solid; padding: 3px;">
                                <a onclick="SetLanguage('Thai');">
                                    <img src="img/Flag/thailand.png" style="width: 20px;" />&emsp;ไทย
                                </a>
                            </div>
                            <div style="border-bottom: 1px #ddd solid; padding: 3px;">
                                <a onclick="SetLanguage('English');">
                                    <img src="img/Flag/usa.png" style="width: 20px;" />&emsp;English
                                </a>
                            </div>
                            <div style="padding: 3px;">
                                <a onclick="SetLanguage('Chinese');">
                                    <img src="img/Flag/china.png" style="width: 20px;" />&emsp;中文
                                </a>
                            </div>
                        </div>
                        <a href="#" class="nav-link" set-lan="html:Mobile Version" style="color: #fff;">
                            <i class="fas fa-mobile"></i>
                            Mobile Version
                        </a>
                    </div>
                    <div class="card-header text-center">
                        <a href="#" class="logo mx-auto">
                            <img src="../img/logo.png" alt="logo" />
                        </a>
                        <div class="card-header-text" set-lan="html:We are the future of gaming" style="font-size: 16pt;">We are the future of gaming</div>
                    </div>
                    <div class="card-body">
                        <div class="card-body-holder">
                            <div class="form-group row mb-4">
                                <div class="col-12">
                                    <div class="md-form md-outline">
                                        <input type="text" id="username" class="form-control form-control-lg mb-0" autocomplete="off" onkeypress="clsAlphaNoOnly(event)" maxlength="30" />
                                        <label for="username" class="label" set-lan="html:Username">Username</label>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group row mb-4">
                                <div class="col-12">
                                    <div class="md-form md-outline">
                                        <input type="password" id="password" class="form-control form-control-lg mb-0" autocomplete="off" maxlength="24" />
                                        <label for="password" class="label" set-lan="html:Password">Password</label>
                                        <span toggle="#password" class="toggle-password field-icon"><i class="far fa-eye"></i></span>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group row mb-4">
                                <div class="col-12">
                                    <button class="btn btn-lg btn-yellow font-weight-bold btn-block" onclick="Login()" id="btnSignIn" type="button" set-lan="text:Sign in">Sign in</button>
                                </div>
                            </div>
                            <div class="note-text white-text text-center">
                                <span style="font-size: 9pt;" set-lan="html:Contact your associate in case you forgot the password or unable to sign in">Contact your associate in case you forgot the password or unable to sign in</span>
                            </div>
                        </div>
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

        <div class="modal fade" id="modalLanguage" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
            aria-hidden="true">
            <div class="modal-dialog" role="document" style="max-width: 250px !important;">
                <div class="modal-content" style="background-color: #66667A;">
                    <div class="modal-body mx-3 text-center">
                        <a onclick="SetLanguage('Thai');">
                            <div class="row">
                                <div class="col-md-10" style="color: #fff; text-align: right;">ไทย</div>
                                <div class="col-md-2">
                                    <img src="img/Flag/thailand.png" style="width: 27px;" />
                                </div>
                            </div>
                        </a>
                        <a onclick="SetLanguage('English');">
                            <div class="row" style="margin-top: .3rem;">
                                <div class="col-md-10" style="color: #fff; text-align: right;">English</div>
                                <div class="col-md-2">
                                    <img src="img/Flag/usa.png" style="width: 27px;" />
                                </div>
                            </div>
                        </a>
                        <a onclick="SetLanguage('Chinese');">
                            <div class="row" style="margin-top: .3rem;">
                                <div class="col-md-10" style="color: #fff; text-align: right;">中文</div>
                                <div class="col-md-2">
                                    <img src="img/Flag/china.png" style="width: 27px;" />
                                </div>
                            </div>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </form>

    <!-- SCRIPTS -->
    <!-- JQuery -->
    <script type="text/javascript" src="../js/jquery-3.4.1.min.js"></script>
    <!-- Bootstrap tooltips -->
    <script type="text/javascript" src="../js/popper.min.js"></script>
    <!-- Bootstrap core JavaScript -->
    <!-- <script type="text/javascript" src="js/bootstrap.min.js"></script>-->
    <!-- MDB core JavaScript -->
    <script type="text/javascript" src="../js/mdb.min.js"></script>
    <!-- ACE core JavaScript -->
    <script type="text/javascript" src="../js/ace.min.js"></script>
    <!-- Language core JavaScript -->
    <script type="text/javascript" src="../js/language_Login.js"></script>
    <script type="text/javascript">
        var ipAddress;
        var apiURL = '<%=ConfigurationManager.AppSettings["apiURL"] %>';
        var logLan = "English";
        $(document).ready(function () {
            $('body').on('keyup', function (evt) {
                if (evt.keyCode == 13) {
                    $('#btnSignIn').click();
                }
            });

            $.getJSON("https://jsonip.com?callback=?", function (data) {
                ipAddress = data.ip;
            });

            localStorage.clear();


            $('#divblock').hide();
            $('#txtLan').click(function (e) {
                e.stopPropagation();
                $('#divblock').slideToggle();
            });
            $('#divblock').click(function (e) {
                e.stopPropagation();
            });
            $(document).click(function () {
                $('#divblock').slideUp();
            });

            var txtLan = agentLang();
            SetLan(txtLan);
            if (txtLan == "Thai") {
                $("#txtLan").html("ไทย<img src='img/Flag/thailand.png' style='width: 20px; margin-left: .4rem;' />");
            }
            else if (txtLan == "English") {
                $("#txtLan").html("English<img src='img/Flag/usa.png' style='width: 20px; margin-left: .4rem;' />");
            }
            else if (txtLan == "Chinese") {
                $("#txtLan").html("中文<img src='img/Flag/china.png' style='width: 20px; margin-left: .4rem;' />");
            }

            logLan = txtLan;
        });

        function agentLang() {
            var lang = window.navigator.userLanguage || window.navigator.language;
            lang = lang.toLowerCase();
            var lg = "English";
            if (lang.includes("en")) {
                lg = "English";
            }
            else if (lang.includes("th") != -1) {
                lg = "Thai";
            }
            else if (lang.includes("cn") != -1) {
                lg = "Chinese";
            }
            else {
                lg = "English";
            }
            return lg;
        }

        function ModalLanguage() {
            $("#modalLanguage").modal();
        }

        function Login() {
            $("#myModalLoad").modal();
            if ($('#username').val() == "") {
                document.getElementById("lbAlert").setAttribute("set-lan", "text:missing 'Username' field");
                SetLan(logLan);
                $('#modalAlert').modal('show');
                $("#myModalLoad").modal('hide');
            }
            else if ($('#password').val() == "") {
                document.getElementById("lbAlert").setAttribute("set-lan", "text:missing 'Password' field");
                SetLan(logLan);
                $('#modalAlert').modal('show');
                $("#myModalLoad").modal('hide');
            }
            else {
                postLogin();
            }
        }

        function ShowModal() {
            $('#modalAlert').modal('show');
        }

        function getIPAddress() {
            var myPeerConnection = window.RTCPeerConnection || window.mozRTCPeerConnection || window.webkitRTCPeerConnection;
            var pc = new myPeerConnection({
                iceServers: []
            }),
                noop = function () { },
                localIPs = {},
                ipRegex = /([0-9]{1,3}(\.[0-9]{1,3}){3}|[a-f0-9]{1,4}(:[a-f0-9]{1,4}){7})/g,
                key;

            function iterateIP(ip) {
                if (!localIPs[ip]) onNewIP(ip);
                localIPs[ip] = true;
            }

            pc.createDataChannel("");

            pc.createOffer(function (sdp) {
                sdp.sdp.split('\n').forEach(function (line) {
                    if (line.indexOf('candidate') < 0) return;
                    line.match(ipRegex).forEach(iterateIP);
                });

                pc.setLocalDescription(sdp, noop, noop);
            }, noop);

            pc.onicecandidate = function (ice) {
                if (!ice || !ice.candidate || !ice.candidate.candidate || !ice.candidate.candidate.match(ipRegex)) return;
                ice.candidate.candidate.match(ipRegex).forEach(iterateIP);
            };
        }

        function SetLanguage(ele) {
            SetLan(ele);
            if (ele == "Thai") {
                $("#txtLan").html("ไทย<img src='img/Flag/thailand.png' style='width: 20px; margin-left: .4rem;' />");
            }
            else if (ele == "English") {
                $("#txtLan").html("English<img src='img/Flag/usa.png' style='width: 20px; margin-left: .4rem;' />");
            }
            else if (ele == "Chinese") {
                $("#txtLan").html("中文<img src='img/Flag/china.png' style='width: 20px; margin-left: .4rem;' />");
            }

            logLan = ele;
            $('#divblock').slideUp();
        }

        function clsAlphaNoOnly(e) {
            var regex = new RegExp("^[a-zA-Z0-9@]+$");
            var str = String.fromCharCode(!e.charCode ? e.which : e.charCode);
            if (regex.test(str)) {
                return true;
            }

            e.preventDefault();
            return false;
        }

        const fetchData = (url = "", method = "GET", credentials = "include", body = {}) => {
            if (method == "GET") {
                return fetch(url, {
                    method,
                    headers: { 'Content-Type': 'application/json' },
                    credentials,
                })
            }
            return fetch(url, {
                method,
                headers: { 'Content-Type': 'application/json' },
                credentials,
                body: JSON.stringify(body) // body data type must match "Content-Type" header
            })
        }

        const postLogin = async () => {
            const parameterLogin = {
                username: $('#username').val(),
                password: $('#password').val()
            }
            const requestAwait = await fetchData(`${apiURL}/v1/login`, 'POST', "include", parameterLogin)
            const response = await requestAwait.json()

            if (response.messageCode == 0000 || response.messageCode == null) {
                localStorage.setItem("Language", logLan);
                localStorage.setItem("Username", response.data.username);
                localStorage.setItem("Position", response.data.position);
                localStorage.setItem("UserType", response.data.userType);
                localStorage.setItem("Status_Dashboard", response.data.permissions.dashboard);
                localStorage.setItem("Status_Account", response.data.permissions.account);
                localStorage.setItem("Status_Member", response.data.permissions.member);
                localStorage.setItem("Status_Report", response.data.permissions.report);
                localStorage.setItem("Status_Payment", response.data.permissions.payment);
                localStorage.setItem("Status_Announcement", response.data.permissions.announcement);
                localStorage.setItem("Status_Mission", response.data.permissions.mission);
                localStorage.setItem("Status_StockManagement", response.data.permissions.stockManagement);
                localStorage.setItem("Status_UserOnline", response.data.permissions.userOnline);
                localStorage.setItem("Status_FeedBack", response.data.permissions.feedback);
                localStorage.setItem("Status_RandomJackpot", response.data.permissions.randomJackpot);
                localStorage.setItem("Status_Market", response.data.permissions.market);
                localStorage.setItem("Status_Notification", response.data.permissions.notification);
                localStorage.setItem("Status_Tournament", response.data.permissions.tournament);
                localStorage.setItem("Status_DailyReward", response.data.permissions.dailyReward);
                localStorage.setItem("Status_MarketingTools", response.data.permissions.marketingTools);
                localStorage.setItem("Status_Lotto", response.data.permissions.lotto);


                localStorage.setItem("Status_Support_Report", response.data.permissions.reportForSupport);
                localStorage.setItem("Status_Support_Payment", response.data.permissions.paymentForSupport);

                getProfileSiteMaster();
                //window.location.href = "/Menu_Dashboard/dashboard.aspx";
                //$("#myModalLoad").modal('hide');
            }
            else if (response.messageCode == 8002) {
                document.getElementById("lbAlert").setAttribute("set-lan", "html:" + response.messageDescription + "");
                SetLan(logLan);
                $("#myModalLoad").modal('hide');
                $('#modalAlert').modal('show');
            }
            else if (response.messageCode == 8004) {
                var txt = response.messageDescription;
                txt = txt.replaceAll("\n", "</br>");
                $('#lbAlert').removeAttr('set-lan');

                document.getElementById("lbAlert").innerHTML = txt;
                SetLan(logLan);
                $("#myModalLoad").modal('hide');
                $('#modalAlert').modal('show');
            }
            else {
                document.getElementById('lbAlert').innerHTML = response.messageDescription;
                $("#myModalLoad").modal('hide');
                $('#modalAlert').modal('show');
            }
        }

        const getProfileSiteMaster = async () => {
            const requestAwait = await fetchData(`${apiURL}/v1/user/profile`, 'GET', "include", {})
            const response = await requestAwait.json()
            if (response.messageCode == 0000 || response.messageCode == null) {
                localStorage.setItem("Credit", response.data.credit);
                //window.location.href = "/Menu_Dashboard/dashboard.aspx";
                if (localStorage.getItem("Status_Dashboard") != "OFF") {
                    window.location.href = "/Menu_Dashboard/dashboard.aspx";
                }
                else if (localStorage.getItem("Status_Account") != "OFF") {
                    window.location.href = "/Menu_Account/profile.aspx";
                }
                else if (localStorage.getItem("Status_Member") != "OFF") {
                    if (localStorage.getItem("Position") == "AMB" && localStorage.getItem("Status_Member") == "EDIT") {
                        window.location.href = "/Menu_MemberManagement/company_add.aspx?uname=";
                    }
                    else if (localStorage.getItem("Position") == "AMB" && localStorage.getItem("Status_Member") == "VIEW") {
                        window.location.href = "/Menu_MemberManagement/company_list.aspx";
                    }
                    else if (localStorage.getItem("Position") == "COMPANY" && localStorage.getItem("UserType") == "main" && localStorage.getItem("Status_Member") == "EDIT") {
                        window.location.href = "/Menu_MemberManagement/company_add.aspx?uname=";
                    }
                    else if (localStorage.getItem("Position") == "COMPANY" && localStorage.getItem("UserType") == "main" && localStorage.getItem("Status_Member") == "VIEW") {
                        window.location.href = "/Menu_MemberManagement/company_list.aspx";
                    }
                    else if (localStorage.getItem("Position") == "SH_HOLDER" && localStorage.getItem("Status_Member") == "EDIT") {
                        window.location.href = "/Menu_MemberManagement/company_add.aspx?uname=";
                    }
                    else if (localStorage.getItem("Position") == "SH_HOLDER" && localStorage.getItem("Status_Member") == "VIEW") {
                        window.location.href = "/Menu_MemberManagement/company_list.aspx";
                    }
                    else if (localStorage.getItem("Position") == "AGENT" && localStorage.getItem("Status_Member") == "EDIT") {
                        window.location.href = "/Menu_MemberManagement/company_add.aspx?uname=";
                    }
                    else if (localStorage.getItem("Position") == "AGENT" && localStorage.getItem("Status_Member") == "VIEW") {
                        window.location.href = "/Menu_MemberManagement/company_list.aspx";
                    }
                    else if (localStorage.getItem("Position") == "COMPANY" && localStorage.getItem("UserType") == "sub" && localStorage.getItem("Status_Member") == "EDIT") {
                        window.location.href = "/Menu_MemberManagement/company_add.aspx?uname=";
                    }
                    else if (localStorage.getItem("Position") == "COMPANY" && localStorage.getItem("UserType") == "sub" && localStorage.getItem("Status_Member") == "VIEW") {
                        window.location.href = "/Menu_MemberManagement/company_list.aspx";
                    }
                }
                else if (localStorage.getItem("Status_Report") != "OFF") {
                    window.location.href = "/Menu_Report/wl_report.aspx";
                }
                else if (localStorage.getItem("Status_Payment") != "OFF") {
                    window.location.href = "/Menu_Payment/transfer.aspx";
                }
                else if (localStorage.getItem("Status_Announcement") != "OFF") {
                    window.location.href = "/Menu_Announcement/Announcements.aspx";
                }
                else if (localStorage.getItem("Status_Mission") != "OFF") {
                    window.location.href = "/Menu_Mission/Mission.aspx";
                }
                else if (localStorage.getItem("Status_StockManagement") != "OFF") {
                    window.location.href = "/Menu_CheckBalance/transfer_failed.aspx";
                }
                else if (localStorage.getItem("Status_UserOnline") != "OFF") {
                    window.location.href = "/Menu_Online/online_user.aspx";
                }
                else if (localStorage.getItem("Status_FeedBack") != "OFF") {
                    window.location.href = "/Menu_Feedback/feedback.aspx";
                }
                else if (localStorage.getItem("Status_RandomJackpot") != "OFF" || localStorage.getItem("Status_RandomJackpot") != "") {
                    window.location.href = "/Menu_RedEnvelope/tier.aspx";
                }
                else if (localStorage.getItem("Status_Market") != "OFF" || localStorage.getItem("Status_Market") != "") {
                    window.location.href = "/Menu_Market/goal.aspx";
                }
                else if (localStorage.getItem("Status_Notification") != "OFF" || localStorage.getItem("Status_Notification") != "") {
                    window.location.href = "/Menu_Notification/notification.aspx";
                }
                else if (localStorage.getItem("Status_Tournament") != "OFF" || localStorage.getItem("Status_Tournament") != "") {
                    window.location.href = "/Menu_Tournament/tournment_prize.aspx";
                }
                else if (localStorage.getItem("Status_DailyReward") != "OFF" || localStorage.getItem("Status_DailyReward") != "") {
                    window.location.href = "/Menu_Daily/goal.aspx";
                }
                else if (localStorage.getItem("Status_MarketingTools") != "OFF" || localStorage.getItem("Status_MarketingTools") != "") {
                    window.location.href = "/Menu_Marketing/Game.aspx";
                }
                else if (localStorage.getItem("Status_Lotto") != "OFF" || localStorage.getItem("Status_Lotto") != "") {
                    window.location.href = "/Menu_LuckyDraw/goal.aspx";
                }


                if (localStorage.getItem("Position") == "SUPPORT") {
                    window.location.href = "/Menu_MemberManagement/provider_id.aspx";
                }

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
</body>
</html>
