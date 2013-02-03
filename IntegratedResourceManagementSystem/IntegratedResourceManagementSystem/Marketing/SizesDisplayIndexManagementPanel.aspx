<%@ Page Title="" Language="C#" MasterPageFile="~/Marketing/Marketing.Master" AutoEventWireup="true" CodeBehind="SizesDisplayIndexManagementPanel.aspx.cs" Inherits="IntegratedResourceManagementSystem.Marketing.SizesDisplayIndexManagementPanel" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<%@ Register Src ="~/Marketing/controls/UCLoader.ascx" TagName="LOADER" TagPrefix ="UC" %>
<asp:Content ID="HeadContent" ContentPlaceHolderID="head" runat="server">
  <link href="../Styles/marketing-item-master.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/grid.css" rel="stylesheet" type="text/css" />
  <style type="text/css">
    #MainContent_gvSizes tr:nth-child(n+2):hover
        {
         background: rgb(252,255,244); /* Old browsers */
/* IE9 SVG, needs conditional override of 'filter' to 'none' */
    background: url(data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiA/Pgo8c3ZnIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgd2lkdGg9IjEwMCUiIGhlaWdodD0iMTAwJSIgdmlld0JveD0iMCAwIDEgMSIgcHJlc2VydmVBc3BlY3RSYXRpbz0ibm9uZSI+CiAgPGxpbmVhckdyYWRpZW50IGlkPSJncmFkLXVjZ2ctZ2VuZXJhdGVkIiBncmFkaWVudFVuaXRzPSJ1c2VyU3BhY2VPblVzZSIgeDE9IjAlIiB5MT0iMCUiIHgyPSIwJSIgeTI9IjEwMCUiPgogICAgPHN0b3Agb2Zmc2V0PSIwJSIgc3RvcC1jb2xvcj0iI2ZjZmZmNCIgc3RvcC1vcGFjaXR5PSIxIi8+CiAgICA8c3RvcCBvZmZzZXQ9IjQwJSIgc3RvcC1jb2xvcj0iI2RmZTVkNyIgc3RvcC1vcGFjaXR5PSIxIi8+CiAgICA8c3RvcCBvZmZzZXQ9IjEwMCUiIHN0b3AtY29sb3I9IiNiM2JlYWQiIHN0b3Atb3BhY2l0eT0iMSIvPgogIDwvbGluZWFyR3JhZGllbnQ+CiAgPHJlY3QgeD0iMCIgeT0iMCIgd2lkdGg9IjEiIGhlaWdodD0iMSIgZmlsbD0idXJsKCNncmFkLXVjZ2ctZ2VuZXJhdGVkKSIgLz4KPC9zdmc+);
    background: -moz-linear-gradient(top,  rgba(252,255,244,1) 0%, rgba(223,229,215,1) 40%, rgba(179,190,173,1) 100%); /* FF3.6+ */
    background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,rgba(252,255,244,1)), color-stop(40%,rgba(223,229,215,1)), color-stop(100%,rgba(179,190,173,1))); /* Chrome,Safari4+ */
    background: -webkit-linear-gradient(top,  rgba(252,255,244,1) 0%,rgba(223,229,215,1) 40%,rgba(179,190,173,1) 100%); /* Chrome10+,Safari5.1+ */
    background: -o-linear-gradient(top,  rgba(252,255,244,1) 0%,rgba(223,229,215,1) 40%,rgba(179,190,173,1) 100%); /* Opera 11.10+ */
    background: -ms-linear-gradient(top,  rgba(252,255,244,1) 0%,rgba(223,229,215,1) 40%,rgba(179,190,173,1) 100%); /* IE10+ */
    background: linear-gradient(to bottom,  rgba(252,255,244,1) 0%,rgba(223,229,215,1) 40%,rgba(179,190,173,1) 100%); /* W3C */
    filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#fcfff4', endColorstr='#b3bead',GradientType=0 ); /* IE6-8 */
    color: #259625;
    cursor:pointer;
        }
  </style>
