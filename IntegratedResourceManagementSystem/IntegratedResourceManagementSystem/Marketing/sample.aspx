<%@ Page Title="" Language="C#" MasterPageFile="~/Marketing/Marketing.Master" AutoEventWireup="true" CodeBehind="sample.aspx.cs" Inherits="IntegratedResourceManagementSystem.Marketing.sample" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
    Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="../Scripts/jquery-1.7.2.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#MainContent_Label1").click(function () {
                alert("Hello World");
            });
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <asp:GridView ID="GridView1" runat="server">
    </asp:GridView>
    <asp:Button ID="Button1" runat="server" Text="Button" onclick="Button1_Click" />
    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
</asp:Content>

