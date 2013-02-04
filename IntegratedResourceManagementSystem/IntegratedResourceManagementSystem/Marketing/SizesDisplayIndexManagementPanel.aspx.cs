using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using IRMS.BusinessLogic.Manager;

namespace IntegratedResourceManagementSystem.Marketing
{
    public partial class SizesDisplayIndexManagementPanel : System.Web.UI.Page
    {
        SizeManager SM = new SizeManager();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void imgBtnUp_Click(object sender, ImageClickEventArgs e)
        {
            SwapSizeDisplayIndex("UP");
            gvSizes.DataBind();
        }

        private void SwapSizeDisplayIndex(string SwapMode)
        {
            long size_group = (long.Parse(dlSizeGroups.SelectedValue));
            int selected_size_display_index = (int.Parse(gvSizes.SelectedRow.Cells[5].Text));
            int display_index=0;
            if (SwapMode == "UP")
            {
                display_index = selected_size_display_index - 1;
            }
            else
            {
                display_index = selected_size_display_index + 1;
            }
            var sizeToSwap = SM.GetSizeByDisplayIndex(size_group, display_index);
            var selected_size = SM.GetSizeByDisplayIndex(size_group, selected_size_display_index);

            selected_size.DisplayIndex = sizeToSwap.DisplayIndex;
            sizeToSwap.DisplayIndex = selected_size_display_index;

            SM.Save(selected_size);
            SM.Save(sizeToSwap);
        }

        protected void imgBtnDown_Click(object sender, ImageClickEventArgs e)
        {
            SwapSizeDisplayIndex("DOWN");
            gvSizes.DataBind();
        }

        protected void btnYes_Click(object sender, EventArgs e)
        {
            Image imgSize = (Image)gvSizes.SelectedRow.FindControl("imgSize");
            var size = SM.GetSizeByKey(long.Parse(imgSize.AlternateText));
            int DeletedSizeDisplayIndex = SM.GetSizeDisplayIndex(long.Parse(imgSize.AlternateText));
            long DeletedSizeGroup = SM.GetSizeByKey(long.Parse(imgSize.AlternateText)).SizeGroup;
            SM.Delete(size);
            SM.UpdateSizesDisplayIndex(DeletedSizeGroup, DeletedSizeDisplayIndex, true);
            gvSizes.DataBind ();
        }
    }
}