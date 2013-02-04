using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;

namespace IRMS.Components
{
    public static class Redirector
    {
        public static void GotoHomePage()
        {
            Redirect("~/Default.aspx");
        }

        public static void GotoDashBoard(string DashBoardPageName)
        {
            Redirect("~/" + DashBoardPageName + ".aspx");
        }

        public static void GotoErrorPage()
        {
            Redirect("~/Error.aspx");
        }

        public static void Redirect(string path)
        {
            HttpContext.Current.Response.Redirect(path);
        }
    }
}
