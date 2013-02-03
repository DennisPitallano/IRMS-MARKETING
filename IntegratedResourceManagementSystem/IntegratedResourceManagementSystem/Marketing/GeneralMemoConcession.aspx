<%@ Page Title="" Language="C#" MasterPageFile="~/Marketing/Marketing.Master" AutoEventWireup="true"
    CodeBehind="GeneralMemoConcession.aspx.cs" Inherits="IntegratedResourceManagementSystem.Marketing.GeneralMemoConcession" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Src="~/Marketing/controls/UCLoader.ascx" TagName="LOADER" TagPrefix="UC" %>
<asp:Content ID="HeadContent" ContentPlaceHolderID="head" runat="server">
    <link href="../Styles/general-memo-concession.css" rel="stylesheet" type="text/css" />
    <script language="javascript" type="text/javascript">

    </script>
</asp:Content>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div style="height: 28px; margin-bottom: 10px; line-height: 28px; color: #333; text-shadow: 1px 1px 0px white;">
        <asp:Image ID="imgpnlTitle" runat="server" ImageUrl="~/Resources/memo-doc.png" ImageAlign="Top"
            Height="28px" />
        &nbsp;<asp:Label ID="Label1" runat="server" Text="GENERAL MEMO(CONCESSION) MANAGEMENT PANEL"
            Font-Bold="True" Font-Names="Verdana" Font-Size="14px"></asp:Label>
        <div style="float: right; height: 24px;">
            <a href="MarkDownMemoMenu.aspx"><img alt="BACK" src="../Resources/reply.png" alt="BACK" /></a>
        </div>
        <hr style="color: #fff;" />
    </div>
    <asp:UpdatePanel ID="upnlGeneralMemo" runat="server">
        <ContentTemplate>
            <div style="height:26px; margin-bottom:1px; " class="modalDrag">
                <div style="float: right;" class="SearchTextContainer">
                SEARCH:
                    <asp:TextBox ID="txtSearch" runat="server" autofocus 
                        placeholder="Search General Memo" CssClass="modalText" 
                        AutoPostBack="True" Height="16px" Font-Size="10px" Width="150px" 
                        ToolTip="Search General Memo" ontextchanged="txtSearch_TextChanged"></asp:TextBox>
                    <asp:ImageButton ID="imgBtnSearch" runat="server" ImageAlign="AbsBottom" ImageUrl="~/Resources/search.png"
                        ToolTip="SEARCH" />
                </div>
                <div style="float: left;">
                    <div style="float: left; margin-right: 5px;">
                       <a style="text-decoration:none;" href="NewGeneralMemoConcession.aspx"> 
                       <input id="btnNewGeneralMemo" type="button" value="NEW" class="btnNew" /></a> 
                       
                    </div>
                    <div style="float: left; margin-right: 5px;" >

                        <asp:Button ID="btnUpdateMemo" runat="server" Text="UPDATE" CssClass="btnUpdate"
                            Font-Names="Verdana" onclick="btnUpdateMemo_Click" />
<%--                     <a style="text-decoration:none;" href="UpdateGeneralMemoConcession.aspx"> 
                       <input id="btnUpdate" type="button" value="UPDATE" class="btnNew"  onclick="return btnUpdate_onclick()" /></a> 
