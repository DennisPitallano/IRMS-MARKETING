using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using IRMS.BusinessLogic.Manager;
using IRMS.ObjectModel;
using IRMS.Components;
using IRMS.Entities;
using System.Text;
using IntegratedResourceManagementSystem.Common;

namespace IntegratedResourceManagementSystem.Marketing
{
    public partial class NewItemForm : System.Web.UI.Page
    {
        #region variables

        ColorManager CM = new ColorManager();
        SizeManager SM = new SizeManager();
        BrandManager BM = new BrandManager();
        GarmentManager GM = new GarmentManager();
        FabricManager FM = new FabricManager();
        StyleManager StyleManager = new StyleManager();
        List<SKU> list = new List<SKU>();
        ProductManager PM = new ProductManager();
        int SIZE_COUNT = 0;
        int COLOR_COUNT = 0;
        string START_CODE = "0000000000";
        StyleColorsManager StyleColorManager = new StyleColorsManager();
        StyleSizesManager StyleSizeManager = new StyleSizesManager();
        BrandGarmentsManager BGM = new BrandGarmentsManager();
        FittingManager FittingManager = new FittingManager();
        SubFittingManager SubFittingManager = new SubFittingManager();
        GenericStyleManager GenericStyleManger = new GenericStyleManager();

        #endregion

        protected void Page_Init(object sender, EventArgs e)
        {
            Permission.PERMITTED_USER = (UsersClass)Session["USER_ACCOUNT"];
            LoadAllBrands();
            AllColors();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                mvwItemManagement.ActiveViewIndex = 0;
               // pnlGenratedItemCodesAndSKUs.Visible = false;
               
            }
            AddBColorInColorCollections();
        }

        /// <summary>
        /// Load Fitting by category and Brandname 
        /// </summary>
        /// <param name="Category">Category</param>
        /// <param name="BrandName">Brand name</param>
        private void LoadFittingsByCategory(string Category, string BrandName)
        {
            DDLFittings.Items.Clear();
            var fittings = (from fitting_ in FittingManager.Fittings()
                           where fitting_.Category == Category && fitting_.BrandName ==BrandName
                           select fitting_).ToList();
            foreach (Fitting fitting in fittings)
            {
                DDLFittings.Items.Add(new ListItem(fitting.FittingName, fitting.FiitingCode));
            }
        }

        /// <summary>
        /// Load Sub Fiiting By Fiiting Code
        /// </summary>
        /// <param name="FittingCode">Fitting Code</param>
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

        /// <summary>
        /// Get Style Series Number
        /// </summary>
        /// <returns>Series Number</returns>
        private string StyleSeries()
        {
            try
            {
                string style_number = hfStyleNumber.Value.Remove(hfStyleNumber.Value.Length - 3, 3);
                return (style_number);
            }
            catch (Exception)
            {
                return "001";
            }
        }

        /// <summary>
        /// Load All Fabric in Dropdown List.
        /// </summary>
        private void LoadAllFabric(char TopOrBottom )
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

        /// <summary>
        /// Load All Colors in CheckBox List.
        /// </summary>
        public void AllColors()
        {
            ColorchkBxs.DataSource = CM.Colors();
            ColorchkBxs.DataValueField = "ColorCode";
            ColorchkBxs.DataTextField = "ColorDescription";
            ColorchkBxs.DataBind();
            AddBColorInColorCollections();
        }

        /// <summary>
        /// Load All Sizes in CheckBox List.
        /// </summary>
        public void AllSizes(string[] size_group =null)
        {
            SizeschkBxs.DataSource = SM.Sizes();
            SizeschkBxs.DataValueField = "SizeCode";
            SizeschkBxs.DataTextField = "SizeDescription";
            SizeschkBxs.DataBind();
        }

        protected void ColorchkBxs_SelectedIndexChanged(object sender, EventArgs e)
        {
          
            PreviewGenerate();
        }

        protected void SizeschkBxs_SelectedIndexChanged(object sender, EventArgs e)
        {
            PreviewGenerate();
        }

