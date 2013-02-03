<%@ Page Title="" Language="C#" MasterPageFile="~/Marketing/Marketing.Master" AutoEventWireup="true" CodeBehind="CustomerMenuPanel.aspx.cs" Inherits="IntegratedResourceManagementSystem.Marketing.CustomerMenuPanel" %>
<%@ Register Src="~/Marketing/controls/CustomerItemMenu.ascx" TagName ="customer_menu" TagPrefix ="uc" %>
<asp:Content ID="HeadContent" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
 <div style ="height:440px;">
    <asp:PlaceHolder ID="pHolderStyleMenu" runat="server">
        <uc:customer_menu  ID ="style_menu" runat ="server" />
    </asp:PlaceHolder>
    </div>
</asp:Content>
