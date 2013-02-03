<%@ Page Title="" Language="C#" MasterPageFile="~/Marketing/Marketing.Master" AutoEventWireup="true"
    CodeBehind="CustomListing.aspx.cs" Inherits="IntegratedResourceManagementSystem.Marketing.CustomListing" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="HeadContent" ContentPlaceHolderID="head" runat="server">
    <link href="../Styles/custom-listing.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/permission-note.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
 <div style="height:28px; margin-bottom:10px; line-height:28px; color: #333;text-shadow: 1px 1px 0px white;">
        <asp:Image ID="imgpnlTitle" runat="server" ImageUrl="~/Resources/commercial.png"
            ImageAlign="Top" Height="28px" />
        &nbsp;<asp:Label ID="Label1" runat="server" Text="OUTLET MANAGEMENT PANEL" Font-Bold="True"
            Font-Names="Verdana" Font-Size="14px"></asp:Label>
        <div style="float: right;">
            <asp:ImageButton ID="imgBtnBack" runat="server" ImageUrl="~/Resources/reply.png"
                PostBackUrl="~/Marketing/CustomerMenuPanel.aspx" ToolTip="BACK" />
        </div>
        <hr />
    </div>
    <%--BUTTONS--%>
    <div style="height:26px; margin-bottom: 1px;" class="modalDrag">
        <div style="float: left; height: 30px;">
            <div style="float: left; margin-right: 5px;">
                <asp:Button ID="btnNewCustomer" runat="server" Text="NEW" CssClass="btnNew" Font-Names="Verdana"
                    OnClick="btnNewCustomer_Click" />
            </div>
            <div style="float: left; margin-right: 5px;">
                <asp:Button ID="btnUpdateCustomer" runat="server" Text="UPDATE" CssClass="btnUpdate"
                    Font-Names="Verdana" OnClick="btnUpdateCustomer_Click" />
            </div>
            <div style="float: left; margin-right: 5px;">
                <asp:Button ID="btnDelete" runat="server" Text="DELETE" CssClass="btnDelete" Font-Names="Verdana" />
            </div>
            <div style="float: left; margin-right: 5px;">
                <asp:Button ID="btnPrint" runat="server" Text="PRINT" CssClass="btnPrint" 
                    Font-Names="Verdana" onclick="btnPrint_Click" />
            </div>
        </div>
        <div style="float: right;" class="SearchTextContainer">
                SEARCH:
                    <asp:TextBox ID="txtSearch" autofocus placeholder="Search Outlet" runat="server" CssClass="modalText"
                        AutoPostBack="True" Height="16px" Font-Size="10px" Width="150px" ToolTip="Search Brand"></asp:TextBox>
                    <asp:ImageButton ID="imgBtnSearch" runat="server" ImageAlign="AbsBottom" ImageUrl="~/Resources/search.png"
                        ToolTip="SEARCH" />
       </div>
    </div>
    <asp:UpdatePanel ID="upnlCustomListing" runat="server">
        <ContentTemplate>
            <div class="listcontent" style="float:left;">
                <div class="titleList">
                    <asp:Image ID="imgList" runat="server" Height="16px" Width="20px" ImageUrl="~/Resources/commercial.png"
                        ImageAlign="Top" />
                    LIST OF CUSTOMERS
                </div>
                <asp:GridView ID="gvAccountList" runat="server" CellPadding="4" CssClass="table_grid"
                    GridLines="None" AutoGenerateColumns="False" >
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:TemplateField>
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Image ID="Image1" runat="server" Height="16px" ImageUrl="~/Resources/commercial.png" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:CommandField ShowSelectButton="True" />
                        <asp:BoundField DataField="AccountCode" HeaderText="ACCOUNT CODE" Visible="False">
                            <ControlStyle Width="0px" />
                            <FooterStyle Wrap="True" />
                            <HeaderStyle Width="0px" Wrap="False" />
                            <ItemStyle Wrap="False" />
                        </asp:BoundField>
                        <asp:BoundField DataField="AccountName" HeaderText="ACCOUNT">
                            <HeaderStyle Wrap="False" />
                            <ItemStyle Wrap="False" />
                        </asp:BoundField>
                        <asp:BoundField HeaderText="BRAND CODE" Visible="False" DataField="BrandCode">
                            <HeaderStyle Wrap="False" />
                            <ItemStyle Wrap="False" />
                        </asp:BoundField>
                        <asp:BoundField HeaderText="BRAND" DataField="BrandName">
                            <HeaderStyle Wrap="False" />
                            <ItemStyle Width="100px" Wrap="False" />
                        </asp:BoundField>
                        <asp:BoundField HeaderText="CUSTOMER CODE" DataField="CustomerCode">
                            <HeaderStyle Wrap="False" />
                            <ItemStyle Wrap="False" />
                        </asp:BoundField>
                        <asp:BoundField DataField="CustomerName" HeaderText="CUSTOMER NAME">
                            <ItemStyle Width="150px" />
                        </asp:BoundField>
                        <asp:BoundField HeaderText="AREA CODE" DataField="AreaCode" Visible="False">
                            <HeaderStyle Wrap="False" />
                            <ItemStyle Wrap="False" />
                        </asp:BoundField>
                        <asp:BoundField DataField="AreaName" HeaderText="AREA">
                            <ItemStyle Wrap="False" />
                        </asp:BoundField>
                        <asp:BoundField HeaderText="SUB-AREA CODE" DataField="SubAreaCode" Visible="False">
                            <ItemStyle Wrap="False" />
                        </asp:BoundField>
                        <asp:BoundField DataField="SubAreaName" HeaderText="SUB-AREA">
                            <HeaderStyle Wrap="False" />
                            <ItemStyle Wrap="False" />
                        </asp:BoundField>
                        <asp:BoundField DataField="DateStart" DataFormatString="{0:MM/dd/yyyy}" HeaderText="DATE START">
                            <HeaderStyle Wrap="False" />
                            <ItemStyle Wrap="False" />
                        </asp:BoundField>
                    </Columns>
                    <EditRowStyle BackColor="#7C6F57" />
                    <EmptyDataTemplate>
                          <div style="text-align:center; width:570px; padding:5px 0px; border:1px Solid Gray;">
                             <img src="../Resources/unhappy.png" alt="WALA!!" align="middle" />
                             DATA NOT FOUND!!!
                        </div>
                    </EmptyDataTemplate>
                    <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#E3EAEB" />
                    <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="False" ForeColor="#333333" Font-Names="Verdana"
                        Font-Size="11px" Font-Italic="True" />
                    <SortedAscendingCellStyle BackColor="#F8FAFA" />
                    <SortedAscendingHeaderStyle BackColor="#246B61" />
                    <SortedDescendingCellStyle BackColor="#D4DFE1" />
                    <SortedDescendingHeaderStyle BackColor="#15524A" />
                </asp:GridView>
            </div>

             <asp:Panel CssClass="permission-container" ID="pnlNotification" Visible="false" runat="server">
                <asp:CollapsiblePanelExtender ID="CollapsiblePaneItemMaster" runat="server" CollapseControlID="lblNoteCollapsHandler"
                    CollapsedText="dennis" ExpandedText="pitallano" TargetControlID="pnlPermissionNotification"
                    ExpandControlID="lblNoteCollapsHandler" Collapsed="True">
                </asp:CollapsiblePanelExtender>
                <div class="collaps-link">
                    <asp:Label CssClass="collaps-text" ID="lblNoteCollapsHandler" Height="48px" runat="server"
                        Text="NOTE" ToolTip="Show/Hide Notification"></asp:Label>
                </div>
                <asp:Panel CssClass="note-container" ID="pnlPermissionNotification" runat="server">
                    <asp:Label ID="lblPermissionNotifications" runat="server" Text="Label"></asp:Label>
                </asp:Panel>
            </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
