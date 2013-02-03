<%@ Page Title="PRICE CHECK/ITEM REPROCESS MANAGEMEN PANEL" Language="C#" MasterPageFile="~/Marketing/Marketing.Master"
    AutoEventWireup="true" CodeBehind="PriceCheckingAndItemReprocessingPanel.aspx.cs"
    Inherits="IntegratedResourceManagementSystem.Marketing.PriceCheckingAndItemReprocessingPanel" %>

<%@ OutputCache CacheProfile="cached_profile" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Src="~/Marketing/controls/UCLoader.ascx" TagName="LOADER" TagPrefix="UC" %>
<asp:Content ID="HeadContent" ContentPlaceHolderID="head" runat="server">
    <link href="../Styles/price-check.css" rel="stylesheet" type="text/css" />
    <script src="../Scripts/jquery-1.7.2.min.js" type="text/javascript"></script>
    <link href="../Styles/item-reprocess.css" rel="stylesheet" type="text/css" />
    <script language="javascript" type="text/javascript">
        function SelectAll(frmId, id) {
            var frm = document.getElementById(frmId);
            for (i = 1; i < frm.rows.length; i++) {
                var checkbox = frm.rows[i].cells[1].childNodes[1];
                if (checkbox != null)
                    checkbox.checked = document.getElementById(id).checked;
            }
        };

        $(document).ready(function () {

           
        });
       
    </script>
 
