<%@ Page Title="" Language="C#" MasterPageFile="~/Marketing/Marketing.Master" AutoEventWireup="true"
    CodeBehind="NewTransferDefault.aspx.cs" Inherits="IntegratedResourceManagementSystem.Marketing.NewTransferDefault" %>

<%@ Register Src="~/Marketing/controls/UCLoader.ascx" TagName="LOADER" TagPrefix="UC" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="HeadContent" ContentPlaceHolderID="head" runat="server">
    <link href="../Styles/returns-and-transfer.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/pull-out-letter.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/price-check.css" rel="stylesheet" type="text/css" />
    <script language="javascript" type="text/javascript">

        function SelectAll(frmId, id) {
            var frm = document.getElementById(frmId);
            for (i = 1; i < frm.rows.length; i++) {
                var checkbox = frm.rows[i].cells[1].childNodes[1];
                if (checkbox != null)
                    checkbox.checked = document.getElementById(id).checked;
            }
        };
        function SelectAll1(frmId, id) {
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
    <div class="panelTitle">
        <img src="../Resources/memo-doc.png" alt="" height="28px" align="left" />
        New Transfer
        <div style="float: right; height: 24px;">
            <a href="TransferManagementPanel.aspx">
                <img alt="BACK" src="../Resources/reply.png" alt="BACK" /></a>
        </div>
    </div>
    <asp:UpdatePanel ID="upnlStockTransfer" runat="server">
        <ContentTemplate>
            <div style="min-height: 450px;">
                <div class="titleForm" style="height: 12px;">
                    NEW STOCK TRANSFER
                </div>
                <div style="min-height: 190px;">
                    <div class="form" style="float: left;">
                        <div class="btnTag" style="line-height: 16px; text-align: left;">
                            FROM OUTLET/CUSTOMER
                        </div>
                        <table style="">
                            <tr>
                                <td class="modalLabel">
                                    PULL OUT LETTER SERIES#:
                                </td>
                                <td>
                                    <asp:TextBox ID="txtPOLSeriesNumber" CssClass="modalText" Height="22px" Width="200px"
                                        runat="server" Font-Bold="True" Font-Italic="True" ForeColor="Black" ReadOnly="True"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:UpdateProgress ID="uprogressGenerator" runat="server" AssociatedUpdatePanelID="upnlStockTransfer">
                                        <ProgressTemplate>
                                            <asp:PlaceHolder ID="plcHLoader" runat="server">
                                                <UC:LOADER ID="loader" runat="server" />
                                            </asp:PlaceHolder>
                                        </ProgressTemplate>
                                    </asp:UpdateProgress>
                                </td>
                            </tr>
                            <tr>
                                <td class="modalLabel">
                                    CUSTOMER NAME:
                                </td>
                                <td>
                                    <asp:TextBox CssClass="modalText" Font-Size="10px" Height="22px" Width="280px" ID="txtFromCustomer"
                                        runat="server" ReadOnly="True"></asp:TextBox>
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td class="modalLabel">
                                    ACCOUNT NAME:
                                </td>
                                <td>
                                    <asp:TextBox CssClass="modalText" Font-Size="10px" Height="22px" Width="280px" ID="txtAccountName"
                                        runat="server" ReadOnly="True"></asp:TextBox>
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td class="modalLabel">
                                    BRANCH NAME:
                                </td>
                                <td>
                                    <asp:TextBox CssClass="modalText" Font-Size="10px" Height="22px" Width="200px" ID="txtBranchName"
                                        runat="server" ReadOnly="True"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                                    <asp:HiddenField ID="hfFromBrand" runat="server" />
                                    <asp:HiddenField ID="hfFromCustomerNumber" runat="server" />
                                    <asp:HiddenField ID="hfPullOutLetterId" runat="server" />
                                    <asp:HiddenField ID="hfPullOutSeriesNumber" runat="server" />
                                    <asp:HiddenField ID="hfPullOutLetterCode" runat="server" />
                                </td>
                            </tr>
                            <tr>
                                <td class="modalLabel">
                                    TOTAL QTY:
                                </td>
                                <td>
                                    <asp:TextBox CssClass="modalText" Height="22px" Width="100px" ID="txtTotalQTY" runat="server"
                                        ForeColor="#CC0000" Font-Bold="true" ReadOnly="True"></asp:TextBox>
                                </td>
                                <td>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div class="form" style="float: left; margin-left: 5px;">
                        <div class="btnTag" style="line-height: 16px; text-align: left;">
                            TO OUTLET/CUSTOMER
                        </div>
                        <table style="">
                            <tr>
                                <td class="modalLabel">
                                    ST DATE:
                                </td>
                                <td class="modalLabel" style="text-align: left;">
                                    <asp:TextBox ID="txtSTDate" CssClass="modalText calendar" Height="22px" runat="server"></asp:TextBox>
                                    <asp:CalendarExtender ID="txtSRDate_CalendarExtender" runat="server" Enabled="True"
                                        TargetControlID="txtSTDate">
                                    </asp:CalendarExtender>
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td class="modalLabel">
                                    TO CUSTOMER:
                                </td>
                                <td>
                                    <asp:TextBox CssClass="modalText" Height="22px" Font-Size="10px" Width="280px" ID="txtToCustomer"
                                        runat="server" ReadOnly="True"></asp:TextBox>
                                    <asp:Button ID="btnBrowseToCustomer" runat="server" CssClass="btnFilter" Text="browse..." />
                                    <asp:ModalPopupExtender ID="btnBrowseToCustomer_ModalPopupExtender" runat="server"
                                        BackgroundCssClass="bgModal" CancelControlID="imgBtnpnlCustomerOutletModal" DynamicServicePath=""
                                        Enabled="True" PopupControlID="pnlCustomerOutletModal" PopupDragHandleControlID="pnlCustomerOutletModalDrag"
                                        TargetControlID="btnBrowseToCustomer">
                                        <Animations>
                                            <OnShown>
                                                <FadeIn Duration=".2" />
                                            </OnShown>
                                        </Animations>
                                    </asp:ModalPopupExtender>
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td class="modalLabel">
                                    ACCOUNT NAME:
                                </td>
                                <td>
                                    <asp:TextBox CssClass="modalText" Font-Size="10px" Height="22px" Width="280px" ID="txtToAccountName"
                                        runat="server" ReadOnly="True"></asp:TextBox>
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td class="modalLabel">
                                    BRANCH NAME:
                                </td>
                                <td>
                                    <asp:TextBox CssClass="modalText" Font-Size="10px" Height="22px" Width="200px" ID="txtToBranchName"
                                        runat="server" ReadOnly="True"></asp:TextBox>
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td class="modalLabel">
                                    REFERENCE #:
                                    <asp:HiddenField ID="hfPGMDNo" runat="server" />
                                    <asp:HiddenField ID="hfSubAreaGroupNo" runat="server" />
                                    <asp:HiddenField ID="hfAreaGroupNo" runat="server" />
                                    <asp:HiddenField ID="hfPGNo" runat="server" />
                                    <asp:HiddenField ID="hfCustomerNumber" runat="server" />
                                    <asp:HiddenField ID="hfBrandCode" runat="server" />
                                    <asp:HiddenField ID="hfForwarder" runat="server" />
                                </td>
                                <td>
                                    <asp:TextBox CssClass="modalText" Font-Size="10px" Height="22px" Width="200px" ID="txtReferenceNumber"
                                        runat="server" ReadOnly="True"></asp:TextBox>
                                    <asp:Image ID="imgReferenceNumberInfo" runat="server" Height="18px" ToolTip="What is this?"
                                        ImageUrl="~/Resources/info.png" ImageAlign="AbsMiddle" />
                                    <asp:HoverMenuExtender ID="imgReferenceNumberInfo_HoverMenuExtender" runat="server"
                                        DynamicServicePath="" Enabled="True" PopupControlID="pnlReferenceNumberInfo"
                                        PopupPosition="Bottom" TargetControlID="imgReferenceNumberInfo">
                                    </asp:HoverMenuExtender>
                                    <asp:Panel ID="pnlReferenceNumberInfo" runat="server">
                                        <div class="hover-menu-arrow">
                                        </div>
                                        <div class="hover-menu">
                                            <div class="modalLabel" style="text-align: left; width: 250px;">
                                                <img src="../Resources/info.png" alt="" align="left" />
                                                <span>REREFENCE NUMBER</span> is a auto generated for Delivery Reciept Creation.
                                                <br />
                                                Reference as Delivery Number.
                                            </div>
                                        </div>
                                    </asp:Panel>
                                    <asp:HiddenField ID="hfErrorModalHandLer" runat="server" />
                                    <asp:ModalPopupExtender ID="hfErrorModalHandLer_ModalPopupExtender" runat="server"
                                        DynamicServicePath="" Enabled="True" TargetControlID="hfErrorModalHandLer" CancelControlID="btnOKError"
                                        PopupControlID="pnlErrorMessageModal" PopupDragHandleControlID="pnlErrorMessageModalDrag"
                                        BackgroundCssClass="bgModal">
                                    </asp:ModalPopupExtender>
                                    <asp:Panel ID="pnlErrorMessageModal" CssClass="modal" runat="server">
                                        <asp:Panel ID="pnlErrorMessageModalDrag" CssClass="modalDrag" runat="server">
                                            <div class="sizeLogo">
                                                <img alt="new brand" src="../Resources/error.png" height="15" align="top" />
                                                WARNING!
                                            </div>
                                        </asp:Panel>
                                        <div class="modalLabel" style="text-align: center; padding: 10px; font-size: 1em;">
                                            <img src="../Resources/error.png" alt="" align="left" />
                                            <asp:Label ID="lblErrorMessage" runat="server" Text=""></asp:Label>
                                        </div>
                                        <div style="text-align: center; margin: 5px;">
                                            <asp:Button ID="btnOKError" runat="server" Text="OK" CssClass="modalWarningButtonYes" />
                                        </div>
                                    </asp:Panel>
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
                <%--boxes--%>
                <div style="margin-bottom: 10px; margin-top: 10px;">
                    <asp:Panel ID="pnlBoxes" ScrollBars="Auto" runat="server">
                        <asp:Repeater ID="rptrBoxes" runat="server">
                            <HeaderTemplate>
                                <table>
                                    <tr>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <td>
                                    <div class="form" style="width: 200px; margin-bottom: 3px; margin-top: 5px;">
                                        <div style="float: left; padding-right: 5px;">
                                            <asp:Image ID="imgbox" ImageUrl='<%# Eval("ImageUrl") %>' ToolTip='<%# Eval("IsSelected") %>'
                                                runat="server" ImageAlign="Left" />
                                            <asp:CheckBox ID="chkBox" ToolTip='<%# Eval("BoxNumber") %>' runat="server" />
                                        </div>
                                        <div style="padding: 2px;">
                                            <asp:Label ID="lblBoxNumber" Font-Bold="true" Font-Size="9px" CssClass="modalText lblBoxes"
                                                Text='<%# Eval("BoxNumber") %>' runat="server" />
                                        </div>
                                        <div style="padding: 2px;">
                                            <asp:Label ID="lblItemsQuantity" Font-Bold="true" Font-Size="9px" CssClass="modalText lblBoxes"
                                                Text='<%# "TOTAL QTY: "+ Eval("ItemsQuantity") %>' ForeColor="#000" runat="server" />
                                        </div>
                                        <div style="padding: 2px;">
                                            <asp:Label ID="lblStylesQuantity" ForeColor="#000" Font-Bold="true" Font-Size="9px"
                                                CssClass="modalText lblBoxes" Text='<%#  "TOTAL STYLES: "+ Eval("StylesQuantity") %>'
                                                runat="server" />
                                        </div>
                                        <div style="padding: 2px 2px 0px 2px;">
                                            <asp:Label ID="lblTotalAmount" ForeColor="#CC0000" Font-Bold="true" Font-Size="9px"
                                                CssClass="modalText lblBoxes" Text='<%#  "TOTAL AMT: "+ Eval("TotalAmount","{0:###,###.00}") %>'
                                                runat="server" />
                                        </div>
                                    </div>
                                </td>
                            </ItemTemplate>
                            <FooterTemplate>
                                </tr> </table>
                            </FooterTemplate>
                        </asp:Repeater>
                    </asp:Panel>
                    <div style="margin: 3px;">
                        <asp:Panel ID="pnlBoxesCommand" Visible="false" runat="server">
                            <asp:Button ID="btnRemoveBox" CssClass="btnResetBoxes" runat="server" Text="REMOVE BOX"
                                OnClick="btnRemoveBox_Click" />
                            <asp:Button ID="btnAddBox" CssClass="btnAddBox" runat="server" Text="ADD BOX" OnClick="btnAddBox_Click" />
                        </asp:Panel>
                    </div>
                </div>
                <%--sacks--%>
                <div style="min-height: 10px;">
                    <asp:Panel ID="pnlSacks" ScrollBars="Auto" runat="server">
                        <asp:Repeater ID="rptrSacks" runat="server">
                            <HeaderTemplate>
                                <table>
                                    <tr>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <td>
                                    <div class="form" style="width: 190px; margin-bottom: 3px; margin-top: 5px;">
                                        <div style="float: left; padding-right: 5px;">
                                            <asp:Image ID="imgSack" ImageUrl='<%# Eval("ImageUrl") %>' ToolTip='<%# Eval("IsSelected") %>'
                                                runat="server" ImageAlign="Left" />
                                            <asp:CheckBox ID="chkBox" ToolTip='<%# Eval("BoxNumber") %>' runat="server" />
                                        </div>
                                        <div style="padding: 2px;">
                                            <asp:Label ID="lblBoxNumber" Font-Bold="true" Font-Size="9px" CssClass="modalText lblBoxes"
                                                Text='<%# Eval("BoxNumber") %>' runat="server" />
                                        </div>
                                        <div style="padding: 2px;">
                                            <asp:Label ID="lblItemsQuantity" Font-Bold="true" Font-Size="9px" CssClass="modalText lblBoxes"
                                                Text='<%# "TOTAL QTY: "+ Eval("ItemsQuantity") %>' ForeColor="#000" runat="server" />
                                        </div>
                                        <div style="padding: 2px;">
                                            <asp:Label ID="lblStylesQuantity" ForeColor="#000" Font-Bold="true" Font-Size="9px"
                                                CssClass="modalText lblBoxes" Text='<%#  "TOTAL STYLES: "+ Eval("StylesQuantity") %>'
                                                runat="server" />
                                        </div>
                                        <div style="padding: 2px 2px 0px 2px;">
                                            <asp:Label ID="lblTotalAmount" ForeColor="#CC0000" Font-Bold="true" Font-Size="9px"
                                                CssClass="modalText lblBoxes" Text='<%#  "TOTAL AMT: "+ Eval("TotalAmount","{0:###,###.00}") %>'
                                                runat="server" />
                                        </div>
                                    </div>
                                </td>
                            </ItemTemplate>
                            <FooterTemplate>
                                </tr> </table>
                            </FooterTemplate>
                        </asp:Repeater>
                    </asp:Panel>
                    <div style="margin: 3px;">
                        <asp:Panel ID="pnlSacksCommand" Visible="false" runat="server">
                            <asp:Button ID="btnRemoveSack" CssClass="btnResetBoxes" runat="server" Text="REMOVE SACK"
                                OnClick="btnRemoveSack_Click" />
                            <asp:Button ID="btnAddSack" CssClass="btnNewSack" runat="server" Text="ADD SACK"
                                OnClick="btnAddSack_Click" />
                        </asp:Panel>
                    </div>
                </div>
                <div style="margin: 6px;">
                    <asp:Panel ID="pnlStylesSelection" Visible="false" runat="server">
                        <div class="modalDrag" style="height: 10px;">
                        </div>
                        <div style="min-height: 420px;">
                            <div class="form" style="display: inline-block; float: left; margin-bottom: 10px;">
                                <div class="modalText" style="font-size: 10px; height: 20px; line-height: 22px; font-weight: bold;
                                    padding: 3px 1px 10px 3px; margin-bottom: 2px;">
                                    <div style="float: left;" class="SearchTextContainer">
                                        SEARCH:
                                        <asp:TextBox ID="txtSearchStyleNumber" runat="server" autofocus placeholder="Search Style"
                                            CssClass="modalText" AutoPostBack="True" Height="16px" Font-Size="10px" Width="100px"
                                            ToolTip="Search Style" OnTextChanged="txtSearchStyleNumber_TextChanged"></asp:TextBox>
                                        <asp:ImageButton ID="imgBtnSearch" runat="server" ImageAlign="AbsBottom" ImageUrl="~/Resources/search.png"
                                            ToolTip="SEARCH" OnClick="imgBtnSearch_Click" />
                                    </div>
                                </div>
                                <asp:GridView ID="gvStyles" CssClass="table_grid" runat="server" AllowPaging="True"
                                    AllowSorting="True" AutoGenerateColumns="False" DataSourceID="SqlDataSourceStyles"
                                    CellPadding="4" ForeColor="#333333" GridLines="None" OnPageIndexChanging="gvStyles_PageIndexChanging">
                                    <AlternatingRowStyle BackColor="White" />
                                    <Columns>
                                        <asp:TemplateField>
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Image ID="Image1" runat="server" ImageUrl="~/Resources/product.png" Height="16px" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField>
                                            <EditItemTemplate>
                                                <asp:CheckBox ID="CheckBox1" runat="server" />
                                            </EditItemTemplate>
                                            <HeaderTemplate>
                                                <asp:CheckBox ID="chkAll" runat="server" title="Select All" ClientIDMode="Static"
                                                    onclick="SelectAll('MainContent_gvStyles','chkAll')" />
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <asp:CheckBox ID="chkItems" runat="server" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="StyleNo" HeaderText="STYLE#" SortExpression="StyleNo">
                                            <ItemStyle Font-Bold="True" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="BrandName" HeaderText="BRAND" SortExpression="BrandName" />
                                        <asp:BoundField DataField="StyleDesc" HeaderText="DESCRIPTION" SortExpression="StyleDesc">
                                            <ItemStyle Width="180px" />
                                        </asp:BoundField>
                                        <asp:TemplateField HeaderText="QTY">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="txtQty" runat="server"></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:TextBox ID="txtQty" CssClass="modalText" Height="20px" Width="40px" runat="server"></asp:TextBox>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="LOST TAG?" Visible="False">
                                            <EditItemTemplate>
                                                <asp:CheckBox ID="CheckBox2" runat="server" />
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:CheckBox ID="chkIsLostTag" runat="server" />
                                            </ItemTemplate>
                                            <HeaderStyle Font-Size="8px" />
                                            <ItemStyle HorizontalAlign="Center" Font-Size="8px" />
                                        </asp:TemplateField>
                                    </Columns>
                                    <EditRowStyle BackColor="#7C6F57" />
                                    <EmptyDataTemplate>
                                        <div style="line-height: 32px;">
                                            <img src="../Resources/unhappy.png" alt="" align="left" />
                                            STYLE NOT FOUND!
                                        </div>
                                    </EmptyDataTemplate>
                                    <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                    <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                    <PagerSettings Mode="NumericFirstLast" />
                                    <PagerStyle CssClass="pager" />
                                    <RowStyle BackColor="#E3EAEB" />
                                    <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                                    <SortedAscendingCellStyle CssClass="asc_cell_style" />
                                    <SortedAscendingHeaderStyle CssClass="asc_cell_style_h" />
                                    <SortedDescendingCellStyle CssClass="desc_cell_style" />
                                    <SortedDescendingHeaderStyle CssClass="desc_cell_style_h" />
                                </asp:GridView>
                                <asp:SqlDataSource ID="SqlDataSourceStyles" runat="server" ConnectionString="<%$ ConnectionStrings:IRMSConnectionString %>"
                                    SelectCommand="SELECT [StyleNo], [BrandName], [StyleDesc] FROM [Style] WHERE ([IsActive] = @IsActive) and BrandName =@BRAND ORDER BY StyleNo DESC">
                                    <SelectParameters>
                                        <asp:Parameter DefaultValue="True" Name="IsActive" Type="Boolean" />
                                        <asp:ControlParameter ControlID="hfFromBrand" DefaultValue="" Name="BRAND" PropertyName="Value"
                                            Type="String" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </div>
                            <div class="modal" style="float: left; margin: 150px 10px 0px 10px; padding: 5px;">
                                <asp:Panel ID="pnlChkBoxList" runat="server" Visible="false">
                                    <div class="modalText" style="margin: 2px; font-size: 10px; line-height: 18px;">
                                        <img src="../Resources/box-icon.png" alt="" align="top" style="" />
                                        USE BOX#:
                                        <asp:RadioButtonList ID="chkBoxList" CssClass="modalLabel" RepeatColumns="3" RepeatDirection="Horizontal"
                                            runat="server" AutoPostBack="True" OnSelectedIndexChanged="chkBoxList_SelectedIndexChanged">
                                        </asp:RadioButtonList>
                                        <%-- <asp:CheckBoxList ID="chkBoxList" CssClass="modalLabel" runat="server" RepeatColumns="3"
                                        RepeatDirection="Horizontal">
                                    </asp:CheckBoxList>--%>
                                    </div>
                                </asp:Panel>
                                <asp:Panel ID="pnlChkSackList" runat="server" Visible="false">
                                    <div class="modalText" style="margin: 2px; font-size: 10px; line-height: 18px;">
                                        <img src="../Resources/Sack16.png" alt="" align="top" style="" />
                                        USE SACK#:
                                        <asp:RadioButtonList ID="chkSackList" CssClass="modalLabel" RepeatColumns="3" RepeatDirection="Horizontal"
                                            runat="server" AutoPostBack="True" OnSelectedIndexChanged="chkSackList_SelectedIndexChanged"
                                            Height="26px">
                                        </asp:RadioButtonList>
                                        <%--<asp:CheckBoxList ID="chkSackList" CssClass="modalLabel" runat="server" RepeatColumns="3"
                                        RepeatDirection="Horizontal">
                                    </asp:CheckBoxList>--%>
                                    </div>
                                </asp:Panel>
                                <asp:Button ID="btnAddSelected" CssClass="btnAddSelectedStyle" runat="server" Width="110px"
                                    Text="ADD SELECTED" OnClick="btnAddSelected_Click" />
                                <br />
                                <asp:Button ID="btnRemoveSelected" CssClass="btnRemoveSelectedLeft" runat="server"
                                    Text="REMOVE SELECTED" OnClick="btnRemoveSelected_Click" />
                            </div>
                            <div style="display: inline-block; min-width: 100px; min-height: 200px;" class="form">
                                <%--boxes--%>
                                <div style="margin-bottom: 10px;">
                                    <div class="modalText" style="font-size: 9px; font-weight: bold; padding: 3px 3px 3px 3px;">
                                        BOXES CONTAINER SELECTED STYLES
                                        <div style="display: inline-block; margin-left: 8px; border-left: 1px Solid Gray;
                                            padding-left: 10px;">
                                            <asp:Label ID="lblStylesSelectedCount" title="Total Count: Styles/Quantity" runat="server"
                                                Text=""></asp:Label>
                                        </div>
                                    </div>
                                    <asp:GridView ID="gvSelectedStyles" CssClass="table_grid" runat="server" CellPadding="4"
                                        ForeColor="#333333" GridLines="None" AutoGenerateColumns="False">
                                        <AlternatingRowStyle BackColor="White" />
                                        <Columns>
                                            <asp:TemplateField>
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Image ID="Image1" runat="server" ImageUrl="~/Resources/product.png" Height="16px" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField>
                                                <EditItemTemplate>
                                                    <asp:CheckBox ID="CheckBox1" runat="server" />
                                                </EditItemTemplate>
                                                <HeaderTemplate>
                                                    <asp:CheckBox ID="chkAllSelected1" runat="server" title="Select All" ClientIDMode="Static"
                                                        onclick="SelectAll('MainContent_gvSelectedStyles','chkAllSelected1')" />
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <asp:CheckBox ID="chkItems" runat="server" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="StyleNumber" HeaderText="STYLE #">
                                                <ItemStyle Font-Bold="True" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="StyleDescription" HeaderText="DESCRIPTION" HtmlEncode="False">
                                                <ItemStyle Width="170px" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="Quantity" HeaderText="QTY">
                                                <ItemStyle Font-Bold="True" ForeColor="Black" HorizontalAlign="Center" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="SRP" HeaderText="SRP" DataFormatString="{0:###,###.00}">
                                                <ItemStyle ForeColor="Red" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="TtlAmount" HeaderText="TOTAL AMT" DataFormatString="{0:###,###.00}">
                                                <ItemStyle ForeColor="#CC0000" />
                                            </asp:BoundField>
                                            <asp:TemplateField HeaderText="LOST TAG?">
                                                <EditItemTemplate>
                                                    <asp:CheckBox ID="CheckBox2" runat="server" Checked='<%# Bind("IsLostTag") %>' />
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:CheckBox ID="chkIsLostTag" runat="server" Checked='<%# Bind("IsLostTag") %>'
                                                        Enabled="false" />
                                                </ItemTemplate>
                                                <HeaderStyle Font-Size="8px" />
                                                <ItemStyle HorizontalAlign="Center" Width="20px" />
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="ContainerNumber" HeaderText="BOX#">
                                                <HeaderStyle Font-Size="8px" />
                                                <ItemStyle Font-Bold="True" ForeColor="Maroon" HorizontalAlign="Center" Width="28px"
                                                    Wrap="True" />
                                            </asp:BoundField>
                                        </Columns>
                                        <EditRowStyle BackColor="#7C6F57" />
                                        <EmptyDataTemplate>
                                            NO SELECTED ITEM!
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
                                </div>
                                <%-- sacks--%>
                                <div>
                                    <asp:Panel runat="server" ID="pnlSelectedStyleForSacks" Visible="false">
                                        <div class="modalText" style="font-size: 9px; font-weight: bold; padding: 3px 3px 3px 3px;">
                                            SACKS CONTAINER SELECTED STYLES
                                            <div style="display: inline-block; margin-left: 8px; border-left: 1px Solid Gray;
                                                padding-left: 10px;">
                                                <asp:Label ID="lblStylesSelectedForSacksCount" title="Total Count: Styles/Quantity"
                                                    runat="server" Text=""></asp:Label>
                                            </div>
                                        </div>
                                        <asp:GridView ID="gvSelectedStylesForSacks" CssClass="table_grid" runat="server"
                                            CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False">
                                            <AlternatingRowStyle BackColor="White" />
                                            <Columns>
                                                <asp:TemplateField>
                                                    <EditItemTemplate>
                                                        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                                                    </EditItemTemplate>
                                                    <ItemTemplate>
                                                        <asp:Image ID="Image1" runat="server" ImageUrl="~/Resources/product.png" Height="16px" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField>
                                                    <EditItemTemplate>
                                                        <asp:CheckBox ID="CheckBox1" runat="server" />
                                                    </EditItemTemplate>
                                                    <HeaderTemplate>
                                                        <asp:CheckBox ID="chkAllSelected1" runat="server" title="Select All" ClientIDMode="Static"
                                                            onclick="SelectAll('MainContent_gvSelectedStylesForSacks','chkAllSelected1')" />
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <asp:CheckBox ID="chkItems" runat="server" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:BoundField DataField="StyleNumber" HeaderText="STYLE #">
                                                    <ItemStyle Font-Bold="True" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="StyleDescription" HeaderText="DESCRIPTION" HtmlEncode="False">
                                                    <ItemStyle Width="170px" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="Quantity" HeaderText="QTY">
                                                    <ItemStyle Font-Bold="True" ForeColor="Black" HorizontalAlign="Center" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="SRP" HeaderText="SRP" DataFormatString="{0:###,###.00}">
                                                    <ItemStyle ForeColor="Red" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="TtlAmount" HeaderText="TOTAL AMT" DataFormatString="{0:###,###.00}">
                                                    <ItemStyle ForeColor="#CC0000" />
                                                </asp:BoundField>
                                                <asp:TemplateField HeaderText="LOST TAG?">
                                                    <EditItemTemplate>
                                                        <asp:CheckBox ID="CheckBox2" runat="server" Checked='<%# Bind("IsLostTag") %>' />
                                                    </EditItemTemplate>
                                                    <ItemTemplate>
                                                        <asp:CheckBox ID="chkIsLostTag" runat="server" Checked='<%# Bind("IsLostTag") %>'
                                                            Enabled="false" />
                                                    </ItemTemplate>
                                                    <HeaderStyle Font-Size="8px" />
                                                    <ItemStyle HorizontalAlign="Center" Width="20px" />
                                                </asp:TemplateField>
                                                <asp:BoundField DataField="ContainerNumber" HeaderText="SACK#">
                                                    <HeaderStyle Font-Size="8px" />
                                                    <ItemStyle Font-Bold="True" ForeColor="Maroon" HorizontalAlign="Center" Width="28px"
                                                        Wrap="True" />
                                                </asp:BoundField>
                                            </Columns>
                                            <EditRowStyle BackColor="#7C6F57" />
                                            <EmptyDataTemplate>
                                                NO SELECTED ITEM!
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
                                    </asp:Panel>
                                </div>
                            </div>
                            <%-- modal search styles--%>
                        </div>
                        <div style="text-align: center; margin: 30px;">
                            <asp:Button ID="btnSave" runat="server" CssClass="btnSave" Text="SAVE" />
                            <asp:ModalPopupExtender ID="btnSave_ModalPopupExtender" runat="server" CancelControlID="btnCancelSave"
                                DynamicServicePath="" Enabled="True" PopupControlID="pnlSaveModal" PopupDragHandleControlID="pnlSaveModalDrag"
                                TargetControlID="btnSave" BackgroundCssClass="bgModal">
                            </asp:ModalPopupExtender>
                            <a href="SMPullOutLetterManagementPanel.aspx" style="text-decoration: none;">
                                <input id="btnCancel" class="btnCancel" type="button" value="CANCEL" />
                            </a>
                            <asp:Panel ID="pnlSaveModal" CssClass="modal" runat="server">
                                <asp:Panel ID="pnlSaveModalDrag" CssClass="modalDrag" runat="server">
                                    <div class="close_btn">
                                        <asp:ImageButton ID="iBtnPnlSaveModal" runat="server" CssClass="btnClose" ImageUrl="~/Resources/cancel_gray.png"
                                            ToolTip="CLOSE" />
                                    </div>
                                    <div class="sizeLogo">
                                        <img alt="new brand" src="../Resources/question.png" height="15" align="top" />
                                        CONFIRMATION!
                                    </div>
                                </asp:Panel>
                                <div class="modalLabel" style="text-align: center; padding: 10px; font-size: 1em;
                                    line-height: 40px;">
                                    <img src="../Resources/question.png" alt="" align="left" />
                                    Are you sure you want to save this data?
                                </div>
                                <div style="text-align: center; margin: 5px;">
                                    <asp:Button ID="btnSaveYes" runat="server" Text="YES" CssClass="modalWarningButtonYes"
                                        OnClick="btnSaveYes_Click" />
                                    <asp:Button ID="btnCancelSave" runat="server" Text="NO" CssClass="modalWarningButtonNo" />
                                </div>
                            </asp:Panel>
                        </div>
                    </asp:Panel>
                </div>
            </div>
            <asp:Panel ID="pnlCustomerOutletModal" CssClass="modal" runat="server">
                <asp:Panel ID="pnlCustomerOutletModalDrag" CssClass="modalDrag" runat="server">
                    <div class="close_btn">
                        <asp:ImageButton ID="imgBtnpnlCustomerOutletModal" runat="server" CssClass="btnClose"
                            ImageUrl="~/Resources/cancel_gray.png" ToolTip="CLOSE" />
                    </div>
                    <div class="sizeLogo">
                        <img alt="new brand" src="../Resources/users.png" height="15" align="top" />
                        LIST OF CUSTOMERS
                    </div>
                </asp:Panel>
                <div style="padding: 2px 2px; height: 28px;">
                    <div class="SearchTextContainer">
                        SEARCH:
                        <asp:TextBox ID="txtSearchCustomer" Height="16px" Font-Size="10px" Width="120px"
                            placeholder="Search Customer" CssClass="modalText" runat="server"></asp:TextBox>
                        <asp:ImageButton ID="iBtnSearchCustomer" runat="server" ImageUrl="~/Resources/search.png"
                            ImageAlign="AbsBottom" OnClick="iBtnSearchCustomer_Click" />
                    </div>
                </div>
                <div style="margin: 5px;">
                    <asp:GridView ID="gvCustomers" CssClass="table_grid" runat="server" AllowPaging="True"
                        AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="CustNo,CompName,brand,PGMDNo,PGNo,AGNo,SAGNo"
                        DataSourceID="SqlDataSourceCustomers" ForeColor="#333333" GridLines="None" EnablePersistedSelection="True"
                        OnPageIndexChanging="gvCustomers_PageIndexChanging" OnSelectedIndexChanging="gvCustomers_SelectedIndexChanging"
                        OnSorting="gvCustomers_Sorting" OnSelectedIndexChanged="gvCustomers_SelectedIndexChanged">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:TemplateField>
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Image ID="ImageCustomer" Height="16px" runat="server" ImageUrl="~/Resources/users.png" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:CommandField ShowSelectButton="True" />
                            <asp:BoundField DataField="CustNo" HeaderText="CustNo" InsertVisible="False" ReadOnly="True"
                                SortExpression="CustNo" Visible="False" />
                            <asp:BoundField DataField="CompName" HeaderText="NAME" SortExpression="CompName" />
                            <asp:BoundField DataField="MainCustNo" HeaderText="MainCustNo" SortExpression="MainCustNo"
                                Visible="False" />
                            <asp:BoundField DataField="brand" HeaderText="BRAND" SortExpression="brand" />
                            <asp:BoundField DataField="PGNo" HeaderText="PGNo" SortExpression="PGNo" Visible="False" />
                            <asp:BoundField DataField="PGMDNo" HeaderText="PGMDNo" SortExpression="PGMDNo" Visible="False" />
                            <asp:BoundField DataField="AGNo" HeaderText="AGNo" SortExpression="AGNo" Visible="False" />
                            <asp:BoundField DataField="SAGNo" HeaderText="SAGNo" SortExpression="SAGNo" Visible="False" />
                        </Columns>
                        <EditRowStyle BackColor="#7C6F57" />
                        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                        <PagerSettings Mode="NumericFirstLast" />
                        <PagerStyle CssClass="pager" />
                        <RowStyle BackColor="#E3EAEB" />
                        <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle CssClass="asc_cell_style" />
                        <SortedAscendingHeaderStyle CssClass="asc_cell_style_h" />
                        <SortedDescendingCellStyle CssClass="desc_cell_style" />
                        <SortedDescendingHeaderStyle CssClass="desc_cell_style_h" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSourceCustomers" runat="server" ConnectionString="<%$ ConnectionStrings:IRMSConnectionString %>"
                        SelectCommand="SELECT [CustNo], [CompName], [MainCustNo], [brand], [PGNo], [PGMDNo], [AGNo], [SAGNo] FROM [CustInfoEx] WHERE ([MainCustNo] IS NOT NULL) AND brand=@BRAND"
                        EnableCaching="True">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="hfFromBrand" Name="BRAND" PropertyName="Value" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>
                <div style="margin: 5px; text-align: center;">
                    <asp:Button ID="btnSelectCustomer" CssClass="modalWarningButtonYes" runat="server"
                        Enabled="false" Text="OK" OnClick="btnSelectCustomer_Click" />
                </div>
            </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