--%>                    </div>
                    <div style="float: left; margin-right: 5px;">
                        <asp:Button ID="btnDelete" runat="server" Text="DELETE" CssClass="btnDelete" 
                            Font-Names="Verdana"  ViewStateMode="Disabled" />
                        <asp:ModalPopupExtender ID="btnDelete_ModalPopupExtender" runat="server" 
                            CancelControlID="btnDeleteNo" DynamicServicePath="" Enabled="True" 
                            PopupControlID="pnlDeleteModal" PopupDragHandleControlID="pnlDeleteModalDrag" 
                            TargetControlID="btnDelete" BackgroundCssClass="bgModal">
                        </asp:ModalPopupExtender>
                    </div>


                    <div style="float: left; margin-right: 5px;" >
                        <asp:Button ID="btnView" runat="server" Text="VIEW" CssClass="btnUpdate"
                            Font-Names="Verdana" onclick="btnView_Click"/>
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
                        <asp:Button ID="btnDuplicate" runat="server" Text="DUPLICATE" 
                            CssClass="btnDuplicate" Font-Names="Verdana" ViewStateMode="Disabled" 
                            Visible="False" />
                           <asp:ModalPopupExtender ID="btnDuplicate_PopUpExtender" runat="server" 
                            CancelControlID="btnDUplicateNo" DynamicServicePath="" Enabled="True" 
                            PopupControlID="pnlDuplicate" PopupDragHandleControlID="pnlDuplicateModalDrag" 
                            TargetControlID="btnDuplicate" BackgroundCssClass="bgModal">
                        </asp:ModalPopupExtender>
                            <asp:HoverMenuExtender ID="btnDuplicate_HoverMenuExtender" runat="server" 
                            DynamicServicePath="" Enabled="True" TargetControlID="btnDuplicate" 
                            PopupControlID="pnlDuplicateOption" PopupPosition="Bottom">
                        </asp:HoverMenuExtender>
                    </div>
                    <div style="float: left; margin-right: 5px;">
                        <asp:Button ID="btnPrint" runat="server" Text="PRINT" CssClass="btnPrint" 
                            Font-Names="Verdana"  ViewStateMode="Disabled" />
                        <asp:HoverMenuExtender ID="btnPrint_HoverMenuExtender" runat="server" 
                            DynamicServicePath="" Enabled="True" TargetControlID="btnPrint" 
                            PopupControlID="pnlPrintOption" PopupPosition="Bottom">
                        </asp:HoverMenuExtender>
                         <asp:Panel ID="pnlPrintOption" runat="server">
                            <div class="hover-menu-arrow" >
                            </div> 
                            <div class="hover-menu">
                                <div class="print-link">
                                    <asp:HyperLink ID="hpLinkPrint" NavigateUrl ="~/Marketing/GenMemoReportViewer.aspx" Target="_blank" runat="server">PRINT SELECTED</asp:HyperLink>
                                </div>
                                <div class="print-link">
                                    <asp:HyperLink ID="hpLinkPrintDraft" Target="_blank" runat="server">PRINT DRAFT</asp:HyperLink>
                                </div>
                                <div class="print-link">
                                    <asp:HyperLink ID="hpLinkExportToExcel" Target="_blank" runat="server">EXPORT TO EXCEL</asp:HyperLink>
                                </div>
                            </div>
                        </asp:Panel>
                    </div>
                    <div style="float: left; margin-left:10px; ">
                        <asp:Label Text="FILTER" CssClass="filter-link" ID="lblFilter" runat="server" />
                        <asp:HoverMenuExtender ID="lblFilter_HoverMenuExtender" runat="server" 
                            DynamicServicePath="" Enabled="True" TargetControlID="lblFilter" 
                            PopupControlID="pnlFilter" PopupPosition="Bottom">
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
                        EnablePersistedSelection="True" 
                        onselectedindexchanged="gvGeneralMemo_SelectedIndexChanged">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                         <asp:TemplateField>
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Image ID="imgMemo" runat="server" AlternateText='<%# Eval("ID") %>' Height="16px" ImageUrl="~/Resources/memo-doc.png" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:CommandField ShowSelectButton="True" />
                            <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" 
                                ReadOnly="True" SortExpression="ID" Visible="False" />
                            <asp:BoundField DataField="MemoNo"  HeaderText="MEMO #" 
                                SortExpression="MemoNo" />
                            <asp:BoundField DataField="MemoDate" HeaderText="MEMO DATE" 
                                SortExpression="MemoDate" DataFormatString="{0:MMMM dd, yyyy}" />
                            <asp:BoundField DataField="BrandName" HeaderText="BRAND" 
                                SortExpression="BrandName" />
                            <asp:BoundField DataField="PriceType" HeaderText="PRICE TYPE" 
                                SortExpression="PriceType" />
                            <asp:BoundField DataField="APPLY_TO" HeaderText="APPLY TO" />
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

                        SelectCommand="SELECT a.ID as [ID],a.MemoNo as [MemoNo], a.MemoDate as [MemoDate], a.BrandName as [BrandName], a.PriceType as [PriceType], 
