<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UserManagementMenu.ascx.cs"
    Inherits="IntegratedResourceManagementSystem.Marketing.controls.UserManagementMenu" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<link href="../../Styles/marketing-item-master.css" rel="stylesheet" type="text/css" />
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
        background:url(../../Resources/help.png), -moz-linear-gradient(top,  #eaefb5 0%, #e1e9a0 100%); /* FF3.6+ */
        background:url(../../Resources/help.png), -webkit-gradient(linear, left top, left bottom, color-stop(0%,#eaefb5), color-stop(100%,#e1e9a0)); /* Chrome,Safari4+ */
        background:url(../../Resources/help.png), -webkit-linear-gradient(top,  #eaefb5 0%,#e1e9a0 100%); /* Chrome10+,Safari5.1+ */
        background:url(../../Resources/help.png), -o-linear-gradient(top,  #eaefb5 0%,#e1e9a0 100%); /* Opera 11.10+ */
        background:url(../../Resources/help.png), -ms-linear-gradient(top,  #eaefb5 0%,#e1e9a0 100%); /* IE10+ */
        background:url(../../Resources/help.png), linear-gradient(top,  #eaefb5 0%,#e1e9a0 100%); /* W3C */
        filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#eaefb5', endColorstr='#e1e9a0',GradientType=0 ); /* IE6-9 */
        -moz-border-radius:3px;
        -webkit-border-radius:3px;
        border-radius:3px;
        background-repeat:no-repeat;
        height:22px;
        font-family:Verdana;
        color: #008C2E;
        cursor: pointer;
        padding-left:24px;
        padding-top:3px;
        font-weight:bold;
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
    }
</style>
<div style=" float:left; width: 100px; margin-right: 5px;">
    <div class="mnuIcon">
        <asp:ImageButton ID="imgbtnUser" runat="server" 
            ImageUrl="~/Resources/users.png" Height="42px"
            ToolTip="Manage Users Account" PostBackUrl="~/Marketing/UsersPanel.aspx" />
        <br />
        <asp:LinkButton ID="lnkbtnAccountPanel" runat="server" CssClass="lblMenu" Font-Names="Verdana"
            Font-Size="10px" ToolTip="Manage Users Account" Font-Bold="True" PostBackUrl="~/Marketing/UsersPanel.aspx"
            ForeColor="#666666">USERS</asp:LinkButton>
    </div>
     <div class="mnuIcon">
        <asp:ImageButton ID="ibtnUserRoles" runat="server" ImageUrl="~/Resources/user_roles_grant.png" Height="42px"
             ToolTip="Manage User Account Roles" PostBackUrl="~/Marketing/UserRolesManagementPanel.aspx" />
        <br />
        <asp:LinkButton ID="LinkButton1" runat="server" CssClass="lblMenu" Font-Names="Verdana"
            Font-Size="10px" ToolTip="Manage User Account Roles" Font-Bold="True" PostBackUrl="~/Marketing/UserRolesManagementPanel.aspx"
            ForeColor="#666666">USER ROLES</asp:LinkButton>
    </div>
</div>

<div style=" float:left; width: 100px; margin-right: 5px;">
    <div class="mnuIcon">
        <asp:ImageButton ID="ImageButton1" runat="server" 
            ImageUrl="~/Resources/log.png" Height="42px"
            ToolTip="Manage Users Account" PostBackUrl="~/Marketing/UsersPanel.aspx" />
        <br />
        <asp:LinkButton ID="LinkButton2" runat="server" CssClass="lblMenu" Font-Names="Verdana"
            Font-Size="10px" ToolTip="Manage Users Account" Font-Bold="True" PostBackUrl="~/Marketing/UsersPanel.aspx"
            ForeColor="#666666">USER LOGS</asp:LinkButton>
    </div>
    </div>

<div style=" float:left; width:200px; margin-right: 5px; margin-left:100px;">
     
          <div style="margin-top: 10px;">
            <asp:CollapsiblePanelExtender ID="CollapsiblePanelUsers" runat="server" CollapseControlID="collapseUsers"
                CollapsedText="dennis" ExpandedText="pitallano" TargetControlID="pnlUsers"
                ExpandControlID="collapseUsers" Collapsed="True">
            </asp:CollapsiblePanelExtender>
            <div class="colapseLabelUser">
                <asp:Label ID="collapseUsers" runat="server" Text="Users"
                ToolTip="Users"></asp:Label>
            </div>
            <asp:Panel ID="pnlUsers" CssClass="content" runat="server">
               USers
               sdfs
               <br />
               sdfsd
               fsdf
                <br />
                sdfsdfdsf
            </asp:Panel>
        </div>
        <div style="margin-top:3px;">
            <asp:CollapsiblePanelExtender ID="CollapsiblePanelUserRoles" runat="server"
                CollapseControlID="collapseUsersRoles" CollapsedText="dennis" ExpandedText="pitallano"
                TargetControlID="pnlUsersRoles" ExpandControlID="collapseUsersRoles" Collapsed="True">
            </asp:CollapsiblePanelExtender>
            <div class="colapseLabelUser">
            <asp:Label ID="collapseUsersRoles" runat="server" Text="User Roles"
                ToolTip="Users Roles"></asp:Label>
                </div>
            <asp:Panel ID="pnlUsersRoles" CssClass="content" runat="server">
                Sample Module Description<br />
                Sample Description
            </asp:Panel>
        </div>

        <div style="margin-top:3px;">
            <asp:CollapsiblePanelExtender ID="CollapsiblePanelExtender1" runat="server"
                CollapseControlID="lbluserLogs" CollapsedText="dennis" ExpandedText="pitallano"
                TargetControlID="pnlUseLogs" ExpandControlID="lbluserLogs" Collapsed="True">
            </asp:CollapsiblePanelExtender>
            <div class="colapseLabelUser">
            <asp:Label ID="lbluserLogs" runat="server" Text="User Logs"
                ToolTip="Users Logs"></asp:Label>
                </div>
            <asp:Panel ID="pnlUseLogs" CssClass="content" runat="server">
                Sample Module Description<br />
                Sample Description
            </asp:Panel>
        </div>
</div>