</asp:Content>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div style="height: 26px; margin-bottom: 10px; line-height: 26px; color: #333; text-shadow: 1px 1px 0px white;">
        <asp:Image ID="imgpnlTitle" runat="server" ImageUrl="~/Resources/price.png" ImageAlign="Top" />
        &nbsp;<asp:Label ID="Label1" runat="server" Text="PRICE CHECK/ITEM RECLASSIFICATION MANAGEMENT PANEL"
            Font-Bold="True" Font-Names="Verdana" Font-Size="14px"></asp:Label>
        <div style="float: right;">
            <a href="StylePanel.aspx" title="BACK" >
          <img src="../Resources/reply.png" alt="BACK" />
          </a>
        </div>
        <hr />
    </div>
    <asp:UpdatePanel ID="upnlBrands" runat="server">
        <ContentTemplate>
            <div style="height: 26px; margin-bottom: 1px;" class="modalDrag">
                <div style="float: right;" class="SearchTextContainer">
                    SEARCH:
                    <asp:TextBox ID="txtSearch" runat="server" autofocus placeholder="Search Style" CssClass="modalText"
                        AutoPostBack="True" Height="16px" Font-Size="10px" Width="150px" ToolTip="Search Style"
                        OnTextChanged="txtSearch_TextChanged"></asp:TextBox>
                    <asp:ImageButton ID="imgBtnSearch" runat="server" ImageAlign="AbsBottom" ImageUrl="~/Resources/search.png"
                        ToolTip="SEARCH" OnClick="imgBtnSearch_Click" />
                </div>
                <div style="float: left;">
                  
                    <div style="float: left; margin-right: 5px;">
                        <asp:Button ID="btnViewPriceHistory" runat="server" Text="VIEW PRICE HISTORY" title="View Price History"
                            CssClass="btnReprocessItem" />
                        <asp:ModalPopupExtender ID="btnViewPriceHistory_ModalPopupExtender" runat="server"
                            CancelControlID="ibtnClosePriceHistory" DynamicServicePath="" Enabled="True"
                            PopupControlID="pnlViewPriceHistory" PopupDragHandleControlID="pnlViewPriceHistoryDrag"
                            TargetControlID="btnViewPriceHistory" BackgroundCssClass="bgModal">
                        </asp:ModalPopupExtender>
                    </div>
                    <div style="float: left; margin-right: 5px;">
                     <%--   <asp:HyperLink title="Items Reclassification" Height="23px" CssClass="btnReprocessItem"
                            ID="hpLinkReprocessStyles" runat="server" NavigateUrl="~/Marketing/ReprocessItems.aspx">ITEMS RECLASSIFICATION </asp:HyperLink>--%>
                    </div>
                    <div style="float: left; margin-left: 10px;">
                        <asp:Label Text="FILTER" CssClass="filter-link" ID="lblFilter" runat="server" />
                        <asp:HoverMenuExtender ID="lblFilter_HoverMenuExtender" runat="server" DynamicServicePath=""
                            Enabled="True" PopupControlID="pnlFilter" PopupPosition="Bottom" TargetControlID="lblFilter">
                        </asp:HoverMenuExtender>
                        <asp:Panel ID="pnlFilter" runat="server">
                            <div class="hover-menu-arrow">
                            </div>
                            <div class="hover-menu">
                                <div class="print-link">
                                    <label>
                                        BY BRAND:<asp:DropDownList ID="DDLBrands" runat="server" Height="18px" DataSourceID="SqlDataSourceBrands"
                                            DataTextField="BRAND_DESCRIPTION" DataValueField="BRAND_DESCRIPTION" Font-Names="Verdana"
                                            Font-Size="10px" ForeColor="#663300">
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="SqlDataSourceBrands" runat="server" ConnectionString="<%$ ConnectionStrings:IRMSConnectionString %>"
                                            SelectCommand="SELECT [BRAND_DESCRIPTION], [BRAND_CODE] FROM [BRANDS]"></asp:SqlDataSource>
                                    </label>
                                    <asp:Button CssClass="btnFilter" ID="btnFilterByBrand" runat="server" Text="FILTER"
                                        OnClick="btnFilterByBrand_Click" />
                                </div>
                                <div class="print-link" style="text-align: center;">
                                    <asp:Button CssClass="btnReload" ID="btnReFresh" runat="server" Text="REFRESH TABLE LIST"
                                        OnClick="btnReFresh_Click" />
                                    <asp:HiddenField ID="hfFilterBrand" Value="ALL" runat="server" />
                                </div>
                            </div>
                        </asp:Panel>
                    </div>
                    <div style="float: left; margin-right: 5px;">
                        <asp:UpdateProgress ID="upProgress" runat="server" AssociatedUpdatePanelID="upnlBrands">
                            <ProgressTemplate>
                                <asp:PlaceHolder ID="plcHLoader" runat="server">
                                    <UC:LOADER ID="loader" runat="server" />
                                </asp:PlaceHolder>
                            </ProgressTemplate>
                        </asp:UpdateProgress>
                    </div>
                </div>
            </div>
            <div class="titleList">
                <asp:Image ID="imgList" runat="server" Height="16px" Width="20px" ImageUrl="~/Resources/product.png"
                    ImageAlign="AbsBottom" />
                LIST OF ITEM
            </div>
            <div>
                <div id="styleListPanel">
                    <asp:Panel ID="pnlSizesList" Height="470px" runat="server" ScrollBars="Auto">
                        <asp:GridView ID="gvProductList" runat="server" CellPadding="4" GridLines="None"
                            AutoGenerateColumns="False" CssClass="table_grid" DataKeyNames="RECORD_NO,COST_PRICE,AP_Type"
                            EnablePersistedSelection="True" AllowPaging="True" AllowSorting="True" DataSourceID="SqlDataSourceStyles"
                            PageSize="15" OnPageIndexChanging="gvProductList_PageIndexChanging" OnSelectedIndexChanged="gvProductList_SelectedIndexChanged"
                            OnSelectedIndexChanging="gvProductList_SelectedIndexChanging" OnSorting="gvProductList_Sorting">
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:TemplateField>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Image ID="imgStyle" ToolTip='<%# Eval("AP_Type") %>' AlternateText='<%#Eval("COST_PRICE") %>' runat="server"
                                            Height="16px" ImageUrl="~/Resources/product.png" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                 <asp:TemplateField>
                                <EditItemTemplate>
                                    <asp:CheckBox ID="CheckBox1" runat="server" />
                                </EditItemTemplate>
                                <HeaderTemplate>
                                    <asp:CheckBox ID="chkAll" runat="server" ClientIDMode="Static" onclick="SelectAll('MainContent_gvProductList','chkAll')" />
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:CheckBox ID="chkItems"  runat="server" />
                                </ItemTemplate>
                            </asp:TemplateField>
                                <asp:CommandField ShowSelectButton="True" />
                                <asp:BoundField DataField="RECORD_NO" HeaderText="RECORD#" InsertVisible="False"
                                    ReadOnly="True" SortExpression="RECORD_NO" Visible="False"></asp:BoundField>
                                <asp:BoundField DataField="STYLE_NUMBER" HeaderText="STYLE #" SortExpression="STYLE_NUMBER">
                                    <ItemStyle Font-Bold="True" />
                                </asp:BoundField>
                                <asp:BoundField DataField="DESCRIPTION" HeaderText="DESCRIPTION" SortExpression="DESCRIPTION">
                                    <ItemStyle Font-Size="9px" />
                                </asp:BoundField>
                                <asp:BoundField DataField="COST_PRICE" HeaderText="COST PRICE" SortExpression="COST_PRICE"
                                    DataFormatString="{0:###,###.00}" Visible="False"></asp:BoundField>
                                <asp:BoundField DataField="BrandName" HeaderText="BRAND" SortExpression="BrandName" />
                            </Columns>
                            <EditRowStyle BackColor="#7C6F57" />
                            <EmptyDataTemplate>
                                <asp:Image ID="Image2" runat="server" ImageUrl="~/Resources/unhappy.png" ImageAlign="Middle" />
                                DATA NOT FOUND!!!
                            </EmptyDataTemplate>
                            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" Font-Size="12px" />
                            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                            <PagerSettings Mode="NumericFirstLast" />
                            <PagerStyle CssClass="pager" />
                            <RowStyle BackColor="#E3EAEB" />
                            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="False" ForeColor="#333333" Font-Names="Verdana"
                                Font-Size="11px" Font-Italic="True" />
                            <SortedAscendingCellStyle CssClass="asc_cell_style" />
                            <SortedAscendingHeaderStyle CssClass="asc_cell_style_h" />
                            <SortedDescendingCellStyle CssClass="desc_cell_style" />
                            <SortedDescendingHeaderStyle CssClass="desc_cell_style_h" />
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSourceStyles" runat="server" ConnectionString="<%$ ConnectionStrings:IRMSConnectionString %>"
                            SelectCommand="SP_GET_ALL_STYLES_FOR_CHECK_AND_REPROCESS" SelectCommandType="StoredProcedure"
                            EnableCaching="true"></asp:SqlDataSource>
                    </asp:Panel>
                    <asp:HiddenField ID="hfStyleNumber" runat="server" />
                    <asp:HiddenField ID="hfBrandForCustomerFilter" runat="server" />
                </div>
                <div id="list_action" class="modal">
                    <asp:Button CssClass="btnAddSelectedRight" ID="btnAddStyle" title="Add Style to be Check" runat="server" 
                        Text="ADD STYLE" onclick="btnAddStyle_Click" Width="90px" />
                    <br />
                     <asp:Button CssClass="btnRemoveSelectedLeft" title="Remove Style from selected List" ID="btnRemoveStyle" Width="90px" 
                        runat="server" Text="REMOVE STYLE" onclick="btnRemoveStyle_Click" />
                </div>
                <div id="selectedStyleList" class ="items-selected">
                <div style="min-height:160px;">
                    <div class="modalDrag">
                        <div style="font-size:8px;" class="sizeLogo">
                            LIST OF STYLE/S TO BE CHECK
                        </div>
                    </div>
                    <div style="padding:5px;">
                    
                    <asp:GridView ID="gvSelectedStyles" runat="server" AutoGenerateColumns="False" 
                        BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" 
                        CellPadding="2" Font-Names="Verdana" Font-Size="10px" ForeColor="Black" 
                        GridLines="None" >
                    <AlternatingRowStyle BackColor="PaleGoldenrod" />
                    <Columns>
                         <asp:TemplateField>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Image ID="imgStyle" AlternateText='<%# Eval("CostPrice")+"-"+Eval("APType")%>' ToolTip='<%# Eval("Description") %>' runat="server"
                                            Height="16px" ImageUrl="~/Resources/product.png" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                        <asp:TemplateField>
                                <EditItemTemplate>
                                    <asp:CheckBox ID="CheckBox1" runat="server" />
                                </EditItemTemplate>
                                <HeaderTemplate>
                                    <asp:CheckBox ID="chkAllSelected" runat="server" ClientIDMode="Static" onclick="SelectAll('MainContent_gvSelectedStyles','chkAllSelected')" />
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:CheckBox ID="chkItems" runat="server" />
                                </ItemTemplate>
                            </asp:TemplateField>
                        <asp:BoundField DataField="StyleNumber" HeaderText="STYLE #" />
                        <asp:BoundField DataField="Brand" HeaderText="BRAND" />
                    </Columns>
                        <EmptyDataTemplate>
                           <img src="../Resources/unhappy.png" alt="BLEH" align="middle" />
                            EMPTY STYLE!
                        </EmptyDataTemplate>
                    <FooterStyle BackColor="Tan" />
                    <HeaderStyle BackColor="Tan" Font-Bold="True" />
                    <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" 
                        HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
                    <SortedAscendingCellStyle BackColor="#FAFAE7" />
                    <SortedAscendingHeaderStyle BackColor="#DAC09E" />
                    <SortedDescendingCellStyle BackColor="#E1DB9C" />
                    <SortedDescendingHeaderStyle BackColor="#C2A47B" />
                </asp:GridView>
                    </div>
                </div>
                  <div style=" text-align:center; margin-top:5px; height:28px;">
                        <asp:Button ID="btnPriceCheck" runat="server" Text="CHECK PRICE" title="Check Price by Customer"
                            CssClass="btnDisablePriceCheck" Enabled="False"  />
                        <asp:ModalPopupExtender ID="btnPriceCheck_ModalPopupExtender" runat="server" DynamicServicePath=""
                            Enabled="True" PopupControlID="pnlCustomersModal" PopupDragHandleControlID="pnlCustomersModalDrag"
                            TargetControlID="btnPriceCheck" BackgroundCssClass="bgModal" CancelControlID="imgBtnpnlCustomersModal">
                            <Animations>
                                        <OnShown>
                                            <FadeIn Duration=".2" />
                                        </OnShown>
                            </Animations>
                        </asp:ModalPopupExtender>
                    </div>
                </div>
            </div>
            <asp:Panel ID="pnlCustomersModal" runat="server" CssClass="modal">
                <asp:Panel ID="pnlCustomersModalDrag" runat="server" CssClass="modalDrag">
                    <div class="close_btn">
                        <asp:ImageButton ID="imgBtnpnlCustomersModal" runat="server" CssClass="btnClose"
                            ImageUrl="~/Resources/cancel_gray.png" ToolTip="CLOSE" />
                    </div>
                    <div class="sizeLogo">
                        <img alt="new brand" src="../Resources/users.png" height="15" align="top" />
                        LIST OF CUSTOMERS
                    </div>
                </asp:Panel>
                <div style="padding: 2px 2px; height: 28px;">
                <asp:Panel ID="pnlCustomerBrands" CssClass="btnFilter" Height="29px" runat="server">
                    <label id="lblBrand" class="modalLabel" style=" font-weight:bold; font-size:10px;">BRAND  </label>
                    <br />
                        <asp:DropDownList ID="DDLCustomerBrands" Font-Size="9px" Height="16px" 
                        CssClass="modalText" runat="server" AutoPostBack="True" 
                        onselectedindexchanged="DDLCustomerBrands_SelectedIndexChanged">
                        </asp:DropDownList>
                  
                </asp:Panel>
                    <div class="SearchTextContainer">
                        SEARCH:
                        <asp:TextBox ID="txtSearchCustomer" Height="16px" Font-Size="10px" Width="120px"
                            placeholder="Search Customer" CssClass="modalText" runat="server"></asp:TextBox>
                        <asp:ImageButton ID="iBtnSearchCustomer" runat="server" ImageUrl="~/Resources/search.png"
                            ImageAlign="AbsBottom" OnClick="iBtnSearchCustomer_Click" />
                    </div>
                </div>
                <div style="padding: 3px 5px;">
                    <asp:GridView ID="gvCustomers" runat="server" CellPadding="4" CssClass="table_grid"
                        GridLines="None" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False"
                        DataKeyNames="CustNo" DataSourceID="SqlDataSourceCustomers" EnablePersistedSelection="True"
                        OnPageIndexChanging="gvCustomers_PageIndexChanging" OnSelectedIndexChanged="gvCustomers_SelectedIndexChanged"
                        OnSelectedIndexChanging="gvCustomers_SelectedIndexChanging" OnSorting="gvCustomers_Sorting"
                        PageSize="5" ViewStateMode="Disabled">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:TemplateField>
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Image ID="imgCustomer" ToolTip='<%# Eval("PGNo") %>' ImageUrl="~/Resources/users.png"
                                        AlternateText='<%# Eval("CustNo") %>' Height="14px" runat="server" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:CommandField ShowSelectButton="True" />
                            <asp:BoundField DataField="CustNo" HeaderText="CustNo" InsertVisible="False" ReadOnly="True"
                                SortExpression="CustNo" Visible="False" />
                            <asp:BoundField DataField="CompName" HeaderText="CUSTOMER NAME" SortExpression="CompName">
                                <HeaderStyle Wrap="False" />
                                <ItemStyle Wrap="False" />
                            </asp:BoundField>
                        </Columns>
                        <EditRowStyle BackColor="#7C6F57" />
                        <EmptyDataTemplate>
                            <img src="../Resources/unhappy.png" alt="WARNING" align="middle" />
                            CUSTOMER NOT FOUND!!!
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
                    <asp:SqlDataSource ID="SqlDataSourceCustomers" runat="server" ConnectionString="<%$ ConnectionStrings:IRMSConnectionString %>"
                        SelectCommand="SELECT [CustNo], [CompName],[PGNo] FROM [CustInfo] WHERE ([brand] = @brand)"
                        EnableCaching="True">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="hfBrandForCustomerFilter" Name="brand" PropertyName="Value"
                                Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>
                <div style="text-align: center; margin: 0 2px;">
                 
                    <label class="modalLabel" style="font-size: 9px;">
                        SELECTED CUSTOMER:
                    </label>
                    <br />
                    <asp:Label CssClass="modalText" ID="txtCustomer" Font-Size="9px" Text="NO SELECTED CUSTOMER"
                        runat="server"></asp:Label>
                 
                </div>
                <div style="text-align: center; height: 24px; padding: 5px 0; line-height: 24px;">
                    <asp:HyperLink Height="22px" Enabled="false" CssClass="btnPriceCheck" Target="_blank"
                        ID="hpLinkContinuePriceCheck" runat="server">CONTINUE PRICE CHECKING</asp:HyperLink>
                    <asp:HiddenField ID="hfCustomerId" runat="server" />
                </div>
            </asp:Panel>
            <%-- PRICE HISTORY MODAL--%>
            <asp:Panel ID="pnlViewPriceHistory" runat="server" CssClass="modal">
                <asp:Panel ID="pnlViewPriceHistoryDrag" runat="server" CssClass="modalDrag">
                    <div class="close_btn">
                        <asp:ImageButton ID="ibtnClosePriceHistory" runat="server" CssClass="btnClose" ImageUrl="~/Resources/cancel_gray.png"
                            ToolTip="CLOSE" />
                    </div>
                    <div style="font-family:Verdana; font-weight:bold; font-size:11px;" >
                        <img alt="new brand" src="../Resources/price.png" height="16" align="top" />
                        <asp:Label ID="lblStyleNumberHistory" runat="server" Text="PRICE HISTORY LIST" 
                            ForeColor="#FFFFCC"></asp:Label>
                    </div>
                </asp:Panel>
                <div>
                    <div class="titleList">
                        <img src="../Resources/History.png" height="16px" align="top" />
                        <asp:Label ID="lblPriceTitle" runat="server" Text="" ForeColor="#6b5f14" Font-Bold="true"></asp:Label>
                    </div>
                    <asp:Panel ID="pnlSelectError" runat="server" Font-Bold="True" Font-Names="Verdana"
                        Font-Size="12px" ForeColor="#663300">
                        <img src="../Resources/tableselectrowicon.png" align="middle" />
                        Please select item from the list.
                    </asp:Panel>
                    <asp:DataList ID="DListPrice" runat="server" DataSourceID="SqlDataSourcePrice">
                        <ItemTemplate>
                            <div class="history-item" style="margin: 2px 10px; min-width:630px;">
                                <div style="float: left; margin-right: 5px;">
                                    PRICE GROUP .50:
                                    <asp:Label ID="Price1Label" runat="server" Text='<%# Eval("Price1") %>' ForeColor="#CC0000"
                                        Font-Bold="true" />
                                    <br />
                                    PRICE GROUP .75:
                                    <asp:Label ID="Price2Label" runat="server" Text='<%# Eval("Price2") %>' ForeColor="#CC0000"
                                        Font-Bold="true" />
                                    <br />
                                    PRICE GROUP .95:
                                    <asp:Label ID="Price3Label" runat="server" Text='<%# Eval("Price3") %>' ForeColor="#CC0000"
                                        Font-Bold="true" />
                                    <br />
                                    PRICE GROUP 1.00:
                                    <asp:Label ID="Price4Label" runat="server" Text='<%# Eval("Price4") %>' ForeColor="#CC0000"
                                        Font-Bold="true" />
                                    <br />
                                </div>
                                <div style="display: inline-block;">
                                    PRICE GROUP -28.5%:
                                    <asp:Label ID="Price5Label" runat="server" Text='<%# Eval("Price5") %>' ForeColor="#CC0000"
                                        Font-Bold="true" />
                                    <br />
                                    PRICE GROUP -25%:
                                    <asp:Label ID="Price6Label" runat="server" Text='<%# Eval("Price6") %>' ForeColor="#CC0000"
                                        Font-Bold="true" />
                                    <br />
                                    PRICE GROUP -30%:
                                    <asp:Label ID="Price7Label" runat="server" Text='<%# Eval("Price7") %>' ForeColor="#CC0000"
                                        Font-Bold="true" />
                                    <br />
                                    PRICE GROUP -35%:
                                    <asp:Label ID="Price8Label" runat="server" Text='<%# Eval("Price8") %>' ForeColor="#CC0000"
                                        Font-Bold="true" />
                                    <br />
                                </div>
                                <div style="display: inline-block;">
                                    PRICE GROUP -40%:
                                    <asp:Label ID="Price9Label" runat="server" Text='<%# Eval("Price9") %>' ForeColor="#CC0000"
                                        Font-Bold="true" />
                                    <br />
                                    SPECIAL PRICE GROUP:
                                    <asp:Label ID="Price10Label" runat="server" Text='<%# Eval("Price10") %>' ForeColor="#CC0000"
                                        Font-Bold="true" />
                                    <br />
                                    PRICE GROUP .97:
                                    <asp:Label ID="Price11Label" runat="server" Text='<%# Eval("Price11") %>' ForeColor="#CC0000"
                                        Font-Bold="true" />
                                    <br />
                                    PRICE GROUP -15%:
                                    <asp:Label ID="Price12Label" runat="server" Text='<%# Eval("Price12") %>' ForeColor="#CC0000"
                                        Font-Bold="true" />
                                    <br />
                                </div>
                                <div style="display: inline-block;">
                                    PRICE GROUP -20%:
                                    <asp:Label ID="Price13Label" runat="server" Text='<%# Eval("Price13") %>' ForeColor="#CC0000"
                                        Font-Bold="true" />
                                    <br />
                                    PRICE GROUP .99:
                                    <asp:Label ID="Price14Label" runat="server" Text='<%# Eval("Price14") %>' ForeColor="#CC0000"
                                        Font-Bold="true" />
                                    <br />
                                    PRICE GROUP -31%:
                                    <asp:Label ID="Price15Label" runat="server" Text='<%# Eval("Price15") %>' ForeColor="#CC0000"
                                        Font-Bold="true" />
                                    <br />
                                    PRICE GROUP -45%:
                                    <asp:Label ID="Price16Label" runat="server" Text='<%# Eval("Price16") %>' ForeColor="#CC0000"
                                        Font-Bold="true" />
                                    <br />
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:DataList>
                    <asp:SqlDataSource ID="SqlDataSourcePrice" runat="server" ConnectionString="<%$ ConnectionStrings:IRMSConnectionString %>"
                        SelectCommand="SELECT 
      [StyleNo]
      ,CAST([Price1] as decimal(18,2) ) AS Price1 
      ,CAST([Price2] as decimal(18,2) ) AS Price2
      ,CAST([Price3] as decimal(18,2) ) AS Price3
      ,CAST([Price4] as decimal(18,2) ) AS Price4
      ,CAST([Price5] as decimal(18,2) ) AS Price5
      ,CAST([Price6] as decimal(18,2) ) AS Price6
      ,CAST([Price7] as decimal(18,2) ) AS Price7
      ,CAST([Price8] as decimal(18,2) ) AS Price8
      ,CAST([Price9] as decimal(18,2) ) AS Price9
      ,CAST([Price10] as decimal(18,2) ) AS Price10
      ,CAST([Price11] as decimal(18,2) ) AS Price11
      ,CAST([Price12] as decimal(18,2) ) AS Price12
      ,CAST([Price13] as decimal(18,2) ) AS Price13
      ,CAST([Price14] as decimal(18,2) ) AS Price14
      ,CAST([Price15] as decimal(18,2) ) AS Price15
      ,CAST([Price16] as decimal(18,2) ) AS Price16
  FROM [IRMS-DB].[dbo].[Price]
