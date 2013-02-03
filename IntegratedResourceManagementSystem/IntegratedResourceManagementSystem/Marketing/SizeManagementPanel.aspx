<%@ Page Title="" Language="C#" MasterPageFile="~/Marketing/Marketing.Master" AutoEventWireup="true"
    CodeBehind="SizeManagementPanel.aspx.cs" Inherits="IntegratedResourceManagementSystem.Marketing.SizeManagementPanel" %>

<%@ OutputCache CacheProfile="cached_profile" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register TagPrefix="form" TagName="Size" Src="~/Marketing/forms/FSize.ascx" %>
<%@ Register TagPrefix="form" TagName="SizeGroup" Src="~/Marketing/forms/FSizeGroup.ascx" %>
<%@ Register Src="~/Marketing/controls/UCLoader.ascx" TagName="LOADER" TagPrefix="UC" %>
<asp:Content ID="HeadContent" ContentPlaceHolderID="head" runat="server">
    <link href="../Styles/size-management.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/permission-note.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
     <div style="height:28px; margin-bottom:10px; line-height:28px; color: #333;text-shadow: 1px 1px 0px white;">
                <asp:Image ID="imgpnlTitle" runat="server" ImageUrl="~/Resources/size.png" ImageAlign="Top"
                    Height="28px" />
                &nbsp;
                <asp:Label ID="Label3" runat="server" Text="SIZE MANAGEMENT PANEL" Font-Bold="True"
                    Font-Names="Verdana" Font-Size="14px"></asp:Label>
                <div style="float: right;">
                    <asp:ImageButton ID="imgBtnBack" runat="server" ImageUrl="~/Resources/reply.png"
                        PostBackUrl="~/Marketing/StylePanel.aspx" ToolTip="BACK" />
                </div>
                    <hr />
            </div>
    <asp:UpdatePanel ID="upnlNewSize" runat="server">
        <ContentTemplate>
       
            <div style="margin-bottom:1px; height:26px;" class="modalDrag">
                <div style="float: right;" class="SearchTextContainer">
                SEARCH:
                    <asp:TextBox ID="txtSearch" autofocus placeholder="Search Size" runat="server" CssClass="modalText" OnTextChanged="txtSearch_TextChanged"
                        AutoPostBack="True" Height="16px" Font-Size="10px" Width="150px" ToolTip="Search Category"></asp:TextBox>
                    <asp:ImageButton ID="imgBtnSearch" runat="server" ImageAlign="AbsBottom" ImageUrl="~/Resources/search.png"
                        ToolTip="SEARCH" />
                </div>
                <div style="float: left;">
                    <div style="float: left; margin-right: 5px;">
                        <asp:Button ID="btnNewSize" runat="server" CssClass="btnNew" Font-Names="Verdana"
                            Text="NEW" />
                        <asp:ModalPopupExtender ID="btnNewSize_ModalPopupExtender" runat="server" BackgroundCssClass="bgModal"
                            CancelControlID="imgBtnCloseNewSizeModal" DynamicServicePath="" Enabled="True"
                            PopupControlID="pnlNewSizeModal" PopupDragHandleControlID="pnlNewSizeModalDrag"
                            TargetControlID="btnNewSize">
                            <Animations>
                                <OnShown>
                                    <FadeIn Duration=".2" />
                                </OnShown>
                            </Animations>
                        </asp:ModalPopupExtender>
                    </div>
                    <div style="float: left; margin-right: 5px;">
                        <asp:Button ID="btnUpdateSize" runat="server" CssClass="btnUpdate" Font-Names="Verdana"
                            Text="UPDATE" />
                        <asp:ModalPopupExtender ID="btnUpdateSize_ModalPopupExtender" runat="server" BackgroundCssClass="bgModal"
                            CancelControlID="imgBtnCloseUpdateSizeModal" DynamicServicePath="" Enabled="True"
                            PopupControlID="pnlUpdateSizeModal" PopupDragHandleControlID="pnlUpdateSizeModalDrag"
                            TargetControlID="btnUpdateSize">
                            <Animations>
                                <OnShown>
                                    <FadeIn Duration=".2" />
                                </OnShown>
                            </Animations>
                        </asp:ModalPopupExtender>
                    </div>
                    <div style="float: left; margin-right: 5px;">
                        <asp:Button ID="btnDelete" runat="server" CssClass="btnDelete" Font-Names="Verdana"
                            Text="DELETE" />
                        <asp:ModalPopupExtender ID="btnDelete_ModalPopupExtender" runat="server" DynamicServicePath=""
                            Enabled="True" PopupControlID="pnlDeleteModal" PopupDragHandleControlID="pnlDeleteModalDrag"
                            TargetControlID="btnDelete" CancelControlID="btnNo" BackgroundCssClass="bgModal">
                            <Animations>
                                <OnShown>
                                    <FadeIn Duration=".2" />
                                </OnShown>
                            </Animations>
                        </asp:ModalPopupExtender>
                    </div>
                    <div style="float: left; margin-right: 5px;">
                        <asp:Button ID="btnSizesDisplayIndexManagement" runat="server" CssClass="btnUpdate"
                            Font-Names="Verdana" Font-Size="9px" Width="110px" PostBackUrl="~/Marketing/SizesDisplayIndexManagementPanel.aspx" />
                    </div>
                    <div style="float: left; margin-right: 5px;">
                        <asp:Button ID="btnPrint" runat="server" CssClass="btnPrint" Font-Names="Verdana" Text="PRINT" />
                    </div>
                    <div style="float: left; margin-right: 5px;">
                        <asp:UpdateProgress ID="upProgress" runat="server" AssociatedUpdatePanelID="upnlNewSize">
                            <ProgressTemplate>
                                <asp:PlaceHolder ID="plcHLoader" runat="server">
                                    <UC:LOADER ID="loader" runat="server" />
                                </asp:PlaceHolder>
                            </ProgressTemplate>
                        </asp:UpdateProgress>
                    </div>
                </div>
            </div>
            <div class="titleList">
            <img alt="new color" src="../Resources/size.png" height="16" align="top" />
                LIST OF SIZES
            </div>
            <div class="listContent" style="float:left;">
                <asp:Panel ID="pnlSizesList" runat="server" Width="595px" Height="410px" ScrollBars="Auto">
                    <asp:GridView ID="gvSizesList" runat="server" CellPadding="4" 
                        GridLines="None" AutoGenerateColumns="False"  CssClass="table_grid"
                        OnSelectedIndexChanged="gvSizesList_SelectedIndexChanged" DataKeyNames="RECORD_NO"
                        EnablePersistedSelection="True" AllowPaging="True" AllowSorting="True" DataSourceID="SqlDataSourceSizes"
                        PageSize="15">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:TemplateField>
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Image ID="imgSize" runat="server" Height="16px" ImageUrl="~/Resources/size.png"
                                        AlternateText='<%# Eval("RECORD_NO")+"-"+ Eval("DISPLAY_INDEX")+"-"+ Eval("SIZE_GROUP_ID") %>'  />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:CommandField ShowSelectButton="True" />
                            <asp:BoundField DataField="RECORD_NO" HeaderText="RECORD#" InsertVisible="False"
                                ReadOnly="True" SortExpression="RECORD_NO" Visible="False">
                                <ItemStyle Font-Bold="True" HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="SIZE_CODE" HeaderText="SIZE CODE" SortExpression="SIZE_CODE">
                            </asp:BoundField>
                            <asp:BoundField DataField="SIZE_DESCRIPTION" HeaderText="SIZE DESCRIPTION" SortExpression="SIZE_DESCRIPTION">
                            </asp:BoundField>
                            <asp:BoundField DataField="DATE_RECORDED" HeaderText="DATE RECORDED" SortExpression="DATE_RECORDED">
                            </asp:BoundField>
                            <asp:BoundField DataField="SIZE_GROUP" HeaderText="SIZE GROUP" SortExpression="SIZE_GROUP" />
                        </Columns>
                        <EditRowStyle BackColor="#7C6F57" />
                        <EmptyDataTemplate>
                            <asp:Image ID="Image2" runat="server" ImageUrl="~/Resources/unhappy.png" ImageAlign="AbsMiddle" />
                            NULL DATA!!
                        </EmptyDataTemplate>
                        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                        <PagerStyle CssClass="pager" />
                        <RowStyle BackColor="#E3EAEB" />
                        <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="False" ForeColor="#333333" Font-Names="Verdana"
                            Font-Size="11px" Font-Italic="True" />
                        <SortedAscendingCellStyle CssClass="asc_cell_style" />
                        <SortedAscendingHeaderStyle  CssClass="asc_cell_style_h"/>
                        <SortedDescendingCellStyle  CssClass="desc_cell_style" />
                        <SortedDescendingHeaderStyle  CssClass="desc_cell_style_h" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSourceSizes" runat="server" ConnectionString="<%$ ConnectionStrings:IRMSConnectionString %>"
                        SelectCommand="SP_GET_ALL_SIZES" SelectCommandType ="StoredProcedure">
                    </asp:SqlDataSource>
                </asp:Panel>
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

            <%--New Size Modal--%>
            <asp:Panel ID="pnlNewSizeModal" runat="server" CssClass="modal">
                <asp:Panel ID="pnlNewSizeModalDrag" runat="server" CssClass="modalDrag">
                    <div class="close_btn">
                        <asp:ImageButton ID="imgBtnCloseNewSizeModal" runat="server" CssClass="btnClose"
                            ImageUrl="~/Resources/cancel_gray.png" ToolTip="CLOSE" />
                    </div>
                    <div class="sizeLogo">
                        <img alt="new color" src="../Resources/size.png" height="16" align="top" />
                        NEW SIZE
                    </div>
                </asp:Panel>
                <table cellpadding="0px" cellspacing="0px">
                    <tr>
                        <td colspan="2">
                            <asp:PlaceHolder ID="phNewSize" runat="server">
                                <form:Size ID="fSize" runat="server"></form:Size>
                            </asp:PlaceHolder>
                        </td>
                        <td>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: right;">
                            <asp:Label ID="Label1" runat="server" Text="SIZE GROUP:" CssClass="modalLabel"></asp:Label>
                        </td>
                        <td>
                            <asp:DropDownList ID="dlSizeGroups" runat="server" DataSourceID="SqlDataSourceSizeGroup"
                                DataTextField="SIZE_GROUP" DataValueField="RECORD_NO"  CssClass ="modalText" Height="20px" AutoPostBack="True" OnSelectedIndexChanged="dlSizeGroups_SelectedIndexChanged">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSourceSizeGroup" runat="server" ConnectionString="<%$ ConnectionStrings:IRMSConnectionString %>"
                                SelectCommand="SELECT * FROM [SIZE_GROUP]"></asp:SqlDataSource>
                        </td>
                        <td valign="bottom">
                            <asp:Button ID="btnNewSizeGroup" runat="server" Text="+" Font-Bold="True" Font-Names="Verdana"
                                Font-Size="11px" ForeColor="#CC6600" Width="20px" ToolTip="NEW SIZE GROUP" />
                            <asp:ModalPopupExtender ID="btnNewSizeGroup_ModalPopupExtender" runat="server" CancelControlID="ibtnClosepnlNewGroupSize"
                                DynamicServicePath="" Enabled="True" PopupControlID="pnlNewGroupSize" PopupDragHandleControlID="pnlNewGroupSizeDrag"
                                TargetControlID="btnNewSizeGroup">
                            </asp:ModalPopupExtender>
                            <asp:Button ID="btnDeleteSizeGroup" runat="server" Font-Bold="True" Font-Names="Verdana"
                                Font-Size="11px" ForeColor="#CC6600" Text="-" ToolTip="DELETE SIZE GROUP" Width="20px" />
                            <asp:ModalPopupExtender ID="btnDeleteSizeGroup_ModalPopupExtender" runat="server"
                                CancelControlID="btnNoDeleteGroupSize" DynamicServicePath="" Enabled="True" PopupControlID="pnlDeleteGroupSize"
                                PopupDragHandleControlID="pnlDeleteGroupSizeDrag" TargetControlID="btnDeleteSizeGroup">
                            </asp:ModalPopupExtender>
                        </td>
                    </tr>
                    <tr>
                        <td>
                        </td>
                        <td>
                            <asp:Label ID="Label5" runat="server" Text="Set Display Index" Font-Italic="True"
                                Font-Size="11px" ForeColor="#CCFFCC"></asp:Label>
                        </td>
                        <td>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: right; border-top-style: solid; border-top-width: 1px; border-top-color: #CCCCCC;">
                            <asp:Label ID="Label6" runat="server" Font-Names="Verdana" Font-Size="11px" ForeColor="#FFFFCC"
                                Text="INSERT TO:"></asp:Label>
                        </td>
                        <td style="border-top-style: solid; border-top-width: 1px; border-top-color: #CCCCCC;
                            padding-top: 5px;">
                            <asp:RadioButtonList ID="rdioLastBeginning" runat="server" AutoPostBack="True" BackColor="#FFFFCC"
                                BorderColor="#FF9933" BorderWidth="1px" Font-Names="Verdana" Font-Size="10px"
                                ForeColor="#CC6600" RepeatDirection="Horizontal" RepeatLayout="Flow" OnSelectedIndexChanged="rdioLastBeginning_SelectedIndexChanged">
                                <asp:ListItem Selected="True">LAST</asp:ListItem>
                                <asp:ListItem>BEGINNING</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                        <td style="text-align: right; border-top-style: solid; border-top-width: 1px; border-top-color: #CCCCCC;">
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: right; border-top-style: solid; border-top-width: 1px; border-top-color: #CCCCCC;">
                            <asp:Label ID="Label4" runat="server" Text="OR INSERT BEFORE:" Font-Names="Verdana"
                                Font-Size="10px" ForeColor="#FFFFCC"></asp:Label>
                        </td>
                        <td style="border-top-style: solid; border-top-width: 1px; border-top-color: #CCCCCC;
                            padding-top: 5px;">
                            <asp:DropDownList ID="dlSizesByGroup" runat="server" DataSourceID="SqlDataSourceSizeByGroup"
                                DataTextField="SIZE_DESCRIPTION" DataValueField="RECORD_NO"  CssClass ="modalText" Height="20px" Enabled="False">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSourceSizeByGroup" runat="server" ConnectionString="<%$ ConnectionStrings:IRMSConnectionString %>"
                                SelectCommand="SELECT [RECORD_NO], [SIZE_DESCRIPTION] FROM [SIZES] WHERE ([SIZE_GROUP] = @SIZE_GROUP) ORDER BY DISPLAY_INDEX ASC">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="dlSizeGroups" Name="SIZE_GROUP" PropertyName="SelectedValue"
                                        Type="Int64" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </td>
                        <td style="border-top-style: solid; border-top-width: 1px; border-top-color: #CCCCCC; text-align :left;">
                            <asp:CheckBox ID="chkInsertBefore" Text="Enable" runat="server" AutoPostBack="True"
                                Font-Bold="True" Font-Italic="False" Font-Names="Verdana" Font-Size="10px" ForeColor="#CCFFCC"
                                OnCheckedChanged="chkInsertBefore_CheckedChanged" />
                        </td>
                    </tr>
                </table>
                <div style="text-align: center; margin-top: 5px; margin-bottom: 5px;">
                    <asp:Button ID="btnSaveSize" runat="server" Text="SAVE" CssClass="btnSave" ToolTip="Save New Size"
                        OnClick="btnSaveSize_Click" />
                </div>
            </asp:Panel>
                 
            <%--Update Modal--%>
            <asp:Panel ID="pnlUpdateSizeModal" runat="server" CssClass="modal">
                <asp:Panel ID="pnlUpdateSizeModalDrag" runat="server" CssClass="modalDrag">
                    <div class="close_btn">
                        <asp:ImageButton ID="imgBtnCloseUpdateSizeModal" runat="server" CssClass="btnClose"
                            ImageUrl="~/Resources/cancel_gray.png" ToolTip="CLOSE" />
                    </div>
                    <div class="sizeLogo">
                        <img alt="new color" src="../Resources/size.png" height="16" align="top" />
                        UPDATE SIZE
                    </div>
                </asp:Panel>
                <table cellpadding="0px" cellspacing="0px">
                    <tr>
                        <td colspan="3">
                            <asp:PlaceHolder ID="phUpdateSize" runat="server">
                                <form:Size ID="fSize_update" runat="server"></form:Size>
                            </asp:PlaceHolder>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: right;">
                            <asp:Label ID="Label2" runat="server" Text="SIZE GROUP:" CssClass="modalLabel"></asp:Label>
                        </td>
                        <td>
                            <asp:DropDownList ID="dlSizeGroupUpdate" runat="server" DataSourceID="SqlDataSourceSizeGroup"
                                DataTextField="SIZE_GROUP" DataValueField="RECORD_NO" Font-Names="Verdana" Font-Size="11px"
                                ForeColor="#CC6600" Height="20px" AutoPostBack="True" OnSelectedIndexChanged="dlSizeGroupUpdate_SelectedIndexChanged">
                            </asp:DropDownList>
                        </td>
                        <td valign="bottom" style="padding-left: 27px;">
                        </td>
                        <td>
                        </td>
                    </tr>
                </table>
                 <asp:Panel ID="updateErrorMessage" runat="server">
                    <div style="border: 1px solid #FFCC66; text-align: center; font-family: Verdana;
                        font-size: 12px; height: 23px; color: #CC6600; background-color: #FFFF99; line-height: 16px;">
                        <img alt="error update" src="../Resources/warning.png" height="22px" align="middle" />
                        No selected data to update.
                    </div>
                </asp:Panel>
                <div style="text-align: center; margin: 5px 0px;">
                    <asp:Button ID="btnSaveUpdate" runat="server" Text="SAVE" CssClass="btnSave" ToolTip="Update Size"
                        OnClick="btnSaveUpdate_Click" />
                </div>
            </asp:Panel>
           
            <%--New Group Size--%>
            <asp:Panel ID="pnlNewGroupSize" runat="server" CssClass="modal">
                <asp:Panel ID="pnlNewGroupSizeDrag" runat="server" CssClass="modalDrag">
                    <div class="close_btn">
                        <asp:ImageButton ID="ibtnClosepnlNewGroupSize" runat="server" CssClass="btnClose"
                            ImageUrl="~/Resources/cancel_gray.png" ToolTip="CLOSE" />
                    </div>
                    <div class="sizeLogo">
                         <img alt="new color" src="../Resources/size.png" height="16" align="top" />
                        NEW SIZE GROUP
                    </div>
                </asp:Panel>
                <asp:PlaceHolder ID="PlaceHolder1" runat="server">
                    <form:SizeGroup ID="fSizeGroup" runat="server" />
                </asp:PlaceHolder>
                <div style="text-align: center; margin: 5px 0px;">
                    <asp:Button ID="btnSaveSizeGroup" runat="server" Text="SAVE" CssClass="btnSave" ToolTip="Save Size Group"
                        OnClick="btnSaveSizeGroup_Click" />
                </div>
            </asp:Panel>
        
            <%--Delete Modal--%>
            <asp:Panel ID="pnlDeleteModal" runat="server" CssClass="modal">
                <asp:Panel ID="pnlDeleteModalDrag" runat="server" CssClass="modalDrag">
                    <div class="sizeLogo">
                       <img alt="new size" src="../Resources/size.png" height="16" align="top" />
                        CONFIRMATION!!!
                    </div>
                </asp:Panel>
                <div style="border: 1px solid #FFCC66; text-align: center; font-family: Verdana;
                    font-size: 12px; height: 23px; color: #CC6600; background-color: #FFFF99; line-height: 16px;
                    margin: 2px 5px;">
                    <img alt="error update" src="../Resources/warning.png" height="22px" align="middle" />
                    Warning: This action cannot be undo.
                </div>
                <div style="text-align: center; color: #FFFF99; font-family: Verdana; font-size: 11px;
                    margin: 5px 2px;">
                     <asp:Label ID="lblSizeToDelete" runat="server" Text="No data to delete. Select from the list and try again."></asp:Label>
                </div>
                <div style=" text-align:center; margin:5px 0px;">
                    <asp:Button ID="btnYes" runat="server" Text="YES" CssClass="modalWarningButtonYes"
                        ToolTip="Delete" OnClick="btnYes_Click" />
                    <asp:Button ID="btnNo" runat="server" Text="NO" CssClass="modalWarningButtonNo" ToolTip="Cancel" />
                </div>
            </asp:Panel>
          
            <%--Delete Group Size Modal--%>
            <asp:Panel ID="pnlDeleteGroupSize" runat="server" CssClass="modal">
                <asp:Panel ID="pnlDeleteGroupSizeDrag" runat="server" CssClass="modalDrag">
                    <div class="sizeLogo">
                        <img alt="new size" src="../Resources/size.png" height="16" align="top" />
                        CONFIRMATION!!!
                    </div>
                </asp:Panel>
                 <div style="border: 1px solid #FFCC66; text-align: center; font-family: Verdana;
                    font-size: 12px; height: 23px; color: #CC6600; background-color: #FFFF99; line-height: 16px;
                    margin: 2px 5px;">
                    <img alt="error update" src="../Resources/warning.png" height="22px" align="middle" />
                    Warning: This action cannot be undo.
                </div>
                <div style="text-align: center; color: #FFFF99; font-family: Verdana; font-size: 11px;
                    margin: 5px 2px;">
                    <asp:Label ID="lblGroupSizeToDelete" runat="server" Text="Are you sure you want to delete this data?"></asp:Label>
                </div>
                <div style="text-align:center; margin:5px 0px;">
                    <asp:Button ID="btnYesDeleteGroupSize" runat="server" Text="YES" CssClass="modalWarningButtonYes"
                        ToolTip="Delete" OnClick="btnYesDeleteGroupSize_Click" />
                    <asp:Button ID="btnNoDeleteGroupSize" runat="server" Text="NO" CssClass="modalWarningButtonNo"
                        ToolTip="Cancel" />
                </div>
            </asp:Panel>
          
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