case UPPER(a.PriceType)
  when null then ''
  when 'AREA' then (select UPPER(b.GroupName) from GrpAreaMemo b where b.GrpNo = a.GrpNo)
  when 'SUB-AREA' then (select UPPER(c.GroupName) from GrpSubAreaMemo c where c.SagNo = a.GrpNo)
  when 'CUSTOMER' then (select UPPER(d.compname) from custinfo d where d.custno = a.GrpNo)
end 
as APPLY_TO
, a.FromDate as [FromDate], a.ToDate as [ToDate], a.Status as [Status] 
FROM GenMemo a
ORDER BY [ID] DESC, [MemoDate] DESC">
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
                        ToolTip="Delete" Enabled="False" onclick="btnDeleteYes_Click" />
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
                        <asp:Label ID="lblApproved" runat="server" Text="No data to delete. Select from the list and try again."></asp:Label>
                    </div>
                <div style=" text-align:center; margin: 5px 0px;">
                    <asp:Button ID="btnApprovedYes" runat="server" Text="YES" CssClass="modalWarningButtonYes"
                        ToolTip="Delete" Enabled="False" onclick="btnApprovedYes_Click"/>
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
                        <asp:Label ID="lblUnapproved" runat="server" Text="No data to delete. Select from the list and try again."></asp:Label>
                    </div>
                <div style=" text-align:center; margin: 5px 0px;">
                    <asp:Button ID="btnUnApprovedYes" runat="server" Text="YES" CssClass="modalWarningButtonYes"
                        ToolTip="Delete" Enabled="False" onclick="btnUnApprovedYes_Click" />
                    <asp:Button ID="btnUnApprovedNo" runat="server" Text="NO" CssClass="modalWarningButtonNo" 
                        ToolTip="Cancel" EnableViewState="False" />
                </div>
            </asp:Panel>

<%--             <asp:Panel ID="pnlDuplicate" runat="server" CssClass="modal" >
                <asp:Panel ID="pnlDuplicateModalDrag" runat="server" CssClass="modalDrag">
                    <div class="sizeLogo">
                     <img alt="new brand" src="../Resources/product_brand.png" height="16" align="top" />
                       DUPLICATE CONFIRMATION!!!
                    </div>
                </asp:Panel>
                <div style="border: 1px solid #FFCC66; text-align:center; font-family:Verdana; font-size:12px; height:23px;
                         color: #CC6600; background-color: #FFFF99; line-height:23px; margin:2px 5px;">
                        <img alt="error update" src="../Resources/warning.png" height="23px" align="top" />
                        Warning: This action cannot be undo.
                    </div>
                    <div style="text-align:center; color: #FFFF99; font-family:Verdana; font-size:11px; margin:5px 2px;">
                        <asp:Label ID="lblDuplicate" runat="server" Text="No data to delete. Select from the list and try again."></asp:Label>
                    </div>
                <div style=" text-align:center; margin: 5px 0px;">
                    <asp:Button ID="btnDUplicateYes" runat="server" Text="YES" CssClass="modalWarningButtonYes"
                        ToolTip="Duplicate" onclick="btnDUplicateYes_Click" />
                    <asp:Button ID="btnDUplicateNo" runat="server" Text="NO" CssClass="modalWarningButtonNo" 
                        ToolTip="Cancel" EnableViewState="False" />
                </div>
            </asp:Panel>--%>


            </a>


        </ContentTemplate>
    </asp:UpdatePanel>

</asp:Content>
