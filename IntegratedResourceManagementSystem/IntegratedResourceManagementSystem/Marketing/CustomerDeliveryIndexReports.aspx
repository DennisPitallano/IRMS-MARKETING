<%@ Page Title="" Language="C#" MasterPageFile="~/Marketing/Marketing.Master" AutoEventWireup="true"
    CodeBehind="CustomerDeliveryIndexReports.aspx.cs" Inherits="IntegratedResourceManagementSystem.Marketing.CustomerDeliveryIndexReports" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Src="~/Marketing/controls/UCLoader.ascx" TagName="LOADER" TagPrefix="UC" %>
<asp:Content ID="HeadContent" ContentPlaceHolderID="head" runat="server">
    <link href="../Styles/cdi-reports.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="panelTitle">
        <img alt="REPORT" src="../Resources/adjustment.png" height="28px" align="top" />
        Customer Delivery Index Report Generator
        <div style="float: right;">
            <a href="DeliveryReceiptsMenu.aspx">
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
                <div class="generator">
                    <div class="modalDrag">
                      <div class="sizeLogo" style="font-variant:small-caps; font-size:12px;">CDI Summary Report Generator</div>
                    </div>
                    <div class="group-area">
                        <div style="margin: 5px 5px;">
                            AREA-GROUP</div>
                        <asp:RadioButtonList ID="rdioAreaGroup" runat="server" AutoPostBack="True" OnSelectedIndexChanged="rdioAreaGroup_SelectedIndexChanged">
                            <asp:ListItem>MMDS</asp:ListItem>
                            <asp:ListItem>LUZON</asp:ListItem>
                            <asp:ListItem>VISAYAS</asp:ListItem>
                            <asp:ListItem>MINDANAO</asp:ListItem>
                            <asp:ListItem>BOUTIQUE</asp:ListItem>
                        </asp:RadioButtonList>
                    </div>
                    <div style="margin: 5px 10px;">
                        <label for="MainContent_DDLMonth">
                            MONTH:</label>
                        <asp:DropDownList ID="DDLMonth" CssClass="modalText" Height="20px" runat="server"
                            AutoPostBack="True" OnSelectedIndexChanged="DDLMonth_SelectedIndexChanged">
                        </asp:DropDownList>
                        <label for="MainContent_DDLYear">
                            YEAR:</label>
                        <asp:DropDownList ID="DDLYear" Height="20px" CssClass="modalText" runat="server"
                            AutoPostBack="True" OnSelectedIndexChanged="DDLYear_SelectedIndexChanged">
                        </asp:DropDownList>
                    </div>
                    <div style="margin: 5px 10px;">
                        <label for="MainContent_DDLBrandsForArea">
                            BRAND:</label>
                        <asp:DropDownList ID="DDLBrandsForArea" CssClass="modalText" Height="22px" runat="server"
                            AutoPostBack="True" OnSelectedIndexChanged="DDLBrandsForArea_SelectedIndexChanged">
                        </asp:DropDownList>
                    </div>
                      <div style="margin: 5px 10px;">
                        <label for="MainContent_rdioTransitStatus">
                            DR STATUS:</label>
                        <asp:RadioButtonList ID="rdioTransitStatus" runat="server" 
                            RepeatDirection="Horizontal" AutoPostBack="True" 
                              onselectedindexchanged="rdioTransitStatus_SelectedIndexChanged">
                            <asp:ListItem Selected="True">ALL</asp:ListItem>
                            <asp:ListItem Value="In Transit">IN TRANSIT</asp:ListItem>
                            <asp:ListItem Value="Confirmed">CONFIRMED</asp:ListItem>
                        </asp:RadioButtonList>
                    </div>
                    <div style="height: 25px; text-align: center;">
                        <asp:HyperLink ID="hpLinkPrint" Height="22px" Target="_blank" CssClass="btnPrint print-link"
                            runat="server">GENERATE REPORT</asp:HyperLink>
                    </div>
                </div>
                 <div class="generator">
                     <div style="font-size: 11px;" class="modalDrag">
                       <div class="sizeLogo" style="font-variant:small-caps; font-size:8px; text-align:center; font-family:Verdana;">
                        DR SUMMARY REPORT GENERATOR PER AREA AND CUSTOMER</div>
                    </div>
                     <div class="group-area">
                        <div style="margin: 5px 5px;">
                            AREA-GROUP</div>
                        <asp:RadioButtonList ID="rdioAreaGroupPerAreaAndCustomer" runat="server" 
                             AutoPostBack="True" 
                             onselectedindexchanged="rdioAreaGroupPerAreaAndCustomer_SelectedIndexChanged" >
                            <asp:ListItem>MMDS</asp:ListItem>
                            <asp:ListItem>LUZON</asp:ListItem>
                            <asp:ListItem>VISAYAS</asp:ListItem>
                            <asp:ListItem>MINDANAO</asp:ListItem>
                            <asp:ListItem>BOUTIQUE</asp:ListItem>
                        </asp:RadioButtonList>
                    </div>
                    <div style="margin: 5px 10px;">
                        <label for="MainContent_DDLYearPerAreaAndCustomer">
                            &nbsp;&nbsp; YEAR:</label>
                        <asp:DropDownList ID="DDLYearPerAreaAndCustomer" Height="20px" 
                            CssClass="modalText" runat="server"
                            AutoPostBack="True" 
                            onselectedindexchanged="DDLYearPerAreaAndCustomer_SelectedIndexChanged" >
                        </asp:DropDownList>
                    </div>
                    <div style="margin: 5px 10px;">
                        <label for="MainContent_DDBrandPerAreaAndCustomer">
                            BRAND:</label>
                        <asp:DropDownList ID="DDLBrandPerAreaAndCustomer" CssClass="modalText" 
                            Height="22px" runat="server"
                            AutoPostBack="True" 
                            onselectedindexchanged="DDLBrandPerAreaAndCustomer_SelectedIndexChanged" >
                        </asp:DropDownList>
                    </div>
                     <div style="margin: 5px 10px;">
                        <label for="MainContent_rdioTransitStatus">
                            DR STATUS:</label>
                        <asp:RadioButtonList ID="rdioStatusPerAreaAndCustomer" runat="server" 
                            RepeatDirection="Horizontal" AutoPostBack="True" 
                             onselectedindexchanged="rdioStatusPerAreaAndCustomer_SelectedIndexChanged" >
                            <asp:ListItem Selected="True">ALL</asp:ListItem>
                            <asp:ListItem Value="In Transit">IN TRANSIT</asp:ListItem>
                            <asp:ListItem Value="Confirmed">CONFIRMED</asp:ListItem>
                        </asp:RadioButtonList>
                    </div>
                      <div style="height: 25px; text-align: center;">
                        <asp:HyperLink ID="hplinkPrintPreviewPerAreaAndCustomer" Height="22px" Target="_blank" CssClass="btnPrint print-link"
                            runat="server">GENERATE REPORT</asp:HyperLink>
                    </div>
                </div>
                <div class="generator">
                    <div style="font-size: 11px;" class="modalDrag">
                      <div class="sizeLogo" style="font-variant:small-caps; font-size:8px; text-align:center; font-family:Verdana;">
                        DR SUMMARY REPORT GENERATOR PER AREA
                      </div>
                    </div>
                    <div style="margin: 5px 10px;">
                        <label for="MainContent_DDLYearPerArea">
                            &nbsp;&nbsp; YEAR:</label>
                        <asp:DropDownList ID="DDLYearPerArea" Height="20px" CssClass="modalText" runat="server"
                            AutoPostBack="True" OnSelectedIndexChanged="DDLYearPerArea_SelectedIndexChanged">
                        </asp:DropDownList>
                    </div>
                    <div style="margin: 5px 10px;">
                        <label for="MainContent_DDLBrandsPerArea">
                            BRAND:</label>
                        <asp:DropDownList ID="DDLBrandsPerArea" CssClass="modalText" Height="22px" runat="server"
                            AutoPostBack="True" OnSelectedIndexChanged="DDLBrandsPerArea_SelectedIndexChanged">
                        </asp:DropDownList>
                    </div>
                    <div style="margin: 5px 10px;">
                        TEMPLATE:
                        <asp:RadioButtonList ID="rdioTemplates" runat="server" RepeatDirection="Horizontal"
                            RepeatLayout="Flow" AutoPostBack="True" OnSelectedIndexChanged="rdioTemplates_SelectedIndexChanged">
                            <asp:ListItem Selected="True">ALL</asp:ListItem>
                            <asp:ListItem>SUM</asp:ListItem>
                        </asp:RadioButtonList>
                    </div>
                     <div style="margin: 5px 10px;">
                        <label for="MainContent_rdioTransitStatusPerArea">
                            DR STATUS:</label>
                        <asp:RadioButtonList ID="rdioTransitStatusPerArea" runat="server" 
                            RepeatDirection="Horizontal" AutoPostBack="True" 
                             onselectedindexchanged="rdioTransitStatusPerArea_SelectedIndexChanged" >
                            <asp:ListItem Selected="True">ALL</asp:ListItem>
                            <asp:ListItem Value="In Transit">IN TRANSIT</asp:ListItem>
                            <asp:ListItem Value="Confirmed">CONFIRMED</asp:ListItem>
                        </asp:RadioButtonList>
                    </div>
                    <div style="height: 25px; text-align: center;">
                        <asp:HyperLink ID="hpLinkPrintPerArea" Height="22px" Target="_blank" CssClass="btnPrint print-link"
                            runat="server">GENERATE REPORT</asp:HyperLink>
                    </div>
                </div>
               
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>
