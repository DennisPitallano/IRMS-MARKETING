<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ProductStyleMenu.ascx.cs"
    Inherits="IntegratedResourceManagementSystem.Marketing.controls.ProductStyleMenu" %>
<style type="text/css">
    .mnuIcon
    {
        width: 80px;
        height: 75px;
        background-image: url('../Resources/submenu.png');
        background-repeat: no-repeat;
        padding-left: 15px;
        padding-top: 3px;
      
        opacity: 0.70;
    }
    .mnuIcon:hover
    {
        background-image: url('../Resources/submenuh.png');
        background-repeat: no-repeat;
        padding-left: 17px;
        color: Gray;
        opacity: 1.0;
    }
    .lblMenu
    {
        text-decoration: none;
        cursor: pointer;
        text-align: center;
        white-space: pre-wrap;
        text-shadow: 1px 1px 0px #E0E0E0;
    }
    .lblMenu:hover
    {
        color: #376F00;
        border-bottom: 1px;
        border-bottom-style: dashed;
    }
</style>
<div style="float: left; width: 100px; margin-right: 5px;">
    <div class="mnuIcon">
        <asp:ImageButton ID="imgBtnProductCategories" runat="server" ImageUrl="~/Resources/product.png"
            Height="32px" Width="38px" ToolTip="Manage Item" PostBackUrl="~/Marketing/ProductManagementPanel.aspx" />
        <br />
        <asp:LinkButton ID="lnkProductItem" runat="server" CssClass="lblMenu" Font-Names="Verdana"
            Font-Size="10px" ForeColor="#A65300" ToolTip="Manage Items" Font-Bold="True" PostBackUrl="~/Marketing/ProductManagementPanel.aspx"
            >MANAGE STYLES</asp:LinkButton>
    </div>
    <div class="mnuIcon">
        <asp:ImageButton ID="ibtnGenericStylePanel" runat="server" ImageUrl="~/Resources/product.png"
            Height="32px" Width="38px" ToolTip="Manage Item" PostBackUrl="~/Marketing/GenericStylesManagementPanel.aspx" />
        <br />
        <asp:LinkButton ID="lnkBtnGenericStylePanel" ForeColor="#A65300" runat="server" CssClass="lblMenu" Font-Names="Verdana"
            Font-Size="10px" ToolTip="Manage Items" Font-Bold="True" PostBackUrl="~/Marketing/GenericStylesManagementPanel.aspx"
            >GENERIC STYLES</asp:LinkButton>
    </div>
    <div class="mnuIcon">
        <asp:ImageButton ID="imgBtnBrand" runat="server" ImageUrl="~/Resources/product_brand.png"
            Height="34px" Width="47px" ToolTip="Manage Brands" PostBackUrl="~/Marketing/BrandManagementPanel.aspx" />
        <br />
        <asp:LinkButton ID="lnkBrands" ForeColor="#A65300" runat="server" CssClass="lblMenu" Font-Names="Verdana"
            Font-Size="10px" ToolTip="Manage Brands" Font-Bold="True" 
            PostBackUrl="~/Marketing/BrandManagementPanel.aspx">MANAGE BRANDS</asp:LinkButton>
    </div>
    <div class="mnuIcon">
        <asp:ImageButton ID="ibtnCategories" runat="server" ImageUrl="~/Resources/category.png"
            Height="34px" ToolTip="Manage Categories" PostBackUrl="~/Marketing/CategoryManagementPanel.aspx" />
        <br />
        <asp:LinkButton ID="lnkCategories" ForeColor="#A65300" runat="server" CssClass="lblMenu" Font-Names="Verdana"
            Font-Size="10px" ToolTip="Manage Product Brands" Font-Bold="True" 
            PostBackUrl="~/Marketing/CategoryManagementPanel.aspx">APPAREL TYPES</asp:LinkButton>
    </div>
    <div class="mnuIcon">
        <asp:ImageButton ID="imgBtnFabricCategories" runat="server" ImageUrl="~/Resources/knits_.png"
            Height="39px" Width="60px" ToolTip="Manage Fabric Categories" PostBackUrl="~/Marketing/FabricManagementPanel.aspx" />
        <br />
        <asp:LinkButton ID="lnkFabrics" runat="server" ForeColor="#A65300" CssClass="lblMenu" Font-Names="Verdana"
            Font-Size="10px" ToolTip="Manage Fabric Categories" Font-Bold="True" 
            PostBackUrl="~/Marketing/FabricManagementPanel.aspx">FABRICS</asp:LinkButton>
    </div>
