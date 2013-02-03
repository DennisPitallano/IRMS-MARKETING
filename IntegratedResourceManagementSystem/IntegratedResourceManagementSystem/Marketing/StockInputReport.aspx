<%@ Page Title="" Language="C#" MasterPageFile="~/Marketing/Marketing.Master" AutoEventWireup="true"
    CodeBehind="StockInputReport.aspx.cs" Inherits="IntegratedResourceManagementSystem.Marketing.StockInputReport" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Src="~/Marketing/controls/UCLoader.ascx" TagName="LOADER" TagPrefix="UC" %>
<asp:Content ID="HeadContent" ContentPlaceHolderID="head" runat="server">
    <link href="../Styles/cdi-reports.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="panelTitle">
        <img alt="REPORT" src="../Resources/adjustment.png" height="28px" align="top" />
        Stock Input Report Generator
        <div style="float: right;">
            <a href="StylePanel.aspx">
                <img src="../Resources/reply.png" />
            </a>
        </div>
    </div>
    <div style="min-height: 470px;">
        <asp:UpdatePanel ID="upnlGenerator" runat="server">
            <ContentTemplate>
                <div style="float: left; margin-right: 5px;">
                    <asp:UpdateProgress ID="upProgress" runat="server" AssociatedUpdatePanelID="upnlGenerator">
                        <ProgressTemplate>
                            <asp:PlaceHolder ID="plcHLoader" runat="server" EnableViewState="False">
                                <UC:LOADER ID="loader" runat="server" />
                            </asp:PlaceHolder>
                        </ProgressTemplate>
                    </asp:UpdateProgress>
                </div>
                <div class="generator" style="min-width: 450px;">
                    <div class="modalDrag">
                        <div class="sizeLogo" style="font-variant: small-caps; font-size: 12px;">
                            Report Generator</div>
                    </div>
                    <div style="height: 30px; margin-top: 5px;">
                        <div class="SearchTextContainer" style="float: left;">
                            <asp:RadioButtonList ID="rdioAreaType" runat="server" RepeatDirection="Horizontal"
                                AutoPostBack="True" OnSelectedIndexChanged="rdioAreaType_SelectedIndexChanged">
                                <asp:ListItem Selected="True">AREA</asp:ListItem>
                                <asp:ListItem>SUB-AREA</asp:ListItem>
                            </asp:RadioButtonList>
                        </div>
                    </div>
                    <div style="min-height: 220px;">
                        <div class="group-area" style="min-width: 180px; float: left;">
                            <div style="margin: 5px 5px;">
                                AREA-GROUP</div>
                            <asp:RadioButtonList ID="rdioAreaGroup" runat="server" AutoPostBack="True" OnSelectedIndexChanged="rdioAreaGroup_SelectedIndexChanged">
                            </asp:RadioButtonList>
                        </div>
                        <div class="group-area" style="min-width: 180px; float: left;">
                            <div style="margin: 5px 5px;">
                                SUB-AREA GROUP</div>
                            <asp:RadioButtonList ID="rdioSubAreaGroup" Enabled="false" runat="server" 
                                AutoPostBack="True" 
                                onselectedindexchanged="rdioSubAreaGroup_SelectedIndexChanged">
                            </asp:RadioButtonList>
                        </div>
                    </div>
                    <div class="group-area-" style="margin-top: 5px; width:200px;">
                        <asp:RadioButtonList ID="rdioDateTypes" CssClass="modalText" Font-Size="10px"
                            runat="server" RepeatDirection="Horizontal" AutoPostBack="True" onselectedindexchanged="rdioDateTypes_SelectedIndexChanged" >
                            <asp:ListItem Selected="True">RANGE</asp:ListItem>
                            <asp:ListItem>MONTH</asp:ListItem>
                            <asp:ListItem>YEAR</asp:ListItem>
                        </asp:RadioButtonList>
                    </div>
                    <div class="group-area" style="margin: 5px 10px; min-width: 280px;">
                        <asp:MultiView ID="mvDateParameters" runat="server" ActiveViewIndex="0">
                            <asp:View runat="server" ID="vRange">
                                 <label for="MainContent_DateFrom">
                                    FROM:</label>
                                <asp:TextBox ID="txtDateFrom" CssClass="modalText" Height="20px" Width="100px" 
                                     runat="server" AutoPostBack="True" ontextchanged="txtDateFrom_TextChanged"></asp:TextBox>
                                 <asp:CalendarExtender ID="txtDateFrom_CalendarExtender" runat="server" 
                                     Enabled="True" TargetControlID="txtDateFrom">
                                 </asp:CalendarExtender>
                                 <label for="MainContent_DateFrom">
                                    TO:</label>
                                <asp:TextBox ID="txtDateTo" CssClass="modalText" Height="20px" Width="100px" 
                                     runat="server" AutoPostBack="True" ontextchanged="txtDateTo_TextChanged"></asp:TextBox>
                                 <asp:CalendarExtender ID="txtDateTo_CalendarExtender" runat="server" 
                                     Enabled="True" TargetControlID="txtDateTo">
                                 </asp:CalendarExtender>
                            </asp:View>
                            <asp:View runat="server" ID="vMonth">
                                <label for="MainContent_DDLMonth">
                                    MONTH:</label>
                                <asp:DropDownList ID="DDLMonth" CssClass="modalText" Height="20px" runat="server"
                                    AutoPostBack="True" onselectedindexchanged="DDLMonth_SelectedIndexChanged">
                                </asp:DropDownList>
                                <label for="MainContent_DDLMonthYear">
                                    YEAR:</label>
                                <asp:DropDownList ID="DDLMonthYear" Height="20px" CssClass="modalText" runat="server"
                                    AutoPostBack="True" 
                                    onselectedindexchanged="DDLMonthYear_SelectedIndexChanged">
                                </asp:DropDownList>
                            </asp:View>
                            <asp:View runat="server" ID="vYear">
                                <label for="MainContent_DDLYear">
                                    YEAR:</label>
                                <asp:DropDownList ID="DDLYear" Height="20px" CssClass="modalText" runat="server"
                                    AutoPostBack="True" onselectedindexchanged="DDLYear_SelectedIndexChanged">
                                </asp:DropDownList>
                            </asp:View>
                        </asp:MultiView>
                    </div>
                    <div class="group-area" style="margin: 5px 10px; min-width: 200px;">
                        <label for="MainContent_DDLBrandsForArea">
                            BRAND:</label>
                        <asp:DropDownList ID="DDLBrandsForArea" CssClass="modalText" Height="22px" runat="server"
                            AutoPostBack="True" 
                            onselectedindexchanged="DDLBrandsForArea_SelectedIndexChanged">
                        </asp:DropDownList>
                    </div>
                    <div class="group-area" style="margin: 5px 10px; min-width: 240px;">
                    <label for="MainContent_rdioPriceStatus">
                            MEMO STATUS:</label>
                        <asp:RadioButtonList ID="rdioPriceStatus" runat="server" 
                            RepeatDirection="Horizontal" Width="242px" AutoPostBack="True" 
                            onselectedindexchanged="rdioPriceStatus_SelectedIndexChanged">
                            <asp:ListItem Selected="True">REGULAR</asp:ListItem>
                            <asp:ListItem>MARKDOWN</asp:ListItem>
                        </asp:RadioButtonList>
                    </div>
                    <div style="height: 25px; text-align: center;">
                        <asp:HyperLink ID="hpLinkPrint" Height="22px" Target="_blank" CssClass="btnPrint print-link"
                            runat="server">GENERATE REPORT</asp:HyperLink>
                    </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>
