﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Marketing/Marketing.Master" AutoEventWireup="true" CodeBehind="UpdateGeneralMemoConcession.aspx.cs" Inherits="IntegratedResourceManagementSystem.Marketing.UpdateGeneralMemoConcession" %>

    
<%@ Register Src="~/Marketing/controls/UCLoader.ascx" TagName="LOADER" TagPrefix="UC" %>
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

            $("#MainContent_txtFooter").attr("value", "Prepared By:                                             Checked By: \n\n___________________________                       _____________________\nMR. NAME OF SALES HEAD                             MR. CHRIS GO\n       Area Sales Head                                    Area Sales Manager\n\n\nNoted By:                                                   Approved By: \n\n___________________________                       _____________________\n       MR. CARTER GO                                         MANAGEMENT\n       General Manager                                    ");
        });
    </script>
    <style type="text/css">
        .style1
        {
            text-align: right;
            font-family: Verdana;
            color: #333;
            text-shadow: 1px 1px 0px white;
            font-size: 10px;
            width: 131px;
        }
    </style>
</asp:Content>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div style="height: 22px; margin-bottom: 10px; line-height: 22px; font-family: Verdana;
        font-weight: bold; font-size: 11px; color: #333; text-shadow: 1px 1px 0px white;">
        <asp:Image ID="imgpnlTitle" runat="server" ImageUrl="~/Resources/memo-doc.png" ImageAlign="Top"
            Height="22px" />
        &nbsp;UPDATE GENERAL MEMO(CONCESSION)
        <div style="float: right; height: 20px;">
            <a href="GeneralMemoConcession.aspx" title="Back to General Memo Concession Panel">
                <img alt="BACK" src="../Resources/reply.png" title="BACK" />
            </a>
        </div>
        <hr style="color: #ffffff;" />
    </div>

    <%--                                <asp:DropDownList ID="DDLSubArea" CssClass="modalText" Height="20px" runat="server"
                                    DataSourceID="SqlDataSourceSubArea" DataTextField="GroupName" DataValueField="SAGNo"
                                    Visible="False">
                                </asp:DropDownList>--%>

    <div>
        <table>
            <tr>
                <td class="style1">
                    <label for="MainContent_DDLBrand">
                        BRAND:</label>
                </td>
                <td>
                    <%--                                <asp:DropDownList ID="DDLSubArea" CssClass="modalText" Height="20px" runat="server"
                                    DataSourceID="SqlDataSourceSubArea" DataTextField="GroupName" DataValueField="SAGNo"
                                    Visible="False">
                                </asp:DropDownList>--%>
                    <asp:DropDownList CssClass="modalText" Height="20px" ID="DDLBrand" Font-Size="11px"
                        runat="server" AutoPostBack="True" Visible="False" 
                        >
                    </asp:DropDownList>

                    <asp:TextBox ID="txtBrandName" runat="server" CssClass="modalText" ReadOnly="True"></asp:TextBox>
                </td>
            </tr>
        </table>
        <div>
            <label class="frmLabel">
                APPLY PRICE POINT TO:
            </label>
            <asp:RadioButtonList ID="rdioApplyPricePointTo" runat="server" Font-Size="11px" Font-Bold="true"
                CssClass="modalText rdioButtonList" RepeatDirection="Horizontal" RepeatLayout="Flow"
                ForeColor="#996633" AutoPostBack="True" Visible="False">
                <asp:ListItem Selected="True">AREA</asp:ListItem>
                <asp:ListItem>SUB-AREA</asp:ListItem>
                <asp:ListItem>CUSTOMER</asp:ListItem>
            </asp:RadioButtonList>
            <asp:TextBox ID="txtApplyPricePoint" runat="server" CssClass="modalText" ReadOnly="True"></asp:TextBox>
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
                                <asp:TextBox ID="txtAreaGroup" runat="server" CssClass="modalText" ></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="frmLabel">
                                <asp:Label ID="lblSubArea" AssociatedControlID="txtSubAreaGroup" runat="server" 
                                    Text="SUB-AREA:" Visible="False"></asp:Label>
                            </td>
                            <td>


<%--                                <asp:DropDownList ID="DDLSubArea" CssClass="modalText" Height="20px" runat="server"
                                    DataSourceID="SqlDataSourceSubArea" DataTextField="GroupName" DataValueField="SAGNo"
                                    Visible="False">
                                </asp:DropDownList>--%>



