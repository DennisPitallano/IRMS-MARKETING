<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AreaGroup.aspx.cs" Inherits="IntegratedResourceManagementSystem.Marketing.Marketing_Admin.Reports.AreaGroup" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Area Group Reports</title>
    <style type="text/css" >
        #gvAreaGroups th
        {
             padding:0px 5px;
        }
        #gvAreaGroups tr td
        {
             padding:0px 5px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div style="margin:10px; font-weight:bold;">
       LIST OF AREA GROUP
    </div>
    <div>
        <asp:GridView ID="gvAreaGroups" runat="server" AutoGenerateColumns="False">
            <Columns>
                <asp:BoundField DataField="AreaGroupNo" />
                <asp:BoundField DataField="GroupName" HeaderText="GROUP NAME" />
            </Columns>
        </asp:GridView>
    </div>
    </form>
</body>
</html>