        /// <summary>
        /// Compute Total item to generate.
        /// </summary>
        /// <param name="size">total selected size</param>
        /// <param name="color">total selected color</param>
        /// <returns>Total Item to Generate.</returns>
        private int Compute(int size, int color)
        {
            return size * color;
        }

        /// <summary>
        /// Update BackGround Color on Selected
        /// </summary>
        private void AddBColorInColorCollections()
        {
            for (int i = 0; i < ColorchkBxs.Items.Count; i++)
            {
                ColorchkBxs.Items[i].Attributes.Add("style", "color:" + ColorchkBxs.Items[i].Text + ";");
            }
        }

        private void PreviewGenerate()
        {
            string CodeSeries = "";
            CodeSeries = hfStartSeries.Value;
            string BrandStartSeries = GetBrandStartSeries();
            int count = 0;
            for (int i = 0; i < ColorchkBxs.Items.Count; i++)
            {
                if (ColorchkBxs.Items[i].Selected)
                {
                    if (ColorchkBxs.Items[i].Text == "White")
                    {
                        ColorchkBxs.Items[i].Attributes.Add("style", "Font-weight:bold;background-color:White; color:Black;");
                    }
                    else
                    {
                        ColorchkBxs.Items[i].Attributes.Add("style", "Font-weight:bold;background-color:" + ColorchkBxs.Items[i].Text + "; color:White;");
                    }
                    for (int j = 0; j < SizeschkBxs.Items.Count; j++)
                    {
                        if (SizeschkBxs.Items[j].Selected)
                        {
                            SKU sku = new SKU();
                            count++;
                            string sn = "";
                            sku.ItemCode = txtStyleNumber.Text + "-" + ColorchkBxs.Items[i].Value + "-" + SizeschkBxs.Items[j].Value;
                            if (CodeSeries == START_CODE)
                            {
                                sn = (long.Parse(((BrandStartSeries) + CodeSeries)) +
                                      Compute(SIZE_COUNT, COLOR_COUNT) + count).ToString();
                            }
                            else
                            {
                                sn = (long.Parse((CodeSeries)) +
                                      Compute(SIZE_COUNT, COLOR_COUNT) + count).ToString();
                            }
                            sku.SKUNumber = (long.Parse(sn)).ToString();
                            sku.ItemColor = ColorchkBxs.Items[i].Text;
                            sku.ItemSize = SizeschkBxs.Items[j].Text;
                            sku.ItemBrand = dlBrandsForStyleNumber.SelectedItem.Text;
                            sku.ItemAPTYPE = rdioTopOrBottom.SelectedValue;
                            list.Add(sku);
                        }
                    }
                    COLOR_COUNT = COLOR_COUNT + 1;
                }
            }
            for (int i = 0; i < SizeschkBxs.Items.Count; i++)
            {
                if (SizeschkBxs.Items[i].Selected)
                {
                    SizeschkBxs.Items[i].Attributes.Add("style", "Font-weight:bold;");
                    SIZE_COUNT = SIZE_COUNT + 1;
                }
            }
            rptrSKU.DataSource = list;
            rptrSKU.DataBind();
        }
        //private string CheckStartSeriesNumber()
        //{
        //    string CodeSeries = "";
        //    try
        //    {
        //        var products = (from prod in PM.GetAllOldProducts()
        //                        where prod.BrandName == dlBrandsForStyleNumber.SelectedItem.Text  orderby prod.SKU descending
        //                        select prod).FirstOrDefault();
        //        if (products.ProductNumber > 0)
        //        {
        //            CodeSeries = (long.Parse(products.SKU)).ToString();
        //        }
        //        else
        //        {
        //            CodeSeries = START_CODE;
        //        }
        //    }
        //    catch (Exception)
        //    {
        //        CodeSeries = START_CODE;
        //        // throw;
        //    }
        //    return CodeSeries;
        //}


