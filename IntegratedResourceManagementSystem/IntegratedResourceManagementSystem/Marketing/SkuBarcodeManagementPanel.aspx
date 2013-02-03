<%@ Page Title="" Language="C#" MasterPageFile="~/Marketing/Marketing.Master" AutoEventWireup="true" CodeBehind="SkuBarcodeManagementPanel.aspx.cs" Inherits="IntegratedResourceManagementSystem.Marketing.SkuBarcodeManagementPanel" %>
<%@ OutputCache CacheProfile ="cached_profile" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<%@ Register Src ="~/Marketing/controls/UCLoader.ascx" TagName="LOADER" TagPrefix ="UC" %>
<asp:Content ID="HeadContent" ContentPlaceHolderID="head" runat="server">
  <link href="../Styles/marketing-item-master.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/grid.css" rel="stylesheet" type="text/css" />
      <style type ="text/css">
        .titleList
         {
             /*09301212163*/
           background: rgb(213,206,166); /* Old browsers */
        /* IE9 SVG, needs conditional override of 'filter' to 'none' */
        background: url(data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiA/Pgo8c3ZnIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgd2lkdGg9IjEwMCUiIGhlaWdodD0iMTAwJSIgdmlld0JveD0iMCAwIDEgMSIgcHJlc2VydmVBc3BlY3RSYXRpbz0ibm9uZSI+CiAgPGxpbmVhckdyYWRpZW50IGlkPSJncmFkLXVjZ2ctZ2VuZXJhdGVkIiBncmFkaWVudFVuaXRzPSJ1c2VyU3BhY2VPblVzZSIgeDE9IjAlIiB5MT0iMCUiIHgyPSIwJSIgeTI9IjEwMCUiPgogICAgPHN0b3Agb2Zmc2V0PSIwJSIgc3RvcC1jb2xvcj0iI2Q1Y2VhNiIgc3RvcC1vcGFjaXR5PSIxIi8+CiAgICA8c3RvcCBvZmZzZXQ9IjQwJSIgc3RvcC1jb2xvcj0iI2M5YzE5MCIgc3RvcC1vcGFjaXR5PSIxIi8+CiAgICA8c3RvcCBvZmZzZXQ9IjEwMCUiIHN0b3AtY29sb3I9IiNiN2FkNzAiIHN0b3Atb3BhY2l0eT0iMSIvPgogIDwvbGluZWFyR3JhZGllbnQ+CiAgPHJlY3QgeD0iMCIgeT0iMCIgd2lkdGg9IjEiIGhlaWdodD0iMSIgZmlsbD0idXJsKCNncmFkLXVjZ2ctZ2VuZXJhdGVkKSIgLz4KPC9zdmc+);
        background: -moz-linear-gradient(top,  rgba(213,206,166,1) 0%, rgba(201,193,144,1) 40%, rgba(183,173,112,1) 100%); /* FF3.6+ */
        background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,rgba(213,206,166,1)), color-stop(40%,rgba(201,193,144,1)), color-stop(100%,rgba(183,173,112,1))); /* Chrome,Safari4+ */
        background: -webkit-linear-gradient(top,  rgba(213,206,166,1) 0%,rgba(201,193,144,1) 40%,rgba(183,173,112,1) 100%); /* Chrome10+,Safari5.1+ */
        background: -o-linear-gradient(top,  rgba(213,206,166,1) 0%,rgba(201,193,144,1) 40%,rgba(183,173,112,1) 100%); /* Opera 11.10+ */
        background: -ms-linear-gradient(top,  rgba(213,206,166,1) 0%,rgba(201,193,144,1) 40%,rgba(183,173,112,1) 100%); /* IE10+ */
        background: linear-gradient(to bottom,  rgba(213,206,166,1) 0%,rgba(201,193,144,1) 40%,rgba(183,173,112,1) 100%); /* W3C */
        filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#d5cea6', endColorstr='#b7ad70',GradientType=0 ); /* IE6-8 */
        padding:5px 5px;
        border-radius:5px 5px 0px 0px;
        line-height: 15px;
        height:15px;
        text-shadow: 1px 1px 1px #fcffad;
        font-family:Verdana;
        font-size: 10px;
            width : 800px;
     
         }
          .modalFabric
    {
        width : 350px;
        height :170px;
        background-color: #999999;
    }
    .modalFabricDrag 
    {
        background-color: #C9C9C9;
        background-image: -webkit-gradient(linear, left top, left bottom, from(#c9c9c9), to(#848484), color-stop(0.6, #a1a1a1));
        background-image : -moz-linear-gradient(top, #c9c9c9, #848484, #a1a1a1 90%);
        width: 350px;
        height : 25px;
        cursor :pointer;
    }
    #MainContent_gvSkusFromOld tr:nth-child(n+2):hover
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
        .pager
        {
            font-family: Verdana;
            color:Red;
            font-size: 11px;
            font-weight: bold;
        }
</style>
</asp:Content>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
   <div style="height:28px; margin-bottom:10px; line-height:28px; color: #333;text-shadow: 1px 1px 0px white;">
                <asp:Image ID="imgpnlTitle" runat="server" ImageUrl="~/Resources/Barcode.png"
                    ImageAlign="Top" Height="28px" />
                &nbsp;<asp:Label ID="Label1" runat="server" Text="BRAND MANAGEMENT PANEL" Font-Bold="True"
                    Font-Names="Verdana" Font-Size="14px"></asp:Label>
                <div style="float: right;">
                    <asp:ImageButton ID="imgBtnBack" runat="server" ImageUrl="~/Resources/reply.png"
                        PostBackUrl="~/Marketing/StylePanel.aspx" ToolTip="BACK" />
                </div>
                    <hr />
            </div>
   <asp:UpdatePanel ID="upnlSKUS" runat="server">
    <ContentTemplate>
      <div style ="width: 100%; height :26px; margin-bottom:1px;" class="modalDrag">
        <div style ="float:right;" class="SearchTextContainer">
        SEARCH:
          <asp:TextBox ID="txtSearch" autofocus placeholder="Search SKU" runat="server" CssClass="modalText" Height="16px" Font-Size="10px" Width="150px" ToolTip="Search SKU's" ></asp:TextBox>
       
          <asp:ImageButton ID="imgBtnSearch" runat="server" ImageAlign="AbsBottom" 
                           ImageUrl="~/Resources/search.png" ToolTip="SEARCH" 
                onclick="imgBtnSearch_Click" />
        </div>
        <div style ="float:left;">
          <div  style ="float:left; margin-right:3px;">
            <asp:Button ID="btnDelete" runat="server" Text="CANCEL SKU" CssClass ="btnDelete" 
                        Font-Names="Verdana" />
            <asp:ModalPopupExtender ID="btnDelete_ModalPopupExtender" runat="server" 
                                    BackgroundCssClass="bgModal" CancelControlID="btnNo" DynamicServicePath="" 
                                    Enabled="True" PopupControlID="pnlDeleteModal" 
                                    PopupDragHandleControlID="pnlDeleteModalDrag" TargetControlID="btnDelete">
            </asp:ModalPopupExtender>
          </div> 
          <div  style ="float:left; margin-right:5px;">
            <asp:Button ID="btnPrint" runat="server" Text="PRINT" CssClass ="btnPrint" 
                        Font-Names="Verdana"  />
          </div> 
            <div  style ="float:left; margin-left:50px;">
            <asp:UpdateProgress ID="uprogSKUS" runat="server" 
                AssociatedUpdatePanelID="upnlSKUS">
                <ProgressTemplate >
                <asp:PlaceHolder ID ="plcHLoader" runat ="server">
                      <UC:LOADER ID ="loader" runat="server" />
                </asp:PlaceHolder>
                </ProgressTemplate>
            </asp:UpdateProgress>
          </div>
            <asp:Label ID="lblDeletedSuccessful" runat="server" Text=""></asp:Label>
            <asp:ModalPopupExtender ID="lblDeletedSuccessful_ModalPopupExtender" 
                runat="server" DynamicServicePath="" Enabled="True" 
                PopupControlID="pnlDeletedSku" PopupDragHandleControlID="pnlDeletedSkuDrag" 
                TargetControlID="lblDeletedSuccessful" CancelControlID="btnOK">
            </asp:ModalPopupExtender>
        </div>
      </div>
      <div class ="titleList"> 
        <asp:Image ID="imgList" runat="server" Height="18px" 
                   ImageUrl="~/Resources/Barcode.png" ImageAlign="AbsBottom" /> LIST OF SKU's
          </div>     
      <div class ="listContent" >
        <asp:Panel ID ="pnlSizesList" runat ="server" Width ="800px" Height ="420px" ScrollBars ="Auto"  >
              <asp:GridView ID="gvSkusFromOld" runat="server" AllowPaging="True" 
                    AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
                    DataKeyNames="ProdNo" DataSourceID="SqlDataSourceAllSKUS" GridLines="None" PageSize="15" 
                  EnablePersistedSelection="True" CssClass="table_grid" 
                  onselectedindexchanged="gvSkusFromOld_SelectedIndexChanged">
                  <AlternatingRowStyle BackColor="White" />
                  <Columns>
                   <asp:TemplateField>
                    <EditItemTemplate>
                      <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                       <asp:Image ID="imgRecordNumberOld" runat="server" Height="16px" 
                                 ImageUrl="~/Resources/Barcode.png" AlternateText ='<%# Eval("ProdNo") %>' ToolTip ='<%# "STYLE#:            "+Eval("StyleNo") 
                                 +"\nDESCRIPTION: " + Eval("StyleDesc") +"\nITEM CODE:     " + Eval("ItemCode") + "\nSKU:                  " + Eval("SKU")%>' />
                    </ItemTemplate>
                  </asp:TemplateField>
                      <asp:CommandField ShowSelectButton="True" />
                      <asp:BoundField DataField="ProdNo" HeaderText="RECORD#" InsertVisible="False" 
                          ReadOnly="True" SortExpression="ProdNo" Visible="False" >
                      <HeaderStyle Wrap="False" />
                      <ItemStyle Font-Bold="True" HorizontalAlign="Center" Wrap="False" />
                      </asp:BoundField>
                      <asp:BoundField DataField="StyleNo" HeaderText="STYLE#" 
                          SortExpression="StyleNo" >
                      <HeaderStyle Wrap="False" />
                      <ItemStyle Wrap="False" />
                      </asp:BoundField>
                      <asp:BoundField DataField="StyleDesc" HeaderText="DESCRIPTION" 
                          SortExpression="StyleDesc" >
                      <HeaderStyle Wrap="False" />
                      <ItemStyle Wrap="False" />
                      </asp:BoundField>
                      <asp:BoundField DataField="ItemCode" HeaderText="ITEM CODE" 
                          SortExpression="ItemCode" >
                      <HeaderStyle Wrap="False" />
                      <ItemStyle Wrap="False" />
                      </asp:BoundField>
                      <asp:BoundField DataField="SKU" HeaderText="SKU BARCODE" SortExpression="SKU" >
                      <HeaderStyle Wrap="False" />
                      <ItemStyle Wrap="False" />
                      </asp:BoundField>
                      <asp:BoundField DataField="DateImport" HeaderText="DATE RECORDED" 
                          SortExpression="DateImport" >
                      <HeaderStyle Wrap="False" />
                      <ItemStyle Wrap="False" />
                      </asp:BoundField>
                  </Columns>
                  <EditRowStyle BackColor="#7C6F57" />
                  <EmptyDataTemplate>
                  <asp:Image ID="Image2" runat="server" ImageUrl="~/Resources/unhappy.png" ImageAlign="Middle" />
                      DATA NOT FOUND!!!
                  </EmptyDataTemplate>
                  <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                  <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                  <PagerSettings FirstPageImageUrl="~/Resources/first.png" 
                      LastPageImageUrl="~/Resources/last.png" Mode="NumericFirstLast" />
                  <PagerStyle CssClass="pager" />
                  <RowStyle BackColor="#E3EAEB" />
                  <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="False" ForeColor="#333333" 
                      Font-Italic="True" />
                  <SortedAscendingCellStyle  CssClass="asc_cell_style" />
                  <SortedAscendingHeaderStyle  CssClass="asc_cell_style_h" />
                  <SortedDescendingCellStyle  CssClass="desc_cell_style" />
                  <SortedDescendingHeaderStyle CssClass="desc_cell_style_h" />
              </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSourceAllSKUS" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:IRMSConnectionString %>" 
                    SelectCommand="SP_GET_ALL_SKUS" CacheDuration="60" EnableCaching="True" 
                  SelectCommandType="StoredProcedure">
                </asp:SqlDataSource>
        </asp:Panel>
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
         <div style="border: 1px solid #FFCC66; text-align: center; font-family: Verdana;
                    font-size: 12px; height: 23px; color: #CC6600; background-color: #FFFF99; line-height: 16px;
                    margin: 2px 5px;">
                    <img alt="error update" src="../Resources/warning.png" height="22px" align="middle" />
                    Warning: This action cannot be undo.
                </div>
                <div style="text-align: center; color: #FFFF99; font-family: Verdana; font-size: 11px;
                    margin: 5px 2px;">
                     <asp:Label ID="lblSKUToDelete" runat="server" Text="No data to delete. Select from the list and try again."></asp:Label>
                </div>
        <div style =" text-align:center; margin:5px 5px;">
          <asp:Button ID="btnYes" runat="server" Text="YES" 
                      CssClass ="modalWarningButtonYes" ToolTip="Delete" 
                onclick="btnYes_Click"/>
          <asp:Button ID="btnNo" runat="server" Text="NO" 
                      CssClass ="modalWarningButtonNo" ToolTip="Cancel"  />
        </div>
      </asp:Panel>
    
      <asp:Panel ID ="pnlDeletedSku" runat ="server" CssClass ="modal" >
        <asp:Panel ID= "pnlDeletedSkuDrag" runat ="server" CssClass ="modalDrag">
          <div class ="sizeLogo">
            <asp:Image ID="Image2" runat="server" Height="16px" ImageAlign="AbsBottom" 
                       ImageUrl="~/Resources/size.png" />
            DELETE SKU
          </div>
        </asp:Panel>
        <div style="text-align: center; color: #FFFF99; font-family: Verdana; font-size: 12px;
                    margin: 5px 2px;">
                     <asp:Label ID="lblDeleted" runat="server" Text=""></asp:Label>
                </div>
                    <div style =" text-align:center; margin:5px 5px;">
          <asp:Button ID="btnOK" runat="server" Text="OK" 
                      CssClass ="modalWarningButtonYes" ToolTip="OK" />
        </div>
        </asp:Panel>
   </ContentTemplate>
   </asp:UpdatePanel>
</asp:Content>
