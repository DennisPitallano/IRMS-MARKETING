using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using IRMS.BusinessLogic.Manager;
using IRMS.ObjectModel;
using IRMS.Components;
using IntegratedResourceManagementSystem.Common;
using IRMS.Entities;

namespace IntegratedResourceManagementSystem.Marketing
{
    public partial class GenerateItemCode_SKUForm : System.Web.UI.Page
    {
        #region "Variable and Object Declarations"
        ColorManager CM = new ColorManager();
        SizeManager SM = new SizeManager();
        List<SKU> list = new List<SKU>();
        ProductManager PM = new ProductManager();
        StyleManager StyleManager = new StyleManager();
        int SIZE_COUNT = 0;
        int COLOR_COUNT = 0;
        string START_CODE = "0000000000";
        BrandManager BM = new BrandManager();
        StyleColorsManager StyleColorManager = new StyleColorsManager();
        StyleSizesManager StyleSizeManager = new StyleSizesManager();
        BrandGarmentsManager BGM = new BrandGarmentsManager();
        #endregion

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (Request.QueryString["StyleNumber"]== "")
                {
                    Redirector.Redirect("~/Marketing/ProductManagementPanel.aspx");
                }
                else
                {
                    ProductStyle ProdStyle = GetProductByStyleNumber((string)Request.QueryString["SytleNumber"]);
                    txtStyleNumber.Text = ProdStyle.StyleNumber;
                    txtStyleDescription.Text = ProdStyle.StyleDescription;
                    hfBrand.Value = ProdStyle.BrandName;
                    hfStartSeries.Value = CheckStartSeriesNumber();
                    hfBrandStartSeries.Value = GetBrandStartSeries();
                    txtCostPrice.Text = ProdStyle.Cost.ToString("###,###.00");
                }
                AllColors();
            }
            AddStyleInColorCheckboxes();
        }

        private ProductStyle GetProductByStyleNumber(string StyleNumber)
        {
            return StyleManager.GetStyleNumberByItemStyleFromOld(StyleNumber);
        }

        /// <summary>
        /// Load All Colors in CheckBox Collections.
        /// </summary>
        public void AllColors()
        {
            Populate.AllColors(ColorchkBxs);
        }

        /// <summary>
        /// Load All Sizes in CheckBox Collections.
        /// </summary>
        public void AllSizes()
        {
            Populate.AllSizes(SizeschkBxs);
        }

        private void AddStyleInColorCheckboxes()
        {
            Populate.AddColorInColorCollections(ColorchkBxs);
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
        /// Compute Total Item to be generate.
        /// </summary>
        /// <param name="size">total selected size.</param>
        /// <param name="color">total selected color.</param>
        /// <returns>total item to generate.</returns>
        private int Compute(int size, int color)
        {
            return size * color;
        }

        /// <summary>
        /// Preview Ggenerated ItemCode and SKU's.
        /// </summary>
        private void PreviewGenerate()
        {
            string CodeSeries = "";
            CodeSeries = hfStartSeries.Value;//CheckStartSeriesNumber();
            string BrandStartSeries = hfBrandStartSeries.Value; //GetBrandStartSeries();
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
                            //sku.ItemColor = ColorchkBxs.Items[i].Text;
                            //sku.ItemSize = SizeschkBxs.Items[j].Text;
                            //sku.ItemBrand = dlBrandsForStyleNumber.SelectedItem.Text;
                            //sku.ItemAPTYPE = rdioTopOrBottom.SelectedValue;
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

        /// <summary>
        /// Get Brand Start Series.
        /// </summary>
        /// <returns>Brand Start Series.</returns>
        private string GetBrandStartSeries()
        {
            return BM.GetBrandByBrandName(hfBrand.Value).StartSeries;
        }

        private bool IsNewStyle()
        {
            bool result = false;
            try
            {
                ItemStyle prodStyle = StyleManager.GetStyleNumberByItemStyle(txtStyleNumber.Text);
                if (prodStyle.RecordNo > 0)
                {
                    result = true;
                }
            }
            catch (Exception)
            {
                result = false;
               // throw;
            }
            return result;
        }

        /// <summary>
        /// Check and Return Start Item Series Number.
        /// </summary>
        /// <returns>Style Series number</returns>
        private string CheckStartSeriesNumber()
        {
            string CodeSeries = "";
            try
            {
                var products = (from prod in PM.GetAllOldProducts()
                                where prod.BrandName == hfBrand.Value
                                orderby prod.SKU descending
                                select prod).FirstOrDefault();
                //IRMSProduct p = products.FirstOrDefault();
                if (products.ProductNumber > 0)
                {
                    CodeSeries = (long.Parse(products.SKU)).ToString();
                }
                else
                {
                    CodeSeries = START_CODE;
                }
            }
            catch (Exception)
            {
                CodeSeries = START_CODE;
                // throw;
            }
            return CodeSeries;
        }

        protected void btnGenerate_Click(object sender, EventArgs e)
        {
            if (IsNewStyle() == true)
            {
                SaveStyelNumber(StyleManager.GetStyleNumberByItemStyle(txtStyleNumber.Text));
            }
            GenerateItemCodeAndSKU();
            Redirector.Redirect("~/Marketing/ProductManagementPanel.aspx");
        }

        /// <summary>
        /// Update Sytyle Number Status.
        /// </summary>
        /// <param name="style">Style</param>
        private void SaveStyelNumber(ItemStyle style)
        {
            style.IsApprove = "Yes";
            StyleManager.Save(style);
        }

        /// <summary>
        /// Generate and Save Item Codes and SKU's for Style Number.
        /// </summary>
        private void GenerateItemCodeAndSKU()
        {
            List<Color> Style_Colors = new List<Color>();
            List<Size> Style_Sizes = new List<Size>();
            string CodeSeries = "";
            CodeSeries = hfStartSeries.Value; //CheckStartSeriesNumber();
            string BrandStartSeries = hfBrandStartSeries.Value; //GetBrandStartSeries();
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
                            sku.ItemBrand = hfBrand.Value;
                            //sku.ItemAPTYPE = rdioTopOrBottom.SelectedValue;
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
                if(txtSRP.Text !=string.Empty)
                {
                    SRP=decimal.Parse(txtSRP.Text);
                }
                var Product = new Product
                {
                    Description = txtStyleDescription.Text,
                    StyleNumber = txtStyleNumber.Text,
                    ItemCode = sku.ItemCode,
                    SKUBarcode = sku.SKUNumber,
                    IsActive = "Yes",
                    DateCreated = DateTime.Now,
                    Size = sku.ItemSize,
                   // AP_TYPE = sku.ItemAPTYPE,
                    Brand = sku.ItemBrand,
                    Color = sku.ItemColor,
                     SRP= SRP
                };
                PM.Save(Product);
            }
            StyleColorManager.Save(new ItemStyle { StyleNumber = txtStyleNumber.Text }, Style_Colors);
            StyleSizeManager.Save(new ItemStyle { StyleNumber = txtStyleNumber.Text }, Style_Sizes);
        }

        protected void ibtnBack_Click(object sender, ImageClickEventArgs e)
        {
            Redirector.Redirect("~/Marketing/ProductManagementPanel.aspx");
        }

        protected void lnkBack_Click(object sender, EventArgs e)
        {
            Redirector.Redirect("~/Marketing/ProductManagementPanel.aspx");
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
        }

      
    }
}