<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PullOutletterReport.aspx.cs"
    Inherits="IntegratedResourceManagementSystem.Reports.ReportForms.PullOutletterReport" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        #gvPullOutLetters
        {
            font-family: Arial;
            font-size: 9px;
        }
        #gvPullOutLetters th
        {
            font-weight: bold;
            padding: 3px 3px 2px 3px;
        }
        #gvPullOutLetters tr td
        {
            padding: 3px 5px 2px 5px;
        }
        #btnPrint,#btnClose
        {
            border: 1px Solid DarkGray;
            font-family: Verdana;
            padding: 3px 7px 3px 7px;
            background: Gray;
            cursor: pointer;
        }
        
        #btnPrint:hover,#btnClose:hover
        {
            background: #ffffff;
        }
    </style>
    <style type="text/css" media="print">
        #btnPrint,#divFilter,#btnClose
        {
            visibility: hidden;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div style="font-family: Arial; font-size: 10px; font-weight: bold;">
        <table style="">
            <tr>
                <td style="text-align: right;">
                    BRAND:
                </td>
                <td>
                    <asp:Label ID="lblBrand" runat="server" Text="Label"></asp:Label>
                </td>
                <td>
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td style="text-align: right;">
                    LETTER STATUS:
                </td>
                <td>
                    <asp:Label ID="lblLetterStatus" runat="server" Text="Label"></asp:Label>
                </td>
                <td>
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td style="text-align: right;">
                    POL FOR:
                </td>
                <td>
                    <asp:Label ID="lblFor" runat="server" Text="Label"></asp:Label>
                </td>
                <td>
                </td>
            </tr>
        </table>
    </div>
    <div>
        <asp:GridView ID="gvPullOutLetters" runat="server" AutoGenerateColumns="False" ViewStateMode="Disabled">
            <Columns>
                <asp:BoundField DataField="CompanyName" HeaderText="OUTLET/CUSTOMER" />
                <asp:BoundField DataField="BrandName" HeaderText="BRAND" />
                <asp:BoundField DataField="BranchDepartmentCode" HeaderText="BranchDepartmentCode"
                    Visible="False" />
                <asp:BoundField DataField="BrandDepartmentCode" HeaderText="BrandDepartmentCode"
                    Visible="False" />
                <asp:BoundField DataField="SeriesNumber" HeaderText="SERIES NUMBER">
                    <ItemStyle Font-Bold="True" />
                </asp:BoundField>
                <asp:BoundField DataField="PulloutDate" DataFormatString="{0:MMMM dd, yyyy}" HeaderText="PULL OUT DATE" />
                <asp:BoundField DataField="Forwarders" HeaderText="FORWARDERS" />
                <asp:BoundField DataField="TotalQuantity" HeaderText="TOTAL QTY" 
                    DataFormatString="{0:###,###}">
                    <ItemStyle Font-Bold="True" HorizontalAlign="Center" />
                </asp:BoundField>
            </Columns>
            <EmptyDataTemplate>
                NO DATA FOUND!
            </EmptyDataTemplate>
        </asp:GridView>
    </div>
    <div style="padding: 10px;">
        <div style="float:left;">
            <input id="btnPrint" type="button" value="PRINT" onclick="window.print()" />
        </div>
        <div id="divFilter" style="float:left; margin-left:10px; font-family:Arial; font-weight:bold; font-size:9px; margin-right:10px; margin-top:5px;">
           POL TYPE: <asp:RadioButtonList ID="rdioFilter" Style="font-family: Arial; font-size: 9px;"
                runat="server" RepeatLayout="Flow" RepeatDirection="Horizontal" 
                AutoPostBack="True" onselectedindexchanged="rdioFilter_SelectedIndexChanged">
                <asp:ListItem Selected="True">ALL</asp:ListItem>
                <asp:ListItem>BACKLOAD</asp:ListItem>
                <asp:ListItem>STOCK TRANSFER</asp:ListItem>
            </asp:RadioButtonList>
        </div>
        <div>
          <input id="btnClose" type="button" value="CLOSE" onclick="window.close()" />
        </div>
    </div>
    </form>
</body>
</html>
