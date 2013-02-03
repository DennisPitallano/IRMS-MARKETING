<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ItemMasterQuickHelp.ascx.cs" Inherits="IntegratedResourceManagementSystem.Marketing.controls.ItemMasterQuickHelp" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<style type="text/css">
    .mnuIcon
    {
        width: 80px;
        height: 75px;
        background-image: url('../Resources/submenu.png');
        background-repeat: no-repeat;
        background-position:center;
        padding-left: 12px;
        padding-top: 3px;
    }
    .mnuIcon:hover
    {
        background-image: url('../Resources/submenuh.png');
      
        background-repeat: no-repeat;
        padding-left: 14px;
        color: Gray;
    }
    .lblMenu
    {
        text-decoration: none;
        color: #666666;
        cursor: pointer;
        text-align: center;
    }
    .lblMenu:hover
    {
        color: #376F00;
        border-bottom: 1px;
        border-bottom-style: dashed;
    }
    .colapseLabelUser
    {
        background: #eaefb5; /* Old browsers */
        background:url(../Resources/help.png), -moz-linear-gradient(top,  #eaefb5 0%, #e1e9a0 100%); /* FF3.6+ */
        background:url(../Resources/help.png), -webkit-gradient(linear, left top, left bottom, color-stop(0%,#eaefb5), color-stop(100%,#e1e9a0)); /* Chrome,Safari4+ */
        background:url(../Resources/help.png), -webkit-linear-gradient(top,  #eaefb5 0%,#e1e9a0 100%); /* Chrome10+,Safari5.1+ */
        background:url(../Resources/help.png), -o-linear-gradient(top,  #eaefb5 0%,#e1e9a0 100%); /* Opera 11.10+ */
        background:url(../Resources/help.png), -ms-linear-gradient(top,  #eaefb5 0%,#e1e9a0 100%); /* IE10+ */
        background:url(../Resources/help.png), linear-gradient(top,  #eaefb5 0%,#e1e9a0 100%); /* W3C */
        filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#eaefb5', endColorstr='#e1e9a0',GradientType=0 ); /* IE6-9 */
        -moz-border-radius:3px;
        -webkit-border-radius:3px;
        border-radius:3px;
        background-repeat:no-repeat;
        height:18px;
        font-family:Verdana;
        color: #008C2E;
        cursor: pointer;
        padding-left:28px;
        padding-top:3px;
        padding-right:4px;
        font-weight:bold;
        font-size:11px;
    }
    .colapseLabelUser:hover
    {
        color:Gray;
         border-bottom: 1px;
        border-bottom-style: dashed;
    }
    .content
    {
        background: #feffe8; /* Old browsers */
        background: -moz-linear-gradient(top,  #feffe8 0%, #d6dbbf 100%); /* FF3.6+ */
        background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#feffe8), color-stop(100%,#d6dbbf)); /* Chrome,Safari4+ */
        background: -webkit-linear-gradient(top,  #feffe8 0%,#d6dbbf 100%); /* Chrome10+,Safari5.1+ */
        background: -o-linear-gradient(top,  #feffe8 0%,#d6dbbf 100%); /* Opera 11.10+ */
        background: -ms-linear-gradient(top,  #feffe8 0%,#d6dbbf 100%); /* IE10+ */
        background: linear-gradient(top,  #feffe8 0%,#d6dbbf 100%); /* W3C */
        filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#feffe8', endColorstr='#d6dbbf',GradientType=0 ); /* IE6-9 */
        padding:3px 3px;
         -moz-border-radius:1x;
        -webkit-border-radius:1px;
        border-radius:1px;
        width:300px;
    }
</style>
<div style=" float:left; margin-right: 5px; margin-left:60px;">
     <div>
         <asp:Label ID="Label1" runat="server" Text="QUICK INFORMATION" Font-Bold="True" 
             Font-Names="Verdana" Font-Size="12px" ForeColor="#663300"></asp:Label></div>
          <div style="margin-top:5px;">
            <asp:CollapsiblePanelExtender ID="CollapsiblePaneItemMaster" runat="server" CollapseControlID="collapseItemMaster"
                CollapsedText="dennis" ExpandedText="pitallano" TargetControlID="pnlItemMaster"
                ExpandControlID="collapseItemMaster" Collapsed="True">
            </asp:CollapsiblePanelExtender>
            <div class="colapseLabelUser">
                <asp:Label ID="collapseItemMaster" runat="server" Text="Manage Items"
                ToolTip="What is Manage Items?"></asp:Label>
            </div>
            <asp:Panel ID="pnlItemMaster" CssClass="content" runat="server">
                <div>
                <div style=" display:inline-block; font-family:Verdana; font-size:10px; font-weight:bold;">Description:</div>
                <div style="margin-left:20px; font-family:Verdana; font-size:10px; text-align:left;"> 
                <p> Managing Styles by Creating new <span><a href="help.description.htm" target="_blank" title="What is Style?"><i>STYLE.</i></a></span>
                together with automatic generation of SKU for barcode.</p>
           <p>Creating a new  Style/s is a two way process.
                    <br />
                    1.Create a Style with SKU Generator.
                    <br />
                    2.Create a Style only <i>(and create SKU later)</i>.
                    <br />
                   <b><span title="Example Style: CDLP-001"> FORMAT:</span></b><i>
                    <'<span title="Ex:C => for CRISSA BRAND CODE.">BRAND CODE</span>'>
                    <'<span title="Ex:D => for DENIM CODE.">FABRIC CODE</span>'><'<span title="Ex:LP => for LONG PANTS GARMENT CODE.">GARMENT CODE</span>'>
                    -<'<span title="Counting Number Starting from 0001 to 00n+(1)">SERIES #</span>'></i>
                   
                 </p> 
                 <p>
                    Managing Styles SKU's/Item Code by Creating <a href="help.description.htm" target="_blank" title="What is SKU?"><i>SKU/Item Code</i></a>
                    using SKU Generator, also allow users for Cancelling/Deleting of SKU/s.
                    <br />
                      <b>
                    <span title="Example SKU: 810000187185">SKU FORMAT:</span></b><i>
                    <'<span title="Ex:81 => for CRISSA START SERIES #.">BRAND START SERIES</span>'>
                   <'<span title="Counting Number Starting from 0000000001 to 000000000n+(1)">++1</span>'></i>
                   
                 </p> 
                </div>
                </div>
              <div style=" display:inline-block; font-family:Verdana; font-size:10px; font-weight:bold;">Prerequisite for Style Creation:</div>
              <div style="margin-left:20px; font-family:Verdana; font-size:10px; text-align:left;"> 
                <p>
                1.Creation of Brands.<img alt="Brand" title="Brands" src="../Resources/product_brand.png" height="16" />
                <br />
                2.Creation of Categories.<img alt="Brand" title="Categories" src="../Resources/category.png" height="16" />
                <br />
                3.Creation of Fabrics.<img alt="Brand" title="Fabrics" src="../Resources/knits_.png" height="16" />
                <br />
                2.Creation of Garments.<img alt="Brand" title="Garments" src="../Resources/garments.png" height="16" />
                </p>
              </div>
               <div style=" display:inline-block; font-family:Verdana; font-size:10px; font-weight:bold;">Prerequisite for SKU Generation:</div>
              <div style="margin-left:20px; font-family:Verdana; font-size:10px; text-align:left;"> 
                <p>
                1.Creation of Styles.<img alt="Brand" title="Styles" src="../Resources/product.png" height="16" />
                <br />
                2.Creation of Colors.<img alt="Brand" title="Colors" src="../Resources/color.png" height="16" />
                <br />
                3.Creation of Sizes.<img alt="Brand" title="Sizes" src="../Resources/size.png" height="16" />
                </p>
              </div>
            </asp:Panel>
        </div>
        <div style="margin-top:2px;">
            <asp:CollapsiblePanelExtender ID="CollapsiblePanelBrands" runat="server"
                CollapseControlID="collapseBrands" CollapsedText="dennis" ExpandedText="pitallano"
                TargetControlID="pnlBrands" ExpandControlID="collapseBrands" Collapsed="True">
            </asp:CollapsiblePanelExtender>
            <div class="colapseLabelUser">
            <asp:Label ID="collapseBrands" runat="server" Text="Manage Brands"
                ToolTip="What is Manage Brands?"></asp:Label>
                </div>
            <asp:Panel ID="pnlBrands" CssClass="content" runat="server">
                Sample Module Description<br />
                Sample Description
            </asp:Panel>
        </div>

        <div style="margin-top:2px;">
            <asp:CollapsiblePanelExtender ID="CollapsiblePanelCategory" runat="server"
                CollapseControlID="lbluserCategory" CollapsedText="dennis" ExpandedText="pitallano"
                TargetControlID="pnlCategory" ExpandControlID="lbluserCategory" Collapsed="True">
            </asp:CollapsiblePanelExtender>
            <div class="colapseLabelUser">
            <asp:Label ID="lbluserCategory" runat="server" Text="Manage Categories"
                ToolTip="What is Manage Categories?"></asp:Label>
                </div>
            <asp:Panel ID="pnlCategory" CssClass="content" runat="server">
                Sample Module Description<br />
                Sample Description
            </asp:Panel>
        </div>
        <div style="margin-top:2px;">
            <asp:CollapsiblePanelExtender ID="CollapsiblePanelFabrics" runat="server"
                CollapseControlID="lblFabrics" CollapsedText="dennis" ExpandedText="pitallano"
                TargetControlID="pnlFabric" ExpandControlID="lblFabrics" Collapsed="True">
            </asp:CollapsiblePanelExtender>
            <div class="colapseLabelUser">
            <asp:Label ID="lblFabrics" runat="server" Text="Manage Fabrics"
                ToolTip="What is Manage Fabrics?"></asp:Label>
                </div>
            <asp:Panel ID="pnlFabric" CssClass="content" runat="server">
                Sample Module Description<br />
                Sample Description
            </asp:Panel>
        </div>
        <div style="margin-top:2px;">
            <asp:CollapsiblePanelExtender ID="CollapsiblePanelColors" runat="server"
                CollapseControlID="lblColors" CollapsedText="dennis" ExpandedText="pitallano"
                TargetControlID="pnlColors" ExpandControlID="lblColors" Collapsed="True">
            </asp:CollapsiblePanelExtender>
            <div class="colapseLabelUser">
            <asp:Label ID="lblColors" runat="server" Text="Manage Colors"
                ToolTip="Waht is Manage Colors?"></asp:Label>
                </div>
            <asp:Panel ID="pnlColors" CssClass="content" runat="server">
                Sample Module Description<br />
                Sample Description
            </asp:Panel>
        </div>
        <div style="margin-top:2px;">
            <asp:CollapsiblePanelExtender ID="CollapsiblePanelGarments" runat="server"
                CollapseControlID="lblGarments" CollapsedText="dennis" ExpandedText="pitallano"
                TargetControlID="pnlGarments" ExpandControlID="lblGarments" Collapsed="True">
            </asp:CollapsiblePanelExtender>
            <div class="colapseLabelUser">
            <asp:Label ID="lblGarments" runat="server" Text="Manage Garments"
                ToolTip="What is Manage Garments?"></asp:Label>
                </div>
            <asp:Panel ID="pnlGarments" CssClass="content" runat="server">
                Sample Module Description<br />
                Sample Description
            </asp:Panel>
        </div>
        <div style="margin-top:2px;">
            <asp:CollapsiblePanelExtender ID="CollapsiblePanelSizes" runat="server"
                CollapseControlID="lblSizes" CollapsedText="dennis" ExpandedText="pitallano"
                TargetControlID="pnlSizes" ExpandControlID="lblSizes" Collapsed="True">
            </asp:CollapsiblePanelExtender>
            <div class="colapseLabelUser">
            <asp:Label ID="lblSizes" runat="server" Text="Manage Sizes"
                ToolTip="Waht is Manage Sizes?"></asp:Label>
                </div>
            <asp:Panel ID="pnlSizes" CssClass="content" runat="server">
                Sample Module Description<br />
                Sample Description
            </asp:Panel>
        </div>
        <div style="margin-top:2px;">
            <asp:CollapsiblePanelExtender ID="CollapsiblePanelSKU" runat="server"
                CollapseControlID="lblSkus" CollapsedText="dennis" ExpandedText="pitallano"
                TargetControlID="pnlSKUS" ExpandControlID="lblSkus" Collapsed="True">
            </asp:CollapsiblePanelExtender>
            <div class="colapseLabelUser">
            <asp:Label ID="lblSkus" runat="server" Text="Manage SKU'S"
                ToolTip="Waht is Manage SKU'S?"></asp:Label>
                </div>
            <asp:Panel ID="pnlSKUS" CssClass="content" runat="server">
                Sample Module Description<br />
                Sample Description
            </asp:Panel>
        </div>
</div>