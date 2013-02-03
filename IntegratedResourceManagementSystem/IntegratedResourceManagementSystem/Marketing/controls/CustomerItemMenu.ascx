<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CustomerItemMenu.ascx.cs"
    Inherits="IntegratedResourceManagementSystem.Marketing.controls.CustomerItemMenu" %>
<%@ OutputCache Duration="86400" VaryByParam="*" Shared="true"  %>
<style type="text/css">
    .mnuIcon
    {
        width: 85px;
        height: 75px;
        background-image: url('../Resources/submenu.png');
        background-repeat: no-repeat;
        padding-top: 3px;
        text-align: center;
    }
    .mnuIcon:hover
    {
        background-image: url('../Resources/submenuh.png');
        background-repeat: no-repeat;
        padding-left: 2px;
        color: Gray;
    }
    .lblMenu
    {
        text-decoration: none;
        cursor: pointer;
        text-align: center;
        font-size: 10px;
        font-family: Verdana;
        font-weight: bold;
    }
    .lblMenu:hover
    {
        color: #376F00;
        border-bottom: 1px;
        border-bottom-style: dashed;
    }
</style>
<div style="float: left; width: 100px; margin-right: 5px;">
    <div class="mnuIcon">
        <a class="lblMenu" href="../Marketing/AccountManagementPanel.aspx">
            <img src="../Resources/account-icon.png" height="32px" title="Manage Account" />
        </a>
        <br />
        <a title="Manage Account" style="color: #666666;" class="lblMenu" href="../Marketing/AccountManagementPanel.aspx">
            ACCOUNT PANEL </a>
    </div>
</div>
<div style="float: left; width: 100px; margin-right: 5px;">
    <div class="mnuIcon">
       <a class="lblMenu" href="../Marketing/BranchManagementPanel.aspx">
            <img src="../Resources/Branch-icon.png" height="32px" title="Manage Branch" />
        </a>
        <br />
        <a title="Manage Branch" style="color: #666666;" class="lblMenu" href="../Marketing/BranchManagementPanel.aspx">
            BRANCH PANEL </a>
    </div>
</div>
<div style="float: left; width: 100px; margin-right: 5px;">
    <div class="mnuIcon">
    <a class="lblMenu" href="../Marketing/CustomListing.aspx">
            <img src="../Resources/Branch-icon.png" height="32px" title="Manage Outlet" />
        </a>
        <br />
        <a title="Manage Outlet" style="color: #666666;" class="lblMenu" href="../Marketing/CustomListing.aspx">
            MANAGE OUTLET </a>
    </div>
</div>
