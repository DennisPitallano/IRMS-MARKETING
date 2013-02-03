<%@ Page Title="" Language="C#" MasterPageFile="~/Marketing/Marketing.Master" AutoEventWireup="true"
    CodeBehind="ReprocessItems.aspx.cs" Inherits="IntegratedResourceManagementSystem.Marketing.ReprocessItems" %>

<%@ OutputCache CacheProfile="cached_profile" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Src="~/Marketing/controls/UCLoader.ascx" TagName="LOADER" TagPrefix="UC" %>
<asp:Content ID="HeadContent" ContentPlaceHolderID="head" runat="server">
    <link href="../Styles/price-check.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/item-reprocess.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/permission-note.css" rel="stylesheet" type="text/css" />
    <script src="../Scripts/jquery-1.7.2.min.js" type="text/javascript"></script>
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
    <div style="height: 26px; margin-bottom: 10px; font-variant: small-caps; color: #333;
        text-shadow: 1px 1px 0px white;">
        <img src="../Resources/dup1.png" align="top" alt="Dennis" />
        &nbsp;<asp:Label ID="Label1" runat="server" Text="Item/s Reclassification Management Panel"
            Font-Bold="True" Font-Names="Verdana" Font-Size="18px"></asp:Label>
        <div style="float: right;">
            <a href="StylePanel.aspx" title="BACK">
                <img src="../Resources/reply.png" alt="BACK" title="BACK" />
            </a>
        </div>
        <hr />
    </div>
    <asp:UpdatePanel ID="upnlItemReprocess" runat="server">
        <ContentTemplate>
            <div style="height: 26px; margin-bottom: 1px;" class="modalDrag">
                <div style="float: right;" class="SearchTextContainer">
                    SEARCH:
                    <asp:TextBox ID="txtSearch" runat="server" autofocus placeholder="Search Style" CssClass="modalText"
                        AutoPostBack="True" Height="16px" Font-Size="10px" Width="150px" 
                        ToolTip="Search Style" ontextchanged="txtSearch_TextChanged"></asp:TextBox>
                    <asp:ImageButton ID="imgBtnSearch" runat="server" ImageAlign="AbsBottom" ImageUrl="~/Resources/search.png"
                        ToolTip="SEARCH" onclick="imgBtnSearch_Click" />
                </div>
                <div style="float: left;">
                    <div style="float: left; margin-right: 5px;">
                        <asp:Label ID="lblSelectedItemsModalHandler" runat="server" Text=""></asp:Label>
                        <asp:ModalPopupExtender ID="lblSelectedItemsModalHandler_ModalPopupExtender" runat="server"
                            CancelControlID="imgBtnpnlSelectedItems" DynamicServicePath="" Enabled="True"
                            PopupControlID="pnlSelectedItems" PopupDragHandleControlID="pnlSelectedItemsDrag"
                            TargetControlID="lblSelectedItemsModalHandler">
                        </asp:ModalPopupExtender>
                        <asp:Button ID="btnViewPriceHistory" runat="server" Text="RECLASSIFY ITEM/S" title="REPROCESS ITEMS"
                            CssClass="btnReprocessItem" OnClick="btnViewPriceHistory_Click" />
                    </div>
                    <div style="float: left; margin-right: 5px;">
                        <asp:HyperLink ID="hpLinkPreviewHistory" Target="_blank" CssClass="btnPrint" Height="24px" runat="server">VIEW PRICE HISTORY</asp:HyperLink>
                    </div>
                     <div style="float: left; margin-right: 5px;" class="SearchTextContainer">
                       <label for="MainContent_DDLDisplayPageSize" class="modalLabe">
                        DISPLAY PAGE:</label>
                        <asp:DropDownList Height="20px" CssClass ="modalText" ID="DDLDisplayPageSize" 
                             runat="server" AutoPostBack="True" 
                             onselectedindexchanged="DDLDisplayPageSize_SelectedIndexChanged">
                            <asp:ListItem Selected="True" Value="25">DEFAULT</asp:ListItem>
                            <asp:ListItem>50</asp:ListItem>
                            <asp:ListItem>100</asp:ListItem>
                            <asp:ListItem>250</asp:ListItem>
                            <asp:ListItem>500</asp:ListItem>
                            <asp:ListItem Value="1000000">ALL</asp:ListItem>
                         </asp:DropDownList>
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
                                    <asp:Button CssClass="btnFilter" ID="btnFilterByBrand" runat="server" Text="FILTER" />
                                </div>
                                <div class="print-link" style="text-align: center;">
                                    <asp:Button CssClass="btnReload" ID="btnReFresh" runat="server" Text="REFRESH TABLE LIST" />
                                    <asp:HiddenField ID="hfFilterBrand" Value="ALL" runat="server" />
                                </div>
                            </div>
                        </asp:Panel>
                    </div>
                    <div style="float: left; margin-right: 5px;">
                        <asp:UpdateProgress ID="upProgress" runat="server" AssociatedUpdatePanelID="upnlItemReprocess">
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
            <div style="min-height: 400px;">
                <div style="display: inline; float: left; margin-bottom: 10px; margin-right: 5px;
                    -webkit-box-shadow: 0 8px 6px -6px #726935; -moz-box-shadow: 0 8px 6px -6px #726935;
                    box-shadow: 0 8px 6px -6px #726935;">
                    <asp:GridView ID="gvItems" runat="server" AllowPaging="True" AllowSorting="True"
                        AutoGenerateColumns="False" CssClass="table-grid-style" DataSourceID="SqlDataSourceStyles"
                        CellPadding="2" GridLines="None" PageSize="25" DataKeyNames="StyleNo" OnSelectedIndexChanged="gvItems_SelectedIndexChanged"
                        EnablePersistedSelection="True" ViewStateMode="Disabled" 
                        onpageindexchanging="gvItems_PageIndexChanging" 
                        onselectedindexchanging="gvItems_SelectedIndexChanging" 
                        onsorting="gvItems_Sorting" Font-Size="12px">
                        <AlternatingRowStyle BackColor="PaleGoldenrod" />
                        <Columns>
                            <asp:TemplateField>
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Image ID="imgItems" runat="server" ImageUrl="~/Resources/product.png" Height="14px" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <EditItemTemplate>
                                    <asp:CheckBox ID="CheckBox1" runat="server" />
                                </EditItemTemplate>
                                <HeaderTemplate>
                                    <asp:CheckBox ID="chkAll" runat="server" ClientIDMode="Static" onclick="SelectAll('MainContent_gvItems','chkAll')" />
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:CheckBox ID="chkItems" runat="server" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:CommandField ShowSelectButton="True" />
                            <asp:BoundField DataField="StyleNo" HeaderText="STYLE #" 
                                SortExpression="StyleNo" >
                            <FooterStyle Font-Bold="True" />
                            <ItemStyle Font-Bold="True" />
                            </asp:BoundField>
                            <asp:BoundField DataField="StyleDesc" HeaderText="DESCRIPTION" SortExpression="StyleDesc">
                            </asp:BoundField>
                            <asp:BoundField DataField="BrandName" HeaderText="BRAND" SortExpression="BrandName" />
                        </Columns>
                        <EmptyDataTemplate>
                            <div style="text-align: center; padding-top: 20px; width: 350px; height: 50px;">
                                <img src="../Resources/unhappy.png" alt="BLEH" align="middle" />
                                EMPTY DATA!!!
                            </div>
                        </EmptyDataTemplate>
                        <FooterStyle BackColor="Tan" />
                        <HeaderStyle BackColor="Tan" Font-Bold="True" />
                        <PagerSettings Mode="NumericFirstLast" />
                        <PagerStyle CssClass="pager" />
                        <SelectedRowStyle BackColor="#97A742" ForeColor="#594719" />
                        <SortedAscendingCellStyle BackColor="#FAFAE7" />
                        <SortedAscendingHeaderStyle BackColor="#DAC09E" />
                        <SortedDescendingCellStyle BackColor="#E1DB9C" />
                        <SortedDescendingHeaderStyle BackColor="#C2A47B" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSourceStyles" runat="server" ConnectionString="<%$ ConnectionStrings:IRMSConnectionString %>"
                        SelectCommand="SP_GET_ALL_STYLES_FOR_REPROCESS" SelectCommandType="StoredProcedure"
                        EnableCaching="true" CacheDuration="30">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="DDLBrands" Name="BRAND" PropertyName="SelectedValue" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>
                <div style="display: inline-block; margin-top: 1px;">
                 <asp:HiddenField ID="hfStyleNumber" runat="server" />
                </div>
                <asp:Panel CssClass="permission-container" ID="pnlNotification" Visible="false" runat="server">
                    <asp:CollapsiblePanelExtender ID="CollapsiblePaneItemMaster" runat="server" CollapseControlID="lblNoteCollapsHandler"
                        CollapsedText="dennis" ExpandedText="pitallano" TargetControlID="pnlPermissionNotification"
                        ExpandControlID="lblNoteCollapsHandler" Collapsed="True">
                    </asp:CollapsiblePanelExtender>
                    <div class="collaps-link">
                        <asp:Label CssClass="collaps-text" ID="lblNoteCollapsHandler" Height="48px" runat="server"
                            Text="NOTE" ToolTip="Show/Hide Notification"></asp:Label>
                    </div>
                    <asp:Panel CssClass="note-container" ID="pnlPermissionNotification" runat="server">
                        <asp:Label ID="lblPermissionNotifications" runat="server" Text="Label"></asp:Label>
                    </asp:Panel>
                </asp:Panel>
                <asp:Panel ID="pnlSelectedItems" runat="server" CssClass="modal">
                    <asp:Panel ID="pnlSelectedItemsDrag" runat="server" CssClass="modalDrag">
                        <div class="close_btn">
                            <asp:ImageButton ID="imgBtnpnlSelectedItems" runat="server" CssClass="btnClose" ImageUrl="~/Resources/cancel_gray.png"
                                ToolTip="CLOSE" />
                        </div>
                        <div class="sizeLogo">
                            <img alt="new brand" src="../Resources/product.png" height="15" align="top" />
                            SELECTED ITEM/S TO REPROCESS
                        </div>
                    </asp:Panel>
                    <asp:Panel ID="pnlSelecttedItems" Height="200px" ScrollBars="Vertical" runat="server">
                        <div style="margin: 5px 10px;">
                            <asp:HiddenField ID="hfBarCode" Value="0" runat="server" />
                            <asp:HiddenField ID="hfSRP" runat="server" />
                            <asp:GridView ID="gvSelectedItems" runat="server" AutoGenerateColumns="False" BackColor="LightGoldenrodYellow"
                                CssClass="table-grid-style" BorderWidth="1px" CellPadding="2" ForeColor="Black"
                                GridLines="None">
                                <AlternatingRowStyle BackColor="PaleGoldenrod" />
                                <Columns>
                                    <asp:BoundField DataField="StyleNumber" HeaderText="STYLE #">
                                        <HeaderStyle Wrap="False" />
                                        <ItemStyle Font-Bold="True" Wrap="False" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="Description" HeaderText="DESCRIPTION" HtmlEncode="False">
                                        <HeaderStyle Wrap="False" />
                                        <ItemStyle Wrap="False" />
                                    </asp:BoundField>
                                </Columns>
                                <FooterStyle BackColor="Tan" />
                                <HeaderStyle BackColor="Tan" Font-Bold="True" />
                                <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
                                <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
                                <SortedAscendingCellStyle BackColor="#FAFAE7" />
                                <SortedAscendingHeaderStyle BackColor="#DAC09E" />
                                <SortedDescendingCellStyle BackColor="#E1DB9C" />
                                <SortedDescendingHeaderStyle BackColor="#C2A47B" />
                            </asp:GridView>
                        </div>
                    </asp:Panel>
                    <div style="margin: 5px 10px;">
                        <label style="font-size: 10px;" class="modalLabel" for="MainContent_DDLNewStyle">
                            SELECT NEW STYLE:</label>
                        <asp:DropDownList ID="DDLNewStyle" Height="22px" Font-Bold="True" CssClass="modalText"
                            runat="server" DataSourceID="SqlDataSourceGenericStyles" DataTextField="StyleNo"
                            DataValueField="StyleNo" AutoPostBack="True" OnSelectedIndexChanged="DDLNewStyle_SelectedIndexChanged">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSourceGenericStyles" runat="server" ConnectionString="<%$ ConnectionStrings:IRMSConnectionString %>"
                            SelectCommand="SELECT [StyleNo] FROM [Style] WHERE (([IsGeneric] = @IsGeneric) AND ([BrandName] = @BrandName))">
                            <SelectParameters>
                                <asp:Parameter DefaultValue="True" Name="IsGeneric" Type="Boolean" />
                                <asp:ControlParameter ControlID="DDLBrands" Name="BrandName" PropertyName="SelectedValue"
                                    Type="String" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <br />
                        <div style="margin: 5px 5px;">
                            <label class="modalLabel">
                                GENERATED BARCODE:</label>
                            <asp:Label Style="padding: 2px 5px;" ID="lblBarCode" CssClass="modalText" Font-Bold="true"
                                runat="server" Text=""></asp:Label>
                        </div>
                    </div>
                    <div style="height: 28px; text-align: center; margin: 5px 40px;">
                        <asp:Button CssClass="btnReprocessItem" ID="btnContinueReprocess" runat="server"
                            Text="CONTINUE REPROCESS" OnClick="btnContinueReprocess_Click" />
                        <asp:Label ID="lblSuccessFullReprocessModalHandler" runat="server" Text=""></asp:Label>
                        <asp:ModalPopupExtender ID="lblSuccessFullReprocessModalHandler_ModalPopupExtender"
                            runat="server" CancelControlID="btnOk" DynamicServicePath="" Enabled="True" PopupControlID="pnlReprocessSuccessfulModal"
                            PopupDragHandleControlID="pnlReprocessSuccessfulModalDrag" TargetControlID="lblSuccessFullReprocessModalHandler">
                        </asp:ModalPopupExtender>
                    </div>
                </asp:Panel>
            </div>
            <asp:Panel ID="pnlReprocessSuccessfulModal" runat="server" CssClass="modal">
                <asp:Panel ID="pnlReprocessSuccessfulModalDrag" runat="server" CssClass="modalDrag">
                    <div class="sizeLogo">
                        <img alt="new brand" src="../Resources/ThumbUp.png" height="15" align="top" />
                        SUCCESSFUL!
                    </div>
                </asp:Panel>
                <div style="margin: 10px 5px; text-align: center; color: #594719; text-shadow: 1px 1px 0px #ddd296;
                    font-size: 12px; font-weight: bold; font-family: Verdana; line-height: 24px;">
                    <img src="../Resources/ThumbUp.png" align="top" />
                    ITEM/S RECLASSIFICATION SUCCESSFUL!!!
                </div>
                <div style="text-align: center; margin-bottom: 5px;">
                    <a style="text-decoration: none;" href="GenericStylesManagementPanel.aspx" title="OK">
                        <input class="modalWarningButtonYes" id="Button1" type="button" value="OK" />
                    </a>
                </div>
            </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
