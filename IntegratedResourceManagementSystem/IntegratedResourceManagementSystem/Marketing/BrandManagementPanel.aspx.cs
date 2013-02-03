using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using IRMS.BusinessLogic.Manager;
using IRMS.ObjectModel;
using IntegratedResourceManagementSystem.Common;
using IRMS.Components;
using System.Text;
namespace IntegratedResourceManagementSystem.Marketing
{
    /// <summary>
    /// Author: Dennis Pitallano
    /// Last Updated: July 22,2012 5:42 PM
    /// </summary>
    public partial class BrandManagementPanel : System.Web.UI.Page
    {
        #region Variables
        BrandManager BM = new BrandManager();
        /// <summary>
        /// Set Brand for Update
        /// </summary>
        private Brand Brand
        {
            get
            {
                return new Brand
                {
                    RecordNo = long.Parse(gvBrandList.SelectedRow.Cells[2].Text),
                    BrandCode = gvBrandList.SelectedRow.Cells[3].Text,
                    BrandDescription = gvBrandList.SelectedRow.Cells[4].Text,
                    StartSeries = gvBrandList.SelectedRow.Cells[5].Text
                };
            }
        }

        #endregion
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
                this.btnNewBrand.Enabled = false;
                pnlNotification.Visible = true;
                strPermissionNotification.Append(" - Permission to Insert/Add Brand.<br />");
            }

            if (Permission.CanUpdate() == false)
            {
                this.btnUpdateBrand.Enabled = false;
                pnlNotification.Visible = true;
                strPermissionNotification.AppendLine(" - Permission to Update/Edit Brand.<br />");
            }

            if (Permission.CanDelete() == false)
            {
                btnDelete.Enabled = false;
                pnlNotification.Visible = true;
                strPermissionNotification.AppendLine(" - Permission to Delete Brand.<br />");
            }
            lblPermissionNotifications.Text = strPermissionNotification.ToString();
            #endregion
        }
        #endregion


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
            }
        }

        /// <summary>
        /// Load or Search Brands
        /// </summary>
        /// <param name="search_parameter">search parameter</param>
        private void LoadAllBrands(string search_parameter="")
        {
            if (string.IsNullOrEmpty(search_parameter))
            {
                gvBrandList.DataBind();
                return;
            }
            BM.LoadBrands(SqlDataSourceBrands,search_parameter);
        }

        /// <summary>
        /// Seach Brands
        /// </summary>
        private void Search()
        {
            LoadAllBrands(txtSearch.Text);
        }

        protected void gvGarmentList_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                fbrand_update.BrandId = Brand.RecordNo;
                fbrand_update.BrandCode = Brand.BrandCode;
                fbrand_update.BrandDescription = Brand.BrandDescription;
                fbrand_update.StartSeries = Brand.StartSeries;
                UpdateModalState();
            }
            catch (Exception)
            {
                //throw;
            }
        }

        /// <summary>
        /// Update Controls Attributes Property on Modal Form
        /// </summary>
        private void UpdateModalState()
        {
            updateErrorMessage.Visible = false;
            lblBrandToDelete.Text = "Delete brand " + Brand.BrandDescription + "?";
            btnSaveUpdate.Enabled = true;
            btnYes.Enabled = true;
        }



        protected void btnSaveBrand_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(fbrand.BrandCode) ||
                string.IsNullOrEmpty(fbrand.BrandDescription) || 
                string.IsNullOrEmpty(fbrand.StartSeries))
            {
                return;
            }
            BM.Save(fbrand.Brand);
            #region log
            BM.SaveTransactionLog(Permission.PERMITTED_USER, TransactionType.INSERT);
            #endregion
            LoadAllBrands();
        }

        protected void btnSaveUpdate_Click(object sender, EventArgs e)
        {
            BM.Save(fbrand_update.Brand);
            LoadAllBrands();
            fbrand_update.BrandCode = null;
            fbrand_update.BrandDescription = null;
            fbrand_update.StartSeries = null;
            #region log
            BM.Identity = (int)fbrand_update.BrandId;
            BM.SaveTransactionLog(Permission.PERMITTED_USER, TransactionType.UPDATE);
            #endregion
        }

        protected void btnYes_Click(object sender, EventArgs e)
        {
            BM.Delete(fbrand_update.Brand);
            #region log
            BM.Identity = (int)fbrand_update.BrandId;
            BM.SaveTransactionLog(Permission.PERMITTED_USER, TransactionType.DELETE);
            #endregion
            LoadAllBrands();
        }

        protected void txtSearch_TextChanged(object sender, EventArgs e)
        {
            Search();
        }
    }
}