<%--                                <asp:SqlDataSource ID="SqlDataSourceSubArea" runat="server" ConnectionString="<%$ ConnectionStrings:IRMSConnectionString %>"
                                    SelectCommand="SELECT  [GroupName],[SAGNo] FROM [GrpSubArea] WHERE ([AGNo] = @SAGNo)">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="DDLAreaGroup" Name="SAGNo" PropertyName="SelectedValue"
                                            Type="Int32" />
                                    </SelectParameters>
                                </asp:SqlDataSource>--%>
                                <asp:TextBox ID="txtSubAreaGroup" runat="server" Visible="False" CssClass="modalText" ></asp:TextBox>
                            </td>
                        </tr>
                    </table>
                    <asp:Panel ID="pnlAreaGroup" runat="server">
                        <label class="frmLabel">
                            EFFECTIVITY DATE:
                            <asp:TextBox ID="txtEffectivityDate" Height="20px" CssClass="modalText" 
                            runat="server" ReadOnly="True"></asp:TextBox>
                        </label>
                    </asp:Panel>
                    <asp:Panel ID="pnlSubAreaGroup" Visible="false" runat="server">
                        <label class="frmLabel" for="MainContent_txtPromoPeriodTo">
                            PROMO PERIOD TO:
                            <asp:TextBox ID="txtPromoPeriodTo" Height="20px" CssClass="modalText" 
                            runat="server" ReadOnly="True"></asp:TextBox>
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
                            Font-Names="Verdana" Visible="False" />
                        <asp:ModalPopupExtender ID="btnBrowseCustomer_ModalPopupExtender" runat="server"
                            DynamicServicePath="" Enabled="True" PopupControlID="pnlCustomersModal" PopupDragHandleControlID="pnlCustomersModalDrag"
                            TargetControlID = "btnBrowseCustomer" BackgroundCssClass="bgModal" CancelControlID="imgBtnpnlCustomersModal">
                            <Animations>
                                        <OnShown>
                                            <FadeIn Duration=".2" />
                                        </OnShown>
                            </Animations>
                        </asp:ModalPopupExtender>
                    </div>
                    <label class="frmLabel" for="MainContent_txtPromoPeriodFromCustomer">
                        PROMO PERIOD FROM:
                        <asp:TextBox ID="txtPromoPeriodFromCustomer" Height="20px" 
                        CssClass="modalText" runat="server" ReadOnly="True"></asp:TextBox>
                    </label>
                    <label class="frmLabel" for="MainContent_txtPromoPeriodToCustomer">
                        TO
                        <asp:TextBox ID="txtPromoPeriodToCustomer" Height="20px" 
                        CssClass="modalText" runat="server" ReadOnly="True"></asp:TextBox>

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
                                SEARCH CUSTOMER NAME:
                                <asp:TextBox ID="txtSearchCustomer" Height="16px" Font-Size="10px" Width="120px"
                                    placeholder="Search Customer" CssClass="modalText" runat="server"></asp:TextBox>
                                <asp:ImageButton ID="iBtnSearchCustomer" runat="server" ImageUrl="~/Resources/search.png"
                                    ImageAlign="AbsBottom" />
                            </div>
                        </div>
                        <div style="padding: 3px 5px;">
                            <asp:GridView ID="gvCustomers" runat="server" CellPadding="4" CssClass="table_grid"
                                GridLines="None" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False"
                                DataKeyNames="CustNo" DataSourceID="SqlDataSourceCustomers" 
                                EnablePersistedSelection="True">
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
                                
                                
                                SelectCommand="SELECT [CustNo], [CompName] FROM [CustInfo] WHERE ([CompName] LIKE '%' + @CompName + '%')">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="hfBrandName" Name="CompName" 
                                        PropertyName="Value" DefaultValue="" Type="String" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </div>
                        <div style="text-align: center; padding: 3px 0;">
                            <asp:Button ID="btnSelectCustomer" CssClass="modalWarningButtonYes" runat="server"
                                Text="OK" Enabled="False" 
                                ToolTip="Currently Disabled, please select from list." />
                            <asp:HiddenField ID="hfCustomerId" runat="server" />
                            <asp:HiddenField ID="hfBrandName" runat="server" />
                        </div>
                    </asp:Panel>
                </asp:View>
            </asp:MultiView>
        </div>
    </div>


    <%--            <strong>NEW MARKDOWN
            </strong>--%>
    <hr style="color: #ffffff;" />
    <div>

        <table>
            <tr>
                <td class="frmLabel">
                    <label for="MainContent_txtMemoNumber">
                        MEMO #:</label>
                </td>
                <td>                    
                    <asp:TextBox ID="txtMemoNumber" CssClass="modalText" Height="20px" 
                        runat="server" ReadOnly="True"></asp:TextBox>&nbsp

                
                </td>
            </tr>
            <tr>
                <td class="frmLabel">
                    <label for="MainContent_txtMemoDate">
                        MEMO DATE:
                    </label>
                </td>
                <td>
                    <asp:TextBox ID="txtMemoDate" CssClass="modalText" Height="20px" runat="server" 
                        ReadOnly="True"></asp:TextBox>
                    <%--            <strong>FURTHER MARKDOWN<br />
            </strong>--%>
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


        </table>
    </div>


    <%--            <strong>FURTHER MARKDOWN<br />
            </strong>--%>


    <hr style="color: #fff;" />
    <%--            <strong>FURTHER MARKDOWN<br />
            </strong>--%>
    <div style="min-height: 200px;">
        <div style="height: 25px;" class="modalDrag">
            <div class="sizeLogo">
                <img src="../Resources/product.png" alt="product" height="16px" align="top" />
                ITEM DETAILS
                <br />
            </div>
            <div style="float: left; display: inline-block; margin-left: 25px; margin-right: 5px;">


            <asp:RadioButtonList ID="rbtnFurther" CssClass="frmLabel" runat="server" RepeatDirection="Horizontal"
                        RepeatLayout="Flow" 
                   AutoPostBack="True"  Visible="False">
                        <asp:ListItem>For Further MD</asp:ListItem>
                        <asp:ListItem>New MD</asp:ListItem>
                        <asp:ListItem>Mix</asp:ListItem>
                    </asp:RadioButtonList>

                <asp:Button ID="btnAddMemo" runat="server" Text="ADD MEMO" CssClass="btnNew" />
                <asp:ModalPopupExtender ID="btnAddMemo_ModalPopupExtender" runat="server" CancelControlID="btnSelectItemNo"
                    DynamicServicePath="" Enabled="True" PopupControlID="pnlAddMEmo" PopupDragHandleControlID="pnlAddMemoModalDrag"
                    TargetControlID="btnAddMemo">
                </asp:ModalPopupExtender>

                <%--            <strong>FURTHER MARKDOWN<br />
            </strong>--%>
            </div>
            <div style="float: left; display: inline-block; margin-right: 5px;">

                <asp:Button ID="btnAddNewItem" runat="server" Text="ADD ITEM" 
                    CssClass="btnNew"  />

                <asp:ModalPopupExtender ID="btnAddNewItem_ModalPopupExtender" runat="server" CancelControlID="btnSelectItemNo"
                    DynamicServicePath="" Enabled="True" PopupControlID="pnlNewItemModal" PopupDragHandleControlID="pnlNewItemModalDrag"
                    TargetControlID="btnAddNewItem">
                </asp:ModalPopupExtender>