</asp:Content>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
  <asp:UpdatePanel ID ="upnlSizeGroupDisplayIndex" runat ="server" >
    <ContentTemplate >
      <div>
          <asp:Image ID="Image2" runat="server" ImageAlign="AbsMiddle" 
              ImageUrl="~/Resources/size.png" /> &nbsp; &nbsp;<asp:Label ID="Label2" runat="server" Text="MANAGE SIZES DISPLAY INDEX" 
                   Font-Bold="True" Font-Names="Verdana" Font-Size="11pt"></asp:Label>
        <div style =" float:right;">
          <asp:ImageButton ID="imgBtnBack" runat="server" 
                           ImageUrl="~/Resources/reply.png" 
                           PostBackUrl="~/Marketing/SizeManagementPanel.aspx" ToolTip="BACK" />
        </div>
         <div style ="width:510px;">
        <hr />
        </div>
      </div>
      <div  class ="modalDrag">
        <asp:Label ID="Label1" runat="server" Text="SELECT SIZE GROUP: " CssClass="modalLabel"></asp:Label>
        <asp:DropDownList ID="dlSizeGroups" runat="server" AutoPostBack="True" 
                          DataSourceID="SqlDataSourceSizeGroups" DataTextField="SIZE_GROUP" 
                          DataValueField="RECORD_NO" CssClass="modalText" Height="20px">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSourceSizeGroups" runat="server" 
                           ConnectionString="<%$ ConnectionStrings:IRMSConnectionString %>" 
                           SelectCommand="SELECT * FROM [SIZE_GROUP]"></asp:SqlDataSource>
      </div>
      <div style ="height:380px;">
        <div>
          <asp:Label ID="Label3" runat="server" Text="SIZES" Font-Bold="True" 
                     Font-Names="Verdana" Font-Size="11px" ForeColor="#003366"></asp:Label>
        </div>
        <div style ="float:left ; margin-bottom :20px;">
          <asp:GridView ID="gvSizes" runat="server" AllowPaging="True" 
                        AutoGenerateColumns="False" CellPadding="4" 
                        DataKeyNames="RECORD_NO" DataSourceID="SqlDataSourceSizesByGroup" 
                         CssClass ="table_grid" GridLines="None" PageSize="15" 
                        EnablePersistedSelection="True" ForeColor="#333333">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
              <asp:TemplateField>
                <EditItemTemplate>
                  <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                  <asp:Image ID="imgSize" runat="server" Height="12px" 
                             ImageUrl="~/Resources/size.png" AlternateText ='<%# Eval("RECORD_NO") %>' />
                </ItemTemplate>
              </asp:TemplateField>
              <asp:CommandField ShowSelectButton="True" />
              <asp:BoundField DataField="RECORD_NO" HeaderText="RECORD_NO" 
                              InsertVisible="False" ReadOnly="True" SortExpression="RECORD_NO" 
                              Visible="False" />
              <asp:BoundField DataField="SIZE_CODE" HeaderText="CODE" 
                              SortExpression="SIZE_CODE" />
              <asp:BoundField DataField="SIZE_DESCRIPTION" HeaderText="DESCRIPTION" 
                              SortExpression="SIZE_DESCRIPTION" />
              <asp:BoundField DataField="DISPLAY_INDEX" HeaderText="Display Index" 
                              SortExpression="DISPLAY_INDEX" >
                <HeaderStyle Font-Names="Verdana" Font-Size="10px" />
                <ItemStyle Font-Bold="True" ForeColor="#993300" HorizontalAlign="Center" />
              </asp:BoundField>
            </Columns>
              <EditRowStyle BackColor="#7C6F57" />
            <FooterStyle BackColor="#1C5E55" ForeColor="White" Font-Bold="True" />
            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#E3EAEB" />
            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle CssClass="asc_cell_style" />
            <SortedAscendingHeaderStyle  CssClass="asc_cell_style_h" />
            <SortedDescendingCellStyle  CssClass="desc_cell_style" />
            <SortedDescendingHeaderStyle  CssClass="desc_cell_style_h" />
          </asp:GridView>
          <asp:SqlDataSource ID="SqlDataSourceSizesByGroup" runat="server" 
                             ConnectionString="<%$ ConnectionStrings:IRMSConnectionString %>" 
                             SelectCommand="SELECT [RECORD_NO], [SIZE_CODE], [SIZE_DESCRIPTION], [DISPLAY_INDEX] FROM [SIZES] WHERE ([SIZE_GROUP] = @SIZE_GROUP) ORDER BY [DISPLAY_INDEX]">
            <SelectParameters>
              <asp:ControlParameter ControlID="dlSizeGroups" Name="SIZE_GROUP" 
                                    PropertyName="SelectedValue" Type="Int64" />
            </SelectParameters>
          </asp:SqlDataSource>
        </div>
        <div style ="float:left; margin-left:5px; margin-top:20px;">
          <asp:ImageButton ID="imgBtnUp" runat="server" 
                           ImageUrl="~/Resources/previousresult.png" 
                           ToolTip="Move Up Selected Size" onclick="imgBtnUp_Click" />
          <br />
          <asp:ImageButton ID="imgBtnDown" runat="server" 
                           ImageUrl="~/Resources/nextresult.png" ToolTip="Move Down Selected Size" 
                           onclick="imgBtnDown_Click" />
          <br />
          <asp:ImageButton ID="imgBtnDeleteSelected" runat="server" 
                           ImageUrl="~/Resources/close_infobar.png" 
                           ToolTip="Delete Selected Size" />
          <asp:ModalPopupExtender ID="imgBtnDeleteSelected_ModalPopupExtender" 
                                  runat="server" CancelControlID="btnNo" DynamicServicePath="" Enabled="True" 
                                  PopupControlID="pnlDeleteModal" PopupDragHandleControlID="pnlDeleteModalDrag" 
                                  TargetControlID="imgBtnDeleteSelected" BackgroundCssClass="bgModal">
          </asp:ModalPopupExtender>
        </div>
        <div style ="float:left; margin-left:20px; text-align:center;" >
            <asp:UpdateProgress ID="upProgress" runat="server" 
              AssociatedUpdatePanelID="upnlSizeGroupDisplayIndex" >
            <ProgressTemplate >
                <asp:PlaceHolder ID ="plcHLoader" runat ="server">
                      <UC:LOADER ID ="loader" runat="server" />
                </asp:PlaceHolder>
            </ProgressTemplate>
          </asp:UpdateProgress>
        </div>
      </div>
      <%--Delete Modal--%>
      <asp:Panel ID ="pnlDeleteModal" runat ="server" CssClass ="modal" >
        <asp:Panel ID= "pnlDeleteModalDrag" runat ="server" CssClass ="modalDrag">
          <div class ="sizeLogo">
            <asp:Image ID="Image1" runat="server" Height="16px" ImageAlign="AbsBottom" 
                       ImageUrl="~/Resources/size.png" />
            CONFIRMATION!!!
          </div>
        </asp:Panel>
        <div class ="modalWarningText">
          Are you sure you want to Delete this Data?
        </div>
        <div style =" text-align:center; margin:5px 0px;">
          <asp:Button ID="btnYes" runat="server" Text="YES" 
                      CssClass ="modalWarningButtonYes" ToolTip="Delete" 
                      onclick="btnYes_Click"/>
          <asp:Button ID="btnNo" runat="server" Text="NO" 
                      CssClass ="modalWarningButtonNo" ToolTip="Cancel"  />
        </div>
      </asp:Panel>
          
    </ContentTemplate>
  </asp:UpdatePanel>
  

</asp:Content>
