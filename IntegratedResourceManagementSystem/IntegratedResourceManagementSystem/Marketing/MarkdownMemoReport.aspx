<%@ Page Title="" Language="C#" MasterPageFile="~/Marketing/Marketing.Master" AutoEventWireup="true" CodeBehind="MarkdownMemoReport.aspx.cs" Inherits="IntegratedResourceManagementSystem.Marketing.MarkdownMemoReport" %>
<%@ Register Src="~/Marketing/controls/UCLoader.ascx" TagName="LOADER" TagPrefix="UC" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<link href="../Styles/cdi-reports.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<div>
   <asp:Label ID="Label1" runat="server" Text="MARKDOWN REPORTS"></asp:Label>

   <br />
   <br />
    <asp:RadioButtonList ID="rdoReportSelection" runat="server" Height="74px" 
        Width="313px" 
        onselectedindexchanged="rdoReportSelection_SelectedIndexChanged" 
        AutoPostBack="True">
        <asp:ListItem Value="rpt1">
                  Markdown Summary Per Memo Report
        </asp:ListItem>
        <asp:ListItem Value="rpt2">
                  Markdown Summary Per Brand Report
        </asp:ListItem>
        <asp:ListItem Value="rpt3">
                  Consolidated Brand Markdown Summary Report
        </asp:ListItem>
    </asp:RadioButtonList>
</div>
<br />
<br />
<div>
    <table>
         <tr>
        <td>BRAND
        </td>
        <td>
            <asp:DropDownList ID="DlBrandList" runat="server" Height="20px" Width="229px" 
                AutoPostBack = true onselectedindexchanged="DlBrandList_SelectedIndexChanged">
            </asp:DropDownList>       
        </td>
    </tr>
         <tr>
        <td>DATE FROM&nbsp;
        </td>
    <td>
        <asp:TextBox ID="txtDateFrom" runat="server" 
            ontextchanged="txtDateFrom_TextChanged"></asp:TextBox>
        <asp:CalendarExtender ID="txtDateFrom_CalendarExtender" runat="server" Enabled="True"
                                TargetControlID="txtDateFrom"></asp:CalendarExtender>
    </td>
    </tr>
         <tr>
        <td>DATE TO&nbsp;
        </td>
    <td>
        <asp:TextBox ID="txtDateTo" runat="server" 
            ontextchanged="txtDateTo_TextChanged"></asp:TextBox>
        <asp:CalendarExtender ID="txtDateTo_CalendarExtender" runat="server" Enabled="True"
                                TargetControlID="txtDateTo"></asp:CalendarExtender>
    </td>
    </tr>
    <tr>
        <td colspan = "2"></td>
    </tr>
    <tr>
    <td colspan="2" align="center">
         <asp:HyperLink ID="hpLinkPrint" Height="22px" Target="_blank" CssClass="btnPrint print-link"
                            runat="server">GENERATE</asp:HyperLink>
        
        
        
        &nbsp
        &nbsp
         <asp:HyperLink ID="hpLinkBack" Height="22px" CssClass="btnPrint print-link"
                            runat="server" 
             NavigateUrl="~/Marketing/MarkDownMemoMenu.aspx">BACK</asp:HyperLink>
    </td>
    </tr>
    </table>
</div>
<div>
    
</div>
</asp:Content>
