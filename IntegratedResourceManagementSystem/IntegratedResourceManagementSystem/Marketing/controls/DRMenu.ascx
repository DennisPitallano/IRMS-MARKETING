<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="DRMenu.ascx.cs" Inherits="IntegratedResourceManagementSystem.Marketing.controls.DRMenu" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<div class="title-menu">
	<img src="../Resources/accounting.png" alt="PITA" height="22px" align="top" />
	<label>Deliveries Menu</label>
</div>
<div class="menu-wrapper">
	<div class="mnuIcon">
		<div>
			<%-- <a class="lblMenu" href="../Marketing/CustomerDeliveryIndex.aspx">--%>
			<asp:Image ID="imgCDI" runat="server" ImageUrl="~/Resources/adjustment.png" Height="32px" />
			<asp:PopupControlExtender ID="imgCDI_PopupControlExtender" runat="server" DynamicServicePath=""
				Enabled="True" ExtenderControlID="" TargetControlID="imgCDI" PopupControlID="pnlPopUp">
			</asp:PopupControlExtender>
			<asp:Panel ID="pnlPopUp" CssClass="title" runat="server" BorderColor="#663300" BorderStyle="Solid"
				BorderWidth="3px">
				<div style="padding: 5px 5px 0px 5px;">
					<a title="Customer Delivery Index Panel" class="modalLabel" style="font-size: 12px;"
						href="../Marketing/CustomerDeliveryIndex.aspx">DELIVERY INDEX PER CUSTOMER</a>
				</div>
				<div style="padding: 5px;">
					<a title="Customer Delivery Index Panel" class="modalLabel" style="font-size: 12px;"
						href="../Marketing/CustomerDeliveryIndexPerArea.aspx">DELIVERY INDEX PER AREA/SUB-AREA</a>
				</div>
			</asp:Panel>
			<%--</a>--%>
		</div>
		<asp:Label ID="lblDI" CssClass="lblMenu" Font-Names="Verdana" Font-Size="9px"
			Font-Bold="true" runat="server" Text="DELIVERY INDEX"></asp:Label>
		<asp:PopupControlExtender ID="PopupControlExtender_lblDI" runat="server" DynamicServicePath=""
			Enabled="True" ExtenderControlID="" TargetControlID="lblDI" PopupControlID="pnlPopUp">
		</asp:PopupControlExtender>
		
	</div>
	<div class="mnuIcon">
		<div>
			<a class="lblMenu" href="../Marketing/CustomerDeliveryIndexReports.aspx">
				<img src="../Resources/adjustment.png" height="42px" title="Customer Delivery Index Panel" />
			</a>
		</div>
		<a title="Customer Delivery Index Panel" class="lblMenu" style="font-family: Verdana;
			font-size: 9px; font-weight: bold;" href="../Marketing/CustomerDeliveryIndexReports.aspx">
			CDI REPORTS </a>
	</div>
</div>
