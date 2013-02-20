<%@ Page Title="" Language="C#" MasterPageFile="~/Marketing/Marketing.Master" AutoEventWireup="true"
    CodeBehind="NewTransferSummary.aspx.cs" Inherits="IntegratedResourceManagementSystem.Marketing.NewTransferSummary" %>

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
                                    <asp:HiddenField ID="hfFromBrand" runat="server" />
                                    <asp:HiddenField ID="hfFromCustomerNumber" runat="server" />
                                    <asp:HiddenField ID="hfPullOutLetterCode" runat="server" />
                                    <asp:HiddenField ID="hfPullOutLetterId" runat="server" />
                                    <asp:HiddenField ID="hfPullOutSeriesNumber" runat="server" />
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
                                    <asp:HiddenField ID="hfStockTransferCode" runat="server" />
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
                <div style="margin: 10px; min-height: 300px;">
                    <div style="margin-right: 5px; width: 300px; float: left;">
                        <div class="titleForm">
                            LIST OF STOCKS TOBE TRANSFERED
                        </div>
                        <div class="form">
                            <asp:GridView ID="gvPOLSummaries" CssClass="table_grid" runat="server" CellPadding="4"
                                ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" OnSelectedIndexChanged="gvPOLSummaries_SelectedIndexChanged"
                                DataKeyNames="ContainerNumber,ContainerType,TotalQuantity">
                                <AlternatingRowStyle BackColor="White" />
                                <Columns>
                                    <asp:TemplateField ShowHeader="False" HeaderText="command">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Select"
                                                Text="">
                                                <asp:Image ID="imgContainer" ImageUrl='<%# Eval("PullOutCode") %>' runat="server" />
                                            </asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="ContainerType" HeaderText="CON. TYPE">
                                        <ItemStyle Font-Bold="True" Font-Italic="True" ForeColor="#CC6600" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="ContainerNumber" HeaderText="CON.#" />
                                    <asp:BoundField DataField="TotalQuantity" HeaderText="TOTAL QTY">
                                        <ItemStyle Font-Bold="True" ForeColor="Black" HorizontalAlign="Center" />
                                    </asp:BoundField>
                                </Columns>
                                <EditRowStyle BackColor="#7C6F57" />
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
                    </div>
                    <div style="float: left; min-width: 450px; margin-bottom: 10px;">
                        <div class="titleForm">
                            STYLE DETAILS
                            <div style="float: right; margin-left: 5px;">
                                <asp:Button ID="btnDeleteDetails" CssClass="btnDisableDeleteDetail" runat="server"
                                    Text="delete" Height="19px" OnClick="btnDeleteDetails_Click" />
                                <asp:Button ID="btnAddDetails" CssClass="btnDisableAddDetails" Enabled="false" runat="server"
                                    Text="add style details" Height="19px" />
                                <asp:ModalPopupExtender ID="btnAddDetails_ModalPopupExtender" runat="server" CancelControlID="imgCloseStyles"
                                    DynamicServicePath="" PopupControlID="pnlStylesModal" PopupDragHandleControlID="pnlStylesModalDrag"
                                    Enabled="True" TargetControlID="btnAddDetails">
                                    <Animations>
                                        <OnShown>
                                            <FadeIn Duration=".2" />
                                        </OnShown>
                                    </Animations>
                                </asp:ModalPopupExtender>
                            </div>
                            <div style="float: right;">
                                <span>
                                    <asp:Label ID="lblTotalSelected" Font-Bold="true" Font-Size="10px" CssClass="modalText"
                                        Height="16px" Style="padding-right: 3px;" Text="Total Styles:0" runat="server" />
                                </span><span>
                                    <asp:Label ID="lblTotalAmount" Font-Bold="true" Font-Size="10px" CssClass="modalText"
                                        Height="16px" Style="padding-right: 3px;" Text="Total Amt:0" runat="server" /></span>
                            </div>
                        </div>
                        <div class="form" style="min-height: 165px;">
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
                        <div style="margin: 20px; text-align: center;">
                            <asp:Button ID="btnSaveTransfer" runat="server" CssClass="btnSave" Text="SAVE" Enabled="False" />
                            <asp:ModalPopupExtender ID="btnSaveTransfer_ModalPopupExtender" runat="server" BackgroundCssClass="bgModal"
                                CancelControlID="iBtnPnlSaveModal" DynamicServicePath="" Enabled="True" PopupControlID="pnlSaveModal"
                                PopupDragHandleControlID="pnlSaveModalDrag" TargetControlID="btnSaveTransfer">
                            </asp:ModalPopupExtender>
                            <a href="TransferManagementPanel.aspx">
                                <input id="btnBackToList" class="btnCancel" type="button" style="width: 110px;" value="BACK TO LIST" />
                            </a>
                        </div>
                    </div>
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
                <div class="modalLabel" style="margin: 3px; text-align: center;">
                    <asp:UpdateProgress ID="UpdateProgress2" runat="server" AssociatedUpdatePanelID="upnlStockTransfer">
                        <ProgressTemplate>
                            <img src="../Resources/294.gif" alt="" />
                            <br />
                            Please wait...
                        </ProgressTemplate>
                    </asp:UpdateProgress>
                </div>
                <div style="margin: 5px; text-align: center;">
                    <asp:Button ID="btnSelectCustomer" CssClass="modalWarningButtonYes" runat="server"
                        Enabled="false" Text="OK" OnClick="btnSelectCustomer_Click" />
                </div>
            </asp:Panel>
            <asp:Panel ID="pnlStylesModal" CssClass="modal" runat="server">
                <asp:Panel ID="pnlStylesModalDrag" CssClass="modalDrag" runat="server">
                    <div class="close_btn">
                        <asp:ImageButton ID="imgCloseStyles" runat="server" CssClass="btnClose" ImageUrl="~/Resources/cancel_gray.png"
                            ToolTip="CLOSE" />
                    </div>
                    <div class="sizeLogo">
                        STYLES
                    </div>
                </asp:Panel>
                <div style="margin: 5px;">
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
                        CellPadding="4" ForeColor="#333333" GridLines="None" OnPageIndexChanging="gvStyles_PageIndexChanging"
                        OnSelectedIndexChanging="gvStyles_SelectedIndexChanging">
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
                            <asp:ControlParameter ControlID="hfFromBrand" DefaultValue="" Name="BRAND" PropertyName="Value" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>
                <div style="text-align: center; margin: 5px;">
                    <asp:Label CssClass="modalLabel" ID="lblSelected" runat="server" Text="Label"></asp:Label>
                </div>
                <div class="modalLabel" style="margin: 3px; text-align: center;">
                    <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="upnlStockTransfer">
                        <ProgressTemplate>
                            <img src="../Resources/294.gif" alt="" />
                            <br />
                            Please wait...
                        </ProgressTemplate>
                    </asp:UpdateProgress>
                </div>
                <div style="margin: 5px; text-align: center;">
                    <asp:Button ID="btnAddToDetails" runat="server" Text="ADD SELECTED" CssClass="btnAddDetails"
                        OnClick="btnAddToDetails_Click" />
                </div>
            </asp:Panel>
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
            <asp:HiddenField ID="hfSuccessfulModalHandler" runat="server" />
            <asp:ModalPopupExtender ID="hfSuccessfulModalHandler_ModalPopupExtender" runat="server"
                DynamicServicePath="" Enabled="True" PopupControlID="pnlSuccessfulSaveModal"
                PopupDragHandleControlID="pnlSuccessfulSaveModalDrag" TargetControlID="hfSuccessfulModalHandler">
            </asp:ModalPopupExtender>
            <asp:Panel ID="pnlSuccessfulSaveModal" CssClass="modal" runat="server">
                <asp:Panel ID="pnlSuccessfulSaveModalDrag" CssClass="modalDrag" runat="server">
                    <div class="sizeLogo">
                        <img alt="new brand" src="../Resources/info.png" height="15" align="top" />
                        SUCCESSFUL!
                    </div>
                </asp:Panel>
                <div class="modalLabel" style="text-align: center; padding: 10px; font-size: 1em;
                    line-height: 40px;">
                    <img src="../Resources/info.png" alt="" align="left" />
                    Data has been successfully saved!
                </div>
                <div style="text-align: center; margin: 5px;">
                    <a href="TransferManagementPanel.aspx" style="text-decoration: none;">
                        <input id="btnSuccessfulOK" type="button" class="modalWarningButtonYes" value="OK" />
                    </a>
                </div>
            </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
