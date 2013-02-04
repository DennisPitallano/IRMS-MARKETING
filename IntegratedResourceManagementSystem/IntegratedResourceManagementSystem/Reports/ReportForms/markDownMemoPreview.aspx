<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="markDownMemoPreview.aspx.cs" Inherits="IntegratedResourceManagementSystem.Reports.ReportForms.markDownMemoPreview" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>MarkDown Memo</title>
    <style type="text/css" media="screen">
        .txtBox
        {
            border:none;
          
        }
        .label
        {
            font-size:13px;
        }
        .row
        {
            padding:0px 5px;
        }
        #GridView1 tr td
        {
             padding:0px 5px;
             font-size :12px;
        }
         #GridView1 th
         {
               padding:2px 5px;
               font-size:11px;
         }
    </style>
</head>
<body>
    <form id="frmMDMemo" runat="server">
    <div>
        <asp:Label CssClass="label" ID="txtMemoNumber" runat="server" Text="Label"></asp:Label>
        <br />
        <asp:TextBox CssClass="txtBox" ID="txtHeader" runat="server" Height="91px" TextMode="MultiLine" 
            Width="360px"></asp:TextBox>
        <br />
         <asp:TextBox CssClass="txtBox" ID="lblIntro" runat="server" Height="63px" TextMode="MultiLine" 
            Width="499px"></asp:TextBox>
          <br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            DataSourceID="SqlDataSourceMemoDetails" Font-Size="13px">
            <Columns>
                <asp:BoundField DataField="CustNo" HeaderText="CustNo" SortExpression="CustNo" 
                    Visible="False" />
                <asp:BoundField DataField="StyleNo" HeaderText="STYLE #" 
                    SortExpression="StyleNo" />
                <asp:BoundField DataField="StyleDesc" HeaderText="DESCRIPTION" 
                    SortExpression="StyleDesc" >
                <ItemStyle Font-Size="11px" />
                </asp:BoundField>
                <asp:BoundField DataField="CurrPrice" HeaderText="CURRENT PRICE" 
                    SortExpression="CurrPrice" DataFormatString="{0:###,###.00}" >
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="RemInv" HeaderText="REM. INV." 
                    SortExpression="RemInv" >
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="Discount" HeaderText="DISCOUNT" 
                    SortExpression="Discount" DataFormatString="{0:###,###.00}" >
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="TtlAmtDisc" HeaderText="TOTAL DISCOUNT" 
                    SortExpression="TtlAmtDisc" DataFormatString="{0:###,###.00}" >
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="MDPrice" HeaderText="MD PRICE" 
                    SortExpression="MDPrice" DataFormatString="{0:###,###.00}" >
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:CheckBoxField DataField="ynFurther" HeaderText="ynFurther" 
                    SortExpression="ynFurther" Visible="False" />
            </Columns>
            <HeaderStyle VerticalAlign="Middle" />
            <RowStyle CssClass="row" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSourceMemoDetails" runat="server" 
            ConnectionString="<%$ ConnectionStrings:IRMSConnectionString %>" SelectCommand="SELECT MDMemo.CustNo, MDMemoConcn.StyleNo, MDMemoConcn.StyleDesc, MDMemoConcn.CurrPrice, MDMemoConcn.RemInv, MDMemoConcn.Discount, 
                      MDMemoConcn.TtlAmtDisc, MDMemoConcn.MDPrice, MDMemoConcn.ynFurther
FROM         MDMemo INNER JOIN
                      MDMemoConcn ON MDMemo.ID = MDMemoConcn.MDMemoID
                      where MDMemo.ID=@MemoID">
            <SelectParameters>
                <asp:QueryStringParameter Name="MemoID" QueryStringField="ID" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
         <asp:TextBox CssClass="txtBox" ID="txtMessage" runat="server" Height="63px" TextMode="MultiLine" 
            Width="499px"></asp:TextBox>
    </div>
    </form>
</body>
</html>
