using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using IRMS.BusinessLogic.Manager;
using IRMS.ObjectModel;
using IRMS.Entities;

namespace IntegratedResourceManagementSystem.Marketing
{
    public partial class NewGenericStyle : System.Web.UI.Page
    {
        #region variables
        BrandManager BM = new BrandManager();
        GarmentManager GM = new GarmentManager();
        FabricManager FM = new FabricManager();
        StyleManager StyleManager = new StyleManager();
        ProductManager PM = new ProductManager();
        string START_CODE = "0000000000";
        BrandGarmentsManager BGM = new BrandGarmentsManager();
        FittingManager FittingManager = new FittingManager();
        SubFittingManager SubFittingManager = new SubFittingManager();
        #endregion

        /// <summary>
        /// Load All Fabric in Dropdown List.
        /// </summary>
        private void LoadAllFabric(char TopOrBottom)
        {
            dlFabricsForStyleNumber.Items.Clear();
            dlFabricsForStyleNumber.Items.Add(new ListItem("Select Fabric", ""));
            var results = (from fabric in this.FM.Fabrics()
                           where fabric.TopOrBottom == TopOrBottom
                           select fabric).ToList();
            foreach (Fabric fabric in results)
            {
                dlFabricsForStyleNumber.Items.Add(new ListItem(fabric.FabricDescription, fabric.FabricCode));
            }
        }

        /// <summary>
        /// Load All Brands in DropDown List.
        /// </summary>
        public void LoadAllBrands()
        {
            dlBrandsForStyleNumber.Items.Clear();
            dlBrandsForStyleNumber.Items.Add(new ListItem("Select Brand", ""));
            foreach (Brand brand in BM.Brands())
            {
                dlBrandsForStyleNumber.Items.Add(new ListItem(brand.BrandDescription, brand.BrandCode));
            }
        }

        /// <summary>
        /// Load All Garments in DropDownList.
        /// </summary>
        private void LoadAllGarments(char TopOrBottom)
        {
            dlGarmentForStyleNumber.Items.Clear();
            dlGarmentForStyleNumber.Items.Add(new ListItem("Select Garment", ""));
            var results = (from garment in GM.Garments()
                           join brand_garment in BGM.BrandGarments() on garment.GarmentCode equals brand_garment.GarmentCode
                           where garment.TopOrBottom == TopOrBottom && brand_garment.BrandCode == dlBrandsForStyleNumber.SelectedValue
                           select garment).ToList();

            foreach (Garment garment_ in results)
            {
                dlGarmentForStyleNumber.Items.Add(new ListItem(garment_.GarmentDescription, garment_.GarmentCode));
            }
        }


        private void LoadFittingsByCategory(string Category, string BrandName)
        {
            DDLFittings.Items.Clear();
            var fittings = (from fitting_ in FittingManager.Fittings()
                            where fitting_.Category == Category && fitting_.BrandName == BrandName
                            select fitting_).ToList();
            foreach (Fitting fitting in fittings)
            {
                DDLFittings.Items.Add(new ListItem(fitting.FittingName, fitting.FiitingCode));
            }
        }

        private void LoadSubFittingByFittingCode(string FittingCode)
        {
            DDLSubFitting.Items.Clear();
            var sub_fittings = (from sub_fitting_ in SubFittingManager.SubFittings()
                                where sub_fitting_.FittingCode == FittingCode
                                select sub_fitting_).ToList();
            foreach (SubFitting sub_fitting in sub_fittings)
            {
                DDLSubFitting.Items.Add(new ListItem(sub_fitting.SubFittingDesc, sub_fitting.SubFittingDesc));
            }
        }

        protected void Page_Init(object sender, EventArgs e)
        {
            LoadAllBrands();
        }
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void dlBrandsForStyleNumber_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                PreviewOutput();
                LoadFabricsAndGarments();
            }
            catch (Exception)
            {
                //throw;
            }
        }

        private void LoadFabricsAndGarments()
        {
            LoadAllFabric(char.Parse(rdioTopOrBottom.SelectedValue));
            LoadAllGarments(char.Parse(rdioTopOrBottom.SelectedValue));
            LoadFittingsByCategory(rdioTopOrBottom.SelectedValue, dlBrandsForStyleNumber.SelectedItem.Text);
            LoadSubFittingByFittingCode(DDLFittings.SelectedValue);
        }

        private string CheckStyleSeriesNumber()
        {
            string StyleSeries = "";
            try
            {
                var styles = (from style in StyleManager.Styles()
                              where style.IsGeneric == true && style.Brand == dlBrandsForStyleNumber.SelectedValue
                              orderby style.RecordNo descending
                              select style).ToList();
             
                ItemStyle style_ = styles.FirstOrDefault();
                if (style_.RecordNo > 0)
                {
                    StyleSeries = style_.StyleNumber.Remove(0, style_.StyleNumber.Length - 3);
                }
                else
                {
                    StyleSeries = "000";
                }
            }
            catch (Exception)
            {
                StyleSeries = "000";
                //   throw;
            }
            return StyleSeries;
        }

        protected void rdioTopOrBottom_SelectedIndexChanged(object sender, EventArgs e)
        {
            LoadFabricsAndGarments();
            
        }

        protected void dlFabricsForStyleNumber_SelectedIndexChanged(object sender, EventArgs e)
        {
            PreviewOutput();
        }

        private void PreviewOutput()
        {
            txtStyleNumber.Text = dlBrandsForStyleNumber.SelectedValue +
                                 dlFabricsForStyleNumber.SelectedValue + dlGarmentForStyleNumber.SelectedValue + "-" +
                                 (long.Parse(CheckStyleSeriesNumber()) + 1).ToString("000");
            string Description = string.Concat(dlBrandsForStyleNumber.SelectedItem.Text, "-", dlGarmentForStyleNumber.SelectedItem.Text);
            txtStyleDescription.Text = Description;
            hfStyleNumber.Value = txtStyleNumber.Text.Replace("-", "");
        }

        protected void dlGarmentForStyleNumber_SelectedIndexChanged(object sender, EventArgs e)
        {
            PreviewOutput();
        }

        protected void btnSaveStyle_Click(object sender, EventArgs e)
        {
            decimal SRP = 0;
            decimal CostPrice = 0;
            if (string.IsNullOrEmpty(txtSRP.Text))
            {
                SRP = 0;
            }
            else
            {
                SRP = decimal.Parse(txtSRP.Text);
            }

            if (string.IsNullOrEmpty(txtCostPrice.Text))
            {
                CostPrice = 0;
            }
            else
            {
                CostPrice = decimal.Parse(txtCostPrice.Text);
            }
            ItemStyle NewGenericStyle = new ItemStyle
            {
               AP_type = rdioTopOrBottom.SelectedValue,
                Brand = dlBrandsForStyleNumber.SelectedValue,
                Description = txtStyleDescription.Text ,
                Fitting =DDLFittings.SelectedItem.Text,
                RecordNo =0,
                StyleNumber = txtStyleNumber.Text,
                SubFitting =DDLSubFitting.SelectedValue,
                IsApprove = "Yes" ,
                IsGeneric = true,
                IsActive = true ,
                Fabric = dlFabricsForStyleNumber.SelectedItem.Text,
                SRP = SRP,
                CostPrice = CostPrice
            };

            StyleManager.Save(NewGenericStyle);

            Response.Redirect("~/Marketing/GenericStylesManagementPanel.aspx");
        }

      
    }
}