<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StockInputReportPreview.aspx.cs"
    Inherits="IntegratedResourceManagementSystem.Reports.ReportForms.StockInputReportPreview" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../../Styles/Site.css" rel="stylesheet" type="text/css" />
    <link href="../../Styles/grid.css" rel="stylesheet" type="text/css" />
    <link href="../../Styles/modal-controls.css" rel="stylesheet" type="text/css" />
    <link href="../../Styles/toolbar-controls.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .pager
        {
            font-family: Verdana;
            color: Red;
            font-size: 11px;
            font-weight: bold;
        }
        #gvStockInput th
        {
            padding-left: 5px;
            padding-right: 5px;
            padding-top: 3px;
            padding-bottom: 2px;
        }
        #gvStockInput tr td
        {
            padding-left: 7px;
            padding-right: 5px;
            padding-top: 5px;
            padding-bottom: 5px;
        }
        #hpPrint
        {
            text-decoration: none;
            line-height: 24px;
            padding-right: 5px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div style="padding: 10px;">
        <div class="modalDrag" style="height: 28px;">
            <asp:HyperLink ID="hpPrint" CssClass="btnPrint" Height="24px" runat="server">PRINT</asp:HyperLink>
        </div>
        <div>
            <table style="">
                <tr>
                    <td class="modalLabel">
                        AREA:
                    </td>
                    <td>
                        <asp:TextBox ID="txtArea" ReadOnly="true" CssClass="modalText" Height="22px" Width="180px" runat="server"></asp:TextBox>
                    </td>
                    <td class="modalLabel">
                        SUB-AREA:
                    </td>
                    <td>
                        <asp:TextBox ID="txtSubArea" ReadOnly="true" CssClass="modalText" Height="22px" Width="200px" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="modalLabel">
                        BRAND:
                    </td>
                    <td>
                        <asp:TextBox ID="txtBrand" ReadOnly="true" CssClass="modalText" Height="22px" Width="150px" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td class="modalLabel">
                        DATE RANGE:
                    </td>
                    <td colspan="3">
                        <asp:TextBox ID="txtDateRange" ReadOnly="true" CssClass="modalText" Height="22px" Width="330px" runat="server"></asp:TextBox>
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td class="modalLabel">
                        MEMO STATUS:
                    </td>
                    <td>
                     <asp:TextBox ID="txtMemmoStatus" ReadOnly="true" CssClass="modalText" Height="22px" Width="150px" runat="server"></asp:TextBox>
                    </td>
                </tr>
            </table>
        </div>
        <asp:GridView ID="gvStockInput" CssClass="table_grid" runat="server" AllowSorting="True"
            AutoGenerateColumns="False" CellPadding="4" DataKeyNames="ID" DataSourceID="SqlDataSourceStockInputReport"
            ForeColor="#333333" GridLines="None" AllowPaging="True" PageSize="20">
            <SortedAscendingCellStyle CssClass="asc_cell_style"></SortedAscendingCellStyle>
            <SortedAscendingHeaderStyle  CssClass="asc_cell_style_h"></SortedAscendingHeaderStyle>
            <SortedDescendingCellStyle  CssClass="desc_cell_style"></SortedDescendingCellStyle>
            <SortedDescendingHeaderStyle  CssClass="desc_cell_style_h"></SortedDescendingHeaderStyle>
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="StyleNo" HeaderText="STYLE #" SortExpression="StyleNo" />
                <asp:BoundField DataField="BrandName" HeaderText="BRAND" SortExpression="BrandName" />
                <asp:BoundField DataField="DatePosted" HeaderText="DATE POSTED" SortExpression="DatePosted"
                    DataFormatString="{0:MMMM dd, yyyy}" />
                <asp:BoundField DataField="SRP" HeaderText="SRP" SortExpression="SRP" DataFormatString="{0:###,###.00}">
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="Pickup" HeaderText="PICK-UP PRICE" SortExpression="Pickup"
                    DataFormatString="{0:###,###.00}">
                    <HeaderStyle Font-Size="10px" Wrap="True" />
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
            </Columns>
            <EditRowStyle BackColor="#7C6F57" />
            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <PagerSettings Mode="NumericFirstLast" />
            <PagerStyle CssClass="pager" />
            <RowStyle BackColor="#E3EAEB" />
            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F8FAFA" />
            <SortedAscendingHeaderStyle BackColor="#246B61" />
            <SortedDescendingCellStyle BackColor="#D4DFE1" />
            <SortedDescendingHeaderStyle BackColor="#15524A" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSourceStockInputReport" runat="server" ConnectionString="<%$ ConnectionStrings:IRMSConnectionString %>"
            SelectCommand="SP_GENERATE_STOCK_INPUT_REPORT" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:QueryStringParameter Name="datefrom" QueryStringField="DateFrom" Type="String" />
                <asp:QueryStringParameter Name="dateto" QueryStringField="DateTo" Type="String" />
                <asp:QueryStringParameter DefaultValue="" Name="memostatus" QueryStringField="PriceStatus"
                    Type="String" />
                <asp:QueryStringParameter DefaultValue="" Name="agno" QueryStringField="Area" Type="Int32" />
                <asp:QueryStringParameter DefaultValue="" Name="brandname" QueryStringField="Brand"
                    Type="String" />
                <asp:QueryStringParameter Name="sub_area" QueryStringField="SubArea" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
    </form>
</body>
</html>
