<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PullOutLetterPrintPreview.aspx.cs"
    Inherits="IntegratedResourceManagementSystem.Reports.ReportForms.PullOutLetterPrintPreview" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
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

            $("#btnHideLogo").hide();
            $("#letterHead").hide();
            $("#btnShowLogo").click(function () {
                $("#letterHead").show("slow");
                $(this).hide("fast");
                $("#btnHideLogo").show("fast");
            });

            $("#btnHideLogo").click(function () {
                $("#letterHead").hide("slow");
                $(this).hide("fast");
                $("#btnShowLogo").show("fast");
            });
        });
    </script>
    <style type="text/css">
        #gvStyles th
        {
            padding: 3px 5px;
        }
        #gvStyles tr td
        {
            padding: 3px 5px;
        }
        .pnlCut
        {
            margin-top:50px;
            border-top: 1px dashed #000;
        }
    </style>
    <style type="text/css" media="print">
        #btnPrint, #btnCloseWindow, #hpLinkPreviewDetails, #btnHideSignatory, #btnShowSignatory,#btnHideLogo,#btnShowLogo
        {
            visibility: hidden;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
    </asp:ToolkitScriptManager>
    <div style="font-family: Arial; font-size: 11px; margin-top:20px; font-weight: bold;">
        <div id="letterHead" style="text-align:center;">
            <asp:Image ID="imgLogo" ImageUrl="~/Resources/multitrends-logo.png" runat="server" />
            <asp:HoverMenuExtender ID="imgLogo_HoverMenuExtender" runat="server" DynamicServicePath=""
                Enabled="True" TargetControlID="imgLogo" PopupControlID="Panel1" PopupPosition="Right">
            </asp:HoverMenuExtender>
            <asp:Panel ID="Panel1" runat="server">
                <asp:Button ID="btnChangeLogo" CssClass="btnUpdate" Height="18px" title="edit" runat="server"
                    Text="" />
                <asp:ModalPopupExtender ID="btnChangeLogo_ModalPopupExtender" runat="server" DynamicServicePath=""
                    Enabled="True" TargetControlID="btnChangeLogo" PopupControlID="Panel2"
                    CancelControlID="Button2" BackgroundCssClass="bgModal" PopupDragHandleControlID="Panel3">
                </asp:ModalPopupExtender>
            </asp:Panel>
            <asp:Panel ID="Panel2" CssClass="modal" runat="server">
                <asp:Panel ID="Panel3" CssClass="modalDrag" runat="server">
                </asp:Panel>
                <div style="padding: 5px; text-align: center;" class="modalLabel">
                    COMPANY LOGO:
                    <asp:GridView ID="gvCompanyLogos" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourceLogos"
                        CellPadding="4" DataKeyNames="Logo" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="gvCompanyLogos_SelectedIndexChanged">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:TemplateField ShowHeader="False">
                                <ItemTemplate>
                                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Select"
                                        Text="">
                                        <asp:Image ID="Image1" ImageUrl='<%# "~/Marketing/Marketing-Admin/company-logos/"+Eval("Logo") %>'
                                            runat="server" />
                                    </asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="CompName" HeaderText="CompName" SortExpression="CompName" />
                        </Columns>
                        <EditRowStyle BackColor="#7C6F57" />
                        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#E3EAEB" />
                        <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#F8FAFA" />
                        <SortedAscendingHeaderStyle BackColor="#246B61" />
                        <SortedDescendingCellStyle BackColor="#D4DFE1" />
                        <SortedDescendingHeaderStyle BackColor="#15524A" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSourceLogos" runat="server" ConnectionString="<%$ ConnectionStrings:IRMSConnectionString %>"
                        SelectCommand="SELECT [Logo], [CompName] FROM [Company]"></asp:SqlDataSource>
                </div>
                <div style="margin: 5px; text-align: center;">
                    <asp:Button ID="Button1" CssClass="modalWarningButtonYes" runat="server" Text="OK" />
                    <asp:Button ID="Button2" Width="60px" CssClass="modalWarningButtonNo" runat="server"
                        Text="NO" />
                </div>
            </asp:Panel>
        </div>
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
    <div style="font-family: Arial; font-size: 9px; margin: 10px 5px 5px 5px;">
        <asp:GridView ID="gvStyles" runat="server" AutoGenerateColumns="False">
            <Columns>
                <asp:BoundField DataField="ContainerType" HeaderText="CON." Visible="False">
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="ContainerNumber" HeaderText="CON.#" Visible="False">
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="StyleNumber" HeaderText="STYLE#" />
                <asp:BoundField DataField="StyleDescription" HeaderText="DESCRIPTION" />
                <asp:BoundField DataField="Quantity" HeaderText="QTY">
                    <ItemStyle Font-Bold="True" HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="SRP" HeaderText="SRP" DataFormatString="{0:###,###.00}">
                    <ItemStyle Font-Bold="True" HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="TtlAmount" HeaderText="TOTAL AMT" DataFormatString="{0:###,###.00}">
                    <ItemStyle Font-Bold="True" HorizontalAlign="Right" />
                </asp:BoundField>
            </Columns>
        </asp:GridView>
        <asp:Panel ID="pnlSummary" runat="server">
            <table style="">
                <tr>
                    <td style="text-align: right;">
                        TOTAL QTY:
                    </td>
                    <td>
                        <asp:Label ID="lblTotalQtyStyles" runat="server" Text="Label" Font-Bold="True"></asp:Label>
                    </td>
                    <td>
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td style="text-align: right;">
                        TOTAL AMOUNT:
                    </td>
                    <td>
                        <asp:Label ID="lblTotalAmount" runat="server" Text="Label" Font-Bold="True"></asp:Label>
                    </td>
                    <td>
                        &nbsp;
                    </td>
                </tr>
            </table>
        </asp:Panel>
    </div>
    <div style="font-family: Arial; font-size: 10px; margin-top: 15px;">
        <asp:Panel ID="pnlForwarder" Visible="false" Style="margin-bottom: 10px;" runat="server">
            We authorized <span style="font-weight: bold;">
                <asp:Label ID="lblForwarder" runat="server" Text=""></asp:Label></span> Trucking
            to pullout the said items:
        </asp:Panel>
        <div id="divSignatory">
            <div style="padding-left: 30px;">
                Our <span style="font-weight: bold;">
                    <asp:Label ID="lblCompanyName" runat="server" Text=""></asp:Label></span> personnel
                was given authority to pullout the said items:
            </div>
            <div style="padding-left: 30px;">
                <br />
                <span style="margin-right: 100px;">NAME:</span> <span style="margin-right: 20px;">SIGNATURE</span>
                <span style="margin-right: 100px;">NAME:</span> <span style="margin-right: 30px;">SIGNATURE</span>
                <span style="margin-right: 100px;">NAME:</span> <span>SIGNATURE</span>
            </div>
            <img src="../../Resources/Signatory.jpg" alt="" style="height: 102px; width: 671px" />
        </div>
    </div>
    <div style="margin-top: 20px; font-family: Arial; font-size: 11px;">
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
                <td style="height: 10px;">
                </td>
                <td>
                </td>
                <td>
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
    <div style="margin-top: 15px; font-family: Arial; font-size: 10px;">
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
                    <div style="width: 180px; height: 40px; margin-right: 10px; margin-top: 5px;">
                        <span style="font-weight: bold;">
                            <asp:Label ID="lblBrandGeneralManager" Text="Set Brand Manager" runat="server" />
                            <asp:HoverMenuExtender ID="lblBrandGeneralManager_HoverMenuExtender" runat="server" DynamicServicePath=""
                                Enabled="True" TargetControlID="lblBrandGeneralManager" PopupControlID="pnlBrandGenManager" PopupPosition="Right">
                            </asp:HoverMenuExtender>
                            <asp:Panel ID="pnlBrandGenManager" runat="server">
                                <asp:Button ID="btnUpdateBrandGenManager" CssClass="btnUpdate" Height="18px" title="edit"
                                    runat="server" Text="" />
                                <asp:ModalPopupExtender ID="btnUpdateBrandGenManager_ModalPopupExtender" runat="server" DynamicServicePath=""
                                    Enabled="True" TargetControlID="btnUpdateBrandGenManager" PopupControlID="pnlBrandGenManagerModal"
                                    CancelControlID="btnCancelUpdateBrandGenManager" BackgroundCssClass="bgModal">
                                </asp:ModalPopupExtender>
                            </asp:Panel>
                        </span>

                          <asp:Panel ID="pnlBrandGenManagerModal" CssClass="modal" runat="server">
                            <asp:Panel ID="pnlBrandGenManagerModalDrag" CssClass="modalDrag" runat="server">
                            </asp:Panel>
                            <div style="padding: 5px; text-align: center;" class="modalLabel">
                                Brand General Manager:
                                <br />
                                <asp:TextBox ID="txtBrandGeneralManager" Width="300px" CssClass="modalText" Height="22px"
                                    runat="server"></asp:TextBox>
                            </div>
                            <div style="margin: 5px; text-align: center;">
                                <asp:Button ID="btnUpdateBrandGenManagerSave" Height="25px" CssClass="btnSave" runat="server"
                                    Text="update" onclick="btnUpdateBrandGenManagerSave_Click"  />
                                <asp:Button ID="btnCancelUpdateBrandGenManager" Height="25px" Width="60px" CssClass="btnCancel"
                                    runat="server" Text="cancel" />
                            </div>
                        </asp:Panel>

                        <br />
                        <span style="font-style: italic; border-top: 1px Solid black;">Brand General Manager</span>
                    </div>
                </td>
                <td>
                    <div style="width: 180px; height: 40px; margin-right: 10px; margin-top: 5px;">
                        <span></span>
                        <br />
                        <span style="font-style: italic; border-top: 1px Solid black;">Department Manager</span>
                    </div>
                </td>
                <td>
                    <div style="width: 180px; height: 40px; margin-right: 10px; margin-top: 5px;">
                        <span></span>
                        <br />
                        <span style="font-style: italic; border-top: 1px Solid black;">SC Whse. Supervisor/
                        </span>
                        <br />
                        <span style="font-style: italic;">RDU Supervisor </span>
                    </div>
                </td>
                <td>
                    <div style="width: 180px; height: 40px; margin-right: 10px; margin-top: 5px;">
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
        </table>
    </div>
    <div style="margin-top:10px; font-family: Arial;  font-size: 11px;">
        <asp:Panel ID="pnlCut" runat="server">
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
        </asp:Panel>
      
    </div>
    <div style="margin:5px 20px 1px 450px; font-family: Arial; font-size: 10px;">
        Approved by:
        <br />
        <div style="margin-top: 15px; padding-left: 30px; border-top: 1px Solid #000; width: 150px;">
            <span style="font-size: 10px;">ACCTG. DEPARTMENT</span>
        </div>
    </div>
    <div style="font-family: Arial; font-size: 10px;">
        cc: ACTG, WH, File, Promo
    </div>
    <div style="text-align: center;">
        <input id="btnHideSignatory" type="button" class="btnDelete" value="Hide Signatures" />
        <input id="btnShowSignatory" type="button" class="btnDelete" value="Show Signatures" />

         <input id="btnShowLogo" type="button" class="btnDelete" value="Show Header" />
        <input id="btnHideLogo" type="button" class="btnDelete" value="Hide Header" />

        <input id="btnPrint" type="button" class="btnPrint" onclick="window.print()" value="PRINT" />
        <asp:HyperLink ID="hpLinkPreviewDetails" Visible="false" Target="_blank" Height="23px"
            Style="line-height: 23px; padding-right: 5px;" CssClass="btnPrint" runat="server">VIEW DETAILS</asp:HyperLink>
        <input id="btnCloseWindow" type="button" class="btnDelete" value="CLOSE" />
    </div>
    </form>
</body>
</html>
