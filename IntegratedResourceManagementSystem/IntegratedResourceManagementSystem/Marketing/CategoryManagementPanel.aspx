<%@ Page Title="" Language="C#" MasterPageFile="~/Marketing/Marketing.Master" AutoEventWireup="true"
    CodeBehind="CategoryManagementPanel.aspx.cs" Inherits="IntegratedResourceManagementSystem.Marketing.CategoryManagementPanel" %>

<%@ OutputCache CacheProfile="cached_profile" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register TagPrefix="form" TagName="Category" Src="~/Marketing/forms/FCategory.ascx" %>
<%@ Register Src="~/Marketing/controls/UCLoader.ascx" TagName="LOADER" TagPrefix="UC" %>
<asp:Content ID="HeadContent" ContentPlaceHolderID="head" runat="server">
    <link href="../Styles/category-management.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div style="height:28px; margin-bottom:10px; line-height:28px; color: #333;text-shadow: 1px 1px 0px white;">
        <asp:Image ID="imgpnlTitle" runat="server" ImageUrl="~/Resources/category.png" ImageAlign="Top"
            Height="28px" />
        &nbsp;<asp:Label ID="Label1" runat="server" Text="CATEGORY MANAGEMENT PANEL" Font-Bold="True"
            Font-Names="Verdana" Font-Size="14px"></asp:Label>
        <div style="float: right;">
            <asp:ImageButton ID="imgBtnBack" runat="server" ImageUrl="~/Resources/reply.png"
                PostBackUrl="~/Marketing/StylePanel.aspx" ToolTip="BACK" />
        </div>
        <hr />
    </div>
    <asp:UpdatePanel ID="upnlCategories" runat="server">
        <ContentTemplate>
            <div style="height: 26px; margin-bottom: 1px;" class="modalDrag">
                <div style="float: right;" class="SearchTextContainer">
                SEARCH:
                    <asp:TextBox ID="txtSearch" runat="server" autofocus placeholder="Search Category" CssClass="modalText" OnTextChanged="txtSearch_TextChanged"
                        AutoPostBack="True" Height="16px" Font-Size="10px" Width="150px" ToolTip="Search Category"></asp:TextBox>
                    <asp:ImageButton ID="imgBtnSearch" runat="server" ImageAlign="AbsBottom" ImageUrl="~/Resources/search.png"
                        ToolTip="SEARCH" />
                </div>
                <div style="float: left;">
                    <div style="float: left; margin-right: 5px;">
                        <asp:Button ID="btnNewProductCategory" runat="server" Text="NEW" CssClass="btnNew"
                            Font-Names="Verdana" TabIndex="2" ViewStateMode="Disabled" />
                        <asp:ModalPopupExtender ID="btnNewProductCategory_ModalPopupExtender" runat="server"
                            DynamicServicePath="" Enabled="True" PopupControlID="pnlNewSizeModal" PopupDragHandleControlID="pnlNewSizeModalDrag"
                            TargetControlID="btnNewProductCategory" BackgroundCssClass="bgModal" CancelControlID="imgBtnCloseNewSizeModal">
                            <Animations>
                <OnShown>
                    <FadeIn Duration=".2" />
                </OnShown>
                            </Animations>
                        </asp:ModalPopupExtender>
                    </div>
                    <div style="float: left; margin-right: 5px;">
                        <asp:Button ID="btnUpdateProductCategory" runat="server" Text="UPDATE" CssClass="btnUpdate"
                            Font-Names="Verdana" ViewStateMode="Disabled" />
                        <asp:ModalPopupExtender ID="btnUpdateProductCategory_ModalPopupExtender" runat="server"
                            CancelControlID="ibtnCloseUpdateModal" DynamicServicePath="" Enabled="True" PopupControlID="pnlUpdateProductCategoryModal"
                            PopupDragHandleControlID="pnlUpdateProductCategoryModalDrag" TargetControlID="btnUpdateProductCategory"
                            BackgroundCssClass="bgModal">
                            <Animations>
                <OnShown>
                    <FadeIn Duration=".2" />
                </OnShown>
                            </Animations>
                        </asp:ModalPopupExtender>
                    </div>
                    <div style="float: left; margin-right: 5px;">
                        <asp:Button ID="btnDelete" runat="server" Text="DELETE" CssClass="btnDelete" 
                            Font-Names="Verdana" ViewStateMode="Disabled" />
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
                        <asp:Button ID="btnPrint" runat="server" Text="PRINT" CssClass="btnPrint" 
                            Font-Names="Verdana" ViewStateMode="Disabled" />
                    </div>
                    <div style="float: left; margin-right: 5px;">
                        <asp:UpdateProgress ID="upProgress" runat="server" 
                            AssociatedUpdatePanelID="upnlCategories" ViewStateMode="Disabled">
                            <ProgressTemplate>
                                <asp:PlaceHolder ID="plcHLoader" runat="server">
                                    <UC:LOADER ID="loader" runat="server" />
                                </asp:PlaceHolder>
                            </ProgressTemplate>
                        </asp:UpdateProgress>
                    </div>
                </div>
            </div>
            <div class="titleList" >
                <img alt="brands" src="../Resources/category.png" height="16" width="20" align="left" />
                LIST OF PRODUCT CATEGORY</div>
            <div class="listContent" style="float:left;">
                <asp:Panel ID="pnlSizesList" runat="server" Width="650px" Height="415px" ScrollBars="Auto">
                    <asp:GridView ID="gvProductCategoryList" runat="server" CellPadding="4" 
                        GridLines="None" AutoGenerateColumns="False"  CssClass="table_grid"
                        OnSelectedIndexChanged="gvProductCategoryList_SelectedIndexChanged" DataKeyNames="RECORD_NO"
                        EnablePersistedSelection="True" AllowPaging="True" AllowSorting="True" DataSourceID="SqlDataSourceCategories"
                        PageSize="15" ViewStateMode="Disabled">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:TemplateField>
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Image ID="Image1" runat="server" Height="16px" ImageUrl="~/Resources/category.png" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:CommandField ShowSelectButton="True" />
                            <asp:BoundField DataField="RECORD_NO" HeaderText="RECORD #" InsertVisible="False"
                                ReadOnly="True" SortExpression="RECORD_NO">
                                <HeaderStyle Wrap="False" />
                                <ItemStyle Font-Bold="True" HorizontalAlign="Center" Wrap="False" />
                            </asp:BoundField>
                            <asp:BoundField DataField="CATEGORY_CODE" HeaderText="CATEGORY CODE" SortExpression="CATEGORY_CODE">
                                <HeaderStyle Wrap="False" />
                                <ItemStyle Wrap="False" />
                            </asp:BoundField>
                            <asp:BoundField DataField="CATEGORY_DESCRIPTION" HeaderText="CATEGORY DESCRIPTION"
                                SortExpression="CATEGORY_DESCRIPTION">
                                <HeaderStyle Wrap="False" />
                                <ItemStyle Wrap="False" />
                            </asp:BoundField>
                            <asp:BoundField DataField="DATE_RECORDED" HeaderText="DATE RECORDED" SortExpression="DATE_RECORDED">
                                <HeaderStyle Wrap="False" />
                                <ItemStyle Wrap="False" />
                            </asp:BoundField>
                        </Columns>
                        <EditRowStyle BackColor="#7C6F57" />
                        <EmptyDataTemplate>
                            <asp:Image ID="Image3" runat="server" ImageAlign="AbsMiddle" ImageUrl="~/Resources/unhappy.png" />
                            DATA NOT FOUND!!!
                        </EmptyDataTemplate>
                        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                        <PagerStyle  CssClass="pager" />
                        <RowStyle BackColor="#E3EAEB" />
                        <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="False" ForeColor="#333333" Font-Names="Verdana"
                            Font-Size="11px" Font-Italic="True" />
                        <SortedAscendingCellStyle  CssClass="asc_cell_style" />
                        <SortedAscendingHeaderStyle  CssClass ="asc_cell_style_h" />
                        <SortedDescendingCellStyle  CssClass="desc_cell_style" />
                        <SortedDescendingHeaderStyle  CssClass ="desc_cell_style_h"/>
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSourceCategories" runat="server" ConnectionString="<%$ ConnectionStrings:IRMSConnectionString %>"
                        SelectCommand="SP_GET_ALL_CATEGORY" SelectCommandType="StoredProcedure" >
                    </asp:SqlDataSource>
                </asp:Panel>
            </div>

            <asp:Panel CssClass="permission-container" ID="pnlNotification" Visible ="false" runat="server">
                <asp:CollapsiblePanelExtender ID="CollapsiblePaneItemMaster" runat="server" CollapseControlID="lblNoteCollapsHandler"
                CollapsedText="dennis" ExpandedText="pitallano" TargetControlID="pnlPermissionNotification"
                ExpandControlID="lblNoteCollapsHandler" Collapsed="True">
               </asp:CollapsiblePanelExtender>
               <div class="collaps-link">
                <asp:Label CssClass="collaps-text" ID="lblNoteCollapsHandler" Height="48px" runat="server" Text="NOTE"
                ToolTip="Show/Hide Notification"></asp:Label>
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
                        <img alt="new category" src="../Resources/category.png" height="16" align="top" />
                        NEW&nbsp; CATEGORY
                    </div>
                </asp:Panel>
                <asp:PlaceHolder ID="phNewCategory" runat="server">
                    <form:Category ID="fCategory" runat="server"></form:Category>
                </asp:PlaceHolder>
                <div style="text-align: center; margin: 5px 0px;">
                    <asp:Button ID="btnSaveProductCategory" runat="server" Text="SAVE" CssClass="btnSave"
                        ToolTip="Save New Product Category" OnClick="btnSaveProductCategory_Click" />
               
                </div>
            </asp:Panel>

            <asp:Panel ID="pnlUpdateProductCategoryModal" runat="server" CssClass="modal">
                <asp:Panel ID="pnlUpdateProductCategoryModalDrag" runat="server" CssClass="modalDrag">
                    <div class="close_btn">
                        <asp:ImageButton ID="ibtnCloseUpdateModal" runat="server" CssClass="btnClose" ImageUrl="~/Resources/cancel_gray.png"
                            ToolTip="CLOSE" />
                    </div>
                    <div class="sizeLogo">
                        <img alt="new category" src="../Resources/category.png" height="16" align="top" />
                        UPDATE CATEGORY
                    </div>
                </asp:Panel>
                <asp:PlaceHolder ID="phCategoryUpdate" runat="server">
                    <form:Category ID="fCategory_update" runat="server"></form:Category>
                </asp:PlaceHolder>
                <asp:Panel ID="updateErrorMessage" runat="server">
                    <div style="border: 1px solid #FFCC66; text-align: center; font-family: Verdana;
                        font-size: 12px; height: 23px; color: #CC6600; background-color: #FFFF99; line-height: 16px;">
                        <img alt="error update" src="../Resources/warning.png" height="22px" align="middle" />
                        No selected data to update.
                    </div>
                </asp:Panel>
                <div style="text-align: center; margin: 5px 0px;">
                    <asp:Button ID="btnSaveUpdate" runat="server" Text="SAVE" CssClass="btnSave" ToolTip="Update Category"
                        OnClick="btnSaveUpdate_Click" Enabled="False" />
                    
                </div>
            </asp:Panel>
            <%--Delete Modal--%>
            <asp:Panel ID="pnlDeleteModal" runat="server" CssClass="modal">
                <asp:Panel ID="pnlDeleteModalDrag" runat="server" CssClass="modalDrag">
                    <div class="sizeLogo">
                        <img alt="new category" src="../Resources/category.png" height="16" align="top" />
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
                    <asp:Label ID="lblCategoryToDelete" runat="server" Text="No data to delete. Select from the list and try again."></asp:Label>
                </div>
                <div style="text-align: center; margin: 5px 0px;">
                    <asp:Button ID="btnYes" runat="server" Text="YES" CssClass="modalWarningButtonYes"
                        ToolTip="Delete" OnClick="btnYes_Click" Enabled="False" 
                        EnableTheming="True" />
                    <asp:Button ID="btnNo" runat="server" Text="NO" CssClass="modalWarningButtonNo" 
                        ToolTip="Cancel" ViewStateMode="Disabled" />
                </div>
            </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
