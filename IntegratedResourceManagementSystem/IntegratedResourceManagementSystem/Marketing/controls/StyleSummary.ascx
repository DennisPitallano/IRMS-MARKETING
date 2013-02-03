<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="StyleSummary.ascx.cs" Inherits="IntegratedResourceManagementSystem.Marketing.controls.StyleSummary" %>
<%@ OutputCache Duration="60" VaryByParam="none" VaryByCustom="browser" Shared="true"  %>  
<style type ="text/css" >
   .mnuIconSummary
    {
        width:200px;
        height:25px;
       /* background-image:url('/Resources/submenu.png'); 
        background-repeat:no-repeat;*/
        padding-left: 15px;
        padding-top: 3px;
    }
     .mnuIconSummary:hover
    {
      /*  background-image:url('/Resources/submenuh.png');
        background-repeat:no-repeat; */
        padding-left: 16px;
        color: Gray;
    }
     .lblMenu
    {
        cursor:pointer;
        text-align:center;
    }
    .lblMenu:hover
    {
        cursor:pointer;
    }
</style>
<div style ="float:left; width: 180px; margin-right:5px;">
 <div>
    <asp:Image ID="imgSummaryTitle" runat="server" Height="22px" 
               ImageUrl="~/Resources/summary.png" Width="22px" 
               ImageAlign="AbsBottom" />
    <asp:Label ID="Label4" runat="server" Text="STYLE SUMMARY" 
               Font-Names="Verdana" Font-Size="13px" 
               Font-Bold="True"></asp:Label>
  </div>
  <div class ="mnuIconSummary">
    <asp:Image ID="imgProductCategories" runat="server" Height="20px" 
               ImageUrl="~/Resources/product_summary.png" Width="20px" 
               ImageAlign="AbsBottom" ToolTip="Style Summary" />
    <asp:Label ID="lblTotalProductCategories" runat="server" 
               CssClass ="lblMenu" Font-Names="Verdana" Font-Size="10px" 
               Font-Bold="True" ToolTip="Style Summary"></asp:Label>
  </div>
  <div class ="mnuIconSummary">
    <asp:Image ID="imgBrand" runat="server" Height="20px" 
               ImageUrl="~/Resources/product_brand_summary.png" Width="20px" 
               ImageAlign="AbsBottom" ToolTip="Brand Summary" />
    <asp:Label ID="lblTotalProductBrand" runat="server" Text="Total Product Brands: 20" 
               CssClass ="lblMenu" Font-Names="Verdana" Font-Size="10px" 
               ToolTip="Brand Summary" Font-Bold="True"></asp:Label>
  </div>
  <div class ="mnuIconSummary">
    <asp:Image ID="imgFabricCategories" runat="server" Height="20px" 
               ImageUrl="~/Resources/fabric_summary.png" Width="20px" 
               ImageAlign="AbsBottom" ToolTip="Fabric Summary" />
    <asp:Label ID="lblFabricCategories" runat="server" Text="Total Fabrics: 25" 
               CssClass ="lblMenu" Font-Names="Verdana" Font-Size="10px" 
               ToolTip="Fabric Summary" Font-Bold="True"></asp:Label>
  </div>
  <div class ="mnuIconSummary">
    <asp:Image ID="imgGarmets" runat="server" Height="20px" 
               ImageUrl="~/Resources/garments_summary.png" Width="20px" 
               ImageAlign="AbsBottom" ToolTip="Garment Summary" />
    <asp:Label ID="lblGarments" runat="server" Text="Total Garments: 50" 
               CssClass ="lblMenu" Font-Names="Verdana" Font-Size="10px" 
               ToolTip="Garment Summary" Font-Bold="True"></asp:Label>
  </div>
  <div class ="mnuIconSummary">
    <asp:Image ID="imgColors" runat="server" Height="20px" 
               ImageUrl="~/Resources/color_summary.png" Width="20px" 
               ImageAlign="AbsBottom" ToolTip="Color Summary" />
    <asp:Label ID="lblTotalColors" runat="server" Text="Total Colors: 30" 
               CssClass ="lblMenu" Font-Names="Verdana" Font-Size="10px" 
               ToolTip="Color Summary" Font-Bold="True"></asp:Label>
  </div>
  <div class ="mnuIconSummary">
    <asp:Image ID="imgSize" runat="server" Height="20px" 
               ImageUrl="~/Resources/size_summary.png" Width="20px" 
               ImageAlign="AbsBottom" ToolTip="Size Summary" />
    <asp:Label ID="lblTotalSize" runat="server" Text="Total Sizes: 48" 
               CssClass ="lblMenu" Font-Names="Verdana" Font-Size="10px" 
               ToolTip="Size Summary" Font-Bold="True"></asp:Label>
  </div>
  <div class ="mnuIconSummary">
    <asp:Image ID="imgSKUBarcode" runat="server" Height="20px" 
               ImageUrl="~/Resources/Barcode_summary.png" Width="20px" 
               ImageAlign="AbsBottom" ToolTip="SKU Summary" />
    <asp:Label ID="lblTotalSKUBarcode" runat="server" Text="Total SKU's Barcode: 100" 
               CssClass ="lblMenu" Font-Names="Verdana" Font-Size="10px" 
               ToolTip="SKU Summary" Font-Bold="True"></asp:Label>
  </div>
</div> 