<%@ Page Title="" Language="C#" MasterPageFile="~/Marketing/Marketing.Master" AutoEventWireup="true"
    CodeBehind="DeliveryReceiptsMenu.aspx.cs" Inherits="IntegratedResourceManagementSystem.Marketing.DeliveryReceiptsMenu"
    ViewStateMode="Disabled" %>

<%@ Register Src="~/Marketing/controls/DRMenu.ascx" TagPrefix="irms" TagName="DRMENU" %>
<asp:Content ID="HeadContent" ContentPlaceHolderID="head" runat="server">
    <link href="controls/styles/menu-style.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div style="height: 500px;">
        <asp:UpdatePanel ID="pnlUpdate" runat="server">
            <ContentTemplate>
                <irms:DRMENU ID="dr_menu" runat="server" />
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>
