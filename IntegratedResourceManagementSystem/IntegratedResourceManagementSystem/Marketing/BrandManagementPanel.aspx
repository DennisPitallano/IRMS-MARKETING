﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Marketing/Marketing.Master" AutoEventWireup="true"
    CodeBehind="BrandManagementPanel.aspx.cs" Inherits="IntegratedResourceManagementSystem.Marketing.BrandManagementPanel" ViewStateMode="Disabled" %>

<%@ OutputCache CacheProfile="cached_profile" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register TagPrefix="forms" TagName="Brand" Src="~/Marketing/forms/FBrand.ascx" %>
<%@ Register Assembly="ExportToExcel" Namespace="KrishLabs.Web.Controls" TagPrefix="RK" %>
<%@ Register Src="~/Marketing/controls/UCLoader.ascx" TagName="LOADER" TagPrefix="UC" %>

<asp:Content ID="HeadContent" ContentPlaceHolderID="head" runat="server">
    <link href="../Styles/brand-management.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/permission-note.css" rel="stylesheet" type="text/css" />
    <script src="../Scripts/jquery-1.7.2.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#brandContent").show('slow');
        });
    </script>

</asp:Content>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
        <div style="height:28px; margin-bottom:10px; line-height:28px; color: #333;text-shadow: 1px 1px 0px white;">
                <asp:Image ID="imgpnlTitle" runat="server" ImageUrl="~/Resources/product_brand.png"
                     ImageAlign="Top" Height="28px" />
                &nbsp;<asp:Label ID="Label1" runat="server" Text="BRAND MANAGEMENT PANEL" Font-Bold="True"
                    Font-Names="Verdana" Font-Size="14px"></asp:Label>
                <div style="float: right; height:24px;">
                    <asp:ImageButton ID="imgBtnBack" runat="server" ImageUrl="~/Resources/reply.png"
                        PostBackUrl="~/Marketing/StylePanel.aspx" ToolTip="BACK" />
                </div>
                    <hr />
            </div>

    <asp:UpdatePanel ID="upnlBrands" runat="server">
        <ContentTemplate>
            <div style="height:26px; margin-bottom:1px; " class="modalDrag">
                <div style="float: right;" class="SearchTextContainer">
                SEARCH:
                    <asp:TextBox ID="txtSearch" runat="server" autofocus placeholder="Search Brand" CssClass="modalText" OnTextChanged="txtSearch_TextChanged"
                        AutoPostBack="True" Height="16px" Font-Size="10px" Width="150px" ToolTip="Search Brand"></asp:TextBox>
                    <asp:ImageButton ID="imgBtnSearch" runat="server" ImageAlign="AbsBottom" ImageUrl="~/Resources/search.png"
                        ToolTip="SEARCH" />
                </div>
                <div style="float: left;">
                    <div style="float: left; margin-right: 5px;">
                        <asp:Button ID="btnNewBrand" runat="server" Text="NEW" CssClass="btnNew" 
                            Font-Names="Verdana"  ViewStateMode="Disabled" />
                        <asp:ModalPopupExtender ID="btnNewBrand_ModalPopupExtender" runat="server" DynamicServicePath=""
                            Enabled="True" PopupControlID="pnlNewSizeModal" PopupDragHandleControlID="pnlNewSizeModalDrag"
                            TargetControlID="btnNewBrand" BackgroundCssClass="bgModal" CancelControlID="imgBtnCloseNewSizeModal">
                            <Animations>
                                        <OnShown>
                                            <FadeIn Duration=".2" />
                                        </OnShown>
                            </Animations>
                        </asp:ModalPopupExtender>
                    </div>
                    <div style="float: left; margin-right: 5px;">
                        <asp:Button ID="btnUpdateBrand" runat="server" Text="UPDATE" 
                            CssClass="btnUpdate" Font-Names="Verdana" ViewStateMode="Disabled" />
                        <asp:ModalPopupExtender ID="btnUpdateBrand_ModalPopupExtender" runat="server" CancelControlID="imgBtnCloseUpdateSizeModal"
                            DynamicServicePath="" Enabled="True" PopupControlID="pnlUpdateSizeModal" PopupDragHandleControlID="pnlUpdateSizeModalDrag"
                            TargetControlID="btnUpdateBrand" BackgroundCssClass="bgModal">
                            <Animations>
                                <OnShown>
                                    <FadeIn Duration=".2" />
                                </OnShown>
                            </Animations>
                        </asp:ModalPopupExtender>
                    </div>
                    <div style="float: left; margin-right: 5px;">
                        <asp:Button ID="btnDelete" runat="server" Text="DELETE" CssClass="btnDelete" 
                            Font-Names="Verdana"  ViewStateMode="Disabled" />
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
                        <asp:Button ID="btnPrint" runat="server" Text="PRINT" CssClass="btnPrint" 
                            Font-Names="Verdana"  ViewStateMode="Disabled" />
                    </div>
                    <div style="float: left; margin-right: 5px;">
                        <asp:UpdateProgress ID="upProgress" runat="server" AssociatedUpdatePanelID="upnlBrands">
                            <ProgressTemplate>
                                <asp:PlaceHolder ID="plcHLoader" runat="server" EnableViewState="False">
                                    <UC:LOADER ID="loader" runat="server" />
                                </asp:PlaceHolder>
                            </ProgressTemplate>
                        </asp:UpdateProgress>
                    </div>
                </div>
            </div>
            <div id="brandContent" class="listContent" style="float:left;">

                <div class="titleList">
                <img alt="brands" src="../Resources/product_brand.png" height="16" width="20" align="left" />
                    LIST OF BRANDS
                </div>
                <asp:Panel ID="pnlSizesList" runat="server" Width="670px" Height="415px" ScrollBars="Auto">
                    <asp:GridView ID="gvBrandList" runat="server" CellPadding="4" 
                        GridLines="None" AutoGenerateColumns="False" CssClass="table_grid"
                        OnSelectedIndexChanged="gvGarmentList_SelectedIndexChanged" AllowPaging="True"
                        AllowSorting="True" DataKeyNames="RECORD_NO" DataSourceID="SqlDataSourceBrands"
                        EnablePersistedSelection="True" PageSize="15" ViewStateMode="Disabled">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:TemplateField>
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Image ID="Image1" runat="server" Height="16px" ImageUrl="~/Resources/product_brand.png" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:CommandField ShowSelectButton="True" />
                            <asp:BoundField DataField="RECORD_NO" HeaderText="RECORD#" InsertVisible="False"
                                ReadOnly="True" SortExpression="RECORD_NO"></asp:BoundField>
                            <asp:BoundField DataField="BRAND_CODE" HeaderText="CODE" SortExpression="BRAND_CODE">
                            </asp:BoundField>
                            <asp:BoundField DataField="BRAND_DESCRIPTION" HeaderText="BRAND DESCRIPTION" SortExpression="BRAND_DESCRIPTION">
                            </asp:BoundField>
                            <asp:BoundField DataField="START_SERIES" HeaderText="START SERIES" SortExpression="START_SERIES">
                            </asp:BoundField>
                            <asp:BoundField DataField="DATE_RECORDED" HeaderText="DATE UPDATED" SortExpression="DATE_RECORDED">
                            </asp:BoundField>
                        </Columns>
                        <EditRowStyle BackColor="#7C6F57" />
                        <EmptyDataTemplate>
                            <asp:Image ID="Image2" runat="server" ImageUrl="~/Resources/unhappy.png" ImageAlign="AbsMiddle" />
                            EMPTY DATA!!!
                        </EmptyDataTemplate>
                        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                        <PagerStyle  CssClass ="pager" />
                        <RowStyle BackColor="#E3EAEB" />
                        <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="False" ForeColor="#333333" Font-Names="Verdana"
                            Font-Size="11px" Font-Italic="True" />
                        <SortedAscendingCellStyle  CssClass="asc_cell_style" />
                        <SortedAscendingHeaderStyle  CssClass="asc_cell_style_h" />
                        <SortedDescendingCellStyle  CssClass="desc_cell_style" />
                        <SortedDescendingHeaderStyle CssClass="desc_cell_style_h" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSourceBrands" runat="server" ConnectionString="<%$ ConnectionStrings:IRMSConnectionString %>"
                            SelectCommand="SELECT [RECORD_NO], [BRAND_CODE], [BRAND_DESCRIPTION], [START_SERIES], [DATE_RECORDED] FROM [BRANDS] ORDER BY [RECORD_NO] DESC">
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
                        <img alt="new brand" src="../Resources/product_brand.png" height="16" align="top" />
                        NEW BRAND
                    </div>
                </asp:Panel>
                <asp:PlaceHolder ID="phBrandForm" runat="server">
                    <forms:Brand ID="fbrand" runat="server"></forms:Brand>
                </asp:PlaceHolder>
                <div style="text-align:center; margin:5px 0px;">
                    <asp:Button ID="btnSaveBrand" runat="server" CssClass="btnSave" OnClick="btnSaveBrand_Click"
                        Text="SAVE" ToolTip="Save New Brand"  />
                </div>
            </asp:Panel>
           
            <asp:Panel ID="pnlUpdateSizeModal" runat="server" CssClass="modal">
                <asp:Panel ID="pnlUpdateSizeModalDrag" runat="server" CssClass="modalDrag">
                    <div class="close_btn">
                        <asp:ImageButton ID="imgBtnCloseUpdateSizeModal" runat="server" CssClass="btnClose"
                            ImageUrl="~/Resources/cancel_gray.png" ToolTip="CLOSE" />
                    </div>
                    <div class="sizeLogo">
                        <img alt="new brand" src="../Resources/product_brand.png" height="16" align="top" />
                        UPDATE BRAND
                    </div>
                </asp:Panel>
                <asp:PlaceHolder ID="phBrandUpdate" runat="server">
                    <forms:Brand ID="fbrand_update" runat="server"></forms:Brand>
                </asp:PlaceHolder>
                <asp:Panel ID="updateErrorMessage" runat="server">
                    <div style="border: 1px solid #FFCC66; text-align:center; font-family:Verdana; font-size:12px; height:23px;
                         color: #CC6600; background-color: #FFFF99; line-height:16px;">
                        <img alt="error update" src="../Resources/warning.png" height="22px" align="middle" />
                        No selected data to update.
                    </div>
                </asp:Panel> 
                <div style="text-align: center; margin:5px 0px;">
                    <asp:Button ID="btnSaveUpdate" runat="server" CssClass="btnSave" OnClick="btnSaveUpdate_Click"
                        Text="SAVE" ToolTip="Update Color" Enabled="False" 
                        />
                </div>
            </asp:Panel>

            <%--Delete Modal--%>
            <asp:Panel ID="pnlDeleteModal" runat="server" CssClass="modal" >
                <asp:Panel ID="pnlDeleteModalDrag" runat="server" CssClass="modalDrag">
                    <div class="sizeLogo">
                     <img alt="new brand" src="../Resources/product_brand.png" height="16" align="top" />
                        CONFIRMATION!!!
                    </div>
                </asp:Panel>
                <div style="border: 1px solid #FFCC66; text-align:center; font-family:Verdana; font-size:12px; height:23px;
                         color: #CC6600; background-color: #FFFF99; line-height:16px; margin:2px 5px;">
                        <img alt="error update" src="../Resources/warning.png" height="22px" align="middle" />
                        Warning: This action cannot be undo.
                    </div>
                    <div style="text-align:center; color: #FFFF99; font-family:Verdana; font-size:11px; margin:5px 2px;">
                        <asp:Label ID="lblBrandToDelete" runat="server" Text="No data to delete. Select from the list and try again."></asp:Label>
                    </div>
                <div style=" text-align:center; margin: 5px 0px;">
                    <asp:Button ID="btnYes" runat="server" Text="YES" CssClass="modalWarningButtonYes"
                        ToolTip="Delete" OnClick="btnYes_Click" Enabled="False" />
                    <asp:Button ID="btnNo" runat="server" Text="NO" CssClass="modalWarningButtonNo" 
                        ToolTip="Cancel" ViewStateMode="Disabled" />
                </div>
            </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
