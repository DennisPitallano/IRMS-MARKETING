<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PullOutletterReport.aspx.cs" Inherits="IntegratedResourceManagementSystem.Reports.ReportForms.PullOutletterReport" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        #gvPullOutLetters
        {
            font-family:Arial;
            font-size:10px;
        }
        #gvPullOutLetters th
        {
            font-weight:bold;
            padding: 3px 3px 2px 3px;
        }
         #gvPullOutLetters tr td
        {
            padding: 3px 5px 2px 5px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div style="font-family:Arial; font-size:11px; font-weight:bold;">
        <table style="">
            <tr>
                <td style="text-align:right;">
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
                <td style="text-align:right;">
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
                <td>
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
        <asp:GridView ID="gvPullOutLetters" runat="server" AutoGenerateColumns="False" 
            ViewStateMode="Disabled">
            <Columns>
                <asp:BoundField DataField="CompanyName" HeaderText="OUTLET/CUSTOMER" />
                <asp:BoundField DataField="BrandName" HeaderText="BRAND" />
                <asp:BoundField DataField="BranchDepartmentCode" 
                    HeaderText="BranchDepartmentCode" Visible="False" />
                <asp:BoundField DataField="BrandDepartmentCode" 
                    HeaderText="BrandDepartmentCode" Visible="False" />
                <asp:BoundField DataField="SeriesNumber" HeaderText="SERIES NUMBER" />
                <asp:BoundField DataField="PulloutDate" DataFormatString="{0:MMMM dd, yyyy}" 
                    HeaderText="PULL OUT DATE" />
                <asp:BoundField DataField="Forwarders" HeaderText="FORWARDERS" />
                <asp:BoundField DataField="TotalQuantity" HeaderText="TOTAL QTY" />
            </Columns>
        </asp:GridView>
    </div>
    </form>
</body>
</html>