</div>
<div style="float: left; width: 100px; margin-right: 5px;">
    <div class="mnuIcon">
        <asp:ImageButton ID="imgBtnGarmets" runat="server" ImageUrl="~/Resources/garments.png"
            Height="44px" Width="53px" ToolTip="Manage Garments" PostBackUrl="~/Marketing/GarmentManagementPanel.aspx" />
        <br />
        <asp:LinkButton ID="lnkGarments" runat="server" ForeColor="#A65300" CssClass="lblMenu" Font-Names="Verdana"
            Font-Size="10px" ToolTip="Manage Garments" Font-Bold="True" 
            PostBackUrl="~/Marketing/GarmentManagementPanel.aspx">GARMENTS</asp:LinkButton>
    </div>
    <div class="mnuIcon">
        <asp:ImageButton ID="imgBtnColors" runat="server" ImageUrl="~/Resources/color.png"
            Height="44px" Width="49px" ToolTip="Manage Product Colors" PostBackUrl="~/Marketing/ColorManagementPanel.aspx" />
        <br />
        <asp:LinkButton ID="lnkColors" ForeColor="#A65300" runat="server" CssClass="lblMenu" Font-Names="Verdana"
            Font-Size="10px" ToolTip="Manage Colors" Font-Bold="True" 
            PostBackUrl="~/Marketing/ColorManagementPanel.aspx">COLORS</asp:LinkButton>
    </div>
    <div class="mnuIcon">
        <asp:ImageButton ID="imgBtnSize" runat="server" ImageUrl="~/Resources/size.png" Height="32px"
            Width="32px" ToolTip="Manage Product Sizes" PostBackUrl="~/Marketing/SizeManagementPanel.aspx" />
        <br />
        <asp:LinkButton ID="lnkSizes" runat="server" ForeColor="#A65300" CssClass="lblMenu" Font-Names="Verdana"
            Font-Size="10px" ToolTip="Manage Product Sizes" Font-Bold="True" 
            PostBackUrl="~/Marketing/SizeManagementPanel.aspx"> MANAGE SIZES</asp:LinkButton>
    </div>
    <div class="mnuIcon">
        <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/Resources/fit.png"
            Height="32px" Width="32px" ToolTip="Manage Product Sizes" PostBackUrl="~/Marketing/FittingsManagementPanel.aspx" />
        <br />
        <asp:LinkButton ID="LinkButton1" runat="server" ForeColor="#A65300" CssClass="lblMenu" Font-Names="Verdana"
            Font-Size="10px" ToolTip="Manage Fittings" Font-Bold="True" 
            PostBackUrl="~/Marketing/FittingsManagementPanel.aspx"> MANAGE FITTINGS</asp:LinkButton>
    </div>
</div>
<div style="float: left; width: 100px; margin-right: 5px;">
    <div class="mnuIcon">
        <asp:ImageButton ID="imgBtnSKUBarcode" runat="server" ImageUrl="~/Resources/Barcode.png"
            Height="34px" Width="52px" ToolTip="Manage SKU Barcode" PostBackUrl="~/Marketing/SkuBarcodeManagementPanel.aspx" />
        <br />
        <asp:Label ID="Label1" runat="server" Text=" SKU's  Barcode" CssClass="lblMenu" Font-Names="Verdana"
            Font-Size="10px" ToolTip="Manage SKU Barcode" Font-Bold="True"></asp:Label>
    </div>
    <div class="mnuIcon">
        <div>
            <asp:ImageButton ID="iBtnPriceCheckAndItemReprocess" runat="server" ImageUrl="~/Resources/money.png"
                Height="42px" title="Check Price" PostBackUrl="~/Marketing/PriceCheckingAndItemReprocessingPanel.aspx" />
        </div>
        <asp:LinkButton ForeColor="#A65300" ID="lnkPriceCheckAndItemReprocess" runat="server" CssClass="lblMenu"
            Font-Names="Verdana" Font-Size="9px" title="Check Price"
            Font-Bold="True"  PostBackUrl="~/Marketing/PriceCheckingAndItemReprocessingPanel.aspx">PRCE CHECK</asp:LinkButton>
    </div>

    <div class="mnuIcon">
        <div>
            <asp:ImageButton ID="imgBtnItemReclassification" runat="server" ImageUrl="~/Resources/garments.png"
                Height="24px" Width="28px" title="Reclassify Items/Styles" 
                PostBackUrl="~/Marketing/ReprocessItems.aspx" />
        </div>
        <asp:LinkButton ID="lnkBtnItemReclassification" ForeColor="#A65300" runat="server" CssClass="lblMenu"
            Font-Names="Verdana" Font-Size="9px" title="Reclassify Items/Styles"
            Font-Bold="True" 
            PostBackUrl="~/Marketing/ReprocessItems.aspx">ITEM RECLASSI-FICATION</asp:LinkButton>
    </div>
     <div class="mnuIcon">
        <div>
            <asp:ImageButton ID="imgStockInputReport" runat="server" ImageUrl="~/Resources/adjustment.png"
                Height="34px" title="Stock Input Report Generator" 
                PostBackUrl="~/Marketing/StockInputReport.aspx" />
        </div>
        <asp:LinkButton ID="lnkStockInputReport" runat="server" ForeColor="#A65300" CssClass="lblMenu"
            Font-Names="Verdana" Font-Size="9px" title="Stock Input Report Generator"
            Font-Bold="True" 
            PostBackUrl="~/Marketing/StockInputReport.aspx">STOCK INPUT REPORTS</asp:LinkButton>
    </div>
</div>
