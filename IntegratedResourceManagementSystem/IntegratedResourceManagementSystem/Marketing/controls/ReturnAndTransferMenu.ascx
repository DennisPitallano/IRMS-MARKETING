<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ReturnAndTransferMenu.ascx.cs"
	Inherits="IntegratedResourceManagementSystem.Marketing.controls.ReturnAndTransferMenu" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<div class="title-menu">
	<img src="../Resources/accounting.png" alt="PITA" height="22px" align="top" />
	<label>
		Returns and Transfer Menu</label>
</div>
<div class="menu-wrapper">
	<div class="mnuIcon" title="Manage Outright Markdown Memo">
	   <asp:Image ID="imgPullOutLetter" runat="server" ImageUrl="~/Resources/adjustment.png" Height="32px" />
			<asp:PopupControlExtender ID="imgPullOutPopupControlExtender" runat="server" DynamicServicePath=""
				Enabled="True" ExtenderControlID="" TargetControlID="imgPullOutLetter" PopupControlID="pnlPullOutTypeOption">
			</asp:PopupControlExtender>
		<br />
		<asp:HyperLink ID="hpLinkPullOutLetter" class="lblMenu" Font-Names="Verdana" Font-Size="10px"
			Font-Bold="true" runat="server">PULL-OUT LETTERS</asp:HyperLink>
		<asp:PopupControlExtender ID="hpLinkPullOutLetter_PopupControlExtender" runat="server"
			DynamicServicePath="" Enabled="True" ExtenderControlID="" PopupControlID="pnlPullOutTypeOption"
			TargetControlID="hpLinkPullOutLetter"></asp:PopupControlExtender>
		<asp:Panel ID="pnlPullOutTypeOption" CssClass="title" runat="server" BorderColor="#663300" BorderStyle="Solid"
				BorderWidth="3px">
				<div style="padding: 5px 5px 0px 5px;">
					<a title="Customer Delivery Index Panel" class="modalLabel" style="font-size: 12px;"
						href="../Marketing/SMPullOutLetterManagementPanel.aspx">PULL-OUT LETTER FOR SM</a>
				</div>
				<div style="padding: 5px;">
					<a title="Customer Delivery Index Panel" class="modalLabel" style="font-size: 12px;"
						href="../Marketing/PullOutLettersManagementPanel.aspx">PULL-OUT LETTER FOR OTHER CUSTOMERS/OUTLETS</a>
				</div>
		</asp:Panel>
	</div>
	<div class="mnuIcon" title="Manage Outright MarkDown Memo">
		<div>
			<a class="lblMenu" href="../Marketing/RequestPanel.aspx">
				<img src="../Resources/adjustment.png" height="36px" title="Manage Pull Out Requests" />
			</a>
		</div>
		<a title="Manage Pull Out Requests" class="lblMenu" style="font-size: 10px; font-weight: bold;"
			href="../Marketing/RequestPanel.aspx">PULL-OUT REQUEST</a>
	</div>
	<div class="mnuIcon" title="MarkDown Reports">
		<div>
			<a class="lblMenu" href="../Marketing/ReturnsAndTransferReportPanel.aspx">
				<img src="../Resources/adjustment.png" title="Manage Outright MarkDown Memo" />
			</a>
		</div>
		<a title="Manage Outright MarkDown Memo" class="lblMenu" style="font-size: 10px;
			font-weight: bold;" href="../Marketing/ReturnsAndTransferReportPanel.aspx">REPORTS</a>
	</div>
</div>
<div class="menu-wrapper">
	<div class="mnuIcon">
		<div>
			<a class="lblMenu" href="../Marketing/ReturnsManagementPanel.aspx">
				<img src="../Resources/adjustment.png" title="Manage Item/s Returns" />
			</a>
		</div>
		<a title="Manage Item/s Returns" class="lblMenu" style="font-family: Verdana; font-size: 11px;
			font-weight: bold;" href="../Marketing/ReturnsManagementPanel.aspx">RETURNS</a>
	</div>
	<div class="mnuIcon">
		<div>
			<a class="lblMenu" href="../Marketing/TransferManagementPanel.aspx">
				<img src="../Resources/adjustment.png" title="Manage Transfer Item/s" />
			</a>
		</div>
		<a title="Manage Transfer Item/s" class="lblMenu" style="font-family: Verdana; font-size: 11px;
			font-weight: bold;" href="../Marketing/TransferManagementPanel.aspx">TRANSFER</a>
	</div>
</div>
