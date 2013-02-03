<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AdminMenuMain.ascx.cs" Inherits="IntegratedResourceManagementSystem.Marketing.Marketing_Admin.controls.AdminMenuMain" %>
 <style type ="text/css">
   .mnuIcon
    {
        width:80px;
        height:75px;
        background-image:url('../../Resources/submenu.png');
        background-repeat:no-repeat;
        padding-left: 15px;
        padding-top: 3px;
    }
     .mnuIcon:hover
    {
        background-image:url('../../Resources/submenuh.png');
        background-repeat:no-repeat;
        padding-left: 17px;
        color: Gray;
    }
     .lblMenu
    {
        text-decoration:none;
        color:#666666;
        cursor:pointer;
        text-align:center;
    }
    .lblMenu:hover
    {
        color:#376F00;
        border-bottom:1px;
        border-bottom-style: dashed;
    }
    .group_title
    {
        font-family:Verdana; font-size:14px; font-weight:bold; text-align:right; height:25px; margin-right:5px; text-shadow: 1px 1px 1.5px #a2baa0;
        filter: dropshadow(color=#a2baa0, offx=1, offy=1);
        margin-top:5px;
        margin-bottom:3px;
    }
    .group_title1
    {
        font-family:Verdana; font-size:14px; font-weight:bold; text-align:left; height:25px; margin-right:5px; text-shadow: 1px 1px 1.5px #a2baa0;
        filter: dropshadow(color=#a2baa0, offx=1, offy=1);
        margin-top:5px;
          margin-bottom:3px;
    }
</style>
 <div style ="float:left; width: 100px; margin-right:5px;">
 <div class="group_title">
            <span >__ACCOUNT</span> 
            </div>
            <div class ="mnuIcon">
                <asp:ImageButton ID="imgBtnManageUsers" runat="server" 
                    ImageUrl="~/Resources/contacts.png" Height="32px"
                    ToolTip="Manage Users" 
                    PostBackUrl="~/Marketing/Marketing-Admin/UserManagementPanel.aspx" />
                    <br />
                <asp:LinkButton ID="lnkProductItem" runat="server" CssClass ="lblMenu" 
                    Font-Names="Verdana" Font-Size="10px" 
                    ToolTip="Manage Users" Font-Bold="True"
                    PostBackUrl="~/Marketing/Marketing-Admin/UserManagementPanel.aspx" 
                    ForeColor="#666666">MANAGE USERS</asp:LinkButton>
            </div>
            <div class="group_title">
            <span >_____LIST</span> 
            </div>
            <div class ="mnuIcon">
                <asp:ImageButton ID="imgBtnDepartment" runat="server" 
                    ImageUrl="~/Resources/product_brand.png" Height="34px" Width="47px" ToolTip="Manage Departments" 
                    PostBackUrl="~/Marketing/Marketing-Admin/DepartmentManagementPanel.aspx" />
                    <br />
                <asp:LinkButton ID="lnkBrands" runat="server" CssClass ="lblMenu" 
                    Font-Names="Verdana" Font-Size="10px" 
                    ToolTip="Manage Departments" Font-Bold="True" ForeColor="#666666" 
                    PostBackUrl="~/Marketing/Marketing-Admin/DepartmentManagementPanel.aspx">MANAGE DEPT.</asp:LinkButton>
            </div>
              <div class ="mnuIcon">
                <asp:ImageButton ID="ibtnPriceGroup" runat="server" 
                    ImageUrl="~/Resources/product_brand.png" Height="34px" Width="47px" ToolTip="Manage Price Groups" 
                    PostBackUrl="~/Marketing/Marketing-Admin/PriceGroupManagementPanel.aspx" />
                    <br />
                  <asp:LinkButton ID="lnkPriceGroup" runat="server" 
                    CssClass ="lblMenu" Font-Names="Verdana" Font-Size="10px" 
                    ToolTip="Manage PriceGroup" Font-Bold="True" ForeColor="#666666" 
                      PostBackUrl="~/Marketing/Marketing-Admin/PriceGroupManagementPanel.aspx">PRICE &nbsp;  GROUP</asp:LinkButton>
            </div>
            <div class ="mnuIcon">
                <asp:ImageButton ID="imgBtnFormula" runat="server" 
                    ImageUrl="~/Resources/product_summary.png" Height="32px" 
                    ToolTip="Manage Formula" 
                    PostBackUrl="~/Marketing/Marketing-Admin/FormulaManagementPanel.aspx" />
                    <br />
                <asp:LinkButton ID="lnkFabrics" runat="server" CssClass ="lblMenu" 
                    Font-Names="Verdana" Font-Size="10px" 
                    ToolTip="Manage Formula" Font-Bold="True" ForeColor="#666666" 
                    PostBackUrl="~/Marketing/Marketing-Admin/FormulaManagementPanel.aspx">MANAGE FORMULA</asp:LinkButton>
            </div>
             <div class ="mnuIcon">
                <asp:ImageButton ID="iBtnCompany" runat="server" 
                    ImageUrl="~/Resources/product_brand.png" Height="34px" Width="47px" ToolTip="Manage Company" 
                    PostBackUrl="~/Marketing/Marketing-Admin/CompanyManagementPanel.aspx" />
                    <br />
                  <asp:LinkButton ID="lnkCompany" runat="server" 
                    CssClass ="lblMenu" Font-Names="Verdana" Font-Size="10px" 
                    ToolTip="Manage Company" Font-Bold="True" ForeColor="#666666" 
                      PostBackUrl="~/Marketing/Marketing-Admin/CompanyManagementPanel.aspx">COMPANY</asp:LinkButton>
            </div>
        </div>

<div style ="float:left; width: 100px; margin-right:5px;">
<div class="group_title">
            <span >MANAGEMENT</span> 
            </div>
            <div class ="mnuIcon">
                <asp:ImageButton ID="imgBtnAuditTrails" runat="server" 
                    ImageUrl="~/Resources/log.png" Height="34px" 
                    ToolTip="Manage Audit Trails" 
                    PostBackUrl="~/Marketing/Marketing-Admin/AuditTrails.aspx" />
                       
                    <br />
                 <asp:LinkButton ID="lnkAuditTrails" runat="server"
                    CssClass ="lblMenu" Font-Names="Verdana" Font-Size="10px" 
                    ToolTip="Manage Audit Trails" Font-Bold="True" ForeColor="#666666" 
                    PostBackUrl="~/Marketing/Marketing-Admin/AuditTrails.aspx" >AUDIT TRAILS</asp:LinkButton>
            </div>
            <div class="group_title">  MANAGEMENT_</div>
            <div class ="mnuIcon">
                <asp:ImageButton ID="imgBtnTerms" runat="server" 
                    ImageUrl="~/Resources/adjustment.png" Height="44px" 
                    ToolTip="Manage Terms" 
                    PostBackUrl="~/Marketing/Marketing-Admin/TermManagementPanel.aspx" />
                    <br />
                <asp:LinkButton ID="lnkTerms" runat="server"  CssClass ="lblMenu" 
                    Font-Names="Verdana" Font-Size="10px" 
                    ToolTip="Manage Terms" Font-Bold="True" ForeColor="#666666" 
                    PostBackUrl="~/Marketing/Marketing-Admin/TermManagementPanel.aspx">TERMS</asp:LinkButton>
            </div>
            <div class ="mnuIcon">
                <asp:ImageButton ID="imgBtnAreaGroup" runat="server" 
                    ImageUrl="~/Resources/product_brand.png" Height="34px" Width="47px"
                    ToolTip="Manage Area Group" 
                    PostBackUrl="~/Marketing/Marketing-Admin/AreaGroupManagementPanel.aspx" />
                    <br />
                <asp:LinkButton ID="lnkAreaGroup" runat="server" CssClass ="lblMenu" 
                    Font-Names="Verdana" Font-Size="10px" 
                    ToolTip="Manage Area Group" Font-Bold="True" ForeColor="#666666" 
                    PostBackUrl="~/Marketing/Marketing-Admin/AreaGroupManagementPanel.aspx">AREA&nbsp;&nbsp; GROUP</asp:LinkButton>
            </div>
             <div class ="mnuIcon">
                <asp:ImageButton ID="iBtnArrangementType" runat="server" 
                    ImageUrl="~/Resources/adjustment.png" Height="32px" 
                    ToolTip="Manage Terms" 
                    PostBackUrl="~/Marketing/Marketing-Admin/ArrangementManagementPanel.aspx" />
                    <br />
                <asp:LinkButton ID="lnkArrangementType" runat="server"  CssClass ="lblMenu" 
                    Font-Names="Verdana" Font-Size="10px" 
                    ToolTip="ARRANGEMENT TYPE" Font-Bold="True" ForeColor="#666666" 
                    PostBackUrl="~/Marketing/Marketing-Admin/ArrangementManagementPanel.aspx">ARRANGE-MENT TYPE</asp:LinkButton>
            </div>
            <div class ="mnuIcon">
                <asp:ImageButton ID="iBtnCustomerGroup" runat="server" 
                    ImageUrl="~/Resources/product_brand.png" Height="34px" Width="47px" ToolTip="Manage Customer Group" 
                    PostBackUrl="~/Marketing/Marketing-Admin/CustomerGroupPanel.aspx" />
                    <br />
                  <asp:LinkButton ID="lnkBtnCustomerGroup" runat="server" 
                    CssClass ="lblMenu" Font-Names="Verdana" Font-Size="10px" 
                    ToolTip="Manage Customer Group" Font-Bold="True" ForeColor="#666666" 
                      PostBackUrl="~/Marketing/Marketing-Admin/CustomerGroupPanel.aspx">CUSTOMER GROUP</asp:LinkButton>
            </div>
        </div>
        <div style ="float:left; width: 100px; margin-right:5px;">
        <div class="group_title1">
            <span >_____</span> 
            </div>
            <div class ="mnuIcon">
                <asp:ImageButton ID="imgBtnSKUBarcode" runat="server" 
                    ImageUrl="~/Resources/user_roles_grant.png" Height="32px"
                    ToolTip="Manage User Access" 
                    PostBackUrl="~/Marketing/SkuBarcodeManagementPanel.aspx" />
                    <br />
                <asp:Label ID="Label1" runat="server" Text="USER &nbsp; ACCESS" 
                    CssClass ="lblMenu" Font-Names="Verdana" Font-Size="10px" 
                    ToolTip="Manage User Access" Font-Bold="True"></asp:Label>
            </div>
            <div class="group_title1">_____</div>
              <div class ="mnuIcon">
                <asp:ImageButton ID="ImageButton1" runat="server" 
                    ImageUrl="~/Resources/accounting.png" Height="32px"
                    ToolTip="Manage User Level" 
                    PostBackUrl="~/Marketing/Marketing-Admin/UserLevelManagementPanel.aspx" />
                    <br />
                     <asp:LinkButton ID="LinkButton1" runat="server"  CssClass ="lblMenu" 
                    Font-Names="Verdana" Font-Size="10px" 
                    ToolTip="Manage Terms" Font-Bold="True" ForeColor="#666666" 
                    PostBackUrl="~/Marketing/Marketing-Admin/UserLevelManagementPanel.aspx">USER &nbsp;&nbsp; LEVELS</asp:LinkButton>
            </div>
              <div class ="mnuIcon">
                <asp:ImageButton ID="iBtnSubAreagroup" runat="server" 
                    ImageUrl="~/Resources/product_brand.png" Height="34px" Width="47px"
                    ToolTip="Manage Sub-Area Group" 
                    PostBackUrl="~/Marketing/Marketing-Admin/SubAreaGroupManagementPanel.aspx" />
                    <br />
                <asp:LinkButton ID="lnkBtnSubAreaGroup" runat="server" CssClass ="lblMenu" 
                    Font-Names="Verdana" Font-Size="10px" 
                    ToolTip="Manage Sub-Area Group" Font-Bold="True" ForeColor="#666666" 
                    PostBackUrl="~/Marketing/Marketing-Admin/SubAreaGroupManagementPanel.aspx">SUB-AREA&nbsp;&nbsp; GROUP</asp:LinkButton>
            </div>
        </div>
