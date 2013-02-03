<%@ Page Title="" Language="C#" MasterPageFile="~/Marketing/Marketing.Master" AutoEventWireup="true"
    CodeBehind="OutletManagementPanel.aspx.cs" Inherits="IntegratedResourceManagementSystem.Christine.OutletManagementPanel" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="HeadContent" ContentPlaceHolderID="head" runat="server">
    <link href="../Styles/marketing-item-master.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
    .btn 
    {
        font-family:Verdana ;
        font-weight :bold;
        font-size: 11px;
        height : 25px;
        text-align :right;
       background-image:url(../Resources/panels.png), -webkit-gradient(linear, left top, left bottom, from(#c9c9c9), to(#848484), color-stop(0.6, #a1a1a1));
        background-image :url(../Resources/panels.png), -moz-linear-gradient(top, #c9c9c9, #848484, #a1a1a1 90%);
        background-repeat:no-repeat;
        background-position:left;
        color:#FCFCFC;
         padding-left:18px;    
        cursor:pointer;
    }
    .btn:hover
    {
          background-repeat :no-repeat;
          background-position:left;
          background-color: #C9C9C9;
          color:#FFFFCC;
    }
    .btnback 
    {
        font-family:Verdana ;
        font-weight :bold;
        font-size: 11px;
        height : 25px;
        text-align :right;
       background-image:url(../Resources/reply.png), -webkit-gradient(linear, left top, left bottom, from(#c9c9c9), to(#848484), color-stop(0.6, #a1a1a1));
        background-image :url(../Resources/reply.png), -moz-linear-gradient(top, #c9c9c9, #848484, #a1a1a1 90%);
        background-repeat:no-repeat;
        background-position:left;
        color:#FCFCFC;
         padding-left:18px;    
        cursor:pointer;
    }
    .btnback:hover
    {
          background-repeat :no-repeat;
          background-position:left;
          background-color: #C9C9C9;
          color:#FFFFCC;
    }
         .contact_terms 
    {
        background-image: -webkit-gradient(linear, left top, left bottom, from(#c9c9c9), to(#848484), color-stop(0.6, #a1a1a1));
        background-image : -moz-linear-gradient(top, #c9c9c9, #848484, #a1a1a1 90%);
        cursor :move;
        border:thin Solid gray;
        -moz-border-radius: 4px; 
        -webkit-border-radius: 4px;
         padding: 2px 5px;
    }
        .formtitle
        {
            font-size:13px;
            font-weight: bold;
            font-family: Arial, Helvetica, sans-serif;
        }
        .titleList
        {
            /*09301212163*/
            background-color: #C9C9C9;
            background-image: -webkit-gradient(linear, left top, left bottom, from(#c9c9c9), to(#848484), color-stop(0.6, #a1a1a1));
            background-image: -moz-linear-gradient(top, #c9c9c9, #848484, #a1a1a1 90%);
            height: 20px;
            width: 580px;
            color: White;
        }
        .style20
        {
        }
        .style21
        {
            width: 179px;
        }
        .style31
        {
            width: 233px;
        }
        .style33
        {
            width: 368px;
        }
        .style34
        {
            width: 242px;
        }
        .style36
        {
            width: 99px;
        }
        .style38
        {
            width: 111px;
        }
        .style39
        {
            width: 49px;
        }
        .style40
        {
            width: 101px;
        }
        .style41
        {
            width: 359px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<asp:UpdatePanel ID="upnlOutletManagement" runat="server">
    <ContentTemplate>
      <div style="float: left; width:450px; margin-right:3px; height:500px;">
        <div>
            <div class="modalDrag" style=" font-size:11px; color: #536006; text-shadow: 1px 1px 1px #FCFFAD;font-family: Verdana; margin-bottom:1px;">
                <asp:Label ID="Label1" runat="server" Text="OUTLET INFORMATION" 
                     Font-Bold="True"></asp:Label>
            </div>
            <asp:Panel ID="Panel1" runat="server" CssClass="modal" Height="400px" 
                ForeColor="#FF9933">
                <table style="width: 100%;" cellpadding="0">
                    <asp:Panel ID="pnlcombo" runat="server">
                        <tr>
                            <td class="modalLabel">
                                ACCOUNT NAME:
                            </td>
                            <td class="style33">
                                <asp:DropDownList ID="dlAccounts" CssClass="modalText" runat="server" AutoPostBack="true" Height="22px"
                                    OnSelectedIndexChanged="dlAccounts_SelectedIndexChanged" TabIndex="1" Width="287px">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td class="modalLabel">
                                BRANCH:
                            </td>
                            <td class="style33">
                                <asp:DropDownList ID="dlBranch" CssClass="modalText" runat="server" AutoPostBack="true" Height="22px"
                                    OnSelectedIndexChanged="dlObject_SelectedIndexChanged" TabIndex="2" Width="287px">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td class="modalLabel">
                                BRAND:
                            </td>
                            <td class="style33">
                                <asp:DropDownList ID="dlBrand" runat="server" CssClass="modalText" AutoPostBack="true" Height="22px" OnSelectedIndexChanged="dlObject_SelectedIndexChanged"
                                    TabIndex="3" Width="287px">
                                </asp:DropDownList>
                            </td>
                        </tr>
                    </asp:Panel>
                    <asp:Panel ID="pnltext" runat="server">
                        <tr>
                            <td class="style31">
                                ACCOUNT NAME:
                            </td>
                            <td class="style33">
                                <asp:TextBox ID="txtAccountName" runat="server" ReadOnly="True" Height="22px" Width="280px"
                                   CssClass="modalText">
                                </asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="style31">
                                BRANCH:
                            </td>
                            <td class="style33">
                                <asp:TextBox ID="txtBranchName" runat="server" ReadOnly="True" Height="22px" Width="280px"
                                    CssClass="modalText">
                                </asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="style31">
                                BRAND:
                            </td>
                            <td class="style33">
                                <asp:TextBox ID="txtBrandName" runat="server" ReadOnly="True" Height="22px" Width="280px"
                                   CssClass="modalText">
                                </asp:TextBox>
                            </td>
                        </tr>
                    </asp:Panel>
                    <tr>
                        <td class="modalLabel">
                            CUSTOMER CODE:
                        </td>
                        <td class="style33">
                            <asp:TextBox ID="txtCustomerCode" runat="server" CssClass="modalText"
                                Height="20px" ReadOnly="True" TabIndex="4" Width="280px" BackColor="#CCCCCC"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="modalLabel">
                            OUTLET NAME:
                        </td>
                        <td class="style33">
                            <asp:TextBox ID="txtOutletName" runat="server" CssClass="modalText"
                                Height="20px" ReadOnly="True" TabIndex="5" Width="280px" BackColor="#CCCCCC"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="modalLabel">
                            DATE START
                        </td>
                        <td class="style33">
                            <asp:TextBox ID="txtDateStart" runat="server" CssClass = "modalText"
                                Height="20px" TabIndex="7" Width="168px"></asp:TextBox>
                            <asp:CalendarExtender ID="calExt" runat="server" TargetControlID="txtDateStart">
                            </asp:CalendarExtender>
                        </td>
                    </tr>
                    <tr>
                        <td class="modalLabel">
                            UNDER COMPANY:
                        </td>
                        <td class="style33">
                            <asp:DropDownList ID="dlUnderCompany" CssClass="modalText" runat="server" Height="22px" TabIndex="8" Width="287px">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="modalLabel">
                            DEPARTMENT CODE:
                        </td>
                        <td class="style33">
                            <asp:TextBox ID="txtDepartmentCode" CssClass ="modalText" runat="server" Font-Names="Verdana" ForeColor="#333333"
                                Height="20px" TabIndex="4" Width="280px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="modalLabel">
                            AREA GROUP:
                        </td>
                        <td class="style33">
                            <asp:DropDownList ID="dlAreaGroup" runat="server" CssClass="modalText" AutoPostBack="true" Height="22px"
                                OnSelectedIndexChanged="dlAreaGroup_SelectedIndexChanged" Style="margin-left: 0px"
                                TabIndex="14" Width="287px">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="modalLabel">
                            SUB-AREA GROUP:
                        </td>
                        <td class="style33">
                            <asp:DropDownList ID="dlSubAreaGroup" CssClass="modalText" runat="server" Height="22px" Style="margin-left: 0px"
                                TabIndex="15" Width="287px">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="modalLabel">
                            AREA COORDINATOR:
                        </td>
                        <td class="style33">
                            <asp:TextBox ID="txtAreaCoordinator" CssClass="modalText" runat="server" Font-Names="Verdana" ForeColor="#333333"
                                Height="20px" TabIndex="16" Width="276px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="modalLabel">
                            COLLECTION OFFICE/ADDRESS:
                        </td>
                        <td class="style33">
                            <asp:TextBox ID="txtCollectionAddress" CssClass="modalText" runat="server" Height="20px" TabIndex="11"
                                Width="277px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="modalLabel">
                            PRICE GROUP(REGULAR):
                        </td>
                        <td class="style33">
                            <asp:DropDownList ID="dlPriceGroupReg" CssClass="modalText" runat="server" Height="22px" Style="margin-left"
                                TabIndex="12" Width="180px">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="modalLabel">
                            PRICE GROUP(MARKDOWN):
                        </td>
                        <td class="style33">
                            <asp:DropDownList ID="dlPriceGroupMDown" CssClass="modalText" runat="server" Height="22px" Style="margin-left: 0px"
                                TabIndex="13" Width="180px">
                            </asp:DropDownList>
                        </td>
                    </tr>
                </table>
            </asp:Panel>
        </div>
    </div>
    <div style="float: left;width: 540px;" >
        <div class="modalDrag" style=" font-size:11px; color: #536006; text-shadow: 1px 1px 1px #FCFFAD;font-family: Verdana; margin-bottom:1px;"> 
         <asp:Label ID="Label2" runat="server" Text="CONTRACT TERMS" 
                    Font-Bold="True"></asp:Label>
            
        </div>
        <div class="modal">
            <asp:Panel ID="Panel2" runat="server" >
                <table style="width: 100%;">
                    <tr>
                        <td class="modalLabel">
                            CREDIT LIMIT:
                        </td>
                        <td class="style21">
                            <asp:TextBox ID="txtCreditLimit" runat="server" CssClass="modalText"
                                Height="20px" Style="text-align: right" TabIndex="17" Width="150px"></asp:TextBox>
                        </td>
                        <td class="modalLabel">
                            TERMS:
                        </td>
                        <td>
                            <asp:TextBox ID="txtTerms" CssClass="modalText" runat="server" Height="20px" TabIndex="11" Width="150px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="modalLabel">
                            UTILITIES FEE:
                        </td>
                        <td class="style21">
                            <asp:TextBox ID="txtUtilitiesFee" runat="server" CssClass="modalText"
                                Height="20px" Style="text-align: right" TabIndex="17" Width="150px"></asp:TextBox>
                        </td>
                        <td class="modalLabel">
                            STOCKROOM FEE:
                        </td>
                        <td>
                            <asp:TextBox ID="txtStockRoomFee" runat="server" CssClass="modalText"
                                Height="20px" Style="text-align: right" TabIndex="18" Width="150px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="modalLabel">
                            AMOUNT INSURED:
                        </td>
                        <td class="style21">
                            <asp:TextBox ID="txtAmountInsured" runat="server" CssClass="modalText"
                                Height="20px" Width="150px" Style="text-align: right" TabIndex="19"></asp:TextBox>
                        </td>
                        <td class="modalLabel">
                            ADDITIONAL:
                        </td>
                        <td>
                            <asp:TextBox ID="txtAdditional" runat="server" CssClass="modalText"
                                Height="20px" Width="150px" Style="text-align: right" TabIndex="27"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="style41">
                            &nbsp;
                        </td>
                        <td class="style21">
                            &nbsp;
                        </td>
                        <td colspan="2">
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td class="modalLabel">
                            SALES TYPE:
                        </td>
                        <td class="style21">
                            <asp:DropDownList ID="dlChargeType" CssClass="modalText" runat="server" Height="22px" Style="margin-left: 0px"
                                Width="145px" TabIndex="15">
                            </asp:DropDownList>
                        </td>
                        <td class="modalLabel">
                            FIELD TYPE:
                        </td>
                        <td>
                            <asp:DropDownList ID="dlFieldType" CssClass="modalText" runat="server" Height="22px" Style="margin-left: 0px"
                                Width="145px" TabIndex="15">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="modalLabel">
                            COMMISSION RATE:
                        </td>
                        <td class="style21">
                            <asp:DropDownList ID="dlRateValue" CssClass="modalText" runat="server" Height="22px" Style="margin-left: 0px"
                                Width="145px" TabIndex="15">
                            </asp:DropDownList>
                        </td>
                        <td colspan="2">
                            <asp:Button ID="btnInsert" runat="server" Height="25px" Text="Insert" Width="80px"
                                CssClass="clear" TabIndex="30" OnClick="btnInsert_Click" />
                            <asp:RoundedCornersExtender ID="btnInsert_RoundedCornersExtender" runat="server"
                                Enabled="True" TargetControlID="btnInsert">
                            </asp:RoundedCornersExtender>
                        </td>
                    </tr>
                    <tr>
                        <td class="style20" colspan="4">
                            <asp:GridView ID="gvCommissionRates" runat="server" AutoGenerateColumns="False" OnRowDeleting="gvCommissionRates_RowDeleting"
                                EnableSortingAndPagingCallbacks="True" ShowHeaderWhenEmpty="True" 
                                BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" 
                                CellPadding="4" Font-Names="Verdana" Font-Size="11px" ForeColor="Black" 
                                GridLines="Horizontal">
                                <Columns>
                                    <asp:CommandField ShowDeleteButton="True">
                                        <ItemStyle ForeColor="#00FFCC" />
                                    </asp:CommandField>
                                    <asp:BoundField DataField="CustomerCode" HeaderText="CUSTOMER CODE" Visible="False" />
                                    <asp:BoundField DataField="SalesType" HeaderText="SALES TYPE">
                                        <ItemStyle Width="100px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="FieldType" HeaderText="FIELD TYPE">
                                        <ItemStyle Width="100px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="FieldValue" HeaderText="COMMISSION RATE">
                                        <ItemStyle Width="150px" HorizontalAlign="Right" />
                                    </asp:BoundField>
                                </Columns>
                                <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                                <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                                <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                                <SortedAscendingCellStyle BackColor="#F7F7F7" />
                                <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                                <SortedDescendingCellStyle BackColor="#E5E5E5" />
                                <SortedDescendingHeaderStyle BackColor="#242121" />
                            </asp:GridView>
                        </td>
                    </tr>
                    <tr>
                        <td style="color: #FFFFCC; font-family: Verdana; font-size: 10px; text-align: right;">
                            LIQUIDATION STATUS:
                        </td>
                        <td class="style21">
                            <asp:RadioButtonList ID="rdioLiquidationStatus" runat="server" Font-Bold="True" Font-Names="Verdana"
                                Font-Size="11px" ForeColor="#33CCFF" RepeatDirection="Horizontal" TabIndex="28">
                                <asp:ListItem Value="1">YES</asp:ListItem>
                                <asp:ListItem Value="0">NO</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                        <td colspan="2">
                            &nbsp;
                        </td>
                    </tr>
                </table>
            </asp:Panel>
        </div>
    </div>
       </ContentTemplate>
</asp:UpdatePanel>
    <div style="float:left; display:block; height:30px; width:530px; margin-top:5px;" class="modalDrag">

        <table>
            <tr>
                <td>
                    <asp:Button ID="btnSave" runat="server"  Text="SAVE" ToolTip="Save Customer Info/Contract"
                      CssClass="btnSave" TabIndex="29" OnClick="btnSave_Click" />
                </td>
                <td >
                    <asp:Button ID="btnClear" runat="server" Text="CLEAR"
                        CssClass="btn" TabIndex="30" ToolTip="Clear text fields" OnClick="btnClear_Click" />
                    <asp:RoundedCornersExtender ID="btnClear_RoundedCornersExtender" runat="server" Enabled="True"
                        TargetControlID="btnClear" BorderColor="LightGray" >
                    </asp:RoundedCornersExtender>
                </td>
                <td >
                    <asp:Button ID="btnBack" runat="server" Text="BACK" ToolTip="Back to previous page"
                        TabIndex="31" OnClick="btnClose_Click" CssClass="btnback" />
                    <asp:RoundedCornersExtender ID="btnBack_RoundedCornersExtender" runat="server" Enabled="True"
                        TargetControlID="btnBack" BorderColor="LightGray">
                    </asp:RoundedCornersExtender>
                </td>
                <td class="style21">
                    &nbsp;
                </td>
                <td class="style39">
                    &nbsp;
                </td>
            </tr>
        </table>
    </div>

</asp:Content>
