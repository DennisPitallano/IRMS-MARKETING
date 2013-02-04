<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Departments.aspx.cs" Inherits="IntegratedResourceManagementSystem.Marketing.Marketing_Admin.Reports.Departments" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Department Report</title>
    <style type="text/css">
          #gvDepartments th
        {
            padding: 0px 5px 0px 5px;
        }
        #gvDepartments tr td
        {
            padding: 0px 5px 0px 5px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div style="margin:10px; font-weight:bold;">
        LIST OF DEPARTMENTS
    </div>
    <div>
        <asp:GridView ID="gvDepartments" runat="server" AutoGenerateColumns="False">
            <Columns>
                <asp:BoundField DataField="Id" />
                <asp:BoundField DataField="DepartmentName" HeaderText="DEPARTMENT NAME" />
            </Columns>
        </asp:GridView>
    </div>
    </form>
</body>
</html>
