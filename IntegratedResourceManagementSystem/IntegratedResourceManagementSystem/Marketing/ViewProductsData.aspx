<%@ Page Title="" Language="C#" MasterPageFile="~/Marketing/Marketing.Master" AutoEventWireup="true"
    CodeBehind="ViewProductsData.aspx.cs" Inherits="IntegratedResourceManagementSystem.Marketing.ViewProductsData" %>

<asp:Content ID="HeadContent" ContentPlaceHolderID="head" runat="server">
    <link href="../Styles/pull-out-letter.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
<div style="float:right; cursor:pointer ;">
    <img src="../Resources/cancel_normal.png" alt="" title="CLOSE WINDOW" onclick="window.close()" class="close_btn" />
</div>
    <div style="width:500px; cursor:pointer;">
        <div class="titleForm" style="height: 12px;">
            STYLE INFO.
            <div style="float:right;">
                <asp:HyperLink ID="hpLinkPrintPreview" CssClass="btnPrint" Height="16px" style="line-height:16px; padding-right:3px; font-size:10px; text-decoration:none;" runat="server">PRINT</asp:HyperLink>
            </div>
        </div>
        <div class="form">
            <table style="">
                <tr>
                    <td class="modalLabel">
                        STYLE #:
                    </td>
                    <td>
                        <asp:Label ID="lblStyleNumber" CssClass="modalText" Height="20px" Style="padding-right: 3px;
                            line-height: 20px;" runat="server" Text="Label"></asp:Label>
                    </td>
                    <td class="modalLabel">
                        COST PRICE:
                    </td>
                    <td>
                        <asp:Label ID="lblCostPrice" CssClass="modalText" Height="20px" Style="padding-right: 3px;
                            line-height: 20px;" runat="server" Text="Label"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="modalLabel">
                        BRAND:
                    </td>
                    <td>
                        <asp:Label ID="lblBrand" CssClass="modalText" Height="20px" Style="padding-right: 3px;
                            line-height: 20px;" runat="server" Text="Label"></asp:Label>
                    </td>
                    <td class="modalLabel">
                        DESCRIPTION:
                    </td>
                    <td>
                        <asp:Label ID="lblStyleDescription" CssClass="modalText" Height="20px" Style="padding-right: 3px;
                            line-height: 20px;" runat="server" Text="Label"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="modalLabel">
                        FABRIC:
                    </td>
                     <td>
                      <asp:Label ID="lblFabric" CssClass="modalText" Height="20px" Style="padding-right: 3px;
                            line-height: 20px;" runat="server" Text="Label"></asp:Label>
                    </td>
                     <td>
                    </td>
                     <td>
                    </td>
                </tr>
                 <tr>
                    <td class="modalLabel">
                        FITTING:
                    </td>
                     <td>
                      <asp:Label ID="lblFitting" CssClass="modalText" Height="20px" Style="padding-right: 3px;
                            line-height: 20px;" runat="server" Text="Label"></asp:Label>
                    </td>
                     <td class="modalLabel">
                         </td>
                     <td>
                         <asp:CheckBox CssClass= "containers modalLabel" Font-Italic="true" Font-Bold="true" Height="20px" style="padding-right:5px; border-radius:3px;" ID="chkIsActive" Text="ACTIVE" Enabled ="false"  runat="server" />
                    </td>
                </tr>
                 <tr>
                    <td class="modalLabel">
                        SUB-FITTING:
                    </td>
                     <td>
                      <asp:Label ID="lblSubFitting" CssClass="modalText" Height="20px" Style="padding-right: 3px;
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
        <div class="titleForm" style="height: 12px;">
            STYLE PRODUCTS</div>
        <div class="form">
            <asp:GridView ID="gvProducts" CssClass="table_grid" runat="server" AutoGenerateColumns="False"
                CellPadding="4" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:TemplateField>
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Image ID="Image1" runat="server" Height="16px" ImageUrl="~/Resources/Barcode.png" />
                        </ItemTemplate>
                    </asp:TemplateField>
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
                <EditRowStyle BackColor="#7C6F57" />
                <EmptyDataTemplate>
                    <img src="../Resources/unhappy.png" alt="" align="left" />
                    PRODUCTS NOT FOUND!
                </EmptyDataTemplate>
                <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#E3EAEB" />
                <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F8FAFA" />
                <SortedAscendingHeaderStyle BackColor="#246B61" />
                <SortedDescendingCellStyle BackColor="#D4DFE1" />
                <SortedDescendingHeaderStyle BackColor="#15524A" />
            </asp:GridView>
        </div>
    </div>
</asp:Content>
