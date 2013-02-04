<%@ Page Title="" Language="C#" MasterPageFile="~/Marketing/Marketing.Master" AutoEventWireup="true" CodeBehind="PullOutLetterUpdateDefault.aspx.cs" Inherits="IntegratedResourceManagementSystem.Marketing.PullOutLetterUpdateDefault" %>
<%@ Register Src="~/Marketing/controls/UCLoader.ascx" TagName="LOADER" TagPrefix="UC" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="HeadContent" ContentPlaceHolderID="head" runat="server">
    <link href="../Styles/returns-and-transfer.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/pull-out-letter.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/price-check.css" rel="stylesheet" type="text/css" />
    <script language="javascript" type="text/javascript">
        function SelectAll(frmId, id) {
            var frm = document.getElementById(frmId);
            for (i = 1; i < frm.rows.length; i++) {
                var checkbox = frm.rows[i].cells[1].childNodes[1];
                if (checkbox != null)
                    checkbox.checked = document.getElementById(id).checked;
            }
        };
    </script>
</asp:Content>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="panelTitle">
        <asp:Image ID="imgpnlTitle" runat="server" ImageUrl="~/Resources/memo-doc.png" ImageAlign="Top"
            Height="28px" />New Pull-Out Letter
        <div style="float: right; height: 24px;">
            <a href="PullOutLettersManagementPanel.aspx">
                <img alt="BACK" src="../Resources/reply.png" alt="BACK" /></a>
        </div>
    </div>
    <asp:UpdatePanel ID="upnlPullOutLetter" runat="server">
        <ContentTemplate>
            <div style="min-height:300px;">
                <div style="float: left;">
                    <div class="titleForm">
                        PULL-OUT LETTER FORM
                         <div id="Div1" style="float: right; margin-left:3px; margin-right:2px;" runat="server">
                            <asp:HyperLink ID="hpLinlUpdateForwarder"  CssClass="btnUpdate" Height="18px"
                             style="line-height:18px; padding-right:3px; text-decoration:none;" runat="server">assign forwarder</asp:HyperLink>
                        </div>
                    </div>
                    <div id="pnlLetterHeader" style="" class="form">
                        <table style="">
                            <tr>
                                <td class="modalLabel">
                                    PULL-OUT LETTER FOR:
                                </td>
                                <td>
                                    <asp:RadioButtonList ID="rdioPLType" AutoPostBack="true" Font-Size="10px" CssClass="modalText"
                                        runat="server" RepeatDirection="Horizontal" OnSelectedIndexChanged="rdioPLType_SelectedIndexChanged">
                                        <asp:ListItem Selected="True" Value="BL">BL (Back Load)</asp:ListItem>
                                        <asp:ListItem Value="ST">ST (Stock Transfer)</asp:ListItem>
                                    </asp:RadioButtonList>
                                </td>
                                <td class="modalLabel">
                                    <label for="MainContent_txtPullOutDate">
                                        DATE:
                                    </label>
                                </td>
                                <td class="modalLabel">
                                    <asp:TextBox ID="txtPullOutDate" Height="20px" CssClass="modalText calendar" runat="server"></asp:TextBox>
                                    <asp:CalendarExtender ID="txtPullOutDate_CalendarExtender" runat="server" Enabled="True"
                                        TargetControlID="txtPullOutDate">
                                    </asp:CalendarExtender>
                                </td>
                            </tr>
                            <tr>
                                <td class="modalLabel">
                                    SERIES #:
                                </td>
                                <td colspan="2">
                                    <asp:TextBox ID="txtSeriesNumber" ReadOnly="true" Width="180px" Height="20px" CssClass="modalText"
                                        runat="server"></asp:TextBox>
                                    <asp:HiddenField ID="hfLastPullOutLetterNumber" runat="server" />
                                </td>
                                <td class="modalLabel">
                                </td>
                            </tr>
                            <tr>
                                <td class="modalLabel">
                                    OUTLET/STORE:
                                </td>
                                <td colspan="2">
                                    <asp:TextBox ID="txtOuletStore" ReadOnly="true" Width="270px" CssClass="modalText"
                                        Height="20px" runat="server"></asp:TextBox>
                                </td>
                                <td>
                                   
                                <OnShown>
                                    <FadeIn Duration=".2" />
                                </OnShown>
                                        </Animations>
                                    </asp:ModalPopupExtender>
                                </td>
                            </tr>
                            <tr>
                                <td class="modalLabel">
                                    ACCOUNT NAME:
                                </td>
                                <td colspan="2">
                                    <asp:TextBox ID="txtAccountName" ReadOnly="true" Height="23px" CssClass="modalText"
                                        Width="230px" runat="server"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:UpdateProgress ID="upProgress" runat="server" AssociatedUpdatePanelID="upnlPullOutLetter">
                                        <ProgressTemplate>
                                            <asp:PlaceHolder ID="plcHLoader" runat="server">
                                                <UC:LOADER ID="loader" runat="server" />
                                            </asp:PlaceHolder>
                                        </ProgressTemplate>
                                    </asp:UpdateProgress>
                                </td>
                            </tr>
                            <tr>
                                <td class="modalLabel">
                                    BRANCH NAME:
                                </td>
                                <td colspan="2">
                                    <asp:TextBox ID="txtBranchName" ReadOnly="true" Height="23px" CssClass="modalText"
                                        Width="270px" runat="server"></asp:TextBox>
                                </td>
                                <td>
                                </td>
                            </tr>
                            <tr>
                                <td class="modalLabel">
                                    BRAND:
                                </td>
                                <td>
                                    <asp:TextBox ID="txtBrand" ReadOnly="true" Height="20px" CssClass="modalText" Width="170px"
                                        runat="server"></asp:TextBox>
                                </td>
                                <td>
                                </td>
                                <td class="modalLabel">
                                    <asp:HiddenField ID="hfErrorModalHandLer" runat="server" />
                                    <asp:ModalPopupExtender ID="hfErrorModalHandLer_ModalPopupExtender" runat="server"
                                        DynamicServicePath="" Enabled="True" TargetControlID="hfErrorModalHandLer" CancelControlID="btnOKError"
                                        PopupControlID="pnlErrorMessageModal" PopupDragHandleControlID="pnlErrorMessageModalDrag"
                                        BackgroundCssClass="bgModal">
                                    </asp:ModalPopupExtender>
                                    <asp:Panel ID="pnlErrorMessageModal" CssClass="modal" runat="server">
                                        <asp:Panel ID="pnlErrorMessageModalDrag" CssClass="modalDrag" runat="server">
                                            <div class="sizeLogo">
                                                <img alt="new brand" src="../Resources/error.png" height="15" align="top" />
                                                WARNING!
                                            </div>
                                        </asp:Panel>
                                        <div class="modalLabel" style="text-align: center; padding: 10px; font-size: 1em;">
                                            <img src="../Resources/error.png" alt="" align="left" />
                                            <asp:Label ID="lblErrorMessage" runat="server" Text=""></asp:Label>
                                        </div>
                                        <div style="text-align: center; margin: 5px;">
                                            <asp:Button ID="btnOKError" runat="server" Text="OK" CssClass="modalWarningButtonYes" />
                                        </div>
                                    </asp:Panel>
                                </td>
                            </tr>
                            <tr>
                                <td class="modalLabel">
                                </td>
                                <td colspan="2">
                                 
                                </td>
                                <td class="modalLabel">
                                    <asp:HiddenField ID="hfPGMDNo" runat="server" />
                                    <asp:HiddenField ID="hfSubAreaGroupNo" runat="server" />
                                    <asp:HiddenField ID="hfAreaGroupNo" runat="server" />
                                    <asp:HiddenField ID="hfPGNo" runat="server" />
                                    <asp:HiddenField ID="hfCustomerNumber" runat="server" />
                                    <asp:HiddenField ID="hfBrandCode" runat="server" />
                                    <asp:HiddenField ID="hfForwarder" runat="server" />
                                    <asp:HiddenField ID="hfPullOutLetterCode" runat="server" />
                                </td>
                            </tr>
                            <tr>
                                <td class="modalLabel">
                                    TOTAL QUANTITY:
                                </td>
                                <td>
                                    <asp:TextBox ID="txtTotalQtySummary" Height="22px" Text="0" Style="text-align: right;
                                        color: Maroon;" CssClass="modalText" runat="server"></asp:TextBox>
                                </td>
                                <td>
                                </td>
                                <td>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
              
            </div>
            <div style="text-align: center; margin: 30px;">
                <asp:Button ID="btnSave" runat="server" CssClass="btnSave" Text="SAVE" />
                <asp:ModalPopupExtender ID="btnSave_ModalPopupExtender" runat="server" CancelControlID="btnCancelSave"
                    DynamicServicePath="" Enabled="True" PopupControlID="pnlSaveModal" PopupDragHandleControlID="pnlSaveModalDrag"
                    TargetControlID="btnSave">
                </asp:ModalPopupExtender>
                <a href="PullOutLettersManagementPanel.aspx" style="text-decoration: none;">
                    <input id="btnCancel" class="btnCancel" type="button" value="CANCEL" />
                </a>
                <asp:Panel ID="pnlSaveModal" CssClass="modal" runat="server">
                    <asp:Panel ID="pnlSaveModalDrag" CssClass="modalDrag" runat="server">
                        <div class="close_btn">
                            <asp:ImageButton ID="iBtnPnlSaveModal" runat="server" CssClass="btnClose" ImageUrl="~/Resources/cancel_gray.png"
                                ToolTip="CLOSE" />
                        </div>
                        <div class="sizeLogo">
                            <img alt="new brand" src="../Resources/question.png" height="15" align="top" />
                            CONFIRMATION!
                        </div>
                    </asp:Panel>
                    <div class="modalLabel" style="text-align: center; padding: 10px; font-size: 1em;
                        line-height: 40px;">
                        <img src="../Resources/question.png" alt="" align="left" />
                        Are you sure you want to save this data?
                    </div>
                    <div style="text-align: center; margin: 5px;">
                        <asp:Button ID="btnSaveYes" runat="server" Text="YES" CssClass="modalWarningButtonYes"
                            OnClick="btnSaveYes_Click" />
                        <asp:Button ID="btnCancelSave" runat="server" Text="NO" CssClass="modalWarningButtonNo" />
                    </div>
                </asp:Panel>
            </div>
            <asp:HiddenField ID="hfSuccessfulModalHandler" runat="server" />
            <asp:ModalPopupExtender ID="hfSuccessfulModalHandler_ModalPopupExtender" runat="server"
                DynamicServicePath="" Enabled="True" PopupControlID="pnlSuccessfulSaveModal"
                PopupDragHandleControlID="pnlSuccessfulSaveModalDrag" TargetControlID="hfSuccessfulModalHandler">
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
                    <a href="PullOutLettersManagementPanel.aspx" style="text-decoration: none;">
                        <input id="btnSuccessfulOK" type="button" class="modalWarningButtonYes" value="OK" />
                    </a>
                </div>
            </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

