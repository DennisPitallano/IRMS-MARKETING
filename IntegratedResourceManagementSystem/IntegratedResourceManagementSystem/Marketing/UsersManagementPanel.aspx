<%@ Page Title="" Language="C#" MasterPageFile="~/Marketing/Marketing.Master" AutoEventWireup="true" CodeBehind="UsersManagementPanel.aspx.cs" Inherits="IntegratedResourceManagementSystem.Marketing.UsersManagementPanel" %>
<%@ Register TagPrefix="irms" TagName="user_menu" Src="~/Marketing/controls/UserManagementMenu.ascx"%>
<asp:Content ID="HeadContent" ContentPlaceHolderID="head" runat="server">

</asp:Content>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
 <div style ="float: left; margin-right : 150px;  height:445px;">
    <asp:PlaceHolder ID="pHolderUserMenu" runat="server">
        <irms:user_menu  ID ="usermenu" runat ="server" />
    </asp:PlaceHolder>
    </div>
</asp:Content>
