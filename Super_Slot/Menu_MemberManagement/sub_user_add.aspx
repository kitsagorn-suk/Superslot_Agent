<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="sub_user_add.aspx.cs" Inherits="Super_Slot.Menu_MemberManagement.sub_user_add" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="" set-lan="text:Management"></a></li>
            <li class="breadcrumb-item"><a href="/Menu_MemberManagement/sub_accounts.aspx" set-lan="text:Sub User List"></a></li>
            <li class="breadcrumb-item active" id="headPage"></li>
        </ol>
    </nav>
    <h1 id="headTopic" set-lan="text:Add Sub User"></h1>
    <div class="section-group mb-4">
        <h4 set-lan="text:Basic Info"></h4>
        <div class="form-row">
            <div class="form-group col-6">
                <div class="form-group row inputform">
                    <label for="username" class="col-4 col-form-label" set-lan="html:Username-"></label>
                    <label for="username" class="col-3 col-form-label" id="mainUser"></label>
                    <div class="col-5">
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
            </div>
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
                <div class="form-group col-6">
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
                <div class="form-group col-6">
                    <div class="form-group row inputform">
                        <label for="pt" class="col-4 col-form-label" set-lan="text:Lock from Login Failed"></label>
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
        <h4 set-lan="text:Permissions"></h4>
        <div class="form-row">
            <div class="form-group col-5">
                <div class="form-group">
                    <div class="row mb-1 inputform">
                        <label class="col-5 col-form-label input-text-label" set-lan="text:Dashboard"></label>
                        <div class="col-7">
                            <div class="form-check form-check-inline">
                                <input type="radio" class="form-check-input" id="DashboardRadio_off" name="DashboardRadio" value="OFF">
                                <label class="form-check-label red-text" for="DashboardRadio_off" set-lan="text:Off"></label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input type="radio" checked="" class="form-check-input" id="DashboardRadio_view" name="DashboardRadio" value="VIEW">
                                <label class="form-check-label orange-text" for="DashboardRadio_view" set-lan="text:View"></label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input type="radio" class="form-check-input" id="DashboardRadio_edit" name="DashboardRadio" value="EDIT">
                                <label class="form-check-label green-text" for="DashboardRadio_edit" set-lan="text:Edit"></label>
                            </div>
                        </div>
                    </div>
                    <div class="row mb-1 inputform">
                        <label class="col-5 col-form-label input-text-label" set-lan="text:Account"></label>
                        <div class="col-7">
                            <div class="form-check form-check-inline">
                                <input type="radio" class="form-check-input" id="AccountRadio_off" name="AccountRadio" value="OFF">
                                <label class="form-check-label red-text" for="AccountRadio_off" set-lan="text:Off"></label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input type="radio" checked="" class="form-check-input" id="AccountRadio_view" name="AccountRadio" value="VIEW">
                                <label class="form-check-label orange-text" for="AccountRadio_view" set-lan="text:View"></label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input type="radio" class="form-check-input" id="AccountRadio_edit" name="AccountRadio" value="EDIT">
                                <label class="form-check-label green-text" for="AccountRadio_edit" set-lan="text:Edit"></label>
                            </div>
                        </div>
                    </div>
                    <div class="row mb-1 inputform">
                        <label class="col-5 col-form-label input-text-label" set-lan="text:Management"></label>
                        <div class="col-7">
                            <div class="form-check form-check-inline">
                                <input type="radio" class="form-check-input" id="MemberManagementRadio_off" name="MemberManagementRadio" value="OFF">
                                <label class="form-check-label red-text" for="MemberManagementRadio_off" set-lan="text:Off"></label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input type="radio" checked="" class="form-check-input" id="MemberManagementRadio_view" name="MemberManagementRadio" value="VIEW">
                                <label class="form-check-label orange-text" for="MemberManagementRadio_view" set-lan="text:View"></label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input type="radio" class="form-check-input" id="MemberManagementRadio_edit" name="MemberManagementRadio" value="EDIT">
                                <label class="form-check-label green-text" for="MemberManagementRadio_edit" set-lan="text:Edit"></label>
                            </div>
                        </div>
                    </div>
                    <div class="row mb-1 inputform">
                        <label class="col-5 col-form-label input-text-label" set-lan="text:Report"></label>
                        <div class="col-7">
                            <div class="form-check form-check-inline">
                                <input type="radio" class="form-check-input" id="ReportRadio_off" name="ReportRadio" value="OFF">
                                <label class="form-check-label red-text" for="ReportRadio_off" set-lan="text:Off"></label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input type="radio" checked="" class="form-check-input" id="ReportRadio_view" name="ReportRadio" value="VIEW">
                                <label class="form-check-label orange-text" for="ReportRadio_view" set-lan="text:View"></label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input type="radio" class="form-check-input" id="ReportRadio_edit" name="ReportRadio" value="EDIT">
                                <label class="form-check-label green-text" for="ReportRadio_edit" set-lan="text:Edit"></label>
                            </div>
                        </div>
                    </div>
                    <div class="row mb-1 inputform">
                        <label class="col-5 col-form-label input-text-label" set-lan="text:Payment"></label>
                        <div class="col-7">
                            <div class="form-check form-check-inline">
                                <input type="radio" class="form-check-input" id="PaymentRadio_off" name="PaymentRadio" value="OFF">
                                <label class="form-check-label red-text" for="PaymentRadio_off" set-lan="text:Off"></label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input type="radio" checked="" class="form-check-input" id="PaymentRadio_view" name="PaymentRadio" value="VIEW">
                                <label class="form-check-label orange-text" for="PaymentRadio_view" set-lan="text:View"></label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input type="radio" class="form-check-input" id="PaymentRadio_edit" name="PaymentRadio" value="EDIT">
                                <label class="form-check-label green-text" for="PaymentRadio_edit" set-lan="text:Edit"></label>
                            </div>
                        </div>
                    </div>
                    <div id="ZoneAnnouncements" style="display: none;">
                        <div class="row mb-1 inputform">
                            <label class="col-5 col-form-label input-text-label" set-lan="text:Announcements"></label>
                            <div class="col-7">
                                <div class="form-check form-check-inline">
                                    <input type="radio" class="form-check-input" id="AnnouncementsRadio_off" name="AnnouncementsRadio" value="OFF">
                                    <label class="form-check-label red-text" for="AnnouncementsRadio_off" set-lan="text:Off"></label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <input type="radio" checked="" class="form-check-input" id="AnnouncementsRadio_view" name="AnnouncementsRadio" value="VIEW">
                                    <label class="form-check-label orange-text" for="AnnouncementsRadio_view" set-lan="text:View"></label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <input type="radio" class="form-check-input" id="AnnouncementsRadio_edit" name="AnnouncementsRadio" value="EDIT">
                                    <label class="form-check-label green-text" for="AnnouncementsRadio_edit" set-lan="text:Edit"></label>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div id="ZoneMission" style="display: none;">
                        <div class="row mb-1 inputform">
                            <label class="col-5 col-form-label input-text-label" set-lan="text:Mission"></label>
                            <div class="col-7">
                                <div class="form-check form-check-inline">
                                    <input type="radio" class="form-check-input" id="MissionRadio_off" name="MissionRadio" value="OFF">
                                    <label class="form-check-label red-text" for="MissionRadio_off" set-lan="text:Off"></label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <input type="radio" checked="" class="form-check-input" id="MissionRadio_view" name="MissionRadio" value="VIEW">
                                    <label class="form-check-label orange-text" for="MissionRadio_view" set-lan="text:View"></label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <input type="radio" class="form-check-input" id="MissionRadio_edit" name="MissionRadio" value="EDIT">
                                    <label class="form-check-label green-text" for="MissionRadio_edit" set-lan="text:Edit"></label>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row mb-1 inputform">
                        <label class="col-5 col-form-label input-text-label" set-lan="text:Stock Mngement"></label>
                        <div class="col-7">
                            <div class="form-check form-check-inline">
                                <input type="radio" class="form-check-input" id="StockMngementRadio_off" name="StockMngementRadio" value="OFF">
                                <label class="form-check-label red-text" for="StockMngementRadio_off" set-lan="text:Off"></label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input type="radio" checked="" class="form-check-input" id="StockMngementRadio_view" name="StockMngementRadio" value="VIEW">
                                <label class="form-check-label orange-text" for="StockMngementRadio_view" set-lan="text:View"></label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input type="radio" class="form-check-input" id="StockMngementRadio_edit" name="StockMngementRadio" value="EDIT">
                                <label class="form-check-label green-text" for="StockMngementRadio_edit" set-lan="text:Edit"></label>
                            </div>
                        </div>
                    </div>
                    <div class="row mb-1 inputform">
                        <label class="col-5 col-form-label input-text-label" set-lan="text:Online User"></label>
                        <div class="col-7">
                            <div class="form-check form-check-inline">
                                <input type="radio" class="form-check-input" id="OnlineUserRadio_off" name="OnlineUserRadio" value="OFF">
                                <label class="form-check-label red-text" for="OnlineUserRadio_off" set-lan="text:Off"></label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input type="radio" checked="" class="form-check-input" id="OnlineUserRadio_view" name="OnlineUserRadio" value="VIEW">
                                <label class="form-check-label orange-text" for="OnlineUserRadio_view" set-lan="text:View"></label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input type="radio" class="form-check-input" id="OnlineUserRadio_edit" name="OnlineUserRadio" value="EDIT">
                                <label class="form-check-label green-text" for="OnlineUserRadio_edit" set-lan="text:Edit"></label>
                            </div>
                        </div>
                    </div>
                    <div class="row mb-1 inputform">
                        <label class="col-5 col-form-label input-text-label" set-lan="text:Feedback"></label>
                        <div class="col-7">
                            <div class="form-check form-check-inline">
                                <input type="radio" class="form-check-input" id="FeedbackRadio_off" name="FeedbackRadio" value="OFF">
                                <label class="form-check-label red-text" for="FeedbackRadio_off" set-lan="text:Off"></label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input type="radio" checked="" class="form-check-input" id="FeedbackRadio_view" name="FeedbackRadio" value="VIEW">
                                <label class="form-check-label orange-text" for="FeedbackRadio_view" set-lan="text:View"></label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input type="radio" class="form-check-input" id="FeedbackRadio_edit" name="FeedbackRadio" value="EDIT">
                                <label class="form-check-label green-text" for="FeedbackRadio_edit" set-lan="text:Edit"></label>
                            </div>
                        </div>
                    </div>
                    <div class="row mb-1 inputform">
                        <label class="col-5 col-form-label input-text-label" set-lan="text:Red Envelope"></label>
                        <div class="col-7">
                            <div class="form-check form-check-inline">
                                <input type="radio" class="form-check-input" id="RedEnvelopeRadio_off" name="RedEnvelopeRadio" value="OFF">
                                <label class="form-check-label red-text" for="RedEnvelopeRadio_off" set-lan="text:Off"></label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input type="radio" checked="" class="form-check-input" id="RedEnvelopeRadio_view" name="RedEnvelopeRadio" value="VIEW">
                                <label class="form-check-label orange-text" for="RedEnvelopeRadio_view" set-lan="text:View"></label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input type="radio" class="form-check-input" id="RedEnvelopeRadio_edit" name="RedEnvelopeRadio" value="EDIT">
                                <label class="form-check-label green-text" for="RedEnvelopeRadio_edit" set-lan="text:Edit"></label>
                            </div>
                        </div>
                    </div>
                    <div class="row mb-1 inputform">
                        <label class="col-5 col-form-label input-text-label" set-lan="text:Market"></label>
                        <div class="col-7">
                            <div class="form-check form-check-inline">
                                <input type="radio" class="form-check-input" id="MarketRadio_off" name="MarketRadio" value="OFF">
                                <label class="form-check-label red-text" for="MarketRadio_off" set-lan="text:Off"></label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input type="radio" checked="" class="form-check-input" id="MarketRadio_view" name="MarketRadio" value="VIEW">
                                <label class="form-check-label orange-text" for="MarketRadio_view" set-lan="text:View"></label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input type="radio" class="form-check-input" id="MarketRadio_edit" name="MarketRadio" value="EDIT">
                                <label class="form-check-label green-text" for="MarketRadio_edit" set-lan="text:Edit"></label>
                            </div>
                        </div>
                    </div>
                    <div class="row mb-1 inputform">
                        <label class="col-5 col-form-label input-text-label" set-lan="text:Notification"></label>
                        <div class="col-7">
                            <div class="form-check form-check-inline">
                                <input type="radio" class="form-check-input" id="NotificationRadio_off" name="NotificationRadio" value="OFF">
                                <label class="form-check-label red-text" for="NotificationRadio_off" set-lan="text:Off"></label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input type="radio" checked="" class="form-check-input" id="NotificationRadio_view" name="NotificationRadio" value="VIEW">
                                <label class="form-check-label orange-text" for="NotificationRadio_view" set-lan="text:View"></label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input type="radio" class="form-check-input" id="NotificationRadio_edit" name="NotificationRadio" value="EDIT">
                                <label class="form-check-label green-text" for="NotificationRadio_edit" set-lan="text:Edit"></label>
                            </div>
                        </div>
                    </div>
                    <div class="row mb-1 inputform">
                        <label class="col-5 col-form-label input-text-label" set-lan="text:Tournament"></label>
                        <div class="col-7">
                            <div class="form-check form-check-inline">
                                <input type="radio" class="form-check-input" id="TournamentRadio_off" name="TournamentRadio" value="OFF">
                                <label class="form-check-label red-text" for="TournamentRadio_off" set-lan="text:Off"></label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input type="radio" checked="" class="form-check-input" id="TournamentRadio_view" name="TournamentRadio" value="VIEW">
                                <label class="form-check-label orange-text" for="TournamentRadio_view" set-lan="text:View"></label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input type="radio" class="form-check-input" id="TournamentRadio_edit" name="TournamentRadio" value="EDIT">
                                <label class="form-check-label green-text" for="TournamentRadio_edit" set-lan="text:Edit"></label>
                            </div>
                        </div>
                    </div>
                    <div class="row mb-1 inputform">
                        <label class="col-5 col-form-label input-text-label" set-lan="text:Daily Rewards"></label>
                        <div class="col-7">
                            <div class="form-check form-check-inline">
                                <input type="radio" class="form-check-input" id="DailyRewardsRadio_off" name="DailyRewardsRadio" value="OFF">
                                <label class="form-check-label red-text" for="DailyRewardsRadio_off" set-lan="text:Off"></label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input type="radio" checked="" class="form-check-input" id="DailyRewardsRadio_view" name="DailyRewardsRadio" value="VIEW">
                                <label class="form-check-label orange-text" for="DailyRewardsRadio_view" set-lan="text:View"></label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input type="radio" class="form-check-input" id="DailyRewardsRadio_edit" name="DailyRewardsRadio" value="EDIT">
                                <label class="form-check-label green-text" for="DailyRewardsRadio_edit" set-lan="text:Edit"></label>
                            </div>
                        </div>
                    </div>
                    <div class="row mb-1 inputform">
                        <label class="col-5 col-form-label input-text-label" set-lan="text:Marketing Tools"></label>
                        <div class="col-7">
                            <div class="form-check form-check-inline">
                                <input type="radio" class="form-check-input" id="MarketingToolsRadio_off" name="MarketingToolsRadio" value="OFF">
                                <label class="form-check-label red-text" for="MarketingToolsRadio_off" set-lan="text:Off"></label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input type="radio" checked="" class="form-check-input" id="MarketingToolsRadio_view" name="MarketingToolsRadio" value="VIEW">
                                <label class="form-check-label orange-text" for="MarketingToolsRadio_view" set-lan="text:View"></label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input type="radio" class="form-check-input" id="MarketingToolsRadio_edit" name="MarketingToolsRadio" value="EDIT">
                                <label class="form-check-label green-text" for="MarketingToolsRadio_edit" set-lan="text:Edit"></label>
                            </div>
                        </div>
                    </div>
                    <div class="row mb-1 inputform">
                        <label class="col-5 col-form-label input-text-label" set-lan="text:Lucky Draw"></label>
                        <div class="col-7">
                            <div class="form-check form-check-inline">
                                <input type="radio" class="form-check-input" id="LuckyDrawRadio_off" name="LuckyDrawRadio" value="OFF">
                                <label class="form-check-label red-text" for="LuckyDrawRadio_off" set-lan="text:Off"></label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input type="radio" checked="" class="form-check-input" id="LuckyDrawRadio_view" name="LuckyDrawRadio" value="VIEW">
                                <label class="form-check-label orange-text" for="LuckyDrawRadio_view" set-lan="text:View"></label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input type="radio" class="form-check-input" id="LuckyDrawRadio_edit" name="LuckyDrawRadio" value="EDIT">
                                <label class="form-check-label green-text" for="LuckyDrawRadio_edit" set-lan="text:Edit"></label>
                            </div>
                        </div>
                    </div>
                    <div class="row mb-1 inputform">
                        <label class="col-5 col-form-label input-text-label" set-lan="text:Game Market"></label>
                        <div class="col-7">
                            <div class="form-check form-check-inline">
                                <input type="radio" class="form-check-input" id="GameMarketRadio_off" name="GameMarketRadio" value="OFF">
                                <label class="form-check-label red-text" for="GameMarketRadio_off" set-lan="text:Off"></label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input type="radio" checked="" class="form-check-input" id="GameMarketRadio_view" name="GameMarketRadio" value="VIEW">
                                <label class="form-check-label orange-text" for="GameMarketRadio_view" set-lan="text:View"></label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input type="radio" class="form-check-input" id="GameMarketRadio_edit" name="GameMarketRadio" value="EDIT">
                                <label class="form-check-label green-text" for="GameMarketRadio_edit" set-lan="text:Edit"></label>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="form-row">
            <div class="col-12" style="text-align: center; margin-top: 1rem;">
                <button class="btn btn-yellow font-weight-bold" id="btnADD" onclick="AddSubUser()" type="button" set-lan="text:Add Sub User"></button>
                <button class="btn btn-yellow font-weight-bold" id="btnSAVE" onclick="SaveSubUser()" type="button" set-lan="text:Save Sub User"></button>
            </div>
        </div>
    </div>

    <!-- Modal -->
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
                    <h4 class="modal-title w-100 font-weight-bold">Status</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body mx-3">
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
    <script>
        var Position = localStorage.getItem("Position");
        var ValScroll = 0;

        $(document).ready(function () {
            $("#menuMemberManage , #menuMemberManage > a").addClass("active");
            $("#menuMemberManage > div").css("display", "block");

            $("#mainUser").text(localStorage.getItem("Username") + "@");

            var uname = getUrlParameter('uname');
            var scroll = getUrlParameter('s');
            if (uname == "") {
                document.getElementById("btnSAVE").style.display = "none";
                document.getElementById("ZonePass2").style.display = "none";
                document.getElementById("ZoneStatus").style.display = "none";
                document.getElementById("headPage").setAttribute("set-lan", "text:Add Sub User");
                document.getElementById("headTopic").setAttribute("set-lan", "text:Add Sub User");
                //getProfile();
            }
            else {
                document.getElementById("mainUser").style.display = "none";
                document.getElementById("btnADD").style.display = "none";
                document.getElementById("ZonePass1").style.display = "none";
                document.getElementById("headPage").setAttribute("set-lan", "text:Edit Sub User");
                document.getElementById("headTopic").setAttribute("set-lan", "text:Edit Sub User");
                $('#username').prop("disabled", true);
                postUser(uname);
            }

            if (scroll != "" || scroll != null) {
                ValScroll = scroll;
            }

            if (Position == "COMPANY") {
                document.getElementById("ZoneAnnouncements").style.display = "block";
                document.getElementById("ZoneMission").style.display = "block";
            }
            else if (Position == "AGENT") {
                document.getElementById("ZoneAnnouncements").style.display = "block";
            }
            else {
                document.getElementById("AnnouncementsRadio_off").checked = true;
                document.getElementById("MissionRadio_off").checked = true;
            }

            SetLan(localStorage.getItem("Language"));
        });

        function chgLock(ele) {
            if (ele.checked) {
                document.getElementById("txtLock").setAttribute("set-lan", "text:Lock");
                SetLan(localStorage.getItem("Language"));
            } else {
                document.getElementById("txtLock").setAttribute("set-lan", "text:Unlock");
                SetLan(localStorage.getItem("Language"));
            }
        }

        function EditLockFailed() {
            $('#modalLockFailed').modal('show');
        }

        function editStatus() {
            var Lock = $('#lock').val();
            if (Lock == "Lock" || Lock == "ล็อค" || Lock == "锁") {
                document.getElementById("chkLock").checked = true;
            }
            else {
                document.getElementById("chkLock").checked = false;
            }

            $('#modalStatus').modal('show');
        }

        function editPass() {
            $('#modalPassword').modal('show');
        }

        function SaveLockFailed() {
            $("#myModalLoad").modal();
            postLockFailed();
        }

        function saveEditStatus() {
            $("#myModalLoad").modal();
            var statuslock = false;

            if (document.getElementById('chkLock').checked) {
                statuslock = true;
            } else {
                statuslock = false;
            }

            postEditStatus(statuslock);
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

        function SaveSubUser() {
            $("#myModalLoad").modal();
            postEditSub();
        }

        function AddSubUser() {
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
            else {
                postAddSub();
            }
        }

        const postAddSub = async () => {
            const parameterAddSub = {
                username: $('#username').val(),
                password: $('#password').val(),
                nickName: $('#nickname').val(),
                phone: $('#phonenumber').val(),
                permissions: {
                    dashboard: $("input[name='DashboardRadio']:checked").val(),
                    account: $("input[name='AccountRadio']:checked").val(),
                    member: $("input[name='MemberManagementRadio']:checked").val(),
                    report: $("input[name='ReportRadio']:checked").val(),
                    payment: $("input[name='PaymentRadio']:checked").val(),
                    announcement: $("input[name='AnnouncementsRadio']:checked").val(),
                    mission: $("input[name='MissionRadio']:checked").val(),
                    stockManagement: $("input[name='StockMngementRadio']:checked").val(),
                    feedback: $("input[name='FeedbackRadio']:checked").val(),
                    userOnline: $("input[name='OnlineUserRadio']:checked").val(),
                    randomJackpot: $("input[name='RedEnvelopeRadio']:checked").val(),
                    market: $("input[name='MarketRadio']:checked").val(),
                    notification: $("input[name='NotificationRadio']:checked").val(),
                    tournament: $("input[name='TournamentRadio']:checked").val(),
                    dailyReward: $("input[name='DailyRewardsRadio']:checked").val(),
                    marketingTools: $("input[name='MarketingToolsRadio']:checked").val(),
                    lotto: $("input[name='LuckyDrawRadio']:checked").val(),
                    gameMarket: $("input[name='GameMarketRadio']:checked").val()
                }
            }
            const requestAwait = await fetchDataSite(`${apiURL}/v1/subuser/create`, 'POST', "include", parameterAddSub)
            const response = await requestAwait.json()

            if (response.messageCode == 0000 || response.messageCode == null) {
                document.getElementById("lbAlertSuccess").setAttribute("set-lan", "text:Add sub user success");
                SetLan(localStorage.getItem("Language"));
                $("#myModalLoad").modal('hide');
                $('#modalAlertSuccess').modal();
                setTimeout(function () {
                    window.location.href = "/Menu_MemberManagement/sub_accounts.aspx?s=" + ValScroll;
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

        const postEditSub = async () => {
            const parameterAddSub = {
                username: $('#username').val(),
                nickName: $('#nickname').val(),
                phone: $('#phonenumber').val(),
                permissions: {
                    dashboard: $("input[name='DashboardRadio']:checked").val(),
                    account: $("input[name='AccountRadio']:checked").val(),
                    member: $("input[name='MemberManagementRadio']:checked").val(),
                    report: $("input[name='ReportRadio']:checked").val(),
                    payment: $("input[name='PaymentRadio']:checked").val(),
                    announcement: $("input[name='AnnouncementsRadio']:checked").val(),
                    mission: $("input[name='MissionRadio']:checked").val(),
                    stockManagement: $("input[name='StockMngementRadio']:checked").val(),
                    feedback: $("input[name='FeedbackRadio']:checked").val(),
                    userOnline: $("input[name='OnlineUserRadio']:checked").val(),
                    randomJackpot: $("input[name='RedEnvelopeRadio']:checked").val(),
                    market: $("input[name='MarketRadio']:checked").val(),
                    notification: $("input[name='NotificationRadio']:checked").val(),
                    tournament: $("input[name='TournamentRadio']:checked").val(),
                    dailyReward: $("input[name='DailyRewardsRadio']:checked").val(),
                    marketingTools: $("input[name='MarketingToolsRadio']:checked").val(),
                    lotto: $("input[name='LuckyDrawRadio']:checked").val(),
                    gameMarket: $("input[name='GameMarketRadio']:checked").val()
                }
            }
            const requestAwait = await fetchDataSite(`${apiURL}/v1/subuser/update`, 'POST', "include", parameterAddSub)
            const response = await requestAwait.json()

            if (response.messageCode == 0000 || response.messageCode == null) {
                document.getElementById("lbAlertSuccess").setAttribute("set-lan", "text:Edit sub user success");
                SetLan(localStorage.getItem("Language"));
                $("#myModalLoad").modal('hide');
                $('#modalAlertSuccess').modal();
                setTimeout(function () {
                    window.location.href = "/Menu_MemberManagement/sub_accounts.aspx?s=" + ValScroll;
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

        const postUser = async (username) => {
            const parameterSub = {
                page: 1,
                size: 100
            }
            const requestAwait = await fetchDataSite(`${apiURL}/v1/subuser/inquiry`, 'POST', "include", parameterSub)
            const response = await requestAwait.json()

            if (response.messageCode == 0000 || response.messageCode == null) {
                for (var i = 0; i < response.data.length; i++) {
                    if (response.data[i].id == username) {
                        $('#username').val(response.data[i].username);
                        $('#nickname').val(response.data[i].nickName);
                        $('#phonenumber').val(response.data[i].phone);

                        var Lock = response.data[i].isLock;
                        var LockFailed = response.data[i].isLockedForLogin;
                        var txtDash = response.data[i].permissions.dashboard;
                        var txtAccount = response.data[i].permissions.account;
                        var txtMember = response.data[i].permissions.member;
                        var txtReport = response.data[i].permissions.report;
                        var txtPayment = response.data[i].permissions.payment;
                        var txtAnnouncements = response.data[i].permissions.announcement;
                        var txtMission = response.data[i].permissions.mission;
                        var txtStockMngement = response.data[i].permissions.stockManagement;
                        var txtFeedback = response.data[i].permissions.feedback;
                        var txtOnlineUser = response.data[i].permissions.userOnline;
                        var txtRedEnvelope = response.data[i].permissions.randomJackpot;
                        var txtMarket = response.data[i].permissions.market;
                        var txtNotification = response.data[i].permissions.notification;
                        var txtTournament = response.data[i].permissions.tournament;
                        var txtDailyReward = response.data[i].permissions.dailyReward;
                        var txtMarketingTools = response.data[i].permissions.marketingTools;
                        var txtLotto = response.data[i].permissions.lotto;
                        var txtGameMarket = response.data[i].permissions.gameMarket;

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
                        document.getElementById("lockFailed").setAttribute("set-lan", "value:" + LockFailed + "");
                        document.getElementById("lock").setAttribute("set-lan", "value:" + Lock + "");
                        document.getElementById("txtLock").setAttribute("set-lan", "text:" + Lock + "");

                        if (txtDash == "OFF") {
                            document.getElementById("DashboardRadio_off").checked = true;
                        }
                        else if (txtDash == "VIEW") {
                            document.getElementById("DashboardRadio_view").checked = true;
                        }
                        else if (txtDash == "EDIT") {
                            document.getElementById("DashboardRadio_edit").checked = true;
                        }

                        if (txtAccount == "OFF") {
                            document.getElementById("AccountRadio_off").checked = true;
                        }
                        else if (txtAccount == "VIEW") {
                            document.getElementById("AccountRadio_view").checked = true;
                        }
                        else if (txtAccount == "EDIT") {
                            document.getElementById("AccountRadio_edit").checked = true;
                        }

                        if (txtMember == "OFF") {
                            document.getElementById("MemberManagementRadio_off").checked = true;
                        }
                        else if (txtMember == "VIEW") {
                            document.getElementById("MemberManagementRadio_view").checked = true;
                        }
                        else if (txtMember == "EDIT") {
                            document.getElementById("MemberManagementRadio_edit").checked = true;
                        }

                        if (txtReport == "OFF") {
                            document.getElementById("ReportRadio_off").checked = true;
                        }
                        else if (txtReport == "VIEW") {
                            document.getElementById("ReportRadio_view").checked = true;
                        }
                        else if (txtReport == "EDIT") {
                            document.getElementById("ReportRadio_edit").checked = true;
                        }

                        if (txtPayment == "OFF") {
                            document.getElementById("PaymentRadio_off").checked = true;
                        }
                        else if (txtPayment == "VIEW") {
                            document.getElementById("PaymentRadio_view").checked = true;
                        }
                        else if (txtPayment == "EDIT") {
                            document.getElementById("PaymentRadio_edit").checked = true;
                        }

                        if (txtAnnouncements == "OFF") {
                            document.getElementById("AnnouncementsRadio_off").checked = true;
                        }
                        else if (txtAnnouncements == "VIEW") {
                            document.getElementById("AnnouncementsRadio_view").checked = true;
                        }
                        else if (txtAnnouncements == "EDIT") {
                            document.getElementById("AnnouncementsRadio_edit").checked = true;
                        }

                        if (txtMission == "OFF") {
                            document.getElementById("MissionRadio_off").checked = true;
                        }
                        else if (txtMission == "VIEW") {
                            document.getElementById("MissionRadio_view").checked = true;
                        }
                        else if (txtMission == "EDIT") {
                            document.getElementById("MissionRadio_edit").checked = true;
                        }

                        if (txtStockMngement == "OFF") {
                            document.getElementById("StockMngementRadio_off").checked = true;
                        }
                        else if (txtStockMngement == "VIEW") {
                            document.getElementById("StockMngementRadio_view").checked = true;
                        }
                        else if (txtStockMngement == "EDIT") {
                            document.getElementById("StockMngementRadio_edit").checked = true;
                        }

                        if (txtFeedback == "OFF") {
                            document.getElementById("FeedbackRadio_off").checked = true;
                        }
                        else if (txtFeedback == "VIEW") {
                            document.getElementById("FeedbackRadio_view").checked = true;
                        }
                        else if (txtFeedback == "EDIT") {
                            document.getElementById("FeedbackRadio_edit").checked = true;
                        }

                        if (txtOnlineUser == "OFF") {
                            document.getElementById("OnlineUserRadio_off").checked = true;
                        }
                        else if (txtOnlineUser == "VIEW") {
                            document.getElementById("OnlineUserRadio_view").checked = true;
                        }
                        else if (txtOnlineUser == "EDIT") {
                            document.getElementById("OnlineUserRadio_edit").checked = true;
                        }

                        if (txtRedEnvelope == "OFF" || txtRedEnvelope == "") {
                            document.getElementById("RedEnvelopeRadio_off").checked = true;
                        }
                        else if (txtRedEnvelope == "VIEW") {
                            document.getElementById("RedEnvelopeRadio_view").checked = true;
                        }
                        else if (txtRedEnvelope == "EDIT") {
                            document.getElementById("RedEnvelopeRadio_edit").checked = true;
                        }

                        if (txtMarket == "OFF" || txtMarket == "") {
                            document.getElementById("MarketRadio_off").checked = true;
                        }
                        else if (txtMarket == "VIEW") {
                            document.getElementById("MarketRadio_view").checked = true;
                        }
                        else if (txtMarket == "EDIT") {
                            document.getElementById("MarketRadio_edit").checked = true;
                        }

                        if (txtNotification == "OFF" || txtNotification == "") {
                            document.getElementById("NotificationRadio_off").checked = true;
                        }
                        else if (txtNotification == "VIEW") {
                            document.getElementById("NotificationRadio_view").checked = true;
                        }
                        else if (txtNotification == "EDIT") {
                            document.getElementById("NotificationRadio_edit").checked = true;
                        }

                        if (txtTournament == "OFF" || txtTournament == "") {
                            document.getElementById("TournamentRadio_off").checked = true;
                        }
                        else if (txtTournament == "VIEW") {
                            document.getElementById("TournamentRadio_view").checked = true;
                        }
                        else if (txtTournament == "EDIT") {
                            document.getElementById("TournamentRadio_edit").checked = true;
                        }

                        if (txtDailyReward == "OFF" || txtDailyReward == "") {
                            document.getElementById("DailyRewardsRadio_off").checked = true;
                        }
                        else if (txtDailyReward == "VIEW") {
                            document.getElementById("DailyRewardsRadio_view").checked = true;
                        }
                        else if (txtDailyReward == "EDIT") {
                            document.getElementById("DailyRewardsRadio_edit").checked = true;
                        }

                        if (txtMarketingTools == "OFF" || txtMarketingTools == "") {
                            document.getElementById("MarketingToolsRadio_off").checked = true;
                        }
                        else if (txtMarketingTools == "VIEW") {
                            document.getElementById("MarketingToolsRadio_view").checked = true;
                        } else if (txtMarketingTools == "EDIT") {
                            document.getElementById("MarketingToolsRadio_edit").checked = true;
                        }

                        if (txtLotto == "OFF" || txtLotto == "") {
                            document.getElementById("LuckyDrawRadio_off").checked = true;
                        }
                        else if (txtLotto == "VIEW") {
                            document.getElementById("LuckyDrawRadio_view").checked = true;
                        } else if (txtLotto == "EDIT") {
                            document.getElementById("LuckyDrawRadio_edit").checked = true;
                        }

                        if (txtGameMarket == "OFF" || txtGameMarket == "") {
                            document.getElementById("GameMarketRadio_off").checked = true;
                        }
                        else if (txtGameMarket == "VIEW") {
                            document.getElementById("GameMarketRadio_view").checked = true;
                        } else if (txtGameMarket == "EDIT") {
                            document.getElementById("GameMarketRadio_edit").checked = true;
                        }
                    }
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

        const postNewPass = async () => {
            const parameterCom = {
                username: $('#username').val(),
                newPassword: $('#password_new').val()
            }
            const requestAwait = await fetchDataSite(`${apiURL}/v1/subuser/update_password`, 'POST', "include", parameterCom)
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

        const postEditStatus = async (lock) => {
            const parameterCom = {
                username: $('#username').val(),
                isLock: lock
            }

            const requestAwait = await fetchDataSite(`${apiURL}/v1/user/update_status`, 'POST', "include", parameterCom)
            const response = await requestAwait.json()
            if (response.messageCode == 0000 || response.messageCode == null) {
                document.getElementById("lbAlertSuccess").setAttribute("set-lan", "text:Edit status lock success");
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
            const requestAwait = await fetchDataSite(`${apiURL}/v1/subuser/unlock_for_login`, 'POST', "include", parameterCom)
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
    </script>
</asp:Content>
