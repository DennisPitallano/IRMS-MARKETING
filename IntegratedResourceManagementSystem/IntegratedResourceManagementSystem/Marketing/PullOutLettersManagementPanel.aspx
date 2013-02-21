<%@ Page Title="" Language="C#" MasterPageFile="~/Marketing/Marketing.Master" AutoEventWireup="true"
    CodeBehind="PullOutLettersManagementPanel.aspx.cs" Inherits="IntegratedResourceManagementSystem.Marketing.PullOutLettersManagementPanel" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Src="~/Marketing/controls/UCLoader.ascx" TagName="LOADER" TagPrefix="UC" %>
<asp:Content ID="HeadContent" ContentPlaceHolderID="head" runat="server">
    <link href="../Styles/returns-and-transfer.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/pull-out-letter.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="panelTitle">
        <asp:Image ID="imgpnlTitle" runat="server" ImageUrl="~/Resources/memo-doc.png" ImageAlign="Top"
            Height="28px" />
        Pull-Out Letters Management Panel
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
                        SEARCH BY:
                        <asp:RadioButtonList ID="rdioSearchType" runat="server" RepeatDirection="Horizontal"
                            RepeatLayout="Flow">
                            <asp:ListItem Selected="True">CUSTOMER</asp:ListItem>
                            <asp:ListItem>SERIES#</asp:ListItem>
                        </asp:RadioButtonList>
                        <asp:TextBox ID="txtSearch" runat="server" autofocus placeholder="Search Pull-Out Letter"
                            CssClass="modalText" AutoPostBack="True" Height="16px" Font-Size="10px" Width="150px"
                            ToolTip="Search Pull-Out Letter" ontextchanged="txtSearch_TextChanged"></asp:TextBox>
                        <asp:ImageButton ID="imgBtnSearch" runat="server" ImageAlign="AbsBottom" ImageUrl="~/Resources/search.png"
                            ToolTip="SEARCH" onclick="imgBtnSearch_Click" />
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
                                        <a href="NewPullOutLetterBoxSack.aspx" style="text-decoration: none;">PULL-OUT LETTER
                                        </a>
                                    </div>
                                    <div class="new-link">
                                        <a href="NewPullOutLetter.aspx" style="text-decoration: none;">PULL-OUT LETTER W/DETAILS
                                        </a>
                                    </div>
                                </div>
                            </asp:Panel>
                        </div>
                        <div style="float: left; margin-right: 5px;">
                           <asp:HyperLink ID="hpLinkUpdate" Height="23px" Style="padding-right: 5px; line-height: 23px;
                                text-decoration: none;" CssClass="btnUpdate" runat="server">UPDATE</asp:HyperLink>
                                 <asp:HoverMenuExtender ID="hpLinkUpdate_HoverMenuExtender" runat="server" DynamicServicePath=""
                                Enabled="True" TargetControlID="hpLinkUpdate" PopupControlID="pnlUpdateOption"
                                PopupPosition="Bottom">
                            </asp:HoverMenuExtender>
                            <asp:Panel ID="pnlUpdateOption" runat="server">
                                <div class="hover-menu-arrow">
                                </div>
                                <div class="hover-menu">
                                    <div class="new-link">
                                        <asp:HyperLink ID="hpLinkUpdateContents" Style="text-decoration: none;" title="Update Pull Out Letter Contents"
                                            runat="server">
                                            <img src="../Resources/edit_normal.png" alt="" align="left"  />
                                            UPDATE CONTENTS</asp:HyperLink>
                                    </div>
                                    <div class="new-link">
                                        <label for="MainContent_DDLLetterStatus">
                                            STATUS:</label>
                                        <asp:DropDownList ID="DDLLetterStatus" Enabled="false" Font-Size="10px" CssClass="modalText"
                                            Height="20px" runat="server">
                                            <asp:ListItem>PENDING</asp:ListItem>
                                            <asp:ListItem>SENT</asp:ListItem>
                                            <asp:ListItem>RECEIVED</asp:ListItem>
                                            <asp:ListItem>CANCELLED</asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:Button ID="btnUpdateStatus" Enabled="false" CssClass="btnTag" runat="server"
                                            Text="update" OnClick="btnUpdateStatus_Click" />
                                    </div>
                                    <div class="new-link" style="height: 5px;">
                                    </div>
                                </div>
                            </asp:Panel>
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
                            <asp:HyperLink ID="hpLinkPrint" Target="_blank" Style="padding-right: 3px; line-height: 23px;
                                text-decoration: none;" CssClass="btnPrint" Height="23px" runat="server">PRINT</asp:HyperLink>
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
                                        </label>
                                        <asp:Button CssClass="btnFilter" ID="btnFilterByBrand" runat="server" Text="FILTER"
                                            OnClick="btnFilterByBrand_Click" />
                                    </div>
                                    <div class="print-link">
                                        <label>
                                            BY STATUS:<asp:DropDownList ID="DDLFilterStatus" runat="server" Height="18px" Font-Names="Verdana"
                                                Font-Size="10px" ForeColor="#663300">
                                            <asp:ListItem>ALL</asp:ListItem>
                                            <asp:ListItem>PENDING</asp:ListItem>
                                            <asp:ListItem>SENT</asp:ListItem>
                                            <asp:ListItem>RECEIVED</asp:ListItem>
                                            <asp:ListItem>CANCELLED</asp:ListItem>
                                            </asp:DropDownList>
                                        </label>
                                        <asp:Button CssClass="btnFilter" ID="btnFilterByStatus" runat="server" 
                                            Text="FILTER" onclick="btnFilterByStatus_Click" />
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
                        LIST OF PULL OUT LETTERS
                    </div>
                    <asp:GridView ID="gvPullOutLetters" CssClass="table_grid" runat="server" CellPadding="4"
                        ForeColor="#333333" GridLines="None" AllowPaging="True" 
                        AllowSorting="True" AutoGenerateColumns="False"
                        DataKeyNames="ID,PULL_OUT_CODE,CUSTOMER_NO,SERIES_NO,LETTER_STATUS" DataSourceID="SqlDataSourcePullOutLetters"
                        OnSelectedIndexChanged="gvPullOutLetters_SelectedIndexChanged" 
                        EnableViewState="False" 
                        onpageindexchanging="gvPullOutLetters_PageIndexChanging" 
                        onselectedindexchanging="gvPullOutLetters_SelectedIndexChanging" 
                        onsorting="gvPullOutLetters_Sorting" PageSize="15">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:TemplateField>
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Image ID="imgPullOutLetter" runat="server" ImageUrl="~/Resources/Mail-icon.png" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:CommandField ShowSelectButton="True" />
                            <asp:BoundField DataField="SERIES_NO" HeaderText="SERIES#" 
                                SortExpression="SERIES_NO" >
                            <ItemStyle Font-Bold="True" Font-Italic="True" ForeColor="#CC6600" 
                                HorizontalAlign="Left" />
                            </asp:BoundField>
                            <asp:BoundField DataField="COMPANY_NAME" HeaderText="COMPANY NAME" SortExpression="COMPANY_NAME" />
                            <asp:BoundField DataField="ACCT_NAME" HeaderText="ACCOUNT NAME" SortExpression="ACCT_NAME" />
                            <asp:BoundField DataField="BRANCH_NAME" HeaderText="BRANCH NAME" SortExpression="BRANCH_NAME" />
                            <asp:BoundField DataField="PULLOUT_DATE" HeaderText="PULLOUT DATE" 
                                SortExpression="PULLOUT_DATE" DataFormatString="{0:MMMM dd, yyyy}" >
                            <ItemStyle Font-Bold="True" />
                            </asp:BoundField>
                            <asp:BoundField DataField="BRAND_NAME" HeaderText="BRAND" SortExpression="BRAND_NAME" />
                            <asp:BoundField DataField="LETTER_STATUS" HeaderText="LETTER STATUS" 
                                SortExpression="LETTER_STATUS" >
                            <ItemStyle Font-Bold="True" ForeColor="#993300" HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="TRANSACTION_DATE" HeaderText="TRANSACTION DATE" SortExpression="TRANSACTION_DATE" />
                        </Columns>
                        <EditRowStyle BackColor="#7C6F57" />
                        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                        <PagerSettings Mode="NumericFirstLast" />
                        <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#E3EAEB" />
                        <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#F8FAFA" />
                        <SortedAscendingHeaderStyle BackColor="#246B61" />
                        <SortedDescendingCellStyle BackColor="#D4DFE1" />
                        <SortedDescendingHeaderStyle BackColor="#15524A" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSourcePullOutLetters" runat="server" ConnectionString="<%$ ConnectionStrings:IRMSConnectionString %>"
                        SelectCommand="SELECT * FROM [PULL_OUT_LETTERS] WHERE ([FOR_SM] = @FOR_SM) ORDER BY ID DESC">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="False" Name="FOR_SM" Type="Boolean" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>
                <%--Delete Modal--%>
                <asp:Panel ID="pnlDeleteModal" runat="server" CssClass="modal">
                    <asp:Panel ID="pnlDeleteModalDrag" runat="server" CssClass="modalDrag">
                        <div class="sizeLogo">
                            <img alt="new brand" src="../Resources/product_brand.png" height="16" align="top" />
                            CONFIRMATION!!!
                        </div>
                    </asp:Panel>
                    <div style="border: 1px solid #FFCC66; text-align: center; font-family: Verdana;
                        font-size: 12px; height: 23px; color: #CC6600; background-color: #FFFF99; line-height: 16px;
                        margin: 2px 5px;">
                        <img alt="error update" src="../Resources/warning.png" height="22px" align="middle" />
                        Warning: This action cannot be undo.
                    </div>
                    <div style="text-align: center; font-family: Verdana; font-size: 11px;
                        margin: 5px 2px;">
                        <asp:Label ID="lblPOLToDelete" runat="server" CssClass="modalLabel"  Text="No data to delete. Select from the list and try again."></asp:Label>
                    </div>
                    <div style="text-align: center; margin: 5px 0px;">
                        <asp:Button ID="btnYes" runat="server" Text="YES" CssClass="modalWarningButtonYes"
                            ToolTip="Delete" Enabled="False" />
                        <asp:Button ID="btnNo" runat="server" Text="NO" CssClass="modalWarningButtonNo" ToolTip="Cancel"
                            ViewStateMode="Disabled" />
                    </div>
                </asp:Panel>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>
