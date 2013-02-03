<%@ Page Title="" Language="C#" MasterPageFile="~/Marketing/Marketing.Master" AutoEventWireup="true" CodeBehind="NewMarkDownMemoConcession.aspx.cs" Inherits="IntegratedResourceManagementSystem.Marketing.NewMarkDownMemoConcession" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="HeadContent" ContentPlaceHolderID="head" runat="server">
    <link href="../Styles/new-general-memo-concession.css" rel="stylesheet" type="text/css" />
     <script type="text/javascript" src="../Scripts/jquery-1.7.2.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#MainContent_txtMessage").attr("value", "Note:WAREHOUSE will retag all items upon distribution and our existing stocks at the outlet will be retagged by our accounting personnel before selling and also for future reference of returned goods. For your information and guidance.");
            $("#MainContent_txtMemoHeader").attr("value", "TO     : ALL CONCERNED\nFROM : MARKETING DEPT.\nRE      : AS PER STATED");
            $("#MainContent_txtIntroduction").attr("value", "Please be informed that the following items will be sold with its new markdown price.");
            $("#MainContent_rdioStatus_0").attr("checked", true);

            $("#MainContent_txtMemoDate").attr("value", new Date().format("MMMM dd, yyyy"));
            $("#MainContent_txtFooter").attr("value", "Prepared By:                                             Checked By: \n\n___________________________                       _____________________\nMR. NAME OF SALES HEAD                             MR. CHRIS GO\n       Area Sales Head                                    Area Sales Manager\n\n\nNoted By:                                                   Approved By: \n\n___________________________                       _____________________\n       MR. CARTER GO                                         MANAGEMENT\n       General Manager                                    ");
        });
    </script>
