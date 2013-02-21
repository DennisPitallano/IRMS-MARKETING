<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="FFitting.ascx.cs" Inherits="IntegratedResourceManagementSystem.Marketing.forms.FFitting" %>
  <style type ="text/css">
    .frmbg
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
        
    }
</style>

    <table  style="width: 100%;">
      <tr>
        <td class ="input-form-label form-label">
          FITTING NAME:
        </td>
        <td>
          <asp:TextBox ID="txtFitting" Width="200px" runat="server" Height="20px"  
                CssClass="modalText" EnableViewState="False"></asp:TextBox>
            <asp:HiddenField ID="hfFiitingCode" runat="server" />
              <asp:HiddenField ID="hfID" runat="server" Value="0" />
        </td>
        <td>
          &nbsp;
        </td>
      </tr>
      <tr>
        <td class ="input-form-label form-label">
        BRAND:
        </td>
        <td>
            <asp:DropDownList ID="DDLBrands" CssClass="modalText" Height="22px" runat="server">
            </asp:DropDownList>
        </td>
        <td>
        </td>
      </tr>
      <tr>
        <td class ="input-form-label form-label">
            CODE:
        </td>
        <td>
        <asp:TextBox ID="txtCode" runat="server" Height="20px"  
                CssClass="modalText" EnableViewState="False"></asp:TextBox>
        </td>
        <td>
        </td>
      </tr>
      <tr>
        <td class ="input-form-label form-label">
            APPAREL TYPE:
        </td>
        <td>
            <asp:RadioButtonList ID="rdioCategory" CssClass="modalText" runat="server" 
                RepeatDirection="Horizontal" Font-Bold="True" Font-Names="Verdana" 
                Font-Size="11px">
                <asp:ListItem Value="T">TOP</asp:ListItem>
                <asp:ListItem Value="B">BOTTOM</asp:ListItem>
            </asp:RadioButtonList>
          </td>
        <td>
          &nbsp;
        </td>
      </tr>
     
        </table>
