<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PrintStylePrices.aspx.cs"
    Inherits="IntegratedResourceManagementSystem.Reports.ReportForms.PrintStylePrices" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>STYLE PRICES</title>
   
    <style type="text/css">
            .btnPrintPreview
     {
        font-family:Verdana ;
        font-weight :bold;
        font-size: 11px;
        height : 25px;
        text-align :right;
        
        background: #eeeeee; /* Old browsers */
background: -moz-linear-gradient(top,  #eeeeee 0%, #eeeeee 100%); /* FF3.6+ */
background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#eeeeee), color-stop(100%,#eeeeee)); /* Chrome,Safari4+ */
background: -webkit-linear-gradient(top,  #eeeeee 0%,#eeeeee 100%); /* Chrome10+,Safari5.1+ */
background: -o-linear-gradient(top,  #eeeeee 0%,#eeeeee 100%); /* Opera 11.10+ */
background: -ms-linear-gradient(top,  #eeeeee 0%,#eeeeee 100%); /* IE10+ */
background: linear-gradient(to bottom,  #eeeeee 0%,#eeeeee 100%); /* W3C */
filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#eeeeee', endColorstr='#eeeeee',GradientType=0 ); /* IE6-9 */

        
        background: rgb(252,234,187); /* Old browsers */
        /* IE9 SVG, needs conditional override of 'filter' to 'none' */
        background: url(data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiA/Pgo8c3ZnIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgd2lkdGg9IjEwMCUiIGhlaWdodD0iMTAwJSIgdmlld0JveD0iMCAwIDEgMSIgcHJlc2VydmVBc3BlY3RSYXRpbz0ibm9uZSI+CiAgPGxpbmVhckdyYWRpZW50IGlkPSJncmFkLXVjZ2ctZ2VuZXJhdGVkIiBncmFkaWVudFVuaXRzPSJ1c2VyU3BhY2VPblVzZSIgeDE9IjAlIiB5MT0iMCUiIHgyPSIwJSIgeTI9IjEwMCUiPgogICAgPHN0b3Agb2Zmc2V0PSIwJSIgc3RvcC1jb2xvcj0iI2ZjZWFiYiIgc3RvcC1vcGFjaXR5PSIxIi8+CiAgICA8c3RvcCBvZmZzZXQ9IjUwJSIgc3RvcC1jb2xvcj0iI2ZjY2Q0ZCIgc3RvcC1vcGFjaXR5PSIxIi8+CiAgICA8c3RvcCBvZmZzZXQ9IjUxJSIgc3RvcC1jb2xvcj0iI2Y4YjUwMCIgc3RvcC1vcGFjaXR5PSIxIi8+CiAgICA8c3RvcCBvZmZzZXQ9IjEwMCUiIHN0b3AtY29sb3I9IiNmYmRmOTMiIHN0b3Atb3BhY2l0eT0iMSIvPgogIDwvbGluZWFyR3JhZGllbnQ+CiAgPHJlY3QgeD0iMCIgeT0iMCIgd2lkdGg9IjEiIGhlaWdodD0iMSIgZmlsbD0idXJsKCNncmFkLXVjZ2ctZ2VuZXJhdGVkKSIgLz4KPC9zdmc+);
        background:url('../../Resources/Excel.png'),  -moz-linear-gradient(top,  rgba(252,234,187,1) 0%, rgba(252,205,77,1) 50%, rgba(248,181,0,1) 51%, rgba(251,223,147,1) 100%); /* FF3.6+ */
        background:url('../../Resources/print_gray.png'),  -webkit-gradient(linear, left top, left bottom, color-stop(0%,rgba(252,234,187,1)), color-stop(50%,rgba(252,205,77,1)), color-stop(51%,rgba(248,181,0,1)), color-stop(100%,rgba(251,223,147,1))); /* Chrome,Safari4+ */
        background: url('../../Resources/print_gray.png'), -webkit-linear-gradient(top,  rgba(252,234,187,1) 0%,rgba(252,205,77,1) 50%,rgba(248,181,0,1) 51%,rgba(251,223,147,1) 100%); /* Chrome10+,Safari5.1+ */
        background: url('../../Resources/print_gray.png'), -o-linear-gradient(top,  rgba(252,234,187,1) 0%,rgba(252,205,77,1) 50%,rgba(248,181,0,1) 51%,rgba(251,223,147,1) 100%); /* Opera 11.10+ */
        background: url('../../Resources/print_gray.png'),-ms-linear-gradient(top,  rgba(252,234,187,1) 0%,rgba(252,205,77,1) 50%,rgba(248,181,0,1) 51%,rgba(251,223,147,1) 100%); /* IE10+ */
        background:url('../../Resources/print_gray.pngg'), linear-gradient(to bottom,  rgba(252,234,187,1) 0%,rgba(252,205,77,1) 50%,rgba(248,181,0,1) 51%,rgba(251,223,147,1) 100%); /* W3C */
        ilter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#fceabb', endColorstr='#fbdf93',GradientType=0 ); /* IE6-8 */

        background-repeat:no-repeat;
        background-position:left;
        color:#775c16;
        padding-left:20px;      
        cursor:pointer;
        text-shadow: 1px 1px 1px #E0E0E0;
        border-radius:5px 3px 5px 3px;
        border:1px Solid #7F921C;
      }

    .btnPrintPreview:hover
     {
        background: rgb(249,198,103); /* Old browsers */
        /* IE9 SVG, needs conditional override of 'filter' to 'none' */
        background: url(data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiA/Pgo8c3ZnIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgd2lkdGg9IjEwMCUiIGhlaWdodD0iMTAwJSIgdmlld0JveD0iMCAwIDEgMSIgcHJlc2VydmVBc3BlY3RSYXRpbz0ibm9uZSI+CiAgPGxpbmVhckdyYWRpZW50IGlkPSJncmFkLXVjZ2ctZ2VuZXJhdGVkIiBncmFkaWVudFVuaXRzPSJ1c2VyU3BhY2VPblVzZSIgeDE9IjAlIiB5MT0iMCUiIHgyPSIwJSIgeTI9IjEwMCUiPgogICAgPHN0b3Agb2Zmc2V0PSIwJSIgc3RvcC1jb2xvcj0iI2Y5YzY2NyIgc3RvcC1vcGFjaXR5PSIxIi8+CiAgICA8c3RvcCBvZmZzZXQ9IjEwMCUiIHN0b3AtY29sb3I9IiNmNzk2MjEiIHN0b3Atb3BhY2l0eT0iMSIvPgogIDwvbGluZWFyR3JhZGllbnQ+CiAgPHJlY3QgeD0iMCIgeT0iMCIgd2lkdGg9IjEiIGhlaWdodD0iMSIgZmlsbD0idXJsKCNncmFkLXVjZ2ctZ2VuZXJhdGVkKSIgLz4KPC9zdmc+);
        background:url('../../Resources/print_normal.png'),  -moz-linear-gradient(top,  rgba(249,198,103,1) 0%, rgba(247,150,33,1) 100%); /* FF3.6+ */
        background:url('../../Resources/print_normal.png'),  -webkit-gradient(linear, left top, left bottom, color-stop(0%,rgba(249,198,103,1)), color-stop(100%,rgba(247,150,33,1))); /* Chrome,Safari4+ */
        background:url('../../Resources/print_normal.png'),  -webkit-linear-gradient(top,  rgba(249,198,103,1) 0%,rgba(247,150,33,1) 100%); /* Chrome10+,Safari5.1+ */
        background:url('../../Resources/print_normal.png'),  -o-linear-gradient(top,  rgba(249,198,103,1) 0%,rgba(247,150,33,1) 100%); /* Opera 11.10+ */
        background:url('../../Resources/print_normal.png'), -ms-linear-gradient(top,  rgba(249,198,103,1) 0%,rgba(247,150,33,1) 100%); /* IE10+ */
        background: url('../../Resources/print_normal.png'),linear-gradient(to bottom,  rgba(249,198,103,1) 0%,rgba(247,150,33,1) 100%); /* W3C */
        filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#f9c667', endColorstr='#f79621',GradientType=0 ); /* IE6-8 */
        background-repeat :no-repeat;
        background-position:left;
      }
     .btnExportToExcel
     {
        font-family:Verdana ;
        font-weight :bold;
        font-size: 11px;
        height : 25px;
        text-align :right;
        
        background: #eeeeee; /* Old browsers */
background: -moz-linear-gradient(top,  #eeeeee 0%, #eeeeee 100%); /* FF3.6+ */
background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#eeeeee), color-stop(100%,#eeeeee)); /* Chrome,Safari4+ */
background: -webkit-linear-gradient(top,  #eeeeee 0%,#eeeeee 100%); /* Chrome10+,Safari5.1+ */
background: -o-linear-gradient(top,  #eeeeee 0%,#eeeeee 100%); /* Opera 11.10+ */
background: -ms-linear-gradient(top,  #eeeeee 0%,#eeeeee 100%); /* IE10+ */
background: linear-gradient(to bottom,  #eeeeee 0%,#eeeeee 100%); /* W3C */
filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#eeeeee', endColorstr='#eeeeee',GradientType=0 ); /* IE6-9 */

        
        background: rgb(252,234,187); /* Old browsers */
        /* IE9 SVG, needs conditional override of 'filter' to 'none' */
        background: url(data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiA/Pgo8c3ZnIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgd2lkdGg9IjEwMCUiIGhlaWdodD0iMTAwJSIgdmlld0JveD0iMCAwIDEgMSIgcHJlc2VydmVBc3BlY3RSYXRpbz0ibm9uZSI+CiAgPGxpbmVhckdyYWRpZW50IGlkPSJncmFkLXVjZ2ctZ2VuZXJhdGVkIiBncmFkaWVudFVuaXRzPSJ1c2VyU3BhY2VPblVzZSIgeDE9IjAlIiB5MT0iMCUiIHgyPSIwJSIgeTI9IjEwMCUiPgogICAgPHN0b3Agb2Zmc2V0PSIwJSIgc3RvcC1jb2xvcj0iI2ZjZWFiYiIgc3RvcC1vcGFjaXR5PSIxIi8+CiAgICA8c3RvcCBvZmZzZXQ9IjUwJSIgc3RvcC1jb2xvcj0iI2ZjY2Q0ZCIgc3RvcC1vcGFjaXR5PSIxIi8+CiAgICA8c3RvcCBvZmZzZXQ9IjUxJSIgc3RvcC1jb2xvcj0iI2Y4YjUwMCIgc3RvcC1vcGFjaXR5PSIxIi8+CiAgICA8c3RvcCBvZmZzZXQ9IjEwMCUiIHN0b3AtY29sb3I9IiNmYmRmOTMiIHN0b3Atb3BhY2l0eT0iMSIvPgogIDwvbGluZWFyR3JhZGllbnQ+CiAgPHJlY3QgeD0iMCIgeT0iMCIgd2lkdGg9IjEiIGhlaWdodD0iMSIgZmlsbD0idXJsKCNncmFkLXVjZ2ctZ2VuZXJhdGVkKSIgLz4KPC9zdmc+);
        background:url('../../Resources/Excel.png'),  -moz-linear-gradient(top,  rgba(252,234,187,1) 0%, rgba(252,205,77,1) 50%, rgba(248,181,0,1) 51%, rgba(251,223,147,1) 100%); /* FF3.6+ */
        background:url('../../Resources/Excel.png'),  -webkit-gradient(linear, left top, left bottom, color-stop(0%,rgba(252,234,187,1)), color-stop(50%,rgba(252,205,77,1)), color-stop(51%,rgba(248,181,0,1)), color-stop(100%,rgba(251,223,147,1))); /* Chrome,Safari4+ */
        background: url('../../Resources/Excel.png'), -webkit-linear-gradient(top,  rgba(252,234,187,1) 0%,rgba(252,205,77,1) 50%,rgba(248,181,0,1) 51%,rgba(251,223,147,1) 100%); /* Chrome10+,Safari5.1+ */
        background: url('../../Resources/Excel.png'), -o-linear-gradient(top,  rgba(252,234,187,1) 0%,rgba(252,205,77,1) 50%,rgba(248,181,0,1) 51%,rgba(251,223,147,1) 100%); /* Opera 11.10+ */
        background: url('../../Resources/Excel.png'),-ms-linear-gradient(top,  rgba(252,234,187,1) 0%,rgba(252,205,77,1) 50%,rgba(248,181,0,1) 51%,rgba(251,223,147,1) 100%); /* IE10+ */
        background:url('../../Resources/Excel.pngg'), linear-gradient(to bottom,  rgba(252,234,187,1) 0%,rgba(252,205,77,1) 50%,rgba(248,181,0,1) 51%,rgba(251,223,147,1) 100%); /* W3C */
        ilter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#fceabb', endColorstr='#fbdf93',GradientType=0 ); /* IE6-8 */

        background-repeat:no-repeat;
        background-position:left;
        color:#775c16;
        padding-left:20px;      
        cursor:pointer;
        text-shadow: 1px 1px 1px #E0E0E0;
        border-radius:5px 3px 5px 3px;
        border:1px Solid #7F921C;
      }

    .btnExportToExcel:hover
     {
        background: rgb(249,198,103); /* Old browsers */
        /* IE9 SVG, needs conditional override of 'filter' to 'none' */
        background: url(data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiA/Pgo8c3ZnIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgd2lkdGg9IjEwMCUiIGhlaWdodD0iMTAwJSIgdmlld0JveD0iMCAwIDEgMSIgcHJlc2VydmVBc3BlY3RSYXRpbz0ibm9uZSI+CiAgPGxpbmVhckdyYWRpZW50IGlkPSJncmFkLXVjZ2ctZ2VuZXJhdGVkIiBncmFkaWVudFVuaXRzPSJ1c2VyU3BhY2VPblVzZSIgeDE9IjAlIiB5MT0iMCUiIHgyPSIwJSIgeTI9IjEwMCUiPgogICAgPHN0b3Agb2Zmc2V0PSIwJSIgc3RvcC1jb2xvcj0iI2Y5YzY2NyIgc3RvcC1vcGFjaXR5PSIxIi8+CiAgICA8c3RvcCBvZmZzZXQ9IjEwMCUiIHN0b3AtY29sb3I9IiNmNzk2MjEiIHN0b3Atb3BhY2l0eT0iMSIvPgogIDwvbGluZWFyR3JhZGllbnQ+CiAgPHJlY3QgeD0iMCIgeT0iMCIgd2lkdGg9IjEiIGhlaWdodD0iMSIgZmlsbD0idXJsKCNncmFkLXVjZ2ctZ2VuZXJhdGVkKSIgLz4KPC9zdmc+);
        background:url('../../Resources/Excel.png'),  -moz-linear-gradient(top,  rgba(249,198,103,1) 0%, rgba(247,150,33,1) 100%); /* FF3.6+ */
        background:url('../../Resources/Excel.png'),  -webkit-gradient(linear, left top, left bottom, color-stop(0%,rgba(249,198,103,1)), color-stop(100%,rgba(247,150,33,1))); /* Chrome,Safari4+ */
        background:url('../../Resources/Excel.png'),  -webkit-linear-gradient(top,  rgba(249,198,103,1) 0%,rgba(247,150,33,1) 100%); /* Chrome10+,Safari5.1+ */
        background:url('../../Resources/Excel.png'),  -o-linear-gradient(top,  rgba(249,198,103,1) 0%,rgba(247,150,33,1) 100%); /* Opera 11.10+ */
        background:url('../../Resources/Excel.png'), -ms-linear-gradient(top,  rgba(249,198,103,1) 0%,rgba(247,150,33,1) 100%); /* IE10+ */
        background: url('../../Resources/Excel.png'),linear-gradient(to bottom,  rgba(249,198,103,1) 0%,rgba(247,150,33,1) 100%); /* W3C */
        filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#f9c667', endColorstr='#f79621',GradientType=0 ); /* IE6-8 */
        background-repeat :no-repeat;
        background-position:left;
      }
        #gvPriceStyles, tr td
        {
            padding-left: 5px;
            padding-right: 7px;
        }
        #gvStylesMarkdown th
        {
            padding-left: 5px;
            padding-right: 5px;
        }
        #gvStylesMarkdown tr td
        {
            padding-left: 5px;
            padding-right: 7px;
        }
        #gvMarkDownBottom th
        {
            padding-left: 5px;
            padding-right: 5px;
        }
        #gvPriceStyles th
        {
            padding-left: 5px;
            padding-right: 7px;
        }
        #gvPriceStyles
        {
            font-size: 12px;
        }
        .list-div
        {
            float: left;
            font-size: 12px;
            width: 45%;
        }
         #btnPrint:hover
        {
                       margin-top:0px;
        }
    </style>
    <style type="text/css" media="print">
        #btnPrint
        {
            visibility: hidden;
        }
        #btnExportToExcel
        {
            visibility: hidden;
        }
        #borderTop
        {
            font-weight: bold;
            font-size: 12px;
            margin: 10px 0px 5px 0px;
            padding-top: 5px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <div style="font-size: 14px;">
            <table>
                <tr>
                    <td style="text-align: left; font-weight: bold;">
                        CUSTOMER NAME
                    </td>
                    <td style="padding-right: 10px;">
                        : &nbsp;<asp:Label ID="lblCustomerName" runat="server" Text="Label"></asp:Label>
                    </td>
                    <td>
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td style="text-align: right; font-weight: bold;">
                        PRICE GROUP REGULAR:
                    </td>
                    <td style="padding-right: 10px;">
                        :&nbsp;<asp:Label ID="lblPriceGroupRegular" runat="server" Text="Label"></asp:Label>
                    </td>
                    <td style="text-align: left; font-weight: bold;">
                        PRICE GROUP MD
                    </td>
                    <td style="padding-right: 10px;">
                        :&nbsp;<asp:Label ID="lblPriceGroupMD" runat="server" Text="Label"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="text-align: left; font-weight: bold;">
                        AREA:
                    </td>
                    <td style="padding-right: 10px;">
                        :&nbsp;<asp:Label ID="lblArea" runat="server" Text="Label"></asp:Label>
                    </td>
                    <td style="text-align: left; font-weight: bold;">
                        SUB-AREA
                    </td>
                    <td style="padding-right: 10px;">
                        :&nbsp;<asp:Label ID="lblSubArea" runat="server" Text="Label"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="text-align: left; font-weight: bold;">
                        ARRANGEMENT TYPE:
                    </td>
                    <td style="padding-right: 10px;">
                        :&nbsp;<asp:Label ID="lblArrangementType" runat="server" Text="Label"></asp:Label>
                    </td>
                    <td style="text-align: left; font-weight: bold;">
                        BRAND NAME
                    </td>
                    <td style="padding-right: 10px;">
                        :&nbsp;<asp:Label ID="lblBrandName" runat="server" Text="Label"></asp:Label>
                    </td>
                </tr>
            </table>
        </div>
        <div id="borderTop" style="font-weight: bold; font-size: 12px; margin: 10px 0px 5px 0px;
            padding-top: 5px; border-top: 2px Solid #000;">
            LIST OF STYLES
        </div>
        <div style="min-height: 300px;">
            <div style="width: 100%;">
                <asp:Panel ID="pnlLeft" CssClass="list-div" runat="server">
                    <div> <br /></div>
                    <div style="font-weight: bold; margin-bottom: 5px;">
                        <asp:Label ID="lblRegular" runat="server">REGULAR</asp:Label>
                    </div>
                    <div style="font-size: 11px; padding-left: 5px;">
                        <asp:Label ID="lblRegularTop" runat="server">TOP</asp:Label>
                    </div>
                    <asp:GridView ID="gvPriceStyles" runat="server" AutoGenerateColumns="False" OnRowCreated="gvPriceStyles_RowCreated">
                        <Columns>
                            <asp:BoundField DataField="StyleNo" HeaderText="STYLE #">
                                <ItemStyle Font-Bold="True" />
                            </asp:BoundField>
                            <asp:BoundField DataField="GrpNo" HeaderText="DESCRIPTION" />
                            <asp:BoundField DataField="Price" DataFormatString="{0:###,###.00}" 
                                HeaderText="SRP">
                                <ItemStyle ForeColor="#CC0000" HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="PriceType" HeaderText="PRICE TYPE" Visible="False" />
                        </Columns>
                    </asp:GridView>
                    <br />
                    <div style="font-size: 11px; padding-left: 5px;">
                        <asp:Label ID="lblRegularBottom" runat="server">BOTTOM</asp:Label>
                    </div>
                    <asp:GridView ID="gvRegularBottom" runat="server" AutoGenerateColumns="False" OnRowCreated="gvPriceStyles_RowCreated">
                        <Columns>
                            <asp:BoundField DataField="StyleNo" HeaderText="STYLE #">
                                <HeaderStyle Wrap="False" />
                                <ItemStyle Font-Bold="True" Wrap="False" />
                            </asp:BoundField>
                            <asp:BoundField DataField="GrpNo" HeaderText="DESCRIPTION" >
                            <ItemStyle Wrap="False" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Price" DataFormatString="{0:###,###.00}" 
                                HeaderText="SRP">
                                <ItemStyle ForeColor="#CC0000" HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="PriceType" HeaderText="PRICE TYPE" Visible="False" />
                        </Columns>
                    </asp:GridView>
                </asp:Panel>
                <asp:Panel ID="pnlRight" CssClass="list-div" runat="server">
                 <div> <br /></div>
                    <div style="font-weight: bold; margin-bottom: 5px;">
                        <asp:Label ID="lblMarkDown" runat="server">MARKDOWN</asp:Label>
                    </div>
                    <div style="font-size: 11px; min-width: 0px; padding-left: 5px;">
                        <asp:Label ID="lblMarkDownTop" runat="server">TOP</asp:Label>
                    </div>
                    <asp:GridView ID="gvStylesMarkdown" runat="server" AutoGenerateColumns="False" OnRowCreated="gvPriceStyles_RowCreated"
                        Font-Size="12px">
                        <Columns>
                            <asp:BoundField DataField="StyleNo" HeaderText="STYLE #">
                                <ItemStyle Font-Bold="True" />
                            </asp:BoundField>
                            <asp:BoundField DataField="GrpNo" HeaderText="DESCRIPTION" />
                            <asp:BoundField DataField="SRP" DataFormatString="{0:###,###.00}" HeaderText="SRP">
                                <ItemStyle ForeColor="#CC0000" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Price" DataFormatString="{0:###,###.00}" 
                                HeaderText="MD PRICE">
                            <ItemStyle ForeColor="#CC0000" HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="PriceType" HeaderText="PRICE TYPE" Visible="False" />
                        </Columns>
                    </asp:GridView>
                    <br />
                    <div style="font-size: 11px; padding-left: 5px;">
                        <asp:Label ID="lblMarkDownBottom" runat="server">BOTTOM</asp:Label>
                    </div>
                    <asp:GridView ID="gvMarkDownBottom" runat="server" AutoGenerateColumns="False" OnRowCreated="gvPriceStyles_RowCreated"
                        Font-Size="12px">
                        <Columns>
                            <asp:BoundField DataField="StyleNo" HeaderText="STYLE #">
                                <ItemStyle Font-Bold="True" Wrap="False" />
                            </asp:BoundField>
                            <asp:BoundField DataField="GrpNo" HeaderText="DESCRIPTION" >
                            <ItemStyle Wrap="False" />
                            </asp:BoundField>
                            <asp:BoundField DataField="SRP" DataFormatString="{0:###,###.00}" HeaderText="SRP">
                                <ItemStyle ForeColor="#CC0000" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Price" DataFormatString="{0:###,###.00}" 
                                HeaderText="MD PRICE">
                            <ItemStyle ForeColor="#CC0000" HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="PriceType" HeaderText="PRICE TYPE" Visible="False" />
                        </Columns>
                    </asp:GridView>
                </asp:Panel>
            </div>
        </div>
    </div>
    <div style="text-align: center; margin-top: 15px; ">
        <input id="btnPrint" type="button" class="btnPrintPreview" value="PRINT" onclick="window.print()" />
         <asp:Button ID="btnExportToExcel" CssClass="btnExportToExcel" runat="server" Text="EXPORT" OnClick="btnExportToExcel_Click" />
    </div>
    </form>
</body>
</html>
