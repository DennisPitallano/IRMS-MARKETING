<%@ Page Title="" Language="C#" MasterPageFile="~/Marketing/Marketing.Master" AutoEventWireup="true"
    CodeBehind="GenericStylesManagementPanel.aspx.cs" Inherits="IntegratedResourceManagementSystem.Marketing.GenericStylesManagementPanel" %>
    
<%@ OutputCache CacheProfile="cached_profile" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Src="~/Marketing/controls/UCLoader.ascx" TagName="LOADER" TagPrefix="UC" %>
<asp:Content ID="HeadContent" ContentPlaceHolderID="head" runat="server">
    <link href="../Styles/generic-styles-management.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/permission-note.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="titlePanel">
        <img src="../Resources/product.png" height="22px" align="top" />
        &nbsp;Generic Style Management Panel&nbsp;
        <div style="float: right;">
           <a href="StylePanel.aspx" title="BACK">
            <img src="../Resources/reply.png" />
           </a>
        </div>
    </div>
    <asp:UpdatePanel ID="upnlGenericStyles" runat="server" >
        <ContentTemplate >
         <div>
           <div style="height:26px; margin-bottom:1px; " class="modalDrag">
                <div style="float: right;" class="SearchTextContainer">
                SEARCH:
                    <asp:TextBox ID="txtSearch" runat="server" autofocus placeholder="Search Brand" CssClass="modalText" 
                        AutoPostBack="True" Height="16px" Font-Size="10px" Width="150px" 
                        ToolTip="Search Brand" ontextchanged="txtSearch_TextChanged"></asp:TextBox>
                    <asp:ImageButton ID="imgBtnSearch" runat="server" ImageAlign="AbsBottom" ImageUrl="~/Resources/search.png"
                        ToolTip="SEARCH" onclick="imgBtnSearch_Click" />
                </div>
                <div style="float: left;">
                    <div style="float: left; margin-right: 5px;">
                        <a style="text-decoration:none;" href="NewGenericStyle.aspx" title="New Generic Style" >
                            <input id="btnNewGenericStyle" class="btnNew" type="button" value="NEW" />
                        </a> 
                    </div>
                    <div style="float: left; margin-right: 5px;">
                        <asp:Button ID="btnUpdate" runat="server" Text="UPDATE" 
                            CssClass="btnUpdate" Font-Names="Verdana" ViewStateMode="Disabled" />
                       
                    </div>
                    <div style="float: left; margin-right: 5px;">
                        <asp:Button ID="btnDelete" runat="server" Text="DELETE" CssClass="btnDelete" 
                            Font-Names="Verdana"  ViewStateMode="Disabled" />
                        <asp:ModalPopupExtender ID="btnDelete_ModalPopupExtender" runat="server" 
                            DynamicServicePath="" Enabled="True" TargetControlID="btnDelete" 
                            CancelControlID="btnDeleteNo" PopupControlID="pnlDeleteGenericStyleModal" 
                            PopupDragHandleControlID="pnlDeleteGenericStyleModalDrag">
                        </asp:ModalPopupExtender>
                      </div>
                    <div style="float: left; margin-right: 5px;">
                        <asp:Button ID="btnPrint" runat="server" Text="PRINT" CssClass="btnPrint" 
                            Font-Names="Verdana"  ViewStateMode="Disabled" />
                    </div>
                      <div style="float: left; margin-right: 5px;">
                        <asp:UpdateProgress ID="upProgress" runat="server" AssociatedUpdatePanelID="upnlGenericStyles">
                            <ProgressTemplate>
                                <asp:PlaceHolder ID="plcHLoader" runat="server">
                                    <UC:LOADER ID="loader" runat="server" />
                                </asp:PlaceHolder>
                            </ProgressTemplate>
                        </asp:UpdateProgress>
                    </div>
                </div>
            </div>
    </div>
    <div style="min-height:480px;">

        <div style="float:left; min-width:300px; margin-right:2px;">
            <div class="titleList">
               <img src="../Resources/product.png" height="16px" align="top" />
                LIST OF GENERIC STYLE
            </div>
            <div>
                <asp:GridView ID="gvGenericStyleList" runat="server" AllowPaging="True" 
                    AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
                    DataKeyNames="StyleNo,StyleID" DataSourceID="SqlDataSourceGenericStyles" 
                   CssClass="table_grid" GridLines="None" PageSize="15" 
                    onselectedindexchanged="gvGenericStyleList_SelectedIndexChanged">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:TemplateField>
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Image ID="imgStyle"  runat="server" ImageUrl="~/Resources/product.png" Height="16px" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:CommandField ShowSelectButton="True" />
                        <asp:BoundField DataField="StyleID" HeaderText="StyleID" InsertVisible="False" 
                            ReadOnly="True" SortExpression="StyleID" Visible="False" />
                        <asp:BoundField DataField="StyleNo" HeaderText="STYLE #" 
                            SortExpression="StyleNo" />
                        <asp:BoundField DataField="BrandName" HeaderText="BRAND" 
                            SortExpression="BrandName" />
                        <asp:BoundField DataField="StyleDesc" HeaderText="DESCRIPTION" 
                            SortExpression="StyleDesc" />
                        <asp:BoundField DataField="Cost" HeaderText="AVE. COST" SortExpression="Cost" 
                            DataFormatString="{0:###,###.00}" >
                        <ItemStyle Font-Bold="True" ForeColor="#CC0000" />
                        </asp:BoundField>
                    </Columns>
                    <EditRowStyle BackColor="#7C6F57" />
                    <EmptyDataTemplate>
                      <img src="../Resources/unhappy.png" align="middle" />
                        EMPTY DATA!!!
                    </EmptyDataTemplate>
                    <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                    <PagerStyle  CssClass="pager" />
                    <RowStyle BackColor="#E3EAEB" />
                    <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle CssClass="asc_cell_style" />
                    <SortedAscendingHeaderStyle CssClass="asc_cell_style_h" />
                    <SortedDescendingCellStyle  CssClass="desc_cell_style" />
                    <SortedDescendingHeaderStyle CssClass="desc_cell_style_h" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSourceGenericStyles" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:IRMSConnectionString %>" 
                    SelectCommand="SELECT [StyleID], [StyleNo], [BrandName], [StyleDesc], [Cost] FROM [Style] WHERE ([IsGeneric] = @IsGeneric) and IsActive=1 ORDER BY StyleID DESC">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="true" Name="IsGeneric" Type="Boolean" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </div>
        </div>
        
        <div style="float:left; min-width:300px;">
            <div class="titleList">
                GENERIC STYLE PRODUCTS
            </div>
            <div>
                <asp:GridView ID="gvGenericStyleProduct" runat="server" CellPadding="4" 
                    CssClass="table_grid" GridLines="None" AllowPaging="True" 
                    AllowSorting="True" AutoGenerateColumns="False" 
                    DataSourceID="SqlDataSourceGenericStyleProducts" 
                    DataKeyNames="RECORD_NO,OLD_STYLE_NO">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:TemplateField>
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Image ID="Image1" runat="server" ImageUrl="~/Resources/Barcode.png" Height="16px" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:CommandField ShowSelectButton="True" />
                        <asp:BoundField DataField="RECORD_NO" HeaderText="RECORD_NO" 
                            InsertVisible="False" ReadOnly="True" SortExpression="RECORD_NO" 
                            Visible="False" />
                        <asp:BoundField DataField="NEW_STYLE_NO" HeaderText="NEW_STYLE_NO" 
                            SortExpression="NEW_STYLE_NO" Visible="False" />
                        <asp:BoundField DataField="BARCODE" HeaderText="BARCODE" 
                            SortExpression="BARCODE" />
                        <asp:BoundField DataField="OLD_STYLE_NO" HeaderText="OLD_STYLE_NO" 
                            SortExpression="OLD_STYLE_NO" />
                        <asp:BoundField DataField="DATE_GENERATED" HeaderText="DATE_GENERATED" 
                            SortExpression="DATE_GENERATED" DataFormatString="{0:MMMM dd, yyyy}" />
                    </Columns>
                    <EditRowStyle BackColor="#7C6F57" />
                    <EmptyDataTemplate>
                    <img src ="../Resources/unhappy.png" align="middle" />
                        EMPTY DATA!!!
                    </EmptyDataTemplate>
                    <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#E3EAEB" />
                    <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#F8FAFA" />
                    <SortedAscendingHeaderStyle BackColor="#246B61" />
                    <SortedDescendingCellStyle BackColor="#D4DFE1" />
                    <SortedDescendingHeaderStyle BackColor="#15524A" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSourceGenericStyleProducts" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:IRMSConnectionString %>" 
                    SelectCommand="SELECT [RECORD_NO], [NEW_STYLE_NO], [BARCODE], [OLD_STYLE_NO], [DATE_GENERATED] FROM [GENERIC_STYLE_LIST_DTL] WHERE ([NEW_STYLE_NO] = @NEW_STYLE_NO)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="gvGenericStyleList" Name="NEW_STYLE_NO" 
                            PropertyName="SelectedValue" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </div>
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

    </div>
        
        <asp:Panel ID="pnlDeleteGenericStyleModal" CssClass="modal" runat="server" >
            <asp:Panel CssClass="modalDrag" ID="pnlDeleteGenericStyleModalDrag" runat="server" >
                <div class="sizeLogo">
                    <img alt="question" src="../Resources/question.png" height="18px" align="top" />
                    CONFIRMATION!
                </div>
            </asp:Panel>
            <div style="text-align:center; padding:5px; margin-top:5px;" class="modalLabel">
                Are you sure you want to delete this data?
                <br />
                <asp:Label Text="No Selected data!" runat="server" ID="lblSelectedValue" />
            </div>
            <div style="text-align:center; margin:5px;">
                <asp:Button ID="btnDeleteYes" CssClass="modalWarningButtonYes" runat="server" 
                    Text="YES" onclick="btnDeleteYes_Click" />
                <asp:Button ID="btnDeleteNo" CssClass="modalWarningButtonNo" runat="server" Text="NO" />
            </div>
        </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>
   
</asp:Content>
