<%@ Page Title="" Language="C#" MasterPageFile="~/Marketing/Marketing.Master" AutoEventWireup="true" CodeBehind="UsersPanel.aspx.cs" Inherits="IntegratedResourceManagementSystem.Marketing.UsersPanel" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Src="~/Marketing/controls/UCLoader.ascx" TagName="LOADER" TagPrefix="UC" %>
<asp:Content ID="HeadContent" ContentPlaceHolderID="head" runat="server">
 <link href="../Styles/marketing-item-master.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/grid.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .titleList
        {
            background-color: #C9C9C9;
            background-image: -webkit-gradient(linear, left top, left bottom, from(#c9c9c9), to(#848484), color-stop(0.6, #a1a1a1));
            background-image: -moz-linear-gradient(top, #c9c9c9, #848484, #a1a1a1 90%);
            height:16px;
            width: 700px;
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
        <asp:Image ID="imgpnlTitle" runat="server" ImageUrl="~/Resources/users.png" ImageAlign="AbsMiddle"
            Height="30px" />
        &nbsp;<asp:Label ID="Label3" runat="server" Text="USER MANAGEMENT PANEL" Font-Bold="True"
            Font-Names="Verdana" Font-Size="14px"></asp:Label>
        <div style="float: right;">
            <asp:ImageButton ID="imgBtnBack" runat="server" ImageUrl="~/Resources/reply.png"
                PostBackUrl="~/Marketing/StylePanel.aspx" ToolTip="BACK" />
        </div>
        <hr />
    </div>
    <asp:UpdatePanel ID ="upnlUsers" runat="server">
        <ContentTemplate>
          <div style="margin-bottom: 1px; height: 26px;" class="modalDrag">
                <div style="float: right;">
                    <asp:TextBox ID="txtSearch" runat="server" 
                        AutoPostBack="True"></asp:TextBox>
                    <asp:TextBoxWatermarkExtender ID="txtSearch_TextBoxWatermarkExtender" runat="server"
                        Enabled="True" TargetControlID="txtSearch" WatermarkText="search" WatermarkCssClass="watermark">
                    </asp:TextBoxWatermarkExtender>
                    <asp:ImageButton ID="imgBtnSearch" runat="server" ImageAlign="AbsBottom" ImageUrl="~/Resources/search.png"
                        ToolTip="SEARCH" />
                </div>
                <div style="float: left;">
                    <div style="float: left; margin-right: 5px;">
                        <asp:Button ID="btnNewGarment" runat="server" Text="NEW" CssClass="btnNew" Font-Names="Verdana" />
                        <asp:RoundedCornersExtender ID="btnNewGarment_RoundedCornersExtender" runat="server"
                            Enabled="True" TargetControlID="btnNewGarment" Radius="3" BorderColor="LightGray">
                        </asp:RoundedCornersExtender>
                    </div>
                    <div style="float: left; margin-right: 5px;">
                        <asp:Button ID="btnUpdateGarment" runat="server" Text="UPDATE" CssClass="btnUpdate"
                            Font-Names="Verdana" />
                        <asp:RoundedCornersExtender ID="btnUpdateGarment_RoundedCornersExtender" runat="server"
                            Enabled="True" TargetControlID="btnUpdateGarment" Radius="3" BorderColor="LightGray">
                        </asp:RoundedCornersExtender>
                    </div>
                    <div style="float: left; margin-right: 5px;">
                        <asp:Button ID="btnDelete" runat="server" Text="DELETE" CssClass="btnDelete" Font-Names="Verdana" />
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
                    </div>
                    <div style="float: left; margin-right: 5px;">
                        <asp:UpdateProgress ID="upProgress" runat="server" AssociatedUpdatePanelID="upnlUsers">
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
               <img alt="new color" src="../Resources/users.png" height="16" align="top" />
                LIST OF USERS
          </div>
           <div class="listContent">
                <asp:Panel ID="pnlSizesList" runat="server" Width="700px" Height="370px" ScrollBars="Auto">
                    <asp:GridView ID="gvGarmentList" runat="server" CellPadding="4" 
                        GridLines="None" AutoGenerateColumns="False" CssClass="table_grid" DataKeyNames="ID"
                        EnablePersistedSelection="True" AllowPaging="True" AllowSorting="True" DataSourceID="SqlDataSourceGarments"
                        PageSize="13">
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
                            <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False"
                                ReadOnly="True" SortExpression="ID" Visible="False"></asp:BoundField>
                            <asp:BoundField DataField="FullName" HeaderText="NAME" 
                                SortExpression="FullName">
                            <HeaderStyle Wrap="False" />
                            <ItemStyle Wrap="False" />
                            </asp:BoundField>
                            <asp:BoundField DataField="UserName" HeaderText="USER NAME"
                                SortExpression="UserName">
                            <HeaderStyle Wrap="False" />
                            <ItemStyle Wrap="False" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Department" HeaderText="DEPARTMENT" 
                                SortExpression="Department">
                            <HeaderStyle Wrap="False" />
                            <ItemStyle Wrap="False" />
                            </asp:BoundField>
                            <asp:BoundField DataField="UserLevel" HeaderText="USER LEVEL" 
                                SortExpression="UserLevel">
                            <HeaderStyle Wrap="False" />
                            <ItemStyle Wrap="False" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Email" HeaderText="EMAIL ADDRESS" 
                                SortExpression="Email" >
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
                        <SortedDescendingCellStyle  CssClass="desc_cell_style" />
                        <SortedDescendingHeaderStyle BackColor="#15524A" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSourceGarments" runat="server" ConnectionString="<%$ ConnectionStrings:IRMSConnectionString %>"
                        
                        SelectCommand="SELECT Users.ID, Users.FullName, Users.UserName, lstDept.ListDesc as Department, lstUserLevel.ListDesc AS UserLevel, Users.Email FROM Users INNER JOIN lstDept ON Users.DeptID = lstDept.ID INNER JOIN lstUserLevel ON Users.UserLevelID = lstUserLevel.ID WHERE (Users.DeptID = 3)">
                    </asp:SqlDataSource>
                </asp:Panel>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
     

</asp:Content>
