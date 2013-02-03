<%@ Page Title="" Language="C#" MasterPageFile="~/Marketing/Marketing.Master" AutoEventWireup="true" CodeBehind="StylePanel.aspx.cs" Inherits="IntegratedResourceManagementSystem.Marketing.StylePanel" ViewStateMode="Disabled" %>
<%@ Register TagPrefix="uc" TagName="style_menu" Src="~/Marketing/controls/ProductStyleMenu.ascx"%>
<%@ Register TagPrefix="uc" TagName="style_summary" Src="~/Marketing/controls/StyleSummary.ascx"%>
<%@ Register TagPrefix="uc" TagName="quick_help" Src="~/Marketing/controls/ItemMasterQuickHelp.ascx"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">
<div style="min-height:500px;">
    <div style ="float: left; margin-right :70px; ">
    <asp:PlaceHolder ID="pHolderStyleMenu" runat="server">
        <uc:style_menu  ID ="style_menu" runat ="server" />
    </asp:PlaceHolder>
    </div>
    <div>
    <asp:PlaceHolder ID ="pHolderStyleSummary" runat ="server">
      <uc:style_summary ID ="style_summary" runat ="server" />
    </asp:PlaceHolder>
    </div>
    <div>
    <asp:PlaceHolder ID ="pHolderHelp" runat ="server">
      <uc:quick_help ID ="quickhelp" runat ="server" />
    </asp:PlaceHolder>
    </div>
</div>
</asp:Content>
