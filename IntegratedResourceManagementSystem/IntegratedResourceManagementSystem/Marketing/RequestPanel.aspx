<%@ Page Title="" Language="C#" MasterPageFile="~/Marketing/Marketing.Master" AutoEventWireup="true" CodeBehind="RequestPanel.aspx.cs" Inherits="IntegratedResourceManagementSystem.Marketing.RequestPanel" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <link href="../Styles/marketing-item-master.css" rel="stylesheet" type="text/css" />

    <style type ="text/css">
        .titleList
        {
             background: rgb(213,206,166); /* Old browsers */
    /* IE9 SVG, needs conditional override of 'filter' to 'none' */
    background: url(data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiA/Pgo8c3ZnIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgd2lkdGg9IjEwMCUiIGhlaWdodD0iMTAwJSIgdmlld0JveD0iMCAwIDEgMSIgcHJlc2VydmVBc3BlY3RSYXRpbz0ibm9uZSI+CiAgPGxpbmVhckdyYWRpZW50IGlkPSJncmFkLXVjZ2ctZ2VuZXJhdGVkIiBncmFkaWVudFVuaXRzPSJ1c2VyU3BhY2VPblVzZSIgeDE9IjAlIiB5MT0iMCUiIHgyPSIwJSIgeTI9IjEwMCUiPgogICAgPHN0b3Agb2Zmc2V0PSIwJSIgc3RvcC1jb2xvcj0iI2Q1Y2VhNiIgc3RvcC1vcGFjaXR5PSIxIi8+CiAgICA8c3RvcCBvZmZzZXQ9IjQwJSIgc3RvcC1jb2xvcj0iI2M5YzE5MCIgc3RvcC1vcGFjaXR5PSIxIi8+CiAgICA8c3RvcCBvZmZzZXQ9IjEwMCUiIHN0b3AtY29sb3I9IiNiN2FkNzAiIHN0b3Atb3BhY2l0eT0iMSIvPgogIDwvbGluZWFyR3JhZGllbnQ+CiAgPHJlY3QgeD0iMCIgeT0iMCIgd2lkdGg9IjEiIGhlaWdodD0iMSIgZmlsbD0idXJsKCNncmFkLXVjZ2ctZ2VuZXJhdGVkKSIgLz4KPC9zdmc+);
    background: -moz-linear-gradient(top,  rgba(213,206,166,1) 0%, rgba(201,193,144,1) 40%, rgba(183,173,112,1) 100%); /* FF3.6+ */
    background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,rgba(213,206,166,1)), color-stop(40%,rgba(201,193,144,1)), color-stop(100%,rgba(183,173,112,1))); /* Chrome,Safari4+ */
    background: -webkit-linear-gradient(top,  rgba(213,206,166,1) 0%,rgba(201,193,144,1) 40%,rgba(183,173,112,1) 100%); /* Chrome10+,Safari5.1+ */
    background: -o-linear-gradient(top,  rgba(213,206,166,1) 0%,rgba(201,193,144,1) 40%,rgba(183,173,112,1) 100%); /* Opera 11.10+ */
    background: -ms-linear-gradient(top,  rgba(213,206,166,1) 0%,rgba(201,193,144,1) 40%,rgba(183,173,112,1) 100%); /* IE10+ */
    background: linear-gradient(to bottom,  rgba(213,206,166,1) 0%,rgba(201,193,144,1) 40%,rgba(183,173,112,1) 100%); /* W3C */
    filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#d5cea6', endColorstr='#b7ad70',GradientType=0 ); /* IE6-8 */
    padding:5px 5px;
    border-radius:5px 5px 0px 0px;
    line-height: 15px;
    height:15px;
    text-shadow: 1px 1px 1px #fcffad;
    font-family:Verdana;
    font-size: 10px;
            width : 100%;
        }
        .style5
        {
            width: 145px;
            text-align: right;
            color: White;
        }
        .style6
        {
            width: 154px;
            text-align: right;
            color: White;
        }
        .style7
        {
            width: 246px;
        }
        .style8
        {
            width: 235px;
        }
        .style9
        {
            width: 133px;
            text-align: right;
            color: White;
        }
        
        .errorDiv
        {
            text-align:center; background-color:#FFFFCC; border:1px Solid #FFCC66;
        }
        </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
  <div style="height:28px; margin-bottom:10px; line-height:28px; color: #333;text-shadow: 1px 1px 0px white;">
            <asp:Image ID="imgpnlTitle" runat="server" ImageUrl="~/Resources/product_brand.png" 
                        ImageAlign="Top" Height ="28px" /> &nbsp;<asp:Label 
                ID="Label1" runat="server" Text="PULL-OUT REQUEST LIST" Font-Bold="True" 
                Font-Names="Verdana" Font-Size="14px"></asp:Label>
            
            <hr />
        </div>
    <asp:UpdatePanel ID="upnlAccounts" runat ="server" >
        <ContentTemplate>
      
            <div style ="height :28px; margin-bottom:1px;" class="modalDrag">    
                <div style ="float:left;">
                    <div  style ="float:left; margin-right:3px;">
                        <asp:Button ID="btnNewRequest" runat="server" Text="NEW REQUEST" CssClass ="btnNew" 
                            onclick="btnNewRequest_Click"  />
                        
                    </div>
                    <div  style ="float:left; margin-right:3px;">
                        <asp:Button ID="btnUpdate" runat="server" Text="UPDATE REQUEST" CssClass ="btnUpdate"  onclick="btnUpdate_Click" />
                    </div>  
                    <div  style ="float:left; margin-right:3;">
                        <asp:Button ID="btnDeleteRequest" runat="server" Text="DELETE REQUEST" CssClass ="btnDelete"  />
                        <asp:ModalPopupExtender ID="btnDeleteRequest_ModalPopupExtender" runat="server" 
                                        CancelControlID="btnNo" DynamicServicePath="" Enabled="True" 
                                        PopupControlID="pnlDeleteModal" PopupDragHandleControlID="pnlDeleteModalDrag" 
                                        TargetControlID="btnDeleteRequest" BackgroundCssClass="bgModal">
                            <Animations>
                                <OnShown>
                                    <FadeIn Duration=".3"></FadeIn>
                                </OnShown>
                            </Animations>
                        </asp:ModalPopupExtender>
                    </div>
                    <div  style ="float:left; margin-right:3px;">
                        <asp:Button ID="btnPreviewRequest" runat="server" Text="PREVIEW REQUEST" CssClass ="btnPrint" />
                            <asp:ModalPopupExtender ID="btnPreviewRequest_ModalPopupExtender" runat="server" 
                                        CancelControlID="btnNo" DynamicServicePath="" Enabled="True" 
                                        PopupControlID="pnlPreviewModal" PopupDragHandleControlID="pnlPreviewModalDrag" 
                                        TargetControlID="btnPreviewRequest" BackgroundCssClass="bgModal">
                                <Animations>
                                    <OnShown>
                                        <FadeIn Duration=".3"></FadeIn>
                                       
                                    </OnShown>
                                </Animations>
                            </asp:ModalPopupExtender>
                    </div>
                    <div  style ="float:left; margin-right:3px;">
                        <asp:Button ID="btnPrintRequest" runat="server" Text="PRINT REQUEST" CssClass ="btnPrint"  TabIndex="12" 
                            onclick="btnPrintRequest_Click" />
                    </div>                    
                </div>

               <div style="float: right;" class="SearchTextContainer">
                SEARCH:
                    <asp:TextBox ID="txtSearch" runat="server" autofocus placeholder="Search Brand" CssClass="modalText" OnTextChanged="txtSearch_TextChanged"
                        AutoPostBack="True" Height="16px" Font-Size="10px" Width="150px" ToolTip="Search Brand"></asp:TextBox>
                    <asp:ImageButton ID="imgBtnSearch" runat="server" ImageAlign="AbsBottom" ImageUrl="~/Resources/search.png"
                        ToolTip="SEARCH" />
                </div>
            </div>
            
            <asp:Panel ID ="pnlError" runat ="server" Visible ="false" CssClass="errorDiv" >
                  <asp:Image ID="Image2" runat="server" ImageUrl="~/Resources/warning.png" 
                        ImageAlign="AbsMiddle" Height="25px" Width="25px" /> <asp:Label ID="lblError" runat="server" 
                        Text="PLEASE SELECT REQUEST!!" Font-Bold="True" Font-Names="Verdana" 
                        Font-Size="12px" ForeColor="#CC6600"/>
            </asp:Panel>
            <div class ="listContent" style="width:750px;" >
                <div class ="titleList">
                    <asp:Image ID="imgList" runat="server" Height="16px" Width ="20px"
                        ImageUrl="~/Resources/category.png" ImageAlign="AbsBottom" />
                LIST OF CUSTOMER PULL-OUT REQUEST</div>
                <asp:Panel ID ="pnlPulloutList" runat ="server" Width ="100%" Height ="370px" 
                    ScrollBars ="Auto"  >
                    <asp:GridView ID="gvPulloutRequestList" runat="server" CellPadding="4" ForeColor="#333333" 
                        GridLines="None" AutoGenerateColumns="False" Font-Names="Verdana" 
                        Font-Size="11px" DataKeyNames="RecordNo,CompName" 
                        EnablePersistedSelection="True" OnSelectedIndexChanged="gvPulloutRequestList_SelectedIndexChanged"
                        Width="713px" style="margin-right: 57px" >
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:TemplateField>
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Image ID="Image1" runat="server" Height="16px" 
                         ImageUrl="~/Resources/category.png" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:CommandField ShowSelectButton="True" >
                            </asp:CommandField>
                            <asp:BoundField DataField="RecordNo" HeaderText="RECORD #" Visible="true">
                                <HeaderStyle Wrap="False" />
                                <ItemStyle Wrap="False" />
                            </asp:BoundField>
                            <asp:BoundField DataField="TransDate" HeaderText="TRANSACTION DATE" 
                                DataFormatString="{0:MMMM dd, yyyy}">
                                <HeaderStyle Wrap="False" />
                                <ItemStyle Wrap="False" />
                            </asp:BoundField>
                            <asp:BoundField DataField="SeriesPerBrand" HeaderText="SERIES #">
                                <HeaderStyle Wrap="False" />
                                <ItemStyle Wrap="False" />
                            </asp:BoundField>
                            <asp:BoundField DataField="AcctName" HeaderText="ACCOUNT NAME">
                                <HeaderStyle Wrap="False" />
                                <ItemStyle Wrap="False" />
                            </asp:BoundField>
                            <asp:BoundField DataField="BranchName" HeaderText="BRANCH NAME">
                                <ControlStyle Width="50px" />
                                <HeaderStyle Wrap="False" />
                                <ItemStyle Wrap="False" />
                            </asp:BoundField>
                            <asp:BoundField DataField="DeptCode" HeaderText="DEPT. CODE">
                                <HeaderStyle Wrap="False" />
                                <ItemStyle Wrap="False" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Pullout_Date" HeaderText="PULL-OUT DATE" 
                                DataFormatString="{0:MMMM dd, yyyy}">
                                <HeaderStyle Wrap="False" />
                                <ItemStyle Wrap="False" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Forwarders" HeaderText="FORWARDER">
                                <HeaderStyle Wrap="False" />
                                <ItemStyle Wrap="False"/>
                            </asp:BoundField>
                            <asp:BoundField DataField="BrandName" HeaderText="BRAND">
                                <HeaderStyle Wrap="False" />
                                <ItemStyle Wrap="False"/>
                            </asp:BoundField>
                        </Columns>
                        <EditRowStyle BackColor="#7C6F57" />
                            <EmptyDataTemplate>
                                EMPTY DATA!!!
                            </EmptyDataTemplate>
                        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#E3EAEB" />
                        <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="False" ForeColor="#333333" 
                          Font-Names="Verdana" Font-Size="11px" Font-Italic="True" />
                        <SortedAscendingCellStyle BackColor="#F8FAFA" />
                        <SortedAscendingHeaderStyle BackColor="#246B61" />
                        <SortedDescendingCellStyle BackColor="#D4DFE1" />
                        <SortedDescendingHeaderStyle BackColor="#15524A" />
                    </asp:GridView>
                </asp:Panel>
            </div>
            <%--Delete Modal--%>
            <asp:Panel ID ="pnlDeleteModal" runat ="server" CssClass ="modal" >
                <asp:Panel ID= "pnlDeleteModalDrag" runat ="server" CssClass ="modalDrag">
                    <div class ="sizeLogo">
                        <asp:Image ID="Image1" runat="server" Height="16px" ImageAlign="AbsBottom" 
                                    ImageUrl="~/Resources/size.png" />
                        CONFIRMATION!!!
                    </div>
                </asp:Panel>
                <div class ="modalWarningText">
                    Are you sure you want to Delete this Data?
                </div>
                <div style ="margin:5px 5px; text-align:center;">
                    <asp:Button ID="btnYes" runat="server" Text="YES" 
                        CssClass ="modalWarningButtonYes" ToolTip="Delete" 
                        onclick="btnYes_Click"  />
                    <asp:Button ID="btnNo" runat="server" Text="NO" 
                        CssClass ="modalWarningButtonNo" ToolTip="Cancel" />
                </div>
            </asp:Panel>

           
         
            <asp:Panel ID ="pnlPreviewModal" runat ="server" CssClass ="modal">
                <asp:Panel ID= "pnlPreviewModalDrag" runat ="server" CssClass ="modalDrag">

                    <div class ="sizeLogo">
                        <asp:Image ID="Image3" runat="server" Height="16px" ImageAlign="AbsBottom" 
                                    ImageUrl="~/Resources/invoice.png" />
                        REQUEST PREVIEW
                    </div>
                    <div class ="close_btn">
                    <asp:ImageButton ID="imgBtnClose" runat="server" 
                                     CssClass ="btnClose" ImageUrl="~/Resources/cancel_gray.png" 
                        ToolTip="CLOSE" />
                  </div> 
                </asp:Panel>
                <table cellpadding="0" cellspacing="0">
                    <tr>
                        <td class="modalLabel">ACCOUNT NAME:</td>
                        <td >
                            <asp:TextBox ID="txtAcctName" runat="server" Width="224px" ReadOnly="true"></asp:TextBox>
                        </td>
                        <td class="modalLabel">TRANSACTION DATE:</td>
                        <td>
                            <asp:TextBox ID="txtTransDate" runat="server" ReadOnly="true"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="modalLabel">BRANCH NAME:</td>
                        <td >
                            <asp:TextBox ID="txtBranchName" runat="server" Width="224px" ReadOnly="true"></asp:TextBox>
                        </td>
                        <td class="modalLabel">PULL-OUT DATE:</td>
                        <td>
                            <asp:TextBox ID="txtPulloutDate" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="modalLabel">BRAND NAME:</td>
                        <td >
                            <asp:TextBox ID="txtBrandName" runat="server" Width="137px"></asp:TextBox>
                        </td>
                        <td class="style6">&nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="modalLabel">FORWARDER:</td>
                        <td >
                            <asp:TextBox ID="txtForwarder" runat="server" Width="224px"></asp:TextBox>
                        </td>
                        <td >
                            <asp:TextBox ID="txtRecordNo" runat="server" Width="137px" Visible="false"></asp:TextBox>
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td colspan="4"></td>
                    </tr>
                    <tr>
                        <td colspan="4" align="center">
                            <asp:GridView ID="gvPODetailList" runat="server" 
                                AutoGenerateColumns="False" CellPadding="4" DataKeyNames="BoxNo,StyleNo" 
                                EnablePersistedSelection="True" Font-Names="Verdana" Font-Size="11px" 
                                ForeColor="#333333" GridLines="None" >
                                <AlternatingRowStyle BackColor="White" />
                                <Columns>
                                    <asp:TemplateField>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <%--<asp:CheckBox ID="chkRequestItems" runat="server" />--%>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="RecordNo" HeaderText="RECORD #" Visible="false">
                                    <HeaderStyle Wrap="False" />
                                    <ItemStyle Wrap="False" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="BoxNo" HeaderText="BOX NO" SortExpression="BoxNo">
                                    <HeaderStyle Wrap="False" Width="15px" />
                                    <ItemStyle Wrap="False" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="StyleNo" HeaderText="STYLE NUMBER" 
                                        SortExpression="StyleNo">
                                    <HeaderStyle Wrap="False" Width="60px" />
                                    <ItemStyle Wrap="False" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="Description" HeaderText="DESCRIPTION" 
                                        SortExpression="Description">
                                    <HeaderStyle Wrap="False" Width="150px" />
                                    <ItemStyle Wrap="False" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="Quantity" HeaderText="QTY">
                                    <HeaderStyle Wrap="False" Width="25px" />
                                    <ItemStyle Wrap="False" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="SRP" DataFormatString="{0:Php 0.00}" 
                                        HeaderText="SRP">
                                    <HeaderStyle Wrap="False" Width="55px" />
                                    <ItemStyle Wrap="False" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="TtlAmount" DataFormatString="{0:Php 0.00}" 
                                        HeaderText="TOTAL AMOUNT">
                                    <HeaderStyle Wrap="False" Width="75px" />
                                    <ItemStyle Wrap="False" />
                                    </asp:BoundField>
                                </Columns>
                                <EditRowStyle BackColor="#7C6F57" />
                                <EmptyDataTemplate>
                                    EMPTY DATA!!!
                                </EmptyDataTemplate>
                                <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                                <RowStyle BackColor="#E3EAEB" />
                                <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="False" Font-Italic="True" 
                                    Font-Names="Verdana" Font-Size="11px" ForeColor="#333333" />
                                <SortedAscendingCellStyle BackColor="#F8FAFA" />
                                <SortedAscendingHeaderStyle BackColor="#246B61" />
                                <SortedDescendingCellStyle BackColor="#D4DFE1" />
                                <SortedDescendingHeaderStyle BackColor="#15524A" />
                            </asp:GridView>
                        </td>
                    </tr>
                </table>
            </asp:Panel>
       
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
