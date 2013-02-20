using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;

namespace IntegratedResourceManagementSystem.Shared
{
    public static class ProgressLoader
    {
        public static List<UpdateProgress> UPROGRESS_LIST = new List<UpdateProgress>();
        public static void SetProgressLoader( UpdateProgress upProgess)
        {
            upProgess.Visible = true;
            foreach (var item in UPROGRESS_LIST)
            {
                item.Visible = false;
            }
        }
        //public static void SetProgressLoader(UpdateProgress upProgess,List<UpdateProgress> upProgressList)
        //{
        //    upProgess.Visible = true;
        //}
    }
}