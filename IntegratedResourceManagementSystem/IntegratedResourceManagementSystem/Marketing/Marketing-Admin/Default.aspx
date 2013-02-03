<%@ Page Title="" Language="C#" MasterPageFile="~/Marketing/Marketing-Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="IntegratedResourceManagementSystem.Marketing.Marketing_Admin.Default" %>
<%@ Register Src="~/Marketing/Marketing-Admin/controls/AdminMenuMain.ascx" TagName="admin_menu_main" TagPrefix="irms" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<div style="height:500px;">
    <irms:admin_menu_main id="main_admin_menu" runat="server" />
</div>
</asp:Content>
