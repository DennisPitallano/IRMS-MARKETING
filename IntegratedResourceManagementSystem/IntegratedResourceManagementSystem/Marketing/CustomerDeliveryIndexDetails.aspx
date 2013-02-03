<%@ Page Title="" Language="C#" MasterPageFile="~/Marketing/Marketing.Master" AutoEventWireup="true"
	CodeBehind="CustomerDeliveryIndexDetails.aspx.cs" Inherits="IntegratedResourceManagementSystem.Marketing.CustomerDeliveryIndexDetails" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Src="~/Marketing/controls/UCLoader.ascx" TagName="LOADER" TagPrefix="UC" %>
<asp:Content ID="HeadContent" ContentPlaceHolderID="head" runat="server">
	<link href="../Styles/cdi-details.css" rel="stylesheet" type="text/css" />
	<script src="../Scripts/jquery-1.7.2.min.js" type="text/javascript"></script>
	<script type="text/javascript">
		$(document).ready(function () {
			$("#imgClose").click(function () { close(); });

//			var sum = 0;
//			$('.amt').each(function () {
//			    sum += parseFloat($(this).text());
//			});
//			$('#MainContent_Label1').html(sum)
		});

	</script>
</asp:Content>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
	<div style="min-height: 490px;">
		<div class="modalDrag" style="height: 20px; margin-bottom: 2px;">
			<div class="sizeLogo">
				<img src="../Resources/accounting.png" height="16px" align="top" />
				DR DETAILS VIEW
			</div>
			<div style="float: right; cursor: pointer;">
				<img title="Close Window" id="imgClose" src="../Resources/cancel_gray.png" alt="CLOSE WINDOW" />
			</div>
		</div>
		<asp:UpdatePanel ID="upnlDRDetails" runat="server">
			<ContentTemplate>
				<div class="dr modal">
					<div style="text-align: center; margin: 5px 2px 0px 2px; font-weight: bold;" class="modalLabel">
						<span>Customer DR SUMMARY</span>
					</div>
					<hr style="color: #BEB57C;" />
					<table>
						<tr >
							<td valign="top" class="label" >
								CUSTOMER:
							</td>
							<td class="drdetails">
								<asp:Label ID="lblCustomer" Font-Size="11px" runat="server" Text="Label" Width="320px"></asp:Label>
							</td>
						</tr>
						<tr>
							<td class="label">
								DR DATE:
							</td>
							<td class="drdetails">
								<asp:Label ID="lblDRDate" Font-Size="11px" runat="server" Text="Label"></asp:Label>
							</td>
						</tr>
						<tr>
							<td class="label">
								DR#:
							</td>
							<td class="drdetails">
								<asp:Label ID="lblDRNoRange" runat="server" Text="Label" Font-Size="11px" ForeColor="#663300"
									Font-Italic="True"></asp:Label>
							</td>
						</tr>
						<tr>
							<td class="modalText" colspan="2">
								<asp:GridView ID="gvDRList" runat="server" DataSourceID="SqlDataSourceDR" AutoGenerateColumns="False"
									BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" CellPadding="2"
									Font-Names="Verdana" Font-Size="11px" ForeColor="Black" GridLines="None" DataKeyNames="DRNo"
									OnSelectedIndexChanged="gvDRList_SelectedIndexChanged">
									<AlternatingRowStyle BackColor="PaleGoldenrod" />
									<Columns>
										<asp:TemplateField ShowHeader="False" HeaderText="DR #">
											<ItemTemplate>
												<asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Select"
													Text='<%#Eval("DRNo") %>'></asp:LinkButton>
											</ItemTemplate>
											<ItemStyle Font-Bold="True" />
										</asp:TemplateField>
										<asp:BoundField DataField="DRNo" HeaderText="DR #" SortExpression="DRNo" 
											Visible="False" />
										<asp:BoundField DataField="TOTAL_QTY" HeaderText="TOTAL QTY" ReadOnly="True" SortExpression="TOTAL_QTY">
											<ItemStyle HorizontalAlign="Center" CssClass="amt" />
										</asp:BoundField>
										<asp:BoundField DataField="TOTAL_PRICE" HeaderText="TOTAL AMT" ReadOnly="True" SortExpression="TOTAL_PRICE"
											DataFormatString="{0:###,###.00}">
											<ItemStyle ForeColor="#CC3300" />
										</asp:BoundField>
										<asp:BoundField DataField="TransitStatus" HeaderText="STATUS" >
										<ItemStyle ForeColor="Red" />
										</asp:BoundField>
										<asp:BoundField DataField="Forwarder" HeaderText="FORWARDER" />
										<asp:BoundField DataField="WayBillNo" HeaderText="WAYBILL#" />
									</Columns>
									<FooterStyle BackColor="Tan" />
									<HeaderStyle BackColor="Tan" Font-Bold="True" />
									<PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
									<SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
									<SortedAscendingCellStyle BackColor="#FAFAE7" />
									<SortedAscendingHeaderStyle BackColor="#DAC09E" />
									<SortedDescendingCellStyle BackColor="#E1DB9C" />
									<SortedDescendingHeaderStyle BackColor="#C2A47B" />
								</asp:GridView>
								<asp:SqlDataSource ID="SqlDataSourceDR" runat="server" ConnectionString="<%$ ConnectionStrings:IRMSConnectionString %>"
									SelectCommand=" SELECT DR.DRNo,SUM(DRSumm.Quantity) AS TOTAL_QTY, SUM(DRSumm.Amount)AS TOTAL_PRICE,  CASE
	when DR.TransitStatus is NULL then 'InTransit' else 'Confirmed'
  end 'TransitStatus',Forwarder,WayBillNo FROM [DR] INNER JOIN DRSumm ON DR.ID = DRSumm.DRID  WHERE (([DRDate] = @DRDate) AND ([CustNo] = @CustNo)) group by DR.DRNo,DR.TransitStatus,DR.Forwarder,DR.WayBillNo order by  DR.DRNo ASC">
									<SelectParameters>
										<asp:QueryStringParameter Name="DRDate" QueryStringField="DRDate" Type="DateTime" />
										<asp:QueryStringParameter Name="CustNo" QueryStringField="CustomerNumber" Type="Int32" />
									</SelectParameters>
								</asp:SqlDataSource>
							</td>
						</tr>
						<tr>
							<td class="label">
								TOTAL QTY:
							</td>
							<td class="drdetails">
								<asp:Label ID="lblTotalQuantity" runat="server" Text="Label" Font-Size="11px" ForeColor="#CC3300"></asp:Label>
							</td>
						</tr>
						<tr>
							<td class="label">
								TOTAL AMOUNT:
							</td>
							<td class="drdetails">
								<asp:Label ID="lblTotalAmount" runat="server" Text="Label" Font-Size="11px" ForeColor="#CC3300"></asp:Label>
							</td>
						</tr>
					</table>
				</div>
				<div style="float: left; margin-right: 5px;">
					<asp:UpdateProgress ID="upProgress" runat="server" AssociatedUpdatePanelID="upnlDRDetails">
						<ProgressTemplate>
							<asp:PlaceHolder ID="plcHLoader" runat="server">
								<UC:LOADER ID="loader" runat="server" />
							</asp:PlaceHolder>
						</ProgressTemplate>
					</asp:UpdateProgress>
				</div>
				<div style="display: inline-block;">
					<div style="float: left;">
						<asp:GridView ID="gvDRDetails" runat="server" AllowPaging="True" AllowSorting="True"
							AutoGenerateColumns="False" DataSourceID="SqlDataSourceDRDetails" CssClass="table-grid-style"
							PageSize="20" CellPadding="3" GridLines="None" Font-Size="11px">
							<AlternatingRowStyle BackColor="PaleGoldenrod" />
							<Columns>
								<asp:TemplateField>
									<EditItemTemplate>
										<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
									</EditItemTemplate>
									<ItemTemplate>
										<img src="../Resources/adjustment.png" alt="DR" height="16px" />
									</ItemTemplate>
								</asp:TemplateField>
								<asp:BoundField DataField="DRNo" HeaderText="DR #" SortExpression="DRNo">
									<HeaderStyle Wrap="False" />
									<ItemStyle Wrap="False" Font-Bold="True" />
								</asp:BoundField>
							 
								<asp:BoundField DataField="StyleNo" HeaderText="STYLE #" SortExpression="StyleNo">
									<HeaderStyle Wrap="False" />
									<ItemStyle Wrap="False" Font-Italic="True" />
								</asp:BoundField>
							 
								<asp:BoundField DataField="TOTAL_QTY" HeaderText="QUANTITY" SortExpression="TOTAL_QTY">
									<HeaderStyle Wrap="False" />
									<ItemStyle HorizontalAlign="Center" Wrap="False" Font-Bold="True" />
								</asp:BoundField>
								<asp:BoundField DataField="TOTAL_PRICE" HeaderText="UNIT PRICE" SortExpression="TOTAL_PRICE"
									DataFormatString="{0:###,###.00}">
									<HeaderStyle Wrap="False" />
									<ItemStyle HorizontalAlign="Center" Wrap="False" ForeColor="#CC0000" 
									Font-Bold="True" />
								</asp:BoundField>
								<asp:BoundField DataField="Amount" DataFormatString="{0:###,###.00}" 
									HeaderText="TOTAL AMOUNT" SortExpression="Amount">
								<ItemStyle Font-Bold="True" ForeColor="#CC0000" HorizontalAlign="Center" />
								</asp:BoundField>
							</Columns>
							<EmptyDataTemplate>
								<img src="../Resources/unhappy.png" align="top" />
								DETAILS NOT FOUND!
							</EmptyDataTemplate>
							<FooterStyle BackColor="Tan" />
							<HeaderStyle BackColor="Tan" Font-Bold="True" />
							<PagerStyle CssClass="pager" />
							<SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
							<SortedAscendingCellStyle CssClass="asc-cell-style" />
							<SortedAscendingHeaderStyle CssClass="asc-cell-style-h" />
							<SortedDescendingCellStyle CssClass="desc-cell-style" />
							<SortedDescendingHeaderStyle CssClass="desc-cell-style-h" />
						</asp:GridView>
						<asp:SqlDataSource ID="SqlDataSourceDRDetails" runat="server" ConnectionString="<%$ ConnectionStrings:IRMSConnectionString %>"
							SelectCommand="SP_GET_CDI_DETAILS_SUMMARY" EnableCaching="True" ViewStateMode="Disabled"
							SelectCommandType="StoredProcedure">
							<SelectParameters>
								<asp:QueryStringParameter DefaultValue="" Name="DRDate" QueryStringField="DRDate" />
								<asp:QueryStringParameter DefaultValue="" Name="CustomerNumber" QueryStringField="CustomerNumber" />
							</SelectParameters>
						</asp:SqlDataSource>
						<asp:SqlDataSource ID="SqlDataSourceDRDetailsByDRNo" runat="server" ConnectionString="<%$ ConnectionStrings:IRMSConnectionString %>"
							SelectCommand="SP_GET_CDI_DETAILS_SUMMARY_BY_DRNO" EnableCaching="True" ViewStateMode="Disabled"
							SelectCommandType="StoredProcedure">
							<SelectParameters>
								<asp:QueryStringParameter DefaultValue="" Name="DRDate" QueryStringField="DRDate" />
								<asp:QueryStringParameter DefaultValue="" Name="CustomerNumber" QueryStringField="CustomerNumber" />
								<asp:ControlParameter ControlID="gvDRList" Name="DRNumber" PropertyName="SelectedValue"
									Type="Int32" />
							</SelectParameters>
						</asp:SqlDataSource>
						<%--<asp:QueryStringParameter Name="IDS" QueryStringField="IDS" />--%>
						<%-- SP_GET_CDI_DETAILS <asp:QueryStringParameter DefaultValue="" Name="IDE" QueryStringField="IDE" />--%>
					</div>
					<div class="modalDrag  filter-display">
					<div style="margin-bottom:5px;">
						<asp:Button type="reset" CssClass="btnReload" ID="btnReloadList" runat="server" 
							Text="RELOAD LIST" onclick="btnReloadList_Click" />
							</div>
											<label class="label" for="DDLDisplayPageSize">
							SET DISPLAY PAGE SIZE</label><br />
						<asp:DropDownList CssClass="modalText" Height="18px" ID="DDLDisplayPageSize" runat="server"
							AutoPostBack="True" OnSelectedIndexChanged="DDLDisplayPageSize_SelectedIndexChanged"
							Font-Bold="True" ForeColor="#CC6600">
							<asp:ListItem>10</asp:ListItem>
							<asp:ListItem>50</asp:ListItem>
							<asp:ListItem>100</asp:ListItem>
							<asp:ListItem>250</asp:ListItem>
							<asp:ListItem>500</asp:ListItem>
							<asp:ListItem Value="1000">ALL</asp:ListItem>
							<asp:ListItem Value="20" Selected="True">DEFAULT</asp:ListItem>
						</asp:DropDownList>
					
					</div>
				</div>
			</ContentTemplate>
		</asp:UpdatePanel>
	</div>
</asp:Content>
