using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using IRMS.BusinessLogic.Manager;
using IRMS.ObjectModel;
using IntegratedResourceManagementSystem.Common;
using System.Text;
using IRMS.Components;

namespace IntegratedResourceManagementSystem.Marketing
{
    /// <summary>
    /// Author: Dennis Pitallano
    /// Last Updated: July 22, 2012 6:26 PM
    /// </summary>
    public partial class CategoryManagementPanel : System.Web.UI.Page
    {
        #region viriables
        CategoryManager CM = new CategoryManager();
        /// <summary>
        /// Set Category Value to Update
        /// </summary>
        private Category _CATEGORY
        {
            get
            {
                return new Category
                {
                    RecordNo = long.Parse(gvProductCategoryList.SelectedRow.Cells[2].Text ),
                    CategoryCode = gvProductCategoryList.SelectedRow.Cells[3].Text,
                    CategoryDescription= gvProductCategoryList.SelectedRow.Cells[4].Text,
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
                this.btnNewProductCategory.Enabled = false;
                pnlNotification.Visible = true;
                strPermissionNotification.Append(" - Permission to Insert/Add Category.<br />");
            }

            if (Permission.CanUpdate() == false)
            {
                this.btnUpdateProductCategory.Enabled = false;
                pnlNotification.Visible = true;
                strPermissionNotification.AppendLine(" - Permission to Update/Edit Category.<br />");
            }

            if (Permission.CanDelete() == false)
            {
                btnDelete.Enabled = false;
                pnlNotification.Visible = true;
                strPermissionNotification.AppendLine(" - Permission to Delete Category.<br />");
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
        /// Fetch and Search Categories
        /// </summary>
        /// <param name="search_parameter">search parameter</param>
        private void LoadAllCategories(string search_parameter= "")
        {
            if (string.IsNullOrEmpty(search_parameter))
            {
                gvProductCategoryList.DataBind();
                return;
            }
            CM.LoadCategories(SqlDataSourceCategories,search_parameter);
        }

        protected void btnSaveProductCategory_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(fCategory.CategoryCode) || 
                string.IsNullOrEmpty(fCategory.CategoryDesription))
            {
                return;
            }
            CM.Save(fCategory.Category);
            #region log
            CM.SaveTransactionLog(Permission.PERMITTED_USER, TransactionType.INSERT);
            #endregion
            LoadAllCategories();
        }

        protected void btnSaveUpdate_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(fCategory_update.CategoryCode) || 
                string.IsNullOrEmpty(fCategory_update.CategoryDesription))
            {
                return;
            }
            CM.Save(fCategory_update.Category);
            #region log
            CM.Identity =(int)fCategory_update.CategoryId;
            CM.SaveTransactionLog(Permission.PERMITTED_USER, TransactionType.UPDATE);
            #endregion
            LoadAllCategories();
        }

        protected void btnYes_Click(object sender, EventArgs e)
        {
          CM.Delete(fCategory_update.Category);
          #region log
          CM.Identity = (int)fCategory_update.CategoryId;
          CM.SaveTransactionLog(Permission.PERMITTED_USER, TransactionType.DELETE);
          #endregion
          LoadAllCategories();
        }

        protected void gvProductCategoryList_SelectedIndexChanged(object sender, EventArgs e)
        {
            fCategory_update.CategoryCode = _CATEGORY.CategoryCode;
            fCategory_update.CategoryDesription = _CATEGORY.CategoryDescription;
            fCategory_update.CategoryId = _CATEGORY.RecordNo;
            UpdateModalState();
        }


        /// <summary>
        /// Update Modal State
        /// </summary>
        private void UpdateModalState()
        {
            btnYes.Enabled = true;
            btnSaveUpdate.Enabled = true;
            updateErrorMessage.Visible = false;
            lblCategoryToDelete.Text = "Delete category " + _CATEGORY.CategoryDescription + "?";
        }

        protected void txtSearch_TextChanged(object sender, EventArgs e)
        {
            Search();
        }

        /// <summary>
        /// Search categories
        /// </summary>
        private void Search()
        {
         LoadAllCategories(txtSearch.Text);
        }
       
    }
}