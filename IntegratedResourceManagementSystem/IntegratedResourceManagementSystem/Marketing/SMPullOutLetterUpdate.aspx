<%@ Page Title="" Language="C#" MasterPageFile="~/Marketing/Marketing.Master" AutoEventWireup="true"
    CodeBehind="SMPullOutLetterUpdate.aspx.cs" Inherits="IntegratedResourceManagementSystem.Marketing.SMPullOutLetterUpdate" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Src="~/Marketing/controls/UCLoader.ascx" TagName="LOADER" TagPrefix="UC" %>
<asp:Content ID="HeadContent" ContentPlaceHolderID="head" runat="server">
    <link href="../Styles/sm-pull-out-details.css" rel="stylesheet" type="text/css" />
    <script language="javascript" type="text/javascript">
        function SelectAll(frmId, id) {
            var frm = document.getElementById(frmId);
            var counter = 0;
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
    <div>
        <div class="close_btn" style="cursor: pointer;">
            <a href="SMPullOutLetterManagementPanel.aspx">
                <img src="../Resources/reply.png" alt="" title="Back to list" />
            </a>
        </div>
    </div>
    <asp:UpdatePanel ID="upnlUpdate" runat="server">
        <ContentTemplate>
            <div>
                <div style="width: 700px;">
                    <div class="titleForm" style="height: 20px;">
                        PULL OUT LETTER HEADER
                        <div style="float: right; margin-left:3px; margin-right:2px;" runat="server">
                            <asp:HyperLink ID="hpLinlUpdateForwarder" Target="_top" CssClass="btnUpdate" Height="18px"
                             style="line-height:18px; padding-right:3px; text-decoration:none;" runat="server">assign forwarder</asp:HyperLink>
                        </div>
                        <div style="float: right;">
                            <asp:Button ID="btnUpdateHeader" runat="server" Height="18px" CssClass="btnUpdate"
                                Text="update header" OnClick="btnUpdateHeader_Click" />
                            <asp:Button ID="btnDoneHeaderEditing" Visible="false" runat="server" CssClass="btnDoneEditing"
                                Text="done editing" OnClick="btnDoneHeaderEditing_Click" />
                        </div>
                    </div>
                    <div class="form">
                        <table style="">
                            <tr>
                                <td class="modalLabel">
                                    PULL-OUT LETTER FOR:
                                </td>
                                <td>
                                    <asp:RadioButtonList ID="rdioPLType" Enabled="false" CssClass="modalText" runat="server"
                                        RepeatDirection="Horizontal" Height="26px" AutoPostBack="True" OnSelectedIndexChanged="rdioPLType_SelectedIndexChanged">
                                        <asp:ListItem Value="BL">BL (Back Load)</asp:ListItem>
                                        <asp:ListItem Value="ST">ST (Stock Transfer)</asp:ListItem>
                                    </asp:RadioButtonList>
                                </td>
                                <td>
                                </td>
                                <td>
                                    <asp:UpdateProgress ID="upProgress" runat="server" AssociatedUpdatePanelID="upnlUpdate">
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
                                    SERIES #:
                                </td>
                                <td>
                                    <asp:TextBox ID="txtSeriesNumber" EnableViewState="false" CssClass="modalText" Height="22px"
                                        Width="200px" runat="server" ReadOnly="True"></asp:TextBox>
                                    <asp:HiddenField ID="hfPullOutCode" runat="server" />
                                </td>
                                <td class="modalLabel">
                                    PULL OUT DATE:
                                </td>
                                <td class="modalLabel">
                                    <asp:TextBox ID="txtPullOutDate" Enabled="false" CssClass="modalText calendar" Height="22px"
                                        Width="170px" runat="server"></asp:TextBox>
                                    <asp:CalendarExtender ID="txtPullOutDate_CalendarExtender" runat="server" Enabled="True"
                                        TargetControlID="txtPullOutDate" Format="MMMM dd, yyyy">
                                    </asp:CalendarExtender>
                                </td>
                            </tr>
                            <tr>
                                <td class="modalLabel">
                                    CUSTOMER/OUTLET:
                                </td>
                                <td>
                                    <asp:TextBox ID="txtOutLetName" CssClass="modalText" Height="22px" runat="server"
                                        Width="300px" ReadOnly="True"></asp:TextBox>
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
                                    ACCOUNT NAME:
                                </td>
                                <td>
                                    <asp:TextBox ID="txtAccountName" CssClass="modalText" Height="22px" Width="150px"
                                        runat="server" ReadOnly="True"></asp:TextBox>
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
                                    BRANCH NAME:
                                </td>
                                <td>
                                    <asp:TextBox ID="txtBranchName" CssClass="modalText" Height="22px" runat="server"
                                        Width="270px" ReadOnly="True"></asp:TextBox>
                                </td>
                                <td class="modalLabel">
                                    BRANCH DEPT. CODE:
                                </td>
                                <td>
                                    <asp:TextBox ID="txtBranchDeptCode" CssClass="modalText" Height="22px" Width="100px"
                                        runat="server" ReadOnly="True"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="modalLabel">
                                    BRAND NAME:
                                </td>
                                <td>
                                    <asp:TextBox ID="txtBrand" CssClass="modalText" Height="22px" runat="server" Width="150px"
                                        ReadOnly="True"></asp:TextBox>
                                </td>
                                <td class="modalLabel">
                                    BRAND DEPT. CODE:
                                </td>
                                <td>
                                    <asp:TextBox ID="txtBrandDeptCode" CssClass="modalText" Height="22px" Width="100px"
                                        runat="server" ReadOnly="True"></asp:TextBox>
                                    <asp:HiddenField ID="hfPGMDNo" runat="server" />
                                    <asp:HiddenField ID="hfSubAreaGroupNo" runat="server" />
                                    <asp:HiddenField ID="hfAreaGroupNo" runat="server" />
                                    <asp:HiddenField ID="hfPGNo" runat="server" />
                                    <asp:HiddenField ID="hfCustomerNumber" runat="server" />
                                    <asp:HiddenField ID="hfBrandCode" runat="server" />
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
                <div style="margin-top: 10px;">
                    <div style="float: left; min-width: 140px; margin-bottom: 10px;">
                        <div class="titleForm">
                            <div style="float: right;">
                                <asp:Label ID="lblTotalCotainer" Font-Size="10px" EnableViewState="false" CssClass="modalLabel"
                                    runat="server" Text="Label" ForeColor="#CC0000"></asp:Label>
                            </div>
                        </div>
                        <div>
                            <asp:GridView ID="gvContainers" CssClass="table_grid" runat="server" AutoGenerateColumns="False"
                                CellPadding="4" ForeColor="#333333" GridLines="None" DataKeyNames="BoxNumber"
                                OnSelectedIndexChanged="gvContainers_SelectedIndexChanged" EnablePersistedSelection="True">
                                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                <Columns>
                                    <asp:TemplateField ShowHeader="False">
                                        <ItemTemplate>
                                            <div class="form">
                                                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Select"
                                                    Text="">
                                                    <asp:Image ID="imgContainer" ImageUrl='<%# Eval("ImageUrl") %>' runat="server" />
                                                </asp:LinkButton>
                                            </div>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="BoxNumber" HeaderText="BOX #" />
                                </Columns>
                                <EditRowStyle BackColor="#999999" />
                                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                            </asp:GridView>
                        </div>
                    </div>
                    <div style="float: left; margin-left: 10px; margin-bottom: 10px; min-width: 300px;">
                        <div class="titleForm" style="height: 20px;">
                            <div style="float: left;">
                                <div style="margin-right: 2px; float: left">
                                    <asp:Button ID="btnAddStyle" Height="21px" ToolTip="Add New Style" Text="" CssClass="btnNew"
                                        runat="server" />
                                    <asp:ModalPopupExtender ID="btnAddStyle_ModalPopupExtender" runat="server" DynamicServicePath=""
                                        PopupControlID="pnlStylesModal" PopupDragHandleControlID="pnlStylesModalDrag"
                                        Enabled="True" CancelControlID="btnCancelSaveSelectedStyles" TargetControlID="btnAddStyle"
                                        BackgroundCssClass="bgModal">
                                    </asp:ModalPopupExtender>
                                </div>
                                <div style="margin-right: 2px; float: left;">
                                    <asp:Button ID="brnUpdateStyles" ToolTip="Update Selected Items" Height="21px" Text=""
                                        CssClass="btnUpdate" runat="server" OnClick="brnUpdateStyles_Click" />
                                    <asp:HiddenField ID="hfUpdateStyleModalHandler" runat="server" />
                                    <asp:ModalPopupExtender ID="hfUpdateStyleModalHandler_ModalPopupExtender" runat="server"
                                        DynamicServicePath="" Enabled="True" PopupControlID="pnlUpdateItemsModal" PopupDragHandleControlID="pnlUpdateItemsModalDrag"
                                        CancelControlID="btnCancelSaveUpdate" TargetControlID="hfUpdateStyleModalHandler"
                                        BackgroundCssClass="bgModal">
                                    </asp:ModalPopupExtender>
                                </div>
                                <div style="margin-right: 2px; float: left;">
                                    <asp:Button ID="btnDeleteStyles" ToolTip="Delete Selected Items" Height="21px" Text=""
                                        CssClass="btnDelete" runat="server" />
                                    <asp:ModalPopupExtender ID="btnDeleteStyles_ModalPopupExtender" runat="server" DynamicServicePath=""
                                        Enabled="True" PopupDragHandleControlID="pnlDeleteConfiramtioModalDrag" PopupControlID="pnlDeleteConfirmationModal"
                                        CancelControlID="btnCancelDelete" TargetControlID="btnDeleteStyles" BackgroundCssClass="bgModal">
                                    </asp:ModalPopupExtender>
                                </div>
                                <div style="float: right; margin-right: 5px;">
                                    <asp:Button Text="add lost tag" ID="btnAddLostTagItems" CssClass="btnTag" runat="server" />
                                    <asp:ModalPopupExtender ID="btnAddLostTagItems_ModalPopupExtender" runat="server"
                                        DynamicServicePath="" Enabled="True" PopupControlID="pnlAddLostTagItemsModal"
                                        PopupDragHandleControlID="pnlAddLostTagItemsModalDrag" CancelControlID="lblCancelAddLostTag"
                                        BackgroundCssClass="bgModal" TargetControlID="btnAddLostTagItems">
                                    </asp:ModalPopupExtender>
                                    <asp:Panel ID="pnlAddLostTagItemsModal" CssClass="modal" runat="server">
                                        <asp:Panel CssClass="modalDrag" ID="pnlAddLostTagItemsModalDrag" runat="server">
                                            <div class="sizeLogo">
                                                ADD LOST TAG
                                            </div>
                                        </asp:Panel>
                                        <div style="margin: 5px;  text-align:center;">
                                            <label for="MainContent_txtLostTagQty">
                                                QTY:</label>
                                            <asp:TextBox ID="txtLostTagQty" Height="22px" Width="50px" CssClass="modalText" runat="server"></asp:TextBox>
                                        </div>
                                        <asp:Panel ID="pnlrdioLostTagContainers" Style="margin:3px 5px 3px 5px; text-align:center;" Visible="true" runat="server">
                                            <label for="MainContent_rdioLostTagContainers" class="modalLabel">
                                                SELECT CONTAINER:</label>
                                            <asp:RadioButtonList ID="rdioLostTagContainers" RepeatColumns="4" Font-Size="9px"
                                                Font-Bold="true" RepeatDirection="Horizontal" CssClass="modalText" runat="server">
                                            </asp:RadioButtonList>
                                        </asp:Panel>
                                        <div style="text-align: center; margin: 2px 5px 5px 5px;">
                                            <asp:Button ID="btnSaveLostTag" CssClass="btnTag" runat="server" Text="SAVE" OnClick="btnSaveLostTag_Click" />
                                            <asp:Label Text="CANCEL" Style="cursor: pointer;" ID="lblCancelAddLostTag" CssClass="modalLabel"
                                                runat="server" ForeColor="#CC0000" />
                                        </div>
                                    </asp:Panel>
                                </div>
                            </div>
                            <div style="float: right; margin-left: 5px;">
                                <asp:ImageButton ID="imgBtn" runat="server" ImageUrl="~/Resources/Refresh.png" OnClick="imgBtn_Click" />
                            </div>
                            <div style="float: right;">
                                <asp:Label ID="txtSummary" EnableViewState="false" CssClass="modalLabel" runat="server"
                                    Text="Label" ForeColor="#CC0000"></asp:Label>
                            </div>
                        </div>
                        <div>
                            <asp:GridView ID="gvBoxContainerDetails" CssClass="table_grid" runat="server" AutoGenerateColumns="False"
                                CellPadding="4" ForeColor="#333333" GridLines="None">
                                <AlternatingRowStyle BackColor="White" />
                                <Columns>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:Image ID="imgItem" ToolTip='<%# Eval("RecordNumber") %>' AlternateText='<%# Eval("IsLostTag") %>'
                                                ImageUrl="~/Resources/product.png" Height="16px" runat="server" />
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                                        </EditItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField>
                                        <HeaderTemplate>
                                            <asp:CheckBox ID="chkAllSelected" runat="server" title="Select All" ClientIDMode="Static"
                                                onclick="SelectAll('MainContent_gvBoxContainerDetails','chkAllSelected')" />
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:CheckBox ID="chkItem" runat="server" />
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:CheckBox ID="chkItem" runat="server" />
                                        </EditItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="ContainerType" HeaderText="TYPE" />
                                    <asp:BoundField DataField="ContainerNumber" HeaderText="BOX#" />
                                    <asp:BoundField DataField="StyleNumber" HeaderText="STYLE #" />
                                    <asp:BoundField DataField="StyleDescription" HeaderText="DESCRIPTION" HtmlEncode="False" />
                                    <asp:BoundField DataField="Quantity" HeaderText="QTY" />
                                    <asp:BoundField DataField="SRP" DataFormatString="{0:###,###.00}" HeaderText="SRP">
                                        <ItemStyle ForeColor="#CC0000" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="TtlAmount" DataFormatString="{0:###,###.00}" HeaderText="TOTAL AMT">
                                        <ItemStyle Font-Bold="True" ForeColor="#CC0000" HorizontalAlign="Right" />
                                    </asp:BoundField>
                                    <asp:CheckBoxField DataField="IsLostTag" HeaderText="LOST TAG" Visible="False" />
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
                        <div>
                        </div>
                        <div>
                            <asp:Panel ID="pnlStylesModal" CssClass="modal" runat="server">
                                <asp:Panel ID="pnlStylesModalDrag" CssClass="modalDrag" runat="server">
                                    <div class="sizeLogo">
                                        LIST OF STYLES
                                    </div>
                                </asp:Panel>
                                <div style="height: 25px; margin-top: 2px;">
                                    <div style="float: left;" class="SearchTextContainer">
                                        SEARCH:
                                        <asp:TextBox ID="txtSearchStyleNumber" runat="server" autofocus placeholder="Search Style"
                                            CssClass="modalText" AutoPostBack="True" Height="16px" Font-Size="10px" Width="100px"
                                            ToolTip="Search Style" OnTextChanged="txtSearchStyleNumber_TextChanged"></asp:TextBox>
                                        <asp:ImageButton ID="imgBtnSearch" runat="server" ImageAlign="AbsBottom" ImageUrl="~/Resources/search.png"
                                            ToolTip="SEARCH" OnClick="imgBtnSearch_Click" Width="22px" />
                                    </div>
                                </div>
                                <div style="margin: 5px;">
                                    <asp:GridView ID="gvStyles" CssClass="table_grid" runat="server" AllowPaging="True"
                                        AllowSorting="True" AutoGenerateColumns="False" DataSourceID="SqlDataSourceStyles"
                                        CellPadding="4" ForeColor="#333333" GridLines="None" OnPageIndexChanging="gvStyles_PageIndexChanging"
                                        PageSize="5">
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
                                                    <asp:CheckBox ID="chkAllStyle" runat="server" title="Select All" ClientIDMode="Static"
                                                        onclick="SelectAll('MainContent_gvStyles','chkAllStyle')" />
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <asp:CheckBox ID="chkStyles" runat="server" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="StyleNo" HeaderText="STYLE#" SortExpression="StyleNo">
                                                <ItemStyle Font-Bold="True" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="BrandName" HeaderText="BRAND" SortExpression="BrandName" />
                                            <asp:BoundField DataField="StyleDesc" HeaderText="DESCRIPTION" SortExpression="StyleDesc" />
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
                                        SelectCommand="SELECT [StyleNo], [BrandName], [StyleDesc] FROM [Style] WHERE ([IsActive] = @IsActive) and BrandName =@BRAND ORDER BY StyleNo DESC"
                                        EnableCaching="True">
                                        <SelectParameters>
                                            <asp:Parameter DefaultValue="True" Name="IsActive" Type="Boolean" />
                                            <asp:ControlParameter ControlID="txtBrand" DefaultValue="" Name="BRAND" PropertyName="Text"
                                                Type="String" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </div>
                                <asp:Panel ID="pnlContainerOptions" Style="margin: 2px 5px 3px 5px; text-align:center;" Visible="true"
                                    runat="server">
                                    <label for="MainContent_rdioContainers" class="modalLabel">
                                        SELECT CONTAINER:</label>
                                    <asp:RadioButtonList ID="rdioContainers" RepeatColumns="4" Font-Size="10px" Font-Bold="true"
                                        RepeatDirection="Horizontal" CssClass="modalText" runat="server">
                                    </asp:RadioButtonList>
                                </asp:Panel>
                                <div style="text-align: center; margin: 5px;">
                                    <asp:Button ID="btnSaveSelectedStyles" runat="server" CssClass="btnSave" Text="SAVE"
                                        OnClick="btnSaveSelectedStyles_Click" />
                                    <asp:Button ID="btnCancelSaveSelectedStyles" runat="server" CssClass="btnCancel"
                                        Text="CANCEL" />
                                </div>
                            </asp:Panel>
                            <asp:Panel ID="pnlUpdateItemsModal" CssClass="modal" runat="server">
                                <asp:Panel ID="pnlUpdateItemsModalDrag" CssClass="modalDrag" runat="server">
                                    <div class="sizeLogo">
                                        UPDATE ITEMS
                                    </div>
                                </asp:Panel>
                                <div style="margin: 5px;">
                                    <asp:GridView ID="gvSelectedItems" CssClass="table_grid" runat="server" AutoGenerateColumns="False"
                                        CellPadding="4" ForeColor="#333333" GridLines="None">
                                        <AlternatingRowStyle BackColor="White" />
                                        <Columns>
                                            <asp:TemplateField>
                                                <ItemTemplate>
                                                    <asp:Image ID="imgStyle" AlternateText='<%# Eval("RecordNumber") %>' ImageUrl="~/Resources/product.png"
                                                        Height="16px" runat="server" />
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                                                </EditItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="ContainerType" HeaderText="TYPE" />
                                            <asp:BoundField DataField="ContainerNumber" HeaderText="CON. #" />
                                            <asp:BoundField DataField="StyleNumber" HeaderText="STYLE #" />
                                            <asp:BoundField DataField="StyleDescription" HeaderText="DESCRIPTION" />
                                            <asp:TemplateField HeaderText="QTY">
                                                <ItemTemplate>
                                                    <asp:TextBox ID="txtSelectedItemQty" CssClass="modalText" Width="50px" runat="server"
                                                        Text='<%# Bind("Quantity") %>'></asp:TextBox>
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Quantity") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="SRP" HeaderText="SRP" />
                                            <asp:BoundField DataField="TtlAmount" HeaderText="TOTAL AMT" />
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
                                <div style="margin: 5px; text-align: center;">
                                    <asp:Button ID="btnSaveUpdate" runat="server" Width="75px" CssClass="btnSave" Text="UPDATE"
                                        OnClick="btnSaveUpdate_Click" />
                                    <asp:Button ID="btnCancelSaveUpdate" runat="server" CssClass="btnCancel" Text="CANCEL" />
                                </div>
                            </asp:Panel>
                            <asp:Panel ID="pnlDeleteConfirmationModal" CssClass="modal" runat="server">
                                <asp:Panel ID="pnlDeleteConfiramtioModalDrag" Height="20px" CssClass="modalDrag"
                                    runat="server">
                                    <div class="sizeLogo" style="line-height: 18px;">
                                        <img src="../Resources/warning.png" alt="" height="16px" align="left" />
                                        CONFIRMATION!
                                    </div>
                                </asp:Panel>
                                <div style="text-align: center; margin: 5px; height: 45px; line-height: 45px;">
                                    <img src="../Resources/warning.png" alt="" align="left" />
                                    <span id="countCheck" class="modalLabel">Are you sure you want to delete selected items?</span>
                                </div>
                                <div style="text-align: center; margin: 5px;">
                                    <asp:Button ID="bntDeleteYes" Text="YES" runat="server" CssClass="modalWarningButtonYes"
                                        OnClick="bntDeleteYes_Click" />
                                    <asp:Button ID="btnCancelDelete" Text="NO" runat="server" CssClass="modalWarningButtonNo" />
                                </div>
                            </asp:Panel>
                        </div>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
