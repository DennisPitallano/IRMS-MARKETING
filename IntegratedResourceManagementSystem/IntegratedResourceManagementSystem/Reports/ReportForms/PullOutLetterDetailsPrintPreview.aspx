<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PullOutLetterDetailsPrintPreview.aspx.cs"
    Inherits="IntegratedResourceManagementSystem.Reports.ReportForms.PullOutLetterDetailsPrintPreview" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>PULL OUT LETTER DETAILS</title>
    <link href="../../Styles/modal-controls.css" rel="stylesheet" type="text/css" />
    <link href="../../Styles/toolbar-controls.css" rel="stylesheet" type="text/css" />
    <script src="../../Scripts/jquery-1.7.2.min.js" type="text/javascript"></script>
    <style type="text/css">
        #gvBoxContainerDetails, #gvContainers, #gvDetails
        {
            font-family: Arial;
            font-size: 10px;
        }
        #gvBoxContainerDetails th
        {
            cursor: pointer;
            padding: 3px 5px 2px 5px;
        }
        #gvBoxContainerDetails tr td
        {
            padding: 2px 3px 1px 3px;
        }
        
        #gvDetails th
        {
            cursor: pointer;
            padding: 3px 5px 2px 5px;
        }
        #gvDetails tr td
        {
            padding: 2px 3px 1px 3px;
        }
    </style>
    <style type="text/css" media="print">
        #dBoxes
        {
            visibility: collapse;
        }
    </style>
    <script type="text/javascript">
        $(document).ready(function () {
            $('#gvBoxContainerDetails').delegate('th', 'click', function () {
                var index = this.cellIndex;
                $(this).closest('#gvBoxContainerDetails').find('tr').each(function () {
                    this.removeChild(this.cells[index]);
                });
            });


            $("#btnShowSummary").hide("fast");

            $("#btnHideSummary").click(function () {
                $("#divSum").hide("slow");
                $(this).hide("fast");
                $("#btnShowSummary").show("fast");
            });

            $("#btnShowSummary").click(function () {
                $("#divSum").show("slow");
                $(this).hide("fast");
                $("#btnHideSummary").show("fast");
            });
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
  
            <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
            </asp:ToolkitScriptManager>
            <div id="dBoxes" style="float: left; margin-right: 10px;">
                <asp:HiddenField ID="hfPullOutCode" runat="server" />
                <asp:GridView ID="gvContainers" CssClass="table_grid" runat="server" AutoGenerateColumns="False"
                    CellPadding="4" ForeColor="#333333" GridLines="None" DataKeyNames="BoxNumber"
                    OnSelectedIndexChanged="gvContainers_SelectedIndexChanged">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:TemplateField ShowHeader="False">
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Select"
                                    Text="">
                                    <asp:Image ID="imgContainer" ImageUrl='<%# Eval("ImageUrl") %>' runat="server" />
                                </asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="BoxNumber" HeaderText="BOX #" />
                    </Columns>
                    <EditRowStyle BackColor="#999999" />
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#E9E7E2" />
                    <SortedAscendingHeaderStyle BackColor="#506C8C" />
                    <SortedDescendingCellStyle BackColor="#FFFDF8" />
                    <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                </asp:GridView>
                <div class="modalLabel" style="text-align: left;">
                    Template
                    <asp:RadioButtonList ID="rdioTemplate" CssClass="modalText" Font-Size="10px" Font-Bold="true"
                        runat="server" OnSelectedIndexChanged="rdioTemplate_SelectedIndexChanged" AutoPostBack="True">
                        <asp:ListItem Selected="True">Details &amp; Sum</asp:ListItem>
                        <asp:ListItem>Details</asp:ListItem>
                    </asp:RadioButtonList>
                </div>
                <div style="margin:5px; height:28px;">
                    <input id="btnShowSummary" type="button" class="btnDelete" value="Show Summary" />
                    <input id="btnHideSummary" type="button" class="btnDelete" value="Hide Summary" />
                </div>
                <div style="margin: 5px;">
                    <input id="Button1" class="btnPrint" type="button" onclick="window.print()" value="PRINT" />
                </div>
            </div>
            <div style="float: left; margin-left: 20px;">
                <div style="font-family: Arial;">
                    <table style="width: 100%; font-size: 10px; font-weight: bold;">
                        <tr>
                            <td style="text-align: center;" colspan="3">
                                <asp:Image ID="imgLogo" ImageUrl="~/Resources/multitrends-logo.png" runat="server" />
                                <asp:HoverMenuExtender ID="imgLogo_HoverMenuExtender" runat="server" DynamicServicePath=""
                                    Enabled="True" TargetControlID="imgLogo" PopupControlID="pnlChangeToMenu" PopupPosition="Right">
                                </asp:HoverMenuExtender>
                                <asp:Panel ID="pnlChangeToMenu" runat="server">
                                    <asp:Button ID="btnChangeLogo" CssClass="btnUpdate" Height="18px" title="edit" runat="server"
                                        Text="" />
                                    <asp:ModalPopupExtender ID="btnChangeLogo_ModalPopupExtender" runat="server" DynamicServicePath=""
                                        Enabled="True" TargetControlID="btnChangeLogo" PopupControlID="pnlChangeToModal"
                                        CancelControlID="btnCancelChangeTo" BackgroundCssClass="bgModal" PopupDragHandleControlID="Panel1">
                                    </asp:ModalPopupExtender>
                                </asp:Panel>
                                <asp:Panel ID="pnlChangeToModal" CssClass="modal" runat="server">
                                    <asp:Panel ID="Panel1" CssClass="modalDrag" runat="server">
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
                                                    <asp:image  imageurl='<%# "~/Marketing/Marketing-Admin/company-logos/"+Eval("Logo") %>' runat="server" />
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
                                        <asp:Button ID="btnUpdateTo" CssClass="modalWarningButtonYes" runat="server" Text="OK" />
                                        <asp:Button ID="btnCancelChangeTo" Width="60px" CssClass="modalWarningButtonNo" runat="server"
                                            Text="NO" />
                                    </div>
                                </asp:Panel>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblCustomer" runat="server" Text="Label"></asp:Label>
                            </td>
                            <td>
                                &nbsp;
                            </td>
                            <td>
                                <asp:Label ID="lblseries" runat="server" Text="Label"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblBranch" runat="server" Text="Label"></asp:Label>
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
                <div style="text-align: center;">
                    <asp:GridView ID="gvBoxContainerDetails" CssClass="table_grid" runat="server" AutoGenerateColumns="False"
                        EnableViewState="False">
                        <Columns>
                            <asp:BoundField DataField="ContainerType">
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Right" />
                            </asp:BoundField>
                            <asp:BoundField DataField="ContainerNumber" HeaderText="Container #" DataFormatString="{0:###,###}"
                                Visible="False">
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="StyleNumber" HeaderText="Style #">
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="StyleDescription" HeaderText="Unit of Measurement">
                                <HeaderStyle Width="60px" />
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Quantity" HeaderText="Quantity">
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="SRP" DataFormatString="{0:###,###.##}" HeaderText="Unit Price">
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="TtlAmount" DataFormatString="{0:###,###.00}" HeaderText="Total Price">
                                <ItemStyle HorizontalAlign="Right" />
                            </asp:BoundField>
                            <asp:CheckBoxField DataField="IsLostTag" HeaderText="Lost Tag" Visible="False" />
                        </Columns>
                    </asp:GridView>
                    <asp:GridView ID="gvDetails" Visible="False" CssClass="table_grid" runat="server"
                        AutoGenerateColumns="False" EnableViewState="False">
                        <Columns>
                            <asp:BoundField DataField="ContainerNumber" HeaderText="Container #" DataFormatString="{0:###,###}"
                                Visible="False">
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="StyleNumber" HeaderText="Style #">
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="StyleDescription" HeaderText="Unit of Measurement">
                                <HeaderStyle Width="60px" />
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Quantity" HeaderText="Quantity">
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="SRP" DataFormatString="{0:###,###.##}" HeaderText="Unit Price">
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="TtlAmount" DataFormatString="{0:###,###.00}" HeaderText="Total Price">
                                <ItemStyle HorizontalAlign="Right" />
                            </asp:BoundField>
                            <asp:CheckBoxField DataField="IsLostTag" HeaderText="Lost Tag" Visible="False" />
                        </Columns>
                    </asp:GridView>
                </div>
                <div id="divSum" style="font-family: Arial; font-size: 10px; font-weight: bold; margin: 5px;">
                    <asp:Panel ID="pnlSummary" Visible="false" runat="server">
                        <table>
                            <tr>
                                <td style="text-align: right;">
                                    OVER ALL TOTAL QTY:
                                </td>
                                <td style="text-align: left;">
                                    <asp:Label ID="lblTotalQty" Text="total qty" runat="server" />
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align: right;">
                                    OVER ALL TOTAL PRICE:
                                </td>
                                <td style="text-align: left;">
                                    <asp:Label ID="lblTotalPrice" runat="server" Text="total price" />
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align: right;">
                                    <asp:Label ID="lblTotalContainerLabel" Text="TOTAL # OF CONTAINER:" runat="server" />  
                                </td>
                                <td style="text-align: left;">
                                    <asp:Label ID="lblTotalNumberOfContainer" runat="server" Text="total # of container" />
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                </div>
            </div>
      
    </form>
</body>
</html>
