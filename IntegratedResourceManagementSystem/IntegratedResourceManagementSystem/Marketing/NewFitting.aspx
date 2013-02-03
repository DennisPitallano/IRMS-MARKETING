<%@ Page Title="" Language="C#" MasterPageFile="~/Marketing/Marketing.Master" AutoEventWireup="true" CodeBehind="NewFitting.aspx.cs" Inherits="IntegratedResourceManagementSystem.Marketing.NewFitting" %>
<%@ Register Src="~/Marketing/forms/FFitting.ascx" TagName="FITTING" TagPrefix="IRMS" %>
<%@ Register Src="~/Marketing/forms/FSubFitting.ascx" TagName="SUBFITTING" TagPrefix="IRMS" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<asp:Content ID="HeadContent" ContentPlaceHolderID="head" runat="server">
    <link href="../Styles/fitting-form.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
<div>
<div class="titleList"></div>
    <asp:UpdatePanel ID="upnlFitting" runat="server">
        <ContentTemplate>
        <div class="fitting-form">
        <asp:HiddenField ID="hfCODE" runat="server" />
        <IRMS:FITTING ID="fFitting" runat="server" />
        <div style="margin:5px; text-align:center;">
           
        </div>
       <asp:Panel ID="pnlSubFitting"  runat="server">
        <div class="modalDrag">
           <label class="input-form-label" > SUB-FITTING LIST </label><asp:Button ID="btnAddNewSubFitting" CssClass="btnAddSubFitting" title="Add SubFitting" runat="server" 
            Font-Bold="true" Height="22px" Font-Size="12px" Text="+" />
            <asp:ModalPopupExtender ID="btnAddNewSubFitting_ModalPopupExtender" 
                runat="server" CancelControlID="btnAddSubFittingCancel" DynamicServicePath="" 
                Enabled="True" PopupControlID="pnlNewSubFittingModal" 
                PopupDragHandleControlID="pnlNewSubFittingModalDrag" 
                TargetControlID="btnAddNewSubFitting">
            </asp:ModalPopupExtender>
            <asp:Button ID="btnDelete" CssClass="btnAddSubFitting" title="Delete Selected" runat="server" 
            Font-Bold="true" Height="22px" Font-Size="12px" Text="-" 
                onclick="btnDelete_Click" />
        </div>
        <div>
            <asp:GridView ID="gvSubFittings" runat="server" 
                BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" 
                CellPadding="2" ForeColor="Black" GridLines="None" 
                AutoGenerateColumns="False" Font-Names="Verdana" Font-Size="10px">
                <AlternatingRowStyle BackColor="PaleGoldenrod" />
                <Columns>
                    <asp:BoundField DataField="SubFittingDesc" HeaderText="SUB FITTING DESC" />
                    <asp:BoundField DataField="DateRecorded" HeaderText="DATE RECORDED" />
                    <asp:CommandField ShowSelectButton="True" />
                </Columns>
                <FooterStyle BackColor="Tan" />
                <HeaderStyle BackColor="Tan" Font-Bold="True" />
                <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" 
                    HorizontalAlign="Center" />
                <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
                <SortedAscendingCellStyle BackColor="#FAFAE7" />
                <SortedAscendingHeaderStyle BackColor="#DAC09E" />
                <SortedDescendingCellStyle BackColor="#E1DB9C" />
                <SortedDescendingHeaderStyle BackColor="#C2A47B" />
            </asp:GridView>
        </div>
       </asp:Panel>
       <div style="margin-top:10px; text-align:center;">
           <asp:Button ID="btnSave" CssClass="btnSave" runat="server" Text="SAVE" />
           <asp:ModalPopupExtender ID="btnSave_ModalPopupExtender" runat="server" 
               CancelControlID="btnNo" DynamicServicePath="" Enabled="True" 
               PopupControlID="pnlConfirmSaveModal" 
               PopupDragHandleControlID="pnlConfirmSaveModalDrag" TargetControlID="btnSave">
           </asp:ModalPopupExtender>
           <a href="FittingsManagementPanel.aspx" title="CANCEL" >
               <input id="btnCancel" type="button" class="btnCancel" value="CANCEL" />
           </a>
       </div>
    </div>
    <asp:Panel ID="pnlNewSubFittingModal" CssClass="modal" runat="server">
        <asp:Panel ID="pnlNewSubFittingModalDrag" CssClass="modalDrag" runat="server">
            <div class="sizeLogo">
                <img src="../Resources/fit.png" height="16px" align="top" />
                NEW SUB FITTING
            </div>
        </asp:Panel>
            <div>
            <table >
                <tr>
                    <td>
                    <label class="input-form-label" for="MainContent_txtSubFitting">SUB-FITTING DESC:</label>
                    </td>
                    <td>
                      <asp:TextBox ID="txtSubFitting" runat="server" CssClass="modalText" TextMode="MultiLine" Width="200px" Height="35px"></asp:TextBox>
                    </td>
                </tr>
            </table>
            </div>
            <div style ="margin:5px; text-align:center;">
                <asp:Button ID="btnAddSubFitting" CssClass="btnSave" runat="server" Text="ADD" 
                    onclick="btnAddSubFitting_Click" />
                <asp:Button ID="btnAddSubFittingCancel" CssClass="btnCancel" runat="server" Text="CANCEL" />
            </div>
    </asp:Panel>

    <asp:Panel ID="pnlConfirmSaveModal" CssClass="modal" runat="server">
        <asp:Panel ID="pnlConfirmSaveModalDrag" CssClass="modalDrag" runat="server" >
            <div class="sizeLogo">
                <img src="../Resources/fit.png" height="16px" align="top" />
                CONFIRMATION!!!
            </div>
        </asp:Panel>
        <div style="margin:10px 5px 5px 5px;">
            <img src="../Resources/question.png" align="middle" />
             <label class="input-form-label" style="font-size:12px;">Are you sure you want to save this data?</label>
        </div>
        <div style=" margin:5px; text-align:center;" >
            <asp:Button ID="btnYes" CssClass="modalWarningButtonYes" runat="server" 
                Text="YES" onclick="btnYes_Click" />
             <asp:Button ID="btnNo" CssClass="modalWarningButtonNo" runat="server" Text="NO" />
        </div>
    </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>
    
</div>
</asp:Content>
