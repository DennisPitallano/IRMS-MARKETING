<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PrintOutlet.aspx.cs" Inherits="IntegratedResourceManagementSystem.Reports.ReportForms.PrintOutlet" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../../Styles/marketing-item-master.css" rel="stylesheet" type="text/css" />
    <style type="text/css" media="screen">
        .printContainer
        {
            width: 700px;
            background-repeat: no-repeat;
            margin: 80px auto 0 auto;
            text-align: center;
            text-shadow: 1px 1px 1px white;
            font-family:Times New Roman;
        }
        .lbl
        {
            text-align:right;
        }
        .value
        {
            text-align:left;
        }
        .btnBack
    {
        font-family:Verdana ;
        font-weight :bold;
        font-size: 11px;
        height : 25px;
        text-align :right;
        background:url('../../Resources/reply.png'), -webkit-gradient(linear, left top, left bottom, from(#c9c9c9), to(#848484), color-stop(0.6, #a1a1a1));
        background-image :url('../../Resources/reply.png'), -moz-linear-gradient(top, #c9c9c9, #848484, #a1a1a1 90%);
        background-repeat:no-repeat;
        background-position:left;
        color:#FCFCFC;
        padding-left:20px;
        cursor:pointer;
    }
    .btnBack:hover
     {
        background:url('../../Resources/reply.png'), -webkit-gradient(linear, left top, left bottom, from(#c9c9c9), to(#848484), color-stop(0.6, #a1a1a1));
        background-image :url('../../Resources/reply.png'), -moz-linear-gradient(top, #c9c9c9, #848484, #a1a1a1 90%);
        background-repeat:no-repeat;
        background-position:left;
       color:#FFFFCC;
     }
    </style>
    <script src="../../Scripts/jquery-1.7.2.js" type="text/javascript"></script>
    <script language="javascript" type="text/javascript">
// <![CDATA[

        $(document).ready(function () {
            $("#btnBack").click(function () {
                window.location.href = "../../Marketing/CustomListing.aspx";
            });
        });

// ]]>
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div class="printContainer">
        <table style="width: 100%;">
            <tr>
                <td class="lbl">
                    CUSTOMER NAME:
                </td>
                <td class="value">
                    <asp:Label ID="lblOutletName" runat="server" Text="OutletName"></asp:Label>
                </td>
                <td>
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td class="lbl">
                    CUSTOMER CODE:
                </td>
                <td class="value">
                    <asp:Label ID="lblCustomerCode" runat="server" Text="CustomerCode"></asp:Label>
                </td>
                <td>
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td class="lbl">
                    CONTRACT DATE:
                </td>
                <td class="value">
                    <asp:Label ID="lblContractDate" runat="server" Text="ContractCode"></asp:Label>
                </td>
                <td>
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td class="lbl">
                    UNDER COMPANY:
                </td>
                <td class="value">
                    <asp:Label ID="lblUnderCompany" runat="server" Text="UnderCompany"></asp:Label>
                </td>
                <td>
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td class="lbl">
                    DEPARTMENT CODE:
                </td>
                <td class="value">
                    <asp:Label ID="lblDepartmentCode" runat="server" Text="DepartmentCode"></asp:Label>
                </td>
                <td>
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td class="lbl">
                    AREA GROUP:
                </td>
                <td class="value">
                    <asp:Label ID="lblAreaGroup" runat="server" Text="AreaGroup"></asp:Label>
                </td>
                <td>
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td class="lbl">
                    SUb AREA GROUP:
                </td>
                <td class="value">
                    <asp:Label ID="lblSubAreaGroup" runat="server" Text="SubAreaGroup"></asp:Label>
                </td>
                <td>
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td class="lbl">
                    AREA COORDINATOR:
                </td>
                <td class="value">
                    <asp:Label ID="lblAreaCoordinator" runat="server" Text="AreaCoordinator"></asp:Label>
                </td>
                <td>
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td class="lbl">
                    COLLECTION OFFICE/ADDRESS:
                </td>
                <td class="value">
                    <asp:Label ID="lblCollectionAddress" runat="server" Text="CollectionAddress"></asp:Label>
                </td>
                <td>
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td class="lbl">
                    PRICE GROUP(Regular):
                </td>
                <td class="value">
                    <asp:Label ID="lblPriceGroupRegular" runat="server" Text="PriceGroupRegular"></asp:Label>
                </td>
                <td>
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td class="lbl">
                    PRICE GROUP(MarkDown):
                </td>
                <td class="value">
                    <asp:Label ID="lblPriceGroupMarkDown" runat="server" Text="PriceGroupMarkDown"></asp:Label>
                </td>
                <td>
                    &nbsp;
                </td>
            </tr>
        </table>

        <div>
            <input id="btnPrint" type="button" value="PRINT" class="btnPrint" />
            <input id="btnBack" type="button" value="BACK" class="btnBack">
        </div>
    </div>
    </form>
</body>
</html>
