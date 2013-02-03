<%@ Page Title="" Language="C#" MasterPageFile="~/Marketing/Marketing-Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Users.aspx.cs" Inherits="IntegratedResourceManagementSystem.Marketing.Marketing_Admin.Users" %>
<%@ Register  Src="~/Marketing/Marketing-Admin/controls/AdminMenu.ascx" TagName="menu" TagPrefix="irms" %>
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
                   <a href="UserManagementPanel.aspx" title="BACK" >
                    <img src="../../Resources/reply.png" /> 
                   </a>
                </div>
            </div>
    <asp:UpdatePanel ID="upnlBrands" runat="server">
        <ContentTemplate>
           
            <div style="height:26px; margin-bottom:1px; " class="modalDrag">
                <div style="float: right;" class="SearchTextContainer">
                SEARCH:
                    <asp:TextBox ID="txtSearch" runat="server" autofocus placeholder="Search User Account" CssClass="modalText" 
                        AutoPostBack="True" Height="16px" Font-Size="10px" Width="150px" ToolTip="Search User Account"></asp:TextBox>
                    <asp:ImageButton ID="imgBtnSearch" runat="server" ImageAlign="AbsBottom" ImageUrl="~/Resources/search.png"
                        ToolTip="SEARCH" onclick="imgBtnSearch_Click" />
                </div>
                <div style="float: left;">
                    <div style="float: left; margin-right: 5px;">
                      <a style=" text-decoration:none;" href="NewUserAccount.aspx" title="Create New User Account">
                          <input id="btnNewUserAccount"  class="btnNew" type="button" value="NEW" />
                        </a>
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
                   </div>
            </div>
            <div class="listContent">
                <div class="titleList">
                <img alt="brands" src="../../Resources/tab_contacts.png" height="16"  align="left" />
                    LIST OF ONLINE USER IN &nbsp;<asp:Label ID="lblDepartmentView" runat="server" 
                        Text="ALL DEPARTMENT" Font-Bold="True" ></asp:Label>
                </div>
                <asp:Panel ID="pnlDepartment" runat="server"  ScrollBars="Auto">
                    <asp:ListView ID="ListViewUserAccounts" runat="server" DataKeyNames="ID" 
                        DataSourceID="SqlDataSourceUsersAccount" GroupItemCount="6" >
                        <AlternatingItemTemplate>
                            <td id="Td1" runat="server" >
                            <asp:Panel CssClass="item" ID="pnlAltItems" runat ="server" >
                               <div style="margin:3px 0px 2px 5px;">
                                   <asp:Image ID="Image1" AlternateText="NO IMAGE YET" CssClass="image-style" runat="server"
                                    Width="64px" Height="64px" ImageUrl='<%# "~/Marketing/Marketing-Admin/user-images/" + Eval("image") %>' />
                                     <div class="status" style="float:right; text-align:center;">
                                   <label style="font-size:8px;"> IS ACTIVE?</label>
                                   <br />
                                       <asp:CheckBox ID="CheckBox1" Checked ='<%# Eval("IsActive") %>' runat="server" Enabled="False" />
                                </div>
                               </div>
                                USER #:
                                <asp:Label ID="IDLabel" runat="server" Text='<%# Eval("ID") %>' />
                                <br />
                                NAME:
                                <asp:Label ID="FullNameLabel" runat="server" Text='<%# Eval("FullName") %>' />
                                <br />
                                USER NAME:
                                <asp:Label ID="UserNameLabel" runat="server" Text='<%# Eval("UserName") %>' ForeColor="#CC6600"  />
                                <br />
                                DEPARTMENT:
                                <asp:Label ID="DepartmentLabel" runat="server" 
                                    Text='<%# Eval("Department") %>' />
                                <br />
                                LEVEL:
                                <asp:Label ID="UserLevelLabel" runat="server" Text='<%# Eval("UserLevel") %>' Font-Italic="True" />
                                <br />
                                E-Add:
                                <asp:Label ID="EmailLabel" runat="server" Text='<%# Eval("Email") %>' />
                                <br />
                                CONTACT #:
                                <asp:Label ID="ContactNumberLabel" runat="server" 
                                    Text='<%# Eval("ContactNumber") %>' />
                                <br />
                              
                             </asp:Panel>
                                <asp:HoverMenuExtender ID="pnlAltItems_HoverMenuExtender" 
                              runat="server" TargetControlID="pnlAltItems" PopupControlID="pnlAltItemsMenu">
                                </asp:HoverMenuExtender>
                                 <asp:Panel ID="pnlAltItemsMenu" CssClass ="item-menu" runat="server">
                                    <img src="../../Resources/chat.png" height="14px" align="top" />
                                    <asp:HyperLink ID="hLinkUpdate"  ToolTip="Send Message"
                                     NavigateUrl='<%# "SendMessage.aspx?UserID="+Eval("ID") %>' Target="_blank" runat="server">SEND MESSAGE</asp:HyperLink>
                                    <asp:HyperLink NavigateUrl='<%# "UserTodayLogsPreview.aspx?UserID="+Eval("ID") %>' Target="_blank"
                                    ID="hLinkLogs" ToolTip="View User Logs" runat="server">TODAY LOGS</asp:HyperLink>
                                </asp:Panel>
                            </td>
                        </AlternatingItemTemplate>
                        <EmptyDataTemplate>
                            <table id="Table1" runat="server" style="">
                                <tr>
                                    <td>
                                        No data was returned.</td>
                                </tr>
                            </table>
                        </EmptyDataTemplate>
                        <EmptyItemTemplate>
                            <td id="Td2" runat="server" />
                        </EmptyItemTemplate>
                        <GroupTemplate>
                            <tr ID="itemPlaceholderContainer" runat="server">
                                <td ID="itemPlaceholder" runat="server">
                                </td>
                            </tr>
                        </GroupTemplate>
                        <ItemTemplate>
                            <td id="Td3" runat="server">
                             <asp:Panel CssClass="item" ID="pnlAltItems" runat ="server" > 
                              <div style="margin:3px 0px 5px 5px;">
                                   <asp:Image ID="Image1" AlternateText="NO IMAGE YET" CssClass="image-style" runat="server" 
                                   Width="64px" Height="64px" ImageUrl='<%# "~/Marketing/Marketing-Admin/user-images/" + Eval("image") %>'  />
                                   <div class="status" style="float:right; text-align:center;">
                                   <label style="font-size:8px;"> IS ACTIVE?</label>
                                   <br />
                                       <asp:CheckBox ID="CheckBox1" Checked ='<%# Eval("IsActive") %>' runat="server" Enabled="False" />
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
                                <asp:Label ID="DepartmentLabel" runat="server" 
                                    Text='<%# Eval("Department") %>' />
                                <br />
                                LEVEL:
                                <asp:Label ID="UserLevelLabel" runat="server" Text='<%# Eval("UserLevel") %>' Font-Italic="True" />
                                <br />
                                E-Add:
                                <asp:Label ID="EmailLabel" runat="server" Text='<%# Eval("Email") %>' />
                                <br />
                                CONTACT #:
                                <asp:Label ID="ContactNumberLabel" runat="server" 
                                    Text='<%# Eval("ContactNumber") %>' />
                                <br />
                             
                               </asp:Panel>
                              <asp:HoverMenuExtender ID="pnlAltItems_HoverMenuExtender" 
                              runat="server" TargetControlID="pnlAltItems" PopupControlID="pnlAltItemsMenu">
                                </asp:HoverMenuExtender>
                                <asp:Panel ID="pnlAltItemsMenu" CssClass ="item-menu" runat="server">
                                    <img src="../../Resources/chat.png" height="14px" align="top" />
                                    <asp:HyperLink ID="hLinkUpdate"  ToolTip="Send Message"
                                     NavigateUrl='<%# "SendMessage.aspx?UserID="+Eval("ID") %>' Target="_blank" runat="server">SEND MESSAGE</asp:HyperLink>
                                    <asp:HyperLink NavigateUrl='<%# "UserTodayLogsPreview.aspx?UserID="+Eval("ID") %>' Target="_blank"
                                    ID="hLinkLogs" ToolTip="View User Logs" runat="server">TODAY LOGS</asp:HyperLink>
                                </asp:Panel>
                                <br />
                            </td>
                        </ItemTemplate>
                        <LayoutTemplate>
                            <table id="Table2" runat="server">
                                <tr id="Tr1" runat="server">
                                    <td id="Td4" runat="server">
                                        <table ID="groupPlaceholderContainer" runat="server" border="0">
                                            <tr ID="groupPlaceholder" runat="server">
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr id="Tr2" runat="server">
                                    <td id="Td5" runat="server" style="">
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
                    <asp:SqlDataSource ID="SqlDataSourceUsersAccount" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:IRMSConnectionString %>" SelectCommand="SELECT  Usersx.ID, Usersx.FullName, Usersx.UserName, lstDept.ListDesc AS Department, lstUserLevel.ListDesc AS UserLevel, Usersx.Email, Usersx.ContactNumber, Usersx.image,Usersx.IsActive FROM Usersx INNER JOIN lstDept ON Usersx.DeptID = lstDept.ID INNER JOIN  lstUserLevel ON Usersx.UserLevelID = lstUserLevel.ID where Usersx.IsOnline=1 order by ID DESC"></asp:SqlDataSource>
                </asp:Panel>
            </div>

        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
