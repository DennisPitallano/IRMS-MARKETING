<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PullOutLetterSummaryPrintPreview.aspx.cs" Inherits="IntegratedResourceManagementSystem.Reports.ReportForms.PullOutLetterSummaryPrintPreview" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../../Styles/modal-controls.css" rel="stylesheet" type="text/css" />
    <link href="../../Styles/toolbar-controls.css" rel="stylesheet" type="text/css" />
    <script src="../../Scripts/jquery-1.7.2.min.js" type="text/javascript"></script>
      <style type="text/css">
        #gvSummaries
        {
            font-family: Arial;
            font-size: 11px;
        }
        #gvSummaries th
        {
            cursor: pointer;
            padding:3px 5px 2px 5px;
        }
        #gvSummaries tr td
        {
            padding:2px 5px 2px 5px;
        }
    </style>
     <style type="text/css" media="print">
        #btnPrint,#btnClose
        {
            visibility:hidden;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
     <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></asp:ToolkitScriptManager>
    <div>
     <div style="font-family:Arial;">
            <table style="width: 100%; font-size:10px; font-weight:bold;">
            <tr>
                <td>
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
                            <asp:GridView ID="gvCompanyLogos" runat="server" AutoGenerateColumns="False" 
                                DataSourceID="SqlDataSourceLogos" CellPadding="4" DataKeyNames="Logo" 
                                ForeColor="#333333" GridLines="None" 
                                onselectedindexchanged="gvCompanyLogos_SelectedIndexChanged">
                                <AlternatingRowStyle BackColor="White" />
                                <Columns>
                                    <asp:TemplateField ShowHeader="False">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" 
                                                CommandName="Select" Text="">
                                                    <asp:image ID="Image1"  imageurl='<%# "~/Marketing/Marketing-Admin/company-logos/"+Eval("Logo") %>' runat="server" />
                                            </asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="CompName" HeaderText="CompName" 
                                        SortExpression="CompName" />
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
                            <asp:SqlDataSource ID="SqlDataSourceLogos" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:IRMSConnectionString %>" 
                                SelectCommand="SELECT [Logo], [CompName] FROM [Company]">
                            </asp:SqlDataSource>
                        </div>
                        <div style="margin: 5px; text-align: center;">
                            <asp:Button ID="btnUpdateTo" CssClass="modalWarningButtonYes" runat="server" Text="OK"
                                 />
                            <asp:Button ID="btnCancelChangeTo" Width="60px" CssClass="modalWarningButtonNo"
                                runat="server" Text="NO" />
                        </div>
                    </asp:Panel>
                </td>
                 <td>
                </td>
                 <td>
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
        <div style="margin-top:10px;">
        <asp:GridView ID="gvSummaries"
                runat="server" AutoGenerateColumns="False">
            <Columns>
                <asp:BoundField DataField="ContainerType" >
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="ContainerNumber" HeaderText="CON. #" >
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="TotalQuantity" HeaderText="TOTAL QTY" 
                    DataFormatString="{0:###,###}" >
                <ItemStyle Font-Bold="True" HorizontalAlign="Right" />
                </asp:BoundField>
            </Columns>
        </asp:GridView>
        </div>
        <div style="font-family:Arial; font-size:10px; font-weight:bold; margin-top:20px;">
            <input id="btnPrint" type="button" value="PRINT" class="btnPrint" onclick="window.print()" />
            <input id="btnClose" type="button" value="CLOSE" class="btnDelete" onclick="window.close()" />
        </div>
    </div>
    </form>
</body>
</html>
