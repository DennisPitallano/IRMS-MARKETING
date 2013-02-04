<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StockInputReportPrintPreview.aspx.cs" Inherits="IntegratedResourceManagementSystem.Reports.ReportForms.StockInputReportPrintPreview" %>
<%@ Register Assembly="CrystalDecisions.Web, Version=13.0.2000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304"
    Namespace="CrystalDecisions.Web" TagPrefix="CR" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link href="../../Styles/modal-controls.css" rel="stylesheet" type="text/css" />
    <link href="../../Styles/marketing-item-master.css" rel="stylesheet" type="text/css" />
    <link href="../../Styles/modal-controls.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div class="modalDrag">
             <div class="close_btn">
                 <input id="btnClose" type="button" value="CLOSE" class="btnClose" onclick="window.close()"/>
                     
             </div>
    </div>
    <div>
     <CR:CrystalReportViewer ID="StockInputReportViewer" runat="server"  AutoDataBind="true" HasCrystalLogo="False" HasToggleGroupTreeButton="False" 
            Height="50px" ToolPanelView="None" Width="350px" />
    </div>
    </form>
</body>
</html>
