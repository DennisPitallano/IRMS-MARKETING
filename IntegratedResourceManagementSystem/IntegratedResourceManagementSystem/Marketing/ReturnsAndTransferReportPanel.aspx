<%@ Page Title="" Language="C#" MasterPageFile="~/Marketing/Marketing.Master" AutoEventWireup="true"
    CodeBehind="ReturnsAndTransferReportPanel.aspx.cs" Inherits="IntegratedResourceManagementSystem.Marketing.ReturnsAndTransferReportPanel" %>

<asp:Content ID="HeadContent" ContentPlaceHolderID="head" runat="server">
    <link href="../Styles/returns-and-transfer.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/cdi-reports.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="panelTitle">
        <asp:Image ID="imgpnlTitle" runat="server" ImageUrl="~/Resources/memo-doc.png" ImageAlign="Top"
            Height="28px" />Report Generator Panel
        <div style="float: right; height: 24px;">
            <a href="ReturnAndTransfer.aspx">
                <img alt="BACK" src="../Resources/reply.png" alt="BACK" /></a>
        </div>
    </div>
    <div style="min-height: 450px;">
        <div class="generator" style="width:200px;">
            <div class="modalDrag" >
                <div class="sizeLogo" style="font-variant:small-caps; font-size:8px; text-align:center; font-family:Verdana;">
                    PULL OUT LETTER REPORT GENERATOR</div>
            </div>
            <div  style="margin: 5px 10px;">
                    BRAND:
                <asp:DropDownList ID="DDLBrands" CssClass="modalText" Height="22px" runat="server" 
                        AutoPostBack="True" onselectedindexchanged="DDLBrands_SelectedIndexChanged">
                </asp:DropDownList>
            </div>
            <div class="group-area">
                <div style="margin: 5px 5px;">
                    LETTER STATUS</div>
                <asp:RadioButtonList ID="rdioAreaGroup" runat="server" AutoPostBack="True" 
                    onselectedindexchanged="rdioAreaGroup_SelectedIndexChanged">
                    <asp:ListItem Selected="True">ALL</asp:ListItem>
                    <asp:ListItem>PENDING</asp:ListItem>
                    <asp:ListItem>SENT</asp:ListItem>
                    <asp:ListItem>RECIEVED</asp:ListItem>
                    <asp:ListItem>CANCEL</asp:ListItem>
                </asp:RadioButtonList>
            </div>
            <div class="group-area" style="width:170px;">
                <div style="margin: 5px 5px;">
                    POL FOR:</div>
                <asp:RadioButtonList ID="rdioPOLFor" runat="server" AutoPostBack="True" 
                    RepeatDirection="Horizontal" 
                    onselectedindexchanged="rdioPOLFor_SelectedIndexChanged">
                    <asp:ListItem Selected="True">ALL</asp:ListItem>
                    <asp:ListItem Value="True">SM</asp:ListItem>
                    <asp:ListItem Value="False">NON-SM</asp:ListItem>
                </asp:RadioButtonList>
            </div>
            <div style="height: 25px; margin:5px; text-align: center;">
                <asp:HyperLink ID="hpLinkPrint"  Height="18px" Target="_blank" CssClass="btnPrint print-link"
                    runat="server">GENERATE REPORT</asp:HyperLink>
            </div>
        </div>
</asp:Content>
