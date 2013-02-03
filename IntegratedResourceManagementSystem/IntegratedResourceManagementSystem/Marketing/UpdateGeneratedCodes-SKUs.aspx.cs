using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using IRMS.Components;
using IRMS.BusinessLogic.Manager;
using IntegratedResourceManagementSystem.Common;
using IRMS.ObjectModel;
using IRMS.Entities;

namespace IntegratedResourceManagementSystem.Marketing
{
    public partial class UpdateGeneratedCodes_SKUs : System.Web.UI.Page
    {
        #region "Variable and Object Declarations"
        //int SIZE_COUNT = 0;
        //int COLOR_COUNT = 0;
        //string START_CODE = "0000000000";
        ColorManager CM = new ColorManager();
        SizeManager SM = new SizeManager();
        List<SKU> list = new List<SKU>();
        ProductManager PM = new ProductManager();
        StyleManager StyleManager = new StyleManager();
        BrandManager BM = new BrandManager();
        ItemStyle ITEM_STYLE = new ItemStyle();
        StyleColorsManager SCM = new StyleColorsManager();
        StyleSizesManager SSM = new StyleSizesManager();

        int SIZE_COUNT = 0;
        int COLOR_COUNT = 0;
        string START_CODE = "0000000000";
        StyleColorsManager StyleColorManager = new StyleColorsManager();
        StyleSizesManager StyleSizeManager = new StyleSizesManager();
        BrandGarmentsManager BGM = new BrandGarmentsManager();

