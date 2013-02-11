﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Marketing/Marketing.Master" AutoEventWireup="true"
    CodeBehind="NewTransfer.aspx.cs" Inherits="IntegratedResourceManagementSystem.Marketing.NewTransfer" %>

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
                <div>
                    <div  class="form" style="float: left;">
                        <table style="">
                            <tr>
                                <td class="modalLabel">
                                    PULL OUT LETTER REF#:
                                </td>
                                <td>
                                    <asp:TextBox ID="txtPOLSeriesNumber" CssClass="modalText" Height="22px" runat="server"></asp:TextBox>
                                    <asp:Button ID="btnBrowsePullOutLetter" runat="server" CssClass="btnFilter" Text="browse..." />
                                    <asp:ModalPopupExtender ID="btnBrowsePullOutLetter_ModalPopupExtender" runat="server"
                                        BackgroundCssClass="bgModal" CancelControlID="btnCancelSelect" DynamicServicePath=""
                                        Enabled="True" PopupControlID="pnlPullOutLetterModal" PopupDragHandleControlID="pnlPullOutLetterModalDrag"
                                        TargetControlID="btnBrowsePullOutLetter">
                                        <Animations>
                                        <OnShown>
                                            <FadeIn Duration=".2" />
                                        </OnShown>
                                        </Animations>
                                    </asp:ModalPopupExtender>
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
                                    FROM CUSTOMER NAME:
                                </td>
                                <td>
                                    <asp:TextBox CssClass="modalText" Height="22px" Width="300px" ID="txtFromCustomer"
                                        runat="server"></asp:TextBox>
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td class="modalLabel">
                                   ACCOUNT NAME:</td>
                                <td>
                                   <asp:TextBox CssClass="modalText" Height="22px" Width="300px" ID="txtAccountName"
                                        runat="server"></asp:TextBox>
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td>
                                </td>
                                <td>
                                </td>
                                <td>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div  class="form" style="float: left; margin-left:5px;">
                        <table style="">
                            <tr>
                                <td>
                                    &nbsp;
                                </td>
                                <td>
                                    &nbsp;
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
                                     <asp:TextBox CssClass="modalText" Height="22px" Width="300px" ID="txtToCustomer"
                                        runat="server"></asp:TextBox> <asp:Button ID="btnBrowseToCustomer" runat="server" CssClass="btnFilter" Text="browse..." />
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                        </table>
                    </div>
                    <asp:Panel ID="pnlPullOutLetterModal" runat="server" CssClass="modal">
                        <asp:Panel ID="pnlPullOutLetterModalDrag" runat="server" CssClass="modalDrag">
                            <div class="sizeLogo">
                                PULL OUT LETTERS</div>
                            <div style="float: right;">
                                <asp:HyperLink CssClass="btnPrint" Height="18px" Target="_blank" Style="line-height: 18px;
                                    padding-right: 5px; text-decoration: none;" ID="hpLinkViewDetails" runat="server">View Details</asp:HyperLink>
                            </div>
                        </asp:Panel>
                        <div style="height: 26px; margin: 3px 2px;">
                            <div class="modalLabel" style="float: left; line-height: 18px; margin: 2px;">
                                FILTER:<asp:RadioButtonList ID="rdioFilterPullOutLetterType" CssClass="modalText"
                                    Height="18px" Font-Size="10px" runat="server" AutoPostBack="True" RepeatDirection="Horizontal"
                                    RepeatLayout="Flow" OnSelectedIndexChanged="rdioFilterPullOutLetterType_SelectedIndexChanged">
                                    <asp:ListItem Selected="True">ALL</asp:ListItem>
                                    <asp:ListItem Value="True">SM</asp:ListItem>
                                    <asp:ListItem Value="False">NON-SM</asp:ListItem>
                                </asp:RadioButtonList>
                            </div>
                            <div style="float: right;" class="SearchTextContainer">
                                SEARCH BY:
                                <asp:RadioButtonList ID="rdioSearchType" runat="server" RepeatDirection="Horizontal"
                                    RepeatLayout="Flow">
                                    <asp:ListItem Selected="True" Value="SERIES">SERIES #</asp:ListItem>
                                    <asp:ListItem>CUSTOMER</asp:ListItem>
                                </asp:RadioButtonList>
                                <asp:TextBox ID="txtSearch" runat="server" autofocus placeholder="Search POL" CssClass="modalText"
                                    AutoPostBack="True" Height="16px" Font-Size="10px" Width="150px" ToolTip="Search POL"
                                    OnTextChanged="txtSearch_TextChanged"></asp:TextBox>
                                <asp:ImageButton ID="imgBtnSearch" runat="server" ImageAlign="AbsBottom" ImageUrl="~/Resources/search.png"
                                    ToolTip="SEARCH" OnClick="imgBtnSearch_Click" />
                            </div>
                        </div>
                        <div style="margin: 5px;">
                            <asp:GridView ID="gvPullOutLetter" CssClass="table_grid" runat="server" CellPadding="4"
                                ForeColor="#333333" GridLines="None" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False"
                                DataKeyNames="ID,PULL_OUT_CODE,SERIES_NO,CUSTOMER_NO,FOR_SM,IS_BACK_LOAD,BRANCH_DEPT_CODE,BRAND_DEPT_CODE,BRAND_CODE,ACCT_NAME,BRANCH_NAME,LETTER_STATUS,FORWARDERS"
                                DataSourceID="SqlDataSourcePullOutLetters" OnSelectedIndexChanged="gvPullOutLetter_SelectedIndexChanged"
                                OnPageIndexChanging="gvPullOutLetter_PageIndexChanging" OnSorting="gvPullOutLetter_Sorting">
                                <AlternatingRowStyle BackColor="White" />
                                <Columns>
                                    <asp:TemplateField>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Image ID="Image1" runat="server" ImageUrl="~/Resources/invoice.png" Height="16px" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:CommandField ShowSelectButton="True" />
                                    <asp:BoundField DataField="SERIES_NO" HeaderText="SERIES#" SortExpression="SERIES_NO">
                                        <ItemStyle Font-Bold="True" ForeColor="Maroon" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="PULLOUT_DATE" HeaderText="PULLOUT DATE" SortExpression="PULLOUT_DATE"
                                        DataFormatString="{0:MMMM dd, yyyy}">
                                        <ItemStyle Font-Bold="True" ForeColor="Black" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="COMPANY_NAME" HeaderText="OUTLET" SortExpression="COMPANY_NAME" />
                                    <asp:BoundField DataField="BRAND_NAME" HeaderText="BRAND" SortExpression="BRAND_NAME" />
                                    <asp:BoundField DataField="TOTAL_QTY" HeaderText="TOTAL QTY" SortExpression="TOTAL_QTY">
                                        <ItemStyle Font-Bold="True" HorizontalAlign="Center" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="TRANSACTION_DATE" HeaderText="TRANSACTION DATE" SortExpression="TRANSACTION_DATE"
                                        Visible="False" />
                                </Columns>
                                <EditRowStyle BackColor="#7C6F57" />
                                <EmptyDataTemplate>
                                    <div class="form" style="line-height: 32px;">
                                        <img src="../Resources/unhappy.png" alt="" align="left" />
                                        DATA NOT FOUND!
                                    </div>
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
                            <asp:SqlDataSource ID="SqlDataSourcePullOutLetters" runat="server" ConnectionString="<%$ ConnectionStrings:IRMSConnectionString %>"
                                SelectCommand="SELECT * FROM [PULL_OUT_LETTERS] WHERE ([IS_ACTIVE] = @IS_ACTIVE AND IS_BACK_LOAD=@ISBACKLOAD)">
                                <SelectParameters>
                                    <asp:Parameter DefaultValue="True" Name="IS_ACTIVE" Type="Boolean" />
                                    <asp:Parameter DefaultValue="False" Name="ISBACKLOAD" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </div>
                        <div style="text-align: center; margin: 5px;">
                            <asp:Button ID="btnSelectOK" runat="server" Text="USE SELECTED" CssClass="modalWarningButtonYes"
                                Width="125px" />
                            <asp:Button ID="btnCancelSelect" runat="server" Text="CANCEL" CssClass="modalWarningButtonNo"
                                Width="85px" />
                        </div>
                    </asp:Panel>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
