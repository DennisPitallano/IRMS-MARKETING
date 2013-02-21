<%@ Page Title="" Language="C#" MasterPageFile="~/Marketing/Marketing.Master" AutoEventWireup="true"
    CodeBehind="NewItemForm.aspx.cs" Inherits="IntegratedResourceManagementSystem.Marketing.NewItemForm" %>

<%@ OutputCache CacheProfile="cached_profile" %>
<%@ PreviousPageType VirtualPath="~/Marketing/ProductManagementPanel.aspx" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Src="~/Marketing/controls/UCLoader.ascx" TagName="LOADER" TagPrefix="UC" %>
<asp:Content ID="HeadContent" ContentPlaceHolderID="head" runat="server">
    <link href="../Styles/marketing-item-master.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/pull-out-letter.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
     .txtwatermark
     {
         color: #CCCCCC;
         font-style:italic;
         text-align:right;
        font-family:Verdana;
        font-size:14px;
        height:22px;
            width:100px;
     }
        .barcode
        {
            width: 250px;
            margin-left: 5px;
        }
        .frmlbl
        {
            width: 150px;
            text-align: right;
            font-family: Verdana;
            color: #333;text-shadow: 1px 1px 0px white;
        }
        .colorBg
        {
            /*09301212163*/
            background-color: #C9C9C9;
            background-image: -webkit-gradient(linear, left top, left bottom, from(#c9c9c9), to(#848484), color-stop(0.6, #a1a1a1));
            background-image: -moz-linear-gradient(top, #c9c9c9, #848484, #a1a1a1 90%);
        }
        .modalGeneratedItemCodeAndSKus
        {
            width: 250px;
            background-color: #999999;
            padding-bottom: 5px;
        }
        .modalGeneratedItemCodeAndSKusDrag
        {
            background-color: #C9C9C9;
            background-image: -webkit-gradient(linear, left top, left bottom, from(#c9c9c9), to(#848484), color-stop(0.6, #a1a1a1));
            background-image: -moz-linear-gradient(top, #c9c9c9, #848484, #a1a1a1 90%);
            width: 250px;
            height: 20px;
        }
        .chkColor
        {
        }
        .txtMoney
        {
            text-align:right;
            font-family:Verdana;
            font-size:14px;
            height:22px;
             width:100px;
            color:#CC0000;
             font-weight:bold;
            
        }
    </style>
</asp:Content>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div>
        <asp:Image ID="imgItem" runat="server" Height="20px" ImageAlign="AbsBottom" ImageUrl="~/Resources/product.png" />
        &nbsp;<asp:Label ID="Label4" runat="server" Text="ITEM GENERATOR" Font-Bold="True"
            Font-Names="Verdana" Font-Size="12px" ForeColor="#CC6600"></asp:Label>
        &nbsp;
        <div style="float: right;">
            <asp:ImageButton ID="imgBtnBack" runat="server" ImageUrl="~/Resources/reply.png"
                PostBackUrl="~/Marketing/ProductManagementPanel.aspx" ToolTip="BACK" />
        </div>
        <hr />
    </div>
    <asp:UpdatePanel ID="upnlGenerate" runat="server">
        <ContentTemplate>
            <div style="text-align: center; margin-bottom: 5px;">
                <asp:UpdateProgress ID="uprogressGenerator" runat="server" AssociatedUpdatePanelID="upnlGenerate">
                    <ProgressTemplate>
                        <asp:PlaceHolder ID="plcHLoader" runat="server">
                            <UC:LOADER ID="loader" runat="server" />
                        </asp:PlaceHolder>
                    </ProgressTemplate>
                </asp:UpdateProgress>
            </div>
            <asp:MultiView ID="mvwItemManagement" runat="server">
                <asp:View ID="vStyleCreator" runat="server">
                <div class="titleForm" style="height:14px; width:753px;">
                    STYLE GENERATOR
                </div>
                    <div class="form" style="width:750px;">
                        <asp:Panel ID="pnlGenerateItemCodeSKU" runat="server" Width="790px">
                            <div>
                                <table style="width: 100%;">
                                    <tr>
                                        <td class="frmlbl">
                                            BRAND:
                                        </td>
                                        <td colspan="3">
                                            <asp:DropDownList ID="dlBrandsForStyleNumber" runat="server" AutoPostBack="True"
                                               Height="23px" OnSelectedIndexChanged="dlBrandsForStyleNumber_SelectedIndexChanged"
                                                Width="170px" CssClass="modalText" >
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            &nbsp;
                                        </td>
                                        <td>
                                           
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="frmlbl">
                                            CATEGORY:
                                        </td>
                                        <td colspan="3">
                                            <asp:RadioButtonList ID="rdioTopOrBottom" runat="server" RepeatDirection="Horizontal"
                                                AutoPostBack="True" Font-Bold="True"  CssClass="modalText"
                                                OnSelectedIndexChanged="rdioTopOrBottom_SelectedIndexChanged">
                                                <asp:ListItem Value="T">TOP</asp:ListItem>
                                                <asp:ListItem Value="B">BOTTOM</asp:ListItem>
                                            </asp:RadioButtonList>
                                        </td>
                                        <td>
                                            &nbsp;
                                        </td>
                                        <td rowspan="7" valign="top"> 
                                           <div style="background-color:#FFFFCC; border:1px Solid #FFCC66; padding:3px 3px; width:200px;
                                            -moz-border-radius:30px 40px 40px 2px; -webkit-border-radius:30px 40px 40px 2px; border-radius:30px 40px 40px 2px; ">
                                               <asp:Image ID="Image3" runat="server" ImageUrl="~/Resources/edit_normal.png" 
                                                   ImageAlign="AbsMiddle" />  
                                                <asp:Label ID="Label8" runat="server" Text="NOTE:" Font-Italic="True" 
                                                   Font-Names="Verdana"></asp:Label>
                                                   
                                            <br />
                                            <br />
                                               <asp:Label ID="Label3" runat="server" Text="SRP" Font-Bold="True" 
                                                   Font-Names="Verdana" ForeColor="#CC6600"></asp:Label>
                                               -Manual Input
                                                <br />
                                               <asp:Label ID="Label7" runat="server" Text="COST PRICE" Font-Bold="True" 
                                                   Font-Names="Verdana" ForeColor="#CC6600"></asp:Label>
                                               -Manual Input
                                           </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="frmlbl">
                                            FABRIC:
                                        </td>
                                        <td colspan="3">
                                            <asp:DropDownList ID="dlFabricsForStyleNumber" runat="server" AutoPostBack="True"
                                                 CssClass="modalText" Height="23px" OnSelectedIndexChanged="dlFabricsForStyleNumber_SelectedIndexChanged"
                                                Width="170px">
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            &nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="frmlbl">
                                            GARMENT:
                                        </td>
                                        <td colspan="3">
                                            <asp:DropDownList ID="dlGarmentForStyleNumber" runat="server" AutoPostBack="True"
                                                 Height="23px" OnSelectedIndexChanged="dlGarmentForStyleNumber_SelectedIndexChanged"
                                                 CssClass ="modalText">
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            &nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="frmlbl">
                                        FITTING:
                                        </td>
                                         <td>
                                             <asp:DropDownList ID="DDLFittings" CssClass="modalText" Height="20px" 
                                                 runat="server" AutoPostBack="True" 
                                                 onselectedindexchanged="DDLFittings_SelectedIndexChanged">
                                             </asp:DropDownList>
                                        </td>
                                         <td>
                                        
                                        </td>
                                         <td>
                                        
                                        </td>
                                    </tr>
                                    <tr>
                                    <td class="frmlbl">
                                        SUB-FITTING:
                                        </td>
                                         <td>
                                             <asp:DropDownList ID="DDLSubFitting" CssClass="modalText" Height="20px" runat="server">
                                             </asp:DropDownList>
                                        </td>
                                         <td>
                                        
                                        </td>
                                         <td>
                                        
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="frmlbl">
                                            <asp:Image ID="imgPreview" runat="server" ImageUrl="~/Resources/view.png" ImageAlign="AbsBottom" />
                                            PREVIEW OUTPUT
                                        </td>
                                        <td colspan="3">
                                            &nbsp;
                                        </td>
                                        <td>
                                            &nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="frmlbl">
                                            &nbsp;STYLE NUMBER:
                                        </td>
                                        <td colspan="3">
                                            <asp:TextBox ID="txtStyleNumber" runat="server" Width="250px" CssClass="modalText" ReadOnly="True" Font-Bold="True" 
                                                Height="22px"></asp:TextBox>
                                            <asp:Label ID="lblErrorSameStyleNumber" runat="server" Font-Names="Verdana" Font-Size="11px"
                                                ForeColor="#FF3300"></asp:Label>
                                        </td>
                                        <td>
                                            &nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="frmlbl">
                                            STYLE DESCRIPTION:
                                        </td>
                                        <td colspan="3">
                                            <asp:TextBox ID="txtStyleDescription" runat="server" Width="270px" CssClass="modalText" ReadOnly="True" Font-Bold="True" 
                                                Height="22px"></asp:TextBox>
                                           <%-- <asp:Button ID="btnViewGeneratedItemCodeAndSKUs" runat="server" Text="View Generated ItemCodes and SKU's"
                                                Font-Names="Verdana" Font-Size="10px" Visible="False" />
                                            <asp:PopupControlExtender ID="btnViewGeneratedItemCodeAndSKUs_PopupControlExtender"
                                                runat="server" DynamicServicePath="" Enabled="True" ExtenderControlID="" PopupControlID="pnlGenratedItemCodesAndSKUs"
                                                TargetControlID="btnViewGeneratedItemCodeAndSKUs" Position="Right">
                                            </asp:PopupControlExtender>--%>
                                        </td>
                                        <td>
                                            &nbsp;
                                        </td>
                                    </tr>
                                      <tr>
                                        <td class="frmlbl">
                                            COST PRICE:</td>
                                        <td style="width:100px;">
                                            <asp:TextBox ID="txtCostPrice" runat="server" placeholder="0.00" CssClass="txtMoney"></asp:TextBox>
                                        </td>
                                        <td class="frmlbl" style="width:50px;"> 
                                            SRP:</td>
                                        <td>
                                            <asp:TextBox ID="txtSRP" runat="server" placeholder="0.00"  CssClass="txtMoney"></asp:TextBox>
                                        </td>
                                        <td>
                                        </td>
                                        <td>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:HiddenField ID="hfStyleNumber" runat="server" />
                                            <asp:HiddenField ID="hfStartSeries" runat="server" />
                                        </td>
                                        <td colspan="3">
                                            &nbsp;
                                            <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
                                            <asp:ModalPopupExtender ID="Label1_ModalPopupExtender" runat="server" 
                                                DynamicServicePath="" Enabled="True" TargetControlID="Label1" PopupControlID="pnlErrorMessage"
                                                 PopupDragHandleControlID="pnlErrorMessageDrag" CancelControlID="btnOk">
                                            </asp:ModalPopupExtender>
                                            <asp:Panel ID="pnlErrorMessage" CssClass="modal" runat="server">
                                                <asp:Panel CssClass="modalDrag" ID="pnlErrorMessageDrag" runat="server">
                                                    <div class="sizeLogo">
                                                        WARNING!!!!
                                                    </div>
                                                </asp:Panel>
                                                <div style="min-width:200px; min-height:50px;">
                                                   <img src="../Resources/warning.png" alt="Warning" align="left"  />  
                                                   <asp:Label  Font-Size="12px" ID="lblErrorMessage"  
                                                        runat="server" ForeColor="#CC3300"></asp:Label>
                                                </div>
                                                <div style="text-align:center; margin:3px 3px;">
                                                    <asp:Button ID="btnOk" CssClass="modalWarningButtonYes" runat="server" Text="OK" />
                                                </div>
                                            </asp:Panel>
                                        </td>
                                        <td>
                                            &nbsp;
                                        </td>
                                        <td>
                                            <asp:Label ID="Label2" runat="server" Text="Label" Visible="False"></asp:Label>
                                            &nbsp;
                                        </td>
                                    </tr>
                                  
                                </table>
                            </div>
                        </asp:Panel>
                        <div>
                            <asp:Button ID="btnContinueForSKUGeneration" runat="server" CssClass="btnContinue"
                                Text="CONTINUE SKU GENERATION" OnClick="btnContinueForSKUGeneration_Click" Width="200px" />
                            <asp:Button ID="btnContinueSaveStyleAndExitGenerator" runat="server" Text="SAVE AND GENERATE SKU's LATER"
                                CssClass="btnSave" Width="233px" Font-Names="Verdana" Font-Size="11px" OnClick="btnContinueSaveStyleAndExitGenerator_Click" />
                        </div>
                    </div>
                   <%-- <asp:Panel ID="pnlGenratedItemCodesAndSKUs" runat="server" CssClass="modalGeneratedItemCodeAndSKus">
                        <asp:Panel ID="pnlGenratedItemCodesAndSKUsDrag" runat="server" CssClass="modalGeneratedItemCodeAndSKusDrag">
                            <div class="close_btn">
                            </div>
                            <div class="sizeLogo">
                                <asp:Image ID="Image1" runat="server" Height="16px" ImageAlign="Top" ImageUrl="~/Resources/Barcode.png" />
                                &nbsp;List of Generated Item Codes and SKU's
                            </div>
                        </asp:Panel>
                     <asp:GridView ID="gvGeneratedItemCodesAndSKUs" runat="server" AutoGenerateColumns="False"
                            Font-Names="Verdana" Font-Size="10px" ForeColor="#FFFFCC">
                            <Columns>
                                <asp:BoundField DataField="ItemCode" HeaderText="ITEM CODE">
                                    <HeaderStyle Wrap="False" />
                                    <ItemStyle Wrap="False" />
                                </asp:BoundField>
                                <asp:BoundField DataField="SKUBarcode" HeaderText="SKU CODE">
                                    <HeaderStyle Wrap="False" />
                                    <ItemStyle Wrap="False" />
                                </asp:BoundField>
                            </Columns>
                        </asp:GridView>
                    </asp:Panel>--%>
                </asp:View>
                <asp:View ID="vItemCodeAndSKUCreator" runat="server">
                    <div>
                        <div>
                            <asp:Image ID="imgItemAndSKU" runat="server" ImageAlign="Top" ImageUrl="~/Resources/panels.png" />
                            <asp:Label ID="Label5" runat="server" Text="ITEM AND SKU CODE GENERATOR" Font-Bold="True"
                                Font-Names="Verdana" Font-Size="12px" ForeColor="#CC6600"></asp:Label>
                        </div>
                        <table style="width: 100%;">
                            <tr>
                                <td class="frmlbl">
                                    STYLE NUMBER:
                                </td>
                                <td>
                                    <asp:TextBox ID="txtStyleNumberPreview" CssClass="modalText" runat="server" Width="250px"
                                        Font-Size="12px" ReadOnly="True"></asp:TextBox>
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td class="frmlbl">
                                    STYLE DESCRIPTION:
                                </td>
                                <td>
                                    <asp:TextBox ID="txtStyleDescriptionPreview" runat="server" Width="250px" CssClass="modalText"
                                        Font-Size="12px" ReadOnly="True"></asp:TextBox>
                                </td>
                                <td>
                                    &nbsp;
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
                                    &nbsp;
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div style="margin-bottom: 10px;">
                        <div style="margin-bottom: 5px;">
                            <asp:Image ID="imgColors" runat="server" Height="21px" ImageUrl="~/Resources/color.png"
                                ImageAlign="AbsBottom" />&nbsp;
                            <asp:Label ID="Label10" runat="server" Text="COLORS" Font-Italic="True" Font-Names="Verdana" 
                            Font-Overline="False" Font-Underline="False" ForeColor="#B05800"></asp:Label>
                        </div>
                        <asp:Panel ID="pnlColors" runat="server" Width="700px" ScrollBars="Auto">
                            <asp:CheckBoxList ID="ColorchkBxs" runat="server" Font-Names="Verdana" Font-Size="11px"
                                RepeatDirection="Horizontal" AutoPostBack="True" OnSelectedIndexChanged="ColorchkBxs_SelectedIndexChanged"
                                CssClass="chkColor" RepeatColumns="8" BackColor="#CCCCCC" BorderColor="#666666"
                                BorderWidth="1px">
                            </asp:CheckBoxList>
                        </asp:Panel>
                    </div>
                    <div style="margin-bottom: 10px;">
                        <div style="margin-bottom: 10px;">
                            <asp:Image ID="imgSizes" runat="server" ImageUrl="~/Resources/size.png" Height="20px"
                                ImageAlign="AbsBottom" />&nbsp;SIZES:&nbsp;&nbsp;
                            <asp:Label ID="Label6" runat="server" Text="FILTER BY SIZE GROUP:" Font-Names="Verdana"
                                Font-Size="11px" ForeColor="#996600"></asp:Label>
                            <asp:CheckBoxList ID="chkSizeGroup" runat="server" BackColor="#FFFFCC" BorderColor="#FFCC66"
                                BorderStyle="Solid" BorderWidth="1px" DataSourceID="SqlDataSourceGroupSize" DataTextField="SIZE_GROUP"
                                DataValueField="RECORD_NO" Font-Names="Verdana" Font-Size="10px" ForeColor="#336699"
                                RepeatDirection="Horizontal" RepeatLayout="Flow" AutoPostBack="True" OnSelectedIndexChanged="chkSizeGroup_SelectedIndexChanged">
                            </asp:CheckBoxList>
                            <asp:SqlDataSource ID="SqlDataSourceGroupSize" runat="server" ConnectionString="<%$ ConnectionStrings:IRMSConnectionString %>"
                                SelectCommand="SELECT * FROM [SIZE_GROUP]" EnableCaching="True"></asp:SqlDataSource>
                        </div>
                        <asp:Panel ID="pnlSizes" runat="server">
                            <asp:CheckBoxList ID="SizeschkBxs" runat="server" RepeatDirection="Horizontal" AutoPostBack="True"
                                Font-Names="Verdana" Font-Size="10px" OnSelectedIndexChanged="SizeschkBxs_SelectedIndexChanged"
                                RepeatColumns="5" BackColor="#CCCCCC" BorderColor="#666666" BorderWidth="1px"
                                ForeColor="#993300">
                            </asp:CheckBoxList>
                        </asp:Panel>
                    </div>
                    <div>
                        <asp:Image ID="imgSku" runat="server" ImageUrl="~/Resources/Barcode.png" Height="18px"
                            ImageAlign="AbsBottom" />&nbsp;<asp:Label ID="Label9" runat="server" Text="PREVIEW OF ITEM CODES(top label) AND SKU&#39;s(bottom
                        label)" Font-Italic="True" Font-Names="Verdana" 
                            Font-Overline="False" Font-Underline="False" ForeColor="#B05800"></asp:Label>
                    </div>
                    <asp:Panel ID="pnlGeneratedSKU" runat="server" ScrollBars="Auto">
                        <asp:Repeater ID="rptrSKU" runat="server">
                            <HeaderTemplate>
                                <table width="100%">
                                    <tr>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <td>
                                <div style="border:1px Solid #d8d8d8; text-align:center; background-color:#FFF; margin:1px 2px 1px 2px;
                                    text-shadow: 1px 1px 0px #E0E0E0; border-radius:10px 2px 10px 2px; box-shadow:0 1px rgba(255, 255, 255, .6); 
                                     position:relative; z-index:2;  
                                      box-shadow:1px 0 rgba(127, 127, 127, 0.25), 2px 0 rgba(127, 127, 127, 0.125), 3px 0 rgba(127, 127, 127, 0.0625), -1px 0 rgba(127, 127, 127, 0.25), -2px 0 rgba(127, 127, 127, 0.125), -3px 0 rgba(127, 127, 127, 0.0625), 0 1px rgba(127, 127, 127, 0.25), 0 2px rgba(127, 127, 127, 0.125), 0 3px rgba(127, 127, 127, 0.0625);">
                                    <asp:Label ID="lblStyleNumber" runat="server" Text='<%# Eval("ItemCode").ToString() %>'
                                        ForeColor="#993300" Font-Size="10px" Font-Names="Verdana">
                                    </asp:Label>
                                    <br />
                                    <asp:Image ID="Image1" runat="server" ImageUrl="~/Resources/barcode_flat.jpg" Width="130px" />
                                    <br />
                                    <asp:Label ID="lblSKUNumber" runat="server" CssClass="barcode" Text='<%# Eval("SKUNumber").ToString() %>'></asp:Label>
                                </div>
                                </td>
                            </ItemTemplate>
                            <FooterTemplate>
                                </tr> </table>
                            </FooterTemplate>
                        </asp:Repeater>
                    </asp:Panel>
                    <div style="margin-top: 10px; height: 30px; width: 500px;">
                        <asp:Button ID="btnGenerate" runat="server" Text="GENERATE ITEM CODES AND SKU's"
                            CssClass="btnGenerateCodeSKU" OnClick="btnGenerate_Click" Width="250px" />
                        <asp:ModalPopupExtender ID="btnGenerate_ModalPopupExtender" runat="server" CancelControlID="btnNo"
                            DynamicServicePath="" Enabled="True" PopupControlID="pnlDeleteModal" PopupDragHandleControlID="pnlDeleteModalDrag"
                            TargetControlID="btnGenerate">
                        </asp:ModalPopupExtender>
                        <asp:RoundedCornersExtender ID="btnSave_RoundedCornersExtender" runat="server" Enabled="True"
                            TargetControlID="btnGenerate" BorderColor="DarkGray">
                        </asp:RoundedCornersExtender>
                        <div style="float: right;">
                            <asp:ImageButton ID="ibtnBack" runat="server" ImageUrl="~/Resources/reply.png" OnClick="ibtnBack_Click"
                                ToolTip="BACK" ImageAlign="AbsMiddle" />
                            <asp:LinkButton ID="lnkBack" runat="server" Font-Bold="True" Font-Names="Verdana"
                                Font-Size="11px" ForeColor="#003300" OnClick="lnkBack_Click">BACK</asp:LinkButton>
                        </div>
                    </div>
                    <%--Delete Modal--%>
                    <asp:Panel ID="pnlDeleteModal" runat="server" CssClass="modal">
                        <asp:Panel ID="pnlDeleteModalDrag" runat="server" CssClass="modalDrag">
                            <div class="sizeLogo">
                                <asp:Image ID="Image2" runat="server" Height="16px" ImageAlign="AbsBottom" ImageUrl="~/Resources/size.png" />
                                CONFIRMATION!!!
                            </div>
                        </asp:Panel>
                        <div class="modalWarningText">
                            Are you sure you want to save this Data?
                        </div>
                        <div style="text-align: center; margin: 5px 0px;">
                            <asp:Button ID="btnYes" runat="server" Text="YES" CssClass="modalWarningButtonYes"
                                ToolTip="SAVE" OnClick="btnYes_Click" />
                            <asp:Button ID="btnNo" runat="server" Text="NO" CssClass="modalWarningButtonNo" ToolTip="CANCEL" />
                        </div>
                    </asp:Panel>
               
                </asp:View>
            </asp:MultiView>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