        #endregion
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                if (Request.QueryString["SytleNumber"] != null)
                {
                    ProductStyle ProdStyle = GetProductByStyleNumber((string)Request.QueryString["SytleNumber"]);
                    txtStyleNumber.Text = ProdStyle.StyleNumber;
                    txtStyleDescription.Text = ProdStyle.StyleDescription;
                    hfBrand.Value = ProdStyle.BrandName;
                    hfSRP.Value = ProdStyle.Cost.ToString();
                    hfStartSeries.Value = CheckStartSeriesNumber();
                    hfBrandStartSeries.Value = GetBrandStartSeries();
                   // ITEM_STYLE = ProdStyle;
                    //txtStyleDescription.Text = PreviousPage.STYLE_.Description;
                    //ITEM_STYLE = PreviousPage.STYLE_;
                    //hfBrand.Value = PreviousPage.BRAND_.BrandDescription;
                }
                else
                {
                    Redirector.Redirect("~/Marketing/ProductManagementPanel.aspx");
                }
                LoadAllColors();
                GetAllProductsByStyleNumber(txtStyleNumber.Text);
            }
            AddStyleInColorCheckboxes();
        }

        private ProductStyle GetProductByStyleNumber(string StyleNumber)
        {
            return StyleManager.GetStyleNumberByItemStyleFromOld(StyleNumber);
        }

        private void LoadAllColors()
        {
            Populate.AllColors(ColorchkBxs);
        }
       
        private void AddStyleInColorCheckboxes()
        {
            Populate.AddColorInColorCollections(ColorchkBxs);
        }

        private void LoadAllSizes()
        {
            Populate.AllSizes(SizeschkBxs);
        }

        private void GetAllProductsByStyleNumber(string StyleNumber)
        {
            GetAllGeneratedProductSKUS(StyleNumber);

            PreviewGeneratedSKUs(txtStyleNumber.Text);
        }

        private void GetAllGeneratedProductSKUS(string StyleNumber)
        {
            var products = PM.GetAllProductsByStyleNumber(StyleNumber);
            var new_list = new List<IRMSProduct>();
            foreach (IRMSProduct product in products)
            {
                string[] item_code = product.ItemCode.Split('-');
                string new_description = "DESCRIPTION: " + product.StyleDescription + "\n";
                new_description += " COLOR: " + product.StyleColor + "\n";
                new_description += " SIZE: " + product.StyleSize+"\n";
                new_description += " SRP: " + product.Price.ToString("Php###,###.00");
                product.StyleDescription = new_description;
                new_list.Add(product);
            }
            rptrSKU.DataSource = new_list;
            rptrSKU.DataBind();
            gvGeneratedSKUS.DataSource = new_list.OrderByDescending(c => c.ProductNumber);
            gvGeneratedSKUS.DataBind();
        }

        private void PreviewGeneratedSKUs(string StyleNumber)
        {
            //var all_products = (from product in PM.GetAllProducts()
            //                   where product.StyleNumber == StyleNumber
            //                   select product).ToList<Product>();

            //foreach (Product product in all_products)
            //{
            //    string[] item_code = product.ItemCode.Split('-');
            //    string new_description = "DESCRIPTION: " + product.Description + "\n";
            //    new_description += " COLOR: " + CM.GetColorByCode(item_code[2]).ColorDescription + "\n";
            //    new_description += " SIZE: " + SM.GetSizeByCode(item_code[3]).SizeDescription;
            //    product.Description = new_description;
            //    //  new_list.Add(product);
            //}

            //gvGeneratedSKUS.DataSource = all_products.OrderByDescending(c => c.IsActive);
            //gvGeneratedSKUS.DataBind();
        }

        private void PreviewGenerate()
        {
            string CodeSeries = "";
            CodeSeries = hfStartSeries.Value;
            string BrandStartSeries =  hfBrandStartSeries.Value;
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
            if (CheckIfGeneratedIsExisted(list) == true)
            {
                lblErrorGenerated.Text = "WARNING: SOME GENERATED ITEM IS ALREADY CREATED!" +"\n" +"PLEASE REFER FROM ABOVE LIST!";
                pnlError.Visible = true;
                btnGenerate.Enabled = false;
                return;
            }
            else
            {
                lblErrorGenerated.Text = string.Empty;
                pnlError.Visible = false;
                btnGenerate.Enabled = true;
            }
            this.Repeater1.DataSource = list;
            Repeater1.DataBind();
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

        private string CheckStartSeriesNumber()
        {
            string CodeSeries = "";
            try
            {
                var products = (from prod in PM.GetAllOldProducts()
                                where prod.BrandName ==  hfBrand.Value
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
        //private string CheckStartSeriesNumber()
        //{
        //    string CodeSeries = "";
        //    try
        //    {
        //        var products = from prod in PM.GetAllProducts()
        //                       where prod.StyleNumber.Remove(prod.StyleNumber.Length - (prod.StyleNumber.Length - 1),
        //                                                     prod.StyleNumber.Length - 1) == StyleManager.GetStyleNumberByItemStyle(txtStyleNumber.Text).Brand
        //                       select prod;
        //        Product p = products.Last();
        //        if (p.RecordNo > 0)
        //        {
        //            CodeSeries = (long.Parse(p.SKUBarcode)).ToString();
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
                var styles = from style in StyleManager.Styles()
                             where style.StyleNumber.Remove(style.StyleNumber.Length - (style.StyleNumber.Length - 1),
                                                            style.StyleNumber.Length - 1) == StyleManager.GetStyleNumberByItemStyle(txtStyleNumber.Text).Brand
                             select style;
                ItemStyle style_ = styles.Last();
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
        private string GetBrandStartSeries()
        {
            return BM.GetBrandByBrandName(hfBrand.Value).StartSeries;
        }

        protected void ColorchkBxs_SelectedIndexChanged(object sender, EventArgs e)
        {
            PreviewGenerate();
        }

        protected void SizeschkBxs_SelectedIndexChanged(object sender, EventArgs e)
        {
            PreviewGenerate();
        }

        protected void rdioUpdateOption_SelectedIndexChanged(object sender, EventArgs e)
        {
            switch(rdioUpdateOption.SelectedIndex)
            {
                case 0:
                      txtSRP.Enabled = false;
                mvUpdateOption.SetActiveView(vGeneratedSkus);
                    break;
                case 1:
                    txtSRP.Enabled = true;
                mvUpdateOption.SetActiveView(vAddNewSkus);
                    break;
                case 2:
                    mvUpdateOption.SetActiveView(VUpdatePrice);
                    break;

            }
            
        }

        private bool CheckIfGeneratedIsExisted(List<SKU> skus)
        {
            bool result;
            var products = (from product in PM.GetAllOldProducts()
                           join sku in skus on product.ItemCode equals sku.ItemCode
                           where product.StyleNumber == txtStyleNumber.Text
                           select product).ToList<IRMSProduct>();

            if (products.Count > 0)
            {
                result = true;
            }
            else
            {
                result = false;
            }
            return result;
        }

        protected void gvGeneratedSKUS_SelectedIndexChanged(object sender, EventArgs e)
        {
            //if (gvGeneratedSKUS.SelectedRow.Cells[2].Text.Replace(" ","") =="Yes")
            //{
            //    btnDeActivate.Visible = true;
            //    btnActivateSku.Visible = false;
            //}
            //else
            //{
            //    btnDeActivate.Visible = false;
            //    btnActivateSku.Visible = true;
            //}
        }

        protected void btnActivateSku_Click(object sender, EventArgs e)
        {
            try
            {
                List<Product> product_list = new List<Product>();
                product_list.Add(PM.GetProductBySKUNumber(gvGeneratedSKUS.SelectedRow.Cells[1].Text));
                PM.SetProductStatusAsActive(product_list);
                PreviewGeneratedSKUs(txtStyleNumber.Text);
                gvGeneratedSKUS_SelectedIndexChanged(sender, e);
                GetAllGeneratedProductSKUS(txtStyleNumber.Text);
            }
            catch (Exception)
            {
                
              //  throw;
            }
        }

        protected void btnDeActivate_Click(object sender, EventArgs e)
        {
            try
            {
                IRMSProduct product = new  IRMSProduct();
                Image IMGProduct = (Image)gvGeneratedSKUS.SelectedRow.FindControl("imgProduct");
                //product_list.Add(PM.GetProductBySKUNumber(gvGeneratedSKUS.SelectedRow.Cells[1].Text));
                //PM.UpdateProductStatus(product_list);
                product.ProductNumber = int.Parse(IMGProduct.AlternateText);
                PM.DeleteProduct(product);
              //  PreviewGeneratedSKUs(txtStyleNumber.Text);
                GetAllGeneratedProductSKUS(txtStyleNumber.Text);
               
            }
            catch (Exception)
            {
                //throw;
            }
        }

        protected void btnCancelSelectedSKUs_Click(object sender, EventArgs e)
        {
            List<IRMSProduct> product_list = GetSelectedProductToCancel();
            gvSelectedSKUToCancel.DataSource = product_list;
            gvSelectedSKUToCancel.DataBind();
            lblSelectedSkuToCancel_ModalPopupExtender.Show();
        }

        private List<IRMSProduct> GetSelectedProductToCancel()
        {
            List<IRMSProduct> product_list = new List<IRMSProduct>();
            foreach (RepeaterItem item in rptrSKU.Items)
            {
                CheckBox chkbox = (CheckBox)item.FindControl("chkSKUNumber");
                Image SKUImage = (Image)(item.FindControl("imgBarcode"));
                Label lblItemCode = (Label)item.FindControl("lblStyleNumber");
                if (chkbox.Checked == true)
                {
                    IRMSProduct product = new IRMSProduct();
                    product.ProductNumber = int.Parse(SKUImage.AlternateText.Split('-').ElementAt(0));
                    product.Price = decimal.Parse(SKUImage.AlternateText.Split('-').ElementAt(1));
                    product.SKU = chkbox.Text;
                    product.ItemCode = lblItemCode.Text; 
                    product_list.Add(product);
                  //  product_list.Add(PM.GetProductBySKUNumber(chkbox.Text));
                }
            }
            return product_list;
        }

        protected void btnContinueSKUCancelation_Click(object sender, EventArgs e)
        {
            try
            {
                List<IRMSProduct> product_list = GetSelectedProductToCancel();
               // PM.UpdateProductStatus(product_list);
                try
                {
                    PM.DeleteProducts(product_list);
                    GetAllGeneratedProductSKUS(txtStyleNumber.Text);
                    PreviewGeneratedSKUs(txtStyleNumber.Text);
                }
                catch (Exception)
                {
                    throw;
                }
            }
            catch (Exception)
            {
                //throw;
            }
        }

        protected void btnGenerate_Click(object sender, EventArgs e)
        {
            //if (txtSRP.Text == string.Empty)
            //{
            //    pnlError.Visible = true;
            //    lblErrorGenerated.Text = "Please Input Suggested Retail Price!!!";
            //    return;
            //}
            //else
            //{
            //    pnlError.Visible = false;
            //}
           
            GenerateItemCodeAndSKU();
            GetAllProductsByStyleNumber(txtStyleNumber.Text);
            this.ColorchkBxs.SelectedIndex = -1;
            this.SizeschkBxs.SelectedIndex = -1;
            this.Repeater1.DataBind();
        }

        private void GenerateItemCodeAndSKU()
        {
            string AP_TYPE = GetAP_TYPE();
            List<Color> Style_Colors = new List<Color>();
            List<Size> Style_Sizes = new List<Size>();
            string CodeSeries = "";
            CodeSeries = hfStartSeries.Value;  // CheckStartSeriesNumber();
            string BrandStartSeries = hfBrandStartSeries.Value; // GetBrandStartSeries();
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
                            sku.ItemAPTYPE = AP_TYPE;
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
                    SRP= decimal.Parse(txtSRP.Text);
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
                    Brand = sku.ItemBrand,
                    Color = sku.ItemColor,
                    AP_TYPE = sku.ItemAPTYPE,
                     SRP =  SRP
                };
                PM.Save(Product);
            }

            var style_color_to_insert = new List<Color>();
            var style_sizes_to_insert = new List<Size>();
            foreach (Color s_color in Style_Colors)
            {
                if (CheckIfColorAlreadyExist(s_color)==false)
                {
                    style_color_to_insert.Add(s_color);
                }
            }

            foreach (Size s_size in Style_Sizes)
            {
                if (CheckIfSizeAlreadyExist(s_size) == false)
                {
                    style_sizes_to_insert.Add(s_size);
                }
            }
            
            StyleColorManager.Save(new ItemStyle { StyleNumber = txtStyleNumber.Text }, style_color_to_insert);
            StyleSizeManager.Save(new ItemStyle { StyleNumber = txtStyleNumber.Text }, style_sizes_to_insert);
        }

        private bool CheckIfColorAlreadyExist(Color color)
        {
            bool result;
            var colors_list = (from color_ in StyleColorManager.StyleColors()
                              where color_.ColorCode == color.ColorCode
                              select color_).ToList<StyleColor>();
            StyleColor s_color = new StyleColor();
            foreach (StyleColor _scolor in colors_list)
            {
                s_color = _scolor;
            }
            if (s_color.RecordNo > 0) 
            {
                result = true;
            }
            else
            {
                result = false;
            }
            return result;
        }

        private bool CheckIfSizeAlreadyExist(Size size)
        {
            bool result;
            var sizes_list = (from size_ in StyleSizeManager.StyleSizes()
                                    where size_.SizeCode == size.SizeCode
                                    select size_).ToList<StyleSize>();
            StyleSize s_size = new StyleSize();
            foreach (StyleSize size_s in sizes_list)
            {
                s_size = size_s;
            }
            if (s_size.RecordNo > 0)
            {
                result = true;
            }
            else
            {
                result = false;
            }
            return result;
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
        private string GetAP_TYPE()
        {
            string ap_type = string.Empty;
            try
            {
                var result = (from product in PM.AllProduct()
                              where product.StyleNumber == txtStyleNumber.Text
                              select product).FirstOrDefault();
                ap_type = result.AP_TYPE;
            }
            catch (Exception)
            {
                
               // throw;
            }
            return ap_type;
        }

    }
}