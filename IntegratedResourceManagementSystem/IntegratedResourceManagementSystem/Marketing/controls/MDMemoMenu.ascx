<%--Author: Dennis Pitallano--%>
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="MDMemoMenu.ascx.cs"
    Inherits="IntegratedResourceManagementSystem.Marketing.controls.MDMemoMenu" %>
    <%@ OutputCache Duration="86400" VaryByParam="*" Shared="true"  %>
<div class="title-menu">
<img src="../Resources/accounting.png" alt="PITA" height="22px"  align="middle" />
<label >TRANSACTIONS</label>
</div>
<div class="menu-wrapper">
    <div class="mnuIcon" title="Manage Outright Markdown Memo">
        <a class="lblMenu" href="../Marketing/MarkDownMemoIndex.aspx">
            <img src="../Resources/adjustment.png" height="28px" title="Markdown Memo Index" />
        </a>
        <br />
        <a title="Manage Outright MarkDown Memo" class="lblMenu" style="font-family: Verdana;
            font-size: 8px; color: #666666; font-weight: bold;" href="../Marketing/MarkDownMemoIndex.aspx">
            MARKDOWN MEMO - INDEX</a>
    </div>
    <div class="mnuIcon" title="Manage Outright MarkDown Memo">
        <div>
            <a class="lblMenu" href="../Marketing/GeneralMemoOutright.aspx">
                <img src="../Resources/adjustment.png" height="36px" title="Manage Outright MarkDown Memo" />
            </a>
        </div>
        <a title="Manage Outright MarkDown Memo" class="lblMenu" style="font-size: 8px; color: #666666;
            font-weight: bold;" href="../Marketing/GeneralMemoOutright.aspx">GENERAL MEMO-
            OUTRIGHT</a>
    </div>

</div>
<div class="menu-wrapper">
    <div class="mnuIcon">
        <div>
            <a class="lblMenu" href="../Marketing/GeneralMemoConcession.aspx">
                <img src="../Resources/adjustment.png" height="36px" title="Manage Outright MarkDown Memo" />
            </a>
        </div>
        <a title="Manage Outright MarkDown Memo" class="lblMenu" style="font-family: Verdana;
            font-size: 8px; color: #666666; font-weight: bold;" href="../Marketing/GeneralMemoConcession.aspx">
            GENERAL MEMO- CONCESSION</a>
    </div>
    <div class="mnuIcon" title="MarkDown Reports">
        <div>
            <a class="lblMenu" href="../Marketing/MarkdownMemoReport.aspx">
                <img src="../Resources/adjustment.png" height="36px" title="Manage Outright MarkDown Memo" />
            </a>
        </div>
        <a title="Manage Outright MarkDown Memo" class="lblMenu" style="font-size:10px; color: #666666;
            font-weight: bold;" href="../Marketing/MarkdownMemoReport.aspx">REPORTS</a>
    </div>
</div>
