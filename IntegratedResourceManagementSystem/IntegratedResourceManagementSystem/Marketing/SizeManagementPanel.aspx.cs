using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Linq;
using IRMS.BusinessLogic.Manager;
using IRMS.ObjectModel;
using IntegratedResourceManagementSystem.Common;
using IRMS.Components;
using System.Text;

namespace IntegratedResourceManagementSystem.Marketing
{
    public partial class SizeManagementPanel : System.Web.UI.Page
    {
        #region variables
       
        SizeManager SM = new SizeManager();
        Size _SIZE
        {
            get
            {
                Image imgSize = (Image)gvSizesList.SelectedRow.FindControl("imgSize");
                IList<string> numbers = imgSize.AlternateText.Split('-');
                return new Size
                {
                     RecordNo = long.Parse(numbers[0]),
                     SizeCode = gvSizesList.SelectedRow.Cells [3].Text,
                     SizeDescription = gvSizesList.SelectedRow.Cells[4].Text,
                     DisplayIndex =int.Parse(numbers[1]),
                     SizeGroup = long.Parse(numbers[2])
                };
            }
        }
        SizeGroupManager SGM = new SizeGroupManager();

        #region Page_init
        protected void Page_Init(object sender, EventArgs e)
        {
            #region check roles
            Permission.PERMITTED_USER = (UsersClass)Session["USER_ACCOUNT"];
            if (!Permission.IsAdmin())
            {
                Redirector.Redirect("~/Marketing/Stylepanel.aspx");
            }

            Permission.ROLES = (List<UserRole>)Session["USER_ROLES"];
            StringBuilder strPermissionNotification = new StringBuilder();
            strPermissionNotification.Append("Your Account do not have: <br />");
            if (Permission.CanInsert() == false)
            {
                this.btnNewSize.Enabled = false;
                pnlNotification.Visible = true;
                strPermissionNotification.Append(" - Permission to Insert/Add Size.<br />");
            }

            if (Permission.CanUpdate() == false)
            {
                this.btnUpdateSize.Enabled = false;
                pnlNotification.Visible = true;
                strPermissionNotification.AppendLine(" - Permission to Update/Edit Size.<br />");
            }

            if (Permission.CanDelete() == false)
            {
                btnDelete.Enabled = false;
                pnlNotification.Visible = true;
                strPermissionNotification.AppendLine(" - Permission to Delete Size.<br />");
            }
            lblPermissionNotifications.Text = strPermissionNotification.ToString();
            #endregion
        }
        #endregion

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                btnSizesDisplayIndexManagement.Text = "MANAGE SIZES \nDISPLAY INDEX";
            }
        }
        #endregion



        private void LoadSizes(string search_parameter="")
        {
            if (string.IsNullOrEmpty(search_parameter))
            {
                this.gvSizesList.DataBind();
                return;
            }
            SM.LoadSizes(SqlDataSourceSizes, search_parameter);
        }

        protected void btnSaveSize_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(fSize.SizeCode)|| string.IsNullOrEmpty(fSize.SizeDescription))
            {
                return;
            }
            long SizeGroup = long.Parse(dlSizeGroups.SelectedValue);
            fSize.SizeGroup = SizeGroup;
            if (chkInsertBefore.Checked == true)
            {
                int SelectedSizeDisplayIndex = SM.GetSizeDisplayIndex(int.Parse(dlSizesByGroup.SelectedValue));
                SM.UpdateSizesDisplayIndex(SizeGroup, SelectedSizeDisplayIndex);
                fSize.SizeDisplayIndex = SelectedSizeDisplayIndex;
                SM.Save(fSize.Size);
            }
            else
            {
                if (rdioLastBeginning.SelectedIndex == 0)
                {
                    fSize.SizeDisplayIndex = SM.SetSizeDisplayIndex(SizeGroup);
                    SM.Save(fSize.Size);
                }
                else
                {
                    SM.Save(fSize.Size);
                    SM.UpdateSizesDisplayIndex(SizeGroup);
                }
            }
           
            fSize.SizeCode = null;
            fSize.SizeDescription = null;
            LoadSizes();
        }

        protected void btnSaveUpdate_Click(object sender, EventArgs e)
        {
            if (fSize_update.SizeGroup != long.Parse(dlSizeGroupUpdate.SelectedValue))
            {
                fSize_update.SizeDisplayIndex = SM.SetSizeDisplayIndex(long.Parse(dlSizeGroupUpdate.SelectedValue));
            }
            fSize_update.SizeGroup = long.Parse(dlSizeGroupUpdate.SelectedValue);
            SM.Save(fSize_update.Size);
            LoadSizes();
        }

        protected void gvSizesList_SelectedIndexChanged(object sender, EventArgs e)
        {
            fSize_update.SizeCode = _SIZE.SizeCode;
            fSize_update.SizeDescription = _SIZE.SizeDescription;
            fSize_update.SizeId = _SIZE.RecordNo;
            fSize_update.SizeDisplayIndex = _SIZE.DisplayIndex;
            fSize_update.SizeGroup = _SIZE.SizeGroup;
            dlSizeGroupUpdate.SelectedValue = _SIZE.SizeGroup.ToString();

            updateErrorMessage.Visible = false;
            lblSizeToDelete.Text = "Delete size: " + _SIZE.SizeDescription + "?";
        }

        protected void btnYes_Click(object sender, EventArgs e)
        {
            SM.Delete(fSize_update.Size);
            SM.UpdateSizesDisplayIndex(fSize_update.SizeGroup, fSize_update.SizeDisplayIndex, true);
            LoadSizes();
        }

        protected void imgBtnSearch_Click(object sender, ImageClickEventArgs e)
        {
            search();
        }

        private void search()
        {
            LoadSizes(txtSearch.Text);
        }

        protected void txtSearch_TextChanged(object sender, EventArgs e)
        {
            search();
        }

        protected void btnSaveSizeGroup_Click(object sender, EventArgs e)
        {
            SGM.Save(fSizeGroup.SizeGroup);
            UpdateModalData();
        }

        private void UpdateModalData()
        {
            fSize.DataBind();
            SqlDataSourceSizeGroup.DataBind();
            dlSizeGroups.DataBind();
            dlSizeGroupUpdate.DataBind();
            btnNewSize_ModalPopupExtender.Show();
        }
     
        protected void btnYesDeleteGroupSize_Click(object sender, EventArgs e)
        {
           SGM.Delete(int.Parse(dlSizeGroups.SelectedValue));
            fSize.DataBind();
            dlSizeGroups.DataBind();
            dlSizeGroupUpdate.DataBind();
            gvSizesList.DataBind();
            btnNewSize_ModalPopupExtender.Show();
        }

        protected void dlSizeGroups_SelectedIndexChanged(object sender, EventArgs e)
        {
            btnNewSize_ModalPopupExtender.Show();
        }

        protected void dlSizeGroupUpdate_SelectedIndexChanged(object sender, EventArgs e)
        {
            btnUpdateSize_ModalPopupExtender.Show();
        }

        protected void chkInsertBefore_CheckedChanged(object sender, EventArgs e)
        {
            if (chkInsertBefore.Checked == true)
            {
                dlSizesByGroup.Enabled = true;
                rdioLastBeginning.SelectedIndex = -1;
            }
            else
            {
                dlSizesByGroup.Enabled = false;
                rdioLastBeginning.SelectedIndex = 0;
            }
            btnNewSize_ModalPopupExtender.Show();
        }

        protected void rdioLastBeginning_SelectedIndexChanged(object sender, EventArgs e)
        {
            chkInsertBefore.Checked = false;
            dlSizesByGroup.Enabled = false;
            btnNewSize_ModalPopupExtender.Show();
        }
    }
}