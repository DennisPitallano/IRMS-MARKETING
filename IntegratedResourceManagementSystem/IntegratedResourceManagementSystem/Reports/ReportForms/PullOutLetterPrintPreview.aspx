<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PullOutLetterPrintPreview.aspx.cs"
    Inherits="IntegratedResourceManagementSystem.Reports.ReportForms.PullOutLetterPrintPreview" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>PULL OUT LETTER</title>
    <link href="../../Styles/modal-controls.css" rel="stylesheet" type="text/css" />
    <link href="../../Styles/toolbar-controls.css" rel="stylesheet" type="text/css" />
    <script src="../../Scripts/jquery-1.7.2.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#btnCloseWindow").click(function () {
                window.close();
            });

            $("#btnShowSignatory").hide("fast");

            $("#btnHideSignatory").click(function () {
                $("#divSignatory").hide("slow");
                $(this).hide("fast");
                $("#btnShowSignatory").show("fast");
            });

            $("#btnShowSignatory").click(function () {
                $("#divSignatory").show("slow");
                $(this).hide("fast");
                $("#btnHideSignatory").show("fast");
            });

           
        });
    </script>
    <style type="text/css">
        
    </style>
    <style type="text/css" media="print">
        #btnPrint, #btnCloseWindow, #hpLinkPreviewDetails, #btnHideSignatory, #btnShowSignatory
        {
            visibility: hidden;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
    </asp:ToolkitScriptManager>
    <div style="font-family: Arial; font-size: 12px; margin-top:80px; font-weight: bold;">
        <table style="width: 100%;">
            <tr>
                <td colspan="2" style="padding-bottom: 15px;">
                    <asp:Label ID="lblDate" Text="" EnableViewState="false" runat="server" />
                </td>
                <td>
                    &nbsp;
                </td>
                <td>
                    <asp:Label ID="lblSeriesNumber" EnableViewState="false" Text="" runat="server" />
                </td>
            </tr>
            <tr>
                <td style="width: 60px;">
                    TO:
                </td>
                <td>
                    <asp:Label ID="lblTo" EnableViewState="false" Text="" runat="server" />
                    <asp:HoverMenuExtender ID="HoverMenuExtender1" runat="server" DynamicServicePath=""
                        Enabled="True" TargetControlID="lblTo" PopupControlID="pnlChangeToMenu" PopupPosition="Right">
                    </asp:HoverMenuExtender>
                    <asp:Panel ID="pnlChangeToMenu" runat="server">
                        <asp:Button ID="btnChangeTo" CssClass="btnUpdate" Height="18px" title="edit" runat="server"
                            Text="" />
                        <asp:ModalPopupExtender ID="btnChangeTo_ModalPopupExtender" runat="server" DynamicServicePath=""
                            Enabled="True" TargetControlID="btnChangeTo" PopupControlID="pnlChangeToModal"
                            CancelControlID="btnCancelChangeTo" BackgroundCssClass="bgModal">
                        </asp:ModalPopupExtender>
                    </asp:Panel>
                    <asp:Panel ID="pnlChangeToModal" CssClass="modal" runat="server">
                        <asp:Panel CssClass="modalDrag" runat="server">
                        </asp:Panel>
                        <div style="padding: 5px; text-align: center;" class="modalLabel">
                            TO:<asp:TextBox ID="txtChangeTo" Width="300px" CssClass="modalText" Height="22px"
                                runat="server"></asp:TextBox>
                        </div>
                        <div style="margin: 5px; text-align: center;">
                            <asp:Button ID="btnUpdateTo" Height="25px" CssClass="btnSave" runat="server" Text="update"
                                OnClick="btnUpdateTo_Click" />
                            <asp:Button ID="btnCancelChangeTo" Height="25px" Width="60px" CssClass="btnCancel"
                                runat="server" Text="cancel" />
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
                <td style="width: 60px;">
                    &nbsp;
                </td>
                <td>
                    <asp:Label Style="font-style: italic;" ID="lblBranch" EnableViewState="false" Text=""
                        runat="server" />
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
                    ATTN:
                </td>
                <td>
                    <asp:Label ID="lblAttention" EnableViewState="false" Text="" runat="server" />
                    <asp:HoverMenuExtender ID="lblAttention_HoverMenuExtender" runat="server" DynamicServicePath=""
                        Enabled="True" TargetControlID="lblAttention" PopupControlID="pnlAttentionMenu"
                        PopupPosition="Right">
                    </asp:HoverMenuExtender>
                    <asp:Panel ID="pnlAttentionMenu" runat="server">
                        <asp:Button ID="btnChangeAttention" CssClass="btnUpdate" Height="18px" title="edit"
                            runat="server" Text="" />
                        <asp:ModalPopupExtender ID="btnChangeAttention_ModalPopupExtender" runat="server"
                            DynamicServicePath="" Enabled="True" TargetControlID="btnChangeAttention" PopupControlID="pnlChangeattentionModal"
                            CancelControlID="btnCancelChangeAttn" BackgroundCssClass="bgModal">
                        </asp:ModalPopupExtender>
                    </asp:Panel>
                    <asp:Panel ID="pnlChangeattentionModal" CssClass="modal" runat="server">
                        <asp:Panel CssClass="modalDrag" runat="server">
                        </asp:Panel>
                        <div style="padding: 5px; text-align: center;" class="modalLabel">
                            ATTN:<asp:TextBox ID="txtAttnChange" Width="300px" CssClass="modalText" Height="22px"
                                runat="server"></asp:TextBox>
                        </div>
                        <div style="margin: 5px; text-align: center;">
                            <asp:Button ID="btnSaveAttension" Height="25px" CssClass="btnSave" runat="server"
                                Text="update" OnClick="btnSaveAttension_Click" />
                            <asp:Button ID="btnCancelChangeAttn" Height="25px" Width="60px" CssClass="btnCancel"
                                runat="server" Text="cancel" />
                        </div>
                    </asp:Panel>
                </td>
                <td>
                    &nbsp;
                </td>
                <td>
                    <asp:Label ID="lblDepartmentCode" EnableViewState="false" Text="" runat="server" />
                </td>
            </tr>
            <tr>
                <td>
                    BRAND:
                </td>
                <td>
                    <asp:Label ID="lblBrand" Text="" EnableViewState="false" runat="server" />
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
    <div style="font-family: Arial; font-size: 10px;">
        <div style="margin-top: 15px;">
            <asp:Label ID="lblSirMadam" runat="server" Text="Dear Sir/Madam"></asp:Label>
        </div>
        <div style="margin-top: 10px;">
            <span style="padding-left: 30px;">We would like to request from your good office to
                please allow us to pullout our <span style="font-weight: bold; text-decoration: underline;">
                    items </span>from </span><span style="font-weight: bold;">
                        <asp:Label ID="lblBrandLetter" EnableViewState="false" Text="" runat="server" />
                    </span>brand. Schedule of pullout is on or before <span style="font-weight: bold;
                        text-decoration: underline;">
                        <asp:Label EnableViewState="false" ID="lblPullOutDate" runat="server"></asp:Label></span>.
            Total quantity is <span style="font-weight: bold; text-decoration: underline;">
                <asp:Label runat="server" EnableViewState="false" ID="lblTotalQuantity"></asp:Label></span>
            PCS.
        </div>
    </div>
    <div>
    </div>
    <div style="font-family: Arial; font-size: 10px; margin-top: 15px;">
        <asp:Panel ID="pnlForwarder" Visible="false" style="margin-bottom:4px;" runat="server">
               We authorized <span style="font-weight: bold;">
                    <asp:Label ID="lblForwarder" runat="server" Text=""></asp:Label></span> Trucking to pullout the said items:
        </asp:Panel>
        <div id="divSignatory">
            <div style="padding-left: 30px;">
                Our <span style="font-weight: bold;">
                    <asp:Label ID="lblCompanyName" runat="server" Text=""></asp:Label></span> personnel
                was given authority to pullout the said items:
            </div>
            <div style="padding-left: 30px;">
                <br />
                <br />
                <span style="margin-right: 100px;">NAME:</span> <span style="margin-right: 20px;">SIGNATURE</span>
                <span style="margin-right: 100px;">NAME:</span> <span style="margin-right: 30px;">SIGNATURE</span>
                <span style="margin-right: 100px;">NAME:</span> <span>SIGNATURE</span>
            </div>
            <img src="../../Resources/Signatory.jpg" alt="" style="height: 126px; width: 705px" />
            <div style="padding-left: 350px;">
                SIGNATURE
            </div>
        </div>
    </div>
    <div style="margin-top: 50px; font-family: Arial; font-size: 11px;">
        <table>
            <tr>
                <td>
                    Thank you &amp; more power!
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
                    Requested by:
                </td>
                <td>
                    Endorsed by:
                </td>
                <td>
                    Issued by:
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
            </tr>
            <tr>
                <td>
                    <div style="border-top: 1px dashed black; width: 300px; height: 35px; margin-right: 10px;">
                        <span style="font-weight: bold;">
                            <asp:Label ID="lblMrktAss" Text="Dhel Cruz / Mr. Alberto San Gregorio " runat="server" />
                            <asp:HoverMenuExtender ID="lblMrktAss_HoverMenuExtender" runat="server" DynamicServicePath=""
                                Enabled="True" TargetControlID="lblMrktAss" PopupControlID="plnMrktAss" PopupPosition="Right">
                            </asp:HoverMenuExtender>
                            <asp:Panel ID="plnMrktAss" runat="server">
                                <asp:Button ID="btnUpdateMrkAss" CssClass="btnUpdate" Height="18px" title="edit"
                                    runat="server" Text="" />
                                <asp:ModalPopupExtender ID="btnUpdateMrkAss_ModalPopupExtender" runat="server" DynamicServicePath=""
                                    Enabled="True" TargetControlID="btnUpdateMrkAss" PopupControlID="pnlMrktAssModal"
                                    CancelControlID="btnUpdateMrktAssCancel" BackgroundCssClass="bgModal">
                                </asp:ModalPopupExtender>
                            </asp:Panel>
                        </span>
                        <asp:Panel ID="pnlMrktAssModal" CssClass="modal" runat="server">
                            <asp:Panel ID="pnlMrktAssModalDrag" CssClass="modalDrag" runat="server">
                            </asp:Panel>
                            <div style="padding: 5px; text-align: center;" class="modalLabel">
                                Marketing Assistant / Area Sales Manager:
                                <br />
                                <asp:TextBox ID="txtMrktAssUpdate" Width="300px" CssClass="modalText" Height="22px"
                                    runat="server"></asp:TextBox>
                            </div>
                            <div style="margin: 5px; text-align: center;">
                                <asp:Button ID="btnUpdateMrktAss" Height="25px" CssClass="btnSave" runat="server"
                                    Text="update" OnClick="btnUpdateMrktAss_Click" />
                                <asp:Button ID="btnUpdateMrktAssCancel" Height="25px" Width="60px" CssClass="btnCancel"
                                    runat="server" Text="cancel" />
                            </div>
                        </asp:Panel>
                        <br />
                        <span>Marketing Assistant / Area Sales Manager</span>
                    </div>
                </td>
                <td>
                    <div style="border-top: 1px dashed black; width: 180px; height: 20px; margin-right: 15px;">
                    </div>
                    <div style="padding-left: 15px;">
                        SC Manager Area
                    </div>
                </td>
                <td>
                    <div style="border-top: 1px dashed black; width: 180px; height: 20px;">
                    </div>
                    <div style="padding-left: 15px;">
                        SC Demo Personnel
                    </div>
                </td>
            </tr>
        </table>
    </div>
    <div style="margin-top: 15px; font-family: Arial; font-size: 12px;">
        <table>
            <tr>
                <td>
                    Noted by:
                </td>
                <td>
                    &nbsp;
                </td>
                <td>
                    Corrected by:
                </td>
                <td>
                    Corrected by:
                </td>
            </tr>
            <tr>
                <td>
                    <div style="width: 180px; height: 45px; margin-right: 10px; margin-top: 20px;">
                        <span style="font-weight: bold;"></span>
                        <br />
                        <span style="font-style: italic; border-top: 1px Solid black;">Brand General Manager</span>
                    </div>
                </td>
                <td>
                    <div style="width: 180px; height: 45px; margin-right: 10px; margin-top: 20px;">
                        <span></span>
                        <br />
                        <span style="font-style: italic; border-top: 1px Solid black;">Department Manager</span>
                    </div>
                </td>
                <td>
                    <div style="width: 180px; height: 45px; margin-right: 10px; margin-top: 20px;">
                        <span></span>
                        <br />
                        <span style="font-style: italic; border-top: 1px Solid black;">SC Whse. Supervisor/
                        </span>
                        <br />
                        <span style="font-style: italic;">RDU Supervisor </span>
                    </div>
                </td>
                <td>
                    <div style="width: 180px; height: 45px; margin-right: 10px; margin-top: 20px;">
                        <span></span>
                        <br />
                        <span style="font-style: italic; border-top: 1px Solid black;">SC Representative</span>
                    </div>
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
    <div style="margin-top: 20px; font-family: Arial; border-top: 1px dashed #000; font-size: 12px;">
        <table style="">
            <tr>
                <td>
                    For Internal Use Only
                </td>
                <td>
                    &nbsp;
                </td>
                <td>
                    &nbsp;
                </td>
                <td>
                    <span style="margin-right: 10px;">
                        <asp:CheckBox ID="chkBackLoad" Text="BL" runat="server" />
                    </span><span>
                        <asp:CheckBox ID="chkCT" Text="CT" runat="server" />
                    </span>
                </td>
                <td>
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td>
                </td>
                <td>
                </td>
                <td>
                </td>
                <td>
                </td>
                <td>
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td style="text-align: right;">
                    CT#:
                </td>
                <td style="width: 200px; border-bottom: 1px Solid #000;">
                    <asp:Label ID="lblCTNumber" runat="server" Text=""></asp:Label>
                </td>
                <td style="width: 30px;">
                    &nbsp;
                </td>
                <td style="text-align: right;">
                    DATE:
                </td>
                <td style="width: 150px; border-bottom: 1px Solid #000;">
                    <asp:Label ID="lblDateInternal" runat="server" Text=""></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="text-align: right;">
                    DR#:
                </td>
                <td style="width: 200px; border-bottom: 1px Solid #000;">
                    <asp:Label ID="lblDRNumber" runat="server" Text=""></asp:Label>
                </td>
                <td>
                    &nbsp;
                </td>
                <td style="text-align: right;">
                    STT:
                </td>
                <td style="width: 150px; border-bottom: 1px Solid #000;">
                    <asp:Label ID="lblSTT" runat="server" Text=""></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="text-align: right;">
                    TOTAL QTY:
                </td>
                <td style="width: 200px; border-bottom: 1px Solid #000;">
                    <asp:Label ID="lblTotalQty" runat="server" Text=""></asp:Label>
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
    <div style="margin: 20px 20px 30px 450px; font-family: Arial; font-size: 12px;">
        Approved by:
        <br />
        <div style="margin-top: 30px; padding-left: 30px; border-top: 1px Solid #000; width: 150px;">
            <span>ACCTG. DEPARTMENT</span>
        </div>
    </div>
    <div style="font-family: Arial; font-size: 12px;">
        cc: ACTG, WH, File, Promo
    </div>
    <div style="text-align: center;">
        <input id="btnHideSignatory" type="button" class="btnDelete" value="Hide Signatures" />
        <input id="btnShowSignatory" type="button" class="btnDelete" value="Show Signatures" />
        <input id="btnPrint" type="button" class="btnPrint" onclick="window.print()" value="PRINT" />
        <asp:HyperLink ID="hpLinkPreviewDetails" Visible="false" Target="_blank" Height="23px"
            Style="line-height: 23px; padding-right: 5px;" CssClass="btnPrint" runat="server">VIEW DETAILS</asp:HyperLink>
        <input id="btnCloseWindow" type="button" class="btnDelete" value="CLOSE"  />
    </div>
    </form>
</body>
</html>
