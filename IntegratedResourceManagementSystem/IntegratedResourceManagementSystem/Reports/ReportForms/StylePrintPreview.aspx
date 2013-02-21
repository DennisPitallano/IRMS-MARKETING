<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StylePrintPreview.aspx.cs"
    Inherits="IntegratedResourceManagementSystem.Reports.ReportForms.StylePrintPreview" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>STYLE</title>
    <style type="text/css">
        #gvProducts th 
        {
            padding:2px 5px;
        }
        #gvProducts tr td
        {
            padding:2px 5px;
        }
    </style>
    <style type="text/css" media="print">
        #imgClose,#btnPrint,#pnlClose
        {
            visibility:hidden;
            width:0px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div style="font-family: Arial;">
        <div id="pnlClose" style="float: right; cursor: pointer;">
            <img src="../../Resources/cancel_normal.png" alt="" id="imgClose" title="CLOSE WINDOW" onclick="window.close()"
                class="close_btn" />
        </div>
        <div  style=" cursor: pointer; font-size:11px;">
            <div style="height: 12px; font-weight:bold; border-bottom:1px Solid #000000; padding-bottom:3px;">
                STYLE INFO.
            </div>
            <div class="form" style=" border-bottom:1px Solid #000000; padding-bottom:3px;">
                <table style="">
                    <tr>
                        <td style="text-align:right; font-weight:bold;">
                            STYLE #:
                        </td>
                        <td>
                            <asp:Label ID="lblStyleNumber" Height="20px" Style="padding-right: 3px;
                                line-height: 20px;" runat="server" Text="Label"></asp:Label>
                        </td>
                        <td  style="text-align:right; font-weight:bold;">
                            COST PRICE:
                        </td>
                        <td>
                            <asp:Label ID="lblCostPrice" Height="20px" Style="padding-right: 3px;
                                line-height: 20px;" runat="server" Text="Label"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td  style="text-align:right; font-weight:bold;">
                            BRAND:
                        </td>
                        <td>
                            <asp:Label ID="lblBrand" Height="20px" Style="padding-right: 3px;
                                line-height: 20px;" runat="server" Text="Label"></asp:Label>
                        </td>
                        <td  style="text-align:right; font-weight:bold;">
                            DESCRIPTION:
                        </td>
                        <td>
                            <asp:Label ID="lblStyleDescription" Height="20px" Style="padding-right: 3px;
                                line-height: 20px;" runat="server" Text="Label"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td  style="text-align:right; font-weight:bold;">
                            FABRIC:
                        </td>
                        <td>
                            <asp:Label ID="lblFabric"  Height="20px" Style="padding-right: 3px;
                                line-height: 20px;" runat="server" Text="Label"></asp:Label>
                        </td>
                        <td>
                        </td>
                        <td>
                        </td>
                    </tr>
                    <tr>
                        <td  style="text-align:right; font-weight:bold;">
                            FITTING:
                        </td>
                        <td>
                            <asp:Label ID="lblFitting"  Height="20px" Style="padding-right: 3px;
                                line-height: 20px;" runat="server" Text="Label"></asp:Label>
                        </td>
                        <td style="text-align:right; font-weight:bold;">
                        STYLE STATUS:
                        </td>
                        <td>
                            <asp:CheckBox  Font-Italic="true" Font-Bold="true"
                                Height="20px" Style="padding-right: 5px; border-radius: 3px;" ID="chkIsActive"
                                Text="ACTIVE" Enabled="false" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td  style="text-align:right; font-weight:bold;">
                            SUB-FITTING:
                        </td>
                        <td>
                            <asp:Label ID="lblSubFitting" Height="20px" Style="padding-right: 3px;
                                line-height: 20px;" runat="server" Text="Label"></asp:Label>
                        </td>
                        <td>
                        </td>
                        <td>
                        </td>
                    </tr>
                </table>
            </div>
            
        </div>
        <div style="float: left; margin: 10px;">
            <div style="height: 12px; font-size: 11px; margin-bottom:2px; font-weight:bold;">
                STYLE PRODUCTS</div>
            <div class="form" style="font-size: 10px;">
                <asp:GridView ID="gvProducts"  runat="server" AutoGenerateColumns="False">
                    <Columns>
                        <asp:BoundField DataField="SKU" HeaderText="SKU">
                            <ItemStyle Font-Bold="True" ForeColor="Black" />
                        </asp:BoundField>
                        <asp:BoundField DataField="StyleDescription" HeaderText="DESCRIPTION" />
                        <asp:BoundField DataField="StyleColor" HeaderText="COLOR">
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="StyleSize" HeaderText="SIZE">
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Price" HeaderText="SRP" DataFormatString="{0:###,###.00}">
                            <ItemStyle Font-Bold="True" ForeColor="#CC0000" HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="ItemCode" HeaderText="ITEM CODE" />
                        <asp:BoundField DataField="APType" HeaderText="CATEGORY">
                            <ItemStyle Font-Bold="True" HorizontalAlign="Center" />
                        </asp:BoundField>
                    </Columns>
                    <EmptyDataTemplate>
                        <img src="../../Resources/unhappy.png" alt="" align="left" />
                        PRODUCTS NOT FOUND!
                    </EmptyDataTemplate>
                </asp:GridView>
            </div>
            <div style="margin:30px;">
                <input id="btnPrint" type="button" value="PRINT" onclick="window.print()" />
        </div>
        </div>
        
    </div>
    </form>
</body>
</html>
