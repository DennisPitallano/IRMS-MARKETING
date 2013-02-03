<%@ Page Title="" Language="C#" MasterPageFile="~/Marketing/Marketing.Master" AutoEventWireup="true" CodeBehind="MarkDownMemoConcession.aspx.cs" Inherits="IntegratedResourceManagementSystem.Marketing.MarkDownMemoConcession" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Src="~/Marketing/controls/UCLoader.ascx" TagName="LOADER" TagPrefix="UC" %>
<asp:Content ID="HeadContent" ContentPlaceHolderID="head" runat="server">
    <link href="../Styles/general-memo-concession.css" rel="stylesheet" type="text/css" />
     <script language="javascript" type="text/javascript">
         function SelectAll(frmId, id) {
             var frm = document.getElementById(frmId);
             for (i = 1; i < frm.rows.length; i++) {
                 var checkbox = frm.rows[i].cells[1].childNodes[1];
                 if (checkbox != null)
                     checkbox.checked = document.getElementById(id).checked;
             }
         };
    </script>
</asp:Content>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div style="height: 28px; margin-bottom: 10px; line-height: 28px; color: #333; text-shadow: 1px 1px 0px white;">
        <asp:Image ID="imgpnlTitle" runat="server" ImageUrl="~/Resources/memo-doc.png" ImageAlign="Top"
            Height="28px" />
        &nbsp;<asp:Label ID="Label1" runat="server" Text="MARKDOWN MEMO(CONCESSION) MANAGEMENT PANEL"
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
                    <asp:TextBox ID="txtSearch" runat="server" autofocus placeholder="Search General Memo" CssClass="modalText" 
                        AutoPostBack="True" Height="16px" Font-Size="10px" Width="150px" ToolTip="Search General Memo"></asp:TextBox>
                    <asp:ImageButton ID="imgBtnSearch" runat="server" ImageAlign="AbsBottom" ImageUrl="~/Resources/search.png"
                        ToolTip="SEARCH" />
                </div>
                <div style="float: left;">
                    <div style="float: left; margin-right: 5px;">
                      <%-- <a style="text-decoration:none;" href="NewGeneralMemoConcession.aspx"> 
                       <input id="btnNewGeneralMemo" type="button" value="NEW" class="btnNew" /></a>--%>
                        <asp:Button CssClass="btnNew" ID="btnNewGeneralMemo" runat="server" Text="ADD"  />
                        <asp:HoverMenuExtender ID="btnNewGeneralMemo_HoverMenuExtender" runat="server" 
                            DynamicServicePath="" Enabled="True" TargetControlID="btnNewGeneralMemo" 
                            PopupControlID="pnlAddOption" PopupPosition="Bottom">
                        </asp:HoverMenuExtender>
                         <asp:Panel ID="pnlAddOption" runat="server">
                            <div class="hover-menu-arrow" >
                            </div> 
                            <div class="hover-menu">
                                <div class="print-link">
                                    <asp:HyperLink ID="hpLinkNewBlankMemo" Target="_blank" runat="server" 
                                        NavigateUrl="~/Marketing/NewMarkDownMemoConcession.aspx">NEW BLANK MEMO</asp:HyperLink>
                                </div>
                                <div class="print-link">
                                    <asp:HyperLink ID="hpLinkNewFromTemplateMemo" Target="_blank" runat="server">NEW FROM SELECTED MEMO</asp:HyperLink>
                                </div>
                            </div>
                        </asp:Panel>
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
                        <asp:HoverMenuExtender ID="btnPrint_HoverMenuExtender" runat="server" 
                            DynamicServicePath="" Enabled="True" TargetControlID="btnPrint" 
                            PopupControlID="pnlPrintOption" PopupPosition="Bottom">
                        </asp:HoverMenuExtender>
                         <asp:Panel ID="pnlPrintOption" runat="server">
                            <div class="hover-menu-arrow" >
                            </div> 
                            <div class="hover-menu">
                                <div class="print-link">
                                    <asp:HyperLink ID="hpLinkPrint" Target="_blank" runat="server">PRINT SELECTED</asp:HyperLink>
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
                    LIST OF MARKDOWN MEMO
                </div>
                <div>
                    <asp:GridView ID="gvMarkDownMemos" runat="server" AllowPaging="True" 
                        AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
                        DataKeyNames="ID,MemoNo" DataSourceID="SqlDataSourceGeneralMemo" CssClass="table_grid"
                        GridLines="None"  PageSize ="15"
                        EnablePersistedSelection="True" 
                        onselectedindexchanged="gvMarkDownMemos_SelectedIndexChanged">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                         <asp:TemplateField>
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Image ID="imgMDMemo" runat="server"  AlternateText='<%# Eval("ID") %>' Height="16px" ImageUrl="~/Resources/memo-doc.png" />
                                </ItemTemplate>
                            </asp:TemplateField>
                             <asp:TemplateField>
                                <EditItemTemplate>
                                    <asp:CheckBox ID="CheckBox1" runat="server" />
                                </EditItemTemplate>
                                <HeaderTemplate>
                                    <asp:CheckBox ID="chkAll" runat="server" ClientIDMode="Static" onclick="SelectAll('MainContent_gvGeneralMemo','chkAll')" />
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:CheckBox ID="chkItems" runat="server" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:CommandField ShowSelectButton="True" />
                            <asp:BoundField DataField="MemoNo" HeaderText="MEMO #" 
                                SortExpression="MemoNo" />
                            <asp:BoundField DataField="MemoDate" HeaderText="MEMO DATE" 
                                SortExpression="MemoDate" DataFormatString="{0:MMMM dd, yyyy}" />
                            <asp:BoundField DataField="CompName" HeaderText="CUSTOMER" 
                                SortExpression="CompName" />
                            <asp:BoundField DataField="brand" HeaderText="BRAND" 
                                SortExpression="brand" />
                            <asp:BoundField DataField="FromDate" HeaderText="FROM DATE" 
                                SortExpression="FromDate" DataFormatString="{0:MMMM dd, yyyy}" />
                            <asp:BoundField DataField="ToDate" HeaderText="TO DATE" 
                                SortExpression="ToDate" DataFormatString="{0:MMMM dd, yyyy}" />
                            <asp:CheckBoxField DataField="ynFurther" HeaderText="FOR FURTHER MD?" 
                                SortExpression="ynFurther" Visible="False" >
                            <HeaderStyle Font-Size="8px" Width="70px" />
                            <ItemStyle HorizontalAlign="Center" />
                            </asp:CheckBoxField>
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
                        SelectCommand="SP_GET_ALL_MARKDOWN_MEMO_CONCESSION" SelectCommandType="StoredProcedure">
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
