<%@ Page Title="" Language="C#" MasterPageFile="~/Marketing/Marketing.Master" AutoEventWireup="true" CodeBehind="PriceHistory.aspx.cs" Inherits="IntegratedResourceManagementSystem.Marketing.PriceHistory" %>
<asp:Content ID="HeadContent" ContentPlaceHolderID="head" runat="server">
<link href="../Styles/price-check.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/item-reprocess.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
 <div style="display: inline-block; margin-top: 1px;">
                    <div class="modalDrag">
                        <div class="sizeLogo">
                            <img src="../Resources/History.png" alt="HISTORY" align="top" height="18px" />STYLE
                            PRICE HISTORY LIST</div>
                    </div>
                    <div style="min-height: 500px;">
                       
                        <asp:GridView ID="gvPriceHistory" runat="server" AutoGenerateColumns="False" BackColor="LightGoldenrodYellow"
                            BorderColor="Tan" BorderWidth="1px" CellPadding="2" DataSourceID="SqlDataSourcePriceHistory"
                            CssClass="table-grid-style" GridLines="None" AllowSorting="True">
                            <AlternatingRowStyle BackColor="PaleGoldenrod" />
                            <Columns>
                                <asp:TemplateField>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Image ID="Image1" runat="server" ImageUrl="~/Resources/product.png" Height="16px" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="MemoDate" HeaderText="MEMO DATE" ReadOnly="True" SortExpression="MemoDate" />
                                <asp:BoundField DataField="MemoDate" HeaderText="APPROVED DATE" SortExpression="MemoDate" />
                                <asp:BoundField DataField="CUSTOMER" HeaderText="CUSTOMER" ReadOnly="True" SortExpression="CUSTOMER">
                                    <ItemStyle Wrap="False" />
                                </asp:BoundField>
                                <asp:BoundField DataField="FromDate" HeaderText="EFFECTIVE DATE" ReadOnly="True"
                                    SortExpression="FromDate" />
                                <asp:BoundField DataField="ToDate" HeaderText="TO DATE" SortExpression="ToDate" DataFormatString="{0:MMMM dd, yyyy}"
                                    Visible="False" />
                                <asp:BoundField DataField="CurrPrice" HeaderText="CURRENT PRICE" ReadOnly="True"
                                    SortExpression="CurrPrice" DataFormatString="{0:###,###.00}">
                                    <ItemStyle Font-Bold="True" ForeColor="#CC0000" HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="MDPrice" HeaderText="MD PRICE" SortExpression="MDPrice"
                                    DataFormatString="{0:###,###.00}" Visible="False">
                                    <ItemStyle Font-Bold="True" ForeColor="#CC0000" HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="MemoNo" HeaderText="MEMO #" SortExpression="MemoNo" />
                                <asp:BoundField DataField="Row_Count" HeaderText="MD COUNT" ReadOnly="True" SortExpression="Row_Count"
                                    Visible="False">
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                            </Columns>
                            <EmptyDataTemplate>
                                <img src="../Resources/unhappy.png" align="middle" />
                                HISTORY NOT FOUND!!
                            </EmptyDataTemplate>
                            <FooterStyle BackColor="Tan" />
                            <HeaderStyle BackColor="Tan" Font-Bold="True" />
                            <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
                            <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
                            <SortedAscendingCellStyle BackColor="#FAFAE7" />
                            <SortedAscendingHeaderStyle BackColor="#DAC09E" />
                            <SortedDescendingCellStyle BackColor="#E1DB9C" />
                            <SortedDescendingHeaderStyle BackColor="#C2A47B" />
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSourcePriceHistory" runat="server" ConnectionString="<%$ ConnectionStrings:IRMSConnectionString %>"
                            SelectCommand="GET_STYLE_PRICE_HISTORY" 
                            SelectCommandType="StoredProcedure" EnableCaching="True">
                            <SelectParameters>
                                <asp:QueryStringParameter Name="BRAND" QueryStringField="BRAND" />
                                <asp:QueryStringParameter Name="STYLE_NUMBER" QueryStringField="STYLE_NUMBER" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </div>
                </div>
</asp:Content>
