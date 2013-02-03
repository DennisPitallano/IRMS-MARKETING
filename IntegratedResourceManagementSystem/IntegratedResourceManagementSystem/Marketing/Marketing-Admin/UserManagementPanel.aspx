<%@ Page Title="" Language="C#" MasterPageFile="~/Marketing/Marketing-Admin/Admin.Master"
    AutoEventWireup="true" CodeBehind="UserManagementPanel.aspx.cs" Inherits="IntegratedResourceManagementSystem.Marketing.Marketing_Admin.UserManagementPanel" %>

<%@ Register Src="~/Marketing/Marketing-Admin/controls/AdminMenu.ascx" TagName="menu"
    TagPrefix="irms" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Src="~/Marketing/controls/UCLoader.ascx" TagName="LOADER" TagPrefix="UC" %>
<asp:Content ID="HeadContent" ContentPlaceHolderID="head" runat="server">
    <link href="Styles/user-management.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="menu_container">
        <irms:menu ID="admin_menu" runat="server" />
    </div>
    <div class="panelTitle">
        <img src="../../Resources/users.png" align="top" height="28px" />
        &nbsp;User Account Management Panel
        <div style="float: right;">
            <a href="Default.aspx" title="BACK">
                <img src="../../Resources/reply.png" />
            </a>
        </div>
    </div>
    <asp:UpdatePanel ID="upnlBrands" runat="server">
        <ContentTemplate>
            <div style="height: 26px; margin-bottom: 1px;" class="modalDrag">
                <div style="float: right;" class="SearchTextContainer">
                    SEARCH:
                    <asp:TextBox ID="txtSearch" runat="server" autofocus placeholder="Search User Account"
                        CssClass="modalText" AutoPostBack="True" Height="16px" Font-Size="10px" Width="150px"
                        ToolTip="Search User Account"></asp:TextBox>
                    <asp:ImageButton ID="imgBtnSearch" runat="server" ImageAlign="AbsBottom" ImageUrl="~/Resources/search.png"
                        ToolTip="SEARCH" onclick="imgBtnSearch_Click" />
                </div>
                <div style="float: left;">
                    <div style="float: left; margin-right: 5px;">
                        <a style="text-decoration: none;" href="NewUserAccount.aspx" title="Create New User Account">
                            <input id="btnNewUserAccount" class="btnNew" type="button" value="NEW" />
                        </a>
                    </div>
                    <div style="float: left; margin-right: 5px;">
                        <a href="Users.aspx" title="View All Online Users" style="text-decoration: none;">
                            <input id="btnViewOnlineUsers" class="btnPreviewOnline" type="button" value="VIEW ONLINE USERS" />
                        </a>
                    </div>
                    <div style="float: left; margin-right: 5px;">
                        <asp:HiddenField ID="HiddenField1" runat="server" />
                        <asp:ModalPopupExtender ID="hLinkDeletee_ModalPopupExtender" runat="server" DynamicServicePath=""
                            Enabled="True" PopupControlID="pnlDeleteModal" PopupDragHandleControlID="pnlDeleteModalDrag"
                            TargetControlID="HiddenField1" BackgroundCssClass="bgModal">
                            <Animations>
                                            <OnShown>
                                                <FadeIn Duration=".2" />
                                            </OnShown>
                            </Animations>
                        </asp:ModalPopupExtender>
                    </div>
                    <div style="float: left; margin-right: 5px;">
                        <asp:Button ID="btnPrint" runat="server" Text="PRINT" CssClass="btnPrint" Font-Names="Verdana" />
                    </div>
                    <div style="float: left; margin-right: 5px;">
                        <asp:UpdateProgress ID="upProgress" runat="server" AssociatedUpdatePanelID="upnlBrands">
                            <ProgressTemplate>
                                <asp:PlaceHolder ID="plcHLoader" runat="server">
                                    <UC:LOADER ID="loader" runat="server" />
                                </asp:PlaceHolder>
                            </ProgressTemplate>
                        </asp:UpdateProgress>
                    </div>
                    <div style="float: left; margin-right: 5px;">
                    
                    </div>
                      <div style="float: left; margin-left: 10px;">
                        <asp:Label Text="FILTER" CssClass="filter-link" ID="lblFilter" runat="server" />
                        <asp:HoverMenuExtender ID="lblFilter_HoverMenuExtender" runat="server" DynamicServicePath=""
                            Enabled="True" PopupControlID="pnlFilter" PopupPosition="Bottom" TargetControlID="lblFilter">
                        </asp:HoverMenuExtender>
                        <asp:Panel ID="pnlFilter" runat="server">
                            <div class="hover-menu-arrow">
                            </div>
                            <div class="hover-menu">
                                <div class="print-link">
                                    <label>
                                        BY DEPARTMENT:<asp:DropDownList ID="DDLDepartments" runat="server" Height="18px" Font-Names="Verdana"
                                            Font-Size="10px" ForeColor="#663300">
                                        </asp:DropDownList>
                                      
                                    </label>
                                    <asp:Button CssClass="btnFilter" ID="btnFilterByBrand" runat="server" 
                                        Text="FILTER" onclick="btnFilterByBrand_Click"
                                        />
                                </div>
                                <div class="print-link" style="text-align: center;">
                                  
                                 
                                </div>
                            </div>
                        </asp:Panel>
                    </div>
                </div>
            </div>
            <div class="listContent">
                <div class="titleList">
                    <img alt="brands" src="../../Resources/users.png" height="16" align="left" />
                    LIST OF USER ACCOUNTS IN &nbsp;<asp:Label ID="lblDepartmentView" runat="server" Text="ALL DEPARTMENT"
                        Font-Bold="True"></asp:Label>
                </div>
                <asp:Panel ID="pnlDepartment" runat="server" ScrollBars="Auto">
                    <asp:ListView ID="ListViewUserAccounts" runat="server" DataKeyNames="ID" DataSourceID="SqlDataSourceUsersAccount"
                        GroupItemCount="6">
                        <AlternatingItemTemplate>
                            <td runat="server">
                                <asp:Panel CssClass="item" ID="pnlAltItems" runat="server">
                                    <div style="margin: 3px 0px 2px 5px;">
                                        <asp:Image ID="Image1" AlternateText="NO IMAGE YET" CssClass="image-style" runat="server"
                                            Width="64px" Height="64px" ImageUrl='<%# "~/Marketing/Marketing-Admin/user-images/" + Eval("image") %>' />
                                        <div class="status" style="float: right; text-align: center;">
                                            <label style="font-size: 8px;">
                                                IS ACTIVE?</label>
                                            <br />
                                            <asp:CheckBox ID="CheckBox1" Checked='<%# Eval("IsActive") %>' runat="server" Enabled="False" />
                                        </div>
                                    </div>
                                    USER #:
                                    <asp:Label ID="IDLabel" runat="server" Text='<%# Eval("ID") %>' />
                                    <br />
                                    NAME:
                                    <asp:Label ID="FullNameLabel" runat="server" Text='<%# Eval("FullName") %>' />
                                    <br />
                                    USER NAME:
                                    <asp:Label ID="UserNameLabel" runat="server" Text='<%# Eval("UserName") %>' ForeColor="#CC6600" />
                                    <br />
                                    DEPARTMENT:
                                    <asp:Label ID="DepartmentLabel" runat="server" Text='<%# Eval("Department") %>' />
                                    <br />
                                    LEVEL:
                                    <asp:Label ID="UserLevelLabel" runat="server" Text='<%# Eval("UserLevel") %>' Font-Italic="True" />
                                    <br />
                                    E-Add:
                                    <asp:Label ID="EmailLabel" runat="server" Text='<%# Eval("Email") %>' />
                                    <br />
                                    CONTACT #:
                                    <asp:Label ID="ContactNumberLabel" runat="server" Text='<%# Eval("ContactNumber") %>' />
                                    <br />
                                </asp:Panel>
                                <asp:HoverMenuExtender ID="pnlAltItems_HoverMenuExtender" runat="server" TargetControlID="pnlAltItems"
                                    PopupControlID="pnlAltItemsMenu">
                                </asp:HoverMenuExtender>
                                <asp:Panel ID="pnlAltItemsMenu" CssClass="item-menu" runat="server">
                                    <img src="../../Resources/edit_normal.png" height="14px" align="top" />
                                    <asp:HyperLink ID="hLinkUpdate" ToolTip="Update User Account" NavigateUrl='<%# "UpdateUserAccount.aspx?UserID="+Eval("ID") %>'
                                        runat="server">UPDATE</asp:HyperLink>
                                    <asp:Button CssClass="item-delete-btn" ID="hLinkDelete" runat="server" PostBackUrl='<%# "UserManagementPanel.aspx?UserID="+Eval("ID") %>'
                                        Text="DELETE" OnClick="hLinkDelete_Click" />
                                    <asp:HyperLink NavigateUrl='<%# "UserLogsPreview.aspx?UserID="+Eval("ID") %>' Target="_blank"
                                        ID="hLinkLogs" ToolTip="View User Logs" runat="server">LOGS</asp:HyperLink>
                                </asp:Panel>
                            </td>
                        </AlternatingItemTemplate>
                        <EmptyDataTemplate>
                            <table runat="server" style="">
                                <tr>
                                    <td>
                                      <img src="../../Resources/unhappy.png" align="middle" />
                                        No data was returned.
                                    </td>
                                </tr>
                            </table>
                        </EmptyDataTemplate>
                        <EmptyItemTemplate>
                            <td runat="server" />
                        </EmptyItemTemplate>
                        <GroupTemplate>
                            <tr id="itemPlaceholderContainer" runat="server">
                                <td id="itemPlaceholder" runat="server">
                                </td>
                            </tr>
                        </GroupTemplate>
                        <ItemTemplate>
                            <td runat="server">
                                <asp:Panel CssClass="item" ID="pnlAltItems" runat="server">
                                    <div style="margin: 3px 0px 5px 5px;">
                                        <asp:Image ID="Image1" AlternateText="NO IMAGE YET" CssClass="image-style" runat="server"
                                            Width="64px" Height="64px" ImageUrl='<%# "~/Marketing/Marketing-Admin/user-images/" + Eval("image") %>' />
                                        <div class="status" style="float: right; text-align: center;">
                                            <label style="font-size: 8px;">
                                                IS ACTIVE?</label>
                                            <br />
                                            <asp:CheckBox ID="CheckBox1" Checked='<%# Eval("IsActive") %>' runat="server" Enabled="False" />
                                        </div>
                                    </div>
                                    USER #:
                                    <asp:Label ID="IDLabel" runat="server" Text='<%# Eval("ID") %>' />
                                    <br />
                                    NAME:
                                    <asp:Label ID="FullNameLabel" runat="server" Text='<%# Eval("FullName") %>' />
                                    <br />
                                    USER NAME:
                                    <asp:Label ID="UserNameLabel" runat="server" Text='<%# Eval("UserName") %>' ForeColor="#CC6600" />
                                    <br />
                                    DEPARTMENT:
                                    <asp:Label ID="DepartmentLabel" runat="server" Text='<%# Eval("Department") %>' />
                                    <br />
                                    LEVEL:
                                    <asp:Label ID="UserLevelLabel" runat="server" Text='<%# Eval("UserLevel") %>' Font-Italic="True" />
                                    <br />
                                    E-Add:
                                    <asp:Label ID="EmailLabel" runat="server" Text='<%# Eval("Email") %>' />
                                    <br />
                                    CONTACT #:
                                    <asp:Label ID="ContactNumberLabel" runat="server" Text='<%# Eval("ContactNumber") %>' />
                                    <br />
                                </asp:Panel>
                                <asp:HoverMenuExtender ID="pnlAltItems_HoverMenuExtender" runat="server" TargetControlID="pnlAltItems"
                                    PopupControlID="pnlAltItemsMenu">
                                </asp:HoverMenuExtender>
                                <asp:Panel ID="pnlAltItemsMenu" CssClass="item-menu" runat="server">
                                    <img src="../../Resources/edit_normal.png" height="14px" align="top" />
                                    <asp:HyperLink ID="hLinkUpdate" ToolTip="Update User Account" NavigateUrl='<%# "UpdateUserAccount.aspx?UserID="+Eval("ID") %>'
                                        runat="server">UPDATE</asp:HyperLink>
                                    <asp:Button CssClass="item-delete-btn" ID="hLinkDelete" runat="server" PostBackUrl='<%# "UserManagementPanel.aspx?UserID="+Eval("ID") %>'
                                        Text="DELETE" OnClick="hLinkDelete_Click" />
                                    <asp:HyperLink NavigateUrl='<%# "UserLogsPreview.aspx?UserID="+Eval("ID") %>' Target="_blank"
                                        ID="hLinkLogs" ToolTip="View User Logs" runat="server">LOGS</asp:HyperLink>
                                </asp:Panel>
                                <br />
                            </td>
                        </ItemTemplate>
                        <LayoutTemplate>
                            <table runat="server">
                                <tr runat="server">
                                    <td runat="server">
                                        <table id="groupPlaceholderContainer" runat="server" border="0">
                                            <tr id="groupPlaceholder" runat="server">
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr runat="server">
                                    <td runat="server" style="">
                                        <asp:DataPager ID="DataPager1" runat="server" PageSize="18">
                                            <Fields>
                                                <asp:NextPreviousPagerField ButtonCssClass="btnPager" ButtonType="Button" ShowFirstPageButton="True"
                                                    ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                                <asp:NumericPagerField />
                                                <asp:NextPreviousPagerField ButtonCssClass="btnPager" ButtonType="Button" ShowLastPageButton="True"
                                                    ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                            </Fields>
                                        </asp:DataPager>
                                    </td>
                                </tr>
                            </table>
                        </LayoutTemplate>
                    </asp:ListView>
                    <asp:SqlDataSource ID="SqlDataSourceUsersAccount" runat="server" ConnectionString="<%$ ConnectionStrings:IRMSConnectionString %>"
                        SelectCommand="SELECT  Usersx.ID, Usersx.FullName, Usersx.UserName, lstDept.ListDesc AS Department, lstUserLevel.ListDesc AS UserLevel, Usersx.Email,Usersx.ContactNumber, Usersx.image,Usersx.IsActive FROM Usersx INNER JOIN lstDept ON Usersx.DeptID = lstDept.ID INNER JOIN lstUserLevel ON Usersx.UserLevelID = lstUserLevel.ID order by ID DESC"></asp:SqlDataSource>
                    <asp:SqlDataSource ID="SqlDataSourceUserAccountByDepartment" runat="server" ConnectionString="<%$ ConnectionStrings:IRMSConnectionString %>"
                        SelectCommand="SELECT  Usersx.ID, Usersx.FullName, Usersx.UserName, lstDept.ListDesc AS Department, lstUserLevel.ListDesc AS UserLevel, Usersx.Email, Usersx.ContactNumber,Usersx.image,Usersx.IsActive FROM Usersx INNER JOIN lstDept ON Usersx.DeptID = lstDept.ID INNER JOIN lstUserLevel ON Usersx.UserLevelID = lstUserLevel.ID where Usersx.DeptID=@DepartmentID order by ID DESC" >
                        <SelectParameters>
                            <asp:ControlParameter ControlID="DDLDepartments" Name="DepartmentID" 
                                PropertyName="SelectedValue" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </asp:Panel>
            </div>
            <%--Delete Modal--%>
            <asp:Panel ID="pnlDeleteModal" runat="server" CssClass="modal">
                <asp:Panel ID="pnlDeleteModalDrag" runat="server" CssClass="modalDrag">
                    <div class="sizeLogo">
                        <img alt="new brand" src="../../Resources/product_brand.png" height="16" align="top" />
                        CONFIRMATION!!!
                    </div>
                </asp:Panel>
                <div style="font-size: 10px; margin-top: 5px; text-align: center; font-family: Verdana;
                    color: #CC6600;">
                    DELETE OPTION
                </div>
                <div style="border: 1px solid #FFCC66; height: 35px; font-size: 10px; text-align: center;
                    font-family: Verdana; color: #CC6600; background-color: #FFFF99; margin: 5px 5px;">
                    <img alt="error update" src="../../Resources/warning.png" align="left" />
                    <asp:RadioButtonList ID="rdioDeleteOption" Font-Size="10px" CssClass="modalLabel"
                        runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem>SET INACTIVE</asp:ListItem>
                        <asp:ListItem>DELETE PERMANENTLY</asp:ListItem>
                    </asp:RadioButtonList>
                </div>
                <div style="text-align: center; color: #FFFF99; font-family: Verdana; font-size: 11px;
                    margin: 5px 2px;">
                    <asp:Label ID="lblTermToDelete" runat="server" Text="No data to delete. Select from the list and try again."></asp:Label>
                </div>
                <div style="text-align: center; margin: 5px 0px;">
                    <asp:Button ID="btnYes" runat="server" Text="YES" CssClass="modalWarningButtonYes"
                        ToolTip="Delete" OnClick="btnYes_Click" />
                    <asp:Button ID="btnNo" runat="server" Text="NO" CssClass="modalWarningButtonNo" ToolTip="Cancel"
                        OnClick="btnNo_Click" />
                </div>
            </asp:Panel>
            </a>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
