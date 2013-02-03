<%@ Page Title="" Language="C#" MasterPageFile="~/Marketing/Marketing.Master" AutoEventWireup="true"
    CodeBehind="ViewMessage.aspx.cs" Inherits="IntegratedResourceManagementSystem.Marketing.ViewMessage" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="HeadContent" ContentPlaceHolderID="head" runat="server">
    <link href="../Styles/modal-controls.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/toolbar-controls.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .msg-content
        {
            background: rgb(255,255,255); /* Old browsers */ /* IE9 SVG, needs conditional override of 'filter' to 'none' */
            background: url(data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiA/Pgo8c3ZnIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgd2lkdGg9IjEwMCUiIGhlaWdodD0iMTAwJSIgdmlld0JveD0iMCAwIDEgMSIgcHJlc2VydmVBc3BlY3RSYXRpbz0ibm9uZSI+CiAgPGxpbmVhckdyYWRpZW50IGlkPSJncmFkLXVjZ2ctZ2VuZXJhdGVkIiBncmFkaWVudFVuaXRzPSJ1c2VyU3BhY2VPblVzZSIgeDE9IjAlIiB5MT0iMCUiIHgyPSIwJSIgeTI9IjEwMCUiPgogICAgPHN0b3Agb2Zmc2V0PSIwJSIgc3RvcC1jb2xvcj0iI2ZmZmZmZiIgc3RvcC1vcGFjaXR5PSIxIi8+CiAgICA8c3RvcCBvZmZzZXQ9IjQ3JSIgc3RvcC1jb2xvcj0iI2Y2ZjZmNiIgc3RvcC1vcGFjaXR5PSIxIi8+CiAgICA8c3RvcCBvZmZzZXQ9IjEwMCUiIHN0b3AtY29sb3I9IiNlZGVkZWQiIHN0b3Atb3BhY2l0eT0iMSIvPgogIDwvbGluZWFyR3JhZGllbnQ+CiAgPHJlY3QgeD0iMCIgeT0iMCIgd2lkdGg9IjEiIGhlaWdodD0iMSIgZmlsbD0idXJsKCNncmFkLXVjZ2ctZ2VuZXJhdGVkKSIgLz4KPC9zdmc+);
            background: -moz-linear-gradient(top,  rgba(255,255,255,1) 0%, rgba(246,246,246,1) 47%, rgba(237,237,237,1) 100%); /* FF3.6+ */
            background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,rgba(255,255,255,1)), color-stop(47%,rgba(246,246,246,1)), color-stop(100%,rgba(237,237,237,1))); /* Chrome,Safari4+ */
            background: -webkit-linear-gradient(top,  rgba(255,255,255,1) 0%,rgba(246,246,246,1) 47%,rgba(237,237,237,1) 100%); /* Chrome10+,Safari5.1+ */
            background: -o-linear-gradient(top,  rgba(255,255,255,1) 0%,rgba(246,246,246,1) 47%,rgba(237,237,237,1) 100%); /* Opera 11.10+ */
            background: -ms-linear-gradient(top,  rgba(255,255,255,1) 0%,rgba(246,246,246,1) 47%,rgba(237,237,237,1) 100%); /* IE10+ */
            background: linear-gradient(to bottom,  rgba(255,255,255,1) 0%,rgba(246,246,246,1) 47%,rgba(237,237,237,1) 100%); /* W3C */
            filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#ffffff', endColorstr='#ededed',GradientType=0 ); /* IE6-8 */
            border: 1px Solid rgb(255,255,255);
            border-radius: 0 0 5px 5px;
            padding: 5px;
            font-family: Verdana;
            white-space: normal;
            margin:5px;
            -webkit-box-shadow: 0 8px 6px -6px #95A63F;
            -moz-box-shadow: 0 8px 6px -6px #95A63F;
            box-shadow: 0 8px 6px -6px #95A63F;
            color: #6B5F14;
            text-shadow: 1px 1px 0px #E0E0E0;
        }
    </style>
</asp:Content>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div  class="msg-content" style="margin-right: 20px;">
        <asp:GridView ID="gvMessages" runat="server" DataKeyNames="RecordNumber" OnSelectedIndexChanged="gvMessages_SelectedIndexChanged"
            AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:TemplateField HeaderText="MESSAGES" AccessibleHeaderText="MESSAGES">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Select"
                            Text='<%# Eval("Subject")+"-"+Eval("DateSent", "{0:MMMM d, yyyy}") %>'></asp:LinkButton>
                        <asp:ModalPopupExtender ID="ModalPopupExtender1" runat="server" TargetControlID="LinkButton1" 
                        PopupControlID="pnlModalMessage" PopupDragHandleControlID="pnlModalMessageDrag">
                        </asp:ModalPopupExtender>
                        <asp:Panel ID="pnlModalMessage" CssClass="modal" runat="server" >
                            <asp:Panel ID="pnlModalMessageDrag" CssClass="modalDrag" runat="server" >
                                <div class="sizeLogo">
                                    <img src="../Resources/mail_read.png" align="top" /> MESSAGE BOX
                                </div>
                            </asp:Panel>
                            <div>
                            </div>
                            <div class="msg-content">
                            <%# Eval("MessageContent") %>
                                <div>
                                    Date Sent: <%# Eval("DateSent", "{0:MMMM d, yyyy}")%>
                                </div>
                            </div>
                            <div style="text-align:center; margin:5px;">
                                <asp:Button CssClass="modalWarningButtonYes"  onclick="btnOMessageOK_Click" ID="btnOk" runat="server" Text="OK" />
                            </div>
                        </asp:Panel>
                    </ItemTemplate>
                    <HeaderStyle Font-Names="Verdana" ForeColor="#663300" />
                </asp:TemplateField>
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
    </div>
   
</asp:Content>
