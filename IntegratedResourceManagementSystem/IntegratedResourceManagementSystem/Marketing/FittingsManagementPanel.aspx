<%@ Page Title="" Language="C#" MasterPageFile="~/Marketing/Marketing.Master" AutoEventWireup="true"
    CodeBehind="FittingsManagementPanel.aspx.cs" Inherits="IntegratedResourceManagementSystem.Marketing.FittingsManagementPanel" %>

<%@ Register Src="~/Marketing/controls/UCLoader.ascx" TagName="LOADER" TagPrefix="UC" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<%@ Register Src="~/Marketing/forms/FSubFitting.ascx" TagName="FSUBFITTING" TagPrefix="IRMS" %>
<%@ Register Src="~/Marketing/forms/FFitting.ascx" TagName="FITTING" TagPrefix="IRMS" %>
<asp:Content ID="HeadContent" ContentPlaceHolderID="head" runat="server">
    <link href="../Styles/fitting-manager.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/permission-note.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div style="min-height: 520px;">
        <div class="titlePanel">
            <img src="../Resources/fit.png" height="22px" align="top" />
            Fittings Management Panel
        </div>
        <asp:UpdatePanel ID="upnlFittings" runat="server">
            <ContentTemplate>
                <div style="height: 26px; margin-bottom: 1px;" class="modalDrag">
                    <div style="float: right;" class="SearchTextContainer">
                        SEARCH:
                        <asp:TextBox ID="txtSearch" runat="server" autofocus placeholder="Search Brand" CssClass="modalText"
                            AutoPostBack="True" Height="16px" Font-Size="10px" Width="150px" 
                            ToolTip="Search Brand" ontextchanged="txtSearch_TextChanged"></asp:TextBox>
                        <asp:ImageButton ID="imgBtnSearch" runat="server" ImageAlign="AbsBottom" ImageUrl="~/Resources/search.png"
                            ToolTip="SEARCH" />
                    </div>
                    <div style="float: left;">
                        <div style="float: left; margin-right: 5px;">
                            <a style="text-decoration: none;" href="NewFitting.aspx" title="New Fitting">
                                <input id="btnNewBrand" type="button" value="NEW" class="btnNew" />
                            </a>
                        </div>
                        <div style="float: left; margin-right: 5px;">
                            <asp:Button ID="btnUpdateBrand" runat="server" Text="UPDATE" CssClass="btnUpdate"
                                Font-Names="Verdana" ViewStateMode="Disabled" />
                            <asp:ModalPopupExtender ID="btnUpdateBrand_ModalPopupExtender" runat="server" 
                                CancelControlID="btnSaveFittingUpdateCancel" DynamicServicePath="" 
                                Enabled="True" PopupControlID="pnlUpdateFittingModal" 
                                PopupDragHandleControlID="pnlUpdateFittingModalDrag" 
                                TargetControlID="btnUpdateBrand">
                            </asp:ModalPopupExtender>
                        </div>
                        <div style="float: left; margin-right: 5px;">
                            <asp:Button ID="btnDelete" runat="server" Text="DELETE" CssClass="btnDelete" Font-Names="Verdana"
                                ViewStateMode="Disabled" />
                            <asp:ModalPopupExtender ID="btnDelete_ModalPopupExtender" runat="server" 
                                CancelControlID="btnDeleteFittingCancel" DynamicServicePath="" Enabled="True" 
                                PopupControlID="pnlDeleteFittingModal" 
                                PopupDragHandleControlID="pnlDeleteFittingModalDrag" 
                                TargetControlID="btnDelete" BackgroundCssClass="bgModal">
                            </asp:ModalPopupExtender>
                        </div>
                        <div style="float: left; margin-right: 5px;">
                            <asp:Button ID="btnPrint" runat="server" Text="PRINT" CssClass="btnPrint" Font-Names="Verdana"
                                ViewStateMode="Disabled" />
                        </div>
                        <div style="float: left; margin-right: 5px;">
                            <asp:UpdateProgress ID="upProgress" runat="server" AssociatedUpdatePanelID="upnlFittings">
                                <ProgressTemplate>
                                    <asp:PlaceHolder ID="plcHLoader" runat="server" EnableViewState="False">
                                        <UC:LOADER ID="loader" runat="server" />
                                    </asp:PlaceHolder>
                                </ProgressTemplate>
                            </asp:UpdateProgress>
                        </div>
                    </div>
                </div>
                <div>
                    <div style="float: left; display: block; margin-right: 2px; min-width: 450px;">
                        <div class="titleList">
                            <img alt="brands" src="../Resources/fit.png" height="16" width="20" align="left" />
                            LIST OF FITTING
                        </div>

                        <div>
                            <asp:HiddenField ID="hfFittingCode" runat="server" />
                            <asp:GridView ID="gvFittings" runat="server" AllowPaging="True" AllowSorting="True"
                                AutoGenerateColumns="False" CellPadding="4" CssClass="table_grid" DataKeyNames="RECORD_NO,FITTING_CODE"
                                DataSourceID="SqlDataSourceFittings" GridLines="None" PageSize="15" OnSelectedIndexChanged="gvFittings_SelectedIndexChanged">
                                <AlternatingRowStyle BackColor="White" />
                                <Columns>
                                    <asp:TemplateField>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Image ID="Image1" runat="server" ImageUrl="~/Resources/fit.png" Height="16px" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:CommandField ShowSelectButton="True" />
                                    <asp:BoundField DataField="RECORD_NO" HeaderText="RECORD #" InsertVisible="False"
                                        ReadOnly="True" SortExpression="RECORD_NO">
                                        <ItemStyle Font-Bold="True" HorizontalAlign="Center" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="FITTING_SERIES_CODE" HeaderText="CODE" />
                                    <asp:BoundField DataField="FIITING_CODE" HeaderText="FIITING_CODE" SortExpression="FIITING_CODE"
                                        Visible="False" />
                                    <asp:BoundField DataField="FITTING_NAME" HeaderText="FITTING NAME" SortExpression="FITTING_NAME" />
                                    <asp:BoundField DataField="CATEGORY" HeaderText="CATEGORY" 
                                        SortExpression="CATEGORY" HtmlEncode="False">
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="BRAND_NAME" HeaderText="BRAND" 
                                        SortExpression="BRAND_NAME" />
                                    <asp:BoundField DataField="DATE_RECORDED" HeaderText="DATE_RECORDED" SortExpression="DATE_RECORDED" />
                                </Columns>
                                <EditRowStyle BackColor="#7C6F57" />
                                <EmptyDataTemplate>
                                    <img src="../Resources/unhappy.png" align="middle" />
                                    EMPTY DATA!!
                                </EmptyDataTemplate>
                                <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                <PagerStyle CssClass="pager" />
                                <RowStyle BackColor="#E3EAEB" />
                                <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                                <SortedAscendingCellStyle CssClass="asc_cell_style" />
                                <SortedAscendingHeaderStyle CssClass="asc_cell_style_h" />
                                <SortedDescendingCellStyle CssClass="desc_cell_style" />
                                <SortedDescendingHeaderStyle CssClass="desc_cell_style_h" />
                            </asp:GridView>
                            <asp:SqlDataSource ID="SqlDataSourceFittings" runat="server" ConnectionString="<%$ ConnectionStrings:IRMSConnectionString %>"
                                SelectCommand="SELECT * FROM [FITTINGS] ORDER BY RECORD_NO DESC"></asp:SqlDataSource>
                        </div>
                    </div>
                    <div style="float: left; display: inline-block; min-width: 300px;">
                        <div class="titleList">
                            <img alt="brands" src="../Resources/fit.png" height="16" width="20" align="left" />
                            LIST OF SUB-FITTING
                           <asp:Button ID="btnAddNewSubFitting" CssClass="btnAddSubFitting" title="Add SubFitting" runat="server" 
            Font-Bold="true" Height="20px" Font-Size="12px" Text="+" />
                            <asp:ModalPopupExtender ID="btnAddNewSubFitting_ModalPopupExtender" 
                                runat="server" CancelControlID="btnCanceNewSubFitting" DynamicServicePath="" 
                                Enabled="True" PopupControlID="pnlAddSubFittingModal" 
                                PopupDragHandleControlID="pnlAddSubFittingModalDrag" 
                                TargetControlID="btnAddNewSubFitting" BackgroundCssClass="bgModal">
                            </asp:ModalPopupExtender>
                           <asp:Button ID="btnDeleteSubFitting" CssClass="btnAddSubFitting" title="Delete SubFitting" runat="server" 
            Font-Bold="true" Height="20px" Font-Size="12px" Text="-" />
                            <asp:ModalPopupExtender ID="btnDeleteSubFitting_ModalPopupExtender" 
                                runat="server" CancelControlID="btnDeleteSubFittingCancel" 
                                DynamicServicePath="" Enabled="True" PopupControlID="pnlDeteleSubFittingModal" 
                                PopupDragHandleControlID="pnlDeteleSubFittingModalDrag" 
                                TargetControlID="btnDeleteSubFitting" BackgroundCssClass="bgModal">
                            </asp:ModalPopupExtender>
                        </div>
                        <div>
                            <asp:GridView ID="gvSubFittings" runat="server" CellPadding="4" CssClass="table_grid"
                                GridLines="None" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False"
                                DataKeyNames="RECORD_NO" DataSourceID="SqlDataSourceSubFittings" 
                                onselectedindexchanged="gvSubFittings_SelectedIndexChanged">
                                <AlternatingRowStyle BackColor="White" />
                                <Columns>
                                    <asp:CommandField ShowSelectButton="True" />
                                    <asp:BoundField DataField="RECORD_NO" HeaderText="RECORD_NO" InsertVisible="False"
                                        ReadOnly="True" SortExpression="RECORD_NO" Visible="False" />
                                    <asp:BoundField DataField="FITTING_CODE" HeaderText="FITTING_CODE" SortExpression="FITTING_CODE"
                                        Visible="False" />
                                    <asp:BoundField DataField="SUB_FITTING_DESC" HeaderText="SUB FITTING DESC." SortExpression="SUB_FITTING_DESC" />
                                    <asp:BoundField DataField="DATE_RECORDED" HeaderText="DATE RECORDED" SortExpression="DATE_RECORDED" />
                                </Columns>
                                <EditRowStyle BackColor="#7C6F57" />
                                <EmptyDataTemplate>
                                    <img src="../Resources/unhappy.png" align="middle" />
                                    EMPTY DATA!!!
                                    <br />
                                    PLEASE SELECT FROM THE FITTING LIST.
                                </EmptyDataTemplate>
                                <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                <PagerStyle CssClass="pager"/>
                                <RowStyle BackColor="#E3EAEB" />
                                <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                                <SortedAscendingCellStyle CssClass="asc_cell_style" />
                                <SortedAscendingHeaderStyle  CssClass="asc_cell_style_h"/>
                                <SortedDescendingCellStyle CssClass="desc_cell_style" />
                                <SortedDescendingHeaderStyle CssClass="desc_cell_style_h" />
                            </asp:GridView>
                            <asp:SqlDataSource ID="SqlDataSourceSubFittings" runat="server" ConnectionString="<%$ ConnectionStrings:IRMSConnectionString %>"
                                SelectCommand="SELECT * FROM [SUB_FITTINGS] WHERE ([FITTING_CODE] = @FITTING_CODE)">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="hfFittingCode" Name="FITTING_CODE" PropertyName="Value"
                                        Type="String" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </div>
                    </div>

                    <asp:Panel CssClass="permission-container" ID="pnlNotification" Visible ="false" runat="server">
                <asp:CollapsiblePanelExtender ID="CollapsiblePaneItemMaster" runat="server" CollapseControlID="lblNoteCollapsHandler"
                CollapsedText="dennis" ExpandedText="pitallano" TargetControlID="pnlPermissionNotification"
                ExpandControlID="lblNoteCollapsHandler" Collapsed="True">
               </asp:CollapsiblePanelExtender>
               <div class="collaps-link">
                <asp:Label CssClass="collaps-text" ID="lblNoteCollapsHandler" Height="48px" runat="server" Text="NOTE"
                ToolTip="Show/Hide Notification"></asp:Label>
                </div>
              <asp:Panel CssClass="note-container" ID="pnlPermissionNotification" runat="server">
               <asp:Label ID="lblPermissionNotifications" runat="server" Text="Label"></asp:Label>
              </asp:Panel>
            </asp:Panel>

                </div>
                <asp:Panel ID="pnlDeleteFittingModal" CssClass="modal" runat="server">
                    <asp:Panel ID="pnlDeleteFittingModalDrag" CssClass="modalDrag" runat="server">
                        <div class="sizeLogo">
                            <img src="../Resources/question.png" height="16px" align="top" />
                            CONFIRMATION!!!
                        </div>
                    </asp:Panel>
                    <div class="form-label" style=" text-align:center; padding:5px; margin:5px; font-size:12px;">
                      <img src="../Resources/question.png" align="middle" />
                        Are you sure you want to delete this data?
                        <br />
                        <asp:Label ID="lblFittingToDelete" runat="server" Text="No Data to Delete, please select from the list."></asp:Label>
                    </div>
                    <div style="text-align :center; margin:5px;">
                        <asp:Button ID="btnOKDeleteFitting" CssClass="modalWarningButtonYes" 
                            Enabled="false"  runat="server" Text="YES" onclick="btnOKDeleteFitting_Click" />
                        <asp:Button ID="btnDeleteFittingCancel" CssClass="modalWarningButtonNo"  runat="server" Text="NO" />
                    </div>
                </asp:Panel>

                <asp:Panel ID="pnlDeteleSubFittingModal" CssClass="modal" runat="server">
                    <asp:Panel ID="pnlDeteleSubFittingModalDrag" CssClass="modalDrag" runat="server">
                        <div class="sizeLogo">
                            <img src="../Resources/question.png" height="16px" align="top" />
                            CONFIRMATION!!!
                        </div>
                    </asp:Panel>
                    <div class="form-label" style=" text-align:center; padding:5px; margin:5px; font-size:12px;">
                      <img src="../Resources/question.png" align="middle" />
                        Are you sure you want to delete this data?
                           <br />
                        <asp:Label ID="lblSubFittingToDelete" runat="server" Text="No Data to Delete, please select from the list."></asp:Label>
                    </div>
                    <div style="text-align :center; margin:5px;">
                        <asp:Button ID="btnDeleteSubFittingOK" CssClass="modalWarningButtonYes" 
                            Enabled="false"  runat="server" Text="YES" 
                            onclick="btnDeleteSubFittingOK_Click" />
                        <asp:Button ID="btnDeleteSubFittingCancel" CssClass="modalWarningButtonNo"  runat="server" Text="NO" />
                    </div>
                </asp:Panel>

                <asp:Panel ID="pnlAddSubFittingModal" CssClass="modal" runat="server">
                    <asp:Panel ID="pnlAddSubFittingModalDrag" CssClass="modalDrag" runat="server" >
                        <div class="sizeLogo">
                            <img src="../Resources/fit.png" height="16px" align="top" />
                             NEW SUB-FITTING
                        </div>
                    </asp:Panel>
                    <div style="margin:5px;">
                        <IRMS:FSUBFITTING ID="fSubFitting" runat="server" />
                    </div>
                    <div style="text-align :center; margin:5px;">
                        <asp:Button ID="btnSaveSubFitting" CssClass="btnSave" 
                            runat="server" Text="SAVE" onclick="btnSaveSubFitting_Click" />
                        <asp:Button ID="btnCanceNewSubFitting" CssClass="btnCancel"  runat="server" Text="CANCEL" />
                    </div>
                </asp:Panel>

                <asp:Panel CssClass="modal" ID="pnlUpdateFittingModal" runat="server" >
                    <asp:Panel CssClass="modalDrag" ID="pnlUpdateFittingModalDrag" runat="server">
                        <div class="sizeLogo" >
                            <img src="../Resources/fit.png" height="16px" align="top" />
                            UPDATE FITTING
                        </div>
                    </asp:Panel>
                    <div style="margin:5px 5px 2px 5px;">
                       <IRMS:FITTING ID="fFitting" runat="server" />
                    </div>
                    <div style="text-align:center; margin:5px;">
                        <asp:Button ID="btnSaveFittingUpdate" CssClass="btnSave" runat="server" 
                            Text="SAVE" onclick="btnSaveFittingUpdate_Click" />
                        <asp:Button ID="btnSaveFittingUpdateCancel" CssClass="btnCancel" runat="server" Text="CANCEL" />
                    </div>
                </asp:Panel>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>
