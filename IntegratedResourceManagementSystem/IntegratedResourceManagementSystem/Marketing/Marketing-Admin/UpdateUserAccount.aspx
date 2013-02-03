<%@ Page Title="" Language="C#" MasterPageFile="~/Marketing/Marketing-Admin/Admin.Master"
    AutoEventWireup="true" CodeBehind="UpdateUserAccount.aspx.cs" Inherits="IntegratedResourceManagementSystem.Marketing.Marketing_Admin.UpdateUserAccount" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Src="~/Marketing/controls/UCLoader.ascx" TagName="LOADER" TagPrefix="UC" %>
<asp:Content ID="HeadContent" ContentPlaceHolderID="head" runat="server">
    <link href="Styles/new-user-account.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div style="height: 28px; margin-bottom: 10px; font-variant: small-caps; line-height: 28px;
        color: #333; text-shadow: 1px 1px 0px white;">
        <asp:Image ID="imgpnlTitle" runat="server" ImageUrl="~/Resources/users.png" ImageAlign="Top"
            Height="28px" />
        &nbsp;<asp:Label ID="Label1" runat="server" Text="Update User Account" Font-Bold="True"
            Font-Names="Verdana" Font-Size="18px"></asp:Label>
        <div style="float: right;">
            <a href="UserManagementPanel.aspx">
                <img src="../../Resources/reply.png" title="BACK" />
            </a>
        </div>
        <hr />
    </div>
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
                    <label for="MainContent_rdioGender">
                        GENDER:</label>
                </td>
                <td>
                    <asp:RadioButtonList ID="rdioGender" CssClass="modalText" runat="server">
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
                       Width="200px"  runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="frmLabel">
                    <label for="MainContent_txtPassword">
                        PASSWORD:</label>
                </td>
                <td>
                    <asp:TextBox ID="txtPassword" CssClass="modalText" Height="20px" Font-Size="12px"
                        Width="200px" runat="server" ></asp:TextBox>
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
                    <asp:DropDownList CssClass="modalText" Height="20px" ID="DDLDepartments" runat="server">
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
                    <div class="modalText" style="border: 2px Solid #6B5F14; margin:5px 2px;  padding: 2px; border-radius: 5px; height:102px;
                        width:104px; text-align: center;">
                        <asp:Image ID="imgAvatar" runat="server" Height="100px" Width="100px" />
                    </div>
                    <asp:FileUpload ID="fUploadAvatar" CssClass="btnBrowse" runat="server" />
                    <asp:Button ID="btnpload" CssClass="btnUpload" runat="server" Text="upload" OnClick="btnpload_Click" />
                    <br />
                    <asp:Label ID="label" runat="server" Text=""></asp:Label>
                    <asp:HiddenField ID="hfAvatarFileName" runat="server" />
                </td>
            </tr>
        </table>
        <div style="text-align: center; margin: 10px;">
            <asp:Button Width="75px" ID="btnSave" ToolTip="Update User Account" CssClass="btnSave"
                runat="server" Text="UPDATE" OnClick="btnSave_Click" />
            <a style="text-decoration: none;" href="UserManagementPanel.aspx">
                <input id="btnCancel" title="Back to List" class="btnBack" type="button" value="BACK TO LIST" />
            </a>
        </div>
    </div>
    <asp:Label ID="lblSuccessFull" runat="server" Text=""></asp:Label>
    <asp:ModalPopupExtender ID="lblSuccessFull_ModalPopupExtender" runat="server" DynamicServicePath=""
        Enabled="True" TargetControlID="lblSuccessFull" PopupControlID="pnlSaveSuccessful"
        PopupDragHandleControlID="pnlSaveSuccessfulDrag" CancelControlID="btnOK">
    </asp:ModalPopupExtender>
    <asp:Panel ID="pnlSaveSuccessful" runat="server" CssClass="modal">
        <asp:Panel ID="pnlSaveSuccessfulDrag" runat="server" CssClass="modalDrag">
            <div class="sizeLogo">
                <img alt="new color" src="../../Resources/user_roles_grant.png" height="16" align="top" />
                USER ACCOUNT
            </div>
        </asp:Panel>
        <div style="text-align: center; margin:10px; font-family: Verdana; font-size: 11px;  ">
            <asp:Label ID="lblMessageText" CssClass="frmLabel" runat="server" 
                Text="User Account updated!" Font-Names="Verdana"
                Font-Size="12px" ForeColor="#CC0000"></asp:Label>
        </div>
        <div style="text-align: center; margin: 5px 0px;">
            <asp:Button ID="btnOK" runat="server" Text="OK" CssClass="modalWarningButtonYes"
                ToolTip="Save" />
        </div>
    </asp:Panel>
</asp:Content>
