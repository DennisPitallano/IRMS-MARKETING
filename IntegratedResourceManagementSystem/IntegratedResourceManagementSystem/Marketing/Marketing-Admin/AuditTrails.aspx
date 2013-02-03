<%@ Page Title="" Language="C#" MasterPageFile="~/Marketing/Marketing-Admin/Admin.Master"
    AutoEventWireup="true" CodeBehind="AuditTrails.aspx.cs" Inherits="IntegratedResourceManagementSystem.Marketing.Marketing_Admin.AuditTrails" %>

<%@ Register Src="~/Marketing/Marketing-Admin/controls/AdminMenu.ascx" TagName="menu"
    TagPrefix="irms" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Src="~/Marketing/controls/UCLoader.ascx" TagName="LOADER" TagPrefix="UC" %>
<asp:Content ID="HeadContent" ContentPlaceHolderID="head" runat="server">
    <link href="Styles/audit-trails.css" rel="stylesheet" type="text/css" />
     <link href="Styles/user-management.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="menu_container">
        <irms:menu ID="admin_menu" runat="server" />
    </div>
    <div class="panelTitle">
        <img alt="AUDIT TRAILS" src="../../Resources/log.png" height="28px" align="top" />
        Audit Trails
        <div style="float: right;">
            <a href="Default.aspx">
                <img src="../../Resources/reply.png" />
            </a>
        </div>
    </div>
    <asp:UpdatePanel ID="upnlAuditTrails" runat="server">
        <ContentTemplate>
          

            <div style="min-height:450px; margin-bottom:10px;">
                <div style="float:left; min-width:300px; margin-right:3px; margin-bottom:10px;">
                  <div style="height: 26px; margin-bottom: 1px;" class="modalDrag">
                <div style="float: right;" class="SearchTextContainer">
                    SEARCH:
                    <asp:TextBox ID="txtSearch" runat="server" autofocus placeholder="Search User Account"
                        CssClass="modalText" AutoPostBack="True" Height="16px" Font-Size="10px" Width="150px"
                        ToolTip="Search User Account" ontextchanged="txtSearch_TextChanged"></asp:TextBox>
                    <asp:ImageButton ID="imgBtnSearch" runat="server" ImageAlign="AbsBottom" ImageUrl="~/Resources/search.png"
                        ToolTip="SEARCH" onclick="imgBtnSearch_Click" />
                </div>
                <div style="float: left;">
                   
                    <div style="float: left; margin-right: 5px;">
                        <asp:UpdateProgress ID="upProgress" runat="server" AssociatedUpdatePanelID="upnlAuditTrails">
                            <ProgressTemplate>
                                <asp:PlaceHolder ID="plcHLoader" runat="server">
                                    <UC:LOADER ID="loader" runat="server" />
                                </asp:PlaceHolder>
                            </ProgressTemplate>
                        </asp:UpdateProgress>
                    </div>
                </div>
            </div>
                    <div class="titleList">
                      <img alt="User Accounts" src="../../Resources/users.png" height="16px" align="top" />
                        LIST OF USER ACCOUNTS
                    </div>
                    <div>
                        <asp:GridView ID="gvUserAccounts" runat="server" AllowPaging="True" 
                            AllowSorting="True" AutoGenerateColumns="False" 
                            CellPadding="4" DataKeyNames="UserName,ID" DataSourceID="SqlDataSourceUserAccounts" 
                             CssClass="table_grid" GridLines="None" Font-Size="12px" 
                            onselectedindexchanged="gvUserAccounts_SelectedIndexChanged">
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:TemplateField ShowHeader="False" HeaderText="AVATAR">
                                    <ItemTemplate>
                                        <asp:ImageButton Height="36px"  ImageUrl='<%# "~/Marketing/Marketing-Admin/user-images/"+ Eval("image") %>'
                                         ID="imgBtnSelectAccount" AlternateText="NOT AVAILABLE" runat="server" CausesValidation="False" 
                                            CommandName="Select" Text="Select" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" 
                                    ReadOnly="True" SortExpression="ID" />
                                <asp:BoundField DataField="FullName" HeaderText="NAME" 
                                    SortExpression="FullName" />
                                <asp:BoundField DataField="UserName" HeaderText="LOG NAME" 
                                    SortExpression="UserName" />
                                <asp:BoundField DataField="ContactNumber" HeaderText="CONTACT #" 
                                    SortExpression="ContactNumber" />
                            </Columns>
                            <EditRowStyle BackColor="#7C6F57" />
                            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                            <PagerStyle  CssClass="pager-style"/>
                            <RowStyle BackColor="#E3EAEB" />
                            <SelectedRowStyle BackColor="#C5BBAF" ForeColor="#333333" Font-Bold="True" />
                            <SortedAscendingCellStyle CssClass="asc_cell_style" />
                            <SortedAscendingHeaderStyle CssClass="asc_cell_style_h" />
                            <SortedDescendingCellStyle  CssClass="desc_cell_style" />
                            <SortedDescendingHeaderStyle CssClass="desc_cell_style_h" />
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSourceUserAccounts" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:IRMSConnectionString %>" 
                            SelectCommand="SELECT [ID], [FullName], [UserName], [image],[ContactNumber] FROM [Users]">
                        </asp:SqlDataSource>
                    </div>
                </div>
                <div style="float:left; min-width:350px; margin-bottom:10px;">
                  <div style="height: 26px; margin-bottom: 1px;" class="modalDrag">
                <div style="float: right;" class="SearchTextContainer">
                    SEARCH:
                    <asp:TextBox ID="txtSearchAuditTrails" runat="server"  placeholder="Search Activities"
                        CssClass="modalText" AutoPostBack="True" Height="16px" Font-Size="10px" Width="150px"
                        ToolTip="Search User Account"></asp:TextBox>
                    <asp:ImageButton ID="iBtnSearchAuditTrails" runat="server" ImageAlign="AbsBottom" ImageUrl="~/Resources/search.png"
                        ToolTip="SEARCH" />
                </div>
                <div style="float: left;">
                    <div style="float: left; margin-right: 5px;">
                        <asp:Button ID="btnPrintAuditTrails" runat="server" Text="PRINT" CssClass="btnPrint" Font-Names="Verdana" />
                    </div>
                </div>
                <div style="float: left; margin-right:20px;">
                    <asp:Label Text="FILTER" CssClass="filter-link" ID="lblFileterModalHandler" runat="server" />
                     <asp:ModalPopupExtender ID="lblFileterModalHandler_ModalPopupExtender" 
                        runat="server" DynamicServicePath="" Enabled="True" 
                        TargetControlID="lblFileterModalHandler" 
                        PopupControlID="pnlFilterAuditTrails" 
                        PopupDragHandleControlID="pnlFilerAuditTrailsDrag" CancelControlID="imgBtnClosepnlFilterAuditTrails">
                    </asp:ModalPopupExtender>

                    <asp:Panel ID="pnlFilterAuditTrails" runat="server" CssClass="modal" >
                        <asp:Panel ID="pnlFilerAuditTrailsDrag" runat="server" CssClass="modalDrag">
                            <div class="sizeLogo">
                              <img src="../../Resources/log.png" height="16px" align="top" />
                               Filter Audit Trails
                            </div>
                             <div class="close_btn">
                        <asp:ImageButton ID="imgBtnClosepnlFilterAuditTrails" runat="server" CssClass="btnClose"
                            ImageUrl="~/Resources/cancel_gray.png" ToolTip="CLOSE" />
                    </div>
                        </asp:Panel>
                        <table border="0">
                            <tr>
                                <td class="modalLabel">
                                <label >
                                        BY DATE FROM:
                                    </label>
                                </td>
                                <td>
                                  <asp:TextBox ID="txtFilterDateFrom" CssClass="modalText" runat="server"></asp:TextBox>
                                    <asp:CalendarExtender ID="txtFilterDateFrom_CalendarExtender" runat="server" 
                                        Enabled="True" TargetControlID="txtFilterDateFrom">
                                    </asp:CalendarExtender>
                                </td>
                            </tr>
                            <tr>
                                <td class="modalLabel">
                                    <label >
                                        TO:
                                    </label>
                                </td>
                                <td>
                                <asp:TextBox ID="txtFilterDateTo" CssClass="modalText" runat="server"></asp:TextBox>
                                    <asp:CalendarExtender ID="CalendarExtender1" runat="server" 
                                        Enabled="True" TargetControlID="txtFilterDateTo">
                                    </asp:CalendarExtender>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                
                                </td>
                                <td>
                                 <asp:Button CssClass="btnFilter" ID="btnFilterByBrand" runat="server" 
                                        Text="FILTER" onclick="btnFilterByBrand_Click" />
                                </td>
                            </tr>
                        </table>
                                   
                    </asp:Panel>
                </div>
            </div>
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
                            GridLines="None" PageSize="22" 
                            onpageindexchanging="gvActivityLogs_PageIndexChanging" >
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:Image ID="Image1" runat="server" ImageUrl="~/Resources/log.png" Height="11px" />
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
                         <asp:SqlDataSource ID="SqlDataSourceAuditTrailsByUserAccount" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:IRMSConnectionString %>" 
                            SelectCommand="SELECT [ActionTaken], [DTStamp] FROM [AuditTrail] WHERE ([UserName] = @UserName) ORDER BY [DTStamp] DESC">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="gvUserAccounts" Name="UserName" 
                                    PropertyName="SelectedValue" Type="String" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:SqlDataSource ID="SqlDataSourceAuditTrails" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:IRMSConnectionString %>" 
                            SelectCommand="SELECT [ActionTaken], [DTStamp] FROM [AuditTrail]  ORDER BY [DTStamp] DESC">
                        </asp:SqlDataSource>
                        <asp:HiddenField ID="hfSelectedUsername" runat="server" />
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
