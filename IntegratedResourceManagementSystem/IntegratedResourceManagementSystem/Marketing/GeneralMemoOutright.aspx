<%@ Page Title="" Language="C#" MasterPageFile="~/Marketing/Marketing.Master" AutoEventWireup="true" CodeBehind="GeneralMemoOutright.aspx.cs" Inherits="IntegratedResourceManagementSystem.Marketing.GeneralMemoOutright" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Src="~/Marketing/controls/UCLoader.ascx" TagName="LOADER" TagPrefix="UC" %>
<asp:Content ID="HeadContent" ContentPlaceHolderID="head" runat="server">
    <link href="../Styles/general-memo-outright.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
      <div style="height:28px; margin-bottom:10px; line-height:28px; color: #333;text-shadow: 1px 1px 0px white;">
                <asp:Image ID="imgpnlTitle" runat="server" ImageUrl="~/Resources/memo-doc.png"
                     ImageAlign="Top" Height="28px" />
                &nbsp;<asp:Label ID="Label1" runat="server" Text="GENERAL MEMO(OUTRIGHT) MANAGEMENT PANEL" Font-Bold="True"
                    Font-Names="Verdana" Font-Size="14px"></asp:Label>
                <div style="float: right; height:24px;">
                <a href="MarkDownMemoMenu.aspx" title="BACK" >
                    <img alt="BACK" src="../Resources/reply.png" />
                </a>
                </div>
                    <hr style="color:#fff;" />
                    
            </div>
      <asp:UpdatePanel ID="upnlGeneralMemo" runat="server">
        <ContentTemplate>
            <div style="height:26px; margin-bottom:1px; " class="modalDrag">
                <div style="float: right;" class="SearchTextContainer">
                SEARCH:
                    <asp:TextBox ID="txtSearch" runat="server" autofocus placeholder="Search General Memo" CssClass="modalText" 
                        AutoPostBack="True" Height="16px" Font-Size="10px" Width="150px" ToolTip="Search General Memo"></asp:TextBox>
                    <asp:ImageButton ID="imgBtnSearch" runat="server" ImageAlign="AbsBottom" ImageUrl="~/Resources/search.png"
                        ToolTip="SEARCH" />
                </div>
                <div style="float: left;">
                    <div style="float: left; margin-right: 5px;">
                       <a style="text-decoration:none;" href="NewGeneralMemoOutright.aspx"> <input id="btnNewGeneralMemo" type="button" value="NEW" class="btnNew" /></a> 
                    </div>
                    <div style="float: left; margin-right: 5px;">
                        <asp:Button ID="btnUpdateBrand" runat="server" Text="UPDATE" 
                            CssClass="btnUpdate" Font-Names="Verdana" ViewStateMode="Disabled" />
                    </div>
                    <div style="float: left; margin-right: 5px;">
                        <asp:Button ID="btnDelete" runat="server" Text="DELETE" CssClass="btnDelete" 
                            Font-Names="Verdana"  ViewStateMode="Disabled" />
                        <asp:ModalPopupExtender ID="btnDelete_ModalPopupExtender" runat="server" 
                            CancelControlID="btnDeleteNo" DynamicServicePath="" Enabled="True" 
                            PopupControlID="pnlDeleteModal" PopupDragHandleControlID="pnlDeleteModalDrag" 
                            TargetControlID="btnDelete" BackgroundCssClass="bgModal">
                        </asp:ModalPopupExtender>
                    </div>
                    <div style="float: left; margin-right: 5px;">
                        <asp:Button ID="btnApprove" runat="server" Text="APPROVE" CssClass="btnDisableApproved" 
                            Font-Names="Verdana"  ViewStateMode="Disabled" Enabled="False" />
                        <asp:ModalPopupExtender ID="btnApprove_ModalPopupExtender" runat="server" 
                            DynamicServicePath="" Enabled="True" TargetControlID="btnApprove" 
                            CancelControlID="btnApprovedNo" PopupControlID="pnlApprovedModal" 
                            PopupDragHandleControlID="pnlApprovedModalDrag" 
                            BackgroundCssClass="bgModal">
                        </asp:ModalPopupExtender>
                    </div>
                    <div style="float: left; margin-right: 5px;">
                        <asp:Button ID="btnUnApprove" runat="server" Text="UNAPPROVE" CssClass="btnDisableUnApproved" 
                            Font-Names="Verdana"  ViewStateMode="Disabled" Enabled="False" />
                        <asp:ModalPopupExtender ID="btnUnApprove_ModalPopupExtender" runat="server" 
                            DynamicServicePath="" Enabled="True" PopupControlID="pnlUnApprovedModal" 
                            PopupDragHandleControlID="pnlUnApprovedModalDrag" 
                            TargetControlID="btnUnApprove" CancelControlID="btnUnApprovedNo" 
                            BackgroundCssClass="bgModal">
                        </asp:ModalPopupExtender>
                    </div>
                    <div style="float: left; margin-right: 5px;">
                        <asp:Button ID="btnPrint" runat="server" Text="PRINT" CssClass="btnPrint" 
                            Font-Names="Verdana"  ViewStateMode="Disabled" />
                    </div>
                    <div style="float: left; margin-left:10px; ">
                        <asp:Label Text="FILTER" CssClass="filter-link" ID="lblFilter" runat="server" />
                        <asp:HoverMenuExtender ID="lblFilter_HoverMenuExtender" runat="server" 
                            DynamicServicePath="" Enabled="True" PopupControlID="pnlFilter" 
                            PopupPosition="Bottom" TargetControlID="lblFilter">
                        </asp:HoverMenuExtender>

                        <asp:Panel ID="pnlFilter" runat="server">
                            <div class="hover-menu-arrow" >
                            </div> 
                            <div class="hover-menu">
                            </div>
                        </asp:Panel>
                    </div>
                    <div style="float: left; margin-right: 5px;">
                        <asp:UpdateProgress ID="upProgress" runat="server" AssociatedUpdatePanelID="upnlGeneralMemo">
                            <ProgressTemplate>
                                <asp:PlaceHolder ID="plcHLoader" runat="server" EnableViewState="False">
                                    <UC:LOADER ID="loader" runat="server" />
                                </asp:PlaceHolder>
                            </ProgressTemplate>
                        </asp:UpdateProgress>
                    </div>
                </div>
            </div>

            <div style="min-height:410px;">
                <div class="titleList">
                     <img alt="brands" src="../Resources/memo-doc.png" height="16" align="left" />
                    LIST OF GENERAL MEMO
                </div>
                <div>
                    <asp:GridView ID="gvGeneralMemo" runat="server" AllowPaging="True" 
                        AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
                        DataKeyNames="ID" DataSourceID="SqlDataSourceGeneralMemo" CssClass="table_grid"
                        GridLines="None"  PageSize ="15"
                        onselectedindexchanged="gvGeneralMemo_SelectedIndexChanged" 
                        EnablePersistedSelection="True">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                         <asp:TemplateField>
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Image ID="Image1" runat="server"  AlternateText='<%# Eval("ID") %>' Height="16px" ImageUrl="~/Resources/memo-doc.png" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:CommandField ShowSelectButton="True" />
                            <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" 
                                ReadOnly="True" SortExpression="ID" Visible="False" />
                            <asp:BoundField DataField="MemoNo" HeaderText="MEMO #" 
                                SortExpression="MemoNo" />
                            <asp:BoundField DataField="MemoDate" HeaderText="MEMO DATE" 
                                SortExpression="MemoDate" DataFormatString="{0:MMMM dd, yyyy}" />
                            <asp:BoundField DataField="BrandName" HeaderText="BRAND" 
                                SortExpression="BrandName" />
                            <asp:BoundField DataField="PriceType" HeaderText="PRICE TYPE" 
                                SortExpression="PriceType" />
                            <asp:BoundField DataField="FromDate" HeaderText="FROM DATE" 
                                SortExpression="FromDate" DataFormatString="{0:MMMM dd, yyyy}" />
                            <asp:BoundField DataField="ToDate" HeaderText="TO DATE" 
                                SortExpression="ToDate" DataFormatString="{0:MMMM dd, yyyy}" />
                            <asp:BoundField DataField="Status" HeaderText="STATUS" 
                                SortExpression="Status" />
                        </Columns>
                        <EditRowStyle BackColor="#7C6F57" />
                        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                        <PagerSettings 
                            Mode="NumericFirstLast" PageButtonCount="20" />
                        <PagerStyle CssClass="pager" />
                        <RowStyle BackColor="#E3EAEB" />
                        <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle CssClass="asc_cell_style" />
                        <SortedAscendingHeaderStyle  CssClass="asc_cell_style_h" />
                        <SortedDescendingCellStyle CssClass ="desc_cell_style" />
                        <SortedDescendingHeaderStyle  CssClass="desc_cell_style_h" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSourceGeneralMemo" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:IRMSConnectionString %>" 
                        SelectCommand="SP_GET_ALL_GENMEMO_OUTRIGHT" SelectCommandType ="StoredProcedure" >
                    </asp:SqlDataSource>
                </div>
            </div>

             <asp:Panel ID="pnlDeleteModal" runat="server" CssClass="modal" >
                <asp:Panel ID="pnlDeleteModalDrag" runat="server" CssClass="modalDrag">
                    <div class="sizeLogo">
                     <img alt="new brand" src="../Resources/product_brand.png" height="16" align="top" />
                       DELETE CONFIRMATION!!!
                    </div>
                </asp:Panel>
                <div style="border: 1px solid #FFCC66; text-align:center; font-family:Verdana; font-size:12px; height:23px;
                         color: #CC6600; background-color: #FFFF99; line-height:23px; margin:2px 5px;">
                        <img alt="error update" src="../Resources/warning.png" height="23px" align="top" />
                        Warning: This action cannot be undo.
                    </div>
                    <div style="text-align:center; color: #FFFF99; font-family:Verdana; font-size:11px; margin:5px 2px;">
                        <asp:Label ID="lblBrandToDelete" runat="server" Text="No data to delete. Select from the list and try again."></asp:Label>
                    </div>
                <div style=" text-align:center; margin: 5px 0px;">
                    <asp:Button ID="btnDeleteYes" runat="server" Text="YES" CssClass="modalWarningButtonYes"
                        ToolTip="Delete" Enabled="False" />
                    <asp:Button ID="btnDeleteNo" runat="server" Text="NO" CssClass="modalWarningButtonNo" 
                        ToolTip="Cancel" EnableViewState="False" />
                </div>
            </asp:Panel>
         
             <asp:Panel ID="pnlApprovedModal" runat="server" CssClass="modal" >
                <asp:Panel ID="pnlApprovedModalDrag" runat="server" CssClass="modalDrag">
                    <div class="sizeLogo">
                     <img alt="new brand" src="../Resources/product_brand.png" height="16" align="top" />
                       APPROVED CONFIRMATION!!!
                    </div>
                </asp:Panel>
                <div style="border: 1px solid #FFCC66; text-align:center; font-family:Verdana; font-size:12px; height:23px;
                         color: #CC6600; background-color: #FFFF99; line-height:23px; margin:2px 5px;">
                        <img alt="error update" src="../Resources/warning.png" height="23px" align="top" />
                        Warning: This action cannot be undo.
                    </div>
                    <div style="text-align:center; color: #FFFF99; font-family:Verdana; font-size:11px; margin:5px 2px;">
                        <asp:Label ID="Label2" runat="server" Text="No data to delete. Select from the list and try again."></asp:Label>
                    </div>
                <div style=" text-align:center; margin: 5px 0px;">
                    <asp:Button ID="btnApprovedYes" runat="server" Text="YES" CssClass="modalWarningButtonYes"
                        ToolTip="Delete" Enabled="False" />
                    <asp:Button ID="btnApprovedNo" runat="server" Text="NO" CssClass="modalWarningButtonNo" 
                        ToolTip="Cancel" EnableViewState="False" />
                </div>
            </asp:Panel>
           
            <asp:Panel ID="pnlUnApprovedModal" runat="server" CssClass="modal" >
                <asp:Panel ID="pnlUnApprovedModalDrag" runat="server" CssClass="modalDrag">
                    <div class="sizeLogo">
                     <img alt="new brand" src="../Resources/product_brand.png" height="16" align="top" />
                       UNAPPROVED CONFIRMATION!!!
                    </div>
                </asp:Panel>
                <div style="border: 1px solid #FFCC66; text-align:center; font-family:Verdana; font-size:12px; height:23px;
                         color: #CC6600; background-color: #FFFF99; line-height:23px; margin:2px 5px;">
                        <img alt="error update" src="../Resources/warning.png" height="23px" align="top" />
                        Warning: This action cannot be undo.
                    </div>
                    <div style="text-align:center; color: #FFFF99; font-family:Verdana; font-size:11px; margin:5px 2px;">
                        <asp:Label ID="Label3" runat="server" Text="No data to delete. Select from the list and try again."></asp:Label>
                    </div>
                <div style=" text-align:center; margin: 5px 0px;">
                    <asp:Button ID="btnUnApprovedYes" runat="server" Text="YES" CssClass="modalWarningButtonYes"
                        ToolTip="Delete" Enabled="False" />
                    <asp:Button ID="btnUnApprovedNo" runat="server" Text="NO" CssClass="modalWarningButtonNo" 
                        ToolTip="Cancel" EnableViewState="False" />
                </div>
            </asp:Panel>
          
            </ContentTemplate>
        </asp:UpdatePanel>

</asp:Content>
