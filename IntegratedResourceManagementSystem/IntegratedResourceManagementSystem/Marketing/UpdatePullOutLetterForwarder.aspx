<%@ Page Title="" Language="C#" MasterPageFile="~/Marketing/Marketing.Master" AutoEventWireup="true"
    CodeBehind="UpdatePullOutLetterForwarder.aspx.cs" Inherits="IntegratedResourceManagementSystem.Marketing.UpdatePullOutLetterForwarder" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Src="~/Marketing/controls/UCLoader.ascx" TagName="LOADER" TagPrefix="UC" %>
<asp:Content ID="HeadContent" ContentPlaceHolderID="head" runat="server">
    <link href="../Styles/sm-pull-out-details.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div style="width:500px;">
        <div class="titleForm" style="height: 20px;">
           Assign Forwarder
        </div>
        <div class="form">
            <table >
              <tr>
                    <td class="modalLabel">
                       PULLOUT SERIES#:
                    </td>
                    <td >
                        <asp:Label ID="lblPullOutSeriesNumber" style="line-height:20px; padding:0px 2px 0px 2px;" CssClass="modalText" Height="20px" runat="server" Text="Label"></asp:Label>
                    </td>
                    <td>
                        &nbsp;
                    </td>
                </tr>
                 <tr>
                    <td class="modalLabel">
                       PULLOUT LETTER FOR:
                    </td>
                    <td >
                        <asp:Label ID="lblCustomer" style="line-height:20px; padding:0px 2px 0px 2px;" CssClass="modalText" Height="20px" runat="server" Text="Label"></asp:Label>
                    </td>
                    <td>
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td class="modalLabel">
                       FORWARDERS:
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlForwarders" CssClass="modalText" Height="22px" runat="server">
                        </asp:DropDownList>
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
                        <asp:Button ID="btnSave" CssClass="btnSave" runat="server" Text="SAVE" />
                        <asp:HyperLink ID="hpLinkBack" Height="16px" Width="100px" style="line-height:16px;" CssClass="btnCancel" runat="server">BACK TO LIST</asp:HyperLink>
                    </td>
                    <td>
                        &nbsp;
                    </td>
                </tr>
            </table>
        </div>
    </div>
</asp:Content>
