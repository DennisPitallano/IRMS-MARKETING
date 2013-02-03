<%@ Page Title="" Language="C#" MasterPageFile="~/Marketing/Marketing.Master" AutoEventWireup="true" CodeBehind="TransferManagementPanel.aspx.cs" Inherits="IntegratedResourceManagementSystem.Marketing.TransferManagementPanel" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Src="~/Marketing/controls/UCLoader.ascx" TagName="LOADER" TagPrefix="UC" %>
<asp:Content ID="HeadContent" ContentPlaceHolderID="head" runat="server">
    <link href="../Styles/returns-and-transfer.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/pull-out-letter.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="panelTitle">
        <asp:Image ID="imgpnlTitle" runat="server" ImageUrl="~/Resources/memo-doc.png" ImageAlign="Top"
            Height="28px" />Transfer Management Panel
        <div style="float: right; height: 24px;">
            <a href="ReturnAndTransfer.aspx"><img alt="BACK" src="../Resources/reply.png" alt="BACK" /></a>
        </div>
    </div>
    
      <div style="min-height: 450px;">
        <asp:UpdatePanel ID="upnlPullOutLetters" runat="server">
            <ContentTemplate>
                <div style="height: 26px; margin-bottom: 1px;" class="modalDrag">
                    <div style="float: right;" class="SearchTextContainer">
                        SEARCH:
                        <asp:TextBox ID="txtSearch" runat="server" autofocus placeholder="Search Transfer"
                            CssClass="modalText" AutoPostBack="True" Height="16px" Font-Size="10px" Width="150px"
                            ToolTip="Search Transfer"></asp:TextBox>
                        <asp:ImageButton ID="imgBtnSearch" runat="server" ImageAlign="AbsBottom" ImageUrl="~/Resources/search.png"
                            ToolTip="SEARCH" />
                    </div>
                    <div style="float: left;">
                        <div style="float: left; margin-right: 5px;">
                            <a href="NewTransfer.aspx" style="text-decoration: none;">
                                <input id="btnNew" type="button" value="NEW" class="btnNew" />
                            </a>
                        </div>
                        <div style="float: left; margin-right: 5px;">
                            <asp:Button ID="btnUpdate" runat="server" Text="UPDATE" CssClass="btnUpdate" Font-Names="Verdana"
                                ViewStateMode="Disabled" />
                        </div>
                        <div style="float: left; margin-right: 5px; line-height:23px;">
                            <asp:HyperLink ID="hpLinkPullOutLetterDetails" Target="_blank" Height="23px" CssClass="btnPrint print-details" runat="server">DETAILS</asp:HyperLink>
                        </div>
                        <div style="float: left; margin-right: 5px;">
                            <asp:Button ID="btnDelete" runat="server" Text="DELETE" CssClass="btnDelete" Font-Names="Verdana"
                                ViewStateMode="Disabled" />
                            <asp:ModalPopupExtender ID="btnDelete_ModalPopupExtender" runat="server" CancelControlID="btnNo"
                                DynamicServicePath="" Enabled="True" PopupControlID="pnlDeleteModal" PopupDragHandleControlID="pnlDeleteModalDrag"
                                TargetControlID="btnDelete" BackgroundCssClass="bgModal">
                                <Animations>
                                <OnShown>
                                    <FadeIn Duration=".2" />
                                </OnShown>
                                </Animations>
                            </asp:ModalPopupExtender>
                        </div>
                        <div style="float: left; margin-right: 5px;">
                            <asp:Button ID="btnPrint" runat="server" Text="PRINT" CssClass="btnPrint" Font-Names="Verdana"
                                ViewStateMode="Disabled" />
                        </div>
                        <div style="float: left; padding-left: 15px; padding-top: 7px; cursor: pointer;">
                            <asp:Image ID="imgSettings" runat="server" title="Parameter Settings [Brand Department Code]/[Branch Department Code]" ImageAlign="Baseline" ImageUrl="~/Resources/hardware-icon.png" />
                            <asp:HoverMenuExtender ID="imgSettings_HoverMenuExtender" runat="server" DynamicServicePath=""
                                Enabled="True" TargetControlID="imgSettings" PopupControlID="pnlSettingOption" PopupPosition="Bottom">
                            </asp:HoverMenuExtender>
                            <asp:Panel ID="pnlSettingOption" runat="server">
                                <div class="hover-menu-arrow">
                                </div>
                                <div class="hover-menu">
                                    <div class="new-link">
                                        <a title="Go to Brand Department Codes Management Panel" href="BrandDepartmentCodeManagementPanel.aspx" style="text-decoration: none;">BRAND DEPARTMENT CODES
                                        </a>
                                    </div>
                                    <div class="new-link">
                                        <a title="Go to Branch Department Codes Management Panel" href="BranchDepartmentCodeManagementPanel.aspx" style="text-decoration: none;">BRANCH DEPARTMENT CODES
                                        </a>
                                    </div>
                                </div>
                            </asp:Panel>
                        </div>
                        <div style="float: left; margin-right: 5px;">
                            <asp:UpdateProgress ID="upProgress" runat="server" AssociatedUpdatePanelID="upnlPullOutLetters">
                                <ProgressTemplate>
                                    <asp:PlaceHolder ID="plcHLoader" runat="server" EnableViewState="False">
                                        <UC:LOADER ID="loader" runat="server" />
                                    </asp:PlaceHolder>
                                </ProgressTemplate>
                            </asp:UpdateProgress>
                        </div>
                    </div>
                </div>

                <div>
                <div class="titleForm">
                    LIST OF RETURNS
                </div>
                </div>

                <%--Delete Modal--%>
                <asp:Panel ID="pnlDeleteModal" runat="server" CssClass="modal">
                    <asp:Panel ID="pnlDeleteModalDrag" runat="server" CssClass="modalDrag">
                        <div class="sizeLogo">
                            <img alt="new brand" src="../Resources/code-icon.png" height="16" align="top" />
                            CONFIRMATION!!!
                        </div>
                    </asp:Panel>
                    <div style="border: 1px solid #FFCC66; text-align: center; font-family: Verdana;
                        font-size: 12px; height: 23px; color: #CC6600; background-color: #FFFF99; line-height: 16px;
                        margin: 2px 5px;">
                        <img alt="error update" src="../Resources/warning.png" height="22px" align="middle" />
                        Warning: This action cannot be undo.
                    </div>
                    <div style="text-align: center; color: #FFFF99; font-family: Verdana; font-size: 11px;
                        margin: 5px 2px;">
                        <asp:Label ID="lblBrandToDelete" runat="server" Text="No data to delete. Select from the list and try again."></asp:Label>
                    </div>
                    <div style="text-align: center; margin: 5px 0px;">
                        <asp:Button ID="btnYes" runat="server" Text="YES" CssClass="modalWarningButtonYes"
                            ToolTip="Delete" Enabled="False" />
                        <asp:Button ID="btnNo" runat="server" Text="NO" CssClass="modalWarningButtonNo" ToolTip="Cancel"
                            ViewStateMode="Disabled" />
                    </div>
                </asp:Panel>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>