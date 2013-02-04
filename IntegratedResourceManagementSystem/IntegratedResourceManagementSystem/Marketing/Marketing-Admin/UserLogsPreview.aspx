<%@ Page Title="" Language="C#" MasterPageFile="~/Marketing/Marketing-Admin/Admin.Master" AutoEventWireup="true" CodeBehind="UserLogsPreview.aspx.cs" Inherits="IntegratedResourceManagementSystem.Marketing.Marketing_Admin.UserLogsPreview" %>
<asp:Content ID="HeadContent" ContentPlaceHolderID="head" runat="server">
    <link href="Styles/user-logs-preview.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="panelTitle">
        <img alt="AUDIT TRAILS" src="../../Resources/log.png" height="28px" align="top" />
        Audit Trails
        <div style="float: right; cursor:pointer;">
                <img src="../../Resources/cancel_gray.png" title="CLOSE WINDOW" onclick="window.close()" />
        </div>
    </div>
    <asp:HiddenField ID="hfUserName" runat="server" />
    <div style="min-height:500px;">
            <div style="float:left; margin-right:5px;">
                <div class="user-account">
                    <table style="width: 100%;">
                        <tr >
                         <td style=" text-align:center;" colspan="2">
                             <asp:Image ID="imgUser" AlternateText="NO IMAGE" runat="server" />
                                <div class="status" style="float:right; text-align:center;">
                                   <asp:Image ID="imgActiveStatus" runat="server" />
                                   <br />
                                    <asp:Label ID="lblUserStatus" Font-Size="8px" runat="server" Text="Label"></asp:Label>
                                </div>
                            </td>
                            <td>
                               
                            </td>
                        </tr>
                        <tr>
                            <td class="modalLabel">
                               NAME:
                            </td>
                            <td class="txtBoxContainer">
                                <asp:Label CssClass="modalText txtBox" ID="lblName" runat="server" Text="Label"></asp:Label>
                            </td>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td class="modalLabel">
                                USER NAME:
                            </td>
                            <td class="txtBoxContainer">
                                <asp:Label CssClass="modalText txtBox" ID="lblUserName" runat="server" Text="Label"></asp:Label>
                            </td>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td class="modalLabel">
                                DEPARTMENT:
                            </td>
                            <td class="txtBoxContainer">
                                  <asp:Label CssClass="modalText txtBox" ID="lblDepartment" runat="server" Text="Label"></asp:Label>
                            </td>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                         <tr>
                            <td class="modalLabel">
                               USER LEVEL:
                            </td>
                            <td class="txtBoxContainer">
                                  <asp:Label CssClass="modalText txtBox" ID="lblUserLevel" runat="server" Text="Label"></asp:Label>
                            </td>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                         <tr>
                            <td class="modalLabel">
                               EMAIL ADD:
                            </td>
                            <td class="txtBoxContainer">
                                 <asp:Label CssClass="modalText txtBox" ID="lblEmailAddress" runat="server" Text="Label"></asp:Label>
                            </td>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                         <tr>
                            <td class="modalLabel ">
                                CONTACT #:
                            </td>
                            <td class="txtBoxContainer">
                                <asp:Label CssClass="modalText txtBox" ID="lblContactNumber" runat="server" Text="Label"></asp:Label>
                            </td>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
            <div style="float:left; min-width:350px; margin-bottom:10px;">
                       <div class="titleList">
                      <img alt="User Accounts" src="../../Resources/log.png" height="16px" align="top" />
                        LIST OF ACTIVITIES
                      <div style="display:inline-block; float:right;">
                        SET DISPLAY SIZE:<asp:DropDownList CssClass="modalText" Font-Size="10px" 
                              ID="DDLDisPlaySize" runat="server" AutoPostBack="True" 
                              onselectedindexchanged="DDLDisPlaySize_SelectedIndexChanged">
                              <asp:ListItem Value="25">DEFAULT</asp:ListItem>
                              <asp:ListItem>50</asp:ListItem>
                              <asp:ListItem>100</asp:ListItem>
                              <asp:ListItem>250</asp:ListItem>
                              <asp:ListItem>500</asp:ListItem>
                              <asp:ListItem>1000</asp:ListItem>
                              <asp:ListItem>ALL</asp:ListItem>
                          </asp:DropDownList>
                    </div>
                    </div>
                   
                    <div>
                        <asp:GridView ID="gvActivityLogs" runat="server" AllowPaging="True" 
                            AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
                            DataSourceID="SqlDataSourceAuditTrails" CssClass="table_grid" 
                            GridLines="None" PageSize="22">
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:Image ID="Image1" runat="server" ImageUrl="~/Resources/log.png" Height="14px" />
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                                    </EditItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="ActionTaken" HeaderText="ACTIVITY" 
                                    SortExpression="ActionTaken" />
                                <asp:BoundField DataField="DTStamp" HeaderText="DATE EXECUTED" 
                                    SortExpression="DTStamp" DataFormatString="{0:MMMM dd, yyyy hh:m:s}" />
                            </Columns>
                            <EditRowStyle BackColor="#7C6F57" />
                            <EmptyDataTemplate>
                            <img src="../../Resources/tableselectrowicon.png" align="middle" />
                                SELECT USER ACCOUNT TO VIEW ACTIVITY LOGS.
                            </EmptyDataTemplate>
                            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                            <PagerStyle  CssClass="pager-style" />
                            <RowStyle BackColor="#E3EAEB" />
                            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                            <SortedAscendingCellStyle  CssClass="asc_cell_style" />
                            <SortedAscendingHeaderStyle CssClass="asc_cell_style_h" />
                            <SortedDescendingCellStyle CssClass="desc_cell_style" />
                            <SortedDescendingHeaderStyle CssClass="desc_cell_style_h" />
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSourceAuditTrails" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:IRMSConnectionString %>" 
                            SelectCommand="SELECT [ActionTaken], [DTStamp] FROM [AuditTrail] WHERE ([UserName] = @UserName) ORDER BY [DTStamp] DESC">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="hfUserName" Name="UserName" 
                                    PropertyName="Value" Type="String" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </div>
                </div>
    </div>
</asp:Content>
