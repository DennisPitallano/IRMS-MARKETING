<%@ Page Title="" Language="C#" MasterPageFile="~/Marketing/Marketing-Admin/Admin.Master" AutoEventWireup="true" CodeBehind="SendMessage.aspx.cs" Inherits="IntegratedResourceManagementSystem.Marketing.Marketing_Admin.SendMessage" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit.HTMLEditor"
    TagPrefix="cc1" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<asp:Content ID="HeadContent" ContentPlaceHolderID="head" runat="server">
    <link href="Styles/mail.css" rel="stylesheet" type="text/css" />
    <link href="../../Styles/modal-controls.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
<div >

    <div style="margin-bottom:5px;">
        <label for="MainContent_txtTo" class="modalLabel">TO:</label>   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:TextBox Width="370px" ID="txtTo" CssClass="modalText" Height="20px" runat="server"></asp:TextBox>
    </div>
   <div style="margin-bottom:10px;">
    <label for="MainContent_txtSubject" class="modalLabel">SUBJECT:</label>   
    <asp:TextBox Width="370px" CssClass="modalText" Height="20px" ID="txtSubject" runat="server"></asp:TextBox>
   </div>
    <div  style="margin-bottom:5px;">   
    <cc1:Editor ID="messageEditor"  Width="450px" runat="server"  />
    </div>
    <div style="margin-top:10px;">
        <asp:Button ID="btnSend" runat="server" CssClass="btnSend" Text="SEND" 
            onclick="btnSend_Click" />
       <a style="text-decoration:none;" href="Users.aspx" ><input id="btnCancel" type="button" value="BACK TO LIST" class="btnBackToList" /></a>
        <asp:HiddenField ID="hfMessageSent" runat="server" />
        <asp:ModalPopupExtender ID="hfMessageSent_ModalPopupExtender" runat="server" 
            DynamicServicePath="" Enabled="True" TargetControlID="hfMessageSent" 
            CancelControlID="btnOk" PopupControlID="pnlMessageSent" 
            PopupDragHandleControlID="pnlMessageSentDrag">
        </asp:ModalPopupExtender>
        <asp:Panel ID="pnlMessageSent" runat="server" CssClass="modal" >
            <asp:Panel ID="pnlMessageSentDrag" runat="server" CssClass="modalDrag" >
                <div class="sizeLogo">
                    <img src="../../Resources/mail_read.png" align="top" />
                    MESSAGE
                </div>
            </asp:Panel>
            <div class="modalLabel" style="text-align:center; margin:10px; font-size:12px;">
                Message Sent!
            </div>
            <div style="margin:5px; text-align:center;">
                <asp:Button ID="btnOk" CssClass="modalWarningButtonYes" runat="server" Text="OK" />
            </div>
        </asp:Panel>
    </div>
</div>
</asp:Content>
