<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AdminMenu.ascx.cs" Inherits="IntegratedResourceManagementSystem.Marketing.Marketing_Admin.controls.AdminMenu" %>

<style type="text/css">
  .menu_wrapper
  {
       height:50px;
     
        display:inline-block;
       
      -webkit-border-radius: 20px 5px 20px 5px;
        border-radius: 20px 5px 20px 5px;
         border: 1px Solid #C9C9C9;
       -webkit-box-shadow:  1px 1px 1px 1px  rgb(238,238,238);        
        box-shadow:  1px 1px 1px 1px  rgb(238,238,238);
        padding-right:25px;
        padding-left:15px;
      
background: rgb(238,238,238); /* Old browsers */
/* IE9 SVG, needs conditional override of 'filter' to 'none' */
background: url(data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiA/Pgo8c3ZnIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgd2lkdGg9IjEwMCUiIGhlaWdodD0iMTAwJSIgdmlld0JveD0iMCAwIDEgMSIgcHJlc2VydmVBc3BlY3RSYXRpbz0ibm9uZSI+CiAgPGxpbmVhckdyYWRpZW50IGlkPSJncmFkLXVjZ2ctZ2VuZXJhdGVkIiBncmFkaWVudFVuaXRzPSJ1c2VyU3BhY2VPblVzZSIgeDE9IjAlIiB5MT0iMCUiIHgyPSIwJSIgeTI9IjEwMCUiPgogICAgPHN0b3Agb2Zmc2V0PSIwJSIgc3RvcC1jb2xvcj0iI2VlZWVlZSIgc3RvcC1vcGFjaXR5PSIxIi8+CiAgICA8c3RvcCBvZmZzZXQ9IjEwMCUiIHN0b3AtY29sb3I9IiNjY2NjY2MiIHN0b3Atb3BhY2l0eT0iMSIvPgogIDwvbGluZWFyR3JhZGllbnQ+CiAgPHJlY3QgeD0iMCIgeT0iMCIgd2lkdGg9IjEiIGhlaWdodD0iMSIgZmlsbD0idXJsKCNncmFkLXVjZ2ctZ2VuZXJhdGVkKSIgLz4KPC9zdmc+);
background: -moz-linear-gradient(top,  rgba(238,238,238,1) 0%, rgba(204,204,204,1) 100%); /* FF3.6+ */
background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,rgba(238,238,238,1)), color-stop(100%,rgba(204,204,204,1))); /* Chrome,Safari4+ */
background: -webkit-linear-gradient(top,  rgba(238,238,238,1) 0%,rgba(204,204,204,1) 100%); /* Chrome10+,Safari5.1+ */
background: -o-linear-gradient(top,  rgba(238,238,238,1) 0%,rgba(204,204,204,1) 100%); /* Opera 11.10+ */
background: -ms-linear-gradient(top,  rgba(238,238,238,1) 0%,rgba(204,204,204,1) 100%); /* IE10+ */
background: linear-gradient(to bottom,  rgba(238,238,238,1) 0%,rgba(204,204,204,1) 100%); /* W3C */
filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#eeeeee', endColorstr='#cccccc',GradientType=0 ); /* IE6-8 */
       
  }
  
     .mnuIcon
    {
        display:inline-block;
        width:50px;
        height:45px;
        background-image:url('../../Resources/submenu45.png');
        background-repeat:no-repeat;
        padding-left:1px;
        margin-left:5px;
        margin-top:2px;
        padding-top: 2px;
        color:#666666;
        text-align:center;
    }
     .mnuIcon:hover
    {
        color: #259625;
       -moz-transform: scale(1.22) rotate(5deg) translate(1px, 1px) skew(1deg, 1deg);
        -webkit-transform: scale(1.22) rotate(5deg) translate(1px, 1px) skew(1deg, 1deg);
        -o-transform: scale(1.22) rotate(5deg) translate(1px, 1px) skew(1deg, 1deg);
        -ms-transform: scale(1.22) rotate(5deg) translate(1px, 1px) skew(1deg, 1deg);
        transform: scale(1.22) rotate(5deg) translate(1px, 1px) skew(1deg, 1deg);
    }
   .linkMenu
   {
       font-size:8px;
       font-family:Verdana;
       font-weight:bold;
   }
</style>

