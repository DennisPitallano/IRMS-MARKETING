<%@ Page Title="" Language="C#" MasterPageFile="~/Marketing/Marketing.Master" AutoEventWireup="true" CodeBehind="ConcessionMarkDownMemoPanel.aspx.cs" Inherits="IntegratedResourceManagementSystem.Marketing.ConcessionMarkDownMemoPanel" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<%@ Register Src ="~/Marketing/controls/UCLoader.ascx" TagName="LOADER" TagPrefix ="UC" %>
<asp:Content ID="HeadContent" ContentPlaceHolderID="head" runat="server">
    <link href="../Styles/marketing-item-master.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/grid.css" rel="stylesheet" type="text/css" />
    <style type ="text/css" >
        
        .dtlsLabel
        {
            font-family:Verdana;
            font-size: 11px;
            text-align:right;
            color :#FFFFCC;
            }
    .btnCancelDR
    {
        font-family:Verdana ;
        font-weight :bold;
        font-size: 10px;
        height : 30px;
        text-align :right;
        background:url('../Resources/yes.png');
        background-repeat:no-repeat;
        background-position:left;
        background-color: #C9C9C9;
        color:#FCFCFC;
        width: 117px;
        height:30px;
        cursor:pointer;
    }
    .btnCancelDR:hover
    {
          margin-top:1px;
        background:url('../Resources/yes.png');
          background-repeat :no-repeat;
          background-position:left;
          background-color: #C9C9C9;
          color:#FFFFCC;
    }
        .titleList
     {
         /*09301212163*/
          background-color: #C9C9C9;
          background-image: -webkit-gradient(linear, left top, left bottom, from(#c9c9c9), to(#848484), color-stop(0.6, #a1a1a1));
        background-image : -moz-linear-gradient(top, #c9c9c9, #848484, #a1a1a1 90%);
        height : 20px;
      
        color : White;
     }
       #MainContent_gvMarkDownMemo tr:nth-child(n+2):hover
        {
            background-image: -webkit-gradient(linear, left top, left bottom, from(#c9c9c9), to(#848484), color-stop(0.6, #a1a1a1));
            background-image: -moz-linear-gradient(top, #c9c9c9, #848484, #a1a1a1 90%);
            color: #FFFFCC;
        }
        #MainContent_gvDRDetails tr:nth-child(n+2):hover
        {
            background-image: -webkit-gradient(linear, left top, left bottom, from(#c9c9c9), to(#848484), color-stop(0.6, #a1a1a1));
            background-image: -moz-linear-gradient(top, #c9c9c9, #848484, #a1a1a1 90%);
            color: #FFFFCC;
        }
    </style>
</asp:Content>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <asp:UpdatePanel ID ="upnlDeliveryReceipts" runat ="server" >
    <ContentTemplate>

      <div>
        <div>
          <asp:Image ID="imgDRTitle" runat="server" ImageUrl="~/Resources/panels.png" 
                     ImageAlign="AbsMiddle" />     
            MANAGE CONCESSION GENERAL MARKDOWN MEMO
          <div style ="width:1150px;">
          <hr /></div>
            <div style =" text-align :center; margin-bottom :5px;">
        <asp:Panel ID ="pnlError" runat ="server" BackColor="#FFCC66" Visible="False" 
                    BorderColor="#CC6600" BorderStyle="Solid" BorderWidth="1px">
            <asp:Image ID="imgError" runat="server" ImageUrl="~/Resources/warning.png" 
                Height="20px" ImageAlign="AbsMiddle"  /> <asp:Label ID="lblError" 
                runat="server" Font-Names="Verdana" ForeColor="#FF3300" Font-Bold="True" 
                Font-Size="10px" ></asp:Label>
        </asp:Panel>
          </div>
        </div>
        <div style = "width:500px; margin-bottom:5px; height: 30px;">
     
           <div style ="float:right;">
          
            <asp:TextBox ID="txtSearchDR" runat="server" Font-Names="Verdana" Width="120px" ToolTip="Input Memo Number" 
                   AutoPostBack="True" ></asp:TextBox>
            <asp:ImageButton ID="imgBtnSearchDR" 
                             runat="server" ImageAlign="Top" ImageUrl="~/Resources/search.png" 
                             ToolTip="Search Delivery Receipt" 
                  onclick="imgBtnSearchDR_Click" />

          </div>
            <div style ="float:right; margin-right:5px; margin-top:3px;" >
        <asp:Panel ID="pnlDateRangeFilter" runat ="server" >
        <asp:Label ID="Label3" runat="server" Text="DATE FROM:" Font-Names="Verdana" 
                Font-Size="10px" ForeColor="#CC6600"></asp:Label>
               <asp:TextBox ID="txtMemoDateFrom" runat="server" Font-Names="Verdana" 
                Font-Size="9px" ToolTip="Input Memo Date From"></asp:TextBox>
            <asp:CalendarExtender ID="txtMemoDateFrom_CalendarExtender" runat="server" 
                Enabled="True" Format="MMMM dd, yyyy" TargetControlID="txtMemoDateFrom">
            </asp:CalendarExtender>
            <asp:Label ID="Label2" runat="server" Text="TO" Font-Names="Verdana" 
                Font-Size="9px" ForeColor="#CC6600"></asp:Label>
              <asp:TextBox ID="txtMemoDateTo" runat="server" Font-Names="Verdana" 
                Font-Size="10px" ToolTip="Input Memo Date To" ></asp:TextBox>
        
            <asp:CalendarExtender ID="txtMemoDateTo_CalendarExtender" runat="server" 
                Enabled="True" TargetControlID="txtMemoDateTo" Format="MMMM dd, yyyy">
            </asp:CalendarExtender>
        
           </asp:Panel>
      </div>
         
        
         <div>
            
         </div>
        </div>
        <div style = "float: left; width: 430px; height:435px; border:0.08em Solid Gray; margin-right:2px;">
        <div class ="titleList"> 
          <asp:Image ID="imgList" runat="server" Height="16px" Width ="20px"
                     ImageUrl="~/Resources/panels.png" ImageAlign="AbsBottom" /> 
                   <asp:Label ID ="lblTitleList" runat ="server" Font-Names="Verdana" 
                Font-Size="11px" >
                    LIST OF GENERAL MARKDOWN MEMO (CONCESSION)
                   </asp:Label>
                    
             <div style ="float:right;">
      <%-- <asp:Button ID="btnPreviewMemo" runat="server" Text="Preview Memo" Font-Names="Verdana" Font-Bold="true"
                     Font-Size="9px" Font-Italic="True" ForeColor="#003366" />--%></div>
        </div>
       
          <asp:Panel ID ="pnlDeliveryReceipt" runat ="server" ScrollBars ="Auto"  >
            <asp:GridView ID="gvMarkDownMemo" runat="server" AllowPaging="True" 
                          AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
                          DataKeyNames="ID" DataSourceID="SqlDataSourceDeliveryReceipt" Font-Names="Verdana" 
                          Font-Size="11px" ForeColor="#333333" GridLines="Horizontal" 
                          EnablePersistedSelection="True" 
                          onselectedindexchanged="gvDeliveryReceipts_SelectedIndexChanged" 
                  PageSize="14" onpageindexchanging="gvDeliveryReceipts_PageIndexChanging" 
                  EnableTheming="True" EnableViewState="False">
              <AlternatingRowStyle BackColor="White" />
              <Columns>
              <%-- <asp:TemplateField>
                  <EditItemTemplate>
                    <asp:CheckBox ID="CheckBox1" runat="server" />
                  </EditItemTemplate>
                  <ItemTemplate>
                    <asp:CheckBox ID="chkID" runat="server" ToolTip='<%# Eval("ID") %>'  />
                  </ItemTemplate>
                  <HeaderStyle Wrap="False" />
                  <ItemStyle Font-Bold="True" ForeColor="#CC6600" HorizontalAlign="Center" 
                             Wrap="False" />
                </asp:TemplateField>--%>
                  <asp:TemplateField>
                      <EditItemTemplate>
                          <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                      </EditItemTemplate>
                      <ItemTemplate>
                          <asp:Image ID="imgMemo" runat="server" Height="16px" 
                              ImageUrl="~/Resources/panels.png" AlternateText ='<%# Eval("ID") %>' />
                      </ItemTemplate>
                  </asp:TemplateField>
                  <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" 
                                ReadOnly="True" SortExpression="ID" Visible="False">
                </asp:BoundField>
                <asp:BoundField DataField="MemoNo" HeaderText="MEMO #" 
                      SortExpression="MemoNo">
                  <HeaderStyle Wrap="False" />
                  <ItemStyle Wrap="False" />
                </asp:BoundField>
                <asp:BoundField DataField="MemoDate" 
                                HeaderText="MEMO DATE" SortExpression="MemoDate" 
                      DataFormatString="{0:MMMM dd, yyyy}">
                  <HeaderStyle Wrap="False" />
                  <ItemStyle Wrap="False" />
                </asp:BoundField>
                <asp:BoundField DataField="BrandName" HeaderText="BRAND" 
                                SortExpression="BrandName">
                  <HeaderStyle Wrap="False" />
                  <ItemStyle Wrap="False" />
                </asp:BoundField>
                <asp:BoundField DataField="GrpNo" HeaderText="GROUP #" SortExpression="GrpNo">
                  <HeaderStyle Wrap="False" />
                  <ItemStyle Wrap="False" />
                </asp:BoundField>
                <asp:BoundField DataField="PriceType" HeaderText="PRICE TYPE" 
                                SortExpression="PriceType">
                  <HeaderStyle Wrap="False" />
                  <ItemStyle Wrap="False" />
                </asp:BoundField>
                <asp:BoundField DataField="FromDate" HeaderText="DATE FROM" 
                                SortExpression="FromDate" DataFormatString="{0:MMMM dd, yyyy}">
                  <HeaderStyle Wrap="False" />
                  <ItemStyle Wrap="False" />
                </asp:BoundField>
                <asp:BoundField DataField="ToDate" HeaderText="DATE TO" 
                                SortExpression="ToDate" DataFormatString="{0:MMMM dd, yyyy}">
                  <HeaderStyle Wrap="False" />
                  <ItemStyle Wrap="False" />
                </asp:BoundField>
                <asp:BoundField DataField="Status" 
                                HeaderText="STATUS" SortExpression="Status">
                  <HeaderStyle Wrap="False" />
                  <ItemStyle Wrap="False" />
                </asp:BoundField>
              </Columns>
              <EditRowStyle BackColor="#7C6F57" />
              <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
              <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
              <PagerSettings PageButtonCount="20" FirstPageImageUrl="~/Resources/first.png" 
                    LastPageImageUrl="~/Resources/last.png" Mode="NumericFirstLast" />
              <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Left" 
                    Font-Bold="True" Font-Names="Verdana" Font-Size="10px" />
              <RowStyle BackColor="#E3EAEB" />
              <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
              <SortedAscendingCellStyle  CssClass="asc_cell_style" />
              <SortedAscendingHeaderStyle BackColor="#246B61" />
              <SortedDescendingCellStyle CssClass="desc_cell_style" />
              <SortedDescendingHeaderStyle BackColor="#15524A" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSourceDeliveryReceipt" runat="server" 
                               ConnectionString="<%$ ConnectionStrings:IRMSConnectionString %>" 
                  SelectCommand="SELECT [ID], [MemoNo], [MemoDate], [BrandName], [GrpNo], [PriceType], [FromDate], [ToDate], [Status] 
                  FROM [GenMemo] WHERE ([Status] = @Status) ORDER BY [MemoDate] DESC " >
                <SelectParameters>
                    <asp:Parameter DefaultValue="Pending" Name="Status" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>

          </asp:Panel>
        </div>
        
        <div style ="float: left; width:500px; border-right:1px Solid Gray;">
        
          <div style ="margin-left:5px;">
           <div class ="titleList"> 
          <asp:Image ID="Image1" runat="server" Height="16px" Width ="20px"
                     ImageUrl="~/Resources/panels.png" ImageAlign="AbsBottom" />
               <asp:Label ID="lblCustomer" runat="server" Text="Label" Font-Names="Verdana" 
                   Font-Size="9px"></asp:Label>&nbsp;&nbsp;
                    <asp:Label ID="lblMemoNumber" runat="server" Text="Label" Font-Names="Verdana" 
                   Font-Size="9px"></asp:Label>
        </div>
            <asp:Panel ID ="pnlDRDetails" runat ="server" ScrollBars ="Auto" >
              <asp:GridView ID="gvDRDetails" runat="server" CellPadding="4" ForeColor="#333333" 
                            GridLines="None" Font-Names="Verdana" Font-Size="9px" 
                            AutoGenerateColumns="False" AllowPaging="True" AllowSorting="True" 
                    DataKeyNames="ID" DataSourceID="SqlDataSourceMemoDetails" 
                    PageSize="12" EmptyDataText="EMPTY DATA!!!">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                  <Columns>
                    <asp:TemplateField>
                        <EditItemTemplate>
                            <asp:CheckBox ID="chkDetailsRecordNumber" runat="server" />
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:CheckBox ID="chkDetailsRecordNumber" runat="server" ToolTip ='<%# Eval("ID") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                      <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" 
                          ReadOnly="True" SortExpression="ID" Visible="False" />
                      <asp:BoundField DataField="MemoNo" HeaderText="MEMO #" 
                          SortExpression="MemoNo" >
                      <HeaderStyle Wrap="False" />
                      <ItemStyle Wrap="False" />
                      </asp:BoundField>
                      <asp:BoundField DataField="StyleNo" HeaderText="STYLE #" 
                          SortExpression="StyleNo" >
                      <HeaderStyle Wrap="False" />
                      <ItemStyle Wrap="False" />
                      </asp:BoundField>
                      <asp:BoundField DataField="BrandName" HeaderText="BRAND" 
                          SortExpression="BrandName" Visible="False" >
                      <HeaderStyle Wrap="False" />
                      <ItemStyle Wrap="False" />
                      </asp:BoundField>
                      <asp:BoundField DataField="StyleDesc" HeaderText="STYLE DESC." 
                          SortExpression="StyleDesc" >
                      <HeaderStyle Wrap="False" />
                      <ItemStyle Wrap="False" />
                      </asp:BoundField>
                      <asp:BoundField DataField="MDPrice" HeaderText="MD PRICE" 
                          SortExpression="MDPrice" >
                      <HeaderStyle Wrap="False" />
                      <ItemStyle Wrap="False" />
                      </asp:BoundField>
                      <asp:BoundField DataField="CurrPrice" HeaderText="CURR PRICE" 
                          SortExpression="CurrPrice" DataFormatString="{0:###,###.00}" >
                      <HeaderStyle Wrap="False" />
                      <ItemStyle Wrap="False" />
                      </asp:BoundField>
                      <asp:BoundField DataField="Price1" HeaderText="PRICE 50" 
                          SortExpression="Price1" DataFormatString="{0:###,###.00}" >
                      <HeaderStyle Wrap="False" />
                      <ItemStyle Wrap="False" />
                      </asp:BoundField>
                      <asp:BoundField DataField="Price2" HeaderText="PRICE 70" 
                          SortExpression="Price2" DataFormatString="{0:###,###.00}" >
                      <HeaderStyle Wrap="False" />
                      <ItemStyle Wrap="False" />
                      </asp:BoundField>
                      <asp:BoundField DataField="Price3" HeaderText="PRICE 95" 
                          SortExpression="Price3" DataFormatString="{0:###,###.00}" >
                      <HeaderStyle Wrap="False" />
                      <ItemStyle Wrap="False" />
                      </asp:BoundField>
                      <asp:BoundField DataField="Price4" HeaderText="PRICE 00" 
                          SortExpression="Price4" DataFormatString="{0:###,###.00}" >
                      <HeaderStyle Wrap="False" />
                      <ItemStyle Wrap="False" />
                      </asp:BoundField>
                      <asp:BoundField DataField="Price5" HeaderText="PRICE 00 SPECIAL" 
                          SortExpression="Price5" DataFormatString="{0:###,###.00}" >
                      <HeaderStyle Wrap="False" />
                      <ItemStyle Wrap="False" />
                      </asp:BoundField>
                      <asp:BoundField DataField="Price6" HeaderText="PRICE 97" 
                          SortExpression="Price6" DataFormatString="{0:###,###.00}" >
                      <HeaderStyle Wrap="False" />
                      <ItemStyle Wrap="False" />
                      </asp:BoundField>
                      <asp:BoundField DataField="Price7" HeaderText="PRICE COMP" 
                          SortExpression="Price7" DataFormatString="{0:###,###.00}" >
                      <HeaderStyle Wrap="False" />
                      <ItemStyle Wrap="False" />
                      </asp:BoundField>
                  </Columns>
                  <EmptyDataTemplate>
                  <div style="text-align:center;  padding:5px 0px; ">
                             <img src="../Resources/unhappy.png" alt="WALA!!" align="middle" />
                             DATA NOT FOUND!!!
                        </div>
                  </EmptyDataTemplate>
                <EditRowStyle BackColor="#999999" />
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Left" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
              </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSourceMemoDetails" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:IRMSConnectionString %>" 
                    SelectCommand="SELECT [ID], [MemoNo], [StyleNo], [BrandName], [StyleDesc], [MDPrice], [CurrPrice], [Price1], [Price2], [Price3], [Price4], [Price5], [Price6], [Price7] FROM [GenMemoDtl] WHERE ([GenMemoID] = @GenMemoID)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="hfMemoRecordNumber" Name="GenMemoID" 
                            PropertyName="Value" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </asp:Panel>
          </div>
            <div style="height:30px; margin-top:5px;" class="modalDrag">
            <table>
                 <tr>
                <td colspan ="4">
                 <asp:Label ID="Label1" runat="server"></asp:Label>
         
          <asp:ModalPopupExtender ID="btnPreviewSelectedDRForcancel_ModalPopupExtender" 
                                  runat="server" DynamicServicePath="" Enabled="True" 
                                  TargetControlID="Label1" 
                                  PopupControlID="pnlSelectedDRPreview" 
                                  PopupDragHandleControlID="pnlSelectedDRPreviewDrag" 
                                  BackgroundCssClass="bgModal" 
                                  CancelControlID="imgBtnClosepnlSelectedDRPreview" >
          </asp:ModalPopupExtender>
                  <div style ="float:left; height:20px; margin-right:5px;">
          <asp:Button ID="btnDeleteMarkDownMemo" runat="server" CssClass="btnDelete" Height="28px"
                  onclick="btnDeleteMarkDownMemo_Click" Font-Names="Verdana" Font-Size="10px" ToolTip="Delete Selected Item/s"  />   
          <asp:RoundedCornersExtender ID="btnDeleteMarkDownMemo_RoundedCornersExtender" 
                                      runat="server" Enabled="True" 
                                      TargetControlID="btnDeleteMarkDownMemo" BorderColor="LightGray">
          </asp:RoundedCornersExtender>
         </div>
         <div style ="float:left; height:32px; ">
            <asp:UpdateProgress ID="upDeliveryReceiptsSlip" runat="server" 
        AssociatedUpdatePanelID="upnlDeliveryReceipts" DisplayAfter="500">
        <ProgressTemplate >
        <asp:PlaceHolder ID ="plHldrLoader" runat ="server" >
            <UC:LOADER ID ="ommLoader" runat ="server" />
        </asp:PlaceHolder>
        </ProgressTemplate>
    </asp:UpdateProgress>
          <asp:HiddenField ID="hfMemoRecordNumber" runat="server" />
         </div> 
                </td>
                <td >
                    <asp:Label ID="Label4" runat="server" Text="SET PAGE DISPLAY SIZE: " 
                        Font-Names="Verdana" Font-Size="11px" ForeColor="#FFFFCC"></asp:Label>
                    <asp:DropDownList ID="dlPageSize" runat="server" Height="22px" 
                        AutoPostBack="True" Font-Bold="True" Font-Italic="True" Font-Names="Verdana" 
                        Font-Size="11px" ForeColor="#993300" 
                        onselectedindexchanged="dlPageSize_SelectedIndexChanged" ToolTip="Set Display Page Size">
                        <asp:ListItem>DEFAULT</asp:ListItem>
                        <asp:ListItem>20</asp:ListItem>
                        <asp:ListItem>50</asp:ListItem>
                        <asp:ListItem>100</asp:ListItem>
                        <asp:ListItem>500</asp:ListItem>
                        <asp:ListItem>1000</asp:ListItem>
                        <asp:ListItem>ALL</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            </table>
          </div>
        </div>
        <asp:Panel ID="pnlSelectedDRPreview" runat ="server" CssClass ="modal" Width ="450px" >
          <asp:Panel ID= "pnlSelectedDRPreviewDrag" runat = "server" CssClass ="modalDrag" >
            <div class ="close_btn">
              <asp:ImageButton ID="imgBtnClosepnlSelectedDRPreview" runat="server" 
                               CssClass ="btnClose" ImageUrl="~/Resources/cancel_gray.png" ToolTip="CLOSE"/>
            </div> 
            <div class ="sizeLogo">
              <asp:Image ID="imgUpdateLogo" runat="server" Height="16px" ImageAlign="AbsBottom" 
                         ImageUrl="~/Resources/panels.png" />
              Preview of Item/s to be deleted.
            </div>
          </asp:Panel>
          <div style="text-align:center;">
            <asp:Label ID="Label6" runat="server" Text="UNCHECK TO EXCLUDE" 
                Font-Bold="False" Font-Italic="True" Font-Names="Verdana" Font-Size="10px" 
                ForeColor="#FFCC66"></asp:Label>
                </div>
                <div style ="margin-left:20px;">
          <asp:GridView ID="gvPreviewSelectedDR" runat="server" AutoGenerateColumns="False" 
                        Font-Names="Verdana" Font-Size="10px" ForeColor="#FFFFCC">
            <Columns>
              <asp:BoundField DataField="StyleNumber" HeaderText="STYLE NUMBER" />
              <asp:BoundField DataField="StyleDescription" HeaderText="DESCRIPTION" />
                <asp:BoundField DataField="MDPrice" HeaderText="MD PRICE" />
                <asp:BoundField DataField="CurrentPrice" DataFormatString="{0:###,###.00}" 
                    HeaderText="CURR PRICE" />
                <asp:TemplateField>
                    <EditItemTemplate>
                        <asp:CheckBox ID="CheckBox1" runat="server" />
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:CheckBox ID="chkSelectedDRTCancelled" runat="server" Checked ="true" ToolTip='<%# Eval("RecordNumber") %>' />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
          </asp:GridView>
          </div>
          <div style ="margin-left: 150px; margin-top:5px; margin-bottom:5px;">
            <asp:Button ID="btnContinueMarkDownDelete" runat="server" Text="CONTINUE DELETE" 
                  CssClass ="modalWarningButtonYes" Width ="140px" Font-Names="Verdana" 
                  Font-Size="10px" onclick="btnContinueMarkDownDelete_Click" />
            <asp:RoundedCornersExtender ID="btnContinueMarkDownDelete_RoundedCornersExtender" 
                                        runat="server" Enabled="True" 
                  TargetControlID="btnContinueMarkDownDelete" BorderColor="#5B761A">
            </asp:RoundedCornersExtender>
          </div>
        </asp:Panel>
          <asp:DropShadowExtender ID="pnlSelectedDRPreview_DropShadowExtender" 
              runat="server" Enabled="True" Opacity="0.75" 
              TargetControlID="pnlSelectedDRPreview">
          </asp:DropShadowExtender>
      </div>
        
     <%-- <asp:Panel ID ="pnlPrintOptionModal" runat ="server" CssClass ="modal" Width ="450px" >
        <asp:Panel ID ="pnlPrintOptionModalDrag" runat ="server" CssClass ="modalDrag" >
        <div class ="close_btn">
              <asp:ImageButton ID="ibtnClosepnlPrintOptionModal" runat="server" 
                               CssClass ="btnClose" ImageUrl="~/Resources/cancel_gray.png" ToolTip="CLOSE"/>
            </div>
            <div class ="sizeLogo">
              <asp:Image ID="Image5" runat="server" Height="16px" ImageAlign="AbsBottom" 
                         ImageUrl="~/Resources/panels.png" />
              Delivery Receipt Print Option.
            </div>
            
        </asp:Panel>
          <asp:TabContainer ID="TabContainer1" runat="server" ActiveTabIndex="0">
              <asp:TabPanel ID="tabPnlInTransit" runat="server" HeaderText="IN TRANSIT">
                 <ContentTemplate >
                 <div style ="text-align:center; height:20px;">
                     <asp:Button ID="btnPrintAllInTransit" runat="server" Text="PRINT ALL INTRANSIT" 
                         CssClass ="btnPrint" Font-Names="Verdana" Font-Size="11px" Width="170px" />
                     <asp:RoundedCornersExtender ID="btnPrintAllInTransit_RoundedCornersExtender" 
                         runat="server" BorderColor="YellowGreen" Enabled="True" 
                         TargetControlID="btnPrintAllInTransit">
                     </asp:RoundedCornersExtender>
                     </div>
                     <hr />
                     <asp:Label ID="Label7" runat="server" Text="Generate Report by Range" 
                         Font-Italic="True" Font-Names="Verdana" Font-Size="11px"></asp:Label>
                         <br />
                     <asp:Label ID="Label8" runat="server" Text="FROM"></asp:Label>
                     <asp:TextBox ID="txtIntransitFrom" runat="server" Font-Names="Verdana" 
                         Font-Size="11px" ForeColor="#003366"></asp:TextBox>
                     <asp:CalendarExtender ID="txtIntransitFrom_CalendarExtender" runat="server" 
                         Enabled="True" TargetControlID="txtIntransitFrom" Format="MMMM dd, yyyy">
                     </asp:CalendarExtender>
                     <asp:Label ID="Label9" runat="server" Text="TO"></asp:Label>
                     <asp:TextBox ID="txtIntransitTo" runat="server" Font-Names="Verdana" 
                         Font-Size="11px" ForeColor="#003366"></asp:TextBox>
                     <asp:CalendarExtender ID="txtIntransitTo_CalendarExtender" runat="server" 
                         Enabled="True" TargetControlID="txtIntransitTo" Format="MMMM dd, yyyy">
                     </asp:CalendarExtender>
                     <br />
                     <div style ="text-align:center;height:20px; margin-bottom:10px; ">
                     <asp:Button ID="btnPrintInTransitByRange" runat="server" Text="PRINT IN-TRANSIT" 
                      CssClass ="btnPrint" Font-Names="Verdana" Font-Size="11px" Width="150px" />
                         <asp:RoundedCornersExtender ID="btnPrintInTransitByRange_RoundedCornersExtender" 
                             runat="server" BorderColor="YellowGreen" Enabled="True" 
                             TargetControlID="btnPrintInTransitByRange">
                         </asp:RoundedCornersExtender>
                     </div>
                 </ContentTemplate>
              </asp:TabPanel>
                <asp:TabPanel ID="tabPnlConfirmed" runat="server" HeaderText="CONFIRMED">
                 <ContentTemplate >
                 <div style ="text-align:center; height:20px;">
                     <asp:Button ID="btnPrintAllDRConfirmed" runat="server" Text="PRINT ALL CONFIRMED DR" 
                         CssClass ="btnPrint" Font-Names="Verdana" Font-Size="11px" Width="195px" />
                     <asp:RoundedCornersExtender ID="btnPrintAllDRConfirmed_RoundedCornersExtender" 
                         runat="server" BorderColor="YellowGreen" Enabled="True" 
                         TargetControlID="btnPrintAllDRConfirmed">
                     </asp:RoundedCornersExtender>
                     </div>
                     <hr />
                     <asp:Label ID="Label10" runat="server" Text="Generate Report by Range" 
                         Font-Italic="True" Font-Names="Verdana" Font-Size="11px"></asp:Label>
                         <br />
                     <asp:Label ID="Label11" runat="server" Text="FROM"></asp:Label>
                     <asp:TextBox ID="txtDRConfirmedFrom" runat="server" Font-Names="Verdana" 
                         Font-Size="11px" ForeColor="#003366"></asp:TextBox>
                     <asp:CalendarExtender ID="txtDRConfirmedFrom_CalendarExtender" runat="server" 
                         Enabled="True" TargetControlID="txtDRConfirmedFrom" Format="MMMM dd, yyyy">
                     </asp:CalendarExtender>
                     <asp:Label ID="Label12" runat="server" Text="TO"></asp:Label>
                     <asp:TextBox ID="txtDRConfirmedTo" runat="server" Font-Names="Verdana" 
                         Font-Size="11px" ForeColor="#003366"></asp:TextBox>
                     <asp:CalendarExtender ID="txtDRConfirmedTo_CalendarExtender" runat="server" 
                         Enabled="True" TargetControlID="txtDRConfirmedTo" Format="MMMM dd, yyyy">
                     </asp:CalendarExtender>
                     <br />
                     <div style ="text-align:center;height:20px; margin-bottom:10px; ">
                     <asp:Button ID="btnPrintDRConfirmedByRange" runat="server" Text="PRINT CONFIRMED DR" 
                      CssClass ="btnPrint" Font-Names="Verdana" Font-Size="11px" Width="170px" />
                         <asp:RoundedCornersExtender ID="btnPrintDRConfirmedByRange_RoundedCornersExtender" 
                             runat="server" BorderColor="YellowGreen" Enabled="True" 
                             TargetControlID="btnPrintDRConfirmedByRange">
                         </asp:RoundedCornersExtender>
                     </div>
                 </ContentTemplate>
              </asp:TabPanel>
          </asp:TabContainer>
      </asp:Panel>  --%>

      <asp:HiddenField ID="hfIsAdvanceSearch" runat="server" />
     
    </ContentTemplate>
  </asp:UpdatePanel>
 
</asp:Content>