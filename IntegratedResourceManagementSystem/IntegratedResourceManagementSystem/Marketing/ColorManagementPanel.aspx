<%@ Page Title="" Language="C#" MasterPageFile="~/Marketing/Marketing.Master" AutoEventWireup="true"
    CodeBehind="ColorManagementPanel.aspx.cs" Inherits="IntegratedResourceManagementSystem.Marketing.ColorManagementPanel" %>
<%@ OutputCache CacheProfile="cached_profile" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register TagPrefix="uc" TagName="color_picker" Src="~/Marketing/controls/color_picker.ascx" %>
<%@ Register Src="~/Marketing/controls/UCLoader.ascx" TagName="LOADER" TagPrefix="UC" %>
<asp:Content ID="HeadContent" ContentPlaceHolderID="head" runat="server">
    <link href="../Styles/color-management.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/permission-note.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

       <div  style="height:28px; margin-bottom:10px; line-height:28px; color: #333;text-shadow: 1px 1px 0px white;">
                <asp:Image ID="imgpnlTitle" runat="server" ImageUrl="~/Resources/color.png" ImageAlign="Top"
                    Height="28px" />
                &nbsp;<asp:Label ID="Label3" runat="server" Text="COLOR MANAGEMENT PANEL" Font-Bold="True"
                    Font-Names="Verdana" Font-Size="14px"></asp:Label>
                <div style="float: right;">
                    <asp:ImageButton ID="imgBtnBack" runat="server" ImageUrl="~/Resources/reply.png"
                        PostBackUrl="~/Marketing/StylePanel.aspx" ToolTip="BACK" />
                </div>
                    <hr />
            </div>
    <asp:UpdatePanel ID="upnlColor" runat="server">
        <ContentTemplate>
            <div style="margin-bottom: 1px; height: 26px;" class="modalDrag">
                <div style="float: right;" class="SearchTextContainer">
                SEARCH:
                    <asp:TextBox ID="txtSearch" runat="server" autofocus placeholder="Search Color" CssClass="modalText" OnTextChanged="txtSearch_TextChanged"
                        AutoPostBack="True" Height="16px" Font-Size="10px" Width="150px" ToolTip="Search Color"></asp:TextBox>
                    <asp:ImageButton ID="imgBtnSearch" runat="server" ImageAlign="AbsBottom" ImageUrl="~/Resources/search.png"
                        ToolTip="SEARCH" />
                </div>
                <div style="float: left;">
                    <div style="float: left; margin-right: 5px;">
                        <asp:Button ID="btnNewColor" runat="server" Text="NEW" CssClass="btnNew" Font-Names="Verdana" />
                        <asp:ModalPopupExtender ID="btnNewSize_ModalPopupExtender" runat="server" DynamicServicePath=""
                            Enabled="True" PopupControlID="pnlNewSizeModal" PopupDragHandleControlID="pnlNewSizeModalDrag"
                            TargetControlID="btnNewColor" BackgroundCssClass="bgModal" CancelControlID="imgBtnCloseNewSizeModal">
                            <Animations>
                                        <OnShown>
                                            <FadeIn Duration=".2" />
                                        </OnShown>
                            </Animations>
                        </asp:ModalPopupExtender>
                    </div>
                    <div style="float: left; margin-right: 5px;">
                        <asp:Button ID="btnUpdateColor" runat="server" Text="UPDATE" CssClass="btnUpdate"
                            Font-Names="Verdana" />
                        <asp:ModalPopupExtender ID="btnUpdateSize_ModalPopupExtender" runat="server" CancelControlID="imgBtnCloseUpdateSizeModal"
                            DynamicServicePath="" Enabled="True" PopupControlID="pnlUpdateSizeModal" PopupDragHandleControlID="pnlUpdateSizeModalDrag"
                            TargetControlID="btnUpdateColor" BackgroundCssClass="bgModal">
                            <Animations>
                                        <OnShown>
                                            <FadeIn Duration=".2" />
                                        </OnShown>
                            </Animations>
                        </asp:ModalPopupExtender>
                    </div>
                    <div style="float: left; margin-right: 5px;">
                        <asp:Button ID="btnDelete" runat="server" Text="DELETE" CssClass="btnDelete" Font-Names="Verdana" />
                        <asp:ModalPopupExtender ID="btnDelete_ModalPopupExtender" runat="server" BackgroundCssClass="bgModal"
                            CancelControlID="btnNo" DynamicServicePath="" Enabled="True" PopupControlID="pnlDeleteModal"
                            PopupDragHandleControlID="pnlDeleteModalDrag" TargetControlID="btnDelete">
                            <Animations>
                    <OnShown>
                        <FadeIn Duration=".2" />
                    </OnShown>
                            </Animations>
                        </asp:ModalPopupExtender>
                    </div>
                    <div style="float: left; margin-right: 5px;">
                        <asp:Button ID="btnPrint" runat="server" Text="PRINT" CssClass="btnPrint" Font-Names="Verdana" />
                    </div>
                    <div style="float: left; margin-right: 5px;">
                        <asp:UpdateProgress ID="upProgress" runat="server" AssociatedUpdatePanelID="upnlColor">
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
                <img alt="brands" src="../Resources/color.png" height="16" width="20" align="left" />
                LIST OF COLORS
            </div>
            <div class="listContent" style="float:left;">
                <asp:Panel ID="pnlSizesList" runat="server" Width="595px" Height="415px" ScrollBars="Auto">
                    <asp:GridView ID="gvColorsList" runat="server" CellPadding="4"
                        GridLines="None" AutoGenerateColumns="False"  CssClass="table_grid"
                        OnSelectedIndexChanged="gvColorsList_SelectedIndexChanged" DataKeyNames="RECORD_NO"
                        EnablePersistedSelection="True" AllowPaging="True" AllowSorting="True" DataSourceID="SqlDataSourceColors"
                        PageSize="15">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:TemplateField>
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Image ID="Image1" runat="server" Height="16px" ImageUrl="~/Resources/color.png" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:CommandField ShowSelectButton="True" />
                            <asp:BoundField DataField="RECORD_NO" HeaderText="RECORD #" InsertVisible="False"
                                ReadOnly="True" SortExpression="RECORD_NO">
                                <HeaderStyle Wrap="False" />
                                <ItemStyle Font-Bold="True" HorizontalAlign="Center" Wrap="False" />
                            </asp:BoundField>
                            <asp:BoundField DataField="COLOR_CODE" HeaderText="COLOR CODE" SortExpression="COLOR_CODE">
                                <HeaderStyle Wrap="False" />
                                <ItemStyle Wrap="False" />
                            </asp:BoundField>
                            <asp:BoundField DataField="COLOR_DESCRIPTION" HeaderText="COLOR DESCRIPTION" SortExpression="COLOR_DESCRIPTION">
                                <HeaderStyle Wrap="False" />
                                <ItemStyle Wrap="False" />
                            </asp:BoundField>
                            <asp:BoundField DataField="DATE_RECORDED" HeaderText="DATE RECORDED" SortExpression="DATE_RECORDED">
                                <HeaderStyle Wrap="False" />
                                <ItemStyle Wrap="False" />
                            </asp:BoundField>
                        </Columns>
                        <EditRowStyle BackColor="#7C6F57" />
                        <EmptyDataTemplate>
                            <asp:Image ID="Image2" runat="server" ImageUrl="~/Resources/unhappy.png" ImageAlign="AbsMiddle" />
                            DATA NOT FOUND!!!
                        </EmptyDataTemplate>
                        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                        <PagerStyle  CssClass ="pager" />
                        <RowStyle BackColor="#E3EAEB" />
                        <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="False" ForeColor="#333333" Font-Names="Verdana"
                            Font-Size="11px" Font-Italic="True" />
                        <SortedAscendingCellStyle  CssClass="asc_cell_style" />
                        <SortedAscendingHeaderStyle CssClass="asc_cell_style_h" />
                        <SortedDescendingCellStyle CssClass="desc_cell_style" />
                        <SortedDescendingHeaderStyle CssClass="desc_cell_style_h" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSourceColors" runat="server" ConnectionString="<%$ ConnectionStrings:IRMSConnectionString %>"
                        SelectCommand="SP_GET_ALL_COLORS" SelectCommandType="StoredProcedure" >
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

            <asp:Panel ID="pnlNewSizeModal" runat="server" CssClass="modal">
                <asp:Panel ID="pnlNewSizeModalDrag" runat="server" CssClass="modalDrag">
                    <div class="close_btn">
                        <asp:ImageButton ID="imgBtnCloseNewSizeModal" runat="server" CssClass="btnClose"
                            ImageUrl="~/Resources/cancel_gray.png" ToolTip="CLOSE" />
                    </div>
                    <div class="sizeLogo">
                    <img alt="new color" src="../Resources/color.png" height="16" align="top" />
                        NEW COLOR
                    </div>
                </asp:Panel>
                <table style="width: 100%;">
                    <tr>
                        <td class="modalLabel">
                            COLOR CODE:
                        </td>
                        <td>
                            <asp:TextBox ID="txtColorCode" runat="server" Height="20px"  CssClass="modalText"></asp:TextBox>
                            &nbsp;
                        </td>
                        <td>
                            <asp:ImageButton ID="ibtnColorPicker" runat="server" Height="20px" ImageAlign="Bottom"
                                ImageUrl="~/Resources/color.png" />
                            <asp:ModalPopupExtender ID="ibtnColorPicker_ModalPopupExtender" runat="server" CancelControlID="imgBtnCancelColorPicker"
                                DynamicServicePath="" Enabled="True" PopupControlID="pnlColorPicker" PopupDragHandleControlID="pnlColorPickerDrag"
                                TargetControlID="ibtnColorPicker">
                                <Animations>
                                    <OnShown>
                                        <FadeIn Duration=".2" />
                                    </OnShown>
                                </Animations>
                            </asp:ModalPopupExtender>
                        </td>
                    </tr>
                    <tr>
                        <td class="modalLabel">
                            COLOR DESCRIPTION:
                        </td>
                        <td>
                            <asp:TextBox ID="txtColorDescription" runat="server" Height="40px" TextMode="MultiLine"
                                CssClass="modalText"></asp:TextBox>
                            &nbsp;
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;
                        </td>
                        <td>
                            <asp:Button ID="btnSaveColor" runat="server" Text="SAVE" CssClass="btnSave" ToolTip="Save New Color"
                                OnClick="btnSaveColor_Click" />
                            &nbsp;
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                </table>
            </asp:Panel>

            <asp:Panel ID="pnlUpdateSizeModal" runat="server" CssClass="modal">
                <asp:Panel ID="pnlUpdateSizeModalDrag" runat="server" CssClass="modalDrag">
                    <div class="close_btn">
                        <asp:ImageButton ID="imgBtnCloseUpdateSizeModal" runat="server" CssClass="btnClose"
                            ImageUrl="~/Resources/cancel_gray.png" ToolTip="CLOSE" />
                    </div>
                    <div class="sizeLogo">
                        <img alt="new color" src="../Resources/color.png" height="16" align="top" />
                        UPDATE COLOR
                    </div>
                </asp:Panel>
                <asp:Panel ID="updateErrorMessage" runat="server">
                    <div style="border: 1px solid #FFCC66; text-align: center; font-family: Verdana;
                        font-size: 12px; height: 23px; color: #CC6600; background-color: #FFFF99; line-height: 16px;">
                        <img alt="error update" src="../Resources/warning.png" height="22px" align="middle" />
                        No selected data to update.
                    </div>
                </asp:Panel>
                <table style="width: 100%;">
                    <tr>
                        <td class="modalLabel">
                            COLOR CODE:
                        </td>
                        <td>
                            <asp:TextBox ID="txtColorCodeUpdate" runat="server" Height="20px"  CssClass ="modalText"></asp:TextBox>
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td class="modalLabel">
                            COLOR DESCRIPTION:
                        </td>
                        <td>
                            <asp:TextBox ID="txtColorDescriptionUpdate" runat="server" Height="40px" TextMode="MultiLine"
                               CssClass ="modalText"></asp:TextBox>
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;
                        </td>
                        <td>
                            <asp:Button ID="btnSaveUpdate" runat="server" Text="SAVE" CssClass="btnSave" ToolTip="Update Color"
                                OnClick="btnSaveUpdate_Click" />
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                </table>
                
            </asp:Panel>
            <%--Delete Modal--%>
            <asp:Panel ID="pnlDeleteModal" runat="server" CssClass="modal">
                <asp:Panel ID="pnlDeleteModalDrag" runat="server" CssClass="modalDrag">
                    <div class="sizeLogo">
                       <img alt="new color" src="../Resources/color.png" height="16" align="top" />
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
                    <asp:Label ID="lblColorToDelete" runat="server" Text="No data to delete. Select from the list and try again."></asp:Label>
                </div>
                <div style=" text-align:center; margin:5px 0px;">
                    <asp:Button ID="btnYes" runat="server" Text="YES" CssClass="modalWarningButtonYes"
                        ToolTip="Delete" OnClick="btnYes_Click" />
                    <asp:Button ID="btnNo" runat="server" Text="NO" CssClass="modalWarningButtonNo" ToolTip="Cancel" />
                </div>
            </asp:Panel>
            <asp:Panel ID="pnlColorPicker" runat="server" Height="150px" Width="230px" 
                CssClass="color_picker" ViewStateMode="Disabled">
                <asp:Panel ID="pnlColorPickerDrag" runat="server" Height="18px" CssClass="color_picker_drag">
                    &nbsp;&nbsp;COLOR PICKER
                    <div style="float: right; margin-top: 2px;">
                        <asp:ImageButton ID="imgBtnCancelColorPicker" runat="server" Height="16px" ImageUrl="~/Resources/no.png" /></div>
                </asp:Panel>
                <div style="margin-left: 10px;">
                    <table style="margin: 0px; padding: 0px; width: 100%;" cellpadding="0" cellspacing="0">
                        <tr>
                            <td>
                                <asp:Button ID="btnAliceBlue" runat="server" Text=" " BackColor="AliceBlue" CssClass="color"
                                    ToolTip="AliceBlue" OnClick="btnAliceBlue_Click" />
                            </td>
                            <td>
                                <asp:Button ID="btnAntiqueWhite" runat="server" Text=" " BackColor="AntiqueWhite"
                                    CssClass="color" ToolTip="AntiqueWhite" OnClick="btnAntiqueWhite_Click" />
                            </td>
                            <td>
                                <asp:Button ID="btnAqua" runat="server" Text=" " BackColor="Aqua" CssClass="color"
                                    ToolTip="Aqua" OnClick="btnAqua_Click" />
                            </td>
                            <td>
                                <asp:Button ID="btnAquaMarine" runat="server" Text=" " BackColor="Aquamarine" CssClass="color"
                                    BorderWidth="1px" ToolTip="Aquamarine" OnClick="btnAquaMarine_Click" />
                            </td>
                            <td>
                                <asp:Button ID="btnAzure" runat="server" Text=" " BackColor="Azure" CssClass="color"
                                    BorderWidth="1px" ToolTip="Azure" OnClick="btnAzure_Click" />
                            </td>
                            <td>
                                <asp:Button ID="btnBeige" runat="server" Text=" " BackColor="Beige" CssClass="color"
                                    ToolTip="Beige" BorderWidth="1px" OnClick="btnBeige_Click" />
                            </td>
                            <td>
                                <asp:Button ID="btnBisque" runat="server" Text=" " BackColor="Bisque" CssClass="color"
                                    ToolTip="Bisque" BorderWidth="1px" OnClick="btnBisque_Click" />
                            </td>
                            <td>
                                <asp:Button ID="btnBlack" runat="server" Text=" " BackColor="Black" CssClass="color"
                                    ToolTip="Black" BorderWidth="1px" OnClick="btnBlack_Click" />
                            </td>
                            <td>
                                <asp:Button ID="btnBlanchedAlmond" runat="server" BackColor="BlanchedAlmond" BorderWidth="1px"
                                    CssClass="color" Text=" " ToolTip="BlanchedAlmond" OnClick="btnBlanchedAlmond_Click" />
                            </td>
                            <td>
                                <asp:Button ID="btnBlue" runat="server" BackColor="Blue" BorderWidth="1px" ToolTip="Blue"
                                    CssClass="color" Text=" " OnClick="btnBlue_Click" />
                            </td>
                            <td>
                                <asp:Button ID="btnBlueViolet" runat="server" BackColor="BlueViolet" BorderWidth="1px"
                                    CssClass="color" Text=" " ToolTip="BlueViolet" OnClick="btnBlueViolet_Click" />
                            </td>
                            <td>
                                <asp:Button ID="btnBrown" runat="server" BackColor="Brown" BorderWidth="1px" CssClass="color"
                                    ToolTip="Brown" Text=" " OnClick="btnBrown_Click" />
                            </td>
                            <td>
                                <asp:Button ID="btnBurlyWood" runat="server" BackColor="BurlyWood" BorderWidth="1px"
                                    CssClass="color" Text=" " OnClick="btnBurlyWood_Click" ToolTip="BurlyWood" />
                            </td>
                            <td>
                                <asp:Button ID="btnCadetBlue" runat="server" BackColor="CadetBlue" BorderWidth="1px"
                                    CssClass="color" Text=" " ToolTip="CadetBlue" OnClick="btnCadetBlue_Click" />
                            </td>
                            <td>
                                <asp:Button ID="btnChartreuse" runat="server" BackColor="Chartreuse" BorderWidth="1px"
                                    CssClass="color" Text=" " OnClick="btnChartreuse_Click" ToolTip="Chartreuse" />
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Button ID="btnChocolate" runat="server" BackColor="Chocolate" CssClass="color"
                                    Text=" " ToolTip="Chocolate" OnClick="btnChocolate_Click" />
                            </td>
                            <td>
                                <asp:Button ID="btnCoral" runat="server" BackColor="Coral" CssClass="color" Text=" "
                                    ToolTip="Coral" OnClick="btnCoral_Click" />
                            </td>
                            <td>
                                <asp:Button ID="btnCornflowerBlue" runat="server" BackColor="CornflowerBlue" CssClass="color"
                                    Text=" " ToolTip="CornflowerBlue" OnClick="btnCornflowerBlue_Click" />
                            </td>
                            <td>
                                <asp:Button ID="btnCornsilk" runat="server" BackColor="Cornsilk" CssClass="color"
                                    Text=" " ToolTip="Cornsilk" OnClick="btnCornsilk_Click" />
                            </td>
                            <td>
                                <asp:Button ID="btnCrimson" runat="server" BackColor="Crimson" CssClass="color" Text=" "
                                    ToolTip="Crimson" OnClick="btnCrimson_Click" />
                            </td>
                            <td>
                                <asp:Button ID="btnCyan" runat="server" BackColor="Cyan" CssClass="color" Text=" "
                                    ToolTip="Cyan" OnClick="btnCyan_Click" />
                            </td>
                            <td>
                                <asp:Button ID="btnDarkBlue" runat="server" BackColor="DarkBlue" CssClass="color"
                                    Text=" " ToolTip="DarkBlue" OnClick="btnDarkBlue_Click" />
                            </td>
                            <td>
                                <asp:Button ID="btnDarkCyan" runat="server" BackColor="DarkCyan" CssClass="color"
                                    Text=" " ToolTip="DarkCyan" OnClick="btnDarkCyan_Click" />
                            </td>
                            <td>
                                <asp:Button ID="btnDarkGoldenrod" runat="server" BackColor="DarkGoldenrod" CssClass="color"
                                    Text=" " ToolTip="DarkGoldenrod" OnClick="btnDarkGoldenrod_Click" />
                            </td>
                            <td>
                                <asp:Button ID="btnDarkGray" runat="server" BackColor="DarkGray" CssClass="color"
                                    Text=" " ToolTip="DarkGray" OnClick="btnDarkGray_Click" />
                            </td>
                            <td>
                                <asp:Button ID="btnDarkGreen" runat="server" BackColor="DarkGreen" CssClass="color"
                                    Text=" " ToolTip="DarkGreen" OnClick="btnDarkGreen_Click" />
                            </td>
                            <td>
                                <asp:Button ID="btnDarkKhaki" runat="server" BackColor="DarkKhaki" CssClass="color"
                                    Text=" " ToolTip="DarkKhaki" OnClick="btnDarkKhaki_Click" />
                            </td>
                            <td>
                                <asp:Button ID="btnDarkMagenta" runat="server" BackColor="DarkMagenta" CssClass="color"
                                    Text=" " ToolTip="DarkMagenta" OnClick="btnDarkMagenta_Click" />
                            </td>
                            <td>
                                <asp:Button ID="btnDarkOliveGreen" runat="server" BackColor="DarkOliveGreen" CssClass="color"
                                    Text=" " ToolTip="DarkOliveGreen" OnClick="btnDarkOliveGreen_Click" />
                            </td>
                            <td>
                                <asp:Button ID="btnDarkOrange" runat="server" BackColor="DarkOrange" CssClass="color"
                                    Text=" " ToolTip="DarkOrange" OnClick="btnDarkOrange_Click" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Button ID="btnDarkOrchid" runat="server" BackColor="DarkOrchid" CssClass="color"
                                    Text=" " ToolTip="DarkOrchid" OnClick="btnDarkOrchid_Click" />
                            </td>
                            <td>
                                <asp:Button ID="btnDarkRed" runat="server" BackColor="DarkRed" CssClass="color" Text=" "
                                    ToolTip="DarkRed" OnClick="btnDarkRed_Click" />
                            </td>
                            <td>
                                <asp:Button ID="btnDarkSalmon" runat="server" BackColor="DarkSalmon" CssClass="color"
                                    Text=" " ToolTip="DarkSalmon" OnClick="btnDarkSalmon_Click" />
                            </td>
                            <td>
                                <asp:Button ID="btnDarkSeaGreen" runat="server" BackColor="DarkSeaGreen" CssClass="color"
                                    Text=" " ToolTip="DarkSeaGreen" OnClick="btnDarkSeaGreen_Click" />
                            </td>
                            <td>
                                <asp:Button ID="btnDarkSlateBlue" runat="server" BackColor="DarkSlateBlue" CssClass="color"
                                    Text=" " ToolTip="DarkSlateBlue" OnClick="btnDarkSlateBlue_Click" />
                            </td>
                            <td>
                                <asp:Button ID="btnDarkSlateGray" runat="server" BackColor="DarkSlateGray" CssClass="color"
                                    Text=" " ToolTip="DarkSlateGray" OnClick="btnDarkSlateGray_Click" />
                            </td>
                            <td>
                                <asp:Button ID="btnDarkTurquoise" runat="server" BackColor="DarkTurquoise" CssClass="color"
                                    Text=" " ToolTip="DarkTurquoise" OnClick="btnDarkTurquoise_Click" />
                            </td>
                            <td>
                                <asp:Button ID="btnDarkViolet" runat="server" BackColor="DarkViolet" CssClass="color"
                                    Text=" " ToolTip="DarkViolet" OnClick="btnDarkViolet_Click" />
                            </td>
                            <td>
                                <asp:Button ID="btnDeepPink" runat="server" BackColor="DeepPink" CssClass="color"
                                    Text=" " ToolTip="DeepPink" OnClick="btnDeepPink_Click" />
                            </td>
                            <td>
                                <asp:Button ID="btnDeepSkyBlue" runat="server" BackColor="DeepSkyBlue" CssClass="color"
                                    Text=" " ToolTip="DeepSkyBlue" OnClick="btnDeepSkyBlue_Click" />
                            </td>
                            <td>
                                <asp:Button ID="btnDimGray" runat="server" BackColor="DimGray" CssClass="color" Text=" "
                                    ToolTip="DimGray" OnClick="btnDimGray_Click" />
                            </td>
                            <td>
                                <asp:Button ID="btnDodgerBlue" runat="server" BackColor="DodgerBlue" CssClass="color"
                                    Text=" " ToolTip="DodgerBlue" OnClick="btnDodgerBlue_Click" />
                            </td>
                            <td>
                                <asp:Button ID="btnFirebrick" runat="server" BackColor="Firebrick" CssClass="color"
                                    Text=" " ToolTip="Firebrick" OnClick="btnFirebrick_Click" />
                            </td>
                            <td>
                                <asp:Button ID="btnFloralWhite" runat="server" BackColor="FloralWhite" CssClass="color"
                                    Text=" " ToolTip="FloralWhite" OnClick="btnFloralWhite_Click" />
                            </td>
                            <td>
                                <asp:Button ID="btnForestGreen" runat="server" BackColor="ForestGreen" CssClass="color"
                                    Text=" " ToolTip="ForestGreen" OnClick="btnForestGreen_Click" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Button ID="btnFuchsia" runat="server" BackColor="Fuchsia" CssClass="color" Text=" "
                                    ToolTip="Fuchsia" OnClick="btnFuchsia_Click" />
                            </td>
                            <td>
                                <asp:Button ID="btnGainsboro" runat="server" BackColor="Gainsboro" CssClass="color"
                                    Text=" " ToolTip="Gainsboro" OnClick="btnGainsboro_Click" />
                            </td>
                            <td>
                                <asp:Button ID="btnGhostWhite" runat="server" BackColor="GhostWhite" CssClass="color"
                                    Text=" " ToolTip="GhostWhite" OnClick="btnGhostWhite_Click" />
                            </td>
                            <td>
                                <asp:Button ID="btnGold" runat="server" BackColor="Gold" CssClass="color" Text=" "
                                    ToolTip="Gold" OnClick="btnGold_Click" />
                            </td>
                            <td>
                                <asp:Button ID="btnGoldenrod" runat="server" BackColor="Goldenrod" CssClass="color"
                                    Text=" " ToolTip="Goldenrod" OnClick="btnGoldenrod_Click" />
                            </td>
                            <td>
                                <asp:Button ID="btnGray" runat="server" BackColor="Gray" CssClass="color" Text=" "
                                    ToolTip="Gray" OnClick="btnGray_Click" />
                            </td>
                            <td>
                                <asp:Button ID="btnGreen" runat="server" BackColor="Green" CssClass="color" Text=" "
                                    ToolTip="Green" OnClick="btnGreen_Click" />
                            </td>
                            <td>
                                <asp:Button ID="btnGreenYellow" runat="server" BackColor="GreenYellow" CssClass="color"
                                    Text=" " ToolTip="GreenYellow" OnClick="btnGreenYellow_Click" />
                            </td>
                            <td>
                                <asp:Button ID="btnHoneydew" runat="server" BackColor="Honeydew" CssClass="color"
                                    Text=" " ToolTip="Honeydew" OnClick="btnHoneydew_Click" />
                            </td>
                            <td>
                                <asp:Button ID="btnHotPink" runat="server" BackColor="HotPink" CssClass="color" Text=" "
                                    ToolTip="HotPink" OnClick="btnHotPink_Click" />
                            </td>
                            <td>
                                <asp:Button ID="btnIndianRed" runat="server" BackColor="IndianRed" CssClass="color"
                                    Text=" " ToolTip="IndianRed" OnClick="btnIndianRed_Click" />
                            </td>
                            <td>
                                <asp:Button ID="btnIndigo" runat="server" BackColor="Indigo" CssClass="color" Text=" "
                                    ToolTip="Indigo" OnClick="btnIndigo_Click" />
                            </td>
                            <td>
                                <asp:Button ID="btnIvory" runat="server" BackColor="Ivory" CssClass="color" Text=" "
                                    ToolTip="Ivory" OnClick="btnIvory_Click" />
                            </td>
                            <td>
                                <asp:Button ID="btnKhaki" runat="server" BackColor="Khaki" CssClass="color" Text=" "
                                    ToolTip="Khaki" OnClick="btnKhaki_Click" />
                            </td>
                            <td>
                                <asp:Button ID="btnLavender" runat="server" BackColor="Lavender" CssClass="color"
                                    Text=" " ToolTip="Lavender" OnClick="btnLavender_Click" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Button ID="btnLavenderBlush" runat="server" BackColor="LavenderBlush" CssClass="color"
                                    Text=" " ToolTip="LavenderBlush" OnClick="btnLavenderBlush_Click" />
                            </td>
                            <td>
                                <asp:Button ID="btnLawnGreen" runat="server" BackColor="LawnGreen" CssClass="color"
                                    Text=" " ToolTip="LawnGreen" OnClick="btnLawnGreen_Click" />
                            </td>
                            <td>
                                <asp:Button ID="btnLemonChiffon" runat="server" BackColor="LemonChiffon" CssClass="color"
                                    Text=" " ToolTip="LemonChiffon" OnClick="btnLemonChiffon_Click" />
                            </td>
                            <td>
                                <asp:Button ID="btnLightBlue" runat="server" BackColor="LightBlue" CssClass="color"
                                    Text=" " ToolTip="LightBlue" OnClick="btnLightBlue_Click" />
                            </td>
                            <td>
                                <asp:Button ID="btnLightCoral" runat="server" BackColor="LightCoral" CssClass="color"
                                    Text=" " ToolTip="LightCoral" OnClick="btnLightCoral_Click" />
                            </td>
                            <td>
                                <asp:Button ID="btnLightCyan" runat="server" BackColor="LightCyan" CssClass="color"
                                    Text=" " ToolTip="LightCyan" OnClick="btnLightCyan_Click" />
                            </td>
                            <td>
                                <asp:Button ID="btnLightGoldenrodYellow" runat="server" BackColor="LightGoldenrodYellow"
                                    CssClass="color" Text=" " ToolTip="LightGoldenrodYellow" OnClick="btnLightGoldenrodYellow_Click" />
                            </td>
                            <td>
                                <asp:Button ID="btnLightLightGray" runat="server" BackColor="LightGray" CssClass="color"
                                    Text=" " ToolTip="LightGray" OnClick="btnLightLightGray_Click" />
                            </td>
                            <td>
                                <asp:Button ID="btnLightGreen" runat="server" BackColor="LightGreen" CssClass="color"
                                    Text=" " ToolTip="LightGreen" OnClick="btnLightGreen_Click" />
                            </td>
                            <td>
                                <asp:Button ID="btnLightPink" runat="server" BackColor="LightPink" CssClass="color"
                                    Text=" " ToolTip="LightPink" OnClick="btnLightPink_Click" />
                            </td>
                            <td>
                                <asp:Button ID="btnLightSalmon" runat="server" BackColor="LightSalmon" CssClass="color"
                                    Text=" " ToolTip="LightSalmon" OnClick="btnLightSalmon_Click" />
                            </td>
                            <td>
                                <asp:Button ID="btnLightSeaGreen" runat="server" BackColor="LightSeaGreen" CssClass="color"
                                    Text=" " ToolTip="LightSeaGreen" OnClick="btnLightSeaGreen_Click" />
                            </td>
                            <td>
                                <asp:Button ID="btnLightSkyBlue" runat="server" BackColor="LightSkyBlue" CssClass="color"
                                    Text=" " ToolTip="LightSkyBlue" OnClick="btnLightSkyBlue_Click" />
                            </td>
                            <td>
                                <asp:Button ID="btnLightSlateGray" runat="server" BackColor="LightSlateGray" CssClass="color"
                                    Text=" " ToolTip="LightSlateGray" OnClick="btnLightSlateGray_Click" />
                            </td>
                            <td>
                                <asp:Button ID="btnLightSteelBlue" runat="server" BackColor="LightSteelBlue" CssClass="color"
                                    Text=" " ToolTip="LightSteelBlue" OnClick="btnLightSteelBlue_Click" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Button ID="btnLightYellow" runat="server" BackColor="LightYellow" CssClass="color"
                                    Text=" " ToolTip="LightYellow" OnClick="btnLightYellow_Click" />
                            </td>
                            <td>
                                <asp:Button ID="btnLime" runat="server" BackColor="Lime" CssClass="color" Text=" "
                                    ToolTip="Lime" OnClick="btnLime_Click" />
                            </td>
                            <td>
                                <asp:Button ID="btnLimeGreen" runat="server" BackColor="LimeGreen" CssClass="color"
                                    Text=" " ToolTip="LimeGreen" OnClick="btnLimeGreen_Click" />
                            </td>
                            <td>
                                <asp:Button ID="btnLinen" runat="server" BackColor="Linen" CssClass="color" Text=" "
                                    ToolTip="Linen" OnClick="btnLinen_Click" />
                            </td>
                            <td>
                                <asp:Button ID="btnMagenta" runat="server" BackColor="Magenta" CssClass="color" Text=" "
                                    ToolTip="Magenta" OnClick="btnMagenta_Click" />
                            </td>
                            <td>
                                <asp:Button ID="btnMaroon" runat="server" BackColor="Maroon" CssClass="color" Text=" "
                                    ToolTip="Maroon" OnClick="btnMaroon_Click" />
                            </td>
                            <td>
                                <asp:Button ID="btnMediumAquamarine" runat="server" BackColor="MediumAquamarine"
                                    CssClass="color" Text=" " ToolTip="MediumAquamarine" OnClick="btnMediumAquamarine_Click" />
                            </td>
                            <td>
                                <asp:Button ID="btnMediumBlue" runat="server" BackColor="MediumBlue" CssClass="color"
                                    Text=" " ToolTip="MediumBlue" OnClick="btnMediumBlue_Click" />
                            </td>
                            <td>
                                <asp:Button ID="btnMediumOrchid" runat="server" BackColor="MediumOrchid" CssClass="color"
                                    Text=" " ToolTip="MediumOrchid" OnClick="btnMediumOrchid_Click" />
                            </td>
                            <td>
                                <asp:Button ID="btnMediumPurple" runat="server" BackColor="MediumPurple" CssClass="color"
                                    Text=" " ToolTip="MediumPurple" OnClick="btnMediumPurple_Click" />
                            </td>
                            <td>
                                <asp:Button ID="btnMediumSeaGreen" runat="server" BackColor="MediumSeaGreen" CssClass="color"
                                    Text=" " ToolTip="MediumSeaGreen" OnClick="btnMediumSeaGreen_Click" />
                            </td>
                            <td>
                                <asp:Button ID="btnMediumSlateBlue" runat="server" BackColor="MediumSlateBlue" CssClass="color"
                                    Text=" " ToolTip="MediumSlateBlue" OnClick="btnMediumSlateBlue_Click" />
                            </td>
                            <td>
                                <asp:Button ID="btnMediumSpringGreen" runat="server" BackColor="MediumSpringGreen"
                                    CssClass="color" Text=" " ToolTip="MediumSpringGreen" OnClick="btnMediumSpringGreen_Click" />
                            </td>
                            <td>
                                <asp:Button ID="btnMediumTurquoise" runat="server" BackColor="MediumTurquoise" CssClass="color"
                                    Text=" " ToolTip="MediumTurquoise" OnClick="btnMediumTurquoise_Click" />
                            </td>
                            <td>
                                <asp:Button ID="btnMediumVioletRed" runat="server" BackColor="MediumVioletRed" CssClass="color"
                                    Text=" " ToolTip="MediumVioletRed" OnClick="btnMediumVioletRed_Click" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Button ID="btnMidnightBlue" runat="server" BackColor="MidnightBlue" CssClass="color"
                                    Text=" " ToolTip="MidnightBlue" OnClick="btnMidnightBlue_Click" />
                            </td>
                            <td>
                                <asp:Button ID="btnMintCream" runat="server" BackColor="MintCream" CssClass="color"
                                    Text=" " ToolTip="MintCream" OnClick="btnMintCream_Click" />
                            </td>
                            <td>
                                <asp:Button ID="btnMistyRose" runat="server" BackColor="MistyRose" CssClass="color"
                                    Text=" " ToolTip="MistyRose" OnClick="btnMistyRose_Click" />
                            </td>
                            <td>
                                <asp:Button ID="btnMoccasin" runat="server" BackColor="Moccasin" CssClass="color"
                                    Text=" " ToolTip="Moccasin" OnClick="btnMoccasin_Click" />
                            </td>
                            <td>
                                <asp:Button ID="btnNavajoWhite" runat="server" BackColor="NavajoWhite" CssClass="color"
                                    Text=" " ToolTip="NavajoWhite" OnClick="btnNavajoWhite_Click" />
                            </td>
                            <td>
                                <asp:Button ID="btnNavy" runat="server" BackColor="Navy" CssClass="color" Text=" "
                                    ToolTip="Navy" OnClick="btnNavy_Click" />
                            </td>
                            <td>
                                <asp:Button ID="btnOldLace" runat="server" BackColor="OldLace" CssClass="color" Text=" "
                                    ToolTip="OldLace" OnClick="btnOldLace_Click" />
                            </td>
                            <td>
                                <asp:Button ID="btnOlive" runat="server" BackColor="Olive" CssClass="color" Text=" "
                                    ToolTip="Olive" OnClick="btnOlive_Click" />
                            </td>
                            <td>
                                <asp:Button ID="btnOliveDrab" runat="server" BackColor="OliveDrab" CssClass="color"
                                    Text=" " ToolTip="OliveDrab" OnClick="btnOliveDrab_Click" />
                            </td>
                            <td>
                                <asp:Button ID="btnOrange" runat="server" BackColor="Orange" CssClass="color" Text=" "
                                    ToolTip="Orange" OnClick="btnOrange_Click" />
                            </td>
                            <td>
                                <asp:Button ID="btnOrangeRed" runat="server" BackColor="OrangeRed" CssClass="color"
                                    Text=" " ToolTip="OrangeRed" OnClick="btnOrangeRed_Click" />
                            </td>
                            <td>
                                <asp:Button ID="btnOrchid" runat="server" BackColor="Orchid" CssClass="color" Text=" "
                                    ToolTip="Orchid" OnClick="btnOrchid_Click" />
                            </td>
                            <td>
                                <asp:Button ID="btnPaleGoldenrod" runat="server" BackColor="PaleGoldenrod" CssClass="color"
                                    Text=" " ToolTip="PaleGoldenrod" OnClick="btnPaleGoldenrod_Click" />
                            </td>
                            <td>
                                <asp:Button ID="btnPaleGreen" runat="server" BackColor="PaleGreen" CssClass="color"
                                    Text=" " ToolTip="PaleGreen" OnClick="btnPaleGreen_Click" />
                            </td>
                            <td>
                                <asp:Button ID="btnPaleTurquoise" runat="server" BackColor="PaleTurquoise" CssClass="color"
                                    Text=" " ToolTip="PaleTurquoise" OnClick="btnPaleTurquoise_Click" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Button ID="btnPaleVioletRed" runat="server" BackColor="PaleVioletRed" CssClass="color"
                                    Text=" " ToolTip="PaleVioletRed" OnClick="btnPaleVioletRed_Click" />
                            </td>
                            <td>
                                <asp:Button ID="btnPapayaWhip" runat="server" BackColor="PapayaWhip" CssClass="color"
                                    Text=" " ToolTip="PapayaWhip" OnClick="btnPapayaWhip_Click" />
                            </td>
                            <td>
                                <asp:Button ID="btnPeachPuff" runat="server" BackColor="PeachPuff" CssClass="color"
                                    Text=" " ToolTip="PeachPuff" OnClick="btnPeachPuff_Click" />
                            </td>
                            <td>
                                <asp:Button ID="btnPeru" runat="server" BackColor="Peru" CssClass="color" Text=" "
                                    ToolTip="Peru" OnClick="btnPeru_Click" />
                            </td>
                            <td>
                                <asp:Button ID="btnPink" runat="server" BackColor="Pink" CssClass="color" Text=" "
                                    ToolTip="Pink" OnClick="btnPink_Click" />
                            </td>
                            <td>
                                <asp:Button ID="btnPlum" runat="server" BackColor="Plum" CssClass="color" Text=" "
                                    ToolTip="Plum" OnClick="btnPlum_Click" />
                            </td>
                            <td>
                                <asp:Button ID="btnPowderBlue" runat="server" BackColor="PowderBlue" CssClass="color"
                                    Text=" " ToolTip="PowderBlue" OnClick="btnPowderBlue_Click" />
                            </td>
                            <td>
                                <asp:Button ID="btnPurple" runat="server" BackColor="Purple" CssClass="color" Text=" "
                                    ToolTip="Purple" OnClick="btnPurple_Click" />
                            </td>
                            <td>
                                <asp:Button ID="btnRed" runat="server" BackColor="Red" CssClass="color" Text=" "
                                    ToolTip="Red" OnClick="btnRed_Click" />
                            </td>
                            <td>
                                <asp:Button ID="btnRosyBrown" runat="server" BackColor="RosyBrown" CssClass="color"
                                    Text=" " ToolTip="RosyBrown" OnClick="btnRosyBrown_Click" />
                            </td>
                            <td>
                                <asp:Button ID="btnRoyalBlue" runat="server" BackColor="RoyalBlue" CssClass="color"
                                    Text=" " ToolTip="RoyalBlue" OnClick="btnRoyalBlue_Click" />
                            </td>
                            <td>
                                <asp:Button ID="btnSaddleBrown" runat="server" BackColor="SaddleBrown" CssClass="color"
                                    Text=" " ToolTip="SaddleBrown" OnClick="btnSaddleBrown_Click" />
                            </td>
                            <td>
                                <asp:Button ID="btnSalmon" runat="server" BackColor="Salmon" CssClass="color" Text=" "
                                    ToolTip="Salmon" OnClick="btnSalmon_Click" />
                            </td>
                            <td>
                                <asp:Button ID="btnSandyBrown" runat="server" BackColor="SandyBrown" CssClass="color"
                                    Text=" " ToolTip="SandyBrown" OnClick="btnSandyBrown_Click" />
                            </td>
                            <td>
                                <asp:Button ID="btnSeaGreen" runat="server" BackColor="SeaGreen" CssClass="color"
                                    Text=" " ToolTip="SeaGreen" OnClick="btnSeaGreen_Click" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Button ID="btnSeaShell" runat="server" BackColor="SeaShell" CssClass="color"
                                    Text=" " ToolTip="SeaShell" OnClick="btnSeaShell_Click" />
                            </td>
                            <td>
                                <asp:Button ID="btnSienna" runat="server" BackColor="Sienna" CssClass="color" Text=" "
                                    ToolTip="Sienna" OnClick="btnSienna_Click" />
                            </td>
                            <td>
                                <asp:Button ID="btnSilver" runat="server" BackColor="Silver" CssClass="color" Text=" "
                                    ToolTip="Silver" OnClick="btnSilver_Click" />
                            </td>
                            <td>
                                <asp:Button ID="btnSkyBlue" runat="server" BackColor="SkyBlue" CssClass="color" Text=" "
                                    ToolTip="SkyBlue" OnClick="btnSkyBlue_Click" />
                            </td>
                            <td>
                                <asp:Button ID="btnSlateBlue" runat="server" BackColor="SlateBlue" CssClass="color"
                                    Text=" " ToolTip="SlateBlue" OnClick="btnSlateBlue_Click" />
                            </td>
                            <td>
                                <asp:Button ID="btnSlateGray" runat="server" BackColor="SlateGray" CssClass="color"
                                    Text=" " ToolTip="SlateGray" OnClick="btnSlateGray_Click" />
                            </td>
                            <td>
                                <asp:Button ID="btnSnow" runat="server" BackColor="Snow" CssClass="color" Text=" "
                                    ToolTip="Snow" OnClick="btnSnow_Click" />
                            </td>
                            <td>
                                <asp:Button ID="btnSpringGreen" runat="server" BackColor="SpringGreen" CssClass="color"
                                    Text=" " ToolTip="SpringGreen" OnClick="btnSpringGreen_Click" />
                            </td>
                            <td>
                                <asp:Button ID="btnSteelBlue" runat="server" BackColor="SteelBlue" CssClass="color"
                                    Text=" " ToolTip="SteelBlue" OnClick="btnSteelBlue_Click" />
                            </td>
                            <td>
                                <asp:Button ID="btnTan" runat="server" BackColor="Tan" CssClass="color" Text=" "
                                    ToolTip="Tan" OnClick="btnTan_Click" />
                            </td>
                            <td>
                                <asp:Button ID="btnTeal" runat="server" BackColor="Teal" CssClass="color" Text=" "
                                    ToolTip="Teal" OnClick="btnTeal_Click" />
                            </td>
                            <td>
                                <asp:Button ID="btnThistle" runat="server" BackColor="Thistle" CssClass="color" Text=" "
                                    ToolTip="Thistle" OnClick="btnThistle_Click" />
                            </td>
                            <td>
                                <asp:Button ID="btnTomato" runat="server" BackColor="Tomato" CssClass="color" Text=" "
                                    ToolTip="Tomato" OnClick="btnTomato_Click" />
                            </td>
                            <td>
                                <asp:Button ID="btnTransparent" runat="server" BackColor="Transparent" CssClass="color"
                                    Text=" " ToolTip="Transparent" OnClick="btnTransparent_Click" />
                            </td>
                            <td>
                                <asp:Button ID="btnTurquoise" runat="server" BackColor="Turquoise" CssClass="color"
                                    Text=" " ToolTip="Turquoise" OnClick="btnTurquoise_Click" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Button ID="btnViolet" runat="server" BackColor="Violet" CssClass="color" Text=" "
                                    ToolTip="Violet" OnClick="btnViolet_Click" />
                            </td>
                            <td>
                                <asp:Button ID="btnWheat" runat="server" BackColor="Wheat" CssClass="color" Text=" "
                                    ToolTip="Wheat" OnClick="btnWheat_Click" />
                            </td>
                            <td>
                                <asp:Button ID="btnWhite" runat="server" BackColor="White" CssClass="color" Text=" "
                                    ToolTip="White" OnClick="btnWhite_Click" />
                            </td>
                            <td>
                                <asp:Button ID="btnWhiteSmoke" runat="server" BackColor="WhiteSmoke" CssClass="color"
                                    Text=" " ToolTip="WhiteSmoke" OnClick="btnWhiteSmoke_Click" />
                            </td>
                            <td>
                                <asp:Button ID="btnYellow" runat="server" BackColor="Yellow" CssClass="color" Text=" "
                                    ToolTip="Yellow" OnClick="btnYellow_Click" />
                            </td>
                            <td>
                                <asp:Button ID="btnYellowGreen" runat="server" BackColor="YellowGreen" CssClass="color"
                                    Text=" " ToolTip="YellowGreen" OnClick="btnYellowGreen_Click" />
                            </td>
                            <td>
                                &nbsp;
                            </td>
                            <td>
                                &nbsp;
                            </td>
                            <td>
                                &nbsp;
                            </td>
                            <td>
                                &nbsp;
                            </td>
                            <td>
                                &nbsp;
                            </td>
                            <td>
                                &nbsp;
                            </td>
                            <td>
                                &nbsp;
                            </td>
                            <td>
                                &nbsp;
                            </td>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                    </table>
                </div>
            </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