<div class="menu_wrapper">  
   <div class ="mnuIcon">
              <div>  
                  <asp:ImageButton ID="imgBtnManageUsers" runat="server" 
                    ImageUrl="~/Resources/contacts.png" Height="16px" Width="18px" 
                    ToolTip="Manage Users" 
                    PostBackUrl="~/Marketing/Marketing-Admin/UserManagementPanel.aspx" />
                    </div>
                 <a class="lblMenu linkMenu" title="Manage Users Account" href="UserManagementPanel.aspx" >MANAGE USERS</a>
   </div>

   <div class ="mnuIcon">
              <div>  
                  <asp:ImageButton ID="ImageButton1" runat="server" 
                    ImageUrl="~/Resources/log.png" Height="16px" Width="18px" 
                    ToolTip="Manage Users" 
                    PostBackUrl="~/Marketing/Marketing-Admin/AuditTrails.aspx" />
                    </div>
                <asp:LinkButton ID="LinkButton1" runat="server" CssClass ="lblMenu" 
                    Font-Names="Verdana" Font-Size="8px" 
                    ToolTip="Manage Users" Font-Bold="True"
                    PostBackUrl="~/Marketing/Marketing-Admin/AuditTrails.aspx" >AUDIT TRAILS</asp:LinkButton>
   </div>

    <div class ="mnuIcon">
              <div>  <asp:ImageButton ID="ImageButton2" runat="server" 
                    ImageUrl="~/Resources/user_roles_grant.png" Height="16px" Width="18px" 
                    ToolTip="Manage Users" 
                    PostBackUrl="#" />
                    </div>
                <asp:LinkButton ID="LinkButton2" runat="server" CssClass ="lblMenu" 
                    Font-Names="Verdana" Font-Size="8px" 
                    ToolTip="Manage Users" Font-Bold="True"
                    PostBackUrl="#" >USER ACCESS</asp:LinkButton>
   </div>
  
    <div class ="mnuIcon">
              <div>  
                  <asp:ImageButton ID="ImageButton3" runat="server" 
                    ImageUrl="~/Resources/product_brand.png" Height="16px" Width="18px" 
                    ToolTip="Manage Department" 
                    PostBackUrl="~/Marketing/Marketing-Admin/DepartmentManagementPanel.aspx" />
                    </div>
                <asp:LinkButton ID="LinkButton3" runat="server" CssClass ="lblMenu" 
                    Font-Names="Verdana" Font-Size="8px" 
                    ToolTip="Manage Department" Font-Bold="True"
                    
                  PostBackUrl="~/Marketing/Marketing-Admin/DepartmentManagementPanel.aspx" >MANAGE DEPT.</asp:LinkButton>
   </div>

   <div class ="mnuIcon">
              <div>  
                  <asp:ImageButton ID="ImageButton4" runat="server" 
                    ImageUrl="~/Resources/adjustment.png" Height="16px" Width="18px" 
                    ToolTip="Manage Terms" 
                    PostBackUrl="~/Marketing/Marketing-Admin/TermManagementPanel.aspx" />
                    </div>
                <asp:LinkButton ID="LinkButton4" runat="server" CssClass ="lblMenu" 
                    Font-Names="Verdana" Font-Size="8px" 
                    ToolTip="Manage Terms" Font-Bold="True"
                    PostBackUrl="~/Marketing/Marketing-Admin/TermManagementPanel.aspx" >MANAGE TERMS</asp:LinkButton>
   </div>
    
   <div class ="mnuIcon">
              <div>  
                  <asp:ImageButton ID="ImageButton5" runat="server" 
                    ImageUrl="~/Resources/accounting.png" Height="16px" Width="18px" 
                    ToolTip="Manage User Levels" 
                    PostBackUrl="~/Marketing/Marketing-Admin/UserLevelManagementPanel.aspx" />
                    </div>
                <asp:LinkButton ID="LinkButton5" runat="server" CssClass ="lblMenu" 
                    Font-Names="Verdana" Font-Size="8px" 
                    ToolTip="Manage User Levels" Font-Bold="True"
                    PostBackUrl="~/Marketing/Marketing-Admin/UserLevelManagementPanel.aspx" >USER LEVELS</asp:LinkButton>
   </div>

    <div class ="mnuIcon">
              <div>  
                  <asp:ImageButton ID="ImageButton13" runat="server" 
                    ImageUrl="~/Resources/product_brand.png" Height="16px" Width="18px" 
                    ToolTip="Manage Price Types" 
                    PostBackUrl="~/Marketing/Marketing-Admin/PriceTypeManagementPanel.aspx" />
                    </div>
                <asp:LinkButton ID="LinkButton13" runat="server" CssClass ="lblMenu" 
                    Font-Names="Verdana" Font-Size="8px" 
                    ToolTip="Manage Price Types" Font-Bold="True"
                    PostBackUrl="~/Marketing/Marketing-Admin/PriceTypeManagementPanel.aspx" >PRICE TYPES</asp:LinkButton>
   </div>

   <div class ="mnuIcon">
              <div>  
                  <asp:ImageButton ID="ImageButton6" runat="server" 
                    ImageUrl="~/Resources/product_brand.png" Height="16px" Width="18px" 
                    ToolTip="Manage Price Group" 
                    PostBackUrl="~/Marketing/Marketing-Admin/PriceGroupManagementPanel.aspx" />
                    </div>
                <asp:LinkButton ID="LinkButton6" runat="server" CssClass ="lblMenu" 
                    Font-Names="Verdana" Font-Size="8px" 
                    ToolTip="Manage Price Group" Font-Bold="True"
                  PostBackUrl="~/Marketing/Marketing-Admin/PriceGroupManagementPanel.aspx" >PRICE GROUP</asp:LinkButton>
   </div>

   <div class ="mnuIcon">
              <div>  
                  <asp:ImageButton ID="ImageButton7" runat="server" 
                    ImageUrl="~/Resources/product_brand.png" Height="16px" Width="18px" 
                    ToolTip="Manage Area Group" 
                    PostBackUrl="~/Marketing/Marketing-Admin/AreaGroupManagementPanel.aspx" />
                    </div>
                <asp:LinkButton ID="LinkButton7" runat="server" CssClass ="lblMenu" 
                    Font-Names="Verdana" Font-Size="8px" 
                    ToolTip="Manage Area Group" Font-Bold="True"
                    PostBackUrl="~/Marketing/Marketing-Admin/AreaGroupManagementPanel.aspx" >AREA GROUP</asp:LinkButton>
   </div>

    <div class ="mnuIcon">
              <div>  
                  <asp:ImageButton ID="ImageButton8" runat="server" 
                    ImageUrl="~/Resources/product_brand.png" Height="16px" Width="18px" 
                    ToolTip="Manage Sub-Area Group" 
                    PostBackUrl="~/Marketing/Marketing-Admin/SubAreaGroupManagementPanel.aspx" />
                    </div>
                <asp:LinkButton ID="LinkButton8" runat="server" CssClass ="lblMenu" 
                    Font-Names="Verdana" Font-Size="8px" 
                    ToolTip="Manage Sub-Area Group" Font-Bold="True"
                    
                  PostBackUrl="~/Marketing/Marketing-Admin/SubAreaGroupManagementPanel.aspx" >SUB-AREA GROUP</asp:LinkButton>
   </div>

     <div class ="mnuIcon">
              <div>  
                  <asp:ImageButton ID="ImageButton9" runat="server" 
                    ImageUrl="~/Resources/product_summary.png" Height="16px" Width="18px" 
                    ToolTip="Manage Formulas" 
                    PostBackUrl="~/Marketing/Marketing-Admin/FormulaManagementPanel.aspx" />
                    </div>
                <asp:LinkButton ID="LinkButton9" runat="server" CssClass ="lblMenu" 
                    Font-Names="Verdana" Font-Size="8px" 
                    ToolTip="Manage Formulas" Font-Bold="True"
                    PostBackUrl="~/Marketing/Marketing-Admin/FormulaManagementPanel.aspx" >MANAGE FORMULA</asp:LinkButton>
   </div>

    <div class ="mnuIcon">
              <div>  
                  <asp:ImageButton ID="ImageButton10" runat="server" 
                    ImageUrl="~/Resources/adjustment.png" Height="16px" Width="18px" 
                    ToolTip="Manage Arrangement Types" 
                    PostBackUrl="~/Marketing/Marketing-Admin/ArrangementManagementPanel.aspx" />
                    </div>
                <asp:LinkButton ID="LinkButton10" runat="server" CssClass ="lblMenu" 
                    Font-Names="Verdana" Font-Size="8px" 
                    ToolTip="Manage Arrangement Types" Font-Bold="True"
                    
                  PostBackUrl="~/Marketing/Marketing-Admin/ArrangementManagementPanel.aspx" >Arrange- ment Type</asp:LinkButton>
   </div>

    <div class ="mnuIcon">
              <div>  
                  <asp:ImageButton ID="ImageButton11" runat="server" 
                    ImageUrl="~/Resources/product_brand.png" Height="16px" Width="18px" 
                    ToolTip="Manage Company" 
                    PostBackUrl="~/Marketing/Marketing-Admin/CompanyManagementPanel.aspx" />
                    </div>
                <asp:LinkButton ID="LinkButton11" runat="server" CssClass ="lblMenu" 
                    Font-Names="Verdana" Font-Size="8px" 
                    ToolTip="Manage Company" Font-Bold="True"
                    PostBackUrl="~/Marketing/Marketing-Admin/CompanyManagementPanel.aspx" >MANAGE COMPANY</asp:LinkButton>
   </div>

    <div class ="mnuIcon">
              <div>  
                  <asp:ImageButton ID="ImageButton12" runat="server" 
                    ImageUrl="~/Resources/product_brand.png" Height="16px" Width="18px" 
                    ToolTip="Manage Customer Group" 
                    PostBackUrl="~/Marketing/Marketing-Admin/CustomerGroupPanel.aspx" />
                    </div>
                <asp:LinkButton ID="LinkButton12" runat="server" CssClass ="lblMenu" 
                    Font-Names="Verdana" Font-Size="8px" 
                    ToolTip="Manage Customer Group" Font-Bold="True"
                    PostBackUrl="~/Marketing/Marketing-Admin/CustomerGroupPanel.aspx" >Customer Group</asp:LinkButton>
   </div>
</div>