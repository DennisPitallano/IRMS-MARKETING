<%@ Page Title="" Language="C#" MasterPageFile="~/Marketing/Marketing-Admin/Admin.Master"
    AutoEventWireup="true" CodeBehind="CompanyManagementPanel.aspx.cs" Inherits="IntegratedResourceManagementSystem.Marketing.Marketing_Admin.CompanyManagementPanel" %>

<%@ Register Src="~/Marketing/Marketing-Admin/controls/AdminMenu.ascx" TagName="menu"
    TagPrefix="irms" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Src="~/Marketing/controls/UCLoader.ascx" TagName="LOADER" TagPrefix="UC" %>
<%@ Register TagPrefix="forms" TagName="Company" Src="~/Marketing/Marketing-Admin/forms/CompanyForm.ascx" %>
<asp:Content ID="HeadContent" ContentPlaceHolderID="head" runat="server">
    <link href="Styles/company-management.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="menu_container">
        <irms:menu ID="admin_menu" runat="server" />
    </div>
    <div style="height: 28px; margin-bottom: 10px; line-height: 28px; color: #333; text-shadow: 1px 1px 0px white;">
        <asp:Image ID="imgpnlTitle" runat="server" ImageUrl="~/Resources/product_brand.png"
            ImageAlign="Top" Height="28px" />
        &nbsp;<asp:Label ID="Label1" runat="server" Text="COMPANY MANAGEMENT PANEL" Font-Bold="True"
            Font-Names="Verdana" Font-Size="14px"></asp:Label>
        <div style="float: right;">
            <asp:ImageButton ID="imgBtnBack" runat="server" ImageUrl="~/Resources/reply.png"
                PostBackUrl="~/Marketing/StylePanel.aspx" ToolTip="BACK" />
        </div>
        <hr />
    </div>
   <%-- <asp:UpdatePanel ID="upnlBrands" runat="server">
        <ContentTemplate>--%>
            <div style="height: 26px; margin-bottom: 1px;" class="modalDrag">
                <div style="float: right;" class="SearchTextContainer">
                    SEARCH:
                    <asp:TextBox ID="txtSearch" runat="server" autofocus placeholder="Search Company"
                        CssClass="modalText" OnTextChanged="txtSearch_TextChanged" AutoPostBack="True"
                        Height="16px" Font-Size="10px" Width="150px" ToolTip="Search Company"></asp:TextBox>
                    <asp:ImageButton ID="imgBtnSearch" runat="server" ImageAlign="AbsBottom" ImageUrl="~/Resources/search.png"
                        ToolTip="SEARCH" />
                </div>
                <div style="float: left;">
                    <div style="float: left; margin-right: 5px;">
                        <asp:Button ID="btnNewBrand" runat="server" Text="NEW" CssClass="btnNew" Font-Names="Verdana" />
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
                        <asp:Button ID="btnUpdateBrand" runat="server" Text="UPDATE" CssClass="btnUpdate"
                            Font-Names="Verdana" />
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
                        <asp:Button ID="btnDelete" runat="server" Text="DELETE" CssClass="btnDelete" Font-Names="Verdana" />
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
                        <asp:Button ID="btnPrint" runat="server" Text="PRINT" CssClass="btnPrint" Font-Names="Verdana" />
                    </div>
                    <div style="float: left; margin-right: 5px;">
                        <%--<asp:UpdateProgress ID="upProgress" runat="server" AssociatedUpdatePanelID="upnlBrands">
                            <ProgressTemplate>
                                <asp:PlaceHolder ID="plcHLoader" runat="server">
                                    <UC:LOADER ID="loader" runat="server" />
                                </asp:PlaceHolder>
                            </ProgressTemplate>
                        </asp:UpdateProgress>--%>
                    </div>
                </div>
            </div>
            <div class="listContent">
                <div class="titleList">
                    <img alt="brands" src="../../Resources/product_brand.png" height="16" align="left" />
                    LIST OF COMPANY
                </div>
                <asp:Panel ID="pnlDepartment" runat="server" Width="370px" Height="415px" ScrollBars="Auto">
                    <asp:GridView ID="gvCompanyList" runat="server" CellPadding="4" GridLines="None"
                        AutoGenerateColumns="False" CssClass="table_grid" AllowPaging="True" AllowSorting="True"
                        DataKeyNames="CompNo,Logo" DataSourceID="SqlDataSourceCompany" EnablePersistedSelection="True"
                        PageSize="15" OnSelectedIndexChanged="gvCompanyList_SelectedIndexChanged">
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
                            <asp:BoundField DataField="CompNo" HeaderText="RECORD #" InsertVisible="False" ReadOnly="True"
                                SortExpression="CompNo"></asp:BoundField>
                            <asp:BoundField DataField="CompName" HeaderText="COMPANY NAME" SortExpression="CompName">
                            </asp:BoundField>
                        </Columns>
                        <EditRowStyle BackColor="#7C6F57" />
                        <EmptyDataTemplate>
                            <asp:Image ID="Image2" runat="server" ImageUrl="~/Resources/unhappy.png" ImageAlign="AbsMiddle" />
                            EMPTY DATA!!!
                        </EmptyDataTemplate>
                        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                        <PagerStyle CssClass="pager-style" />
                        <RowStyle BackColor="#E3EAEB" />
                        <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="False" ForeColor="#333333" Font-Names="Verdana"
                            Font-Size="11px" Font-Italic="True" />
                        <SortedAscendingCellStyle CssClass="asc_cell_style" />
                        <SortedAscendingHeaderStyle CssClass="asc_cell_style_h" />
                        <SortedDescendingCellStyle CssClass="desc_cell_style" />
                        <SortedDescendingHeaderStyle CssClass="desc_cell_style_h" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSourceCompany" runat="server" ConnectionString="<%$ ConnectionStrings:IRMSConnectionString %>"
                        SelectCommand="SELECT [CompNo], [CompName],[Logo] FROM [Company] ORDER BY [CompNo] DESC">
                    </asp:SqlDataSource>
                </asp:Panel>
            </div>
            <asp:Panel ID="pnlNewSizeModal" runat="server" CssClass="modal">
                <asp:Panel ID="pnlNewSizeModalDrag" runat="server" CssClass="modalDrag">
                    <div class="close_btn">
                        <asp:ImageButton ID="imgBtnCloseNewSizeModal" runat="server" CssClass="btnClose"
                            ImageUrl="~/Resources/cancel_gray.png" ToolTip="CLOSE" />
                    </div>
                    <div class="sizeLogo">
                        <img alt="new brand" src="../../Resources/product_brand.png" height="16" align="top" />
                        NEW COMPANY
                    </div>
                </asp:Panel>
                <asp:PlaceHolder ID="phCompanyForm" runat="server">
                    <forms:Company ID="fCompany" runat="server" />
                </asp:PlaceHolder>
                <div>
                    <div class="modalText" style="text-align:center;" >
                        <asp:Image style="border: 2px Solid #6B5F14; margin: 2px 2px 5px 2px;
                        padding: 2px; border-radius: 5px;  text-align: center;" ID="imgAvatar" runat="server" />
                    </div>
                    <asp:FileUpload ID="fUploadAvatar" CssClass="btnBrowse" runat="server" />
                    <asp:Button ID="btnpload" CssClass="btnUpload" runat="server" Text="upload" OnClick="btnpload_Click" />
                    <br />
                    <asp:Label ID="label" runat="server" CssClass="modalLabel" Text=""></asp:Label>
                    <asp:HiddenField ID="hfAvatarFileName" runat="server" />
                </div>
                <div style="text-align: center; margin: 5px 0px;">
                    <asp:Button ID="btnSave" runat="server" CssClass="btnSave" Text="SAVE" ToolTip="Save New Arrangement Type"
                        OnClick="btnSave_Click" />
                </div>
            </asp:Panel>
            <asp:Panel ID="pnlUpdateSizeModal" runat="server" CssClass="modal">
                <asp:Panel ID="pnlUpdateSizeModalDrag" runat="server" CssClass="modalDrag">
                    <div class="close_btn">
                        <asp:ImageButton ID="imgBtnCloseUpdateSizeModal" runat="server" CssClass="btnClose"
                            ImageUrl="~/Resources/cancel_gray.png" ToolTip="CLOSE" />
                    </div>
                    <div class="sizeLogo">
                        <img alt="new brand" src="../../Resources/product_brand.png" height="16" align="top" />
                        UPDATE COMPANY
                    </div>
                </asp:Panel>
                <asp:PlaceHolder ID="phCompanyUpdate" runat="server">
                    <forms:Company ID="fCompany_Update" runat="server" />
                </asp:PlaceHolder>
                <div>
                    <div class="modalText" style="text-align:center;" >
                        <asp:Image style="border: 2px Solid #6B5F14; margin: 2px 2px 5px 2px;
                        padding: 2px; border-radius: 5px;  text-align: center;" ID="imgLogoUpdate" runat="server" />
                    </div>
                    <asp:FileUpload ID="FileUploadUpdate" CssClass="btnBrowse" runat="server" />
                    <asp:Button ID="btnUploadUpdate" CssClass="btnUpload" runat="server" 
                        Text="upload" onclick="btnUploadUpdate_Click"  />
                    <br />
                    <asp:Label ID="lblLogoUpdate" CssClass="modalLabel" runat="server" Text=""></asp:Label>
                    <asp:HiddenField ID="hfLogoUpdate" runat="server" />
                </div>
                <asp:Panel ID="updateErrorMessage" runat="server">
                    <div style="border: 1px solid #FFCC66; text-align: center; font-family: Verdana;
                        font-size: 12px; height: 23px; color: #CC6600; background-color: #FFFF99; line-height: 16px;">
                        <img alt="error update" src="../../Resources/warning.png" height="22px" align="middle" />
                        No selected data to update.
                    </div>
                </asp:Panel>
                <div style="text-align: center; margin: 5px 0px;">
                    <asp:Button ID="btnSaveUpdate" runat="server" CssClass="btnSave" Text="SAVE" ToolTip="Update Company"
                        Enabled="False" OnClick="btnSaveUpdate_Click" />
                </div>
            </asp:Panel>
            <%--Delete Modal--%>
            <asp:Panel ID="pnlDeleteModal" runat="server" CssClass="modal">
                <asp:Panel ID="pnlDeleteModalDrag" runat="server" CssClass="modalDrag">
                    <div class="sizeLogo">
                        <img alt="new brand" src="../../Resources/product_brand.png" height="16" align="top" />
                        CONFIRMATION!!!
                    </div>
                </asp:Panel>
                <div style="border: 1px solid #FFCC66; text-align: center; font-family: Verdana;
                    font-size: 12px; height: 23px; color: #CC6600; background-color: #FFFF99; line-height: 16px;
                    margin: 2px 5px;">
                    <img alt="error update" src="../../Resources/warning.png" height="22px" align="middle" />
                    Warning: This action cannot be undo.
                </div>
                <div style="text-align: center; color: #FFFF99; font-family: Verdana; font-size: 11px;
                    margin: 5px 2px;">
                    <asp:Label ID="lblTermToDelete" runat="server" Text="No data to delete. Select from the list and try again."></asp:Label>
                </div>
                <div style="text-align: center; margin: 5px 0px;">
                    <asp:Button ID="btnYes" runat="server" Text="YES" CssClass="modalWarningButtonYes"
                        ToolTip="Delete" Enabled="False" OnClick="btnYes_Click" />
                    <asp:Button ID="btnNo" runat="server" Text="NO" CssClass="modalWarningButtonNo" ToolTip="Cancel" />
                </div>
            </asp:Panel>
      <%--  </ContentTemplate>
    </asp:UpdatePanel--%>
</asp:Content>
