<%@ Page Title="" Language="C#" MasterPageFile="~/Marketing/Marketing.Master" AutoEventWireup="true"
    CodeBehind="NewTransfer.aspx.cs" Inherits="IntegratedResourceManagementSystem.Marketing.NewTransfer" %>

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
        function SelectAll1(frmId, id) {
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
        <img src="../Resources/memo-doc.png" alt="" height="28px" align="left" />
        New Transfer
        <div style="float: right; height: 24px;">
            <a href="TransferManagementPanel.aspx">
                <img alt="BACK" src="../Resources/reply.png" alt="BACK" /></a>
        </div>
    </div>
    <asp:UpdatePanel ID="upnlStockTransfer" runat="server">
        <ContentTemplate>
            <div style="min-height: 450px;">
                <div class="titleForm" style="height: 12px;">
                    NEW STOCK TRANSFER
                </div>
                <div>
                    <div  class="form" style="float: left;">
                        <table style="">
                            <tr>
                                <td class="modalLabel">
                                    PULL OUT LETTER SERIES#:
                                </td>
                                <td>
                                    <asp:TextBox ID="txtPOLSeriesNumber" CssClass="modalText" Height="22px" Width="200px" runat="server"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:UpdateProgress ID="uprogressGenerator" runat="server" AssociatedUpdatePanelID="upnlStockTransfer">
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
                                    FROM CUSTOMER NAME:
                                </td>
                                <td>
                                    <asp:TextBox CssClass="modalText" Height="22px" Width="300px" ID="txtFromCustomer"
                                        runat="server"></asp:TextBox>
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td class="modalLabel">
                                   ACCOUNT NAME:</td>
                                <td>
                                   <asp:TextBox CssClass="modalText" Height="22px" Width="300px" ID="txtAccountName"
                                        runat="server"></asp:TextBox>
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td class="modalLabel">
                                    BRANCH NAME:</td>
                                <td>
                                 <asp:TextBox CssClass="modalText" Height="22px" Width="200px" ID="txtBranchName"
                                        runat="server"></asp:TextBox>
                                </td>
                                <td>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div  class="form" style="float: left; margin-left:5px;">
                        <table style="">
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
                                <td class="modalLabel">
                                  TO CUSTOMER:
                                </td>
                                <td>
                                     <asp:TextBox CssClass="modalText" Height="22px" Width="300px" ID="txtToCustomer"
                                        runat="server"></asp:TextBox> <asp:Button ID="btnBrowseToCustomer" runat="server" CssClass="btnFilter" Text="browse..." />
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
                        </table>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
