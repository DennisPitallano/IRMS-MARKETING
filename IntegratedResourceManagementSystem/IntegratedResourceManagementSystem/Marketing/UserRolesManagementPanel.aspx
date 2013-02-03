<%@ Page Title="" Language="C#" MasterPageFile="~/Marketing/Marketing.Master" AutoEventWireup="true"
    CodeBehind="UserRolesManagementPanel.aspx.cs" Inherits="IntegratedResourceManagementSystem.Marketing.UserRolesManagementPanel" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Src="~/Marketing/controls/UCLoader.ascx" TagName="LOADER" TagPrefix="UC" %>
<asp:Content ID="HeadContent" ContentPlaceHolderID="head" runat="server">
    <link href="../Styles/marketing-item-master.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/grid.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
         .userInfo
    {
        background: #feffe8; /* Old browsers */
        background: -moz-linear-gradient(top,  #feffe8 0%, #d6dbbf 100%); /* FF3.6+ */
        background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#feffe8), color-stop(100%,#d6dbbf)); /* Chrome,Safari4+ */
        background: -webkit-linear-gradient(top,  #feffe8 0%,#d6dbbf 100%); /* Chrome10+,Safari5.1+ */
        background: -o-linear-gradient(top,  #feffe8 0%,#d6dbbf 100%); /* Opera 11.10+ */
        background: -ms-linear-gradient(top,  #feffe8 0%,#d6dbbf 100%); /* IE10+ */
        background: linear-gradient(top,  #feffe8 0%,#d6dbbf 100%); /* W3C */
        filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#feffe8', endColorstr='#d6dbbf',GradientType=0 ); /* IE6-9 */
        padding:5px 5px;
         -moz-border-radius:1x;
        -webkit-border-radius:1px;
        border-radius:1px;
        font-family:Verdana;
    }
        .titleList
        {
            background-color: #C9C9C9;
            background-image: -webkit-gradient(linear, left top, left bottom, from(#c9c9c9), to(#848484), color-stop(0.6, #a1a1a1));
            background-image: -moz-linear-gradient(top, #c9c9c9, #848484, #a1a1a1 90%);
            height: 16px;
            width: 450px;
            color: White;
            line-height: 17px;
            padding: 2px 0px 2px 5px;
            font-family: Verdana;
            -moz-border-radius: 2px;
            -webkit-border-radius: 2px;
            border-radius: 2px;
        }
        #MainContent_gvGarmentList tr:nth-child(n+2):hover
        {
            background-image: -webkit-gradient(linear, left top, left bottom, from(#c9c9c9), to(#848484), color-stop(0.6, #a1a1a1));
            background-image: -moz-linear-gradient(top, #c9c9c9, #848484, #a1a1a1 90%);
            color: #FFFFCC;
        }
    </style>
</asp:Content>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div>
        <asp:Image ID="imgpnlTitle" runat="server" ImageUrl="~/Resources/user_roles_grant.png"
            ImageAlign="AbsMiddle" Height="30px" />
        &nbsp;<asp:Label ID="Label3" runat="server" Text="USER ROLES MANAGEMENT PANEL" Font-Bold="True"
            Font-Names="Verdana" Font-Size="14px"></asp:Label>
        <div style="float: right;">
            <asp:ImageButton ID="imgBtnBack" runat="server" ImageUrl="~/Resources/reply.png"
                PostBackUrl="~/Marketing/StylePanel.aspx" ToolTip="BACK" />
        </div>
        <hr />
    </div>
    <asp:UpdatePanel ID="upnlUsers" runat="server">
        <ContentTemplate>
            <div style="margin-bottom: 1px; height: 26px;" class="modalDrag">
                <div style="float: right;">
                    <asp:TextBox ID="txtSearch" runat="server" AutoPostBack="True"></asp:TextBox>
                    <asp:TextBoxWatermarkExtender ID="txtSearch_TextBoxWatermarkExtender" runat="server"
                        Enabled="True" TargetControlID="txtSearch" WatermarkText="search" WatermarkCssClass="watermark">
                    </asp:TextBoxWatermarkExtender>
                    <asp:ImageButton ID="imgBtnSearch" runat="server" ImageAlign="AbsBottom" ImageUrl="~/Resources/search.png"
                        ToolTip="SEARCH" />
                </div>
                <div style="float: left;">
                    <div style="float: left; margin-right: 5px;">
                        <asp:Button ID="btnUpdateRoles" runat="server" Text="SAVE" CssClass="btnUpdate"
                            Font-Names="Verdana" />
                        <asp:ModalPopupExtender ID="btnUpdateRoles_ModalPopupExtender" runat="server" 
                            CancelControlID="btnNo" DynamicServicePath="" Enabled="True" 
                            PopupControlID="pnlAddRolesModal" 
                            PopupDragHandleControlID="pnlAddRolesModalDrag" 
                            TargetControlID="btnUpdateRoles">
                        </asp:ModalPopupExtender>
                        <asp:RoundedCornersExtender ID="btnUpdateGarment_RoundedCornersExtender" runat="server"
                            Enabled="True" TargetControlID="btnUpdateRoles" Radius="3" BorderColor="LightGray">
                        </asp:RoundedCornersExtender>
                    </div>
                    <div style="float: left; margin-right: 5px;">
                        <asp:Button ID="btnDelete" runat="server" Text="DELETE" CssClass="btnDelete" Font-Names="Verdana" />
                        <asp:ModalPopupExtender ID="btnDelete_ModalPopupExtender" runat="server" 
                            CancelControlID="btnNoDeleteGrant" DynamicServicePath="" Enabled="True" 
                            PopupControlID="pnlDeleteAllGrant" 
                            PopupDragHandleControlID="pnlDeleteAllGrantDrag" TargetControlID="btnDelete">
                        </asp:ModalPopupExtender>
                        <asp:RoundedCornersExtender ID="btnDelete_RoundedCornersExtender" runat="server"
                            Enabled="True" TargetControlID="btnDelete" Radius="3" BorderColor="LightGray">
                        </asp:RoundedCornersExtender>
                    </div>
                    <div style="float: left; margin-right: 5px;">
                        <asp:Button ID="btnPrint" runat="server" Text="PRINT" CssClass="btnPrint" Font-Names="Verdana" />
                        <asp:RoundedCornersExtender ID="btnPrint_RoundedCornersExtender" runat="server" Enabled="True"
                            TargetControlID="btnPrint" Radius="3" BorderColor="LightGray">
                        </asp:RoundedCornersExtender>
                    </div>
                    <div style="float: left; margin-right: 5px;">
                        <asp:UpdateProgress ID="upProgress" runat="server" AssociatedUpdatePanelID="upnlUsers">
                            <ProgressTemplate>
                                <asp:PlaceHolder ID="plcHLoader" runat="server">
                                    <UC:LOADER ID="loader" runat="server" />
                                </asp:PlaceHolder>
                            </ProgressTemplate>
                        </asp:UpdateProgress>
                        <asp:HiddenField ID="hfUserId" runat="server" />
                        <asp:Label ID="lblSuccessFull" runat="server" Text=""></asp:Label>
                        <asp:ModalPopupExtender ID="lblSuccessFull_ModalPopupExtender" runat="server" 
                            DynamicServicePath="" Enabled="True" TargetControlID="lblSuccessFull" 
                            PopupControlID="pnlSaveSuccessful" 
                            PopupDragHandleControlID="pnlSaveSuccessfulDrag" CancelControlID="btnOK">
                        </asp:ModalPopupExtender>
                    </div>
                </div>
            </div>
            <div style="float: left;">
                <div class="titleList">
                    <img alt="new color" src="../Resources/users.png" height="16" align="top" />
                    LIST OF USERS
                </div>
                <div class="listContent">
                    <asp:Panel ID="pnlSizesList" runat="server" Width="450px" Height="370px" ScrollBars="Auto">
                        <asp:GridView ID="gvGarmentList" runat="server" CellPadding="4" GridLines="None"
                            AutoGenerateColumns="False" CssClass="table_grid" DataKeyNames="ID" EnablePersistedSelection="True"
                            AllowPaging="True" AllowSorting="True" 
                            DataSourceID="SqlDataSourceGarments" PageSize="13" 
                            onselectedindexchanged="gvGarmentList_SelectedIndexChanged">
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:TemplateField>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Image ID="imgUser" runat="server" ImageUrl="~/Resources/users.png" Height="16px"
                                            AlternateText='<%# Eval("ID") %>' ToolTip='<%# Eval("FullName") %>' />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:CommandField ShowSelectButton="True" />
                                <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True"
                                    SortExpression="ID" Visible="False"></asp:BoundField>
                                <asp:BoundField DataField="FullName" HeaderText="NAME" SortExpression="FullName">
                                    <HeaderStyle Wrap="False" />
                                    <ItemStyle Wrap="False" />
                                </asp:BoundField>
                                <asp:BoundField DataField="UserName" HeaderText="USER NAME" SortExpression="UserName">
                                    <HeaderStyle Wrap="False" />
                                    <ItemStyle Wrap="False" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Department" HeaderText="DEPARTMENT" SortExpression="Department">
                                    <HeaderStyle Wrap="False" />
                                    <ItemStyle Wrap="False" />
                                </asp:BoundField>
                                <asp:BoundField DataField="UserLevel" HeaderText="USER LEVEL" SortExpression="UserLevel">
                                    <HeaderStyle Wrap="False" />
                                    <ItemStyle Wrap="False" />
                                </asp:BoundField>
                            </Columns>
                            <EditRowStyle BackColor="#7C6F57" />
                            <EmptyDataTemplate>
                                <asp:Image ID="Image2" runat="server" ImageAlign="AbsMiddle" ImageUrl="~/Resources/unhappy.png" />
                                DATA NOT FOUND!!!
                            </EmptyDataTemplate>
                            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                            <RowStyle BackColor="#E3EAEB" />
                            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="False" ForeColor="#333333" Font-Names="Verdana"
                                Font-Size="11px" Font-Italic="True" />
                            <SortedAscendingCellStyle CssClass="asc_cell_style" />
                            <SortedAscendingHeaderStyle BackColor="#246B61" />
                            <SortedDescendingCellStyle CssClass="desc_cell_style" />
                            <SortedDescendingHeaderStyle BackColor="#15524A" />
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSourceGarments" runat="server" ConnectionString="<%$ ConnectionStrings:IRMSConnectionString %>"
                            SelectCommand="SELECT Users.ID, Users.FullName, Users.UserName, lstDept.ListDesc as Department, lstUserLevel.ListDesc AS UserLevel, Users.Email FROM Users INNER JOIN lstDept ON Users.DeptID = lstDept.ID INNER JOIN lstUserLevel ON Users.UserLevelID = lstUserLevel.ID WHERE (Users.DeptID = 3) ORDER BY Users.ID DESC">
                        </asp:SqlDataSource>
                    </asp:Panel>
                </div>
            </div>
            <div style="float: left; margin-left: 4px;">
                <div class="titleList" style="width: 300px;">
                    <img alt="new color" src="../Resources/user_roles_grant.png" height="16" align="top" />
                    USER ROLES/GRANTS
                </div>
                <div>
                <div class="userInfo">
                    Roles/Grants for User:
                    <br />
                    <asp:Label ID="lblUserFullName" runat="server" 
                        Text="Please Select User from List" ForeColor="#FF9900"></asp:Label>
                    <br /> 
                    <asp:Label ID="lblUserUserName" runat="server" ForeColor="#993300"></asp:Label>
                    <br />
                    <asp:Label ID="lblPassWord" runat="server" ForeColor="#993300"></asp:Label>
                </div>
                <div class="userInfo" style="margin-top:2px;">
                    GRANT
               
                     <div style="border: 1px solid #FFCC66;  font-family: Verdana; margin:5px 3px; font-weight:bold;
                        font-size: 12px;color: #CC6600; background-color: #FFFF99; line-height: 16px;">
                    <asp:CheckBoxList ID="chkUserRoles" runat="server">
                       
                    </asp:CheckBoxList>
                </div>
                 </div>
                </div>
            </div>

            <asp:Panel ID="pnlAddRolesModal" runat="server" CssClass="modal">
                <asp:Panel ID="pnlAddRolesModalDrag" runat="server" CssClass="modalDrag">
                    <div class="sizeLogo">
                        <img alt="new color" src="../Resources/user_roles_grant.png" height="16" align="top" />
                        CONFIRMATION!!!
                    </div>
                </asp:Panel>
                <div style="border: 1px solid #FFCC66; text-align: center; font-family: Verdana;
                    font-size: 12px; width:370px; height:48px;  color: #CC6600; background-color: #FFFF99;  line-height:16px;
                    margin: 2px 5px;">
                    <div style="float:left;">
                    <img alt="error update" src="../Resources/warning.png"  align="middle" />
                    </div>
                    <div>
                    Warning: This Grant is Applicable for All the Maketing Module Except for User Management. 
                    </div>
                </div>
                <div style="text-align: center; color: #FFFF99; font-family: Verdana; font-size: 11px;
                    margin: 5px 2px;">
                    <asp:Label ID="lblGrantText" runat="server" Text="No data to save. Select from the list and try again."></asp:Label>
                </div>
                <div style="text-align: center; margin: 5px 0px;">
                    <asp:Button ID="btnYes" runat="server" Text="YES" CssClass="modalWarningButtonYes"
                        ToolTip="Save" onclick="btnYes_Click"  />
                    <asp:RoundedCornersExtender ID="btnYes_RoundedCornersExtender" runat="server" Enabled="True"
                        TargetControlID="btnYes" BorderColor="LightGray">
                    </asp:RoundedCornersExtender>
                    <asp:Button ID="btnNo" runat="server" Text="NO" CssClass="modalWarningButtonNo" ToolTip="Cancel" />
                    <asp:RoundedCornersExtender ID="btnNo_RoundedCornersExtender" runat="server" Enabled="True"
                        TargetControlID="btnNo" BorderColor="LightGray">
                    </asp:RoundedCornersExtender>
                </div>
            </asp:Panel>
            <asp:DropShadowExtender ID="pnlDeleteModal_DropShadowExtender" runat="server" Enabled="True"
                Opacity="0.75" TargetControlID="pnlAddRolesModal">
            </asp:DropShadowExtender>
            <asp:RoundedCornersExtender ID="pnlDeleteModal_RoundedCornersExtender" runat="server"
                Enabled="True" TargetControlID="pnlAddRolesModal" BorderColor="DarkGray">
            </asp:RoundedCornersExtender>


             <asp:Panel ID="pnlSaveSuccessful" runat="server" CssClass="modal">
                <asp:Panel ID="pnlSaveSuccessfulDrag" runat="server" CssClass="modalDrag">
                    <div class="sizeLogo">
                        <img alt="new color" src="../Resources/user_roles_grant.png" height="16" align="top" />
                        SUCCESSFULL!!!
                    </div>
                </asp:Panel>
                <div style="text-align: center; color: #FFFF99; font-family: Verdana; font-size: 11px;
                    margin: 5px 2px;">
                    <asp:Label ID="Label1" runat="server" 
                        Text="User Grant/s Successfully saved!" 
                        Font-Names="Verdana" Font-Size="12px"></asp:Label>
                </div>
                <div style="text-align: center; margin: 5px 0px;">
                    <asp:Button ID="btnOK" runat="server" Text="OK" CssClass="modalWarningButtonYes"
                        ToolTip="Save"  />
                    <asp:RoundedCornersExtender ID="RoundedCornersExtender1" runat="server" Enabled="True"
                        TargetControlID="btnOK" BorderColor="LightGray">
                    </asp:RoundedCornersExtender>
                  
                </div>
            </asp:Panel>
            <asp:DropShadowExtender ID="DropShadowExtender1" runat="server" Enabled="True"
                Opacity="0.75" TargetControlID="pnlSaveSuccessful">
            </asp:DropShadowExtender>
            <asp:RoundedCornersExtender ID="RoundedCornersExtender3" runat="server"
                Enabled="True" TargetControlID="pnlSaveSuccessful" BorderColor="DarkGray">
            </asp:RoundedCornersExtender>

              <asp:Panel ID="pnlDeleteAllGrant" runat="server" CssClass="modal">
                <asp:Panel ID="pnlDeleteAllGrantDrag" runat="server" CssClass="modalDrag">
                    <div class="sizeLogo">
                        <img alt="new color" src="../Resources/user_roles_grant.png" height="16" align="top" />
                        CONFIRMATION!!!
                    </div>
                </asp:Panel>
                <div style="border: 1px solid #FFCC66; text-align: center; font-family: Verdana;
                    font-size: 12px; width:370px; height:48px;  color: #CC6600; background-color: #FFFF99;  line-height:16px;
                    margin: 2px 5px;">
                    <div style="float:left;">
                    <img alt="error update" src="../Resources/warning.png"  align="middle" />
                    </div>
                    <div>
                    Warning: You are about to delete user Grant/Roles from selected user. This will affect user Access to the System.
                    </div>
                </div>
                <div style="text-align: center; color: #FFFF99; font-family: Verdana; font-size: 11px;
                    margin: 5px 2px;">
                    <asp:Label ID="lblDeleteGrant" runat="server" Text="No data to delete. Select from the list and try again."></asp:Label>
                </div>
                <div style="text-align: center; margin: 5px 0px;">
                    <asp:Button ID="btnYesDeleteGrant" runat="server" Text="YES" 
                        CssClass="modalWarningButtonYes" ToolTip="Save" 
                        onclick="btnYesDeleteGrant_Click" />
                    <asp:RoundedCornersExtender ID="RoundedCornersExtender2" runat="server" Enabled="True"
                        TargetControlID="btnYesDeleteGrant" BorderColor="LightGray">
                    </asp:RoundedCornersExtender>
                    <asp:Button ID="btnNoDeleteGrant" runat="server" Text="NO" CssClass="modalWarningButtonNo" ToolTip="Cancel" />
                    <asp:RoundedCornersExtender ID="RoundedCornersExtender4" runat="server" Enabled="True"
                        TargetControlID="btnNoDeleteGrant" BorderColor="LightGray">
                    </asp:RoundedCornersExtender>
                </div>
            </asp:Panel>
            <asp:DropShadowExtender ID="DropShadowExtender2" runat="server" Enabled="True"
                Opacity="0.75" TargetControlID="pnlDeleteAllGrant">
            </asp:DropShadowExtender>
            <asp:RoundedCornersExtender ID="RoundedCornersExtender5" runat="server"
                Enabled="True" TargetControlID="pnlDeleteAllGrant" BorderColor="DarkGray">
            </asp:RoundedCornersExtender>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
