<%@ Page Title="" Language="C#" MasterPageFile="~/Marketing/Marketing.Master" AutoEventWireup="true"
    CodeBehind="CheckStylesPrice.aspx.cs" Inherits="IntegratedResourceManagementSystem.Marketing.CheckStylesPrice" %>

<asp:Content ID="HeadContent" ContentPlaceHolderID="head" runat="server">
    <link href="../Styles/price-check.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/item-reprocess.css" rel="stylesheet" type="text/css" />
   <style type="text/css">
    #MainContent_hpLinkPrintPreview
    {
        text-decoration:none;
        line-height:20px;
    }
    #MainContent_gvRegularPrices tr td
    {
      padding-left:5px;
      padding-right:7px;
    }
    #MainContent_gvStylesPrice tr td
    {
      padding-left:5px;
      padding-right:7px;
    }
      #MainContent_gvStylesPrice th
      {
           padding-left:5px;
           padding-right:5px;
      }
      #MainContent_gvRegularPrices th
      {
           padding-left:5px;
           padding-right:5px;
      }
   </style>
</asp:Content>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div style="min-height: 420px;width:700px;">
        <div class="titleList" style="text-align: center;">
            CUSTOMER INFORMATION
        </div>
        <div class="priceInfoContainer">
            <table>
                <tr>
                    <td class="lblPriceCheckInfo">
                        CUSTOMER NAME:
                    </td>
                    <td class="textPriceCheckInfoContainer" colspan="3">
                        <asp:Label CssClass="modalText textPriceCheckInfo" ID="lblCustomerName" runat="server"
                            Text="Label"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="lblPriceCheckInfo">
                        PRICE GROUP REGULAR:
                    </td>
                    <td class="textPriceCheckInfoContainer">
                        <asp:Label CssClass="modalText textPriceCheckInfo" ID="lblPriceGroupRegular" runat="server"
                            Text="Label"></asp:Label>
                    </td>
                    <td class="lblPriceCheckInfo">
                        PRICE GROUP MD:
                    </td>
                    <td class="textPriceCheckInfoContainer">
                        <asp:Label CssClass="modalText textPriceCheckInfo" ID="lblPriceGroupMD" runat="server"
                            Text="Label"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="lblPriceCheckInfo">
                        AREA:
                    </td>
                    <td class="textPriceCheckInfoContainer">
                        <asp:Label CssClass="modalText textPriceCheckInfo" ID="lblArea" runat="server" Text="Label"></asp:Label>
                    </td>
                    <td class="lblPriceCheckInfo">
                        SUB-AREA:
                    </td>
                    <td class="textPriceCheckInfoContainer">
                        <asp:Label CssClass="modalText textPriceCheckInfo" ID="lblSubArea" runat="server"
                            Text="Label"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="lblPriceCheckInfo">
                        ARANGEMENT TYPE:
                    </td>
                    <td class="textPriceCheckInfoContainer">
                        <asp:Label CssClass="modalText textPriceCheckInfo" ID="lblArrangementType" runat="server"
                            Text="Label"></asp:Label>
                    </td>
                    <td class="lblPriceCheckInfo">
                        BRAND NAME:
                    </td>
                    <td class="textPriceCheckInfoContainer">
                        <asp:Label CssClass="modalText textPriceCheckInfo" ID="lblBrand" runat="server" Text="Label"></asp:Label>
                    </td>
                </tr>
            </table>
        </div>

        <div class="priceInfoContainer">
        <div>
            <asp:Label ID="lblMarkDownTitle" Font-Names="Verdana" runat="server" Font-Bold="true"  Text="MARKDOWN"></asp:Label>
        </div>
             <asp:GridView ID="gvStylesPrice"  runat="server" AutoGenerateColumns="False" 
                 ViewStateMode="Disabled" Font-Names="Verdana" ForeColor="#663300" 
                 onrowcreated="gvStylesPrice_RowCreated">
                 <Columns>
                     <asp:BoundField DataField="StyleNo" HeaderText="STYLE #" 
                         SortExpression="StyleNo" >
                     <ItemStyle Font-Bold="True" />
                     </asp:BoundField>
                     <asp:BoundField DataField="Price" DataFormatString="{0:###,###.00}" 
                         HeaderText="CURRENT PRICE" SortExpression="Price">
                     <ItemStyle HorizontalAlign="Center" ForeColor="#CC3300" />
                     </asp:BoundField>
                     <asp:BoundField DataField="SRP" DataFormatString="{0:###,###.00}" 
                         HeaderText="SRP">
                     <ItemStyle ForeColor="#CC3300" />
                     </asp:BoundField>
                     <asp:BoundField DataField="PriceType" HeaderText="PRICE TYPE" 
                         SortExpression="PriceType" >
                     <ItemStyle Font-Italic="True" />
                     </asp:BoundField>
                     <asp:BoundField DataField="PGNo" 
                         HeaderText="COST PRICE" SortExpression="PGNo">
                     <ItemStyle HorizontalAlign="Center" ForeColor="#CC3300" />
                     </asp:BoundField>
                     <asp:BoundField DataField="GrpNo" HeaderText="DESCRIPTION" HtmlEncode="False" 
                         SortExpression="GrpNo" />
                          <asp:BoundField DataField="APType" HeaderText="TOP OR BOTTOM" HtmlEncode="False" 
                         SortExpression="APType" Visible="False" />
                 </Columns>
            </asp:GridView>
            <br />
         <div>
             <asp:Label ID="lblRegularTitle" Font-Names="Verdana" Font-Bold="true" runat="server" Text="REGULAR"></asp:Label>
        </div>
           <asp:GridView ID="gvRegularPrices"  runat="server" AutoGenerateColumns="False" 
                 ViewStateMode="Disabled" Font-Names="Verdana" ForeColor="#663300" 
                 onrowcreated="gvStylesPrice_RowCreated">
                 <Columns>
                     <asp:BoundField DataField="StyleNo" HeaderText="STYLE #" 
                         SortExpression="StyleNo" >
                     <ItemStyle Font-Bold="True" />
                     </asp:BoundField>
                     <asp:BoundField DataField="Price" DataFormatString="{0:###,###.00}" 
                         HeaderText="CURRENT PRICE" SortExpression="Price">
                     <ItemStyle HorizontalAlign="Center" ForeColor="#CC3300" />
                     </asp:BoundField>
                     <asp:BoundField DataField="PriceType" HeaderText="PRICE TYPE" 
                         SortExpression="PriceType" >
                     <ItemStyle Font-Italic="True" />
                     </asp:BoundField>
                     <asp:BoundField DataField="PGNo" 
                         HeaderText="COST PRICE" SortExpression="PGNo">
                     <ItemStyle HorizontalAlign="Center" ForeColor="#CC3300" />
                     </asp:BoundField>
                     <asp:BoundField DataField="GrpNo" HeaderText="DESCRIPTION" HtmlEncode="False" 
                         SortExpression="GrpNo" />
                          <asp:BoundField DataField="APType" HeaderText="TOP OR BOTTOM" HtmlEncode="False" 
                         SortExpression="APType" Visible="False" />
                 </Columns>
            </asp:GridView>

              <div style="text-align:center; height:30px; padding-top:15px;">
                <asp:HyperLink  ID="hpLinkPrintPreview" CssClass="btnPrint" Target="_blank" Height="20px" Width="105px" runat="server">PRINT PREVIEW</asp:HyperLink>
              </div>
        </div>
      
    </div>
</asp:Content>
