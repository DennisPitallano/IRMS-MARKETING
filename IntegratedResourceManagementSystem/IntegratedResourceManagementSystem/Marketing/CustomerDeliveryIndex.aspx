<%@ Page Title="" Language="C#" MasterPageFile="~/Marketing/Marketing.Master" AutoEventWireup="true"
	CodeBehind="CustomerDeliveryIndex.aspx.cs" Inherits="IntegratedResourceManagementSystem.Marketing.CustomerDeliveryIndex" %>

<%@ OutputCache CacheProfile="cached_profile" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Src="~/Marketing/controls/UCLoader.ascx" TagName="LOADER" TagPrefix="UC" %>
<asp:Content ID="HeadContent" ContentPlaceHolderID="head" runat="server">
	<link href="../Styles/cdi.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
	<div class="panelTitle">
		<asp:Image ID="imgpnlTitle" runat="server" ImageUrl="~/Resources/product_brand.png"
			ImageAlign="AbsMiddle" Height="30px" />
		&nbsp;<asp:Label ID="Label1" runat="server" Text="CUSTOMER DELIVERY INDEX PANEL"
			Font-Bold="True" Font-Names="Verdana" Font-Size="14px"></asp:Label>
		<div style="float: right;">
			<a href="DeliveryReceiptsMenu.aspx">
				<img src="../Resources/reply.png" alt="BACK" title="BACK" />
			</a>
		</div>
		<hr />
	</div>
	<asp:UpdatePanel ID="upnlCostumerDeliveryIndex" runat="server">
		<ContentTemplate>
			<div id="Dennis" style="height: 26px; margin-bottom: 1px;" class="modalDrag">
				<div style="float: left;">
					<div style="float: left; margin-right: 1px;">
						<asp:Label ID="lblCustomerLabel" runat="server" Text="CUSTOMER:" Font-Names="Verdana"
							Font-Size="12px" ForeColor="#FFFF99"></asp:Label>
						<asp:TextBox ID="txtCustomer" runat="server" Width="270px" Font-Size="11px" CssClass="modalText"
							Height="20px" ReadOnly="True"></asp:TextBox>
					</div>
					<div style="float: left; margin-right: 5px;">
						<asp:Button ID="btnBrowseCustomer" runat="server" Text="browse.." CssClass="btnBrowse"
							Font-Names="Verdana" />
						<asp:ModalPopupExtender ID="btnBrowseCustomer_ModalPopupExtender" runat="server"
							DynamicServicePath="" Enabled="True" PopupControlID="pnlCustomersModal" PopupDragHandleControlID="pnlCustomersModalDrag"
							TargetControlID="btnBrowseCustomer" BackgroundCssClass="bgModal" CancelControlID="imgBtnpnlCustomersModal">
							<Animations>
										<OnShown>
											<FadeIn Duration=".2" />
										</OnShown>
							</Animations>
						</asp:ModalPopupExtender>
					</div>
					<div style="float: left; margin-left: 2px; margin-right: 5px; cursor: pointer;">
						<asp:Label ID="lblDate" runat="server" Text="DATE:" Font-Names="Verdana" Font-Size="12px"
							ForeColor="#FFFF99" Font-Underline="True"></asp:Label>
						<asp:HoverMenuExtender ID="lblDate_HoverMenuExtender" runat="server" DynamicServicePath=""
							Enabled="True" PopupControlID="pnlAsOfDateOption" TargetControlID="lblDate" PopupPosition="Bottom">
						</asp:HoverMenuExtender>
						<asp:MultiView ID="mviewAsOfDateOption" runat="server" ActiveViewIndex="1">
							<asp:View ID="vDateForMonth" runat="server">
								<asp:DropDownList ID="ddListMonth" runat="server" Font-Names="Verdana" Font-Size="12px"
									ForeColor="#CC6600" Height="26px">
								</asp:DropDownList>
								<asp:DropDownList ID="ddlDateYear" runat="server" Font-Names="Verdana" Font-Size="12px"
									ForeColor="#CC6600" Height="26px">
								</asp:DropDownList>
							</asp:View>
							<asp:View ID="vDateForDay" runat="server">
								<label style="font-family: Verdana; font-size: 10px;" for="MainContent_txtDate">
									FROM:</label>
								<asp:TextBox ID="txtDate" CssClass ="modalText calendar" Height="22px" runat="server" Font-Bold="True" Font-Names="Verdana" Font-Size="12px"
									ForeColor="#996633" ></asp:TextBox>
								<asp:CalendarExtender ID="txtDate_CalendarExtender" runat="server" Enabled="True"
									TargetControlID="txtDate" Format="MMMM dd, yyyy">
								</asp:CalendarExtender>
								<label style="font-family: Verdana; font-size: 10px;" for="MainContent_txtDateTo">
									TO</label>
								<asp:TextBox ID="txtDateTo" runat="server" Font-Bold="True" Font-Names="Verdana"
									Font-Size="12px" ForeColor="#996633"  CssClass ="modalText calendar" Height="22px"></asp:TextBox>
								<asp:CalendarExtender ID="txtDateTo_CalendarExtender" runat="server" Enabled="True"
									TargetControlID="txtDateTo" Format="MMMM dd, yyyy">
								</asp:CalendarExtender>
							</asp:View>
							<asp:View ID="vDateForYear" runat="server">
								<asp:DropDownList ID="txtYear" runat="server" Font-Names="Verdana" Font-Size="12px"
									ForeColor="#CC6600" Height="26px">
								</asp:DropDownList>
							</asp:View>
						</asp:MultiView>
						<asp:Panel ID="pnlAsOfDateOption" runat="server">
							<div class="hover-menu-arrow">
							</div>
							<div class="hover-menu">
								<asp:RadioButtonList ID="rdioAsOfDate" runat="server" RepeatLayout="Flow" AutoPostBack="True"
									OnSelectedIndexChanged="rdioAsOfDate_SelectedIndexChanged">
									<asp:ListItem>FOR SELECTED MONTH</asp:ListItem>
									<asp:ListItem Selected="True">FOR SELECTED RANGE</asp:ListItem>
									<asp:ListItem>FOR SELECTED YEAR</asp:ListItem>
								</asp:RadioButtonList>
							</div>
						</asp:Panel>
					</div>
					<div style="float: left;">
						<div class="SeachBoxContainer">
							<asp:ImageButton ID="imgBtnSearch" runat="server" ImageAlign="AbsBottom" ImageUrl="~/Resources/search.png"
								ToolTip="CLICK TO SEARCH" OnClick="imgBtnSearch_Click" />
						</div>
					</div>
					<div style="float: left; margin-right: 5px;">
						<asp:UpdateProgress ID="upProgress" runat="server" AssociatedUpdatePanelID="upnlCostumerDeliveryIndex">
							<ProgressTemplate>
								<asp:PlaceHolder ID="plcHLoader" runat="server">
									<UC:LOADER ID="loader" runat="server" />
								</asp:PlaceHolder>
							</ProgressTemplate>
						</asp:UpdateProgress>
					</div>
				</div>
			</div>
			<div style="min-height: 390px;">
				<div class="title_list">
					<img src="../Resources/invoice.png" alt="DR DETAILS" height="18px" align="top" />
					<asp:Label ID="lblTitle" runat="server" Font-Names="Verdana" Font-Size="10px" ForeColor="#666666"></asp:Label>
				</div>
				<%--<asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSourceCDI" 
				CellPadding="2" ForeColor="#333333" Font-Names="Verdana" Font-Size="11px" 
					RepeatColumns="4" CellSpacing="3" 
				 RepeatDirection="Horizontal" CssClass ="details_view" 
					ViewStateMode="Disabled">
				<AlternatingItemStyle  />
				<FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
				<HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
				<ItemStyle   ForeColor="#f9e2cf" />
				<ItemTemplate>
				<div class="listdetailsitem" style=" text-shadow: 1px 1px 1px #e26804;-webkit-border-radius:30px 5px 30px 5px;
													 border-radius: 30px 5px 30px 5px; border:5px Solid White;
													 -webkit-box-shadow:  1px 1px 1px 1px  #7a7c7a;        
													box-shadow:  1px 1px 1px 1px  #7a7c7a;
													padding:6px 5px 3px 8px;; font-weight:bold;">
				   
					CUSTOMER:
					<asp:Label ID="DeliveredToLabel" runat="server" 
						Text='<%# Eval("DeliveredTo") %>'  />
						<br />
					DR#:
					<asp:Label ID="FromDRNoLabel" runat="server" 
						Text='<%# Eval("FromDRNo") %>' />-<asp:Label ID="ToDRNoLabel" runat="server" 
						Text='<%# Eval("ToDRNo") %>' />
					<br />
					DR DATE:
					<asp:Label ID="DRDateLabel" runat="server"  Text='<%# Eval("DR_DATE") %>' />
					<br />
					TOTAL QUANTITY:
					<asp:Label ID="TOTAL_QUANTITYLabel" runat="server" 
						Text='<%# Eval("TOTAL_QUANTITY") %>' />
					<br />
					TOTAL AMOUNT:
					<asp:Label ID="TOTAL_AMOUNTLabel" runat="server" 
						Text='<%# Eval("TOTAL_AMOUNT") %>' />
					<br />
					 <div class ="btnBrowse" style =" line-height:25px; margin-top:3px; font-family:Verdana; text-align:center; margin-left:90px; margin-bottom:3px;                                                        padding-left:5px; padding-right:5px;  margin-right:90px; height:25px; border:1px Solid #e89735;
														 -webkit-box-shadow:  1px 1px 1px 1px  #e09b4c;        
													box-shadow:  1px 1px 1px 1px  #e09b4c;-webkit-border-radius: 5px 5px 5px 5px;
													 border-radius: 5px 5px 5px 5px; font-size:10px; font-weight:normal;">
					<asp:HyperLink ID="hLinkViewDetails" runat="server" 
					 NavigateUrl= '<%# "~/Marketing/CustomerDeliveryIndexDetails.aspx?Customer="+Eval("DeliveredTo")+"&DRDate="+Eval("DR_DATE")+
						"&IDS="+Eval("START_ID")+"&IDE="+Eval("END_ID")+"&TP="+Eval("TOTAL_AMOUNT")+"&TQ="+Eval("TOTAL_QUANTITY")
						+"&CustomerNumber="+Eval("CustNo")+"&DRRange="+Eval("FromDRNo")+"-"+Eval("ToDRNo")  %>' 
					 Target="_blank" ForeColor="#C66300" ToolTip="View Details">VIEW DETAILS</asp:HyperLink>
					 </div>
					 </div>
				</ItemTemplate>
				<SelectedItemStyle BackColor="#FFCC66"  Font-Bold="True" ForeColor="Navy" />
				<SeparatorStyle BorderColor="#CC6600" BorderStyle="Solid" BorderWidth="2px" 
					Font-Bold="False" Font-Italic="False" Font-Overline="False" 
					Font-Strikeout="False" Font-Underline="False" />
			</asp:DataList>--%>
				<asp:GridView ID="gvCDIList" runat="server" AllowPaging="True" AllowSorting="True"
					AutoGenerateColumns="False" DataSourceID="SqlDataSourceCDI" CellPadding="4" DataKeyNames="CustNo,START_ID,END_ID"
					CssClass="table_grid" GridLines="None" PageSize="20" Font-Size="12px">
					<AlternatingRowStyle BackColor="White" />
					<Columns>
						<asp:TemplateField>
							<EditItemTemplate>
								<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
							</EditItemTemplate>
							<ItemTemplate>
								<asp:Image ID="imgCDI" runat="server" ImageUrl="~/Resources/invoice.png" Height="16px" />
							</ItemTemplate>
						</asp:TemplateField>
						<asp:BoundField DataField="CustNo" HeaderText="CustNo" SortExpression="CustNo" Visible="False" />
						<asp:BoundField DataField="DeliveredTo" HeaderText="DeliveredTo" SortExpression="DeliveredTo"
							Visible="False" />
						<asp:BoundField DataField="DR_DATE" HeaderText="DR DATE" ReadOnly="True" SortExpression="DR_DATE" />
						<asp:BoundField DataField="DRNoRange" HeaderText="DR# RANGE (FROM-TO)" ReadOnly="True"
							SortExpression="DRNoRange">
							<ItemStyle Font-Bold="True" Font-Italic="True" HorizontalAlign="Center" />
						</asp:BoundField>
						<asp:BoundField DataField="TOTAL_AMOUNT" HeaderText="TOTAL AMOUNT" ReadOnly="True"
							SortExpression="TOTAL_AMOUNT" DataFormatString="{0:###,###.00}">
							<ItemStyle HorizontalAlign="Right" ForeColor="#CC0000" />
						</asp:BoundField>
						<asp:BoundField DataField="TOTAL_QUANTITY" HeaderText="TOTAL QTY" ReadOnly="True"
							SortExpression="TOTAL_QUANTITY">
							<ItemStyle HorizontalAlign="Center" />
						</asp:BoundField>
						<asp:BoundField DataField="START_ID" HeaderText="START_ID" ReadOnly="True" SortExpression="START_ID"
							Visible="False" />
						<asp:BoundField DataField="END_ID" HeaderText="END_ID" ReadOnly="True" SortExpression="END_ID"
							Visible="False" />
						<asp:TemplateField>
							<ItemTemplate>
								<img src="../Resources/dup1.png" alt="PITA" height="16px" align="top" />
								<asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# "~/Marketing/CustomerDeliveryIndexDetails.aspx?Customer="+Eval("DeliveredTo")+"&DRDate="+Eval("DR_DATE")+
						"&IDS="+Eval("START_ID")+"&IDE="+Eval("END_ID")+"&TP="+Eval("TOTAL_AMOUNT")+"&TQ="+Eval("TOTAL_QUANTITY")
						+"&CustomerNumber="+Eval("CustNo")+"&DRRange="+Eval("DRNoRange") %>' Text="VIEW DETAILS"
									Target="_blank"></asp:HyperLink>
							</ItemTemplate>
						</asp:TemplateField>
					</Columns>
					<EmptyDataTemplate>
						<img src="../Resources/unhappy.png" align="middle" />
						EMPTY RESULT!!!
					</EmptyDataTemplate>
					<EditRowStyle BackColor="#7C6F57" />
					<FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
					<HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
					<PagerStyle CssClass="pager-cdi" />
					<RowStyle BackColor="#E3EAEB" />
					<SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
					<SortedAscendingCellStyle CssClass="asc_cell_style" />
					<SortedAscendingHeaderStyle CssClass="asc_cell_style_h" />
					<SortedDescendingCellStyle CssClass="desc_cell_style" />
					<SortedDescendingHeaderStyle CssClass="desc_cell_style_h" />
				</asp:GridView>
				<asp:SqlDataSource ID="SqlDataSourceCDI" runat="server" ConnectionString="<%$ ConnectionStrings:IRMSConnectionString %>"
					SelectCommand="SP_GET_CDI" EnableCaching="True" ViewStateMode="Disabled" SelectCommandType="StoredProcedure">
					<SelectParameters>
						<asp:ControlParameter ControlID="hfDateFrom" Name="DateFrom" PropertyName="Value"
							DbType="DateTime" />
						<asp:ControlParameter ControlID="hfDateTo" Name="DateTo" PropertyName="Value" DbType="DateTime" />
						<asp:ControlParameter ControlID="hfCustomerId" DbType="Int32" Name="CustomerNumber"
							PropertyName="Value" />
					</SelectParameters>
				</asp:SqlDataSource>
			</div>
			<asp:Panel ID="pnlCustomersModal" runat="server" CssClass="modal">
				<asp:Panel ID="pnlCustomersModalDrag" runat="server" CssClass="modalDrag">
					<div class="close_btn">
						<asp:ImageButton ID="imgBtnpnlCustomersModal" runat="server" CssClass="btnClose"
							ImageUrl="~/Resources/cancel_gray.png" ToolTip="CLOSE" />
					</div>
					<div class="sizeLogo">
						<img alt="new brand" src="../Resources/users.png" height="16" align="top" />
						LIST OF CUSTOMERS
					</div>
				</asp:Panel>
				<div style="padding: 2px auto; height: 30px;">
					<div class="SeachBoxContainer">
						SEARCH:
						<asp:TextBox ID="txtSearchCustomer" placeholder="Search Customer" CssClass="SearchTextBox"
							runat="server"></asp:TextBox>
						<asp:ImageButton ID="iBtnSearchCustomer" runat="server" ImageUrl="~/Resources/search.png"
							ImageAlign="AbsMiddle" OnClick="iBtnSearchCustomer_Click" />
					</div>
				</div>
				<div style="padding: 5px 5px;">
					<asp:GridView ID="gvCustomers" runat="server" CellPadding="4" ForeColor="#333333"
						GridLines="None" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False"
						DataKeyNames="CustNo" DataSourceID="SqlDataSourceCustomers" Font-Names="Verdana"
						Font-Size="9px" OnPageIndexChanging="gvCustomers_PageIndexChanging" OnSelectedIndexChanged="gvCustomers_SelectedIndexChanged"
						OnSelectedIndexChanging="gvCustomers_SelectedIndexChanging" OnSorting="gvCustomers_Sorting"
						EnablePersistedSelection="True">
						<AlternatingRowStyle BackColor="White" />
						<Columns>
							<asp:TemplateField>
								<EditItemTemplate>
									<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
								</EditItemTemplate>
								<ItemTemplate>
									<asp:Image ID="imgCustomer" ImageUrl="~/Resources/users.png" AlternateText='<%# Eval("CustNo") %>'
										Height="14px" runat="server" />
								</ItemTemplate>
							</asp:TemplateField>
							<asp:CommandField ShowSelectButton="True" />
							<asp:BoundField DataField="CustNo" HeaderText="CustNo" InsertVisible="False" ReadOnly="True"
								SortExpression="CustNo" Visible="False" />
							<asp:BoundField DataField="CompName" HeaderText="CUSTOMER NAME" SortExpression="CompName">
								<HeaderStyle Wrap="False" />
								<ItemStyle Wrap="False" />
							</asp:BoundField>
						</Columns>
						<EditRowStyle BackColor="#7C6F57" />
						<EmptyDataTemplate>
							<img src="../Resources/unhappy.png" alt="WARNING" align="middle" />
							CUSTOMER NOT FOUND!!!
						</EmptyDataTemplate>
						<FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
						<HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
						<PagerSettings Mode="NumericFirstLast" />
						<PagerStyle CssClass="pager" />
						<RowStyle BackColor="#E3EAEB" />
						<SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
						<SortedAscendingCellStyle BackColor="#F8FAFA" />
						<SortedAscendingHeaderStyle BackColor="#246B61" />
						<SortedDescendingCellStyle BackColor="#D4DFE1" />
						<SortedDescendingHeaderStyle BackColor="#15524A" />
					</asp:GridView>
					<asp:SqlDataSource ID="SqlDataSourceCustomers" runat="server" ConnectionString="<%$ ConnectionStrings:IRMSConnectionString %>"
						SelectCommand="SELECT [CustNo], [CompName] FROM [CustInfo]"></asp:SqlDataSource>
				</div>
				<div style="text-align: center; padding: 3px 0;">
					<asp:Button ID="btnSelectCustomer" CssClass="modalWarningButtonYes" runat="server"
						Text="OK" Enabled="False" OnClick="btnSelectCustomer_Click" ToolTip="Currently Disabled, please select from list." />
					<asp:HiddenField ID="hfCustomerId" runat="server" />
					<asp:HiddenField ID="hfDateFrom" runat="server" />
					<asp:HiddenField ID="hfDateTo" runat="server" />
				</div>
			</asp:Panel>

		</ContentTemplate>
	</asp:UpdatePanel>
</asp:Content>
