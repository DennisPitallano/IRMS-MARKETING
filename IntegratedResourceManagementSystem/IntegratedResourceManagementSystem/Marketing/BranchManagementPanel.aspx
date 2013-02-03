<%@ Page Title="" Language="C#" MasterPageFile="~/Marketing/Marketing.Master" AutoEventWireup="true"
    CodeBehind="BranchManagementPanel.aspx.cs" Inherits="IntegratedResourceManagementSystem.Marketing.BranchManagementPanel" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="HeadContent" ContentPlaceHolderID="head" runat="server">
    <link href="../Styles/branch-management.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/permission-note.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div style="height:28px; margin-bottom:10px; line-height:28px; color: #333;text-shadow: 1px 1px 0px white;">
        <asp:Image ID="imgpnlTitle" runat="server" ImageUrl="~/Resources/Branch-icon.png"
            ImageAlign="Top" Height="28px" />
        &nbsp;<asp:Label ID="Label1" runat="server" Text="BRANCH MANAGEMENT PANEL" Font-Bold="True"
            Font-Names="Verdana" Font-Size="14px"></asp:Label>
        <div style="float: right;">
            <asp:ImageButton ID="imgBtnBack" runat="server" ImageUrl="~/Resources/reply.png"
                PostBackUrl="~/Marketing/CustomerMenuPanel.aspx" ToolTip="BACK" />
        </div>
        <hr />
    </div>
    <asp:UpdatePanel ID="upnlBranch" runat="server">
        <ContentTemplate>
            <div style=" height: 26px; margin-bottom: 1px;" class="modalDrag">
                <div style="float: right;" class="SearchTextContainer">
                SEARCH:
                    <asp:TextBox ID="txtSearch" runat="server" autofocus placeholder="Search Branch" CssClass ="modalText" OnTextChanged="txtSearch_TextChanged" Height="16px" Font-Size="10px"></asp:TextBox>
                    <asp:ImageButton ID="imgBtnSearch"  runat="server" ImageAlign="AbsBottom" ImageUrl="~/Resources/search.png"
                        ToolTip="SEARCH" />
                </div>
                <div style="float: left; height: 30px;">
                    <div style="float: left; margin-right: 5px;">
                        <asp:Button ID="btnNewBranch" runat="server" Text="NEW" CssClass="btnNew" Font-Names="Verdana" />
                        <asp:ModalPopupExtender ID="btnNewBranch_ModalPopupExtender" runat="server" DynamicServicePath=""
                            Enabled="True" PopupControlID="pnlNewBranchModal" PopupDragHandleControlID="pnlNewBranchModalDrag"
                            TargetControlID="btnNewBranch" BackgroundCssClass="bgModal" CancelControlID="imgBtnCloseNewSizeModal">
                        </asp:ModalPopupExtender>
                    </div>
                    <div style="float: left; margin-right: 5px;">
                        <asp:Button ID="btnUpdateBranch" runat="server" Text="UPDATE" CssClass="btnUpdate"
                            Font-Names="Verdana" />
                        <asp:ModalPopupExtender ID="btnUpdateBranch_ModalPopupExtender" runat="server" CancelControlID="imgBtnCloseUpdateSizeModal"
                            DynamicServicePath="" Enabled="True" PopupControlID="pnlUpdateBranchModal" PopupDragHandleControlID="pnlUpdateBranchModalDrag"
                            TargetControlID="btnUpdateBranch" BackgroundCssClass="bgModal">
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
            <div class="listContent" style="float:left;">
                <div class="titleList">
                    <asp:Image ID="imgList" runat="server" Height="16px" Width="20px" ImageUrl="~/Resources/Branch-icon.png"
                        ImageAlign="Top" />
                    LIST OF BRANCH</div>
                <asp:Panel ID="pnlBranchList" runat="server"  CssClass="branch-list" ScrollBars="Auto">
                    <asp:GridView ID="gvBranchList" runat="server" CellPadding="4" GridLines="None" AutoGenerateColumns="False" 
                       CssClass ="table_grid"  
                        OnSelectedIndexChanged="gvBranchList_SelectedIndexChanged" 
                        EnableSortingAndPagingCallbacks="True" PageSize="13" 
                        DataKeyNames="RecordNo" EnablePersistedSelection="True">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:TemplateField>
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Image ID="Image1" runat="server" Height="16px" ImageUrl="~/Resources/Branch-icon.png" />
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
                            <asp:BoundField DataField="BranchCode" HeaderText="BRANCH CODE">
                                <HeaderStyle Wrap="False" />
                                <ItemStyle Wrap="False" />
                            </asp:BoundField>
                            <asp:BoundField DataField="BranchName" HeaderText="BRANCH NAME">
                                <HeaderStyle Wrap="False" />
                                <ItemStyle Wrap="False" />
                            </asp:BoundField>
                            <asp:BoundField DataField="AddressOne" HeaderText="ADDRESS">
                                <HeaderStyle Wrap="False" />
                                <ItemStyle Wrap="False" />
                            </asp:BoundField>
                            <asp:BoundField DataField="ContactPerson" HeaderText="CONTACT PERSON">
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
                        <PagerStyle  CssClass="pager" />
                        <RowStyle BackColor="#E3EAEB" />
                        <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="False" ForeColor="#333333" Font-Names="Verdana"
                            Font-Size="11px" Font-Italic="True" />
                        <SortedAscendingCellStyle BackColor="#F8FAFA" />
                        <SortedAscendingHeaderStyle BackColor="#246B61" />
                        <SortedDescendingCellStyle BackColor="#D4DFE1" />
                        <SortedDescendingHeaderStyle BackColor="#15524A" />
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

            <asp:Panel ID="pnlNewBranchModal" runat="server" CssClass="modal" OnLoad="pnlNewBranchModal_Load">
                <asp:Panel ID="pnlNewBranchModalDrag" runat="server" CssClass="modalDrag">
                    <div class="close_btn">
                        <asp:ImageButton ID="imgBtnCloseNewSizeModal" runat="server" CssClass="btnClose"
                            ImageUrl="~/Resources/cancel_gray.png" ToolTip="CLOSE" />
                    </div>
                    <div class="sizeLogo">
                        <asp:Image ID="imgAccountLogo" runat="server" Height="16px" ImageAlign="Top"
                            ImageUrl="~/Resources/Branch-icon.png" />
                        NEW BRANCH</div>
                </asp:Panel>
                <div style="margin:5px 5px;">
                <table style="width: 100%;" cellspacing="0" cellpadding="0">
                    <tr>
                        <td class="modalLabel" style="text-align: right;">
                            ACCOUNT NAME:
                        </td>
                        <td>
                            <asp:DropDownList ID="dlAccounts" CssClass="modalText" runat="server" Width="160px" Height="22px" OnSelectedIndexChanged="dlAccounts_SelectedIndexChanged">
                            </asp:DropDownList>
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td class="modalLabel" style="text-align: right;">
                            BRANCH CODE:
                        </td>
                        <td class="style1">
                            <asp:TextBox ID="txtBranchCode" runat="server" Height="22px" Font-Names="Verdana"
                                ForeColor="#333333" Width="150px" BackColor="#CCCCCC" ReadOnly="True">[AUTO GENERATED]</asp:TextBox>
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td class="modalLabel" style="text-align: right;">
                            BRANCH NAME:
                        </td>
                        <td class="style1">
                            <asp:TextBox ID="txtBranchName" runat="server" Height="20px" CssClass="modalText" Width="200px"></asp:TextBox>
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <%--(S)christine--%>
                    <tr>
                        <td class="modalLabel" style="text-align: right">
                            ADDRESS 1:
                        </td>
                        <td class="style1">
                            <asp:TextBox ID="txtAddressOne" runat="server" CssClass="modalText"
                                Height="20px" Width="200px"></asp:TextBox>
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td class="modalLabel" style="text-align: right;">
                            ADDRESS 2:
                        </td>
                        <td class="style1">
                            <asp:TextBox ID="txtAddressTwo" runat="server" CssClass="modalText"
                                Height="20px" Width="200px"></asp:TextBox>
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td class="modalLabel" style="text-align: right">
                            CONTACT PERSON:
                        </td>
                        <td class="style1">
                            <asp:TextBox ID="txtContactPerson" runat="server" CssClass="modalText"
                                Height="20px" Width="200px"></asp:TextBox>
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td class="modalLabel" style="text-align: right;">
                            POSITION:
                        </td>
                        <td class="style1">
                            <asp:TextBox ID="txtPosition" runat="server" CssClass="modalText"
                                Height="20px" Width="200px"></asp:TextBox>
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td class="modalLabel" style="text-align: right;">
                            TELEPHONE NO.:
                        </td>
                        <td class="style1">
                            <asp:TextBox ID="txtTelNo" runat="server" CssClass="modalText"
                                Height="20px" Width="200px"></asp:TextBox>
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td class="modalLabel" style="text-align: right;">
                            MOBILE NO.:
                        </td>
                        <td class="style1">
                            <asp:TextBox ID="txtMobileNo" runat="server" CssClass="modalText"
                                Height="20px" Width="200px"></asp:TextBox>
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td class="modalLabel" style="text-align: right;">
                            FAX NO.:
                        </td>
                        <td class="style1">
                            <asp:TextBox ID="txtFaxNo" runat="server" CssClass="modalText"
                                Height="20px" Width="200px"></asp:TextBox>
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td class="modalLabel" style="text-align: right;">
                            BILLING ADDRESS:
                        </td>
                        <td class="style1">
                            <asp:TextBox ID="txtBillingAdd" runat="server" CssClass="modalText"
                                Height="20px" Width="200px"></asp:TextBox>
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td class="modalLabel" style="text-align: right;">
                            SHIP-TO-ADDRESS:
                        </td>
                        <td class="style1">
                            <asp:TextBox ID="txtShipToBillAdd" runat="server" CssClass="modalText"
                                Height="20px" Width="200px"></asp:TextBox>
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td class="modalLabel" style="text-align: right;">
                            TIN:
                        </td>
                        <td class="style1">
                            <asp:TextBox ID="txtTIN" runat="server" CssClass="modalText"
                                Height="20px" Width="200px"></asp:TextBox>
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <%--(E)christine--%>
                    <tr>
                        <td>
                            &nbsp;
                        </td>
                        <td class="style1">
                            <div style="margin: 5px 5px;">
                                <asp:Button ID="btnSaveBranch" runat="server" Text="SAVE" CssClass="btnSave" ToolTip="Save New Branch"
                                    OnClick="btnSaveBranch_Click" />
                            </div>
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
                </div>
            </asp:Panel>
        
            <asp:Panel ID="pnlUpdateBranchModal" runat="server" CssClass="modal">
                <asp:Panel ID="pnlUpdateBranchModalDrag" runat="server" CssClass="modalDrag">
                    <div class="close_btn">
                        <asp:ImageButton ID="imgBtnCloseUpdateSizeModal" runat="server" CssClass="btnClose"
                            ImageUrl="~/Resources/cancel_gray.png" ToolTip="CLOSE" />
                    </div>
                    <div class="sizeLogo">
                        <asp:Image ID="imgUpdateLogo" runat="server" Height="16px" ImageAlign="Top"
                            ImageUrl="~/Resources/Branch-icon.png" />
                        UPDATE BRANCH</div>
                </asp:Panel>
                <div style="margin:5px 5px;">
                     <table style="width: 100%;" cellspacing="0" cellpadding="0">
                    <tr>
                        <td class="modalLabel" style="text-align: right;">
                            ACCOUNT NAME:
                        </td>
                        <td>
                            <asp:TextBox ID="txtAccountNameUpdate" runat="server" Height="22px" CssClass ="modalText" Width="150px" BackColor="#CCCCCC" ReadOnly="True"></asp:TextBox>
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td class="modalLabel" style="text-align: right;">
                            BRANCH CODE:
                        </td>
                        <td class="style1">
                            <asp:TextBox ID="txtBranchCodeUpdate" runat="server" Height="22px" 
                             CssClass="modalText" Width="150px" BackColor="#CCCCCC" ReadOnly="True"></asp:TextBox>
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td class="modalLabel" style="text-align: right;">
                            BRANCH NAME:
                        </td>
                        <td class="style1">
                            <asp:TextBox ID="txtBranchNameUpdate" runat="server" Height="20px" CssClass="modalText" Width="200px"></asp:TextBox>
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <%--(S)christine--%>
                    <tr>
                        <td class="modalLabel" style="text-align: right;">
                            ADDRESS 1:
                        </td>
                        <td class="style1">
                            <asp:TextBox ID="txtAddressOneUpdate" runat="server" CssClass="modalText"
                                Height="20px" Width="200px"></asp:TextBox>
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td class="modalLabel" style="text-align: right;">
                            ADDRESS 2:
                        </td>
                        <td class="style1">
                            <asp:TextBox ID="txtAddressTwoUpdate" runat="server" CssClass="modalText"
                                Height="20px" Width="200px"></asp:TextBox>
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td class="modalLabel" style="text-align: right;">
                            CONTACT PERSON:
                        </td>
                        <td class="style1">
                            <asp:TextBox ID="txtContactPersonUpdate" runat="server" CssClass="modalText"
                                Height="20px" Width="200px"></asp:TextBox>
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td class="modalLabel" style="text-align: right;">
                            POSITION:
                        </td>
                        <td class="style1">
                            <asp:TextBox ID="txtPositionUpdate" runat="server" CssClass="modalText"
                                Height="20px" Width="200px"></asp:TextBox>
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td class="modalLabel" style="text-align: right;">
                            TELEPHONE NO.:
                        </td>
                        <td class="style1">
                            <asp:TextBox ID="txtTelNoUpdate" runat="server" CssClass="modalText"
                                Height="20px" Width="200px"></asp:TextBox>
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td class="modalLabel" style="text-align: right;">
                            MOBILE NO.:
                        </td>
                        <td class="style1">
                            <asp:TextBox ID="txtMobileNoUpdate" runat="server" CssClass="modalText"
                                Height="20px" Width="200px"></asp:TextBox>
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td class="modalLabel" style="text-align: right;">
                            FAX NO.:
                        </td>
                        <td class="style1">
                            <asp:TextBox ID="txtFaxNoUpdate" runat="server" CssClass="modalText"
                                Height="20px" Width="200px"></asp:TextBox>
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td class="modalLabel" style="text-align: right;">
                            BILLING ADDRESS:
                        </td>
                        <td class="style1">
                            <asp:TextBox ID="txtBillAddUpdate" runat="server" CssClass="modalText"
                                Height="20px" Width="200px"></asp:TextBox>
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td class="modalLabel" style="text-align: right;">
                            SHIP-TO-ADDRESS:
                        </td>
                        <td class="style1">
                            <asp:TextBox ID="txtShipToAddUpdate" runat="server" CssClass="modalText"
                                Height="20px" Width="200px"></asp:TextBox>
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td class="modalLabel" style="text-align: right;">
                            TIN:
                        </td>
                        <td class="style1">
                            <asp:TextBox ID="txtTinUpdate" runat="server" CssClass="modalText"
                                Height="20px" Width="200px"></asp:TextBox>
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <%--(E)christine--%>
                    <tr>
                        <td>
                            &nbsp;
                        </td>
                        <td>
                            <div style="margin: 5px 5px;">
                                <asp:Button ID="btnSaveUpdate" runat="server" Text="SAVE" CssClass="btnSave" ToolTip="Update Color"
                                    OnClick="btnSaveUpdate_Click" />
                            </div>
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
                </div>
            </asp:Panel>
         
            <%--Delete Modal--%>
            <asp:Panel ID="pnlDeleteModal" runat="server" CssClass="modal">
                <asp:Panel ID="pnlDeleteModalDrag" runat="server" CssClass="modalDrag">
                    <div class="sizeLogo">
                        <asp:Image ID="Image2" runat="server" Height="16px" ImageAlign="Top" ImageUrl="~/Resources/Branch-icon.png" />
                        CONFIRMATION!!!
                    </div>
                </asp:Panel>
                <div class="modalWarningText">
                    Are you sure you want to Delete this Data?
                </div>
                <div style="text-align: center; margin: 5px 5px;">
                    <asp:Button ID="btnYes" runat="server" Text="YES" CssClass="modalWarningButtonYes"
                        ToolTip="Delete" OnClick="btnYes_Click" />
                    <asp:Button ID="btnNo" runat="server" Text="NO" CssClass="modalWarningButtonNo" ToolTip="Cancel" />
                </div>
            </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
