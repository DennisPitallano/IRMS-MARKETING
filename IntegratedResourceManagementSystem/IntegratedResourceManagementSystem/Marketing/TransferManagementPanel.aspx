<%@ Page Title="" Language="C#" MasterPageFile="~/Marketing/Marketing.Master" AutoEventWireup="true"
    CodeBehind="TransferManagementPanel.aspx.cs" Inherits="IntegratedResourceManagementSystem.Marketing.TransferManagementPanel" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Src="~/Marketing/controls/UCLoader.ascx" TagName="LOADER" TagPrefix="UC" %>
<asp:Content ID="HeadContent" ContentPlaceHolderID="head" runat="server">
    <link href="../Styles/returns-and-transfer.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/pull-out-letter.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="panelTitle">
        <asp:Image ID="imgpnlTitle" runat="server" ImageUrl="~/Resources/memo-doc.png" ImageAlign="Top"
            Height="28px" />Transfer Management Panel
        <div style="float: right; height: 24px;">
            <a href="ReturnAndTransfer.aspx">
                <img alt="BACK" src="../Resources/reply.png" alt="BACK" /></a>
        </div>
    </div>
    <div style="min-height: 450px;">
        <asp:UpdatePanel ID="upnlPullOutLetters" runat="server">
            <ContentTemplate>
                <div style="height: 26px; margin-bottom: 1px;" class="modalDrag">
                    <div style="float: right;" class="SearchTextContainer">
                        SEARCH:
                        <asp:TextBox ID="txtSearch" runat="server" autofocus placeholder="Search Transfer"
                            CssClass="modalText" AutoPostBack="True" Height="16px" Font-Size="10px" Width="150px"
                            ToolTip="Search Transfer"></asp:TextBox>
                        <asp:ImageButton ID="imgBtnSearch" runat="server" ImageAlign="AbsBottom" ImageUrl="~/Resources/search.png"
                            ToolTip="SEARCH" />
                    </div>
                    <div style="float: left;">
                        <div style="float: left; margin-right: 5px;">
                            <asp:Button ID="btnAddNew" CssClass="btnNew" runat="server" Text="NEW" />
                            <asp:HoverMenuExtender ID="btnAddNew_HoverMenuExtender" runat="server" DynamicServicePath=""
                                Enabled="True" TargetControlID="btnAddNew" PopupControlID="pnlAddOption" PopupPosition="Bottom">
                            </asp:HoverMenuExtender>
                            <asp:Panel ID="pnlAddOption" runat="server">
                                <div class="hover-menu-arrow">
                                </div>
                                <div class="hover-menu">
                                    <div class="new-link">
                                        <a href="NewTransfer.aspx" style="text-decoration: none;">STOCK TRANSFER </a>
                                    </div>
                                    <div class="new-link">
                                        <asp:HyperLink ID="hpLinkFromPullOut" Style="text-decoration: none;" runat="server">STOCK TRANSFER FROM PULL OUT LETTER</asp:HyperLink>
                                        <asp:ModalPopupExtender ID="btnBrowsePullOutLetter_ModalPopupExtender" runat="server"
                                            BackgroundCssClass="bgModal" CancelControlID="btnCancelSelect" DynamicServicePath=""
                                            Enabled="True" PopupControlID="pnlPullOutLetterModal" PopupDragHandleControlID="pnlPullOutLetterModalDrag"
                                            TargetControlID="hpLinkFromPullOut">
                                            <Animations>
                                        <OnShown>
                                            <FadeIn Duration=".2" />
                                        </OnShown>
                                            </Animations>
                                        </asp:ModalPopupExtender>
                                    </div>
                                </div>
                            </asp:Panel>
                        </div>
                        <div style="float: left; margin-right: 5px;">
                            <asp:Button ID="btnUpdate" runat="server" Text="UPDATE" CssClass="btnUpdate" Font-Names="Verdana"
                                ViewStateMode="Disabled" />
                        </div>
                        <div style="float: left; margin-right: 5px; line-height: 23px;">
                            <asp:HyperLink ID="hpLinkPullOutLetterDetails" Target="_blank" Height="23px" CssClass="btnPrint print-details"
                                runat="server">DETAILS</asp:HyperLink>
                        </div>
                        <div style="float: left; margin-right: 5px;">
                            <asp:Button ID="btnDelete" runat="server" Text="DELETE" CssClass="btnDelete" Font-Names="Verdana"
                                ViewStateMode="Disabled" />
                            <asp:ModalPopupExtender ID="btnDelete_ModalPopupExtender" runat="server" CancelControlID="btnNo"
                                DynamicServicePath="" Enabled="True" PopupControlID="pnlDeleteModal" PopupDragHandleControlID="pnlDeleteModalDrag"
                                TargetControlID="btnDelete" BackgroundCssClass="bgModal">
                                <Animations>
                                <OnShown>
                                    <FadeIn Duration=".2" />
                                </OnShown>
                                </Animations>
                            </asp:ModalPopupExtender>
                        </div>
                        <div style="float: left; margin-right: 5px;">
                            <asp:Button ID="btnPrint" runat="server" Text="PRINT" CssClass="btnPrint" Font-Names="Verdana"
                                ViewStateMode="Disabled" />
                        </div>
                        <div style="float: left; padding-left: 15px; padding-top: 7px; cursor: pointer;">
                            <asp:Image ID="imgSettings" runat="server" title="Parameter Settings [Brand Department Code]/[Branch Department Code]"
                                ImageAlign="Baseline" ImageUrl="~/Resources/hardware-icon.png" />
                            <asp:HoverMenuExtender ID="imgSettings_HoverMenuExtender" runat="server" DynamicServicePath=""
                                Enabled="True" TargetControlID="imgSettings" PopupControlID="pnlSettingOption"
                                PopupPosition="Bottom">
                            </asp:HoverMenuExtender>
                            <asp:Panel ID="pnlSettingOption" runat="server">
                                <div class="hover-menu-arrow">
                                </div>
                                <div class="hover-menu">
                                    <div class="new-link">
                                        <a title="Go to Brand Department Codes Management Panel" href="BrandDepartmentCodeManagementPanel.aspx"
                                            style="text-decoration: none;">BRAND DEPARTMENT CODES </a>
                                    </div>
                                    <div class="new-link">
                                        <a title="Go to Branch Department Codes Management Panel" href="BranchDepartmentCodeManagementPanel.aspx"
                                            style="text-decoration: none;">BRANCH DEPARTMENT CODES </a>
                                    </div>
                                </div>
                            </asp:Panel>
                        </div>
                        <div style="float: left; margin-right: 5px;">
                            <asp:UpdateProgress ID="upProgress" runat="server" AssociatedUpdatePanelID="upnlPullOutLetters">
                                <ProgressTemplate>
                                    <asp:PlaceHolder ID="plcHLoader" runat="server" EnableViewState="False">
                                        <UC:LOADER ID="loader" runat="server" />
                                    </asp:PlaceHolder>
                                </ProgressTemplate>
                            </asp:UpdateProgress>
                        </div>
                    </div>
                </div>
                <div>
                    <div class="titleForm">
                        LIST OF RETURNS
                    </div>
                    <div>
                        <asp:GridView ID="gvStockTransfer" CssClass="table_grid" runat="server" AutoGenerateColumns="False" 
                            CellPadding="4" DataKeyNames="ID,ST_CODE,POL_SERIES_NUMBER" DataSourceID="SqlDataSourceStockTransfers" 
                            ForeColor="#333333" GridLines="None" AllowPaging="True" 
                            AllowSorting="True" 
                            onselectedindexchanging="gvStockTransfer_SelectedIndexChanging">
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:TemplateField>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Image ID="Image1" runat="server" ImageUrl="~/Resources/page.png" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:CommandField ShowSelectButton="True" />
                                <asp:BoundField DataField="FROM_CUSTOMER_NAME" HeaderText="FROM CUSTOMER" 
                                    SortExpression="FROM_CUSTOMER_NAME" />
                                <asp:BoundField DataField="TO_CUSTOMER_NAME" HeaderText="TO CUSTOMER" 
                                    SortExpression="TO_CUSTOMER_NAME" />
                                <asp:BoundField DataField="BRAND_NAME" HeaderText="BRAND" 
                                    SortExpression="BRAND_NAME" />
                                <asp:BoundField DataField="TOTAL_QTY" HeaderText="TOTAL QTY" 
                                    SortExpression="TOTAL_QTY" >
                                <ItemStyle Font-Bold="True" ForeColor="Black" HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="TOTAL_AMT" HeaderText="TOTAL AMT" 
                                    SortExpression="TOTAL_AMT" DataFormatString="{0:###,###.00}" >
                                <ItemStyle Font-Bold="True" ForeColor="#990000" HorizontalAlign="Right" />
                                </asp:BoundField>
                                <asp:BoundField DataField="ST_DATE" HeaderText="ST DATE" 
                                    SortExpression="ST_DATE" DataFormatString="{0:MMMM dd, yyyy}" />
                                <asp:BoundField DataField="DATE_RECORDED" HeaderText="DATE RECORDED" 
                                    SortExpression="DATE_RECORDED" />
                                <asp:BoundField DataField="REF_NUMBER" HeaderText="REFERENCE #" 
                                    SortExpression="REF_NUMBER" >
                                <ItemStyle Font-Bold="True" HorizontalAlign="Center" />
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
                        <asp:SqlDataSource ID="SqlDataSourceStockTransfers" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:IRMSConnectionString %>" 
                            SelectCommand="SELECT [ID], [ST_CODE], [FROM_CUSTOMER_NAME], [POL_SERIES_NUMBER], [TO_CUSTOMER_NAME], [BRAND_NAME], [TOTAL_QTY], [TOTAL_AMT], [ST_DATE], [DATE_RECORDED], [REF_NUMBER] FROM [STOCK_TRANSFERS]">
                        </asp:SqlDataSource>
                    </div>
                </div>
                <%--Delete Modal--%>
                <asp:Panel ID="pnlDeleteModal" runat="server" CssClass="modal">
                    <asp:Panel ID="pnlDeleteModalDrag" runat="server" CssClass="modalDrag">
                        <div class="sizeLogo">
                            <img alt="new brand" src="../Resources/code-icon.png" height="16" align="top" />
                            CONFIRMATION!!!
                        </div>
                    </asp:Panel>
                    <div style="border: 1px solid #FFCC66; text-align: center; font-family: Verdana;
                        font-size: 12px; height: 23px; color: #CC6600; background-color: #FFFF99; line-height: 16px;
                        margin: 2px 5px;">
                        <img alt="error update" src="../Resources/warning.png" height="22px" align="middle" />
                        Warning: This action cannot be undo.
                    </div>
                    <div style="text-align: center; color: #FFFF99; font-family: Verdana; font-size: 11px;
                        margin: 5px 2px;">
                        <asp:Label ID="lblBrandToDelete" runat="server" Text="No data to delete. Select from the list and try again."></asp:Label>
                    </div>
                    <div style="text-align: center; margin: 5px 0px;">
                        <asp:Button ID="btnYes" runat="server" Text="YES" CssClass="modalWarningButtonYes"
                            ToolTip="Delete" Enabled="False" />
                        <asp:Button ID="btnNo" runat="server" Text="NO" CssClass="modalWarningButtonNo" ToolTip="Cancel"
                            ViewStateMode="Disabled" />
                    </div>
                </asp:Panel>
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
                            <asp:TextBox ID="TextBox1" runat="server" autofocus placeholder="Search POL" CssClass="modalText"
                                AutoPostBack="True" Height="16px" Font-Size="10px" Width="150px" ToolTip="Search POL"
                                OnTextChanged="txtSearch_TextChanged"></asp:TextBox>
                            <asp:ImageButton ID="ImageButton1" runat="server" ImageAlign="AbsBottom" ImageUrl="~/Resources/search.png"
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
                            SelectCommand="SELECT * FROM [PULL_OUT_LETTERS] WHERE ([IS_ACTIVE] = @IS_ACTIVE AND IS_BACK_LOAD=@ISBACKLOAD) AND ID NOT IN (SELECT POL_ID FROM STOCK_TRANSFERS)">
                            <SelectParameters>
                                <asp:Parameter DefaultValue="True" Name="IS_ACTIVE" Type="Boolean" />
                                <asp:Parameter DefaultValue="False" Name="ISBACKLOAD" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </div>
                    <div class="modalLabel" style="margin: 3px; text-align: center;">
                    <asp:UpdateProgress ID="upProgressPOL"  runat="server" AssociatedUpdatePanelID="upnlPullOutLetters">
                        <ProgressTemplate>
                            <img src="../Resources/294.gif" alt="" />
                            <br />
                            Please wait...
                        </ProgressTemplate>
                    </asp:UpdateProgress>
                </div>
                    <div style="text-align: center; margin: 5px;">
                        <asp:HyperLink ID="hpLinkUseSelectedPullOutLetter" Height="18px" Width="110px" Style="line-height: 18px;"
                            CssClass="modalWarningButtonYes" runat="server">USE SELECTED</asp:HyperLink>
                        <asp:Button ID="btnCancelSelect" runat="server" Text="CANCEL" CssClass="modalWarningButtonNo"
                            Width="85px" />
                    </div>
                </asp:Panel>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>