<%--            <strong>FURTHER MARKDOWN<br />
            </strong>--%>
            </div>
            <div style="display: inline-block; margin-left: 5px;">
                <asp:Button ID="btnRemoveItem" runat="server" Text="REMOVE ITEM/S" 
                    CssClass="btnDelete" onclick="btnRemoveItem_Click" />
            </div>
        </div>


        <!-- (s) CHRIS-->

        <div>
            <strong>NEW MARKDOWN LIST
            </strong>
            <asp:GridView ID="gvNewMarkdownList" runat="server" CellPadding="4"
                Font-Names="Verdana" Font-Size="11px" ForeColor="#333333" GridLines="Vertical" 
                ShowHeaderWhenEmpty="True" >
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
                            <asp:CheckBox ID="chkItem" runat="server" />
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:CheckBox ID="chkStyleNumber" runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <EditRowStyle BackColor="#7C6F57" />
                <EmptyDataTemplate>
                    <--No Item Listed To MarkDown-->
                </EmptyDataTemplate>
                <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#E3EAEB" ForeColor="Black" />
                <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F8FAFA" />
                <SortedAscendingHeaderStyle BackColor="#246B61" />
                <SortedDescendingCellStyle BackColor="#D4DFE1" />
                <SortedDescendingHeaderStyle BackColor="#15524A" />
            </asp:GridView>
        </div>

        <br />
        <br />
        <div>
            <strong>FURTHER MARKDOWN LIST
            </strong>
            <asp:GridView ID="gvMarkdownList" runat="server" CellPadding="4"
                Font-Names="Verdana" Font-Size="11px" ForeColor="#333333" GridLines="Vertical" 
                ShowHeaderWhenEmpty="True" >
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
                            <asp:CheckBox ID="chkItem" runat="server" />
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:CheckBox ID="chkStyleNumber" runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <EditRowStyle BackColor="#7C6F57" />
                <EmptyDataTemplate>
                    <--No Item Listed To MarkDown-->
                </EmptyDataTemplate>
                <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#E3EAEB" ForeColor="Black" />
                <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F8FAFA" />
                <SortedAscendingHeaderStyle BackColor="#246B61" />
                <SortedDescendingCellStyle BackColor="#D4DFE1" />
                <SortedDescendingHeaderStyle BackColor="#15524A" />
            </asp:GridView>
        </div>
        <!-- (e) CHRIS-->

        <div >
            <%--            <strong>FURTHER MARKDOWN<br />
            </strong>--%>
