<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PriceGroup.aspx.cs" Inherits="IntegratedResourceManagementSystem.Marketing.Marketing_Admin.Reports.PriceGroup" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Price group report</title>
    <style type ="text/css" >
        #gvPriceGroups th
        {
            padding: 0px 5px;
        }
         #gvPriceGroups tr td
        {
            padding: 0px 5px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div style="margin:10px; font-weight:bold;">
    LIST OF PRICE GROUP
    </div>
    <div>
        <asp:GridView ID="gvPriceGroups" runat="server" AutoGenerateColumns="False">
            <Columns>
                <asp:BoundField DataField="PGNo" />
                <asp:BoundField DataField="GroupName" HeaderText="GROUP NAME" />
                <asp:BoundField DataField="GroupField" HeaderText="GROUP FIELD" />
                <asp:BoundField DataField="PriceID" HeaderText="PRICE ID" />
                <asp:BoundField DataField="Concession" HeaderText="Is Concession" />
                <asp:BoundField DataField="Outright" HeaderText="Is OutRight" />
            </Columns>
        </asp:GridView>
    </div>
    </form>
</body>
</html>
