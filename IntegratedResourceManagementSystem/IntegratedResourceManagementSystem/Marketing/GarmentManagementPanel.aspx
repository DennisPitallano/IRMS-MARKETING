<%@ Page Title="" Language="C#" MasterPageFile="~/Marketing/Marketing.Master" AutoEventWireup="true"
    CodeBehind="GarmentManagementPanel.aspx.cs" Inherits="IntegratedResourceManagementSystem.Marketing.GarmentManagementPanel" %>

<%@ OutputCache CacheProfile="cached_profile" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register TagPrefix="form" TagName="Garment" Src="~/Marketing/forms/FGarment.ascx" %>
<%@ Register Src="~/Marketing/controls/UCLoader.ascx" TagName="LOADER" TagPrefix="UC" %>
<asp:Content ID="HeadContent" ContentPlaceHolderID="head" runat="server">
    <link href="../Styles/garment-management.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/permission-note.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div style="height: 28px; margin-bottom: 10px; line-height: 28px; color: #333; text-shadow: 1px 1px 0px white;">
        <asp:Image ID="imgpnlTitle" runat="server" ImageUrl="~/Resources/garments.png" ImageAlign="Top"
            Height="23px" />
        &nbsp;<asp:Label ID="Label3" runat="server" Text="GARMENT MANAGEMENT PANEL" Font-Bold="True"
            Font-Names="Verdana" Font-Size="14px"></asp:Label>
        <div style="float: right;">
            <asp:ImageButton ID="imgBtnBack" runat="server" ImageUrl="~/Resources/reply.png"
                PostBackUrl="~/Marketing/StylePanel.aspx" ToolTip="BACK" />
        </div>
        <hr />
    </div>
    <asp:UpdatePanel ID="upnlGarments" runat="server">
        <ContentTemplate>
            <div style="margin-bottom: 1px; height: 26px;" class="modalDrag">
                <div style="float: right;" class="SearchTextContainer">
                    SEARCH:
                    <asp:TextBox ID="txtSearch" autofocus placeholder="Search Garment" runat="server"
                        CssClass="modalText" OnTextChanged="txtSearch_TextChanged" AutoPostBack="True"
                        Height="16px" Font-Size="10px" Width="150px" ToolTip="Search Category"></asp:TextBox>
                    <asp:ImageButton ID="imgBtnSearch" runat="server" ImageAlign="AbsBottom" ImageUrl="~/Resources/search.png"
                        ToolTip="SEARCH" />
                </div>
                <div style="float: left;">
                    <div style="float: left; margin-right: 5px;">
                        <asp:Button ID="btnNewGarment" runat="server" Text="NEW" CssClass="btnNew" Font-Names="Verdana" />
                        <asp:ModalPopupExtender ID="btnNewGarment_ModalPopupExtender" runat="server" DynamicServicePath=""
                            Enabled="True" PopupControlID="pnlNewSizeModal" PopupDragHandleControlID="pnlNewSizeModalDrag"
                            TargetControlID="btnNewGarment" BackgroundCssClass="bgModal" CancelControlID="imgBtnCloseNewSizeModal">
                            <Animations>
                                <OnShown>
                                    <FadeIn Duration=".2" />
                                </OnShown>
                            </Animations>
                        </asp:ModalPopupExtender>
                    </div>
                    <div style="float: left; margin-right: 5px;">
                        <asp:Button ID="btnUpdateGarment" runat="server" Text="UPDATE" CssClass="btnUpdate"
                            Font-Names="Verdana" />
                        <asp:ModalPopupExtender ID="btnUpdateGarment_ModalPopupExtender" runat="server" CancelControlID="imgBtnCloseUpdateSizeModal"
                            DynamicServicePath="" Enabled="True" PopupControlID="pnlUpdateSizeModal" PopupDragHandleControlID="pnlUpdateSizeModalDrag"
                            TargetControlID="btnUpdateGarment" BackgroundCssClass="bgModal">
                            <Animations>
                                <OnShown>
                                    <FadeIn Duration=".2" />
                                </OnShown>
                            </Animations>
                        </asp:ModalPopupExtender>
                    </div>
                    <div style="float: left; margin-right: 5px;">
                        <asp:Button ID="btnDelete" runat="server" Text="DELETE" CssClass="btnDelete" Font-Names="Verdana" />
                        <asp:ModalPopupExtender ID="btnDelete_ModalPopupExtender" runat="server" BackgroundCssClass="bgModal"
                            CancelControlID="btnNo" DynamicServicePath="" Enabled="True" PopupControlID="pnlDeleteModal"
                            PopupDragHandleControlID="pnlDeleteModalDrag" TargetControlID="btnDelete">
                            <Animations>
                                <OnShown>
                                    <FadeIn Duration=".2" />
                                </OnShown>
                            </Animations>
                        </asp:ModalPopupExtender>
                    </div>
                    <div style="float: left; margin-right: 5px;">
                        <asp:Button ID="btnPrint" runat="server" Text="PRINT" CssClass="btnPrint" Font-Names="Verdana" />
                    </div>
                    <div style="float: left; margin-right: 5px;">
                        <asp:UpdateProgress ID="upProgress" runat="server" AssociatedUpdatePanelID="upnlGarments">
                            <ProgressTemplate>
                                <asp:PlaceHolder ID="plcHLoader" runat="server">
                                    <UC:LOADER ID="loader" runat="server" />
                                </asp:PlaceHolder>
                            </ProgressTemplate>
                        </asp:UpdateProgress>
                    </div>
                </div>
            </div>
            <div style="min-height:450px;">
                <div class="titleList">
                    <img alt="new color" src="../Resources/garments.png" height="16" align="top" />
                    LIST OF GARMENTS
                </div>
                <div style="float: left; margin-bottom: 10px;">
                    <asp:GridView ID="gvGarmentList" runat="server" CellPadding="4" GridLines="None"
                        AutoGenerateColumns="False" CssClass="table_grid" OnSelectedIndexChanged="gvGarmentList_SelectedIndexChanged"
                        DataKeyNames="RECORD_NO" EnablePersistedSelection="True" AllowPaging="True" AllowSorting="True"
                        DataSourceID="SqlDataSourceGarments" PageSize="15">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:TemplateField>
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Image ID="Image1" runat="server" Height="16px" ImageUrl="~/Resources/garments.png" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:CommandField ShowSelectButton="True" />
                            <asp:BoundField DataField="RECORD_NO" HeaderText="RECORD #" InsertVisible="False"
                                ReadOnly="True" SortExpression="RECORD_NO"></asp:BoundField>
                            <asp:BoundField DataField="GARMENT_CODE" HeaderText="CODE" SortExpression="GARMENT_CODE">
                            </asp:BoundField>
                            <asp:BoundField DataField="GARMENT_DESCRIPTION" HeaderText="GARMENT DESCRIPTION"
                                SortExpression="GARMENT_DESCRIPTION"></asp:BoundField>
                            <asp:BoundField DataField="TOP_OR_BOTTOM" HeaderText="APPAREL TYPE" SortExpression="TOP_OR_BOTTOM">
                                <HeaderStyle Font-Size="8px" HorizontalAlign="Center" Width="20px" />
                                <ItemStyle Font-Bold="True" HorizontalAlign="Center" Width="20px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="DATE_RECORDED" HeaderText="DATE UPDATED" SortExpression="DATE_RECORDED">
                            </asp:BoundField>
                        </Columns>
                        <EditRowStyle BackColor="#7C6F57" />
                        <EmptyDataTemplate>
                            <asp:Image ID="Image2" runat="server" ImageAlign="AbsMiddle" ImageUrl="~/Resources/unhappy.png" />
                            DATA NOT FOUND!!!
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
                    <asp:SqlDataSource ID="SqlDataSourceGarments" runat="server" ConnectionString="<%$ ConnectionStrings:IRMSConnectionString %>"
                        SelectCommand="SP_GET_ALL_GARMENTS" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                </div>
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
            <asp:Panel ID="pnlNewSizeModal" runat="server" CssClass="modal">
                <asp:Panel ID="pnlNewSizeModalDrag" runat="server" CssClass="modalDrag">
                    <div class="close_btn">
                        <asp:ImageButton ID="imgBtnCloseNewSizeModal" runat="server" CssClass="btnClose"
                            ImageUrl="~/Resources/cancel_gray.png" ToolTip="CLOSE" />
                    </div>
                    <div class="sizeLogo">
                        <img alt="new color" src="../Resources/garments.png" height="16" align="top" />
                        NEW GARMENT
                    </div>
                </asp:Panel>
                <asp:PlaceHolder ID="phNewGarment" runat="server">
                    <form:Garment ID="fGarment" runat="server"></form:Garment>
                </asp:PlaceHolder>
                <div>
                    <div style="padding: 3px 5px;">
                        <asp:Label ID="Label1" runat="server" Text="APPLY GARMENT TO BRAND/S:" Font-Bold="true"
                            Font-Italic="True" CssClass="modalLabel"></asp:Label>
                    </div>
                    <asp:Panel ID="pnlBrands" runat="server">
                        <asp:CheckBoxList ID="chkBoxBrands" runat="server" RepeatColumns="3" RepeatDirection="Horizontal"
                            Font-Size="10px" CssClass="modalText">
                        </asp:CheckBoxList>
                    </asp:Panel>
                </div>
                <div style="text-align: center; margin: 5px 0px;">
                    <asp:Button ID="btnSaveGarment" runat="server" Text="SAVE" CssClass="btnSave" ToolTip="Save New Fabric"
                        OnClick="btnSaveGarment_Click" />
                </div>
            </asp:Panel>
            <asp:Panel ID="pnlUpdateSizeModal" runat="server" CssClass="modal">
                <asp:Panel ID="pnlUpdateSizeModalDrag" runat="server" CssClass="modalDrag">
                    <div class="close_btn">
                        <asp:ImageButton ID="imgBtnCloseUpdateSizeModal" runat="server" CssClass="btnClose"
                            ImageUrl="~/Resources/cancel_gray.png" ToolTip="CLOSE" />
                    </div>
                    <div class="sizeLogo">
                        <img alt="new color" src="../Resources/garments.png" height="16" align="top" />
                        UPDATE GARMENT
                    </div>
                </asp:Panel>
                <asp:PlaceHolder ID="phUpdateGarment" runat="server">
                    <form:Garment ID="fGarment_update" runat="server"></form:Garment>
                </asp:PlaceHolder>
                <div>
                    <div style="padding-left: 5px;">
                        <asp:Label ID="Label2" runat="server" Text="APPLY GARMENT TO BRAND/S:" CssClass="modalLabel"
                            Font-Bold="true" Font-Italic="True"></asp:Label>
                    </div>
                    <asp:Panel ID="Panel1" runat="server">
                        <asp:CheckBoxList ID="chkBrandsUpdate" runat="server" RepeatColumns="3" RepeatDirection="Horizontal"
                            Font-Size="10px" CssClass="modalText">
                        </asp:CheckBoxList>
                    </asp:Panel>
                </div>
                <asp:Panel ID="updateErrorMessage" runat="server">
                    <div style="border: 1px solid #FFCC66; text-align: center; font-family: Verdana;
                        font-size: 12px; height: 23px; color: #CC6600; background-color: #FFFF99; line-height: 16px;">
                        <img alt="error update" src="../Resources/warning.png" height="22px" align="middle" />
                        No selected data to update.
                    </div>
                </asp:Panel>
                <div style="text-align: center; margin-top: 5px; margin-bottom: 10px;">
                    <asp:Button ID="btnSaveUpdate" runat="server" Text="SAVE" CssClass="btnSave" ToolTip="Update Color"
                        OnClick="btnSaveUpdate_Click" />
                </div>
            </asp:Panel>
            <%--Delete Modal--%>
            <asp:Panel ID="pnlDeleteModal" runat="server" CssClass="modal">
                <asp:Panel ID="pnlDeleteModalDrag" runat="server" CssClass="modalDrag">
                    <div class="sizeLogo">
                        <img alt="new color" src="../Resources/garments.png" height="16" align="top" />
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
                    <asp:Label ID="lblGarmentToDelete" runat="server" Text="No data to delete. Select from the list and try again."></asp:Label>
                </div>
                <div style="text-align: center; margin: 5px 0px;">
                    <asp:Button ID="btnYes" runat="server" Text="YES" CssClass="modalWarningButtonYes"
                        ToolTip="Delete" OnClick="btnYes_Click" />
                    <asp:Button ID="btnNo" runat="server" Text="NO" CssClass="modalWarningButtonNo" ToolTip="Cancel" />
                </div>
            </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
