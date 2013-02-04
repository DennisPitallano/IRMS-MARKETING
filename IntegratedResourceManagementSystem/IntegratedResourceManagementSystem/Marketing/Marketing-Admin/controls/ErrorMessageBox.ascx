<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ErrorMessageBox.ascx.cs" Inherits="IntegratedResourceManagementSystem.Marketing.Marketing_Admin.controls.ErrorMessageBox" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
  <link href="../../../Styles/marketing-item-master.css" rel="stylesheet" type="text/css" />
  <style type ="text/css">
    .frmbg
    {
        background-color: #C9C9C9;
        background-image: -webkit-gradient(linear, left top, left bottom, from(#c9c9c9), to(#848484), color-stop(0.6, #a1a1a1));
        background-image : -moz-linear-gradient(top, #c9c9c9, #848484, #a1a1a1 90%);
    }
</style>
    <table class ="frmbg" style="width: 100%;">
      
      <tr>
        <td class ="modalLabel">
        
        </td>
        <td>
            <asp:Label ID="lblErrorMessage" runat="server" Text="Label" 
                Font-Names="Verdana" Font-Size="12px" ForeColor="#FF3300" Height="50px"></asp:Label></td>
        <td>
          &nbsp;
        </td>
      </tr>
</table>