<%@ Page Title="" Language="C#" MasterPageFile="~/Marketing/Marketing-Admin/Admin.Master"
    AutoEventWireup="true" CodeBehind="NewUserAccount.aspx.cs" Inherits="IntegratedResourceManagementSystem.Marketing.Marketing_Admin.NewUserAccount" %>

<%@ Register Src="~/Marketing/Marketing-Admin/controls/AdminMenu.ascx" TagName="menu"
    TagPrefix="irms" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Src="~/Marketing/controls/UCLoader.ascx" TagName="LOADER" TagPrefix="UC" %>
<asp:Content ID="HeadContent" ContentPlaceHolderID="head" runat="server">
    <link href="Styles/new-user-account.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <%--<div class="menu_container">
        <irms:menu ID="admin_menu" runat="server" />
    </div>--%>
    <div class="panelTitle">
        <img alt="USERS" src="../../Resources/users.png" height="28px" align="top" />
        &nbsp;Add New User Account
        <div style="float: right;">
            <a href="UserManagementPanel.aspx">
                <img alt="BACK" src="../../Resources/reply.png" title="BACK" />
            </a>
        </div>
    </div>
    <%-- <asp:UpdatePanel ID="upnlNewUserAccount" runat="server">
        <ContentTemplate>--%>
    <div class="form">
        <div style="height: 10px;" class="modalDrag">
        <asp:HiddenField ID="hfUserID" runat="server" />
        </div>
        <table style="width: 100%;">
            <tr>
                <td class="frmLabel">
                    <label for="MainContent_txtFullName">
                        FULL NAME:</label>
                </td>
                <td>
                    <asp:TextBox CssClass="modalText" Height="20px" Font-Size="12px" ID="txtFullName"
                        runat="server" Width="300px"></asp:TextBox>
                </td>
            </tr>

            <tr>
                <td class="frmLabel">
                GENDER:
                </td>
                <td>
                    <asp:RadioButtonList CssClass="modalText" ID="rdioGender" runat="server">
                        <asp:ListItem>Male</asp:ListItem>
                        <asp:ListItem>Female</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
            </tr>
            <tr>
                <td class="frmLabel">
                    <label for="MainContent_txtUserName">
                        USER NAME:</label>
                </td>
                <td>
                    <asp:TextBox ID="txtUserName" CssClass="modalText" Height="20px" Font-Size="12px"
                        Width="200px" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="frmLabel">
                    <label for="MainContent_txtPassword">
                        SET TEMP. PASSWORD:</label>
                </td>
                <td>
                    <asp:TextBox ID="txtPassword" CssClass="modalText" Height="20px" Font-Size="12px"
                      Width="200px" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="frmLabel">
                    <label for="MainContent_txtEmailAddress">
                        EMAIL ADDRESS:</label>
                </td>
                <td>
                    <asp:TextBox ID="txtEmailAddress" CssClass="modalText" Height="20px" Font-Size="12px"
                      Width="200px" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="frmLabel">
                    <label for="MainContent_txtContactNumber">
                        CONTACT #:</label>
                </td>
                <td>
                    <asp:TextBox ID="txtContactNumber" CssClass="modalText" Height="20px" Font-Size="12px"
                       Width="200px" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="frmLabel">
                    <label for="MainContent_lboxUserLevel">
                        USER LEVEL:</label>
                </td>
                <td>
                    <asp:ListBox ID="lboxUserLevel" CssClass="modalText" Width="120px" runat="server"
                        DataSourceID="SqlDataSourceUserLevel" DataTextField="ListDesc" DataValueField="ID"
                        AutoPostBack="True" OnSelectedIndexChanged="lboxUserLevel_SelectedIndexChanged">
                    </asp:ListBox>
                    <asp:SqlDataSource ID="SqlDataSourceUserLevel" runat="server" ConnectionString="<%$ ConnectionStrings:IRMSConnectionString %>"
                        EnableCaching="true" SelectCommand="SELECT * FROM [lstUserLevel]"></asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td class="frmLabel">
                    DEPARTMENT:
                </td>
              
                <td>
                    <asp:DropDownList Height="20px" CssClass="modalText" ID="DDLDepartments" runat="server">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="frmLabel">
                    <label for="MainContent_chkBoxAccessGrant">
                        ACCESS GRANT:</label>
                </td>
                <td>
                    <asp:CheckBoxList CssClass="modalText access-grants" ID="chkBoxAccessGrant" runat="server">
                        <asp:ListItem Value="CAN INSERT">CAN ADD</asp:ListItem>
                        <asp:ListItem Value="CAN UPDATE">CAN UPDATE</asp:ListItem>
                        <asp:ListItem Value="CAN DELETE">CAN DELETE</asp:ListItem>
                        <asp:ListItem Value="CAN APPROVE">CAN APPROVE</asp:ListItem>
                    </asp:CheckBoxList>
                </td>
            </tr>
            <tr>
                <td valign="top" class="frmLabel">
                    <label for="MainContent_fUploadAvatar">
                        AVATAR:</label>
                </td>
                <td>
                    <div class="modalText" style="border: 2px Solid #6B5F14; margin: 2px 2px 5px 2px; padding: 2px; border-radius: 5px;
                        height: 102px; width: 104px; text-align: center;">
                        <asp:Image ID="imgAvatar" runat="server" Height="100px" Width="100px" />
                    </div>
                    <asp:FileUpload ID="fUploadAvatar" CssClass="btnBrowse" runat="server" />
                    <asp:Button ID="btnpload" CssClass="btnUpload" runat="server" Text="upload" 
                        onclick="btnpload_Click" />
                    <br />
                    <asp:Label ID="label" runat="server" Text=""></asp:Label>
                    <asp:HiddenField ID="hfAvatarFileName" runat="server" />
                </td>
            </tr>
        </table>
        <div style="text-align: center; margin: 10px;">
            <asp:Button ID="btnSave" ToolTip="Save User Account" CssClass="btnSave" runat="server"
                Text="SAVE" />
            <asp:ModalPopupExtender ID="btnSave_ModalPopupExtender" runat="server" 
                CancelControlID="btnNo" DynamicServicePath="" Enabled="True" 
                PopupControlID="pnlSaveConfirmationModal" 
                PopupDragHandleControlID="pnlSaveConfirmationModalDrag" 
                TargetControlID="btnSave">
            </asp:ModalPopupExtender>
            <a style="text-decoration: none;" href="UserManagementPanel.aspx">
                <input id="btnCancel" title="Back to List" style="width:110px;" class="btnCancel" type="button" value="BACK TO LIST" />
            </a>
            <asp:Label ID="lblSuccessModalHandler" runat="server" Text=""></asp:Label>
            <asp:ModalPopupExtender ID="lblSuccessModalHandler_ModalPopupExtender" 
                runat="server" DynamicServicePath="" Enabled="True" 
                TargetControlID="lblSuccessModalHandler" CancelControlID="btnOK" 
                PopupControlID="pnlSaveSuccessfulModal" 
                PopupDragHandleControlID="pnlSaveSuccessfulModalDrag">

            </asp:ModalPopupExtender>
            <asp:Label ID="lblErrorModalHandler" runat="server" Text=""></asp:Label>
            <asp:ModalPopupExtender ID="lblErrorModalHandler_ModalPopupExtender" 
                runat="server" DynamicServicePath="" Enabled="True" 
                PopupControlID="pnlErrorMessageModal" 
                PopupDragHandleControlID="pnlErrorMessageModalDrag" 
                TargetControlID="lblErrorModalHandler" CancelControlID="btnErrorOK">
            </asp:ModalPopupExtender>
        </div>
    </div>
    <asp:Panel ID="pnlSaveConfirmationModal" runat="server" CssClass="modal">
        <asp:Panel ID="pnlSaveConfirmationModalDrag" runat="server" CssClass="modalDrag">
            <div class="sizeLogo">
                <img alt="new brand" src="../../Resources/question.png" height="16" align="top" />
                CONFIRMATION!!!
            </div>
        </asp:Panel>
       
        <div style="text-align: center; margin:10px; font-family: Verdana; font-size: 12px;">
        <img src="../../Resources/question.png" align="middle" />
            <asp:Label CssClass="modalLabel" ID="lblTermToDelete" runat="server" Text="Are you sure you want to save this data?"></asp:Label>
        </div>
        <div style="text-align: center; margin: 5px 0px;">
            <asp:Button ID="btnYes" runat="server" Text="YES" CssClass="modalWarningButtonYes"
                ToolTip="Delete" onclick="btnYes_Click" />
            <asp:Button ID="btnNo" runat="server" Text="NO" CssClass="modalWarningButtonNo" ToolTip="Cancel"
                 />
        </div>
    </asp:Panel>

    <asp:Panel ID="pnlSaveSuccessfulModal" runat="server" CssClass="modal">
        <asp:Panel ID="pnlSaveSuccessfulModalDrag" runat="server" CssClass="modalDrag">
            <div class="sizeLogo">
                <img alt="new brand" src="../../Resources/info.png" height="16" align="top" />
                CONFIRMATION!!!
            </div>
        </asp:Panel>
       
        <div style="text-align: center; margin:10px; font-family: Verdana; font-size: 12px;">
        <img src="../../Resources/info.png" align="middle" />
            <asp:Label CssClass="modalLabel" ID="Label1" runat="server" Text="New Account Successfully saved!"></asp:Label>
        </div>
        <div style="text-align: center; margin: 5px 0px;">
            <asp:Button ID="btnOK" runat="server" Text="OK" CssClass="modalWarningButtonYes"
                ToolTip="OK" />
        </div>
    </asp:Panel>

     <asp:Panel ID="pnlErrorMessageModal" runat="server" CssClass="modal">
        <asp:Panel ID="pnlErrorMessageModalDrag" runat="server" CssClass="modalDrag">
            <div class="sizeLogo">
                <img alt="new brand" src="../../Resources/error.png" height="16" align="top" />
                ERROR!!!
            </div>
        </asp:Panel>
       
        <div style="text-align: center; margin:10px; font-family: Verdana; font-size: 12px;">
        <img src="../../Resources/error.png" align="middle" />
            <asp:Label CssClass="modalLabel" ID="lblErrorMessage" runat="server" Text="Error!"></asp:Label>
        </div>
        <div style="text-align: center; margin: 5px 0px;">
            <asp:Button ID="btnErrorOK" runat="server" Text="OK" CssClass="modalWarningButtonYes"
                ToolTip="Ok" />
        </div>
    </asp:Panel>

    <%--      </ContentTemplate>
    </asp:UpdatePanel>--%>
</asp:Content>
