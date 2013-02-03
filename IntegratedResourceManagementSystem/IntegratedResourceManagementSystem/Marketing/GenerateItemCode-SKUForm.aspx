<%@ Page Title="" Language="C#" MasterPageFile="~/Marketing/Marketing.Master" AutoEventWireup="true"
    CodeBehind="GenerateItemCode-SKUForm.aspx.cs" Inherits="IntegratedResourceManagementSystem.Marketing.GenerateItemCode_SKUForm" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Src="~/Marketing/controls/UCLoader.ascx" TagName="LOADER" TagPrefix="UC" %>
<asp:Content ID="HeadContent" ContentPlaceHolderID="head" runat="server">
    <link href="../Styles/marketing-item-master.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
         .txtMoney
        {
            text-align:right;
            font-family:Verdana;
            font-size:14px;
            height:22px;
             width:100px;
            color:#CC0000;
             font-weight:bold;
            
        }
         .txtwatermark
     {
         color: #CCCCCC;
         font-style:italic;
         text-align:right;
        font-family:Verdana;
        font-size:14px;
        height:22px;
            width:100px;
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
            background-color: #C9C9C9;
            background-image: -webkit-gradient(linear, left top, left bottom, from(#c9c9c9), to(#848484), color-stop(0.6, #a1a1a1));
            background-image: -moz-linear-gradient(top, #c9c9c9, #848484, #a1a1a1 90%);
        }
        .chkColor
        {
            padding: 5px 2px 2px 2px;
        }
        </style>
</asp:Content>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div style="height:20px; margin-bottom:10px; line-height:20px; color: #333;text-shadow: 1px 1px 0px white;">
        <asp:Image ID="Image2" runat="server" Height="20px" ImageAlign="AbsBottom" ImageUrl="~/Resources/product.png" />
        &nbsp;<asp:Label ID="Label4" runat="server" Text="ITEM GENERATOR" Font-Bold="True"
            Font-Names="Verdana" Font-Size="12px" ForeColor="#CC6600"></asp:Label>
        &nbsp;
        <div style="float: right;">
            <asp:ImageButton ID="imgBtnBack" runat="server" ImageUrl="~/Resources/reply.png"
                PostBackUrl="~/Marketing/ProductManagementPanel.aspx" ToolTip="BACK" />
        </div>
        <hr />
    </div>
    <asp:UpdatePanel ID="upnlGenerate" runat="server">
        <ContentTemplate>
            <div style="text-align: center; margin-bottom: 5px;">
                <asp:UpdateProgress ID="uprogressGenerator" runat="server" AssociatedUpdatePanelID="upnlGenerate">
                    <ProgressTemplate>
                        <asp:PlaceHolder ID="plcHLoader" runat="server">
                            <UC:LOADER ID="loader" runat="server" />
                        </asp:PlaceHolder>
                    </ProgressTemplate>
                </asp:UpdateProgress>
            </div>
            <div>
                <asp:Panel ID="pnlGenerateItemCodeSKU" runat="server" Width="700px">
                    <div>
                        <table style="width: 100%;">
                            <tr>
                                <td class="frmlbl">
                                    STYLE NUMBER:
                                </td>
                                <td colspan="3">
                                    <asp:TextBox ID="txtStyleNumber" CssClass="modalText" runat="server" Width="250px" Font-Names="Verdana"
                                        Font-Size="12px" ForeColor="#993300" ReadOnly="True"></asp:TextBox>
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                                 <td  rowspan ="3" valign="top">
                                      <div style="background-color:#FFFFCC; border:1px Solid #FFCC66; padding:3px 3px; width:200px;
                                            -moz-border-radius:30px 40px 40px 2px; -webkit-border-radius:30px 1px 1px 2px; border-radius:30px 40px 40px 2px; ">
                                               <asp:Image ID="Image3" runat="server" ImageUrl="~/Resources/edit_normal.png" 
                                                   ImageAlign="AbsMiddle" />  
                                                <asp:Label ID="Label8" runat="server" Text="NOTE:" Font-Italic="True" 
                                                   Font-Names="Verdana"></asp:Label>
                                            <br />
                                            <br />
                                               <asp:Label ID="Label3" runat="server" Text="SRP" Font-Bold="True" 
                                                   Font-Names="Verdana" ForeColor="#CC6600" Font-Size="12px"></asp:Label>
                                               -Manual Input
                                                <br />
                                               <asp:Label ID="Label7" runat="server" Text="COST PRICE" Font-Bold="True" 
                                                   Font-Names="Verdana" ForeColor="#CC6600" Font-Size="12px"></asp:Label>
                                               -Manual Input
                                           </div>
                                </td>
                            </tr>
                            <tr>
                                <td class="frmlbl">
                                    STYLE DESCRIPTION:
                                </td>
                                <td colspan="3">
                                    <asp:TextBox ID="txtStyleDescription" CssClass="modalText" runat="server" Width="250px" Font-Names="Verdana"
                                        Font-Size="12px" ForeColor="#993300" ReadOnly="True"></asp:TextBox>
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                                
                            </tr>
                            <tr>
                                        <td class="frmlbl">
                                            COST PRICE:</td>
                                        <td >
                                            <asp:TextBox ID="txtCostPrice" runat="server" CssClass="txtMoney"></asp:TextBox>
                                            <asp:TextBoxWatermarkExtender ID="txtCostPrice_TextBoxWatermarkExtender" 
                                                runat="server" Enabled="True" TargetControlID="txtCostPrice" 
                                                WatermarkCssClass="txtwatermark" WatermarkText="0.00">
                                            </asp:TextBoxWatermarkExtender>
                                        </td>
                                         <td class="frmlbl" style="width:50px;"> 
                                            SRP:</td>
                                             <td>
                                            <asp:TextBox ID="txtSRP" runat="server" placeholder="0.00"  CssClass="txtMoney"></asp:TextBox>
                                            
                                        </td>
                                        <td>
                                            &nbsp;</td>
                                        
                                       
                                       
                                      <td></td>
                                    </tr>
                            <tr>
                                <td>
                                    &nbsp;
                                </td>
                                <td colspan="3">
                                    &nbsp;
                                    <asp:HiddenField ID="hfStartSeries" runat="server" />
                                    <asp:HiddenField ID="hfBrand" runat="server" />
                                    <asp:HiddenField ID="hfBrandStartSeries" runat="server" />
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
                </asp:Panel>
                <div style="margin-bottom: 10px;">
                    <div>
                        <asp:Image ID="imgColors" runat="server" Height="21px" ImageUrl="~/Resources/color.png"
                            ImageAlign="AbsBottom" />
                        COLORS:
                    </div>
                    <asp:Panel ID="pnlColors" runat="server" Width="700px" ScrollBars="Auto">
                        <asp:CheckBoxList ID="ColorchkBxs" runat="server" Font-Names="Verdana" Font-Size="11px"
                            RepeatDirection="Horizontal" AutoPostBack="True" OnSelectedIndexChanged="ColorchkBxs_SelectedIndexChanged"
                            CssClass="chkColor" RepeatColumns="8" BackColor="#CCCCCC" BorderColor="#666666"
                            BorderWidth="1px">
                        </asp:CheckBoxList>
                    </asp:Panel>
                </div>
                <div style="margin-bottom: 10px;">
                    <div style="margin-bottom: 10px;">
                        <asp:Image ID="imgSizes" runat="server" ImageUrl="~/Resources/size.png" Height="20px"
                            ImageAlign="AbsBottom" />&nbsp;SIZES:&nbsp;&nbsp;
                        <asp:Label ID="Label6" runat="server" Text="FILTER BY SIZE GROUP:" Font-Names="Verdana"
                            Font-Size="11px" ForeColor="#996600"></asp:Label>
                        <asp:CheckBoxList ID="chkSizeGroup" runat="server" BackColor="#FFFFCC" BorderColor="#FFCC66"
                            BorderStyle="Solid" BorderWidth="1px" DataSourceID="SqlDataSourceGroupSize" DataTextField="SIZE_GROUP"
                            DataValueField="RECORD_NO" Font-Names="Verdana" Font-Size="10px" ForeColor="#336699"
                            RepeatDirection="Horizontal" RepeatLayout="Flow" AutoPostBack="True" OnSelectedIndexChanged="chkSizeGroup_SelectedIndexChanged">
                        </asp:CheckBoxList>
                        <asp:SqlDataSource ID="SqlDataSourceGroupSize" runat="server" ConnectionString="<%$ ConnectionStrings:IRMSConnectionString %>"
                            SelectCommand="SELECT * FROM [SIZE_GROUP]"></asp:SqlDataSource>
                    </div>
                    <asp:Panel ID="pnlSizes" runat="server">
                        <asp:CheckBoxList ID="SizeschkBxs" runat="server" RepeatDirection="Horizontal" AutoPostBack="True"
                            Font-Names="Verdana" Font-Size="10px" OnSelectedIndexChanged="SizeschkBxs_SelectedIndexChanged"
                            RepeatColumns="5" BackColor="#CCCCCC" BorderColor="#666666" BorderWidth="1px"
                            ForeColor="#993300">
                        </asp:CheckBoxList>
                    </asp:Panel>
                </div>
                <div>
                    <asp:Image ID="imgSku" runat="server" ImageUrl="~/Resources/Barcode.png" Height="18px"
                        ImageAlign="AbsBottom" />&nbsp;PREVIEW OF ITEM CODES(top label) AND SKU&#39;s(bottom
                    label)</div>
                <asp:Panel ID="pnlGeneratedSKU" runat="server" ScrollBars="Auto">
                    <asp:Repeater ID="rptrSKU" runat="server">
                        <HeaderTemplate>
                            <table width="100%">
                                <tr>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <td>
                              <div style="border:1px Solid #d8d8d8; text-align:center; background-color:#FFF; margin:1px 2px 1px 2px;
                                    text-shadow: 1px 1px 0px #E0E0E0; border-radius:10px 2px 10px 2px; box-shadow:0 1px rgba(255, 255, 255, .6); 
                                     position:relative; z-index:2;  
                                      box-shadow:1px 0 rgba(127, 127, 127, 0.25), 2px 0 rgba(127, 127, 127, 0.125), 3px 0 rgba(127, 127, 127, 0.0625), -1px 0 rgba(127, 127, 127, 0.25), -2px 0 rgba(127, 127, 127, 0.125), -3px 0 rgba(127, 127, 127, 0.0625), 0 1px rgba(127, 127, 127, 0.25), 0 2px rgba(127, 127, 127, 0.125), 0 3px rgba(127, 127, 127, 0.0625);">
                                <asp:Label ID="lblStyleNumber" runat="server" Text='<%# Eval("ItemCode").ToString() %>'
                                    ForeColor="#993300" Font-Size="10px" Font-Names="Verdana"></asp:Label><br />
                                <asp:Image ID="Image1" runat="server" ImageUrl="~/Resources/barcode_flat.jpg" Width="130px" /><br />
                                <asp:Label ID="lblSKUNumber" runat="server" CssClass="barcode" Text='<%# Eval("SKUNumber").ToString() %>'></asp:Label>
                                </div>
                            </td>
                        </ItemTemplate>
                        <FooterTemplate>
                            </tr> </table>
                        </FooterTemplate>
                    </asp:Repeater>
                </asp:Panel>
                <div style="margin-top: 10px; width: 500px;">
                    <asp:Button ID="btnGenerate" runat="server" Text="GENERATE" CssClass="btnGenerateCodeSKU"
                        OnClick="btnGenerate_Click" />
                    <div style="float: right;">
                        <asp:ImageButton ID="ibtnBack" runat="server" ImageUrl="~/Resources/reply.png" OnClick="ibtnBack_Click"
                            ToolTip="BACK" ImageAlign="AbsMiddle" />
                        <asp:LinkButton ID="lnkBack" runat="server" Font-Bold="True" Font-Names="Verdana"
                            Font-Size="11px" ForeColor="#003300" OnClick="lnkBack_Click">BACK</asp:LinkButton>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
