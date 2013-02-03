<%@ Page Title="" Language="C#" MasterPageFile="~/Marketing/Marketing.Master" AutoEventWireup="true" CodeBehind="CustomerOutletManagementPanel.aspx.cs" Inherits="IntegratedResourceManagementSystem.Marketing.CustomerOutletManagementPanel" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="HeadContent" ContentPlaceHolderID="head" runat="server">
  <link href="../Styles/marketing-item-master.css" rel="stylesheet" type="text/css" />
      <style type ="text/css">
    .titleList
     {
         /*09301212163*/
          background-color: #C9C9C9;
          background-image: -webkit-gradient(linear, left top, left bottom, from(#c9c9c9), to(#848484), color-stop(0.6, #a1a1a1));
        background-image : -moz-linear-gradient(top, #c9c9c9, #848484, #a1a1a1 90%);
        height : 20px;
        width : 580px;
        color : White;
     }
    .modalGarment
    {
        width : 350px;
        height :150px;
        background-color: #999999;
              margin-right: 0px;
          }
    .modalGarmentDrag 
    {
        background-color: #C9C9C9;
        background-image: -webkit-gradient(linear, left top, left bottom, from(#c9c9c9), to(#848484), color-stop(0.6, #a1a1a1));
        background-image : -moz-linear-gradient(top, #c9c9c9, #848484, #a1a1a1 90%);
        width: 350px;
        height : 25px;
        cursor :pointer;
    }
          .style1
          {
              width: 216px;
          }
          .style2
          {
              width: 200px;
          }
          .style3
          {
              width: 201px;
          }
          .style4
          {
              width: 195px;
          }
          .style5
          {
              width: 205px;
          }
          .style6
          {
              font-family : Verdana;
              font-size: 11px;
              text-align : right;
              color: #FFFFCC;
              width: 99px;
          }
          .style7
          {
              font-family : Verdana;
              font-size: 11px;
              text-align : right;
              color: #FFFFCC;
              width: 91px;
          }
          .style10
          {
              width: 101px;
          }
          .style11
          {
              font-family : Verdana;
              font-size: 11px;
              text-align : right;
              color: #FFFFCC;
              width: 101px;
          }
          .style12
          {
              font-family : Verdana;
              font-size: 11px;
              text-align : right;
              color: #FFFFCC;
              width: 233px;
          }
          .style13
          {
              font-family : Verdana;
              font-size: 11px;
              text-align : right;
              color: #FFFFCC;
              width: 217px;
          }
      </style>
</asp:Content>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <asp:UpdatePanel ID="upnlCustomer" runat ="server" >
        <ContentTemplate>
            <div style ="width: 100%; height :30px;">
                <div style ="float:right;">
                    <asp:TextBox ID="txtSearch" runat="server" 
                        ontextchanged="txtSearch_TextChanged"></asp:TextBox>
                    <asp:TextBoxWatermarkExtender ID="txtSearch_TextBoxWatermarkExtender" 
                                    runat="server" Enabled="True" TargetControlID="txtSearch" 
                                    WatermarkText="search" WatermarkCssClass="watermark">
                    </asp:TextBoxWatermarkExtender>
                    <asp:ImageButton ID="imgBtnSearch" runat="server" ImageAlign="AbsBottom" 
                       ImageUrl="~/Resources/search.png" ToolTip="SEARCH" />
                </div>
                <div style ="float:left; width: 367px;">
                    <div  style ="float:left; margin-right:5px;">
                        <asp:Button ID="btnNewCustomer" runat="server" Text="NEW" CssClass ="btnNew" 
                    Font-Names="Verdana" />
                        <asp:ModalPopupExtender ID="btnNewCustomer_ModalPopupExtender" runat="server" 
                                DynamicServicePath="" Enabled="True" PopupControlID="pnlNewCustomerModal" 
                                PopupDragHandleControlID="pnlNewCustomerModalDrag" 
                                TargetControlID="btnNewCustomer" BackgroundCssClass="bgModal" 
                                CancelControlID="imgBtnCloseNewSizeModal">
                        </asp:ModalPopupExtender>
                        <asp:RoundedCornersExtender ID="btnNewCustomer_RoundedCornersExtender" 
                                    runat="server" Enabled="True" 
                                    TargetControlID="btnNewCustomer" Radius="3" 
                            BorderColor="YellowGreen">
                        </asp:RoundedCornersExtender>
                    </div>
                    <div  style ="float:left; margin-right:5px;">
                        <asp:Button ID="btnUpdateCustomer" runat="server" Text="UPDATE" CssClass ="btnUpdate" 
                    Font-Names="Verdana"  />
                        <asp:ModalPopupExtender ID="btnUpdateCustomer_ModalPopupExtender" runat="server" 
                                CancelControlID="imgBtnCloseUpdateSizeModal" DynamicServicePath="" 
                                Enabled="True" PopupControlID="pnlUpdateCustomerModal" 
                                PopupDragHandleControlID="pnlUpdateCustomerModalDrag" 
                                TargetControlID="btnUpdateCustomer" BackgroundCssClass="bgModal">
                        </asp:ModalPopupExtender>
                        <asp:RoundedCornersExtender ID="btnUpdateCustomer_RoundedCornersExtender" 
                                    runat="server" Enabled="True" 
                                    TargetControlID="btnUpdateCustomer" Radius="3" 
                            BorderColor="YellowGreen">
                        </asp:RoundedCornersExtender>
                    </div>
                    <div  style ="float:left; margin-right:5px;">
                        <asp:Button ID="btnDelete" runat="server" Text="DELETE" CssClass ="btnDelete" 
                    Font-Names="Verdana"  />
                        <asp:ModalPopupExtender ID="btnDelete_ModalPopupExtender" runat="server" 
              CancelControlID="btnNo" DynamicServicePath="" Enabled="True" 
              PopupControlID="pnlDeleteModal" PopupDragHandleControlID="pnlDeleteModalDrag" 
              TargetControlID="btnDelete" BackgroundCssClass="bgModal">
                        </asp:ModalPopupExtender>
                        <asp:RoundedCornersExtender ID="btnDelete_RoundedCornersExtender" 
                                    runat="server" Enabled="True" 
                                    TargetControlID="btnDelete" Radius="3" BorderColor="YellowGreen">
                        </asp:RoundedCornersExtender>
                    </div>
                    <div  style ="float:left; margin-right:5px;">
                        <asp:Button ID="btnPrint" runat="server" Text="PRINT" CssClass ="btnPrint" 
                    Font-Names="Verdana"  />
                        <asp:RoundedCornersExtender ID="btnPrint_RoundedCornersExtender" 
                                    runat="server" Enabled="True" 
                                    TargetControlID="btnPrint" Radius="3" BorderColor="YellowGreen">
                        </asp:RoundedCornersExtender>
                    </div>
                </div>
            </div>
            <div class ="listContent" >
                <div class ="titleList">
                    <asp:Image ID="imgList" runat="server" Height="16px" Width ="20px"
               ImageUrl="~/Resources/product_brand.png" ImageAlign="AbsBottom" />
                    LIST OF CUSTOMER (OUTLET)</div>
                <asp:Panel ID ="pnlCustomerList" runat ="server" Width ="580px" Height ="213px" 
                    ScrollBars ="Auto"  >
                    <asp:GridView ID="gvCustomerList" runat="server" CellPadding="4" ForeColor="#333333" 
                    GridLines="None" AutoGenerateColumns="False" Font-Names="Verdana" 
                    Font-Size="11px" >
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:TemplateField>
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Image ID="Image1" runat="server" Height="16px" 
                         ImageUrl="~/Resources/product_brand.png" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:CommandField ShowSelectButton="True" />
                            <asp:BoundField DataField="RecordNo" HeaderText="RECORD #">
                            <HeaderStyle Wrap="False" />
                            <ItemStyle Wrap="False" />
                            </asp:BoundField>
                            <asp:BoundField DataField="AccountName" HeaderText="ACCOUNT NAME">
                            </asp:BoundField>
                            <asp:BoundField DataField="CustomerName" HeaderText="CUSTOMER NAME" />
                            <asp:BoundField DataField="DateStart" DataFormatString="{0:MM/dd/yyyy}" 
                                HeaderText="DATE START" />
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
                </asp:Panel>
            </div>
            <asp:Panel ID ="pnlNewCustomerModal" runat ="server" CssClass ="modalGarment" 
                Height="500px" Width="950px" >
                <asp:Panel ID ="pnlNewCustomerModalDrag" runat ="server" 
                    CssClass="modalGarmentDrag" Width="950px" >
                    <div class ="close_btn">
                        <asp:ImageButton ID="imgBtnCloseNewSizeModal" runat="server" 
                         CssClass ="btnClose" ImageUrl="~/Resources/cancel_gray.png" ToolTip="CLOSE"/>
                    </div>
                    <div class ="sizeLogo">
                        <asp:Image ID="imgAccountLogo" runat="server" Height="16px" ImageAlign="AbsBottom" 
                   ImageUrl="~/Resources/product_brand.png" />
                        NEW CUSTOMER</div>
                </asp:Panel>
                <table style="width: 100%; height: 120px;">
                    <tr>
                        <td class ="modalLabel">
                            ACCOUNT NAME:
                        </td>
                        <td>
                            <asp:DropDownList ID="dlAccounts" runat="server" Width="209px" Height="22px" 
                                AutoPostBack="true" 
                                onselectedindexchanged="dlAccounts_SelectedIndexChanged" TabIndex="1">
                            </asp:DropDownList>
                        </td>
                        <td class="style10">
          &nbsp;
                        </td>

                         <td class ="style12">
                             PGROUP(REG):
                         </td>
                         <td class="style1">
                             <asp:DropDownList ID="dlPriceGroupReg" runat="server" Height="22px" 
                                 style="margin-left" Width="154px" TabIndex="12">
                             </asp:DropDownList>
                         </td>
                         <td colspan="4">
                         &nbsp;
                         </td>
                    </tr>

                    <tr>
                        <td class ="modalLabel">BRANCH:</td>
                        <td class="style1">
                        <asp:DropDownList ID="dlBranch" runat="server" AutoPostBack="true" Height="22px" 
                                Width="209px" onselectedindexchanged="dlObject_SelectedIndexChanged" 
                                TabIndex="2" >
                        </asp:DropDownList></td>
                        <td class="style10">&nbsp;</td>

                        <td class ="style12">PGROUP(MDOWN):</td>
                        <td class="style1">
                        <asp:DropDownList ID="dlPriceGroupMDown" runat="server" Height="22px" 
                                style="margin-left: 0px" Width="154px" TabIndex="13">
                        </asp:DropDownList>
                        </td>
                    </tr>

                    <tr>
                    <td class ="modalLabel">BRAND:</td>
                    <td class="style1">
                    <asp:DropDownList ID="dlBrand" runat="server" Height="22px" Width="209px" 
                            AutoPostBack="true" onselectedindexchanged="dlObject_SelectedIndexChanged" 
                            TabIndex="3">
                    </asp:DropDownList>
                    </td>
                    
                    <td class="style10">&nbsp;</td>
                    <td class ="modalLabel">AREA GROUP:</td>
                    <td class="style1">
                    <asp:DropDownList ID="dlAreaGroup" runat="server" Height="22px" 
                            style="margin-left: 0px" Width="154px" TabIndex="14">
                    </asp:DropDownList>
                    </td>
                    </tr>

                    <tr>
                    <td class="modelLabel" colspan="3">&nbsp;</td>
                    <td class="style12">SUB-AREA GROUP:</td>
                    <td class="style1">
                    <asp:DropDownList ID="dlSubAreaGroup" runat="server" Height="22px" 
                            style="margin-left: 0px" Width="154px" TabIndex="15">
                    </asp:DropDownList>
                    </td>
                    </tr>

                    <tr>
                    <td class ="modalLabel">CUSTOMER CODE:</td>
                    <td class="style1">
                    <asp:TextBox ID="txtCustomerCode" runat="server" Height="22px" Font-Names="Verdana" 
                            ForeColor="#333333" Width="150px" TabIndex="4"></asp:TextBox>
                    </td>
                    <td class="style11">&nbsp;</td>
                    <td class ="style12">AREA COORD:</td>
                    <td class="style1">
                    <asp:TextBox ID="txtAreaCoordinator" runat="server" Height="22px" 
                            Font-Names="Verdana" ForeColor="#333333" Width="150px" TabIndex="16"></asp:TextBox>
                    </td>
                    </tr>

                    <tr>
                    <td class ="modalLabel">OUTLET NAME:</td>
                    <td class="style1">
                    <asp:TextBox ID="txtOutletName" runat="server" Font-Names="Verdana" 
                            ForeColor="#333333" Height="22px" ReadOnly="True" Width="198px" TabIndex="5"></asp:TextBox>
                    </td>
                    <td class="style10">&nbsp;</td>
                    <td style="font-weight: bold; text-decoration: underline;" align="left" colspan="2">
                    CONTRACT TERM</td>
                    </tr>

                    <tr>
                    <td class ="modalLabel">CUSTOMER GROUP:</td>
                    <td class="style1">
                    <asp:DropDownList ID="dlCustomerGroup" runat="server" Height="22px" Width="209px" 
                            TabIndex="6">
                    </asp:DropDownList>
                    </td>
                    <td class="style11">&nbsp;</td>
                    <td class="modalLabel">UTILITIES FEE:</td>
                    <td class="style1">
                    <asp:TextBox ID="txtUtilitiesFee" runat="server" Font-Names="Verdana" 
                            ForeColor="#333333" Height="22px" Width="150px" style="text-align:right" 
                            TabIndex="17"></asp:TextBox>
                    </td>
                    </tr>

                    <tr>
                        <td class ="modalLabel">
                            DATE START:
                        </td>
                        <td class="style1">
                            <asp:TextBox ID="txtDateStart" runat="server" Height="22px" 
                                Font-Names="Verdana" ForeColor="#333333" Width="200px" TabIndex="7"></asp:TextBox>
                            <asp:CalendarExtender ID="calExt" runat="server" TargetControlID="txtDateStart"></asp:CalendarExtender>
                        </td>
                        <td class="style11">&nbsp;</td>
                        <td class="modalLabel">STOCKROOM FEE:</td>
                        <td class="style1">
                        <asp:TextBox ID="txtStockRoomFee" runat="server" Font-Names="Verdana" 
                                ForeColor="#333333" Height="22px" Width="150px" style="text-align:right" 
                                TabIndex="18"></asp:TextBox>
                        </td>
                    </tr>




                    <tr>
                    <td class ="modalLabel">UNDER COMPANY:</td>
                    <td class="style1">
                    <asp:DropDownList ID="dlUnderCompany" runat="server" Height="22px" Width="209px" 
                            TabIndex="8">
                    </asp:DropDownList></td>
                    <td class="style11">&nbsp;</td>
                    <td class="modalLabel">AMT INSURED:</td>
                    <td class="style1">
                    <asp:TextBox ID="txtAmountInsured" runat="server" Font-Names="Verdana" 
                            ForeColor="#333333" Height="22px" Width="150px" style="text-align:right" 
                            TabIndex="19"></asp:TextBox></td>
                    </tr>

                    <tr>
                    <td class ="modalLabel">ARRANGEMENT TYPE:</td>
                    <td class="style1">
                    <asp:DropDownList ID="dlArrangeType" runat="server" Height="22px" Width="209px" 
                            TabIndex="9">
                    </asp:DropDownList></td>
                    <td class="style11">&nbsp;</td>

                    <td class="modalLabel">COMM. (REG):</td>
                    <td class="style1">
                    <asp:TextBox ID="txtCommisionRegular" runat="server" Font-Names="Verdana" 
                            ForeColor="#333333" Height="22px" Width="150px" style="text-align:right" 
                            TabIndex="20"></asp:TextBox></td>

                    <td class="style7">&lt; 50%</td>
                    <td class="style5">
                    <asp:TextBox ID="txtCommRegLessFifty" runat="server" Font-Names="Verdana" 
                            ForeColor="#333333" Height="22px" Width="54px" style="text-align:right" 
                            TabIndex="21"></asp:TextBox></td>
                    <td class="style6">&gt; 50%</td>
                    <td>
                    <asp:TextBox ID="txtCommRegAboveFifty" runat="server" Font-Names="Verdana" 
                            ForeColor="#333333" Height="22px" Width="58px" style="text-align:right" 
                            TabIndex="22"></asp:TextBox></td>
                    </tr>

                    <tr>
                    <td class ="modalLabel">CREDIT LIMIT:</td>
                    <td class="style1">
                    <asp:TextBox ID="txtCreditLimit" runat="server" Height="22px" Width="150px" 
                            style="text-align:right" TabIndex="10"></asp:TextBox></td>
                    <td class="style11">&nbsp;</td>
                    <td class="modalLabel">COMM. (MDOWN):</td>
                    <td class="style1">
                    <asp:TextBox ID="txtCommissionMarkdown" runat="server" Font-Names="Verdana" 
                            ForeColor="#333333" Height="22px" Width="150px" style="text-align:right" 
                            TabIndex="23"></asp:TextBox></td>
                    <td class="style7">&lt; 50%</td>
                    <td class="style5">
                    <asp:TextBox ID="txtCommMdownLessFifty" runat="server" Font-Names="Verdana" 
                            ForeColor="#333333" Height="22px" Width="54px" style="text-align:right" 
                            TabIndex="24"></asp:TextBox></td>
                    <td class="style6">&gt; 50%</td>
                    <td class="style1">
                    <asp:TextBox ID="txtCommMdownAboveFifty" runat="server" Font-Names="Verdana" 
                            ForeColor="#333333" Height="22px" Width="58px" style="text-align:right" 
                            TabIndex="25"></asp:TextBox></td>
                    </tr>

                    <tr>
                    <td class ="modalLabel">TERMS:</td>
                    <td class="style1">
                    <asp:TextBox ID="txtTerms" runat="server" Height="22px" Width="150px" TabIndex="11"></asp:TextBox></td>
                    <td class="style11">&nbsp;</td>
                    <td class="modalLabel">CHARGE:</td>
                    <td class="style1">
                    <asp:TextBox ID="txtCommCharge" runat="server" Font-Names="Verdana" 
                            ForeColor="#333333" Height="22px" Width="150px" style="text-align:right" 
                            TabIndex="26"></asp:TextBox></td>
                    </tr>

                    <tr>
                    <td class="modalLabel" colspan="3">&nbsp;</td>
                    <td class="modalLabel">ADDITIONAL:</td>
                    <td class="style1">
                    <asp:TextBox ID="txtCommAdditional" runat="server" Font-Names="Verdana" 
                            ForeColor="#333333" Height="22px" Width="150px" style="text-align:right" 
                            TabIndex="27"></asp:TextBox></td>
                    </tr>

                    <tr>
                    <td class="modalLabel" colspan="3">&nbsp;</td>
                    <td class="modalLabel">LIQUIDATION STATUS:</td>
                    <td class="style1">
                    <asp:RadioButtonList ID="rdioLiquidationStatus" runat="server" Font-Bold="True" 
                            Font-Names="Verdana" Font-Size="11px" ForeColor="#CCFFCC" 
                            RepeatDirection="Horizontal" TabIndex="28">
                        <asp:ListItem Value="1">YES</asp:ListItem>
                        <asp:ListItem Value="0">NO</asp:ListItem>
                    </asp:RadioButtonList></td>
                    </tr>

                    <tr>
                    <td class="style13">&nbsp;</td>
                    <td class="modalLabel">&nbsp;</td>
                    <td colspan="3">
                        <table>
                            <tr>
                                <td class="style2" align="center">
                                <asp:Button ID="btnSubmit" runat="server" Height="25px" Text="SUBMIT" 
                                        ToolTip="Submit" Width="80px" onclick="btnSubmit_Click" 
                                        CssClass="btnSave" TabIndex="29" />
                                <asp:RoundedCornersExtender ID="btnSubmit_RoundedCornersExtender" runat="server" Enabled="True" TargetControlID="btnSubmit">
                                </asp:RoundedCornersExtender></td>
                                <td align="center" class="style3">
                                <asp:Button ID="btnClear" runat="server" Height="25px" Text="CLEAR" Width="80px" 
                                        onclick="btnClear_Click" CssClass="clear" TabIndex="30" />
                                <asp:RoundedCornersExtender ID="btnClear_RoundedCornersExtender" runat="server" Enabled="True" TargetControlID="btnClear">
                                </asp:RoundedCornersExtender></td>
                                <td align="center" class="style4">
                                <asp:Button ID="btnClose" runat="server" Height="25px" Text="CLOSE" 
                                        ToolTip="Close form" Width="80px" CssClass="close_btn" TabIndex="31" />
                                <asp:RoundedCornersExtender ID="btnClose_RoundedCornersExtender" runat="server" Enabled="True" TargetControlID="btnClose">
                                </asp:RoundedCornersExtender></td>
                            </tr>
                        </table>
                    </td>
                    <td class="modalLabel" colspan="3">&nbsp;</td>
                    </tr>



                </table>
            </asp:Panel>
            <asp:RoundedCornersExtender ID="pnlNewCustomerModal_RoundedCornersExtender" 
                              runat="server" Enabled="True" 
                TargetControlID="pnlNewCustomerModal">
            </asp:RoundedCornersExtender>
            <asp:DropShadowExtender ID="pnlNewCustomerModal_DropShadowExtender" runat="server" 
                          Enabled="True" Opacity="0.5" Rounded="True" 
                TargetControlID="pnlNewCustomerModal">
            </asp:DropShadowExtender>
            <asp:Panel ID ="pnlUpdateCustomerModal" runat ="server" 
                CssClass ="modalGarment" >
                <asp:Panel ID ="pnlUpdateCustomerModalDrag" runat ="server" 
                    CssClass="modalGarmentDrag" >
                    <div class ="close_btn">
                        <asp:ImageButton ID="imgBtnCloseUpdateSizeModal" runat="server" 
                         CssClass ="btnClose" ImageUrl="~/Resources/cancel_gray.png" ToolTip="CLOSE"/>
                    </div>
                    <div class ="sizeLogo">
                        <asp:Image ID="imgUpdateLogo" runat="server" Height="16px" ImageAlign="AbsBottom" 
                   ImageUrl="~/Resources/product_brand.png" />
                        UPDATE ACCOUNT</div>
                </asp:Panel>
                <table style="width: 100%;">
                    <tr>
                        <td class ="modalLabel">
                            ACCOUNT CODE:
                        </td>
                        <td>
                            <asp:TextBox ID="txtAccountCodeUpdate" runat="server" Height="22px" Font-Names="Verdana" 
                       ForeColor="#333333" Width="160px"></asp:TextBox>
                        </td>
                        <td>
          &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td class ="modalLabel">
                            ACCOUNT NAME:
                        </td>
                        <td>
                            <asp:TextBox ID="txtAccountNameUpdate" runat="server" Height="22px" 
                                Font-Names="Verdana" ForeColor="#333333" Width="160px"></asp:TextBox>
                        </td>
                        <td>
          &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td>
          &nbsp;
                        </td>
                        <td>
                            <asp:Button ID="btnSaveUpdate" runat="server" Text="SAVE" CssClass ="btnSave" 
                      ToolTip="Update Color" />
                            <asp:RoundedCornersExtender ID="btnSaveUpdate_RoundedCornersExtender" 
                                      runat="server" Enabled="True" TargetControlID="btnSaveUpdate">
                            </asp:RoundedCornersExtender>
                        </td>
                        <td>
          &nbsp;
                        </td>
                    </tr>
                </table>
            </asp:Panel>
            <asp:RoundedCornersExtender ID="pnlUpdateCustomerModal_RoundedCornersExtender" 
                              runat="server" Enabled="True" 
                TargetControlID="pnlUpdateCustomerModal">
            </asp:RoundedCornersExtender>
            <asp:DropShadowExtender ID="pnlUpdateCustomerModal_DropShadowExtender" runat="server" 
                          Enabled="True" Opacity="0.5" Rounded="True" 
                TargetControlID="pnlUpdateCustomerModal">
            </asp:DropShadowExtender>
            <%--Delete Modal--%>
            <asp:Panel ID ="pnlDeleteModal" runat ="server" CssClass ="deleteModal" >
                <asp:Panel ID= "pnlDeleteModalDrag" runat ="server" CssClass ="modalDrag">
                    <div class ="sizeLogo">
                        <asp:Image ID="Image2" runat="server" Height="16px" ImageAlign="AbsBottom" 
                   ImageUrl="~/Resources/size.png" />
        CONFIRMATION!!!
                    </div>
                </asp:Panel>
                <div class ="modalWarningText">
      Are you sure you want to Delete this Data?
                </div>
                <div style ="margin-left:80px; margin-top: 12px;">
                    <asp:Button ID="btnYes" runat="server" Text="YES" 
                  CssClass ="modalWarningButtonYes" ToolTip="Delete" />
                    <asp:RoundedCornersExtender ID="btnYes_RoundedCornersExtender" runat="server" 
                                  Enabled="True" TargetControlID="btnYes">
                    </asp:RoundedCornersExtender>
                    <asp:Button ID="btnNo" runat="server" Text="NO" 
                  CssClass ="modalWarningButtonNo" ToolTip="Cancel"  />
                    <asp:RoundedCornersExtender ID="btnNo_RoundedCornersExtender" runat="server" 
                                  Enabled="True" TargetControlID="btnNo">
                    </asp:RoundedCornersExtender>
                </div>
            </asp:Panel>
            <asp:DropShadowExtender ID="pnlDeleteModal_DropShadowExtender" runat="server" 
                          Enabled="True" Opacity="0.5" Rounded="True" TargetControlID="pnlDeleteModal">
            </asp:DropShadowExtender>
            <asp:RoundedCornersExtender ID="pnlDeleteModal_RoundedCornersExtender" 
                              runat="server" Enabled="True" TargetControlID="pnlDeleteModal">
            </asp:RoundedCornersExtender>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
