<%@ Page Title="" Language="C#" MasterPageFile="~/Marketing/Marketing.Master" AutoEventWireup="true" CodeBehind="ReturnsAndTransferReportPanel.aspx.cs" Inherits="IntegratedResourceManagementSystem.Marketing.ReturnsAndTransferReportPanel" %>
<asp:Content ID="HeadContent" ContentPlaceHolderID="head" runat="server">
    <link href="../Styles/returns-and-transfer.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="panelTitle">
        <asp:Image ID="imgpnlTitle" runat="server" ImageUrl="~/Resources/memo-doc.png" ImageAlign="Top"
            Height="28px" />Report Generator Panel
        <div style="float: right; height: 24px;">
            <a href="ReturnAndTransfer.aspx"><img alt="BACK" src="../Resources/reply.png" alt="BACK" /></a>
        </div>
    </div>
    
    <div style="min-height:450px;">
    
    </div>
</asp:Content>