</asp:Content>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div style="height: 22px; margin-bottom: 10px; line-height: 22px; font-family: Verdana;
        font-weight: bold; font-size: 11px; color: #333; text-shadow: 1px 1px 0px white;">
        <asp:Image ID="imgpnlTitle" runat="server" ImageUrl="~/Resources/memo-doc.png" ImageAlign="Top"
            Height="22px" />
        &nbsp;NEW GENERAL MEMO(CONCESSION)
        <div style="float: right; height: 20px;">
        <a href="GeneralMemoConcession.aspx" title="Back to General Memo Concession Panel" >
            <img alt="BACK" src="../Resources/reply.png" title ="BACK" />
        </a>
        </div>
        <hr style="color: #ffffff;" />
    </div>
    <div>
        <table>
            <tr>
                <td class="frmLabel">
                    <label for="MainContent_txtMemoNumber">
                        MEMO #:</label>
                </td>
                <td>
                    <asp:TextBox ID="txtMemoNumber" CssClass="modalText" Height="20px" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="frmLabel">
                    <label for="MainContent_txtMemoDate">
                        MEMO DATE:
                    </label>
                </td>
                <td>
                    <asp:TextBox ID="txtMemoDate" CssClass="modalText" Height="20px" runat="server"></asp:TextBox>
                    <asp:CalendarExtender ID="txtMemoDate_CalendarExtender" runat="server" Enabled="True"
                        TargetControlID="txtMemoDate" Format="MMMM dd, yyyy">
                    </asp:CalendarExtender>
                </td>
            </tr>
            <tr>
                <td class="frmLabel">
                    <label for="MainContent_txtMemoHeader">
                        HEADER:</label>
                </td>
                <td>
                    <asp:TextBox ID="txtMemoHeader" TextMode="MultiLine" Font-Size="10px" CssClass="modalText"
                        Height="40px" Width="160px" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="frmLabel">
                    <label for="MainContent_txtIntroduction">
                        INTRODUCTION:</label>
                </td>
                <td>
                    <asp:TextBox ID="txtIntroduction" TextMode="MultiLine" Font-Size="10px" CssClass="modalText"
                        Height="35px" Width="350px" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="frmLabel">
                    <label for="MainContent_DDLBrand">
                        BRAND:</label>
                </td>
                <td>
                    <asp:DropDownList CssClass="modalText" Height="20px" ID="DDLBrand" Font-Size="11px"
                        runat="server" DataSourceID="ObjectDataSourceBrand" DataTextField="BrandDescription"
                        DataValueField="BrandDescription" AutoPostBack="True">
                    </asp:DropDownList>
                    <asp:ObjectDataSource ID="ObjectDataSourceBrand" runat="server" SelectMethod="Brands"
                        TypeName="IRMS.BusinessLogic.Manager.BrandManager"></asp:ObjectDataSource>
                </td>
            </tr>
        </table>
    </div>
    <hr style="color: #ffffff;" />

      <div>
                <div>
                    <label class="frmLabel">
                        APPLY PRICE POINT TO:
                    </label>
                    <asp:RadioButtonList ID="rdioApplyPricePointTo" runat="server" Font-Size="11px" Font-Bold="true"
                        CssClass="modalText rdioButtonList" RepeatDirection="Horizontal" RepeatLayout="Flow"
                        ForeColor="#996633" AutoPostBack="True" OnSelectedIndexChanged="rdioApplyPricePointTo_SelectedIndexChanged">
                        <asp:ListItem Selected="True">AREA</asp:ListItem>
                        <asp:ListItem>SUB-AREA</asp:ListItem>
                        <asp:ListItem>CUSTOMER</asp:ListItem>
                    </asp:RadioButtonList>
                </div>
                <div style="margin: 5px 2px;">
                    <asp:MultiView ID="mvApplyPricePoint" ActiveViewIndex="0" runat="server">
                        <asp:View ID="vAreaGroup" runat="server">
                            <table>
                                <tr>
                                    <td class="frmLabel">
                                        <label for="MainContent_DDLAreaGroup">
                                            AREA GROUP:</label>
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="DDLAreaGroup" Height="20px" CssClass="modalText" runat="server"
                                            DataSourceID="SqlDataSourceAreaGroup" DataTextField="GroupName" DataValueField="AGNo"
                                            AutoPostBack="True">
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="SqlDataSourceAreaGroup" runat="server" ConnectionString="<%$ ConnectionStrings:IRMSConnectionString %>"
                                            SelectCommand="SELECT * FROM [GrpArea]"></asp:SqlDataSource>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="frmLabel">
                                        <label for="MainContent_DDLSubArea">
                                            SUB-AREA:</label>
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="DDLSubArea" CssClass="modalText" Height="20px" runat="server"
                                            DataSourceID="SqlDataSourceSubArea" DataTextField="GroupName" DataValueField="SAGNo">
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="SqlDataSourceSubArea" runat="server" ConnectionString="<%$ ConnectionStrings:IRMSConnectionString %>"
                                            SelectCommand="SELECT  [GroupName],[SAGNo] FROM [GrpSubArea] WHERE ([AGNo] = @SAGNo)">
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="DDLAreaGroup" Name="SAGNo" PropertyName="SelectedValue"
                                                    Type="Int32" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </td>
                                </tr>
                            </table>
                            <asp:Panel ID="pnlAreaGroup" runat="server">
                                <label class="frmLabel">
                                    EFFECTIVITY DATE:
                                    <asp:TextBox ID="txtEffectivityDate" Height="20px" CssClass="modalText" runat="server"></asp:TextBox>
                                    <asp:CalendarExtender ID="txtEffectivityDate_CalendarExtender" runat="server" Enabled="True"
                                        TargetControlID="txtEffectivityDate">
                                    </asp:CalendarExtender>
                                </label>
                            </asp:Panel>
                            <asp:Panel ID="pnlSubAreaGroup" Visible="false" runat="server">
                                <label class="frmLabel" for="MainContent_txtPromoPeriodTo">
                                    PROMO PERIOD TO:
                                    <asp:TextBox ID="txtPromoPeriodTo" Height="20px" CssClass="modalText" runat="server"></asp:TextBox>
                                    <asp:CalendarExtender ID="txtPromoPeriodTo_CalendarExtender" runat="server" Enabled="True"
                                        TargetControlID="txtPromoPeriodTo">
                                    </asp:CalendarExtender>
                                </label>
                            </asp:Panel>
                        </asp:View>
                        <asp:View ID="vCustomer" runat="server">
                            <div style="display: inline-block; margin-right: 1px; margin-top: 5px;">
                                <label class="frmLabel" for="MainContent_txtCustomer">
                                    CUSTOMER:
                                    <asp:TextBox ID="txtCustomer" runat="server" Width="270px" Font-Bold="true" Font-Size="11px"
                                        CssClass="modalText" Height="20px" ReadOnly="True"></asp:TextBox></label>
                            </div>
                            <div style="display: inline-block; margin-right: 5px; margin-top: 4px;">
                                <asp:Button ID="btnBrowseCustomer" runat="server" Text="browse.." CssClass="btnBrowse"
                                    Font-Names="Verdana" />
                                <asp:ModalPopupExtender ID="btnBrowseCustomer_ModalPopupExtender" runat="server"
                                    DynamicServicePath="" Enabled="True" PopupControlID="pnlCustomersModal" PopupDragHandleControlID="pnlCustomersModalDrag"
                                    TargetControlID="btnBrowseCustomer" BackgroundCssClass="bgModal" CancelControlID="imgBtnpnlCustomersModal">
                                    <Animations>
                                        <OnShown>
                                            <FadeIn Duration=".2" />
                                        </OnShown>
                                    </Animations>
                                </asp:ModalPopupExtender>
                            </div>
                           
                             <label class="frmLabel" for="MainContent_txtPromoPeriodFromCustomer">
                                    PROMO PERIOD FROM:
                                    <asp:TextBox ID="txtPromoPeriodFromCustomer" Height="20px" CssClass="modalText" runat="server"></asp:TextBox>
                                    <asp:CalendarExtender ID="txtPromoPeriodFromCustomer_CalendarExtender" runat="server" Enabled="True"
                                        TargetControlID="txtPromoPeriodFromCustomer">
                                    </asp:CalendarExtender>
                                </label>
                               <label class="frmLabel" for="MainContent_txtPromoPeriodToCustomer">
                                    TO
                                     <asp:TextBox ID="txtPromoPeriodToCustomer" Height="20px" CssClass="modalText" runat="server"></asp:TextBox>
                                    <asp:CalendarExtender ID="txtPromoPeriodToCustomer_CalendarExtender" runat="server" Enabled="True"
                                        TargetControlID="txtPromoPeriodToCustomer">
                                    </asp:CalendarExtender>
                                </label>
                                 <br />
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
                                    <div class="SearchTextContainer">
                                        SEARCH:
                                        <asp:TextBox ID="txtSearchCustomer" Height="16px" Font-Size="10px" Width="120px"
                                            placeholder="Search Customer" CssClass="modalText" runat="server"></asp:TextBox>
                                        <asp:ImageButton ID="iBtnSearchCustomer" runat="server" ImageUrl="~/Resources/search.png"
                                            ImageAlign="AbsBottom" />
                                    </div>
                                </div>
                                <div style="padding: 3px 5px;">
                                    <asp:GridView ID="gvCustomers" runat="server" CellPadding="4" CssClass="table_grid"
                                        GridLines="None" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False"
                                        DataKeyNames="CustNo" DataSourceID="SqlDataSourceCustomers" EnablePersistedSelection="True"
                                        OnPageIndexChanging="gvCustomers_PageIndexChanging" OnSelectedIndexChanged="gvCustomers_SelectedIndexChanged"
                                        OnSelectedIndexChanging="gvCustomers_SelectedIndexChanging" OnSorting="gvCustomers_Sorting">
                                        <AlternatingRowStyle BackColor="White" />
                                        <Columns>
                                            <asp:TemplateField>
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Image ID="imgCustomer" ImageUrl="~/Resources/users.png" AlternateText='<%# Eval("CustNo") %>'
                                                        Height="14px" runat="server" />
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
                                        SelectCommand="SELECT [CustNo], [CompName] FROM [CustInfo]"></asp:SqlDataSource>
                                </div>
                                <div style="text-align: center; padding: 3px 0;">
                                    <asp:Button ID="btnSelectCustomer" CssClass="modalWarningButtonYes" runat="server"
                                        Text="OK" Enabled="False" ToolTip="Currently Disabled, please select from list."
                                        OnClick="btnSelectCustomer_Click" />
                                    <asp:HiddenField ID="hfCustomerId" runat="server" />
                                </div>
                            </asp:Panel>
                        </asp:View>
                    </asp:MultiView>
                </div>
            </div>
            <hr style="color: #fff;" />
             <%--Items Details--%>
            <div style ="min-height:200px;">
                <div style="height: 25px;" class="modalDrag">
                    <div class="sizeLogo">
                        <img src="../Resources/product.png" alt="product" height="16px" align="top" />
                        ITEM DETAILS
                    </div>
                    <div style="float: left; display: inline-block; margin-left: 25px; margin-right: 5px;">
                        <asp:Button ID="btnAddNewItem" runat="server" Text="ADD ITEM" CssClass="btnNew" />
                        <asp:ModalPopupExtender ID="btnAddNewItem_ModalPopupExtender" runat="server" CancelControlID="btnSelectItemNo"
                            DynamicServicePath="" Enabled="True" PopupControlID="pnlNewItemModal" PopupDragHandleControlID="pnlNewItemModalDrag"
                            TargetControlID="btnAddNewItem">
                        </asp:ModalPopupExtender>
                    </div>
                    <div style="float: left; display: inline-block;  margin-right: 5px;">
                        <asp:Button ID="btnAddMemo" runat="server" Text="ADD MEMO" CssClass="btnNew" />
                    </div>
                    <div style="display: inline-block; margin-left: 5px;">
                        <asp:Button ID="btnRemoveItem" runat="server" Text="REMOVE ITEM/S" CssClass="btnDelete" />
                    </div>
                </div>
                <div>
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4"
                        Font-Names="Verdana" Font-Size="11px" ForeColor="#333333" GridLines="None" ShowHeaderWhenEmpty="True">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:TemplateField>
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Image ID="imgItem" runat="server" ImageUrl="~/Resources/product.png" Height="16px" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <EditItemTemplate>
                                    <asp:CheckBox ID="CheckBox1" runat="server" />
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:CheckBox ID="chkStyleNumber" runat="server" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField HeaderText="STYLE #">
                                <HeaderStyle Wrap="False" />
                                <ItemStyle Wrap="False" />
                            </asp:BoundField>
                            <asp:BoundField HeaderText="DESCRIPTION">
                                <HeaderStyle Wrap="False" />
                                <ItemStyle Wrap="False" />
                            </asp:BoundField>
                            <asp:BoundField HeaderText="CURRENT PRICE">
                                <HeaderStyle Wrap="False" />
                                <ItemStyle Wrap="False" />
                            </asp:BoundField>
                            <asp:BoundField HeaderText="MARKDOWN PRICE">
                                <HeaderStyle Wrap="False" />
                                <ItemStyle Wrap="False" />
                            </asp:BoundField>
                        </Columns>
                        <EditRowStyle BackColor="#7C6F57" />
                        <EmptyDataTemplate>
                            ADD ITEM TO MARKDOWN
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
                <asp:Panel ID="pnlNewItemModal" runat="server" CssClass="modal">
                    <asp:Panel ID="pnlNewItemModalDrag" runat="server" CssClass="modalDrag">
                        <div class="sizeLogo">
                            <img alt="new brand" src="../Resources/product.png" height="16" align="top" />
                            NEW ITEM TO MARKDOWN
                        </div>
                    </asp:Panel>
                    <div style="margin: 2px 2px; height: 26px;">
                        <div class="SearchTextContainer">
                            SEARCH:
                            <asp:TextBox ID="txtSearchItem" Height="16px" Font-Size="10px" Width="120px" placeholder="Search Item"
                                CssClass="modalText" runat="server"></asp:TextBox>
                            <asp:ImageButton ID="iBtnSearchItems" runat="server" ImageUrl="~/Resources/search.png"
                                ImageAlign="AbsBottom" />
                        </div>
                    </div>
                    <div style="margin: 3px 3px;">
                        <asp:GridView ID="gvItems" runat="server" AllowPaging="True" AllowSorting="True"
                            AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSourceItems"
                            CssClass="table_grid" GridLines="None" 
                            onpageindexchanging="gvItems_PageIndexChanging" 
                            onselectedindexchanging="gvItems_SelectedIndexChanging" 
                            onsorting="gvItems_Sorting">
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:CommandField ShowSelectButton="True" />
                                <asp:BoundField DataField="StyleNo" HeaderText="STYLE #" SortExpression="StyleNo" />
                                <asp:BoundField DataField="BrandName" HeaderText="BRAND NAME" SortExpression="BrandName" />
                                <asp:BoundField DataField="StyleDesc" HeaderText="DESCRIPTION" SortExpression="StyleDesc" />
                            </Columns>
                            <EditRowStyle BackColor="#7C6F57" />
                            <EmptyDataTemplate>
                                <img src="../Resources/unhappy.png" alt="DENNIS" align="middle" />
                                NO ITEMS AVAILABLE FOR SELECTED BRAND!
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
                        <asp:SqlDataSource ID="SqlDataSourceItems" runat="server" ConnectionString="<%$ ConnectionStrings:IRMSConnectionString %>"
                            SelectCommand="SELECT [StyleNo], [BrandName], [StyleDesc] FROM [Style] WHERE ([BrandName] = @BrandName)"
                            EnableCaching="True">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="DDLBrand" Name="BrandName" PropertyName="SelectedValue"
                                    Type="String" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </div>
                    <hr style="color: #BBB277;" />
                    <div style="margin: 3px 5px; text-align: center;">
                        <label class="modalLabel" for="MainContent_txtMarkDownPrice">
                            CURRENT PRICE:</label>
                        <br />
                        <asp:TextBox ID="txtCurrentPrice" ReadOnly="true" Height="20px" CssClass="modalText"
                            runat="server" />
                        <br />
                        <label class="modalLabel" for="MainContent_txtMarkDownPrice">
                            INPUT MARKDOWN PRICE:</label>
                        <br />
                        <asp:TextBox ID="txtMarkDownPrice" Height="20px" CssClass="modalText" runat="server" />
                    </div>
                    <hr style="color: #BBB277;" />
                    <div style="text-align: center; margin: 5px 0px;">
                        <asp:Button ID="btnSelectItemOk" runat="server" Text="OK" CssClass="modalWarningButtonYes"
                            ToolTip="Delete" Enabled="False" />
                        <asp:Button ID="btnSelectItemNo" Width="85px" runat="server" Text="CANCEL" CssClass="modalWarningButtonNo"
                            ToolTip="Cancel" EnableViewState="False" />
                    </div>
                </asp:Panel>
            </div>

               <div style="margin: 10px 2px;">
                <table>
                    <tr>
                        <td>
                            <label class="frmLabel" for="MainContent_txtMessage">
                                MESSAGE:</label>
                        </td>
                        <td>
                            <asp:TextBox CssClass="modalText" ID="txtMessage" Font-Size="10px" runat="server"
                                TextMode="MultiLine" Height="40" Width="500px">
                            </asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label class="frmLabel" for="MainContent_txtFooter">
                                FOOTER:</label>
                        </td>
                        <td>
                            <asp:TextBox CssClass="modalText" ID="txtFooter" Font-Size="10px" runat="server"
                                TextMode="MultiLine" Height="150" Width="500px">
                            </asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label class="frmLabel" for="MainContent_txtRemarks">
                                REMARKS:</label>
                        </td>
                        <td>
                            <asp:TextBox CssClass="modalText" ID="txtRemarks" Font-Size="10px" runat="server"
                                TextMode="MultiLine" Height="40" Width="500px">
                            </asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label class="frmLabel" for="MainContent_rdioStatus">
                                STATUS:</label>
                        </td>
                        <td>
                            <asp:RadioButtonList ID="rdioStatus" CssClass="frmLabel" runat="server" RepeatDirection="Horizontal"
                                RepeatLayout="Flow">
                                <asp:ListItem>Pendeng</asp:ListItem>
                                <asp:ListItem>Approved</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                </table>
            </div>
            <div style="text-align:center;">
                <div style="display: inline-block; margin-left: 5px;">
                    <asp:Button ID="btnSaveGeneralMemo" runat="server" Text="SAVE" CssClass="btnSave" />
                </div>
                 <div style="display: inline-block; margin-left: 5px;">
                   <a href="GeneralMemoConcession.aspx">
                       <input id="btncancel" type="button" value="CANCEL" class="btnCancel" /></a>
                </div>
            </div>
</asp:Content>
