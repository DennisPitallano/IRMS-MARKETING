<%@ Page Title="" Language="C#" MasterPageFile="~/Marketing/Marketing.Master" AutoEventWireup="true" CodeBehind="PulloutRequest.aspx.cs" Inherits="IntegratedResourceManagementSystem.Marketing.PulloutRequest" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<%@ PreviousPageType VirtualPath ="~/Marketing/RequestPanel.aspx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../Styles/marketing-item-master.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .btnUpdate
        {
            font-family:Verdana;
            font-weight :bold;
            font-size: 11px;
            text-align :right;
            background-image :  url('../Resources/edit_gray.png'), -moz-linear-gradient(top, #c9c9c9, #848484, #a1a1a1 90%);
            background-repeat:no-repeat;
            background-position:left;
            color:#FCFCFC;
            padding-left:20px;
            cursor:pointer;
        }
        .btnUpdate:hover
         {
            margin-top:1px;
            background:url('../Resources/edit_normal.png'), -webkit-gradient(linear, left top, left bottom, from(#c9c9c9), to(#848484), color-stop(0.6, #a1a1a1));
            background-image :  url('../Resources/print_normal.png'), -moz-linear-gradient(top, #c9c9c9, #848484, #a1a1a1 90%);
            background-repeat:no-repeat;
            background-position:left;
            color:#FFFFCC;
         }
        .titleList
        {
            /*09301212163*/
            background-color: #C9C9C9;
            background-image: -webkit-gradient(linear, left top, left bottom, from(#c9c9c9), to(#848484), color-stop(0.6, #a1a1a1));
            background-image : -moz-linear-gradient(top, #c9c9c9, #848484, #a1a1a1 90%);
            height : 20px;
            width : 600px;
            color : White;
        }
        .style1
        {
            width: 100%;
        }
        .style2
        {
        }
        .style3
        {
            width: 111px;
            text-align: right;
        }
        .style4
        {
            width: 125px;
            text-align: right;
        }
        .style5
        {
            width: 295px;            
        }
        .btnOk
        {
             background:url('../Resources/ok.png');
            background-position:left;
            background-repeat:no-repeat;
            cursor:pointer;
            text-align:right;
        }
         .modalOutlets
        {
            background-color: #999999;
            border: 1px Solid Gray;
        }
        .modalOutletsDrag 
        {
            background-color: #C9C9C9;
            background-image: -moz-linear-gradient(top, #c9c9c9, #848484, #a1a1a1 90%);
            cursor :move;
        }
        .btnClose
        {}
        .btnCancel 
        {
            font-family:Verdana ;
            font-weight :bold;
            font-size: 11px;
            height : 25px;
            text-align :right;
            background-image:url('../Resources/cancel_gray.png'),-webkit-gradient(linear, left top, left bottom, from(#c9c9c9), to(#848484), color-stop(0.6, #a1a1a1));
             background-image :url('../Resources/cancel_gray.png'), -moz-linear-gradient(top, #c9c9c9, #848484, #a1a1a1 90%);
            background-repeat:no-repeat;
            background-position:left;
            color:#FCFCFC;
            width: 63px;
            cursor:pointer;
        }
        .btnCancel:hover
        {
            background-image:url('../Resources/cancel_normal.png'),-webkit-gradient(linear, left top, left bottom, from(#c9c9c9), to(#848484), color-stop(0.6, #a1a1a1));
            background-image :url('../Resources/cancel_normal.png'), -moz-linear-gradient(top, #c9c9c9, #848484, #a1a1a1 90%);
            background-repeat:no-repeat;
            background-position:left;
            color:#FFFFCC;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div>
        <asp:Image ID="imgpnlTitle" runat="server" ImageUrl="~/Resources/product_brand.png" 
                   ImageAlign="AbsMiddle" Height ="30px" /> &nbsp;<asp:Label 
            ID="Label1" runat="server" Text="PULL-OUT REQUEST FORM" Font-Bold="True" 
            Font-Names="Verdana" Font-Size="14px"></asp:Label>
        <hr />
    </div>

    <table>
        <tr>
            <td class="style3">
                ACCOUNT NAME:</td>
            <td class="style5">
                <asp:TextBox ID="txtAcct_Name" runat="server" Width="250px"></asp:TextBox>
            &nbsp;<asp:Button ID="btnBrowse" runat="server" Text="..." />
                <asp:ModalPopupExtender ID="btnBrowse_ModalPopupExtender" runat="server" 
                    BackgroundCssClass="bgModal" CancelControlID="imgBtnCloseOutlets" 
                    DynamicServicePath="" Enabled="True" PopupControlID="pnlOutlets" 
                    PopupDragHandleControlID="pnlOutletsDrag" TargetControlID="btnBrowse">
                </asp:ModalPopupExtender>
            </td>
            <td class="style4" style="text-align: right">
                PULL-OUT DATE:</td>
            <td>
                <asp:TextBox ID="txtPulloutDate" runat="server" AutoPostBack="True" 
                    ontextchanged="txtPulloutDate_TextChanged"></asp:TextBox>
                <asp:CalendarExtender ID="txtPulloutDate_CalendarExtender" runat="server" 
                  Enabled="True" TargetControlID="txtPulloutDate" Format="MMMM dd, yyyy">
              </asp:CalendarExtender>
            </td>
        </tr>
        <tr>
            <td class="style3">
                BRANCH NAME:</td>
            <td class="style5">
                <asp:TextBox ID="txtBranch_Name" runat="server" Width="250px"></asp:TextBox></td>
            <td class="style4">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style3">
                BRAND NAME:</td>
            <td class="style5">
                <asp:TextBox ID="txtBrandName" runat="server" Visible="true"></asp:TextBox>
                </td>
            <td class="style4">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2" colspan="4">
                <asp:TextBox ID="txtCustNo" runat="server" Visible="false" ></asp:TextBox>
                <asp:TextBox ID="txtDeptCode" runat="server" Visible="false"></asp:TextBox>
                <asp:TextBox ID="txtTransDate" runat="server" Visible="false"></asp:TextBox>
                <asp:TextBox ID="txtRecordNo" runat="server" Visible="false"></asp:TextBox>
                <asp:TextBox ID="txtBrandCode" runat="server" Visible="false"></asp:TextBox>
                <asp:TextBox ID="txtCustomer" runat="server" Width="250px" Visible="false"></asp:TextBox>
                <asp:TextBox ID="txtForwarder" runat="server" Width="250px" Visible="false"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style3">
                &nbsp;</td>
            <td class="style5">
                <asp:Label ID="Label4" runat="server" 
                    Text="Note: Kindly check the checkbox for LOST TAGS!!" ForeColor="#006600"></asp:Label></td>
            <td class="style4">
                BOX NO.:</td>
            <td>
                <asp:TextBox ID="txtBoxNo" runat="server">1</asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style3">
                STYLE NO:</td>
            <td class="style5">
                <asp:TextBox ID="txtStyleno" runat="server" ReadOnly="true"></asp:TextBox>
            &nbsp;<asp:Button ID="btnStyleBrowse" runat="server" Text="..." />
                <asp:ModalPopupExtender ID="btnStyleBrowse_ModalPopupExtender" runat="server" 
                    BackgroundCssClass="bgModal" CancelControlID="imgBtnCloseStyle" 
                    DynamicServicePath="" Enabled="True" PopupControlID="StyleListPanel" 
                    PopupDragHandleControlID="pnlStyleDrag" TargetControlID="btnStyleBrowse">
                </asp:ModalPopupExtender>
                <asp:CheckBox ID="chkLostTag" runat="server" Text="Lost Tag" Font-Size="14px" 
                    ForeColor="Red" AutoPostBack="True" 
                    oncheckedchanged="chkLostTag_CheckedChanged" />
            </td>
            <td class="style4">
                DESCRIPTION:</td>
            <td>
                <asp:RadioButtonList ID="rblDescription" runat="server" RepeatDirection="Horizontal" Visible = "false">
                    <asp:ListItem Selected="True">TOPS</asp:ListItem>
                    <asp:ListItem>BOTTOMS</asp:ListItem>
                </asp:RadioButtonList>
                <asp:TextBox ID="txtDescription" runat="server" ReadOnly="true"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style3">
                QUANTITY:</td>
            <td class="style5">
                <asp:TextBox ID="txtQuantity" runat="server"></asp:TextBox>
            </td>
            <td class="style4">
                SRP:</td>
            <td>
                <asp:TextBox ID="txtSRP" runat="server" ReadOnly="true"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style3">
                &nbsp;</td>
            <td class="style5">
                <asp:Button ID="btnAddRecord" runat="server" Text="ADD ITEMS" CssClass ="btnNew" 
                    Font-Names="Verdana" TabIndex="2" Font-Size="12px" 
                    Width="102px" onclick="btnAddRecord_Click" Height="24px" />
                        
                <asp:RoundedCornersExtender ID="btnAddRecord_RoundedCornersExtender" 
                    runat="server" Enabled="True" TargetControlID="btnAddRecord" Radius="3" BorderColor="DarkGray">
                </asp:RoundedCornersExtender>
                
                <%--<asp:Button ID="btnDelete" runat="server" Text="DELETE" CssClass ="btnDelete" 
                        Font-Names="Verdana"  />
                <asp:ModalPopupExtender ID="btnDelete_ModalPopupExtender" runat="server" 
                                        CancelControlID="btnNo" DynamicServicePath="" Enabled="True" 
                                        PopupControlID="pnlDeleteModal" PopupDragHandleControlID="pnlDeleteModalDrag" 
                                        TargetControlID="btnDelete" BackgroundCssClass="bgModal">
                </asp:ModalPopupExtender>
                <asp:RoundedCornersExtender ID="btnDelete_RoundedCornersExtender" 
                                            runat="server" Enabled="True" 
                                            TargetControlID="btnDelete" Radius="3" BorderColor="YellowGreen">
                </asp:RoundedCornersExtender>--%>
            </td>
            <td class="style4">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        
    </table>
    <br/>
    <div style="width:750px">
        <asp:Panel ID ="pnlError" runat ="server" Visible ="false">
            <div style ="text-align:center; background-color:#FFFFCC; border:1px Solid #FFCC66; height :30px;" >
                <asp:Image ID="Image1" runat="server" ImageUrl="~/Resources/warning.png" 
                    ImageAlign="AbsMiddle" Height="30px" Width="30px" /> <asp:Label ID="lblError" runat="server" 
                    Text="" Font-Bold="True" Font-Names="Verdana" 
                    Font-Size="12px" ForeColor="#CC6600"/>
            </div>
            <br/>
        </asp:Panel>
    </div>

        <hr />
        <br/>
        <div class="listcontent">
            <div class ="titleList">
                    <asp:Image ID="imgList" runat="server" Height="16px" Width ="20px"
                        ImageUrl="~/Resources/category.png" ImageAlign="AbsBottom" />
                LIST OF REQUEST ITEMS</div>

            <asp:GridView ID="gvPODetailList" runat="server" CellPadding="4" ForeColor="#333333" 
                GridLines="None" AutoGenerateColumns="False" Font-Names="Verdana" 
                Font-Size="11px" DataKeyNames="BoxNo,StyleNo"
                EnablePersistedSelection="True" OnRowDeleting="gvPODetailList_RowDeleting">
                  <AlternatingRowStyle BackColor="White" />
                  <Columns>
                    <asp:TemplateField>
                      <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                      </EditItemTemplate>
                      <ItemTemplate>
                          <%--<asp:CheckBox ID="chkRequestItems" runat="server" />--%>
                      </ItemTemplate>
                    </asp:TemplateField>
                    <%--<asp:CommandField ShowSelectButton="True" />--%>
                    <asp:CommandField ShowDeleteButton="True"/>
                    <asp:BoundField DataField="RecordNo" HeaderText="RECORD #" Visible="false">
                      <HeaderStyle Wrap="False" />
                      <ItemStyle Wrap="False" />
                    </asp:BoundField>
                    <asp:BoundField DataField="BoxNo" HeaderText="BOX NO" SortExpression="BoxNo" >
                      <HeaderStyle Wrap="False" Width="15px" />
                      <ItemStyle Wrap="False"  />
                    </asp:BoundField>
                    <asp:BoundField DataField="StyleNo" HeaderText="STYLE NUMBER" SortExpression="StyleNo">
                      <HeaderStyle Wrap="False" Width="60px"/>
                      <ItemStyle Wrap="False" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Description" HeaderText="DESCRIPTION" SortExpression="Description" >
                      <HeaderStyle Wrap="False" Width="150px"/>
                      <ItemStyle Wrap="False" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Quantity" HeaderText="QTY">
                      <HeaderStyle Wrap="False" Width="25px"/>
                      <ItemStyle Wrap="False" />
                    </asp:BoundField>
                    <asp:BoundField DataField="SRP" HeaderText="SRP" DataFormatString="{0:Php 0.00}">
                      <HeaderStyle Wrap="False" Width="55px"/>
                      <ItemStyle Wrap="False" />
                    </asp:BoundField>
                    <asp:BoundField DataField="TtlAmount" HeaderText="TOTAL AMOUNT" 
                          DataFormatString="{0:Php 0.00}">
                      <HeaderStyle Wrap="False" Width="75px"/>
                      <ItemStyle Wrap="False" />
                    </asp:BoundField>
                  </Columns>
                  <EditRowStyle BackColor="#7C6F57" />
                  <EmptyDataTemplate>
                    EMPTY DATA!!!
                  </EmptyDataTemplate>
                  <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                  <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                  <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                  <RowStyle BackColor="#E3EAEB" />
                  <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="False" ForeColor="#333333" 
                                    Font-Names="Verdana" Font-Size="11px" Font-Italic="True" />
                  <SortedAscendingCellStyle BackColor="#F8FAFA" />
                  <SortedAscendingHeaderStyle BackColor="#246B61" />
                  <SortedDescendingCellStyle BackColor="#D4DFE1" />
                  <SortedDescendingHeaderStyle BackColor="#15524A" />
                </asp:GridView>
                
            </div>
            <br/>
            <asp:Button ID="btnSaveRequest" runat="server" 
                        Text="SAVE" CssClass ="btnSave" 
                        ToolTip="Save New Request" Height="27px"  onclick="btnSaveRequest_Click"/>
            <asp:RoundedCornersExtender ID="btnSaveRequest_RoundedCornersExtender" 
                                        runat="server" Enabled="True" BorderColor="DarkGray"
                TargetControlID="btnSaveRequest">
            </asp:RoundedCornersExtender>
            <asp:Button ID="btnUpdateRequest" runat="server" 
                        Text="UPDATE" CssClass ="btnUpdate" 
                        ToolTip="Update Request" Height="27px"  onclick="btnUpdateRequest_Click"/>
            <asp:RoundedCornersExtender ID="btnUpdateRequest_RoundedCornersExtender" 
                                        runat="server" Enabled="True" BorderColor="DarkGray"
                TargetControlID="btnUpdateRequest">
            </asp:RoundedCornersExtender>
            &nbsp
            <asp:Button ID="btnCancelRequest" runat="server" CssClass="btnCancel" 
                Height="27px" Text="CANCEL REQUEST" PostBackUrl="~/Marketing/RequestPanel.aspx"
                ToolTip="Cancel Request" Width="133px" />
            <asp:RoundedCornersExtender ID="btnCancelRequest_RoundedCornersExtender" runat="server" 
                Enabled="True" TargetControlID="btnCancelRequest">
            </asp:RoundedCornersExtender>

            
            

    <asp:Panel ID ="pnlOutlets" runat ="server" CssClass ="modalOutlets" 
        Width="565px">
      <asp:Panel ID= "pnlOutletsDrag" runat ="server" CssClass ="modalOutletsDrag" 
            Width="565px" >
        <div class ="close_btn">
                    <asp:ImageButton ID="imgBtnCloseOutlets" runat="server" 
                                     CssClass ="btnClose" ImageUrl="~/Resources/cancel_gray.png" 
                        ToolTip="CLOSE"/>
                  </div> 
                  <div class ="sizeLogo">
                    <asp:Image ID="Image3" runat="server" Height="16px" ImageAlign="AbsBottom" 
                               ImageUrl="~/Resources/usermode.png" />
                    OUTLETS LIST
                  </div>
      </asp:Panel>
      <div style ="margin-left:5px; height:24px; width: 558px;">
            
          <div style ="float:right; margin-right:3px;">
          <asp:Label ID="Label2" runat="server" Text="FILTER:" Font-Names="Verdana" 
              Font-Size="11px" ForeColor="#FFFFCC"></asp:Label>
              <asp:TextBox ID="txtSearchOutlet" runat="server" Font-Names="Verdana" 
                  Font-Size="10px"></asp:TextBox>
              <asp:ImageButton ID="imgBtnSearchOutlet" runat="server" 
                  ImageUrl="~/Resources/search.png" ImageAlign="AbsMiddle" 
                  onclick="imgBtnSearchOutlet_Click" ToolTip="SEARCH" />
          </div>
      </div>
    
        <asp:Panel ID ="outlets_container" runat ="server" ScrollBars="Auto" >
            <asp:GridView ID="gvOutlets" runat="server" BackColor="White" 
                BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" 
                Font-Names="Verdana" Font-Size="11px" 
                ForeColor="Black" GridLines="Horizontal" AllowPaging="True" 
                AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="CustNo" 
                DataSourceID="SqlDataSourceCustomers" 
                  onselectedindexchanged="gvOutlets_SelectedIndexChanged" 
                  EnablePersistedSelection="True" 
                  onpageindexchanged="gvOutlets_PageIndexChanged" 
                  onsorted="gvOutlets_Sorted" onpageindexchanging="gvOutlets_PageIndexChanging">
                <Columns>
                    <asp:TemplateField>
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Image ID="imgOutlet" runat="server" Height="16px" 
                                ImageUrl="~/Resources/invoice.png" AlternateText='<%# Eval("CustNo").ToString() %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:CommandField ShowSelectButton="True" />
                    <asp:BoundField DataField="Acct_Name" HeaderText="ACCOUNT NAME" 
                        SortExpression="Acct_Name">
                    <HeaderStyle Wrap="False" />
                    <ItemStyle Wrap="False" />
                    </asp:BoundField>
                    <%--<asp:BoundField DataField="Branch_Name" HeaderText="BRANCH NAME" 
                        SortExpression="Branch_Name">
                    <HeaderStyle Wrap="False" />
                    <ItemStyle Wrap="False" />
                    </asp:BoundField>--%>
                    <asp:BoundField DataField="brand" HeaderText="BRAND NAME" 
                        SortExpression="brand">
                    <HeaderStyle Wrap="False" />
                    <ItemStyle Wrap="False" />
                    </asp:BoundField>
                    <asp:BoundField DataField="DEPT_Code" HeaderText="DEPT. CODE" 
                        SortExpression="CustCode">
                    <HeaderStyle Wrap="False" />
                    <ItemStyle Wrap="False" />
                    </asp:BoundField>
                    <asp:BoundField DataField="BRAND_CODE" HeaderText="BRAND CODE" SortExpression="BRAND_CODE">
                    <HeaderStyle Wrap="False" />
                    <ItemStyle Wrap="False" />
                    </asp:BoundField>
                    <asp:BoundField DataField="CustNo" HeaderText="CUSTOMER NO." 
                        SortExpression="CustNo">
                    <HeaderStyle Wrap="False" />
                    <ItemStyle Wrap="False" />
                    </asp:BoundField>
                    <asp:BoundField DataField="CompName" HeaderText="COMPANY NAME" SortExpression="CompName">
                        <HeaderStyle Wrap="False" />
                        <ItemStyle Wrap="False" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Forwarder_Name" HeaderText="FORWARDER" SortExpression="Forwarder_Name">
                        <HeaderStyle Wrap="False" />
                        <ItemStyle Wrap="False" />
                    </asp:BoundField>
                </Columns>
                <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                <PagerSettings FirstPageImageUrl="~/Resources/first.png" 
                    LastPageImageUrl="~/Resources/last.png" Mode="NumericFirstLast" />
                <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Left" />
                <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F7F7F7" />
                <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                <SortedDescendingCellStyle BackColor="#E5E5E5" />
                <SortedDescendingHeaderStyle BackColor="#242121" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSourceCustomers" runat="server" 
                ConnectionString="<%$ ConnectionStrings:IRMSConnectionString %>" 
                SelectCommand="SELECT [Acct_Name], [Branch_Name], a.[brand], [BRAND_CODE], [CustNo], [CompName], [Forwarder_Name] FROM [CustInfoEx] a INNER JOIN [FORWARDER_CUSTOMERS] b ON a.custno=b.customer_no INNER JOIN [FORWARDERS] c ON c.record_number=b.forwarder_no INNER JOIN [CUSTOMER_REF_TBL] d ON a.custcode=d.custcode INNER JOIN [BRANCH_TBL] e ON d.branch_code=e.branch_code INNER JOIN [ACCOUNT_TBL] f ON d.acct_code=f.acct_code">
            </asp:SqlDataSource>
        </asp:Panel>
        <div style ="text-align :center; margin:3px 0px 3px 0px;">
            <asp:Button ID="btnSelectOutlet" runat="server" Text="OK" CssClass ="btnOk"
                onclick="btnSelectOutlet_Click" BackColor="#CCCCCC" Font-Names="Verdana" 
                Font-Size="11px" ForeColor="#FFFFCC" Height="24px" Width="50px" />
            <asp:RoundedCornersExtender ID="btnSelectOutlet_RoundedCornersExtender" 
                runat="server" BorderColor="YellowGreen" Enabled="True" 
                TargetControlID="btnSelectOutlet">
            </asp:RoundedCornersExtender>
        </div>
    </asp:Panel>
    
    <br/>

    <asp:Panel ID ="StyleListPanel" runat ="server" CssClass ="modalOutlets" 
        Width="482px">
        <asp:Panel ID= "pnlStyleDrag" runat ="server" CssClass ="modalOutletsDrag" 
            Width="482px" >
            <div class ="close_btn">
                    <asp:ImageButton ID="imgBtnCloseStyle" runat="server" 
                                     CssClass ="btnClose" ImageUrl="~/Resources/cancel_gray.png" 
                        ToolTip="CLOSE" Width="16px"/>
            </div> 
            <div class ="sizeLogo">
            <asp:Image ID="Image2" runat="server" Height="16px" ImageAlign="AbsBottom" 
                        ImageUrl="~/Resources/usermode.png" />
                STYLE LIST
            </div>
        </asp:Panel>
        <div style ="margin-left:5px; height:24px; width: 482px;">
            
            <div style ="float:right; margin-right:3px;">
                <asp:Label ID="Label3" runat="server" Text="FILTER:" Font-Names="Verdana" 
                        Font-Size="11px" ForeColor="#FFFFCC"></asp:Label>
                <asp:TextBox ID="txtSearchStyle" runat="server" Font-Names="Verdana" 
                        Font-Size="10px" AutoPostBack="True" 
                    ontextchanged="txtSearchStyle_TextChanged" ></asp:TextBox>
                <asp:ImageButton ID="imgBtnSearchStyle" runat="server" Height="18px" 
                        ImageUrl="~/Resources/search.png" ImageAlign="AbsMiddle" 
                        onclick="imgBtnSearchStyle_Click" ToolTip="SEARCH" />
            </div>
        </div>
    
        <asp:Panel ID ="StylePanel" runat ="server" ScrollBars="Auto" >
            <asp:GridView ID="gvStyleList" runat="server" BackColor="White" 
                BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" 
                Font-Names="Verdana" Font-Size="11px" 
                ForeColor="Black" GridLines="Horizontal" AllowPaging="True" 
                AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="StyleNo" 
                DataSourceID="SqlDataSourceStyle" 
                onselectedindexchanged="gvStyleList_SelectedIndexChanged" 
                EnablePersistedSelection="True" 
                onpageindexchanged="gvStyleList_PageIndexChanged" 
                onsorted="gvStyleList_Sorted" onpageindexchanging="gvStyleList_PageIndexChanging">
                <Columns>
                    <asp:TemplateField>
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Image ID="imgStyle" runat="server" Height="16px" 
                                ImageUrl="~/Resources/invoice.png" AlternateText='<%# Eval("StyleNo").ToString() %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:CommandField ShowSelectButton="True" />
                    <asp:BoundField DataField="StyleNo" HeaderText="STYLE NO." 
                        SortExpression="StyleNo">
                        <HeaderStyle Wrap="False" />
                        <ItemStyle Wrap="False" />
                    </asp:BoundField>
                    <asp:BoundField DataField="StyleDesc" HeaderText="STYLE DESCRIPTION" >
                        <HeaderStyle Wrap="False" />
                        <ItemStyle Wrap="False" />
                    </asp:BoundField>
                    <asp:BoundField DataField="BrandName" HeaderText="BRAND NAME" >
                        <HeaderStyle Wrap="False" />
                        <ItemStyle Wrap="False" />
                    </asp:BoundField>
                    <asp:BoundField DataField="AP_Type" HeaderText="TOPS / BOTTOMS" >
                        <HeaderStyle Wrap="False" />
                        <ItemStyle Wrap="False" />
                    </asp:BoundField>
                    <asp:BoundField DataField="BRAND_CODE" HeaderText="BRAND CODE" >
                        <HeaderStyle Wrap="False" />
                        <ItemStyle Wrap="False" />
                    </asp:BoundField>
                </Columns>
                <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                <PagerSettings FirstPageImageUrl="~/Resources/first.png" 
                    LastPageImageUrl="~/Resources/last.png" Mode="NumericFirstLast" />
                <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Left" />
                <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F7F7F7" />
                <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                <SortedDescendingCellStyle BackColor="#E5E5E5" />
                <SortedDescendingHeaderStyle BackColor="#242121" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSourceStyle" runat="server" 
                ConnectionString="<%$ ConnectionStrings:IRMSConnectionString %>" 
                SelectCommand="SELECT [StyleNo], [BrandName], [StyleDesc], [AP_Type], [BRAND_CODE] FROM [Style] a inner join [BRANDS] b on a.BrandName=b.BRAND_DESCRIPTION">
            </asp:SqlDataSource>
        </asp:Panel>
        <div style ="text-align :center; margin:3px 0px 3px 0px;">
            <asp:Button ID="btnSelectStyle" runat="server" Text="OK" CssClass ="btnOk"
                onclick="btnSelectStyle_Click" BackColor="#CCCCCC" Font-Names="Verdana" 
                Font-Size="11px" ForeColor="#FFFFCC" Height="24px" Width="50px" />
            <asp:RoundedCornersExtender ID="RoundedCornersExtender" 
                runat="server" BorderColor="YellowGreen" Enabled="True" 
                TargetControlID="btnSelectOutlet">
            </asp:RoundedCornersExtender>
        </div>
    </asp:Panel>
    <br/>

    <%--Delete Modal
    <asp:Panel ID ="pnlDeleteModal" runat ="server" CssClass ="deleteModal" >
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
        <div style ="margin-left:80px; margin-top: 12px;">
            <asp:Button ID="btnYes" runat="server" Text="YES" 
                CssClass ="modalWarningButtonYes" ToolTip="Delete" 
                onclick="btnYes_Click"  />

            <asp:RoundedCornersExtender ID="btnYes_RoundedCornersExtender" runat="server" 
                Enabled="True" TargetControlID="btnYes">
            </asp:RoundedCornersExtender>
            <asp:Button ID="btnNo" runat="server" Text="NO" 
                CssClass ="modalWarningButtonNo" ToolTip="Cancel" />
            <asp:RoundedCornersExtender ID="btnNo_RoundedCornersExtender" runat="server" 
                Enabled="True" TargetControlID="btnNo">
            </asp:RoundedCornersExtender>
        </div>
    </asp:Panel>--%>

</asp:Content>