        private string CheckStyleSeriesNumber()
        {
            string StyleSeries = "";
            try
            {
                var styles = (from style in StyleManager.Styles()
                             where style.Brand == dlBrandsForStyleNumber.SelectedValue && style.IsGeneric == false
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

        protected void dlBrandsForStyleNumber_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                LoadFittings();
                txtStyleNumber.Text = dlBrandsForStyleNumber.SelectedValue +
                                          dlFabricsForStyleNumber.SelectedValue + dlGarmentForStyleNumber.SelectedValue + "-" +
                                          (long.Parse(CheckStyleSeriesNumber()) + 1).ToString("000");
                string Description = string.Concat(dlBrandsForStyleNumber.SelectedItem.Text, "-", dlGarmentForStyleNumber.SelectedItem.Text);
                txtStyleDescription.Text = Description;
                txtStyleDescriptionPreview.Text = txtStyleDescription.Text;
                txtStyleNumberPreview.Text = txtStyleNumber.Text;
                hfStyleNumber.Value = txtStyleNumber.Text.Replace("-", "");
                PreviewGenerate();
            }
            catch (Exception)
            {
                //throw;
            }
        }

        private string GetBrandStartSeries()
        {
            return BM.GetBrandByCode(dlBrandsForStyleNumber.SelectedValue).StartSeries;
        }

        private void ShowWarningMessage()
        {
            if (IsAllReadyGenerated() == true)
            {
                lblErrorSameStyleNumber.Text = "Warning: This Item Description is already in the Styles database!";
                txtStyleNumber.Attributes.Add("style", "Background-color:#FF3300;");
               // btnViewGeneratedItemCodeAndSKUs.Visible = true;
              //  pnlGenratedItemCodesAndSKUs.Visible = true;
               // ViewAllGeneratedItemCodeAndSKUs();
            }
            else
            {
                lblErrorSameStyleNumber.Text = "";
                txtStyleNumber.Attributes.Clear();
              //  btnViewGeneratedItemCodeAndSKUs.Visible = false;
               // pnlGenratedItemCodesAndSKUs.Visible = false;
            }
        }

        protected void dlFabricsForStyleNumber_SelectedIndexChanged(object sender, EventArgs e)
        {
            txtStyleNumber.Text = dlBrandsForStyleNumber.SelectedValue  +
                                  dlFabricsForStyleNumber.SelectedValue  + dlGarmentForStyleNumber.SelectedValue + "-" +
                                  (long.Parse(CheckStyleSeriesNumber()) + 1).ToString("000");
            string Description = string.Concat(dlBrandsForStyleNumber.SelectedItem.Text, "-", dlGarmentForStyleNumber.SelectedItem.Text);
            txtStyleDescription.Text = Description;
            txtStyleDescriptionPreview.Text = txtStyleDescription.Text;
            txtStyleNumberPreview.Text = txtStyleNumber.Text;
            hfStyleNumber.Value = txtStyleNumber.Text.Replace("-", "");
           
            PreviewGenerate();
        }

        protected void dlGarmentForStyleNumber_SelectedIndexChanged(object sender, EventArgs e)
        {
            txtStyleNumber.Text = dlBrandsForStyleNumber.SelectedValue  +
                                  dlFabricsForStyleNumber.SelectedValue  + dlGarmentForStyleNumber.SelectedValue + "-" +
                                  (long.Parse(CheckStyleSeriesNumber()) + 1).ToString("000");
            string Description = string.Concat(dlBrandsForStyleNumber.SelectedItem.Text, "-", dlGarmentForStyleNumber.SelectedItem.Text);
            txtStyleDescription.Text = Description;
            txtStyleDescriptionPreview.Text = txtStyleDescription.Text;
            txtStyleNumberPreview.Text = txtStyleNumber.Text;
            hfStyleNumber.Value = txtStyleNumber.Text.Replace("-", "");
         
            PreviewGenerate();
        }

        protected void btnGenerate_Click(object sender, EventArgs e)
        {
            SaveStyelNumber("Yes");
            GenerateItemCodeAndSKU();
            Redirector.Redirect("~/Marketing/ProductManagementPanel.aspx");

        }

        private void SaveStyelNumber(string Status)
        {
            try
            {
                decimal COST_PRICE = 0;
                decimal SRP = 0;
                if (!string.IsNullOrEmpty(txtSRP.Text))
                {
                    SRP = decimal.Parse(txtSRP.Text);
                }
                if (!string.IsNullOrEmpty(txtCostPrice.Text))
                {
                    COST_PRICE = decimal.Parse(txtCostPrice.Text);
                }

                
                var style = new ItemStyle
                {
                    StyleNumber = txtStyleNumber.Text,
                    Description = txtStyleDescription.Text,
                    IsApprove = Status,
                    Brand = dlBrandsForStyleNumber.SelectedValue,
                    CostPrice = COST_PRICE,
                    SRP = SRP,
                    AP_type = rdioTopOrBottom.SelectedValue,
                    Fabric = dlFabricsForStyleNumber.SelectedItem.Text,
                    IsActive = true,
                    IsGeneric = false,
                    Fitting = DDLFittings.SelectedItem.Text,
                    SubFitting = DDLSubFitting.SelectedValue
                };
                StyleManager.Save(style);
            }
            catch (Exception)
            {
                StringBuilder errorMsg = new StringBuilder();
                    errorMsg.Append("<br />Error during Insertion of new Style! <br /> Please check your data prerequisite!");
                    lblErrorMessage.Text =(errorMsg.ToString());
                    Label1_ModalPopupExtender.Show();
                    return;
            }
        }
        
        private void GenerateItemCodeAndSKU()
        {
            List<Color> Style_Colors = new List<Color>();
            List<Size> Style_Sizes = new List<Size>();
            string CodeSeries = "";
            CodeSeries = hfStartSeries.Value;
            string BrandStartSeries = GetBrandStartSeries();
            int count = 0;
            for (int i = 0; i < ColorchkBxs.Items.Count; i++)
            {
                if (ColorchkBxs.Items[i].Selected)
                {
                    ColorchkBxs.Items[i].Attributes.Add("style", "Font-weight:bold;");
                    Style_Colors.Add(new Color { ColorCode = ColorchkBxs.Items[i].Value, ColorDescription = txtStyleDescription.Text });
                    for (int j = 0; j < SizeschkBxs.Items.Count; j++)
                    {
                        if (SizeschkBxs.Items[j].Selected)
                        {
                            SKU sku = new SKU();
                            count++;
                            string sn = "";
                            sku.ItemCode = txtStyleNumber.Text + "-" + ColorchkBxs.Items[i].Value + "-" + SizeschkBxs.Items[j].Value;
                            if (CodeSeries == START_CODE)
                            {
                                sn = (long.Parse(((BrandStartSeries) + CodeSeries)) +
                                      Compute(SIZE_COUNT, COLOR_COUNT) + count).ToString();
                            }
                            else
                            {
                                sn = (long.Parse((CodeSeries)) +
                                      Compute(SIZE_COUNT, COLOR_COUNT) + count).ToString();
                            }
                            sku.SKUNumber = (long.Parse(sn)).ToString();
                            sku.ItemColor = ColorchkBxs.Items[i].Text;
                            sku.ItemSize = SizeschkBxs.Items[j].Value;
                            sku.ItemBrand = dlBrandsForStyleNumber.SelectedItem.Text;
                            sku.ItemAPTYPE = rdioTopOrBottom.SelectedValue;
                            list.Add(sku);
                        }
                    }
                    COLOR_COUNT = COLOR_COUNT + 1;
                }
            }
            for (int j = 0; j < SizeschkBxs.Items.Count; j++)
            {
                if (SizeschkBxs.Items[j].Selected)
                {
                    Style_Sizes.Add(new Size { SizeCode = SizeschkBxs.Items[j].Value });
                }
            }
            foreach (SKU sku in list)
            {
                decimal SRP = 0;
                if (txtSRP.Text != string.Empty)
                {
                    SRP = decimal.Parse(txtSRP.Text);
                }
                var Product = new Product{
                    Description = txtStyleDescription.Text,
                    StyleNumber = txtStyleNumber.Text,
                    ItemCode = sku.ItemCode,
                    SKUBarcode = sku.SKUNumber,
                    IsActive = "Yes",
                    DateCreated = DateTime.Now ,
                    Size = sku.ItemSize,
                    AP_TYPE = sku.ItemAPTYPE ,
                    Brand = sku.ItemBrand,
                    Color = sku.ItemColor,
                    SRP =SRP
                };
                PM.Save(Product);
            }
            StyleColorManager.Save(new ItemStyle { StyleNumber = txtStyleNumber.Text },Style_Colors);
            StyleSizeManager.Save(new ItemStyle { StyleNumber = txtStyleNumber.Text }, Style_Sizes);
        }

        private bool IsAllReadyGenerated()
        {
            bool result = false;
            foreach (ItemStyle style in StyleManager.Styles())
            {
                if (style.StyleNumber.Remove(style.StyleNumber.Length - 4, 4) == StyleSeries())
                {
                    result = true;
                    break;
                }
            }
            return result;
        }

        //private void ViewAllGeneratedItemCodeAndSKUs()
        //{
        //    gvGeneratedItemCodesAndSKUs.DataSource = PM.GetProductByDescription(this.txtStyleDescription.Text);
        //    gvGeneratedItemCodesAndSKUs.DataBind();
        //}

        /// <summary>
        /// Get Last Generix Style Barcode Series
        /// </summary>
        /// <param name="Brand">Brand Name</param>
        /// <returns>Barcode</returns>
        private long GenericStyleBarcode(string Brand)
        {
            string Barcode = "0";
            var genericStyleProduct = (from generic_prod in GenericStyleManger.GenericStyles()
                                       where generic_prod.Brand == Brand
                                       orderby generic_prod.BarCode descending
                                       select generic_prod).FirstOrDefault();
            if (genericStyleProduct != null)
            {
                Barcode = genericStyleProduct.BarCode;
            }
            return long.Parse(Barcode);
        }

        private long ProductSKU(string Brand)
        {
            string Barcode = "0";
            try
            {
                var products = (from prod in PM.GetAllOldProducts()
                                where prod.BrandName == Brand
                                orderby prod.SKU descending
                                select prod).FirstOrDefault();

                if (products != null)
                {
                    Barcode = (long.Parse(products.SKU)).ToString();
                }
            }
            catch (Exception)
            {
                // throw;
            }

            return long.Parse(Barcode);
        }
        private string GenerateBarCode(string Brand)
        {
            string BarCode = "";
            long ProductBarCode = ProductSKU(Brand);
            long GenericBarCode = GenericStyleBarcode(Brand);

                if (ProductBarCode != 0)
                {
                    if (ProductBarCode > GenericBarCode)
                    {
                        BarCode = (ProductBarCode).ToString();
                    }
                    else
                    {
                        BarCode = (GenericBarCode).ToString();
                    }
                }
                else
                {
                    BarCode = (GetBrandStartSeries() + START_CODE);
                }
            return BarCode;
        }

       
        protected void btnContinueForSKUGeneration_Click(object sender, EventArgs e)
        {
            StringBuilder errorMsg = new StringBuilder();
            lblErrorMessage.Text = string.Empty;
            if (string.IsNullOrEmpty(dlBrandsForStyleNumber.SelectedValue))
            {
                lblErrorMessage.Text = "<br />Invalid Brand Selection!";
                Label1_ModalPopupExtender.Show();
                return;
            }

            if (string.IsNullOrEmpty(dlFabricsForStyleNumber.SelectedValue))
            {
                lblErrorMessage.Text = "<br />Invalid Fabric Selection!";
                Label1_ModalPopupExtender.Show();
                return;
            }

            if (string.IsNullOrEmpty(dlGarmentForStyleNumber.SelectedValue))
            {
                lblErrorMessage.Text = "<br />Invalid Garment Selection!";
                Label1_ModalPopupExtender.Show();
                return;
            }

            if (string.IsNullOrEmpty(DDLFittings.SelectedValue))
            {
                lblErrorMessage.Text = "<br />Invalid Fitting Selection!";
                Label1_ModalPopupExtender.Show();
                return;
            }

            if (string.IsNullOrEmpty(DDLSubFitting.SelectedValue))
            {
                lblErrorMessage.Text = "<br />Invalid Fabric Selection!";
                Label1_ModalPopupExtender.Show();
                return;
            }

            if (string.IsNullOrEmpty(txtCostPrice.Text))
            {
                errorMsg.Append("<br />Invalid Cost Price!");
                lblErrorMessage.Text =(errorMsg.ToString());
                Label1_ModalPopupExtender.Show();
                return;
            }
            hfStartSeries.Value = GenerateBarCode(dlBrandsForStyleNumber.SelectedItem.Text);
            mvwItemManagement.ActiveViewIndex = 1;
        }

        protected void ibtnBack_Click(object sender, ImageClickEventArgs e)
        {
            mvwItemManagement.ActiveViewIndex = 0;
        }

        protected void lnkBack_Click(object sender, EventArgs e)
        {
            mvwItemManagement.ActiveViewIndex = 0;
        }

        protected void btnContinueSaveStyleAndExitGenerator_Click(object sender, EventArgs e)
        {
            StringBuilder errorMsg = new StringBuilder();
            lblErrorMessage.Text = string.Empty;
            if (string.IsNullOrEmpty(txtStyleNumber.Text) || string.IsNullOrEmpty(txtCostPrice.Text))
            {
                errorMsg.Append("<br />Invalid Style Number!");
                errorMsg.Append("<br />Invalid Cost Price!");

                lblErrorMessage.Text = (errorMsg.ToString());
                Label1_ModalPopupExtender.Show();
                return;
            }
            SaveStyelNumber("No");
            Redirector.Redirect("~/Marketing/ProductManagementPanel.aspx");
        }

        protected void rdioTopOrBottom_SelectedIndexChanged(object sender, EventArgs e)
        {
            LoadAllFabric(char.Parse(rdioTopOrBottom.SelectedValue));
            LoadAllGarments(char.Parse(rdioTopOrBottom.SelectedValue));
            LoadFittings();
        }

        private void LoadFittings()
        {
            LoadFittingsByCategory(rdioTopOrBottom.SelectedValue, dlBrandsForStyleNumber.SelectedItem.Text);
            LoadSubFittingByFittingCode(DDLFittings.SelectedValue);
        }

        protected void btnYes_Click(object sender, EventArgs e)
        {
            try
            {
                btnGenerate_Click(sender, e);
            }
            catch (Exception)
            {
                
               // throw;
            }
        }

        protected void chkSizeGroup_SelectedIndexChanged(object sender, EventArgs e)
        {
            var group = new List<int>();
           for (int i = 0; i < chkSizeGroup.Items.Count; i++)
           {
               if (chkSizeGroup.Items[i].Selected)
               {
                   group.Add(int.Parse(chkSizeGroup.Items[i].Value));
               }
           }
           SizeschkBxs.DataSource = SM.SizesByGroup(group);
           SizeschkBxs.DataValueField = "SizeCode";
           SizeschkBxs.DataTextField = "SizeDescription";
           SizeschkBxs.DataBind();
           rptrSKU.DataBind();
        }

        protected void DDLFittings_SelectedIndexChanged(object sender, EventArgs e)
        {
            LoadSubFittingByFittingCode(DDLFittings.SelectedValue);
        }

    }
  
    #region "Sku class"
    public class SKU
    {
        public string SKUNumber { get; set; }

        public string ItemCode { get; set; }

        public string ItemColor { get; set; }

        public string ItemSize { get; set; }

        public string ItemBrand { get; set; }
        public string ItemAPTYPE { get; set; }
    }
    #endregion
}