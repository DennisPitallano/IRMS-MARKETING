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
    public partial class GarmentManagementPanel : System.Web.UI.Page
    {
        #region variables
        GarmentManager GM = new GarmentManager();
        Garment garment = new Garment();
        BrandManager BM = new BrandManager();
        BrandGarmentsManager BrandGarmentMan = new BrandGarmentsManager();
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
                this.btnNewGarment.Enabled = false;
                pnlNotification.Visible = true;
                strPermissionNotification.Append(" - Permission to Insert/Add Garment.<br />");
            }

            if (Permission.CanUpdate() == false)
            {
                this.btnUpdateGarment.Enabled = false;
                pnlNotification.Visible = true;
                strPermissionNotification.AppendLine(" - Permission to Update/Edit Garment.<br />");
            }

            if (Permission.CanDelete() == false)
            {
                btnDelete.Enabled = false;
                pnlNotification.Visible = true;
                strPermissionNotification.AppendLine(" - Permission to Delete Garment.<br />");
            }
            lblPermissionNotifications.Text = strPermissionNotification.ToString();
            #endregion
        }
        #endregion

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                LoadAllBrands();
            }
        }

        private void LoadAllBrands()
        {
            chkBoxBrands.DataSource = BM.Brands();
            chkBoxBrands.DataTextField = "BrandDescription";
            chkBoxBrands.DataValueField = "BrandCode";
            chkBoxBrands.DataBind();
            chkBrandsUpdate.DataSource = BM.Brands();
            chkBrandsUpdate.DataTextField = "BrandDescription";
            chkBrandsUpdate.DataValueField = "BrandCode";
            chkBrandsUpdate.DataBind();
        }

        private void LoadAllGarments(string search_paramenter= "")
        {
            if (string.IsNullOrEmpty(search_paramenter))
            {
                gvGarmentList.DataBind();
                return;
            }
            GM.LoadGarments(SqlDataSourceGarments, search_paramenter);
        }

        protected void btnSaveGarment_Click(object sender, EventArgs e)
        {
            var garment = new Garment{
                GarmentCode = fGarment.Garment.GarmentCode.ToUpper(),
                GarmentDescription = fGarment.Garment.GarmentDescription.ToUpper(),
                TopOrBottom = fGarment.Garment.TopOrBottom,
                IsActive = fGarment.Garment.IsActive,
                DateCreated = fGarment.Garment.DateCreated
            };
            GM.Save(garment);
            SaveBrandGarments();
            fGarment.GarmentCode = null;
            fGarment.GarmentDescription = null;
            fGarment.TopOrBottom = null;
            LoadAllGarments();
        }

        protected void btnSaveUpdate_Click(object sender, EventArgs e)
        {
            garment = GM.GetGarmentByKey(long.Parse(gvGarmentList.SelectedRow.Cells[2].Text));
            garment.GarmentCode = fGarment_update.GarmentCode.ToUpper();
            garment.GarmentDescription = fGarment_update.GarmentDescription.ToUpper();
            garment.TopOrBottom = char.Parse(fGarment_update.TopOrBottom);
            GM.Save(garment);
            UpdateBrandGarments();
            LoadAllGarments();
        }

        protected void gvGarmentList_SelectedIndexChanged(object sender, EventArgs e)
        {
            chkBrandsUpdate.Items.Clear();
            LoadAllBrands();
            garment = GM.GetGarmentByKey(long.Parse(gvGarmentList.SelectedRow.Cells[2].Text));
            fGarment_update.GarmentCode = garment.GarmentCode;
            fGarment_update.GarmentDescription = garment.GarmentDescription;
            if (garment.TopOrBottom == 'T')
            {
                fGarment_update.TopOrBottom = "T";
            }
            else
            {
                fGarment_update.TopOrBottom = "B";
            }

            var brand_garments = from bg in BrandGarmentMan.BrandGarments()
                                 where bg.GarmentCode == fGarment_update.GarmentCode
                                 select bg;
                foreach (BrandGarment bg in brand_garments)
                {
                    for (int i = 0; i < this.chkBrandsUpdate.Items.Count; i++)
                    {
                        if (chkBrandsUpdate.Items[i].Value == bg.BrandCode)
                        {
                            chkBrandsUpdate.Items[i].Selected = true;
                        }
                    }
                }
                updateErrorMessage.Visible = false;
                lblGarmentToDelete.Text ="Delete garment " + garment.GarmentDescription +"?";
        }

        private void Search()
        {
            LoadAllGarments(txtSearch.Text);
        }

        protected void btnYes_Click(object sender, EventArgs e)
        {
            garment = GM.GetGarmentByKey(long.Parse(gvGarmentList.SelectedRow.Cells[2].Text));
            GM.Delete(garment);
            LoadAllGarments();
        }

        protected void txtSearch_TextChanged(object sender, EventArgs e)
        {
            Search();
        }

        private void SaveBrandGarments()
        {
            List<BrandGarment> BrandGarments = new List<BrandGarment>();
            for (int i = 0; i < chkBoxBrands.Items.Count; i++)
            {
                if (chkBoxBrands.Items[i].Selected)
                {
                    BrandGarment brand_garment = new BrandGarment();
                    brand_garment.BrandCode = chkBoxBrands.Items[i].Value;
                    brand_garment.GarmentCode = fGarment.Garment.GarmentCode.ToUpper();
                    brand_garment.DateRecorded = DateTime.Now;
                    BrandGarments.Add(brand_garment);
                }
            }
            BrandGarmentMan.Save(BrandGarments);
        }

        private void UpdateBrandGarments()
        {
            var brand_garments = from bg in BrandGarmentMan.BrandGarments()
                                 where bg.GarmentCode == fGarment_update.GarmentCode
                                 select bg;
            BrandGarmentMan.Delete(brand_garments.ToList<BrandGarment>());
            List<BrandGarment> BrandGarments = new List<BrandGarment>();
            for (int i = 0; i < chkBrandsUpdate.Items.Count; i++)
            {
                if (chkBrandsUpdate.Items[i].Selected)
                {
                    BrandGarment brand_garment = new BrandGarment();
                    brand_garment.BrandCode = chkBrandsUpdate.Items[i].Value;
                    brand_garment.GarmentCode = fGarment_update.Garment.GarmentCode.ToUpper();
                    brand_garment.DateRecorded = DateTime.Now;
                    BrandGarments.Add(brand_garment);
                }
            }
            BrandGarmentMan.Save(BrandGarments);
        }
    }
}