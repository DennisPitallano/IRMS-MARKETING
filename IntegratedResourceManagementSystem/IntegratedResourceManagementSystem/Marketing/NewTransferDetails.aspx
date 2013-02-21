<%@ Page Title="" Language="C#" MasterPageFile="~/Marketing/Marketing.Master" AutoEventWireup="true"
    CodeBehind="NewTransferDetails.aspx.cs" Inherits="IntegratedResourceManagementSystem.Marketing.NewTransferDetails" %>

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
            <div style="min-height: 470px;">
                <div class="titleForm" style="height: 12px;">
                    NEW STOCK TRANSFER
                </div>
                <div style="min-height:230px;">
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
                            <tr>
                                <td class="modalLabel">
                                    TOTAL AMOUNT:
                                </td>
                                <td>
                                    <asp:TextBox CssClass="modalText" Height="22px" Width="100px" ID="txtTotalAmount" runat="server"
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
                                        runat="server"></asp:TextBox>
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
                <div style="margin: 5px; width: 700px;">
                    <div class="titleForm">
                        LIST OF STOCKS TOBE TRANSFERED
                        <%--<div style="float: right;">
                            <asp:Button ID="btnRemoveItem" CssClass="btnDelete" runat="server" Text="" Height="19px" />
                        </div>--%>
                    </div>
                    <div class="form">
                        <asp:GridView ID="gvPullOutDetails" CssClass="table_grid" runat="server" AutoGenerateColumns="False"
                            DataKeyNames="ID,PULL_OUT_CODE" DataSourceID="SqlDataSourceDetails" CellPadding="4"
                            ForeColor="#333333" GridLines="None" AllowSorting="True" 
                            onrowdatabound="gvPullOutDetails_RowDataBound">
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:TemplateField>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Image ID="Image1" runat="server" ImageUrl="~/Resources/product_brand.png" Height="16px" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField>
                                    <EditItemTemplate>
                                        <asp:CheckBox ID="CheckBox1" runat="server" />
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:CheckBox ID="chkItems" runat="server" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="CONTAINER_TYPE" HeaderText="CON." SortExpression="CONTAINER_TYPE">
                                    <ItemStyle Font-Bold="True" HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="CONTAINER_NO" HeaderText="CON.#" SortExpression="CONTAINER_NO">
                                    <ItemStyle Font-Bold="True" HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="STYLE_NO" HeaderText="STYLE #" SortExpression="STYLE_NO">
                                    <ItemStyle Font-Bold="True" ForeColor="#993300" HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="STYLE_DESCRIPTION" HeaderText="DESCRIPTION" SortExpression="STYLE_DESCRIPTION" />
                                <asp:BoundField DataField="QUANTITY" HeaderText="QTY" SortExpression="QUANTITY">
                                    <ItemStyle Font-Bold="True" ForeColor="Black" HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="SRP" HeaderText="SRP" SortExpression="SRP" DataFormatString="{0:###,###.00}">
                                    <ItemStyle Font-Bold="True" ForeColor="#CC0000" HorizontalAlign="Right" />
                                </asp:BoundField>
                                <asp:BoundField DataField="TOTAL_AMOUNT" HeaderText="TOTAL AMT" SortExpression="TOTAL_AMOUNT"
                                    DataFormatString="{0:###,###.00}">
                                    <ItemStyle Font-Bold="True" ForeColor="#CC0000" HorizontalAlign="Right" />
                                </asp:BoundField>
                                <asp:CheckBoxField DataField="LOST_TAG" HeaderText="LOST_TAG" SortExpression="LOST_TAG"
                                    Visible="False" />
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
                        <asp:SqlDataSource ID="SqlDataSourceDetails" runat="server" ConnectionString="<%$ ConnectionStrings:IRMSConnectionString %>"
                            SelectCommand="SELECT * FROM [PULL_OUT_LETTER_DETAILS] WHERE ([PULL_OUT_CODE] = @PULL_OUT_CODE)">
                            <SelectParameters>
                                <asp:QueryStringParameter Name="PULL_OUT_CODE" QueryStringField="PullOutCode" Type="String" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </div>
                </div>
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
                    <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="upnlStockTransfer">
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
