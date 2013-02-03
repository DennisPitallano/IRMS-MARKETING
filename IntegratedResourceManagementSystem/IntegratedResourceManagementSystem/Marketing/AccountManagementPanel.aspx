<%@ Page Title="" Language="C#" MasterPageFile="~/Marketing/Marketing.Master" AutoEventWireup="true"
    CodeBehind="AccountManagementPanel.aspx.cs" Inherits="IntegratedResourceManagementSystem.Marketing.AccountManagementPanel" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="HeadContent" ContentPlaceHolderID="head" runat="server">
    <link href="../Styles/account-management.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/permission-note.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div style="height: 28px; margin-bottom: 10px; line-height: 28px; color: #333; text-shadow: 1px 1px 0px white;">
        <asp:Image ID="imgpnlTitle" runat="server" ImageUrl="~/Resources/account-icon.png"
            ImageAlign="Top" Height="28px" />
        &nbsp;<asp:Label ID="Label1" runat="server" Text="ACCOUNT MANAGEMENT PANEL" Font-Bold="True"
            Font-Names="Verdana" Font-Size="14px"></asp:Label>
        <div style="float: right;">
            <asp:ImageButton ID="imgBtnBack" runat="server" ImageUrl="~/Resources/reply.png"
                PostBackUrl="~/Marketing/CustomerMenuPanel.aspx" ToolTip="BACK" />
        </div>
        <hr />
    </div>
    <asp:UpdatePanel ID="upnlAccounts" runat="server">
        <ContentTemplate>
            <div style="width: 100%; height: 26px; margin-bottom: 1px;" class="modalDrag">
                <div style="float: right;" class="SearchTextContainer">
                    SEARCH:
                    <asp:TextBox ID="txtSearch" autofocus placeholder="Search Account" CssClass="modalText"
                        runat="server" OnTextChanged="txtSearch_TextChanged" Height="16px" Font-Size="10px"
                        Width="150px"></asp:TextBox>
                    <asp:ImageButton ID="imgBtnSearch" runat="server" ImageAlign="AbsBottom" ImageUrl="~/Resources/search.png"
                        ToolTip="SEARCH" />
                </div>
                <div style="float: left; height: 30px;">
                    <div style="float: left; margin-right: 5px;">
                        <asp:Button ID="btnNewAccount" runat="server" Text="NEW" CssClass="btnNew" Font-Names="Verdana"
                            OnClick="btnNewAccount_Click" />
                        <asp:ModalPopupExtender ID="btnNewAccount_ModalPopupExtender" runat="server" DynamicServicePath=""
                            Enabled="True" PopupControlID="pnlNewAccountModal" PopupDragHandleControlID="pnlNewAccountModalDrag"
                            TargetControlID="btnNewAccount" BackgroundCssClass="bgModal" CancelControlID="imgBtnCloseNewSizeModal"
                            OnLoad="btnNewAccount_ModalPopupExtender_Load">
                        </asp:ModalPopupExtender>
                    </div>
                    <div style="float: left; margin-right: 5px;">
                        <asp:Button ID="btnUpdateAccount" runat="server" Text="UPDATE" CssClass="btnUpdate"
                            Font-Names="Verdana" />
                        <asp:ModalPopupExtender ID="btnUpdateAccount_ModalPopupExtender" runat="server" CancelControlID="imgBtnCloseUpdateSizeModal"
                            DynamicServicePath="" Enabled="True" PopupControlID="pnlUpdateAccountModal" PopupDragHandleControlID="pnlUpdateAccountModalDrag"
                            TargetControlID="btnUpdateAccount" BackgroundCssClass="bgModal">
                        </asp:ModalPopupExtender>
                    </div>
                    <div style="float: left; margin-right: 5px;">
                        <asp:Button ID="btnDelete" runat="server" Text="DELETE" CssClass="btnDelete" Font-Names="Verdana" />
                        <asp:ModalPopupExtender ID="btnDelete_ModalPopupExtender" runat="server" CancelControlID="btnNo"
                            DynamicServicePath="" Enabled="True" PopupControlID="pnlDeleteModal" PopupDragHandleControlID="pnlDeleteModalDrag"
                            TargetControlID="btnDelete" BackgroundCssClass="bgModal">
                        </asp:ModalPopupExtender>
                    </div>
                    <div style="float: left; margin-right: 5px;">
                        <asp:Button ID="btnPrint" runat="server" Text="PRINT" CssClass="btnPrint" Font-Names="Verdana" />
                    </div>
                </div>
            </div>
            <div class="listContent" style="float: left;">
                <div class="titleList">
                    <asp:Image ID="imgList" runat="server" Height="16px" Width="20px" ImageUrl="~/Resources/account-icon.png"
                        ImageAlign="AbsBottom" />
                    LIST OF ACCOUNTS</div>
                <asp:Panel ID="pnlAccountList" runat="server" CssClass="account-list" ScrollBars="Auto">
                    <asp:GridView ID="gvAccountList" runat="server" CellPadding="4" GridLines="None"
                        AutoGenerateColumns="False" CssClass="table_grid" OnSelectedIndexChanged="gvAccountList_SelectedIndexChanged">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:TemplateField>
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Image ID="Image1" runat="server" Height="16px" ImageUrl="~/Resources/account-icon.png" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:CommandField ShowSelectButton="True" />
                            <asp:BoundField DataField="RecordNo" HeaderText="RECORD #">
                                <HeaderStyle Wrap="False" />
                                <ItemStyle Wrap="False" />
                            </asp:BoundField>
                            <asp:BoundField DataField="AccountCode" HeaderText="ACCOUNT CODE">
                                <HeaderStyle Wrap="False" />
                                <ItemStyle Wrap="False" />
                            </asp:BoundField>
                            <asp:BoundField DataField="AccountName" HeaderText="ACCOUNT NAME">
                                <HeaderStyle Wrap="False" />
                                <ItemStyle Wrap="False" />
                            </asp:BoundField>
                        </Columns>
                        <EditRowStyle BackColor="#7C6F57" />
                        <EmptyDataTemplate>
                            <div style="text-align: center; width: 570px; padding: 5px 0px; border: 1px Solid Gray;">
                                <img src="../Resources/unhappy.png" alt="WALA!!" align="middle" />
                                DATA NOT FOUND!!!
                            </div>
                        </EmptyDataTemplate>
                        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                        <PagerStyle CssClass="pager" />
                        <RowStyle BackColor="#E3EAEB" />
                        <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="False" ForeColor="#333333" Font-Names="Verdana"
                            Font-Size="11px" Font-Italic="True" />
                        <SortedAscendingCellStyle CssClass="asc_cell_style" />
                        <SortedAscendingHeaderStyle CssClass="asc_cell_style_h" />
                        <SortedDescendingCellStyle CssClass="desc_cell_style" />
                        <SortedDescendingHeaderStyle CssClass="desc_cell_style_h" />
                    </asp:GridView>
                </asp:Panel>
            </div>
            <asp:Panel CssClass="permission-container" ID="pnlNotification" Visible="false" runat="server">
                <asp:CollapsiblePanelExtender ID="CollapsiblePaneItemMaster" runat="server" CollapseControlID="lblNoteCollapsHandler"
                    CollapsedText="dennis" ExpandedText="pitallano" TargetControlID="pnlPermissionNotification"
                    ExpandControlID="lblNoteCollapsHandler" Collapsed="True">
                </asp:CollapsiblePanelExtender>
                <div class="collaps-link">
                    <asp:Label CssClass="collaps-text" ID="lblNoteCollapsHandler" Height="48px" runat="server"
                        Text="NOTE" ToolTip="Show/Hide Notification"></asp:Label>
                </div>
                <asp:Panel CssClass="note-container" ID="pnlPermissionNotification" runat="server">
                    <asp:Label ID="lblPermissionNotifications" runat="server" Text="Label"></asp:Label>
                </asp:Panel>
            </asp:Panel>
            <asp:Panel ID="pnlNewAccountModal" runat="server" CssClass="modal" OnLoad="pnlNewAccountModal_Load">
                <asp:Panel ID="pnlNewAccountModalDrag" runat="server" CssClass="modalDrag">
                    <div class="close_btn">
                        <asp:ImageButton ID="imgBtnCloseNewSizeModal" runat="server" CssClass="btnClose"
                            ImageUrl="~/Resources/cancel_gray.png" ToolTip="CLOSE" />
                    </div>
                    <div class="sizeLogo">
                        <asp:Image ID="imgAccountLogo" runat="server" Height="16px" ImageAlign="Top" ImageUrl="~/Resources/account-icon.png" />
                        NEW ACCOUNT</div>
                </asp:Panel>
                <table style="width: 100%;">
                    <tr>
                        <td class="modalLabel">
                            ACCOUNT CODE:
                        </td>
                        <td>
                            <asp:TextBox ID="txtAccountCode" runat="server" Height="22px" Font-Names="Verdana"
                                ForeColor="#333333" Width="160px" BackColor="#CCCCCC" ReadOnly="True"></asp:TextBox>
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td class="modalLabel">
                            ACCOUNT NAME:
                        </td>
                        <td>
                            <asp:TextBox ID="txtAccountName" runat="server" Height="22px" CssClass="modalText"
                                Width="210px"></asp:TextBox>
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;
                        </td>
                        <td>
                            <asp:Button ID="btnSaveAccount" runat="server" Text="SAVE" CssClass="btnSave" ToolTip="Save New Account"
                                OnClick="btnSaveAccount_Click" />
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3" style="text-align: center">
                            <asp:Label ID="lblErrorMessage" runat="server" ForeColor="White"></asp:Label>
                        </td>
                    </tr>
                </table>
            </asp:Panel>
            <asp:Panel ID="pnlUpdateAccountModal" runat="server" CssClass="modal">
                <asp:Panel ID="pnlUpdateAccountModalDrag" runat="server" CssClass="modalDrag">
                    <div class="close_btn">
                        <asp:ImageButton ID="imgBtnCloseUpdateSizeModal" runat="server" CssClass="btnClose"
                            ImageUrl="~/Resources/cancel_gray.png" ToolTip="CLOSE" />
                    </div>
                    <div class="sizeLogo">
                        <asp:Image ID="imgUpdateLogo" runat="server" Height="16px" ImageAlign="Top" ImageUrl="~/Resources/account-icon.png" />
                        UPDATE ACCOUNT</div>
                </asp:Panel>
                <table style="width: 100%;">
                    <tr>
                        <td class="modalLabel">
                            ACCOUNT CODE:
                        </td>
                        <td>
                            <asp:TextBox ID="txtAccountCodeUpdate" runat="server" Height="22px" Font-Names="Verdana"
                                ForeColor="#333333" Width="160px" ReadOnly="True" BackColor="#CCCCCC"></asp:TextBox>
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td class="modalLabel">
                            ACCOUNT NAME:
                        </td>
                        <td>
                            <asp:TextBox ID="txtAccountNameUpdate" runat="server" Height="22px" CssClass="modalText"
                                Width="210px"></asp:TextBox>
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;
                        </td>
                        <td>
                            <asp:Button ID="btnSaveUpdate" runat="server" Text="SAVE" CssClass="btnSave" ToolTip="Update Account"
                                OnClick="btnSaveUpdate_Click" />
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3" style="text-align: center">
                            <asp:Label ID="lblErrorMessageUpdate" runat="server" ForeColor="White"></asp:Label>
                        </td>
                    </tr>
                </table>
            </asp:Panel>
            <%--Delete Modal--%>
            <asp:Panel ID="pnlDeleteModal" runat="server" CssClass="modal">
                <asp:Panel ID="pnlDeleteModalDrag" runat="server" CssClass="modalDrag">
                    <div class="sizeLogo">
                        <asp:Image ID="Image2" runat="server" Height="16px" ImageAlign="Top" ImageUrl="~/Resources/account-icon.png" />
                        CONFIRMATION!!!
                    </div>
                </asp:Panel>
                <div class="modalWarningText" style="padding: 3px 3px;">
                    Are you sure you want to Delete this Data?
                </div>
                <div style="margin: 6px 5px; text-align: center;">
                    <asp:Button ID="btnYes" runat="server" Text="YES" CssClass="modalWarningButtonYes"
                        ToolTip="Delete" OnClick="btnYes_Click" />
                    <asp:Button ID="btnNo" runat="server" Text="NO" CssClass="modalWarningButtonNo" ToolTip="Cancel" />
                </div>
            </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
