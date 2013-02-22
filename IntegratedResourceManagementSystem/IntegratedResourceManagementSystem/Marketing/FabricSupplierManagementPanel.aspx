<%@ Page Title="" Language="C#" MasterPageFile="~/Marketing/Marketing.Master" AutoEventWireup="true"
    CodeBehind="FabricSupplierManagementPanel.aspx.cs" Inherits="IntegratedResourceManagementSystem.Marketing.FabricSupplierManagementPanel" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Src="~/Marketing/controls/UCLoader.ascx" TagName="LOADER" TagPrefix="UC" %>
<asp:Content ID="HeadContent" ContentPlaceHolderID="head" runat="server">
    <link href="../Styles/returns-and-transfer.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/pull-out-letter.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="panelTitle">
        <asp:Image ID="imgpnlTitle" runat="server" ImageUrl="~/Resources/memo-doc.png" ImageAlign="Top"
            Height="28px" />
        Fabric Supplier Manager
        <div style="float: right; height: 24px;">
            <a href="ReturnAndTransfer.aspx">
                <img alt="BACK" src="../Resources/reply.png" alt="BACK" /></a>
        </div>
    </div>
    <div style="min-height: 450px;">
        <asp:UpdatePanel ID="upnlPullOutLetters" runat="server">
            <ContentTemplate>
                <div style="height: 26px; margin-bottom: 1px;" class="modalDrag">
                    <div style="float: right;" class="SearchTextContainer">
                        SEARCH:
                        <asp:TextBox ID="txtSearch" runat="server" autofocus placeholder="Search Fabric Supplier"
                            CssClass="modalText" AutoPostBack="True" Height="16px" Font-Size="10px" Width="150px"
                            ToolTip="Search Fabric Supplier" ></asp:TextBox>
                        <asp:ImageButton ID="imgBtnSearch" runat="server" ImageAlign="AbsBottom" ImageUrl="~/Resources/search.png"
                            ToolTip="SEARCH" />
                    </div>
                    <div style="float: left;">
                        <div style="float: left; margin-right: 5px;">
                            <asp:Button ID="btnNew" runat="server" CssClass="btnNew" Text="NEW" />
                            <asp:ModalPopupExtender ID="btnNew_ModalPopupExtender" runat="server" CancelControlID="btnCancelCreateBranchDepartmentCode"
                                DynamicServicePath="" Enabled="True" PopupControlID="pnlCreateBranchDeptCodeModal"
                                PopupDragHandleControlID="pnlCreateBranchDeptCodeModalDrag" TargetControlID="btnNew"
                                BackgroundCssClass="bgModal">
                            </asp:ModalPopupExtender>
                        </div>
                        <div style="float: left; margin-right: 5px;">
                            <asp:Button ID="btnUpdate" runat="server" Text="UPDATE" CssClass="btnUpdate" Font-Names="Verdana"
                                ViewStateMode="Disabled" />
                            <asp:ModalPopupExtender ID="btnUpdate_ModalPopupExtender" runat="server" CancelControlID="btnCancelUpdate"
                                DynamicServicePath="" Enabled="True" PopupControlID="pnlUpdateBranchDepartmentCodeModal"
                                PopupDragHandleControlID="pnlUpdateBranchDepartmentCodeModalDrag" TargetControlID="btnUpdate"
                                BackgroundCssClass="bgModal">
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
                        LIST OF FABRIC SUPPLIERS
                    </div>
                    <asp:GridView ID="gvBrandDepartmentCode" CssClass="table_grid" runat="server" CellPadding="4"
                        ForeColor="#333333" GridLines="None" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False"
                        DataKeyNames="ID" DataSourceID="SqlDataSourceBranchDepartmentCodes">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:TemplateField>
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Image ID="Image1" runat="server" ImageUrl="~/Resources/Uptighticon16.png" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="ID" HeaderText="ID" SortExpression="ID" InsertVisible="False"
                                ReadOnly="True" />
                            <asp:BoundField DataField="SUPPLIER_NAME" HeaderText="SUPPLIER_NAME" SortExpression="SUPPLIER_NAME" />
                            <asp:BoundField DataField="SUPPLIER_ADDRESS" HeaderText="SUPPLIER_ADDRESS" SortExpression="SUPPLIER_ADDRESS" />
                            <asp:BoundField DataField="SUPPLIER_CONTACT" HeaderText="SUPPLIER_CONTACT" SortExpression="SUPPLIER_CONTACT" />
                            <asp:BoundField DataField="DATE_RECORDED" HeaderText="DATE_RECORDED" SortExpression="DATE_RECORDED" />
                        </Columns>
                        <EditRowStyle BackColor="#7C6F57" />
                        <EmptyDataTemplate>
                            <div style="padding: 10px; line-height: 32px;" class="modalLabel">
                                <img src="../Resources/unhappy.png" alt="" align="left" />
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
                    <asp:SqlDataSource ID="SqlDataSourceBranchDepartmentCodes" runat="server" ConnectionString="<%$ ConnectionStrings:IRMSConnectionString %>"
                        SelectCommand="SELECT * FROM [FABRICSUPPLIERS] ORDER BY [ID] DESC"></asp:SqlDataSource>
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
                    <div style="text-align: center; margin: 5px;">
                        <asp:Label CssClass="modalLabel" ID="lblBranchDepartmentCodeToDelete" runat="server"
                            Text="No data to delete. Select from the list and try again."></asp:Label>
                    </div>
                    <div style="text-align: center; margin: 5px 0px;">
                        <asp:Button ID="btnYes" runat="server" Text="YES" CssClass="modalWarningButtonYes"
                            ToolTip="Delete" Enabled="False"  />
                        <asp:Button ID="btnNo" runat="server" Text="NO" CssClass="modalWarningButtonNo" ToolTip="Cancel"
                            ViewStateMode="Disabled" />
                    </div>
                </asp:Panel>
                <asp:Panel ID="pnlCreateBranchDeptCodeModal" CssClass="modal" runat="server">
                    <asp:Panel ID="pnlCreateBranchDeptCodeModalDrag" CssClass="modalDrag" runat="server">
                        <div class="sizeLogo">
                            <img alt="new code" src="../Resources/Uptighticon16.png" align="top" />
                            NEW SUPPLIER!
                        </div>
                    </asp:Panel>
                    <div style="text-align: center; margin: 5px;">
                        <asp:Button ID="btnSaveBranchDepartmentCode" runat="server" Text="SAVE" CssClass="btnSave" />
                        <asp:Button ID="btnCancelCreateBranchDepartmentCode" runat="server" Text="CANCEL"
                            CssClass="btnCancel" />
                    </div>
                </asp:Panel>
                <asp:Panel ID="pnlUpdateBranchDepartmentCodeModal" CssClass="modal" runat="server">
                    <asp:Panel ID="pnlUpdateBranchDepartmentCodeModalDrag" CssClass="modalDrag" runat="server">
                        <div class="sizeLogo">
                            <img alt="new code" src="../Resources/Uptighticon16.png" align="top" />
                            UPDATE SUPPLIER!
                        </div>
                    </asp:Panel>
                    <div style="text-align: center; margin: 5px;">
                        <asp:Button ID="btnSaveUpdate" runat="server" Text="UPDATE" CssClass="btnSave" Width="75px" />
                        <asp:Button ID="btnCancelUpdate" runat="server" Text="CANCEL" CssClass="btnCancel" />
                    </div>
                </asp:Panel>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>
