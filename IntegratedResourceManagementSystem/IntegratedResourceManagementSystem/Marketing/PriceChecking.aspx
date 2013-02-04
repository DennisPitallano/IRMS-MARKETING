<%@ Page Title="" Language="C#" MasterPageFile="~/Marketing/Marketing.Master" AutoEventWireup="true" CodeBehind="PriceChecking.aspx.cs" Inherits="IntegratedResourceManagementSystem.Marketing.PriceChecking" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<asp:Content ID="HeadContent" ContentPlaceHolderID="head" runat="server">
    <link href="../Styles/price-check.css" rel="stylesheet" type="text/css" />
      <link href="../Styles/item-reprocess.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
<div style="min-height:450px;">
    <div class="titleList" style="text-align:center;">
      CUSTOMER INFORMATION
    </div>
    <div class="priceInfoContainer">
     <table align="center">
        <tr>
            <td class="lblPriceCheckInfo">
            CUSTOMER NAME:
            </td>
            <td class="textPriceCheckInfoContainer">
                <asp:Label CssClass="modalText textPriceCheckInfo" ID="lblCustomerName" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="lblPriceCheckInfo">
            PRICE GROUP REGULAR:
            </td>
            <td class="textPriceCheckInfoContainer">
                <asp:Label CssClass="modalText textPriceCheckInfo" ID="lblPriceGroupRegular" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="lblPriceCheckInfo">
            PRICE GROUP MD:
            </td>
            <td class="textPriceCheckInfoContainer">
                <asp:Label CssClass="modalText textPriceCheckInfo" ID="lblPriceGroupMD" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="lblPriceCheckInfo">
            AREA:
            </td>
            <td class="textPriceCheckInfoContainer">
                <asp:Label CssClass="modalText textPriceCheckInfo" ID="lblArea" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="lblPriceCheckInfo">
            SUB-AREA:
            </td>
            <td class="textPriceCheckInfoContainer">
                <asp:Label CssClass="modalText textPriceCheckInfo" ID="lblSubArea" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
         <tr>
            <td class="lblPriceCheckInfo">
            ARANGEMENT TYPE:
            </td>
            <td class="textPriceCheckInfoContainer">
                <asp:Label CssClass="modalText textPriceCheckInfo" ID="lblArrangementType" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
         <tr>
            <td class="lblPriceCheckInfo">
            BRAND NAME:
            </td>
            <td class="textPriceCheckInfoContainer">
                <asp:Label CssClass="modalText textPriceCheckInfo" ID="lblBrand" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
       </table>

    </div>
    <div class="titleList" style="text-align:center;">
      OUTRIGHT DISCOUNTS
    </div>
    <div class="priceInfoContainer">
        <table align="center">
            <tr>
                <td class="lblPriceCheckInfo">
                    REGULAR:
                </td>
                <td class="textPriceCheckInfoContainer">
                    <asp:Label CssClass="modalText textPriceCheckInfo" ID="lblRegular" 
                        runat="server" Text="0.00" ForeColor="#CC3300"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="lblPriceCheckInfo">
                    MARKDOWN:
                </td>
                <td class="textPriceCheckInfoContainer">
                    <asp:Label CssClass="modalText textPriceCheckInfo" ID="lblMarkDown" 
                        runat="server" Text="0.00" ForeColor="#CC3300"></asp:Label>
                </td>
            </tr>
        </table>
    </div>
     <div class="titleList" style="text-align:center;">
      PRODUCT INFORMATION
    </div>
    <div class="priceInfoContainer">
        <table align="center">
            <tr>
                <td class="lblPriceCheckInfo">
                    STYLE NUMBER:
                </td>
                <td class="textPriceCheckInfoContainer">
                    <asp:Label CssClass="modalText textPriceCheckInfo" ID="lblStyleNumber" runat="server" Text="Label"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="lblPriceCheckInfo">
                    STYLE DESCRIPTION:
                </td>
                <td class="textPriceCheckInfoContainer">
                    <asp:Label CssClass="modalText textPriceCheckInfo" ID="lblStyleDescription" runat="server" Text="Label"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="lblPriceCheckInfo">
                    COST:
                </td>
                <td class="textPriceCheckInfoContainer">
                    <asp:Label CssClass="modalText textPriceCheckInfo" ForeColor="Red" ID="lblStyleCostPrice" runat="server" Text="Label"></asp:Label>
                </td>
            </tr>
        </table>
        <table align="center">
            <tr>
                <td >
                 <div>
                    <asp:Label ID="lblPriceFrom" CssClass ="filter-link" runat ="server" 
                         Font-Size="12px" ForeColor="#663300" ></asp:Label> 
                   </div>
                <div>
                  <div style="float:left; margin-right:15px;"> <span class="lblPriceCheckInfo" style="font-size:16px; font-weight:bold;"> SRP-</span><asp:Label ID="lblSRP" CssClass ="filter-link" 
                        runat="server" Text="Label" Font-Size="16px" ForeColor="#CC6600"></asp:Label>

                        </div>
                        <div style="display:inline-block;">
                            <span class="lblPriceCheckInfo" style="font-size:16px; font-weight:bold;"> PICK-UP-PRICE-</span><asp:Label ID="lblPickUpPrice" CssClass ="filter-link" 
                        runat="server" Text="Label" Font-Size="16px" ForeColor="#CC6600"></asp:Label>
                        </div>
                        </div>
                    <asp:Panel ID="pnlMardown" runat ="server">
                    <asp:DataList ID="DListPriceHistory" runat="server"
                            RepeatColumns="3">
                            <ItemTemplate>
                                <div class="history-item">
                                    <div class="history-counter">
                                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("Row_Count") %>' ToolTip="Price History Counter" />
                                    </div>
                                    MD DATE:
                                    <asp:Label CssClass="history-item-label" ID="MemoDateLabel" runat="server" Text='<%# Eval("MemoDate") %>' />
                                    <br />
                                    CUSTOMER:
                                    <asp:Label ID="CUSTOMERLabel" runat="server" Text='<%# Eval("CUSTOMER") %>' Font-Italic="True" ForeColor="#996600" />
                                    <br />
                                    AREA:
                                    <asp:Label ID="AreaGroupLabel" runat="server" Text='<%# Eval("AreaGroup") %>' Font-Size="9px" ForeColor="#996600" />
                                    <br />
                                    SUB-AREA:
                                    <asp:Label ID="SubAreaLabel" runat="server" Text='<%# Eval("SubArea") %>' Font-Size="9px" ForeColor="#996600" />
                                    <br />
                                    FROM DATE:
                                    <asp:Label CssClass="history-item-label" ID="FromDateLabel" runat="server" Text='<%# Eval("FromDate") %>' />
                                    <br />
                                    TO DATE:
                                    <asp:Label CssClass="history-item-label" ID="ToDateLabel" runat="server" Text='<%# Eval("ToDate") %>' />
                                    <br />
                                    CURRENT PRICE:
                                    <asp:Label CssClass="history-item-label" ID="CurrPriceLabel" runat="server" Text='<%# Eval("CurrPrice") %>' ForeColor="#CC3300" />
                                    <br />
                                    MD PRICE:
                                    <asp:Label CssClass="history-item-label" ID="MDPriceLabel" runat="server" Text='<%# Eval("MDPrice") %>' ForeColor="#CC3300" />  
                                    <br />
                                </div>
                            </ItemTemplate>
                        </asp:DataList>
                    </asp:Panel>
                    <asp:CollapsiblePanelExtender ID="pnlMardown_CollapsiblePanelExtender" 
                        runat="server" CollapseControlID="lblPriceFrom" Collapsed="True" Enabled="True" 
                        ExpandControlID="lblPriceFrom" TargetControlID="pnlMardown">
                    </asp:CollapsiblePanelExtender>
                </td>
                <td>
                    
                </td>
            </tr>
        </table>
    </div>
</div>
</asp:Content>
