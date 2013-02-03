<%@ Page Title="" Language="C#" MasterPageFile="~/Marketing/Marketing.Master" AutoEventWireup="true"
    CodeBehind="SMPullOutLetterDetailsPreview.aspx.cs" Inherits="IntegratedResourceManagementSystem.Marketing.SMPullOutLetterDetailsPreview" %>

<asp:Content ID="HeadContent" ContentPlaceHolderID="head" runat="server">
    <link href="../Styles/sm-pull-out-details.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="modalDrag">
        <div class="close_btn" style="cursor: pointer;">
            <img src="../Resources/cancel_gray.png" onclick="window.close()" alt="" title="Close Window" />
        </div>
    </div>
    <div>
        <div style="width:700px;">
            <div class="titleForm" style="height:10px;">
             PULL OUT LETTER HEADER
            </div>
            <div class="form" >
                <table style="">
                  <tr>
                        <td class="modalLabel">
                           SERIES #:
                        </td>
                        <td>
                           <asp:TextBox ID="txtSeriesNumber" EnableViewState ="false"  CssClass="modalText" Height="22px" Width="150px" runat="server"></asp:TextBox>
                            <asp:HiddenField ID="hfPullOutCode" runat="server" />
                        </td>
                        <td class="modalLabel">
                           PULL OUT DATE:
                        </td>
                        <td>
                            <asp:TextBox ID="txtPullOutDate" CssClass="modalText calendar" Height="22px" Width="100px" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="modalLabel">
                           CUSTOMER/OUTLET:
                        </td>
                        <td>
                            <asp:TextBox ID="txtOutLetName" CssClass="modalText" Height="22px" 
                                runat="server" Width="300px"></asp:TextBox> 
                        </td>
                        <td>
                            &nbsp;
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                  
                    <tr>
                        <td class="modalLabel">
                            ACCOUNT NAME:
                        </td>
                        <td>
                           <asp:TextBox ID="txtAccountName" CssClass="modalText" Height="22px" Width="150px" runat="server"></asp:TextBox>
                        </td>
                        <td>
                            &nbsp;
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                      <tr>
                        <td class="modalLabel">
                           BRANCH NAME:
                        </td>
                        <td>
                            <asp:TextBox ID="TextBox1" CssClass="modalText" Height="22px" 
                                runat="server" Width="270px"></asp:TextBox> 
                        </td>
                        <td class="modalLabel">
                          
                            BRANCH DEPT. CODE:</td>
                        <td>
                            <asp:TextBox ID="txtBranchDeptCode" CssClass="modalText" Height="22px" Width="100px" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                     <tr>
                        <td class="modalLabel">
                           BRAND NAME:
                        </td>
                        <td>
                            <asp:TextBox ID="TextBox2" CssClass="modalText" Height="22px" 
                                runat="server" Width="150px"></asp:TextBox> 
                        </td>
                        <td class="modalLabel">
                          
                            BRAND DEPT. CODE:</td>
                        <td>
                            <asp:TextBox ID="TextBox3" CssClass="modalText" Height="22px" Width="100px" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
        <div style="margin-top:10px;">
            <div style="float:left; min-width:230px; margin-bottom:10px;">
                <div class="titleForm">
                Containers
                <div  style="float:right;">
                     <asp:Label ID="lblTotalCotainer" EnableViewState="false" CssClass="modalLabel" runat="server" Text="Label" 
                         ForeColor="#CC0000"></asp:Label>
                 </div>
                </div>
                <div>
                    <asp:GridView ID="gvContainers" CssClass="table_grid" runat="server" AutoGenerateColumns="False" 
                        CellPadding="4" ForeColor="#333333" GridLines="None" 
                        DataKeyNames="BoxNumber" 
                        onselectedindexchanged="gvContainers_SelectedIndexChanged">
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                        <Columns>
                            <asp:TemplateField ShowHeader="False">
                                <ItemTemplate>
                                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" 
                                        CommandName="Select" Text="">
                                        <asp:Image ID="imgContainer" ImageUrl='<%# Eval("ImageUrl") %>' runat="server" />
                                        </asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="BoxNumber" HeaderText="BOX #" />
                        </Columns>
                        <EditRowStyle BackColor="#999999" />
                        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#E9E7E2" />
                        <SortedAscendingHeaderStyle BackColor="#506C8C" />
                        <SortedDescendingCellStyle BackColor="#FFFDF8" />
                        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                    </asp:GridView>
                </div>
            </div>
            <div style="float:left; margin-left:10px; margin-bottom:10px; min-width:300px;">
                <div class="titleForm">
                 Details
                 <div  style="float:right; margin-left:5px;">
                     <asp:ImageButton ID="imgBtn" runat="server" ImageUrl="~/Resources/Refresh.png" 
                         onclick="imgBtn_Click" />
                 </div>
                 <div  style="float:right;">
                     <asp:Label ID="txtSummary" EnableViewState ="false" CssClass="modalLabel" runat="server" Text="Label" 
                         ForeColor="#CC0000"></asp:Label>
                 </div>
                 
                </div>
                <div>
                    <asp:GridView ID="gvBoxContainerDetails" CssClass="table_grid" runat="server" 
                        AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" 
                        GridLines="None" EnableViewState="False">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:BoundField DataField="ContainerType" HeaderText="TYPE" />
                            <asp:BoundField DataField="ContainerNumber" HeaderText="BOX#" />
                            <asp:BoundField DataField="StyleNumber" HeaderText="STYLE #" />
                            <asp:BoundField DataField="StyleDescription" HeaderText="DESCRIPTION" />
                            <asp:BoundField DataField="Quantity" HeaderText="QTY" />
                            <asp:BoundField DataField="SRP" DataFormatString="{0:###,###.00}" 
                                HeaderText="SRP" />
                            <asp:BoundField DataField="TtlAmount" DataFormatString="{0:###,###.00}" 
                                HeaderText="TOTAL AMT" />
                            <asp:CheckBoxField DataField="IsLostTag" HeaderText="LOST TAG" />
                        </Columns>
                        <EditRowStyle BackColor="#7C6F57" />
                        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#E3EAEB" />
                        <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#F8FAFA" />
                        <SortedAscendingHeaderStyle BackColor="#246B61" />
                        <SortedDescendingCellStyle BackColor="#D4DFE1" />
                        <SortedDescendingHeaderStyle BackColor="#15524A" />
                    </asp:GridView>
                </div>
                <div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
