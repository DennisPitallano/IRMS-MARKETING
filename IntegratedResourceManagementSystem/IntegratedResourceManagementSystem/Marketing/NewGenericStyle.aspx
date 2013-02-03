<%@ Page Title="" Language="C#" MasterPageFile="~/Marketing/Marketing.Master" AutoEventWireup="true"
    CodeBehind="NewGenericStyle.aspx.cs" Inherits="IntegratedResourceManagementSystem.Marketing.NewGenericStyle" %>

<%@ OutputCache CacheProfile="cached_profile" %>
<%@ PreviousPageType VirtualPath="~/Marketing/ProductManagementPanel.aspx" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Src="~/Marketing/controls/UCLoader.ascx" TagName="LOADER" TagPrefix="UC" %>
<asp:Content ID="HeadContent" ContentPlaceHolderID="head" runat="server">
    <link href="../Styles/new-generic-form.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/marketing-item-master.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .txtMoney
        {
            text-align: right;
            font-family: Verdana;
            font-size: 14px;
            height: 22px;
            width: 100px;
            color: #CC0000;
            font-weight: bold;
        }
    </style>
</asp:Content>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="titlePanel">
        <img src="../Resources/product.png" height="18px" align="top" />
        &nbsp;New Generic Style &nbsp;
        <div style="float: right;">
          <a href="GenericStylesManagementPanel.aspx" title="BACK" >
             <img src="../Resources/reply.png" />
          </a>
        </div>
    </div>
    <asp:UpdatePanel ID="upnlNewGenericStyle" runat="server">
        <ContentTemplate>
            <div style="text-align: center; margin-bottom: 5px;">
                <asp:UpdateProgress ID="uprogressGenerator" runat="server" AssociatedUpdatePanelID="upnlNewGenericStyle">
                    <ProgressTemplate>
                        <asp:PlaceHolder ID="plcHLoader" runat="server">
                            <UC:LOADER ID="loader" runat="server" />
                        </asp:PlaceHolder>
                    </ProgressTemplate>
                </asp:UpdateProgress>
            </div>
            <div class="titleList">
                STYLE GENERATOR FORM
            </div>
            <div class="form">
                <table style="width: 100%;">
                    <tr>
                        <td class="input-form-label">
                            BRAND:
                        </td>
                        <td colspan="3">
                            <asp:DropDownList ID="dlBrandsForStyleNumber" runat="server" AutoPostBack="True"
                                Height="23px" OnSelectedIndexChanged="dlBrandsForStyleNumber_SelectedIndexChanged"
                                Width="170px" CssClass="modalText">
                            </asp:DropDownList>
                        </td>
                        <td>
                            &nbsp;
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td class="input-form-label">
                            CATEGORY:
                        </td>
                        <td colspan="3">
                            <asp:RadioButtonList ID="rdioTopOrBottom" runat="server" RepeatDirection="Horizontal"
                                AutoPostBack="True" Font-Bold="True" CssClass="modalText" OnSelectedIndexChanged="rdioTopOrBottom_SelectedIndexChanged">
                                <asp:ListItem Value="T">TOP</asp:ListItem>
                                <asp:ListItem Value="B">BOTTOM</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                        <td>
                            &nbsp;
                        </td>
                        <td rowspan="7" valign="top">
                            <div style="background-color: #FFFFCC; border: 1px Solid #FFCC66; padding: 3px 3px;
                                width: 200px; -moz-border-radius: 30px 40px 40px 2px; -webkit-border-radius: 30px 40px 40px 2px;
                                border-radius: 30px 40px 40px 2px;">
                                <asp:Image ID="Image3" runat="server" ImageUrl="~/Resources/edit_normal.png" ImageAlign="AbsMiddle" />
                                <asp:Label ID="Label8" runat="server" Text="NOTE:" Font-Italic="True" Font-Names="Verdana"></asp:Label>
                                <br />
                                <br />
                                <asp:Label ID="Label3" runat="server" Text="SRP" Font-Bold="True" Font-Names="Verdana"
                                    ForeColor="#CC6600"></asp:Label>
                                -Manual Input
                                <br />
                                <asp:Label ID="Label7" runat="server" Text="COST PRICE" Font-Bold="True" Font-Names="Verdana"
                                    ForeColor="#CC6600"></asp:Label>
                                -Manual Input
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td class="input-form-label">
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
                        <td class="input-form-label">
                            GARMENT:
                        </td>
                        <td colspan="3">
                            <asp:DropDownList ID="dlGarmentForStyleNumber" runat="server" AutoPostBack="True"
                                Height="23px" OnSelectedIndexChanged="dlGarmentForStyleNumber_SelectedIndexChanged"
                                CssClass="modalText">
                            </asp:DropDownList>
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td class="input-form-label">
                            FITTING:
                        </td>
                        <td>
                            <asp:DropDownList ID="DDLFittings" CssClass="modalText" Height="20px" runat="server"
                                AutoPostBack="True">
                            </asp:DropDownList>
                        </td>
                        <td>
                        </td>
                        <td>
                        </td>
                    </tr>
                    <tr>
                        <td class="input-form-label">
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
                        <td style="line-height: 16px;" class="input-form-label">
                            <img src="../Resources/view.png" align="middle" />
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
                        <td class="input-form-label">
                            &nbsp;STYLE NUMBER:
                        </td>
                        <td colspan="3">
                            <asp:TextBox ID="txtStyleNumber" runat="server" Width="250px" CssClass="modalText"
                                ReadOnly="True" Font-Bold="True" Height="22px"></asp:TextBox>
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td class="input-form-label">
                            STYLE DESCRIPTION:
                        </td>
                        <td colspan="3">
                            <asp:TextBox ID="txtStyleDescription" runat="server" Width="270px" CssClass="modalText"
                                ReadOnly="True" Font-Bold="True" Height="22px"></asp:TextBox>
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td class="input-form-label">
                            COST PRICE:
                        </td>
                        <td style="width: 100px;">
                            <asp:TextBox ID="txtCostPrice" runat="server" placeholder="0.00" CssClass="txtMoney"></asp:TextBox>
                        </td>
                        <td class="input-form-label" style="width: 50px;">
                            SRP:
                        </td>
                        <td>
                            <asp:TextBox ID="txtSRP" runat="server" placeholder="0.00" CssClass="txtMoney"></asp:TextBox>
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
                            <asp:ModalPopupExtender ID="Label1_ModalPopupExtender" runat="server" DynamicServicePath=""
                                Enabled="True" TargetControlID="Label1" PopupControlID="pnlErrorMessage" PopupDragHandleControlID="pnlErrorMessageDrag"
                                CancelControlID="btnOk">
                            </asp:ModalPopupExtender>
                            <asp:Panel ID="pnlErrorMessage" CssClass="modal" runat="server">
                                <asp:Panel CssClass="modalDrag" ID="pnlErrorMessageDrag" runat="server">
                                    <div class="sizeLogo">
                                        WARNING!!!!
                                    </div>
                                </asp:Panel>
                                <div style="min-width: 200px; min-height: 50px;">
                                    <img src="../Resources/warning.png" alt="Warning" align="left" />
                                    <asp:Label Font-Size="12px" ID="lblErrorMessage" runat="server" ForeColor="#CC3300"></asp:Label>
                                </div>
                                <div style="text-align: center; margin: 3px 3px;">
                                    <asp:Button ID="btnOk" CssClass="modalWarningButtonYes" runat="server" Text="OK" />
                                </div>
                            </asp:Panel>
                        </td>
                        <td>
                            &nbsp;
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                </table>
                <div style="text-align:center; margin:5px;">
                    <asp:Button ID="btnSaveGenericStyle" runat="server" CssClass="btnSave" Text="SAVE STYLE"
                        Width="100px" />
                    <asp:ModalPopupExtender ID="btnSaveGenericStyle_ModalPopupExtender" 
                        runat="server" CancelControlID="btnCancelStyle" DynamicServicePath="" 
                        Enabled="True" PopupControlID="pnlSaveConfirmationModal" 
                        PopupDragHandleControlID="pnlSaveConfirmationModalDrag" 
                        TargetControlID="btnSaveGenericStyle">
                    </asp:ModalPopupExtender>
                    <a style="text-decoration:none;" href="GenericStylesManagementPanel.aspx" title="BACK TO LIST" >
                        <input style="width:110px;" id="btnBack" class="btnCancel" type="button" value="BACK TO LIST" />
                    </a>
                </div>
            </div>
            
            <asp:Panel ID="pnlSaveConfirmationModal" CssClass="modal" runat="server">
                <asp:Panel ID="pnlSaveConfirmationModalDrag" CssClass="modalDrag" runat="server">
                    <div class="sizeLogo">
                        <img src="../Resources/product.png" height="16px" align="top" />
                        CONFIRMATION!
                    </div>
                </asp:Panel>
                <div style="text-align:center; margin:5px 5px 2px 5px; font-size:12px;" class="input-form-label">
                    <img src="../Resources/warning.png" align ="middle" /> 
                    Are you sure you want to save this data?
                </div>
                <div style ="margin:5px; text-align:center;" >
                    <asp:Button ID="btnSaveStyle" CssClass="btnSave" runat="server" Text="SAVE" 
                        onclick="btnSaveStyle_Click" />
                    <asp:Button ID="btnCancelStyle" CssClass="btnCancel" runat="server" Text="CANCEL" />
                </div>
            </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
