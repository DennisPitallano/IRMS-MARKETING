<%@ Page Title="" Language="C#" MasterPageFile="~/Marketing/Marketing.Master" AutoEventWireup="true"
    CodeBehind="BrandDepartmentCodeManagementPanel.aspx.cs" Inherits="IntegratedResourceManagementSystem.Marketing.BrandDepartmentCodeManagementPanel" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Src="~/Marketing/controls/UCLoader.ascx" TagName="LOADER" TagPrefix="UC" %>
<asp:Content ID="HeadContent" ContentPlaceHolderID="head" runat="server">
    <link href="../Styles/returns-and-transfer.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/pull-out-letter.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/brand-department-code.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="panelTitle">
        <asp:Image ID="imgpnlTitle" runat="server" ImageUrl="~/Resources/memo-doc.png" ImageAlign="Top"
            Height="28px" />Brand Department Codes Management Panel
        <div style="float: right; height: 24px;">
            <a href="SMPullOutLetterManagementPanel.aspx">
                <img alt="BACK" src="../Resources/reply.png" alt="BACK" /></a>
        </div>
    </div>
    <div style="min-height: 450px;">
        <asp:UpdatePanel ID="upnlPullOutLetters" runat="server">
            <ContentTemplate>
                <div style="height: 26px; margin-bottom: 1px;" class="modalDrag">
                    <div style="float: right;" class="SearchTextContainer">
                        SEARCH:
                        <asp:TextBox ID="txtSearch" runat="server" autofocus placeholder="Search Brand Department Code"
                            CssClass="modalText" AutoPostBack="True" Height="16px" Font-Size="10px" Width="150px"
                            ToolTip="Search Brand Department Code" OnTextChanged="txtSearch_TextChanged"></asp:TextBox>
                        <asp:ImageButton ID="imgBtnSearch" runat="server" ImageAlign="AbsBottom" ImageUrl="~/Resources/search.png"
                            ToolTip="SEARCH" />
                    </div>
                    <div style="float: left;">
                        <div style="float: left; margin-right: 5px;">
                            <asp:Button ID="btnNew" runat="server" CssClass="btnNew" Text="NEW" />
                            <asp:ModalPopupExtender ID="btnNew_ModalPopupExtender" runat="server" CancelControlID="btnCancelCreateBrandDepartmentCode"
                                DynamicServicePath="" Enabled="True" PopupControlID="pnlCreateBrandDeptCodeModal"
                                PopupDragHandleControlID="pnlCreateBrandDeptCodeModalDrag" TargetControlID="btnNew">
                            </asp:ModalPopupExtender>
                        </div>
                        <div style="float: left; margin-right: 5px;">
                            <asp:Button ID="btnUpdate" runat="server" Text="UPDATE" CssClass="btnUpdate" Font-Names="Verdana"
                                ViewStateMode="Disabled" />
                            <asp:ModalPopupExtender ID="btnUpdate_ModalPopupExtender" runat="server" CancelControlID="btnCancelUpdate"
                                DynamicServicePath="" Enabled="True" PopupControlID="pnlUpdateBrandDepartmentCodeModal"
                                PopupDragHandleControlID="pnlUpdateBrandDepartmentCodeModalDrag" TargetControlID="btnUpdate">
                            </asp:ModalPopupExtender>
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
                        LIST OF BRAND DEPARTMENT CODES
                    </div>
                    <asp:GridView ID="gvBrandDepartmentCode" CssClass="table_grid" runat="server" CellPadding="4"
                        ForeColor="#333333" GridLines="None" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False"
                        DataKeyNames="RECORD_NUMBER" DataSourceID="SqlDataSourceBrandDepartmentCodes"
                        OnSelectedIndexChanged="gvBrandDepartmentCode_SelectedIndexChanged">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:TemplateField>
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Image ID="imgBrandDepartmentCode" runat="server" ImageUrl="~/Resources/code-icon.png" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:CommandField ShowSelectButton="True" />
                            <asp:BoundField DataField="BRAND" HeaderText="BRAND" SortExpression="BRAND" />
                            <asp:BoundField DataField="BRAND_CODE" HeaderText="BRAND CODE" SortExpression="BRAND_CODE" />
                            <asp:BoundField DataField="DEPT_CODE" HeaderText="DEPT CODE" SortExpression="DEPT_CODE" />
                        </Columns>
                        <EditRowStyle BackColor="#7C6F57" />
                        <EmptyDataTemplate>
                            <div style="line-height:32px; padding:10px;" class="modalLabel">
                                <img src="../Resources/unhappy.png" alt="" align="left"  />
                                DATA NOT FOUND!
                            </div>
                        </EmptyDataTemplate>
                        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                        <PagerStyle CssClass="pager" />
                        <RowStyle BackColor="#E3EAEB" />
                        <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle CssClass="asc_cell_style" />
                        <SortedAscendingHeaderStyle CssClass="asc_cell_style_h" />
                        <SortedDescendingCellStyle CssClass="desc_cell_style" />
                        <SortedDescendingHeaderStyle CssClass="desc_cell_style_h" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSourceBrandDepartmentCodes" runat="server" ConnectionString="<%$ ConnectionStrings:IRMSConnectionString %>"
                        SelectCommand="SELECT * FROM [BRAND_DEPT_CODES] ORDER BY RECORD_NUMBER DESC">
                    </asp:SqlDataSource>
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
                    <div style="text-align: center; padding:5px;">
                        <asp:Label CssClass="modalLabel" ID="lblBrandDepartmentCodeToDelete" runat="server"
                            Text="No data to delete. Select from the list and try again."></asp:Label>
                    </div>
                    <div style="text-align: center; margin: 5px 0px;">
                        <asp:Button ID="btnYes" runat="server" Text="YES" CssClass="modalWarningButtonYes"
                            ToolTip="Delete" Enabled="False" OnClick="btnYes_Click" />
                        <asp:Button ID="btnNo" runat="server" Text="NO" CssClass="modalWarningButtonNo" ToolTip="Cancel"
                            ViewStateMode="Disabled" />
                    </div>
                </asp:Panel>
                <asp:Panel ID="pnlCreateBrandDeptCodeModal" CssClass="modal" runat="server">
                    <asp:Panel ID="pnlCreateBrandDeptCodeModalDrag" CssClass="modalDrag" runat="server">
                        <div class="sizeLogo">
                            <img alt="new code" src="../Resources/code-icon.png" height="15" align="top" />
                            CREATE CODE!
                        </div>
                    </asp:Panel>
                    <div class="modalLabel" style="text-align: center; padding: 10px 10px 0px 10px; font-size: 1em;">
                        BRAND:<asp:DropDownList ID="DDLBrands" Height="22px" CssClass="modalText" runat="server">
                        </asp:DropDownList>
                    </div>
                    <div class="modalLabel" style="text-align: center; padding: 10px; font-size: 1em;">
                        CODE:<asp:TextBox ID="txtBrandDepartmentCode" Width="100px" CssClass="modalText"
                            Height="22px" runat="server"></asp:TextBox>
                    </div>
                    <div style="text-align: center; margin: 5px;">
                        <asp:Button ID="btnSaveBrandDepartmentCode" runat="server" Text="CREATE" CssClass="btnSave"
                            Width="75px" OnClick="btnSaveBrandDepartmentCode_Click" />
                        <asp:Button ID="btnCancelCreateBrandDepartmentCode" runat="server" Text="CANCEL"
                            CssClass="btnCancel" />
                    </div>
                </asp:Panel>
                <asp:Panel ID="pnlUpdateBrandDepartmentCodeModal" CssClass="modal" runat="server">
                    <asp:Panel ID="pnlUpdateBrandDepartmentCodeModalDrag" CssClass="modalDrag" runat="server">
                        <div class="sizeLogo">
                            <img alt="new code" src="../Resources/code-icon.png" height="15" align="top" />
                            UPDATE CODE!
                        </div>
                    </asp:Panel>
                    <div class="modalLabel" style="text-align: center; padding: 10px 10px 0px 10px; font-size: 1em;">
                        BRAND:<asp:DropDownList ID="DDLBrandsUpdate" Height="22px" CssClass="modalText" runat="server">
                        </asp:DropDownList>
                    </div>
                    <div class="modalLabel" style="text-align: center; padding: 10px; font-size: 1em;">
                        CODE:<asp:TextBox ID="txtBrandDeptCodeToUpdate" Width="100px" CssClass="modalText"
                            Height="22px" runat="server"></asp:TextBox>
                    </div>
                    <div style="text-align: center; margin: 5px;">
                        <asp:Button ID="btnSaveUpdate" runat="server" Text="UPDATE" CssClass="btnSave" Width="75px"
                            OnClick="btnSaveUpdate_Click" />
                        <asp:Button ID="btnCancelUpdate" runat="server" Text="CANCEL" CssClass="btnCancel" />
                    </div>
                </asp:Panel>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>
