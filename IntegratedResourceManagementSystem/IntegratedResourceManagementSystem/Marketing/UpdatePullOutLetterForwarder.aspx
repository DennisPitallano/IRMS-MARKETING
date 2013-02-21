<%@ Page Title="" Language="C#" MasterPageFile="~/Marketing/Marketing.Master" AutoEventWireup="true"
    CodeBehind="UpdatePullOutLetterForwarder.aspx.cs" Inherits="IntegratedResourceManagementSystem.Marketing.UpdatePullOutLetterForwarder" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Src="~/Marketing/controls/UCLoader.ascx" TagName="LOADER" TagPrefix="UC" %>
<asp:Content ID="HeadContent" ContentPlaceHolderID="head" runat="server">
    <link href="../Styles/sm-pull-out-details.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div style="width: 500px;">
        <div class="titleForm" style="height: 20px;">
            Assign Forwarder
        </div>
        <div class="form">
            <table>
                <tr>
                    <td class="modalLabel">
                        PULLOUT SERIES#:
                    </td>
                    <td>
                        <asp:Label ID="lblPullOutSeriesNumber" Style="line-height: 20px; padding: 0px 2px 0px 2px;"
                            CssClass="modalText" Height="20px" runat="server" Text="Label"></asp:Label>
                    </td>
                    <td>
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td class="modalLabel">
                        PULLOUT LETTER FOR:
                    </td>
                    <td>
                        <asp:Label ID="lblCustomer" Style="line-height: 20px; padding: 0px 2px 0px 2px;"
                            CssClass="modalText" Height="20px" runat="server" Text="Label"></asp:Label>
                    </td>
                    <td>
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td class="modalLabel">
                        FORWARDERS:
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlForwarders" CssClass="modalText" Height="22px" runat="server">
                        </asp:DropDownList>
                    </td>
                    <td>
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblSuccessModalHandler" runat="server" Text=""></asp:Label>
                        <asp:ModalPopupExtender ID="hfSuccessfulModalHandler_ModalPopupExtender" runat="server"
                            DynamicServicePath="" CancelControlID="lblSuccessModalHandler" Enabled="True" PopupControlID="pnlSuccessfulSaveModal"
                            PopupDragHandleControlID="pnlSuccessfulSaveModalDrag" TargetControlID="lblSuccessModalHandler">
                        </asp:ModalPopupExtender>
                        <asp:Panel ID="pnlSuccessfulSaveModal" CssClass="modal" runat="server">
                            <asp:Panel ID="pnlSuccessfulSaveModalDrag" CssClass="modalDrag" runat="server">
                                <div class="sizeLogo">
                                    <img alt="new brand" src="../Resources/info.png" height="15" align="top" />
                                    SUCCESSFUL!
                                </div>
                            </asp:Panel>
                            <div class="modalLabel" style="text-align: center; padding: 10px; font-size: 1em;
                                line-height: 40px;">
                                <img src="../Resources/info.png" alt="" align="left" />
                                Data has been successfully saved!
                            </div>
                            <div style="text-align: center; margin: 5px;">
                                <asp:Button ID="btnOK" runat="server" CssClass="modalWarningButtonYes" Text="OK" />
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
                <tr>
                    <td>
                        &nbsp;
                    </td>
                    <td>
                        <asp:Button ID="btnSave" CssClass="btnSave" runat="server" Text="SAVE" OnClick="btnSave_Click" />
                        <asp:HyperLink CssClass="btnCancel" ID="hpLinkBack" Height="16px" Width="50px"  Style="line-height: 16px;"
                            runat="server">BACK</asp:HyperLink>
                    </td>
                    <td>
                        &nbsp;
                    </td>
                </tr>
            </table>
        </div>
    </div>
</asp:Content>
