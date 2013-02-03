<%@ Page Title="" Language="C#" MasterPageFile="~/Marketing/Marketing.Master" AutoEventWireup="true" CodeBehind="MarkDownMemoMenu.aspx.cs" Inherits="IntegratedResourceManagementSystem.Marketing.MarkDownMemoMenu" ViewStateMode="Enabled" EnableViewState="false"  %>

<%@ Register Src ="~/Marketing/controls/MDMemoMenu.ascx" TagName="mdm_menu" TagPrefix ="dc" %>
<asp:Content ID="HeadContent" ContentPlaceHolderID="head" runat="server">
    <link href="controls/styles/memo-menu.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div style ="min-height:500px;">
    <asp:PlaceHolder ID ="phlderMarkDownMemoMenu" runat ="server">
        <dc:mdm_menu ID ="MarkDownMemo" runat="server" />
    </asp:PlaceHolder>
</div>
</asp:Content>