<%--            <strong>FURTHER MARKDOWN<br />
            </strong>--%>
        </div>


        <asp:Panel ID="pnlNewItemModal" runat="server" CssClass="modal" 
             >
            <asp:Panel ID="pnlNewItemModalDrag" runat="server" CssClass="modalDrag">
                <div class="sizeLogo">
                    <img alt="new brand" src="../Resources/product.png" height="16" align="top" />
                    ITEM TO MARKDOWN
                </div>
            </asp:Panel>
            <div style="margin: 2px 2px; height: 26px;">
                <div class="SearchTextContainer">
                    SEARCH STYLE NO:
                    <asp:TextBox ID="txtSearchItem" Height="16px" Font-Size="10px" Width="120px" placeholder="Search Item"
                        CssClass="modalText" runat="server"></asp:TextBox>
                    <asp:ImageButton ID="iBtnSearchItems" runat="server" ImageUrl="~/Resources/search.png"
                        ImageAlign="AbsBottom" onclick="iBtnSearchItems_Click" />
                </div>
            </div>
            <div style="margin: 3px 3px;">
                <asp:GridView ID="gvItems" runat="server" AllowPaging="True" AllowSorting="True"
                    AutoGenerateColumns="False" CellPadding="4"
                    CssClass="table_grid" GridLines="None" OnPageIndexChanging="gvItems_PageIndexChanging"
                    OnSorting="gvItems_Sorting" 
                    onselectedindexchanged="gvItems_SelectedIndexChangedEx" 
                    DataSourceID="SqlDataSourceItems" 
                    onselectedindexchanging="gvItems_SelectedIndexChanging" 
                    onpageindexchanged="gvItems_PageIndexChanged">
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
                    SelectCommand="SELECT [StyleNo], [BrandName], [StyleDesc] FROM [Style] WHERE ([BrandName] = @BrandName) and StyleNo in (select StyleNo from STS) order by [StyleNo] desc"
                    EnableCaching="True">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="txtBrandName" Name="BrandName" PropertyName="Text"
                            Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <br />
                <asp:HiddenField ID="hfDuplicateStyle" runat="server" />
                <asp:ModalPopupExtender ID="hfDuplicateStylePopupExtender" runat="server" 
                                CancelControlID="btnDUplicateNo" DynamicServicePath="" Enabled="True" 
                                PopupControlID="pnlDuplicateNotifier" 
                                PopupDragHandleControlID="pnlDuplicateNotifiereModalDrag" 
                                TargetControlID="hfDuplicateStyle">
                            </asp:ModalPopupExtender>

            </div>
            <hr style="color: #BBB277;" />
            <div style="margin: 3px 5px; text-align: center;">
                <label class="modalLabel" for="MainContent_txtMarkDownPrice">
                    CURRENT PRICE:</label>
                    <asp:Label ID="lblPriceStatus" class="modalLabel" runat="server"></asp:Label>
                <br />
                <asp:TextBox ID="txtCurrentPrice" ReadOnly="true" Height="20px" CssClass="modalText"
                    runat="server" />
                <br />
                <label class="modalLabel" for="MainContent_txtMarkDownPrice">
                    INPUT MARKDOWN PRICE:</label>
                <br />
                <asp:TextBox ID="txtMarkDownPrice" Height="20px" CssClass="modalText" runat="server" />
                <br />
                <asp:Label ID="lblStyleListError" class="modalLabel" runat="server"></asp:Label>
            </div>
            <hr style="color: #BBB277;" />
            <div style="text-align: center; margin: 5px 0px;">
                <asp:Button ID="btnSelectItemOk" runat="server" Text="OK" CssClass="modalWarningButtonYes"
                    ToolTip="Delete" onclick="btnSelectItemOk_ClickEx"/> &nbsp
                <asp:Button ID="btnSelectItemNo" Width="85px" runat="server" Text="CANCEL" CssClass="modalWarningButtonNo"
                    ToolTip="Cancel" EnableViewState="False" Height="30px" 
                    onclick="btnSelectItemNo_Click" />
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
                        TextMode="MultiLine" Height="40" Width="500px"> </asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <label class="frmLabel" for="MainContent_txtFooter">
                        FOOTER:</label>
                </td>
                <td>
                    <asp:TextBox CssClass="modalText" ID="txtFooter" Font-Size="10px" runat="server"
                        TextMode="MultiLine" Height="150" Width="500px"> </asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <label class="frmLabel" for="MainContent_txtRemarks">
                        REMARKS:</label>
                </td>
                <td>
                    <asp:TextBox CssClass="modalText" ID="txtRemarks" Font-Size="10px" runat="server"
                        TextMode="MultiLine" Height="40" Width="500px"> </asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <label class="frmLabel" for="MainContent_rdioStatus">
                        STATUS:</label>
                </td>
                <td>
                    <asp:RadioButtonList ID="rdioStatus" CssClass="frmLabel" runat="server" RepeatDirection="Horizontal"
                        RepeatLayout="Flow" Visible="False">
                        <asp:ListItem>Pending</asp:ListItem>
                        <asp:ListItem>Approved</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
            </tr>
        </table>
    </div>



    <div style="text-align: center;">
        <div style="display: inline-block; margin-left: 5px;">
            <asp:Button ID="btnUpdateGeneralMemo" runat="server" Text="UPDATE" 
                CssClass="btnSave" onclick="btnUpdateGeneralMemo_ClickEx" Width="83px" />
        </div>
        <div style="display: inline-block; margin-left: 5px;">
            <a href="GeneralMemoConcession.aspx">
                <input id="btncancel" type="button" value="CANCEL" class="btnCancel" /></a>
        </div>
    </div>
    <asp:Panel ID="pnlAddMEmo" runat="server" CssClass="modal">
                        <asp:Panel ID="pnlAddMemoModalDrag" runat="server" CssClass="modalDrag">
                            <div class="close_btn">
                                <asp:ImageButton ID="ImageButton1" runat="server" CssClass="btnClose"
                                    ImageUrl="~/Resources/cancel_gray.png" ToolTip="CLOSE" />
                            </div>
                            <div class="sizeLogo">
                                <img alt="new brand" src="../Resources/users.png" height="15" align="top" />
                                MARKDOWN MEMO LIST
                            </div>
                        </asp:Panel>
                        <div style="padding: 2px 2px; height: 28px;">
                            <div class="SearchTextContainer">
                                SEARCH MEMO NO:
                                <asp:TextBox ID="txtAddMemoSearch" Height="16px" Font-Size="10px" Width="120px"
                                    placeholder="Search General Memo" CssClass="modalText" runat="server"></asp:TextBox>
                                <asp:ImageButton ID="btnSearch" runat="server" ImageUrl="~/Resources/search.png"
                                    ImageAlign="AbsBottom" onclick="btnMemoSearch_Click" />
                            </div>
                        </div>
                        <div style="padding: 3px 5px;">
                            <asp:GridView ID="gvAddMemo" runat="server" CellPadding="4" CssClass="table_grid"
                                GridLines="None" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False"
                                DataKeyNames="ID" DataSourceID="SqlDataSourceAddMemo" EnablePersistedSelection="True"
                                OnPageIndexChanging="gvAddMemo_PageIndexChanging" OnSelectedIndexChanged="gvAddMemo_SelectedIndexChanged"
                                OnSelectedIndexChanging="gvAddMemo_SelectedIndexChanging" 
                                OnSorting="gvAddMemo_Sorting" 
                                onpageindexchanged="gvAddMemo_PageIndexChanged">
                                <AlternatingRowStyle BackColor="White" />
                                <Columns>
                                    <asp:TemplateField>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox1" runat="server" Tooltip='<%# Eval("ID") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Image ID="Image1" runat="server" AlternateText='<%# Eval("ID") %>' Height="16px" ImageUrl="~/Resources/memo-doc.png" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:CommandField ShowSelectButton="True" />
                                    <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True"
                                        SortExpression="ID" Visible="False" />
                                    <asp:BoundField DataField="MemoNo" HeaderText="MEMO #" SortExpression="MemoNo">
                                    </asp:BoundField>
                                    <asp:BoundField DataField="MemoDate" HeaderText="MEMO DATE" 
                                        SortExpression="MemoDate" />
                                    <asp:BoundField DataField="BrandName" HeaderText="BRAND" 
                                        SortExpression="BrandName" />
                                    <asp:BoundField DataField="PriceType" HeaderText="PRICE TYPE" 
                                        SortExpression="PriceType" />
                                    <asp:BoundField DataField="FromDate" HeaderText="FROM DATE" 
                                        SortExpression="FromDate" />
                                    <asp:BoundField DataField="ToDate" HeaderText="TO DATE" 
                                        SortExpression="ToDate" />
                                    <asp:BoundField DataField="Status" HeaderText="STATUS" 
                                        SortExpression="Status" />
                                </Columns>
                                <EditRowStyle BackColor="#7C6F57" />
                                <EmptyDataTemplate>
                                    <img src="../Resources/unhappy.png" alt="WARNING" align="middle" />
                                    GENERAL MEMO NOT FOUND!!!
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
                            <asp:SqlDataSource ID="SqlDataSourceAddMemo" runat="server" ConnectionString="<%$ ConnectionStrings:IRMSConnectionString %>"

                                SelectCommand="SELECT [ID], [MemoNo], [MemoDate],[BrandName], [PriceType], [FromDate], [ToDate], [Status] FROM [GenMemo] WHERE ([BrandName] = @BrandName) ORDER BY [MemoDate] DESC">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="txtBrandName" Name="BrandName" 
                                        PropertyName="Text" Type="String" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </div>
                        <div style="text-align: center; padding: 3px 0;">
                            <asp:Button ID="btnAddMemoOk" CssClass="modalWarningButtonYes" runat="server"
                                Text="OK" ToolTip="Currently Disabled, please select from list." onclick="btnAddMemoOk_Click"
                                />
                            <asp:HiddenField ID="HiddenField1" runat="server" />
                            <asp:HiddenField ID="HiddenField2" runat="server" />
                            <asp:ModalPopupExtender ID="HiddenField2_ModalPopupExtender" runat="server" 
                                CancelControlID="btnDUplicateNo" DynamicServicePath="" Enabled="True" 
                                PopupControlID="pnlDuplicateNotifier" 
                                PopupDragHandleControlID="pnlDuplicateNotifiereModalDrag" 
                                TargetControlID="HiddenField2">
                            </asp:ModalPopupExtender>
                        </div>
                    </asp:Panel>


             <asp:Panel ID="pnlDuplicateNotifier" runat="server" CssClass="modal" >
                <asp:Panel ID="pnlDuplicateNotifiereModalDrag" runat="server" CssClass="modalDrag">
                    <div class="sizeLogo">
                     <img alt="new brand" src="../Resources/product_brand.png" height="16" align="top" />
                       MESSAGE BOX (DUPLICATE FOUND)
                    </div>
                </asp:Panel>

                <div style="text-align:center; color: black; font-family:Verdana; font-size:11px; margin:5px 2px;">
                        <asp:Label ID="lblDuplicate" runat="server" Text="Unable to add Style item(s), Style item(s) already exist!"></asp:Label>
                </div>
                <div style="text-align:center; color: black; font-family:Verdana; font-size:11px; margin:5px 2px;">
                        <asp:Label ID="lblDuplicateCount" runat="server" Text="{0} items found!"></asp:Label>
                </div>
                <div style="text-align:center;">
                    <center>                       
                    <asp:GridView ID="gvDuplicateList" runat="server">
                        <Columns>
                            <asp:BoundField DataField="StyleNumber" HeaderText="STYLE NO." />
                        </Columns>
                    </asp:GridView>
                     </center>
                </div>
                <div style=" text-align:center; margin: 5px 0px;">
                    <asp:Button ID="btnDUplicateNo" runat="server" Text="CLOSE" CssClass="modalWarningButtonNo" 
                        ToolTip="Close" EnableViewState="False" Width="76px" />
                </div>
            </asp:Panel>

             <asp:Panel ID="pnlMemoNoNotifier" runat="server" CssClass="modal" >
                <asp:Panel ID="pnlMemoNoNotifierModalDrag" runat="server" CssClass="modalDrag">
                    <div class="sizeLogo">
                     <img alt="new brand" src="../Resources/product_brand.png" height="16" align="top" />
                       MESSAGE BOX
                    </div>
                </asp:Panel>

                <div style="text-align:center; color: black; font-family:Verdana; font-size:11px; margin:5px 2px;">
                </div>
                <div style="text-align:center; color: black; font-family:Verdana; font-size:11px; margin:5px 2px;">
                        <asp:Label ID="lblNewMemoNo" runat="server" Text="Markdown Memo Updated ({0})!"></asp:Label>
                </div>
                <div style="text-align:center;">
                </div>
                <div style=" text-align:center; margin: 5px 0px;">
                    <asp:Button ID="btnCloseMemoNoNotifier" runat="server" Text="CLOSE" CssClass="modalWarningButtonNo" 
                        ToolTip="Close" EnableViewState="False" Width="76px" 
                        onclick="btnCloseMemoNoNotifier_Click" />

                <asp:HiddenField ID="hfMemoNo" runat="server" />
                <asp:ModalPopupExtender ID="hfMemoNoPopupExtender" runat="server" 
                                DynamicServicePath="" Enabled="True" 
                                PopupControlID="pnlMemoNoNotifier" 
                                PopupDragHandleControlID="pnlMemoNoNotifierModalDrag" 
                                TargetControlID="hfMemoNo">
                            </asp:ModalPopupExtender>
                </div>
            </asp:Panel>

            <%--a--%>
            <asp:Panel ID="pnlMarkupNotifier" runat="server" CssClass="modal" >
                <asp:Panel ID="pnlMarkupNotifierModalDrag" runat="server" CssClass="modalDrag">
                    <div class="sizeLogo">
                     <img alt="new brand" src="../Resources/product_brand.png" height="16" align="top" />
                       WARNING : MARKUP PRICE FOUND!
                    </div>
                </asp:Panel>

                <div style="text-align:center; color: black; font-family:Verdana; font-size:11px; margin:5px 2px;">
                </div>
                <div style="text-align:center; color: black; font-family:Verdana; font-size:11px; margin:5px 2px;">
                        <asp:Label ID="Label1" runat="server" Text="Markup Price Entry, Are you sure to continue?"></asp:Label>
                </div>
                <div style="text-align:center;">
                </div>
                <div style=" text-align:center; margin: 5px 0px;">
                
                    <asp:Button ID="btnMarkUpYes" runat="server" Text="YES" CssClass="modalWarningButtonYes" 
                        ToolTip="Close" EnableViewState="False" Width="76px" onclick="btnMarkUpYes_Click" 
                     />&nbsp
                     <asp:Button ID="btnMarkUpNo" runat="server" Text="NO" CssClass="modalWarningButtonNo" 
                        ToolTip="Close" EnableViewState="False" Width="76px" 
                     />

                <asp:HiddenField ID="hfMarkupAnswer" runat="server" />
                <asp:ModalPopupExtender ID="hfMarkupAnswerModalPopupExtender" runat="server" 
                                DynamicServicePath="" Enabled="True" 
                                PopupControlID="pnlMarkupNotifier" 
                                PopupDragHandleControlID="pnlMarkupNotifierModalDrag" 
                                TargetControlID="hfMarkupAnswer" CancelControlID="btnMarkUpNo">
                            </asp:ModalPopupExtender>
                </div>
            </asp:Panel>
    </asp:Content>

