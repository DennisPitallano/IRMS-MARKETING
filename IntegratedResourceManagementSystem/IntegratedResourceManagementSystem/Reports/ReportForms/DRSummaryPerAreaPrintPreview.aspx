<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DRSummaryPerAreaPrintPreview.aspx.cs" Inherits="IntegratedResourceManagementSystem.Reports.ReportForms.DRSummaryPerAreaPrintPreview" %>
<%@ Register Assembly="CrystalDecisions.Web, Version=13.0.2000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304"
    Namespace="CrystalDecisions.Web" TagPrefix="CR" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../../Styles/toolbar-controls.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
       <CR:CrystalReportViewer ID="DRSummaryPerAreaReport" runat="server"   
            AutoDataBind="true" HasCrystalLogo="False" HasToggleGroupTreeButton="False" 
            Height="50px" ToolPanelView="None" Width="350px" PrintMode="ActiveX" />
    </div>
    </form>
</body>
</html>
