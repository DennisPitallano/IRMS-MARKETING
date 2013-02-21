<%@ Page Title="" Language="C#" MasterPageFile="~/Marketing/Marketing.Master" AutoEventWireup="true"
    CodeBehind="UpdateGeneratedCodes-SKUs.aspx.cs" Inherits="IntegratedResourceManagementSystem.Marketing.UpdateGeneratedCodes_SKUs" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Src="~/Marketing/controls/UCLoader.ascx" TagName="LOADER" TagPrefix="UC" %>
<asp:Content ID="HeadContent" ContentPlaceHolderID="head" runat="server">
    <link href="../Styles/marketing-item-master.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../Scripts/jquery-1.7.2.min.js"></script>
    <link href="../Styles/grid.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/pull-out-letter.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/item-reprocess.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
    
        
    </script>
    <style type="text/css">
        .txtwatermark
        {
            color: #CCCCCC;
            font-style: italic;
            text-align: right;
            font-family: Verdana;
            font-size: 14px;
            height: 22px;
            width: 100px;
        }
        .barcode
        {
            width: 250px;
            margin-left: 5px;
        }
        .frmlbl
        {
            width: 150px;
            text-align: right;
        }
        .colorBg
        {
            /*09301212163*/
            background-color: #C9C9C9;
            background-image: -webkit-gradient(linear, left top, left bottom, from(#c9c9c9), to(#848484), color-stop(0.6, #a1a1a1));
            background-image: -moz-linear-gradient(top, #c9c9c9, #848484, #a1a1a1 90%);
        }
        .chkColor
        {
            padding: 5px 2px 2px 2px;
        }
        .btnSetActive
        {
            background: url('../Resources/undelete.png');
            background-repeat: no-repeat;
            height: 23px;
            cursor: pointer;
        }
        .btnSetInActive
        {
            background: url('../Resources/delete_gray.png');
            background-repeat: no-repeat;
            height: 23px;
            cursor: pointer;
        }
        .modalProductCategory
        {
            width: 270px;
            background-color: #999999;
            padding-bottom: 5px;
        }
        .modalProductCategoryDrag
        {
            background-color: #C9C9C9;
            background-image: -webkit-gradient(linear, left top, left bottom, from(#c9c9c9), to(#848484), color-stop(0.6, #a1a1a1));
            background-image: -moz-linear-gradient(top, #c9c9c9, #848484, #a1a1a1 90%);
            width: 270px;
            height: 25px;
            cursor: move;
        }
        .txtMoney
        {
            text-align: right;
            font-family: Verdana;
            font-size: 14px;
            height: 22px;
            width: 100px;
            color: #CC0000;
            font-weight: bold;
        }
    </style>
</asp:Content>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <asp:UpdatePanel ID="upnlGenerate" runat="server">
        <ContentTemplate>
            <div style="height: 20px; margin-bottom: 10px; font-family: Verdana; font-weight: bold;
                line-height: 20px; color: #333; text-shadow: 1px 1px 0px white;">
                <asp:Image ID="imgItem" runat="server" Height="20px" ImageAlign="Top" ImageUrl="~/Resources/product.png" />
                &nbsp;ITEM GENERATOR UPDATE
                <div style="float: right;">
                    <a href="ProductManagementPanel.aspx">
                        <img src="../Resources/reply.png" title="BACK" alt="BACK" /></a>
                </div>
                <hr />
            </div>
            <div style="text-align: center; margin-bottom: 5px;">
                <asp:UpdateProgress ID="uprogressGenerator" runat="server" AssociatedUpdatePanelID="upnlGenerate">
                    <ProgressTemplate>
                        <asp:PlaceHolder ID="plcHLoader" runat="server">
                            <UC:LOADER ID="loader" runat="server" />
                        </asp:PlaceHolder>
                    </ProgressTemplate>
                </asp:UpdateProgress>
            </div>
            <div style="min-height: 410px;">
                <div>
                    <asp:Panel ID="pnlGenerateItemCodeSKU" runat="server" Width="500px">
                        <div class="titleForm" style="height: 12px">
                            STYLE INFO.
                        </div>
                        <div class="form">
                            <table style="width: 100%;">
                                <tr>
                                    <td class="modalLabel">
                                        STYLE NUMBER:
                                    </td>
                                    <td colspan="3">
                                        <asp:TextBox ID="txtStyleNumber" runat="server" Width="250px" CssClass="modalText"
                                            Font-Names="Verdana" Font-Size="12px" Height="22px" ReadOnly="True"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="modalLabel">
                                        STYLE DESCRIPTION:
                                    </td>
                                    <td colspan="3">
                                        <asp:TextBox ID="txtStyleDescription" CssClass="modalText" runat="server" Width="250px"
                                            Font-Names="Verdana" Font-Size="12px" Height="22px" ReadOnly="True"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="modalLabel">
                                        SRP:
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtSRP" runat="server" CssClass="txtMoney" Enabled="False"></asp:TextBox>
                                        <asp:TextBoxWatermarkExtender ID="txtSRP_TextBoxWatermarkExtender" runat="server"
                                            Enabled="True" TargetControlID="txtSRP" WatermarkCssClass="txtwatermark" WatermarkText="0.00">
                                        </asp:TextBoxWatermarkExtender>
                                    </td>
                                    <td class="modalLabel">
                                        COST PRICE:
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtCostPrice" runat="server" CssClass="txtMoney" Enabled="False"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        &nbsp;
                                    </td>
                                    <td colspan="3">
                                        &nbsp;
                                        <asp:HiddenField ID="hfStartSeries" runat="server" />
                                        <asp:HiddenField ID="hfBrand" runat="server" />
                                        <asp:HiddenField ID="hfSRP" runat="server" />
                                        <asp:HiddenField ID="hfBrandStartSeries" runat="server" />
                                        <asp:HiddenField ID="hfStyleNumber" runat="server" />
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </asp:Panel>
                    <div style="font-family: Verdana; margin-bottom: 10px; margin-top: 10px;">
                        <img src="../Resources/edit_normal.png" alt="" align="left" />
                        <span class="modalText" style="font-weight: bold; font-size: 10px;">UPDATE OPTION:</span>
                        <asp:RadioButtonList ID="rdioUpdateOption" runat="server" AutoPostBack="True" Font-Bold="True"
                            Font-Names="Verdana" Font-Size="11px" ForeColor="#CC6600" OnSelectedIndexChanged="rdioUpdateOption_SelectedIndexChanged"
                            RepeatDirection="Horizontal" BackColor="#FFFFCC" BorderColor="#FF9933" BorderWidth="1px">
                            <asp:ListItem Selected="True">CANCEL GENERATED SKU&#39;S/ITEM CODES</asp:ListItem>
                            <asp:ListItem>ADD SKU&#39;S/ITEM CODES</asp:ListItem>
                            <asp:ListItem>UPDATE PRICE</asp:ListItem>
                        </asp:RadioButtonList>
                    </div>
                </div>
                <asp:MultiView ID="mvUpdateOption" runat="server" ActiveViewIndex="0">
                    <asp:View ID="vGeneratedSkus" runat="server">
                        <div class="modalDrag" style="height: 18px;">
                            <div class="sizeLogo">
                                <img src="../Resources/Barcode.png" alt="BarCode" height="16px" align="top" />
                                GENERATED SKU's and ITEM CODES
                            </div>
                        </div>
                        <asp:Panel ID="pnlGeneratedSKU" runat="server" ScrollBars="Auto">
                            <asp:Repeater ID="rptrSKU" runat="server">
                                <HeaderTemplate>
                                    <table width="100%">
                                        <tr>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <td>
                                        <div style="border: 1px Solid #d8d8d8; text-align: center; background-color: #FFF;
                                            margin: 1px 2px 1px 2px; text-shadow: 1px 1px 0px #E0E0E0; border-radius: 10px 2px 10px 2px;
                                            box-shadow: 0 1px rgba(255, 255, 255, .6); position: relative; z-index: 2; box-shadow: 1px 0 rgba(127, 127, 127, 0.25), 2px 0 rgba(127, 127, 127, 0.125), 3px 0 rgba(127, 127, 127, 0.0625), -1px 0 rgba(127, 127, 127, 0.25), -2px 0 rgba(127, 127, 127, 0.125), -3px 0 rgba(127, 127, 127, 0.0625), 0 1px rgba(127, 127, 127, 0.25), 0 2px rgba(127, 127, 127, 0.125), 0 3px rgba(127, 127, 127, 0.0625);">
                                            <asp:Label ID="lblStyleNumber" runat="server" Text='<%# Eval("ItemCode").ToString() %>'
                                                ForeColor="#993300" Font-Size="10px" Font-Names="Verdana"></asp:Label>
                                            <br />
                                            <asp:Image ID="imgBarcode" runat="server" ImageUrl="~/Resources/barcode_flat.jpg"
                                                Width="130px" ToolTip='<%# Eval("StyleDescription").ToString() %>' AlternateText='<%# Eval("ProductNumber")+"-"+ Eval("Price").ToString() %>' />
                                            <br />
                                            <asp:CheckBox ID="chkSKUNumber" Text='<%# Eval("SKU").ToString() %>' runat="server" />
                                            <br />
                                        </div>
                                    </td>
                                </ItemTemplate>
                                <FooterTemplate>
                                    </tr> </table>
                                </FooterTemplate>
                            </asp:Repeater>
                        </asp:Panel>
                        <div style="height: 30px; text-align: center; margin-top: 10px;">
                            <asp:Label ID="lblSelectedSkuToCancel" runat="server"></asp:Label>
                            <asp:ModalPopupExtender ID="lblSelectedSkuToCancel_ModalPopupExtender" runat="server"
                                CancelControlID="btnCancelSKUCancelation" DynamicServicePath="" Enabled="True"
                                PopupControlID="pnlSelectedSkusToCcancel" PopupDragHandleControlID="pnlSelectedSkusToCcancelDrag"
                                TargetControlID="lblSelectedSkuToCancel">
                            </asp:ModalPopupExtender>
                            <asp:Button ID="btnCancelSelectedSKUs" runat="server" Text="CANCEL SELECTED SKU/s"
                                CssClass="btnDelete" OnClick="btnCancelSelectedSKUs_Click" />
                        </div>
                        <asp:Panel ID="pnlSelectedSkusToCcancel" runat="server" CssClass="modal">
                            <asp:Panel ID="pnlSelectedSkusToCcancelDrag" runat="server" CssClass="modalDrag">
                                <div class="sizeLogo">
                                    <asp:Image ID="Image5" runat="server" Height="16px" ImageAlign="AbsBottom" ImageUrl="~/Resources/barcode.png" />
                                    &nbsp;CONFIRM CANCELLATION!
                                </div>
                            </asp:Panel>
                            <div style="font-family: Verdana; color: White; text-align: center;">
                                LIST OF SKU TO BE CANCEL</div>
                            <div style="margin-left: 10px; margin-right: 10px; margin-top: 5px;">
                                <asp:GridView ID="gvSelectedSKUToCancel" CssClass="table_grid" runat="server" Font-Names="Verdana"
                                    Font-Size="11px" ForeColor="#333333" AutoGenerateColumns="False" CellPadding="4"
                                    GridLines="None">
                                    <AlternatingRowStyle BackColor="White" />
                                    <Columns>
                                        <asp:BoundField DataField="ItemCode" HeaderText="ITEM CODE">
                                            <HeaderStyle Wrap="False" />
                                            <ItemStyle Wrap="False" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="SKU" HeaderText="SKU BARCODE">
                                            <HeaderStyle Wrap="False" />
                                            <ItemStyle Wrap="False" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="Price" DataFormatString="{0:Php###,###.00}" HeaderText="SRP" />
                                    </Columns>
                                    <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                                    <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                                    <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                                    <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                                    <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                                    <SortedAscendingCellStyle BackColor="#FDF5AC" />
                                    <SortedAscendingHeaderStyle BackColor="#4D0000" />
                                    <SortedDescendingCellStyle BackColor="#FCF6C0" />
                                    <SortedDescendingHeaderStyle BackColor="#820000" />
                                </asp:GridView>
                            </div>
                            <div style="margin: 7px 10px; text-align: center;">
                                <asp:Button ID="btnContinueSKUCancelation" runat="server" Text="CONTINUE CANCELATION"
                                    CssClass="modalWarningButtonYes" Width="185px" ToolTip="Continue Cancellation"
                                    OnClick="btnContinueSKUCancelation_Click" />
                                <asp:Button ID="btnCancelSKUCancelation" runat="server" Text="CANCEL" Width="85px"
                                    CssClass="modalWarningButtonNo" ToolTip="Cancel" />
                            </div>
                        </asp:Panel>
                        <asp:RoundedCornersExtender ID="pnlSelectedSkusToCcancel_RoundedCornersExtender"
                            runat="server" Enabled="True" TargetControlID="pnlSelectedSkusToCcancel">
                        </asp:RoundedCornersExtender>
                        <asp:DropShadowExtender ID="pnlSelectedSkusToCcancel_DropShadowExtender" runat="server"
                            Enabled="True" Opacity="0.75" Rounded="True" TargetControlID="pnlSelectedSkusToCcancel">
                        </asp:DropShadowExtender>
                    </asp:View>
                    <asp:View ID="vAddNewSkus" runat="server">
                        <asp:UpdatePanel ID="upnlGeneratedSKUPreview" runat="server">
                            <ContentTemplate>
                                <asp:Panel ID="pnlGeneratedSKUS" runat="server" Width="370px" CssClass="modal">
                                    <div class="modalDrag" style="font-family: Verdana; color: White; margin: 0px 0px 5px 0px;">
                                        <div class="sizeLogo">
                                            <img src="../Resources/Barcode.png" height="16px" align="top" />
                                            GENERATED SKU's/ITEM CODE</div>
                                    </div>
                                    <asp:Panel ID="pnlGeneratedSKUsContainer" runat="server" Height="250px" ScrollBars="Auto">
                                        <div style="margin-left: 2px;">
                                            <asp:GridView ID="gvGeneratedSKUS" runat="server" Font-Names="Verdana" Font-Size="10px"
                                                AutoGenerateColumns="False" ForeColor="Black" BackColor="White" BorderColor="#CCCCCC"
                                                BorderStyle="None" BorderWidth="1px" CellPadding="4" GridLines="Horizontal" OnSelectedIndexChanged="gvGeneratedSKUS_SelectedIndexChanged"
                                                DataKeyNames="ItemCode" EnablePersistedSelection="True">
                                                <Columns>
                                                    <asp:BoundField DataField="ItemCode" HeaderText="ITEM CODE">
                                                        <ItemStyle Wrap="False" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="SKU" HeaderText="SKU" />
                                                    <asp:BoundField DataField="Price" HeaderText="PRICE" DataFormatString="{0:Php###,###.00}">
                                                        <HeaderStyle Wrap="False" />
                                                        <ItemStyle HorizontalAlign="Center" Wrap="False" Font-Bold="True" ForeColor="#CC6600" />
                                                    </asp:BoundField>
                                                    <asp:TemplateField>
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                                                        </EditItemTemplate>
                                                        <ItemTemplate>
                                                            <asp:Image ID="imgProduct" runat="server" Height="16px" ImageUrl="~/Resources/Barcode.png"
                                                                ToolTip='<%# Eval("StyleDescription").ToString() %>' AlternateText='<%# Eval("ProductNumber") %>' />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:CommandField ShowSelectButton="True">
                                                        <ItemStyle Font-Names="Verdana" Font-Size="10px" />
                                                    </asp:CommandField>
                                                </Columns>
                                                <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                                                <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                                                <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                                                <SelectedRowStyle BackColor="#CC3333" Font-Bold="False" ForeColor="White" Font-Italic="True" />
                                                <SortedAscendingCellStyle BackColor="#F7F7F7" />
                                                <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                                                <SortedDescendingCellStyle BackColor="#E5E5E5" />
                                                <SortedDescendingHeaderStyle BackColor="#242121" />
                                            </asp:GridView>
                                        </div>
                                    </asp:Panel>
                                    <div style="margin-top: 3px; margin-bottom: 3px; text-align: center;">
                                        <asp:Button ID="btnActivateSku" runat="server" Text="ACTIVATE" CssClass="btnSetActive"
                                            BackColor="#CC6600" Font-Names="Verdana" Font-Size="11px" Width="95px" ForeColor="#FFFFCC"
                                            Visible="False" OnClick="btnActivateSku_Click" />
                                        <asp:RoundedCornersExtender ID="btnActivateSku_RoundedCornersExtender" runat="server"
                                            Enabled="True" TargetControlID="btnActivateSku" BorderColor="LightGray">
                                        </asp:RoundedCornersExtender>
                                        <asp:Button ID="btnDeActivate" runat="server" Text="CANCEL SKU" CssClass="btnSetInActive"
                                            BackColor="#CC6600" Font-Names="Verdana" Font-Size="11px" Width="107px" ForeColor="#FFFFCC"
                                            OnClick="btnDeActivate_Click" />
                                        <asp:RoundedCornersExtender ID="RoundedCornersExtender1" runat="server" Enabled="True"
                                            TargetControlID="btnDeActivate" BorderColor="YellowGreen">
                                        </asp:RoundedCornersExtender>
                                    </div>
                                </asp:Panel>
                                <asp:AlwaysVisibleControlExtender ID="pnlGeneratedSKUS_AlwaysVisibleControlExtender"
                                    runat="server" Enabled="True" HorizontalSide="Right" TargetControlID="pnlGeneratedSKUS"
                                    UseAnimation="True" VerticalSide="Middle">
                                </asp:AlwaysVisibleControlExtender>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                        <asp:UpdatePanel ID="upnlGeneratePreview" runat="server">
                            <ContentTemplate>
                                <div style="margin-bottom: 10px;">
                                    <div>
                                        <asp:Image ID="imgColors" runat="server" Height="21px" ImageUrl="~/Resources/color.png"
                                            ImageAlign="AbsBottom" />
                                        COLORS:
                                    </div>
                                    <div style="margin-top: 10xp;">
                                        <asp:Panel ID="pnlColors" runat="server" Width="700px" ScrollBars="Auto">
                                            <asp:CheckBoxList ID="ColorchkBxs"  runat="server" Font-Names="Verdana" Font-Size="11px"
                                                RepeatDirection="Horizontal" AutoPostBack="True" OnSelectedIndexChanged="ColorchkBxs_SelectedIndexChanged"
                                                CssClass="chkColor" RepeatColumns="8" BackColor="#CCCCCC" BorderColor="#666666"
                                                BorderWidth="1px">
                                            </asp:CheckBoxList>
                                        </asp:Panel>
                                    </div>
                                </div>
                                <div style="margin-bottom: 10px;">
                                    <div style="margin-bottom: 10px;">
                                        <asp:Image ID="imgSizes" runat="server" ImageUrl="~/Resources/size.png" Height="20px"
                                            ImageAlign="AbsBottom" />&nbsp;SIZES:&nbsp;&nbsp;
                                        <asp:Label ID="Label6" runat="server" Text="FILTER:" Font-Names="Verdana" Font-Size="11px"
                                            ForeColor="#996600"></asp:Label>
                                        <asp:CheckBoxList ID="chkSizeGroup" style="line-height:20px;" runat="server" BackColor="#FFFFCC" BorderColor="#FFCC66"
                                            BorderStyle="Solid" BorderWidth="1px" DataSourceID="SqlDataSourceGroupSize" DataTextField="SIZE_GROUP"
                                            DataValueField="RECORD_NO" Font-Names="Verdana" Font-Size="10px" ForeColor="#336699"
                                            RepeatDirection="Horizontal" RepeatLayout="Flow" AutoPostBack="True" OnSelectedIndexChanged="chkSizeGroup_SelectedIndexChanged">
                                        </asp:CheckBoxList>
                                        <asp:SqlDataSource ID="SqlDataSourceGroupSize" runat="server" ConnectionString="<%$ ConnectionStrings:IRMSConnectionString %>"
                                            SelectCommand="SELECT * FROM [SIZE_GROUP]" EnableCaching="True"></asp:SqlDataSource>
                                    </div>
                                    <asp:Panel ID="pnlSizes" runat="server">
                                        <asp:CheckBoxList ID="SizeschkBxs" runat="server" RepeatDirection="Horizontal" AutoPostBack="True"
                                            Font-Names="Verdana" Font-Size="10px" OnSelectedIndexChanged="SizeschkBxs_SelectedIndexChanged"
                                            RepeatColumns="5" BackColor="#CCCCCC" BorderColor="#666666" BorderWidth="1px"
                                            ForeColor="#993300">
                                        </asp:CheckBoxList>
                                    </asp:Panel>
                                </div>
                                <asp:Panel ID="Panel1" runat="server" ScrollBars="Auto">
                                    <asp:Repeater ID="Repeater1" runat="server">
                                        <HeaderTemplate>
                                            <table width="100%">
                                                <tr>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <td>
                                                <div style="border: 1px Solid #d8d8d8; text-align: center; background-color: #FFF;
                                                    margin: 1px 2px 1px 2px; text-shadow: 1px 1px 0px #E0E0E0; border-radius: 10px 2px 10px 2px;
                                                    box-shadow: 0 1px rgba(255, 255, 255, .6); position: relative; z-index: 2; box-shadow: 1px 0 rgba(127, 127, 127, 0.25), 2px 0 rgba(127, 127, 127, 0.125), 3px 0 rgba(127, 127, 127, 0.0625), -1px 0 rgba(127, 127, 127, 0.25), -2px 0 rgba(127, 127, 127, 0.125), -3px 0 rgba(127, 127, 127, 0.0625), 0 1px rgba(127, 127, 127, 0.25), 0 2px rgba(127, 127, 127, 0.125), 0 3px rgba(127, 127, 127, 0.0625);">
                                                    <asp:Label ID="lblStyleNumber1" runat="server" Text='<%# Eval("ItemCode").ToString() %>'
                                                        ForeColor="#993300" Font-Size="10px" Font-Names="Verdana"></asp:Label>
                                                    <br />
                                                    <asp:Image ID="imgBarcode" runat="server" ImageUrl="~/Resources/barcode_flat.jpg"
                                                        Width="130px" />
                                                    <br />
                                                    <asp:Label ID="lblSKUNumber1" runat="server" CssClass="barcode" Text='<%# Eval("SKUNumber").ToString() %>'></asp:Label>
                                                </div>
                                            </td>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            </tr> </table>
                                        </FooterTemplate>
                                    </asp:Repeater>
                                </asp:Panel>
                                <div style="text-align: center; padding: 3px 3px;">
                                    <asp:Panel ID="pnlError" runat="server" BackColor="#FFFF99" Visible="False" BorderColor="#CC3300"
                                        BorderWidth="1px">
                                        <asp:Image ID="imgError" runat="server" ImageUrl="~/Resources/warning.png" Height="22px"
                                            ImageAlign="AbsMiddle" />
                                        <asp:Label ID="lblErrorGenerated" runat="server" Font-Names="Verdana" ForeColor="#FF3300"
                                            Font-Bold="True" Font-Size="12px"></asp:Label>
                                    </asp:Panel>
                                </div>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                        <div style="margin-top: 10px; text-align: center;">
                            <asp:Button ID="btnGenerate" runat="server" Text="GENERATE" CssClass="btnGenerateCodeSKU"
                                OnClick="btnGenerate_Click" />
                        </div>
                    </asp:View>
                    <asp:View ID="VUpdatePrice" runat="server">
                    <div style="margin:5px 5px; height:32px;">
                        <asp:Button ID="btnUpdatePrice" runat="server" CssClass="btnUpdate" Text="UPDATE SRP" />
                        <asp:ModalPopupExtender ID="btnUpdatePrice_ModalPopupExtender" runat="server" 
                            DynamicServicePath="" Enabled="True" PopupControlID="pnlUpdateSRPModal" PopupDragHandleControlID="pnlUpdateSRPModalDrag"
                             CancelControlID="btnCancelSaveUpdateSRP" TargetControlID="btnUpdatePrice">
                        </asp:ModalPopupExtender>
                        <asp:Panel CssClass="modal" ID="pnlUpdateSRPModal" runat="server">  
                            <asp:Panel CssClass="modalDrag" ID="pnlUpdateSRPModalDrag" runat="server">
                                <div class="sizeLogo">
                                    UPDATE SRP
                                </div>
                            </asp:Panel>
                            <div class="modalLabel" style="text-align:center; height:40px; margin:3px;">
                                <img src="../Resources/warning.png" alt="" align="left" />
                                This action will affect all products constraints <br /> to this style number : <span>
                                    <asp:Label CssClass="modalText" style="padding-right:3px;" 
                                    ID="lblStyleNnumber" runat="server" Font-Bold="False" Font-Italic="True" 
                                    ForeColor="#993300" /> </span>.
                                    <br />
                                <asp:HyperLink ID="hpLinkAffectedProducts" Target="_blank" style="cursor:pointer;" runat="server">view affected data</asp:HyperLink>
                            </div>
                            <hr />
                            <div class="modalLabel" style="text-align:center; margin:5px;">
                               ENTER NEW SRP:
                                <asp:TextBox CssClass="modalText" Height="22px" Width="60px" ID="txtUpdateSRP" runat="server" />
                            </div>
                            <div style="text-align:center; margin:5px;">
                                <asp:Button ID="btnSaveUpdateSRP" runat="server" Width="75px" 
                                    CssClass="btnSave" Text="UPDATE" onclick="btnSaveUpdateSRP_Click" />
                                  <asp:Button ID="btnCancelSaveUpdateSRP" runat="server" CssClass="btnCancel" Text="CANCEL" />
                            </div>
                        </asp:Panel>
                    </div>
                    <div>
                        <div class="modal" style="min-height: 100px; float:left; margin-bottom: 10px; margin-right:10px;">
                            <div class="modalDrag">
                                <div class="sizeLogo">
                                    CONCESSION PRICE PER GROUP
                                </div>
                            </div>
                            <div>
                                <asp:DataList ID="DListPrice" runat="server" DataSourceID="SqlDataSourcePrice">
                                    <ItemTemplate>
                                        <div class="history-item" style="margin:2px 10px; min-width:350px; min-height:50px;">
                                            <div style="float: left; margin-right: 5px;">
                                                PRICE GROUP .50:
                                                <asp:Label ID="Price1Label" runat="server" Text='<%# Eval("Price1") %>' ForeColor="#CC0000"
                                                    Font-Bold="true" />
                                                <br />
                                                PRICE GROUP .75:
                                                <asp:Label ID="Price2Label" runat="server" Text='<%# Eval("Price2") %>' ForeColor="#CC0000"
                                                    Font-Bold="true" />
                                                <br />
                                                PRICE GROUP .95:
                                                <asp:Label ID="Price3Label" runat="server" Text='<%# Eval("Price3") %>' ForeColor="#CC0000"
                                                    Font-Bold="true" />
                                                <br />
                                                PRICE GROUP 1.00:
                                                <asp:Label ID="Price4Label" runat="server" Text='<%# Eval("Price4") %>' ForeColor="#CC0000"
                                                    Font-Bold="true" />
                                                <br />
                                            </div>
                                            
                                            <div style="display: inline-block;">
                                               
                                                SPECIAL PRICE GROUP:
                                                <asp:Label ID="Price10Label" runat="server" Text='<%# Eval("Price10") %>' ForeColor="#CC0000"
                                                    Font-Bold="true" />
                                                <br />
                                                PRICE GROUP .97:
                                                <asp:Label ID="Price11Label" runat="server" Text='<%# Eval("Price11") %>' ForeColor="#CC0000"
                                                    Font-Bold="true" />
                                                <br />
                                                PRICE GROUP .99:
                                                <asp:Label ID="Price14Label" runat="server" Text='<%# Eval("Price14") %>' ForeColor="#CC0000"
                                                    Font-Bold="true" />
                                                <br />
                                            </div>
                                        </div>
                                    </ItemTemplate>
                                </asp:DataList>
                                <asp:SqlDataSource ID="SqlDataSourcePrice" runat="server" ConnectionString="<%$ ConnectionStrings:IRMSConnectionString %>"
                                    SelectCommand="SELECT 
      [StyleNo]
      ,CAST([Price1] as decimal(18,2) ) AS Price1 
      ,CAST([Price2] as decimal(18,2) ) AS Price2
      ,CAST([Price3] as decimal(18,2) ) AS Price3
      ,CAST([Price4] as decimal(18,2) ) AS Price4
      ,CAST([Price5] as decimal(18,2) ) AS Price5
      ,CAST([Price6] as decimal(18,2) ) AS Price6
      ,CAST([Price7] as decimal(18,2) ) AS Price7
      ,CAST([Price8] as decimal(18,2) ) AS Price8
      ,CAST([Price9] as decimal(18,2) ) AS Price9
      ,CAST([Price10] as decimal(18,2) ) AS Price10
      ,CAST([Price11] as decimal(18,2) ) AS Price11
      ,CAST([Price12] as decimal(18,2) ) AS Price12
      ,CAST([Price13] as decimal(18,2) ) AS Price13
      ,CAST([Price14] as decimal(18,2) ) AS Price14
      ,CAST([Price15] as decimal(18,2) ) AS Price15
      ,CAST([Price16] as decimal(18,2) ) AS Price16
  FROM [IRMS-DB].[dbo].[Price]
WHERE StyleNo =@STYLE_NUMBER
">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="hfStyleNumber" Name="STYLE_NUMBER" PropertyName="Value" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </div>
                        </div>
                        <div class="modal" style="min-height: 100px; float:left; margin-bottom: 5px;">
                            <div class="modalDrag">
                                <div class="sizeLogo">
                                    OUTRIGHT PRICE PER GROUP
                                </div>
                            </div>
                            <div>
                             <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSourcePrice">
                                    <ItemTemplate>
                                        <div class="history-item" style="margin: 2px 10px; min-width: 350px;">
                                            <div style="display: inline-block;">
                                                PRICE GROUP -28.5%:
                                                <asp:Label ID="Price5Label" runat="server" Text='<%# Eval("Price5") %>' ForeColor="#CC0000"
                                                    Font-Bold="true" />
                                                <br />
                                                PRICE GROUP -25%:
                                                <asp:Label ID="Price6Label" runat="server" Text='<%# Eval("Price6") %>' ForeColor="#CC0000"
                                                    Font-Bold="true" />
                                                <br />
                                                PRICE GROUP -30%:
                                                <asp:Label ID="Price7Label" runat="server" Text='<%# Eval("Price7") %>' ForeColor="#CC0000"
                                                    Font-Bold="true" />
                                                <br />
                                                PRICE GROUP -35%:
                                                <asp:Label ID="Price8Label" runat="server" Text='<%# Eval("Price8") %>' ForeColor="#CC0000"
                                                    Font-Bold="true" />
                                                <br />
                                            </div>
                                            <div style="display: inline-block;">
                                                PRICE GROUP -40%:
                                                <asp:Label ID="Price9Label" runat="server" Text='<%# Eval("Price9") %>' ForeColor="#CC0000"
                                                    Font-Bold="true" />
                                                <br />
                                                PRICE GROUP -15%:
                                                <asp:Label ID="Price12Label" runat="server" Text='<%# Eval("Price12") %>' ForeColor="#CC0000"
                                                    Font-Bold="true" />
                                                <br />
                                                PRICE GROUP -20%:
                                                <asp:Label ID="Price13Label" runat="server" Text='<%# Eval("Price13") %>' ForeColor="#CC0000"
                                                    Font-Bold="true" />
                                                <br />
                                                PRICE GROUP -31%:
                                                <asp:Label ID="Price15Label" runat="server" Text='<%# Eval("Price15") %>' ForeColor="#CC0000"
                                                    Font-Bold="true" />
                                                <br />
                                            </div>
                                            <div style="display: inline-block;">
                                                PRICE GROUP -45%:
                                                <asp:Label ID="Price16Label" runat="server" Text='<%# Eval("Price16") %>' ForeColor="#CC0000"
                                                    Font-Bold="true" />
                                                <br />
                                            </div>
                                        </div>
                                    </ItemTemplate>
                                </asp:DataList>
                            </div>
                        </div>
                    </div>
                    </asp:View>
                </asp:MultiView>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
