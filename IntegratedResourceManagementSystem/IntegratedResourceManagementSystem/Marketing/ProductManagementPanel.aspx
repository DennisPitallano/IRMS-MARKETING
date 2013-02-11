<%@ Page Title="" Language="C#" MasterPageFile="~/Marketing/Marketing.Master" AutoEventWireup="true"
    CodeBehind="ProductManagementPanel.aspx.cs" Inherits="IntegratedResourceManagementSystem.Marketing.ProductCategoryManagementPanel" %>

<%@ Register Src="~/Marketing/controls/UCLoader.ascx" TagName="LOADER" TagPrefix="UC" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="HeadContent" ContentPlaceHolderID="head" runat="server">
    <link href="../Styles/product-management.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/permission-note.css" rel="stylesheet" type="text/css" />
     <link href="../Styles/price-check.css" rel="stylesheet" type="text/css" />
     <script type="text/javascript">
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
    <div class="pnlTitle">
        <asp:Image ID="imgpnlTitle" runat="server" ImageUrl="~/Resources/garments_collection.png"
            ImageAlign="Top" Height="28px" />
         &nbsp;<asp:Label ID="Label1" runat="server" Text="ITEM MANAGEMENT PANEL" Font-Bold="True"
                    Font-Names="Verdana" Font-Size="14px"></asp:Label>
        <div style="float: right;">
            <asp:ImageButton ID="imgBtnBack" runat="server" ImageUrl="~/Resources/reply.png"
                PostBackUrl="~/Marketing/StylePanel.aspx" ToolTip="BACK" />
        </div>
        <hr />
    </div>
    <asp:UpdatePanel ID="upnlProducts" runat="server">
        <ContentTemplate>
            <div style=" margin-bottom:1px; height:26px;" class="modalDrag">
             <div style="float: right;" class="SearchTextContainer">
                SEARCH:
                    <asp:TextBox ID="txtSearch" CssClass="modalText"  Height="16px" Font-Size="10px" Width="150px"
                     autofocus placeholder="Search Style" runat="server" AutoPostBack="True" OnTextChanged="txtSearch_TextChanged"></asp:TextBox>
                    <asp:ImageButton ID="imgBtnSearch" runat="server" ImageAlign="AbsBottom" ImageUrl="~/Resources/search.png"
                        ToolTip="SEARCH" onclick="imgBtnSearch_Click" />
                </div>
                <div style="float: left;">
                    <div style="float: left; margin-right: 5px;">
                       <a style="text-decoration:none;" href="NewItemForm.aspx" title="Add New Style" >
                        <input class="btnNew" id="Button1" type="button" value="ADD" />
                       </a>
                    </div>
                    <div style="float: left; margin-right: 5px;">
                        <asp:Button ID="btnUpdateProductCategory" runat="server" Text="UPDATE" CssClass="btnUpdate"
                            Font-Names="Verdana" ToolTip="Update Style Number" Font-Size="12px" OnClick="btnUpdateProductCategory_Click" />
                    </div>
                    <div style="float: left; margin-right: 5px;">
                        <asp:Button ID="btnGenerateItemCodeAndSKUS" runat="server" Width="180px" Text="GENERATE CODE/SKU's"
                            CssClass="btnGenerateCodeSKU" Font-Names="Verdana" Visible="False" OnClick="btnGenerateItemCodeAndSKUS_Click"
                             Font-Size="11px" />
                    </div>
                    <div style="float: left; margin-right: 5px;">
                        <asp:HyperLink ID="hpLinkStyleDetails" CssClass="btnPrint"  Target="_blank" Height="23px" style="line-height:23px; text-decoration:none; padding-right:3px;"  runat="server">VIEW DETAILS</asp:HyperLink>
                    </div>
                    <div style="float: left; margin-right: 5px;">
                    <asp:HyperLink ID="hpLinkPrintPreview" CssClass="btnPrint" Target="_blank" Height="23px" style="line-height:23px; text-decoration:none; padding-right:3px;" runat="server">PRINT</asp:HyperLink>
                     
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
                                        BY BRAND:<asp:DropDownList ID="DDLBrands" runat="server" Height="18px" Font-Names="Verdana"
                                            Font-Size="10px" ForeColor="#663300">
                                        </asp:DropDownList>
                                      <%--  <asp:SqlDataSource ID="SqlDataSourceBrands" runat="server" ConnectionString="<%$ ConnectionStrings:IRMSConnectionString %>"
                                            SelectCommand="SELECT [BRAND_DESCRIPTION], [BRAND_CODE] FROM [BRANDS]"></asp:SqlDataSource>--%>
                                    </label>
                                    <asp:Button CssClass="btnFilter" ID="btnFilterByBrand" runat="server" Text="FILTER"
                                        OnClick="btnFilterByBrand_Click" />
                                </div>
                                <div class="print-link" style="text-align: center;">
                                    <asp:HiddenField ID="hfFilterBrand" Value="ALL" runat="server" />
                                </div>
                            </div>
                        </asp:Panel>
                    </div>
                    <div style="float: left; margin-right: 5px; text-align: center;">
                        <asp:UpdateProgress ID="upProgress" runat="server" AssociatedUpdatePanelID="upnlProducts">
                            <ProgressTemplate>
                                <asp:PlaceHolder ID="plcHLoader" runat="server">
                                    <UC:LOADER ID="loader" runat="server" />
                                </asp:PlaceHolder>
                            </ProgressTemplate>
                        </asp:UpdateProgress>
                        <asp:HiddenField ID="hfTotalStyles" runat="server" />
                        <asp:HiddenField ID="hfTotalSKUS" runat="server" />
                    </div>
                </div>
                <div>
                  <%--  <div style="margin-left: 410px; height:25px; padding-top:4px;">
                        <div style="float: left; margin-right: 10px;">
                            <img src="../Resources/product_summary.png" alt="product summary" height="16" align="top" />
                            <asp:Label ID="Label1" runat="server" Text="TOTAL STYLES:" Font-Names="Verdana" Font-Size="11px"
                                ForeColor="#FFFFCC"></asp:Label>
                                <asp:Label ID="lblTotalItems" runat="server" Font-Names="Verdana" 
                                Font-Size="12px" ForeColor="#CC3300" Font-Bold="True" Font-Underline="True"></asp:Label>
                        </div>
                        <div style="margin-left: 10px;">
                            <asp:Image ID="Image4" runat="server" ImageUrl="~/Resources/Barcode_summary.png"
                                Height="18px" ImageAlign="Top" /><asp:Label ID="Label2" runat="server" Text="TOTAL ITEM CODE/SKU&#39;s:"
                                 Font-Names="Verdana" Font-Size="11px"
                                ForeColor="#FFFFCC"></asp:Label>
                            <asp:Label
                                    ID="lblTotalSKUs" runat="server" Font-Names="Verdana" Font-Size="12px" ForeColor="#CC3300"
                                    Font-Bold="True" Font-Underline="True"></asp:Label>
                        </div>
                    </div>--%>
                </div>
            </div>
            <div style="min-height:450px;">
            <div style="float: left; min-height:435px;">
                <div class="listContent" >
                    <div class="titleList">
                        <asp:Image ID="imgList" runat="server" Height="16px" Width="20px" ImageUrl="~/Resources/product.png"
                            ImageAlign="AbsBottom" />
                        LIST OF ITEM
                        <div style="float: right; padding-right: 5px;">
                            <asp:RadioButtonList ID="rdioFilter" runat="server" RepeatDirection="Horizontal"
                                Font-Names="Verdana" Font-Size="10px" ForeColor="#FFFFCC" RepeatLayout="Flow"
                                AutoPostBack="True" 
                                OnSelectedIndexChanged="rdioFilter_SelectedIndexChanged" Visible="False">
                                <asp:ListItem Selected="True">ALL</asp:ListItem>
                                <asp:ListItem Value="Yes">APPROVED</asp:ListItem>
                                <asp:ListItem Value="No">UN-APPROVE</asp:ListItem>
                            </asp:RadioButtonList>
                            <asp:ImageButton ID="imgBtnRelodStyleList" runat="server" Height="16px" ImageAlign="AbsBottom"
                                ImageUrl="~/Resources/reload.png" ToolTip="Reload Style List" OnClick="imgBtnRelodStyleList_Click" />
                        </div>
                    </div>
                    <asp:Panel ID="pnlSizesList" runat="server" Width="400px" Height="435px" ScrollBars="Auto">
                        <asp:GridView ID="gvProductList" runat="server" CellPadding="4" 
                            GridLines="None" AutoGenerateColumns="False" CssClass="table_grid"
                            OnSelectedIndexChanged="gvProductList_SelectedIndexChanged" DataKeyNames="RECORD_NO,BRAND"
                            EnablePersistedSelection="True" AllowPaging="True" AllowSorting="True" DataSourceID="SqlDataSourceStyles"
                            PageSize="15" onpageindexchanging="gvProductList_PageIndexChanging" 
                            onsorting="gvProductList_Sorting">
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:TemplateField>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Image ID="Image1" runat="server" Height="16px" ImageUrl="~/Resources/product.png"
                                            ToolTip='<%# "STYLE #: "+Eval("STYLE_NUMBER").ToString() +"\nDESCRIPTION: "+
                                Eval("DESCRIPTION").ToString() +"\nCOST:"+Eval("COST_PRICE") %>' />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:CommandField ShowSelectButton="True" />
                                <asp:BoundField DataField="RECORD_NO" HeaderText="RECORD_NO" InsertVisible="False"
                                    ReadOnly="True" SortExpression="RECORD_NO" Visible="False"></asp:BoundField>
                                <asp:BoundField DataField="STYLE_NUMBER" HeaderText="STYLE NUMBER" 
                                    SortExpression="STYLE_NUMBER">
                                <HeaderStyle Wrap="False" />
                                <ItemStyle Font-Bold="True" Wrap="False" />
                                </asp:BoundField>
                                <asp:BoundField DataField="DESCRIPTION" HeaderText="DESCRIPTION" SortExpression="DESCRIPTION">
                                    <HeaderStyle Wrap="False" />
                                    <ItemStyle Wrap="False" />
                                </asp:BoundField>
                                <asp:BoundField DataField="COST_PRICE" HeaderText="COST PRICE" 
                                    SortExpression="COST_PRICE" DataFormatString="{0:###,###.00}">
                                <HeaderStyle Wrap="False" />
                                <ItemStyle Wrap="False" Font-Bold="True" ForeColor="#CC0000" 
                                    HorizontalAlign="Center" />
                                </asp:BoundField>
                            </Columns>
                            <EditRowStyle BackColor="#7C6F57" />
                            <EmptyDataTemplate>
                                <asp:Image ID="Image2" runat="server" ImageUrl="~/Resources/unhappy.png" ImageAlign="Middle" />
                                DATA NOT FOUND!!!
                            </EmptyDataTemplate>
                            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White"
                                Font-Size="12px" />
                            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                            <PagerSettings Mode="NumericFirstLast" />
                            <PagerStyle CssClass="pager" />
                            <RowStyle BackColor="#E3EAEB" />
                            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="False" ForeColor="#333333" Font-Names="Verdana"
                                Font-Size="11px" Font-Italic="True" />
                            <SortedAscendingCellStyle CssClass="asc_cell_style" />
                            <SortedAscendingHeaderStyle CssClass="asc_cell_style_h" />
                            <SortedDescendingCellStyle  CssClass="desc_cell_style" />
                            <SortedDescendingHeaderStyle  CssClass="desc_cell_style_h" />
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSourceStyles" runat="server" ConnectionString="<%$ ConnectionStrings:IRMSConnectionString %>"
                           SelectCommand="SP_GET_ALL_STYLES" SelectCommandType ="StoredProcedure" 
                           EnableCaching="true" CacheDuration="30">
                        </asp:SqlDataSource>
                    </asp:Panel>
                    <asp:HiddenField ID="hfStyleNumber" runat="server" />
                </div>
            </div>
            <div style="float: left; border: 1px Solid Gray; border-radius:5px 5px 0px 0px;-moz-border-radius:5px 5px 0px 0px;-webkit-border-radius:5px 5px 0px 0px;">
                <div class="titleListDetails">
                    <img src="../Resources/Barcode.png" alt="" height="20px" align="left" />
                    &nbsp;LIST OF SKU&#39;s BY STYLE NUMBER:
                    <asp:Label ID="lblStyleNumber" runat="server" Font-Bold="True" ForeColor="#993300"
                        Font-Names="Verdana" Font-Size="11px"></asp:Label>
                    <div style="float: right; margin-right: 5px;">
                        <asp:HiddenField ID="hfListStatus" runat="server" />
                        <asp:Label ID="lblPoUpPreviewHandler" runat="server"></asp:Label>
                        <asp:ModalPopupExtender ID="btnCancelSelectedSKUs_ModalPopupExtender" runat="server"
                            DynamicServicePath="" Enabled="True" PopupControlID="pnlSelectedSkusToCcancel"
                            PopupDragHandleControlID="pnlSelectedSkusToCcancelDrag" TargetControlID="lblPoUpPreviewHandler"
                            CancelControlID="btnCancelSKUCancelation">
                        </asp:ModalPopupExtender>
                        <asp:Button ID="btnCancelSelectedSKUs" runat="server" Text="CANCEL SKU/s" Font-Names="Verdana"
                            Font-Size="10px" ForeColor="#663300" Height="20px" OnClick="btnCancelSelectedSKUs_Click" />
                        <asp:ImageButton ID="ibtnView" runat="server" ImageAlign="AbsBottom" ImageUrl="~/Resources/search.png"
                            Height="18px" />
                        <asp:ModalPopupExtender ID="ibtnView_ModalPopupExtender" runat="server" 
                            DynamicServicePath="" Enabled="True" PopupControlID="pnlSearchSKU" 
                            PopupDragHandleControlID="pnlSearchSKUDrag" TargetControlID="ibtnView">
                        </asp:ModalPopupExtender>
                      <asp:Panel ID="pnlSearchSKU" runat="server" CssClass="modal">
                        <asp:Panel ID ="pnlSearchSKUDrag" runat="server" CssClass="modalDrag">
                         <div class="close_btn">
                        <asp:ImageButton ID="imgBtnClosepnlSearchSKU" runat="server" CssClass="btnClose"
                            ImageUrl="~/Resources/cancel_gray.png" ToolTip="CLOSE" />
                            </div>
                            <div class="sizeLogo">
                                <asp:Image ID="Image6" runat="server" Height="16px" ImageAlign="AbsBottom" ImageUrl="~/Resources/barcode.png" />
                                &nbsp;SEARCH SKU'S
                             </div>
                        </asp:Panel>
                            <div>
                              <asp:Label ID="Label3" runat="server" Text="SKU NUMBER:"></asp:Label>
                              <asp:TextBox ID="txtSearchSKU" runat="server"></asp:TextBox>
                          </div>
                          <div style="text-align:center; margin:3px 3px;">
                              <asp:Button ID="btnSearchSku" runat="server" Text="GO" CssClass="modalWarningButtonYes" />
                          </div>
                      </asp:Panel>
                    </div>
                </div>
                <asp:Panel ID="pnlSKUDetails" runat="server" Height="410px" ScrollBars="Auto">
                    <asp:GridView ID="gvSKUDetails" runat="server" CellPadding="4" 
                        GridLines="None" AutoGenerateColumns="False"  CssClass="table_grid" 
                        DataSourceID="SqlDataSourceStyleProducts" AllowSorting="True">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:TemplateField>
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Image ID="Image1" runat="server" Height="16px" ImageUrl="~/Resources/Barcode.png"
                                        ToolTip='<%# "STYLE DESC: "+Eval("StyleDesc").ToString() 
                                                     +"\nCOLOR: " +Eval("StyleColor")
                                                     +"\nSIZE: " +Eval("StyleSize")
                                                     +"\nPRICE(SRP): " +Eval("Price").ToString()
                                        %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="RECORD#">
                                <EditItemTemplate>
                                    <asp:CheckBox ID="CheckBox1" runat="server" />
                                </EditItemTemplate>
                                <HeaderTemplate>
                                    <asp:CheckBox ID="chkAll" runat="server" Text="RECORD #" ToolTip="Select All" ClientIDMode="Static"
                                     onclick="SelectAll('MainContent_gvSKUDetails','chkAll')" />
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:CheckBox ID="chkSKUs" Text='<%# Eval("ProdNo").ToString()%>' runat="server" />
                                </ItemTemplate>
                                <HeaderStyle Wrap="False" />
                            </asp:TemplateField>
                            <asp:BoundField DataField="ItemCode" HeaderText="ITEM CODE" 
                                SortExpression="ItemCode" />
                            <asp:BoundField DataField="SKU" HeaderText="SKU CODE" SortExpression="SKU" />
                            <asp:BoundField DataField="Price" HeaderText="PRICE" SortExpression="Price" 
                                DataFormatString="{0:###,###.00}">
                            <HeaderStyle Wrap="False" />
                            <ItemStyle Wrap="False" />
                            </asp:BoundField>
                            <asp:BoundField DataField="DateImport" HeaderText="DATE CREATED" 
                                SortExpression="DateImport">
                                <ItemStyle Wrap="False" />
                            </asp:BoundField>
                        </Columns>
                        <EditRowStyle BackColor="#7C6F57" />
                        <EmptyDataTemplate>
                            <asp:Image ID="Image2" runat="server" ImageUrl="~/Resources/unhappy.png" ImageAlign="Middle" />
                            EMPTY DATA!!!
                        </EmptyDataTemplate>
                        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#E3EAEB" />
                        <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle CssClass="asc_cell_style" />
                        <SortedAscendingHeaderStyle CssClass ="asc_cell_style_h" />
                        <SortedDescendingCellStyle  CssClass="desc_cell_style" />
                        <SortedDescendingHeaderStyle CssClass="desc_cell_style_h" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSourceStyleProducts" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:IRMSConnectionString %>" 
                        SelectCommand="SP_GET_ALL_PRODUCTS_BY_STYLENUMBER"  SelectCommandType="StoredProcedure"
                        CacheDuration="5" EnableCaching="True">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="hfStyleNumber" Name="StyleNo" 
                                PropertyName="Value" Type="String" />
                        </SelectParameters>
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

            <asp:Panel ID="pnlSelectedSkusToCcancel" runat="server" CssClass="modal">
                <asp:Panel ID="pnlSelectedSkusToCcancelDrag" runat="server" CssClass="modalDrag">
                    <div class="sizeLogo">
                        <asp:Image ID="Image5" runat="server" Height="16px" ImageAlign="AbsBottom" ImageUrl="~/Resources/barcode.png" />
                        &nbsp;CONFIRMATION!
                    </div>
                </asp:Panel>
                <div style="font-family: Verdana; color: White; text-align: center;">
                    LIST OF SKU TO BE CANCEL</div>
                <div style="margin:3px 10px 5px 10px; margin-top: 5px;">
                    <asp:GridView ID="gvSelectedSKUToCancel" runat="server" Font-Names="Verdana" Font-Size="11px"
                        ForeColor="#FFFFCC" AutoGenerateColumns="False">
                        <Columns>
                            <asp:BoundField DataField="ItemCode" HeaderText="ITEM CODE">
                                <HeaderStyle Wrap="False" />
                                <ItemStyle Wrap="False" />
                            </asp:BoundField>
                            <asp:BoundField DataField="SKU" HeaderText="SKU BARCODE">
                                <HeaderStyle Wrap="False" />
                                <ItemStyle Wrap="False" />
                            </asp:BoundField>
                        </Columns>
                    </asp:GridView>
                </div>
                <div style="margin: 5px; text-align: center;">
                    <asp:Button ID="btnContinueSKUCancelation" runat="server" Text="CONTINUE" Width="95px" CssClass="modalWarningButtonYes"
                        ToolTip="Continue Cancellation" OnClick="btnContinueSKUCancelation_Click" />
                    <asp:Button ID="btnCancelSKUCancelation" runat="server" Text="CANCEL" Width="80px" CssClass="modalWarningButtonNo"
                        ToolTip="Cancel" />
                </div>
            </asp:Panel>
           </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