WHERE StyleNo =@STYLE_NUMBER
">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="hfStyleNumber" Name="STYLE_NUMBER" PropertyName="Value" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>
                <div style="min-height:250px; min-width: 650px; margin: 2px 5px;">
                    <div class="titleList">
                        <img src="../Resources/History.png" height="16px" align="top" />
                        <asp:Label ID="lblMarkDownHistoryTitle" runat="server" Text="" ForeColor="#6b5f14"
                            Font-Bold="true"></asp:Label>
                    </div>
                  
                        <asp:GridView ID="gvPriceHistory" runat="server" 
                            AutoGenerateColumns="False" CellPadding="4" 
                            DataSourceID="SqlDataSourcePriceHistory" CssClass="table_grid" 
                        GridLines="None">
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:BoundField DataField="MemoDate" HeaderText="MEMO DATE" ReadOnly="True" 
                                    SortExpression="MemoDate" />
                                <asp:BoundField DataField="MemoDate" HeaderText="DATE APPROVED" ReadOnly="True" 
                                    SortExpression="MemoDate" />
                                <asp:BoundField DataField="GrpNo" HeaderText="GrpNo" SortExpression="GrpNo" 
                                    Visible="False" />
                                <asp:BoundField DataField="CUSTOMER" HeaderText="CUSTOMER" ReadOnly="True" 
                                    SortExpression="CUSTOMER" />
                                <asp:BoundField DataField="FromDate" HeaderText="EFFECTIVITY DATE" ReadOnly="True" 
                                    SortExpression="FromDate" />
                                <asp:BoundField DataField="ToDate" HeaderText="TO DATE" 
                                    SortExpression="ToDate" Visible="False" />
                                <asp:BoundField DataField="StyleNo" HeaderText="StyleNo" 
                                    SortExpression="StyleNo" Visible="False" />
                                <asp:BoundField DataField="BrandName" HeaderText="BrandName" 
                                    SortExpression="BrandName" Visible="False" />
                                <asp:BoundField DataField="MDPrice" HeaderText="CURRENT PRICE" 
                                    SortExpression="MDPrice" >
                                <ItemStyle Font-Bold="True" ForeColor="#CC3300" HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="CurrPrice" HeaderText="OLD PRICE" ReadOnly="True" 
                                    SortExpression="CurrPrice" DataFormatString="{0:###,###.00}" >
                                <ItemStyle Font-Bold="True" ForeColor="#CC3300" HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="MemoNo" HeaderText="MEMO #" />
                                <asp:BoundField DataField="Row_Count" HeaderText="MD COUNT" ReadOnly="True" 
                                    SortExpression="Row_Count" Visible="False" >
                                <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                            </Columns>
                            <EditRowStyle BackColor="#7C6F57" />
                            <EmptyDataTemplate>
                                NO MAKDOWN HISTORY!
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
                     
                        <asp:SqlDataSource ID="SqlDataSourcePriceHistory" runat="server" ConnectionString="<%$ ConnectionStrings:IRMSConnectionString %>"
                            SelectCommand="GET_STYLE_PRICE_HISTORY" SelectCommandType="StoredProcedure"
                            EnableCaching="true">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="hfStyleNumber" Name="STYLE_NUMBER" PropertyName="Value" />
                                <asp:ControlParameter ControlID="hfBrandForCustomerFilter" Name="BRAND" PropertyName="Value" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                   
                </div>
            </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
